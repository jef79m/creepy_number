#!/bin/bash
for i in $(seq 0 9); do pico2wave -l en-GB -w $i.wav "$i"; done
for i in $(seq 0 9); do aplay $i.wav ; done