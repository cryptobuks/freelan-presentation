#!/bin/bash

cd config; git checkout .; git clean -f -x -d; ./gen_certs.sh; git checkout .; cd ..
cd alice; vagrant destroy; git clean -f -x -d; vagrant up; cd ..
cd bob; vagrant destroy; git clean -f -x -d; vagrant up; cd ..
cd carole; vagrant destroy; git clean -f -x -d; vagrant up; cd ..
