#!/bin/sh

find . -type f -name "*.png" -exec zopflipng -y {} {} \; 
