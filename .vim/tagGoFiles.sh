#!/bin/bash

gotags -R . > tags
find . -name "*.go" > cscope.files
cscope -b
