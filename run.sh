#!/bin/bash

cd /opt/canal/adapter

bin/startup.sh 
tail -F logs/adapter/adapter.log
