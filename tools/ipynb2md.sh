#!/bin/bash

if [ -z $1 ]
then
    echo "First argument must be ipynb file"
    echo "Argument supplied was an empty string"
    exit
fi

jupyter nbconvert --to markdown $1
