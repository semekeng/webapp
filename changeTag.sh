#!/bin/bash
sed "s/tagVersion/$1/g" pods.yml > web-app-pod.yml
