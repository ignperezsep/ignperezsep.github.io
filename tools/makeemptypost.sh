#!/bin/bash

function usage(){
    echo "Usage for $0"
    echo "$0 NameOfNewEmptyPost"
    echo "Generates empty markdown in _drafts folder"
}

function emptypost(){
    prefixdate="$(date +%Y-%m-%d-)"
    postname="$1"
    suffix=".md"
    filename="$prefixdate$postname$suffix"
    echo "---" >> "$filename"
    echo "layout: post" >> "$filename"
    echo "title: $postname" >> "$filename"
    echo "date: $(date +%F\ %T\ %z)" >> "$filename"
    echo "categories: jekyll update $postname" >> "$filename"
    echo "---" >> "$filename"
    echo >> "$filename" 
    echo "Empty body of the post $postname" >> "$filename"
}

if [ -z $1 ];
then
    echo "First argument must be post name"
    usage
    exit
fi

echo "making blank post $1"
pushd ../_drafts
emptypost "$1"
popd
