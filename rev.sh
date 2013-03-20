#!/bin/bash
REV=`git rev-parse --short HEAD`
DATE=`date "+%Y%m%d%H%M"`
echo "$DATE""_""$REV"