#!/usr/bin/bash
rm nohup.out state.out
killall pico8
nohup pico8 -o state.out -run snake.p8 &
python abel_agent.py | tee abel.log
