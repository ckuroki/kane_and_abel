import time
from pynput.keyboard import Key, Controller
import behavior_tree

# globals
keyboard = Controller()
chunk_size = 512
state = dict()

# conditions
def incomplete_state():
    if not('xfruit' in state) or not('xhead' in state):
        return True
    return False

def fruit_right():
    if state['xfruit'] > state['xhead']:
        return True
    return False

def fruit_left():
    if state['xfruit'] < state['xhead']:
        return True
    return False

def fruit_up():
    if state['yfruit'] < state['yhead']:
        return True
    return False

def fruit_down():
    if state['yfruit'] > state['yhead']:
        return True
    return False

def fruit_x_equal():
    if state['xfruit'] == state['xhead']:
        return True
    return False

def fruit_y_equal():
    if state['yfruit'] == state['yhead']:
        return True
    return False

# actions
def move_right():
    keyboard.press(Key.right)
    keyboard.release(Key.right)
    return True

def move_left():
    keyboard.press(Key.left)
    keyboard.release(Key.left)
    return True

def move_up():
    keyboard.press(Key.up)
    keyboard.release(Key.up)
    return True

def move_down():
    keyboard.press(Key.down)
    keyboard.release(Key.down)
    return True

def not_move():
    return True

# Building the Behavior Tree
def build_behavior_tree():
    # Leaf nodes
    condition_incomplete_state = behavior_tree.ConditionNode(incomplete_state)
    condition_fruit_right = behavior_tree.ConditionNode(fruit_right)
    condition_fruit_left = behavior_tree.ConditionNode(fruit_left)
    condition_fruit_up= behavior_tree.ConditionNode(fruit_up)
    condition_fruit_down = behavior_tree.ConditionNode(fruit_down)

    action_right = behavior_tree.ActionNode(move_right)
    action_left = behavior_tree.ActionNode(move_left)
    action_up = behavior_tree.ActionNode(move_up)
    action_down = behavior_tree.ActionNode(move_down)
    action_not_move= behavior_tree.ActionNode(not_move)

    # Subtrees
    right_sequence = behavior_tree.Sequence([condition_fruit_right, action_right])
    left_sequence = behavior_tree.Sequence([condition_fruit_left, action_left])
    up_sequence = behavior_tree.Sequence([condition_fruit_up, action_up])
    down_sequence = behavior_tree.Sequence([condition_fruit_down, action_down])
    incomplete_sequence = behavior_tree.Sequence([condition_incomplete_state, action_not_move])

    root_selector = behavior_tree.Selector([incomplete_sequence,right_sequence,left_sequence,up_sequence, down_sequence])

    return root_selector

def get_game_state(file): 
    d = dict(); 
    current_position = file.tell()
    data = file.read(chunk_size)
    if data:
        # process the data
        st = data[-5:]
        d['xhead'] = st[0] 
        d['yhead'] = st[1]
        d['xfruit'] = st[2]
        d['yfruit'] = st[3]
        return d
    else:
        return state

# Agent initialization

# Build the tree
behavior_tree = build_behavior_tree()

# Sleep for 5 seconds before start
time.sleep(5) 
print('Start!')
# Start the game by pressing x
keyboard.press('x')
time.sleep(0.2)
keyboard.release('x')

# Open state file used to read game state
fstate = open('state.out', 'rb')

while True: 
    # run the tree
    behavior_tree.run()
    # read state    
    state = get_game_state(fstate)

