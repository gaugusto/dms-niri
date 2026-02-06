#!/usr/bin/env bash

cliphist list | walker -d -H | cliphist decode | wl-copy
