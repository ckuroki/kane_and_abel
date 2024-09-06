# Kane and Abel: AIs that plays games

This project consist of a game playing AIs using pico-8 fantasy console.

## The AI game players are :

* Kane: Behavior tree based player

* Abel: Deep reinforcement learning AI player (DQN)

PICO-8 is a software console for making, sharing and playing games.
It includes a complete development environment.
All games include the source code and can be downloaded over the internet.

The idea is to modify the games to emit the observations and rewards as required by the agents ( DQN and Behavior tree based ).
Actions will be sent from the agents to the game by using a keyboard controller simulation library.

Abel, the DQN agent is in charge of build and maintain previous states in memory, because PICO-8 resources are limited and there is not available memory to hold that into the game itself.

Kane, will also receive observations and rewards from the game and control the game based on his rules logic.

## Game

- [Snake II](https://www.lexaloffle.com/bbs/?tid=51123) by Liconaj


