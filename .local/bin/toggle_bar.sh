#!/bin/bash

toggled=$(eww windows | grep -E "\*bar_window" | cut -c 2-)

if [ "$toggled" = "bar_window" ]; then
  eww close bar_window
else
  eww open bar_window
fi
