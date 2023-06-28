#!/bin/bash
docker run -it --rm --runtime nvidia --network host -v $PWD:/app  apulache/generative-xavier-tf211:v0.1