#!/bin/bash

cd config; git co .; git clean -f -x -d; ./gen_certs.sh; git co .; cd ..
cd alice; vagrant destroy; git clean -f -x -d; vagrant up; cd ..
cd bob; vagrant destroy; git clean -f -x -d; vagrant up; cd ..
cd carole; vagrant destroy; git clean -f -x -d; vagrant up; cd ..
