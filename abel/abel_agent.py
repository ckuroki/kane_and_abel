import time
import torch #pytorch
import random
import sys
import numpy as np #numpy
from pynput.keyboard import Key, Controller
from collections import deque 
from model import QNet, QTrain

# globals
keyboard = Controller()
chunk_size = 512

class Abel: 

    # init
    def __init__(self):
        self.games_count = 0
        self.mem_list = deque(maxlen=100000)  # creates an in-memory list
        self.model = QNet(12, 256, 4) #input size, hidden size, output size
        self.randomness = 0 
        self.trainer = QTrain(self.model, lr=0.001, gamma=0.9)

    # store in-memory
    def store(self, state, action, reward, next_state, done):
        self.mem_list.append((state, action, reward, next_state, done))

    def replay_buffer(self):
        if len(self.mem_list) > 1000:   # 1000 is the batch size
            batch_sample = random.sample(self.mem_list, 1000)  # list of tuples
        else:
            batch_sample = self.mem_list

        states, actions, rewards, next_states, dones = zip(*batch_sample)
        self.trainer.train_step(np.array(states), actions, rewards, np.array(next_states), dones)

    def recent_exp(self, state, action, reward, next_state, done):
        self.trainer.train_step(state, action, reward, next_state, done)

    # get next action
    def get_next_action(self, state):
        self.randomness = 80 - self.games_count
        next_move = [0, 0, 0, 0]
        if random.randint(0, 200) < self.randomness:
            move = random.randint(0, 3)
            next_move[move] = 1
        else:
            state0 = torch.tensor(state, dtype=torch.float)
            prediction = self.model(state0)
            move = torch.argmax(prediction).item()
            next_move[move] = 1

        return next_move


def get_game_state(file): 
    current_position = file.tell()
    while True: 
        data = file.read(chunk_size)
        if data and len(data) > 15:
            # process the data
            st = data[-16:]
            # directions 
            dirx = st[0] 
            diry = st[1]
            # head position
            headx = st[2]
            heady = st[3]
            # snake body around head
            body_right = st[4] 
            body_left = st[5]
            body_up = st[6]
            body_down = st[7]
            # fruit position
            fruitx = st[8]
            fruity = st[9]
            gameover = st[10]
            # d['eat'] = st[11]
            score = st[12]

            # determine current direction 
            dir_right = (dirx == 1)
            dir_left = (dirx == 255)
            dir_up = (diry == 255)
            dir_down = (diry == 1)

            # fruit relative position
            fruit_left = fruitx < headx
            fruit_right = fruitx > headx
            fruit_up = fruity < heady
            fruit_down = fruity > heady

            # output array
            stt = [body_up,body_down,body_right,body_left, 
            dir_up,dir_down,dir_right,dir_left,
            fruit_up,fruit_down,fruit_right,fruit_left]
            return np.array(stt,dtype=int),gameover,score

def game_start(): 
    time.sleep(5) 
    print('Start!')
    game_restart()

def game_restart(): 
    # Start the game by pressing x
    keyboard.press('x')
    time.sleep(0.2)
    keyboard.release('x')
    time.sleep(2) 

def game_play_move(move): 
    key = Key.space
    if np.array_equal(move, [1 ,0, 0, 0]): # move up
        key = Key.up
    if np.array_equal(move, [0 ,1, 0, 0]): # move down
        key = Key.down
    if np.array_equal(move, [0 ,0, 1, 0]): # move right
        key = Key.right
    if np.array_equal(move, [0 ,0, 0, 1]): # move left
        key = Key.left
    if key != Key.space:
        keyboard.press(key)
        time.sleep(0.05)
        keyboard.release(key)

# launch the agent
def start():
    prev_score = 0
    record = 0
    agent = Abel()
    # start game
    game_start()
    # open state file used to read game state
    fstate = open('state.out', 'rb')

    while True:
        prev_state, gameover, score = get_game_state(fstate)

        next_move = agent.get_next_action(prev_state)
        game_play_move(next_move)

        state_new, gameover, score = get_game_state(fstate)
        reward = 0
        if score > prev_score:
             reward = 10
             prev_score = score
        if gameover == 1:
             reward = -10
        done = (gameover == 1)
        agent.recent_exp(prev_state, next_move, reward, state_new, done)
        agent.store(prev_state, next_move, reward, state_new, done)

        if done:
            prev_score = 0
            agent.games_count += 1
            agent.replay_buffer()
            if score > record:
                record = score
                agent.model.save()
            print('game#', agent.games_count, 'score', score, 'record:', record)
            sys.stdout.flush()
            game_restart()

if __name__ == '__main__':
    start()

