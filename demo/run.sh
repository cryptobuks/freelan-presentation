#!/bin/bash

cd config; ./gen_certs.sh; cd ..
cd alice; vagrant up; cd ..
cd bob; vagrant up; cd ..
cd carole; vagrant up; cd ..
