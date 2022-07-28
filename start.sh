#!/bin/bash

sudo podman run --name=jboss-test-container -d -p 10.242.99.39:8080:8080 -p 10.242.99.39:9990:9990 -p 10.242.99.39:9999:9999 localhost/jbos-test
