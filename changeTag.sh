#!/bin/bash
sed "s/tagVersion/$1/g" pods.yaml > web-app-pod.yaml
