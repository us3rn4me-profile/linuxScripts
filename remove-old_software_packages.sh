#!/usr/bin/env bash

dpkg -l | awk '/^rc/ {print $2}' || xargs sudo dpkg --purge 


