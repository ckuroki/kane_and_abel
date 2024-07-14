#!/usr/bin/bash
nohup pico8 -o state.out -run snake.p8 &
python kane_agent.py
