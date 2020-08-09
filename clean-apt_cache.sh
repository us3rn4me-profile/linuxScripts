#!/usr/bin/env bash

sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove

sudo rm /var/cache/apt/*.bin
