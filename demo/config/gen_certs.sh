#!/bin/bash

# Remove old files
echo "Removing old files..."

rm -f *.key *.csr *.crt

# Generate private keys
echo "Generating private keys..."

openssl genrsa -out ca.key 2048
openssl genrsa -out alice.key 2048
openssl genrsa -out bob.key 2048
openssl genrsa -out chris.key 2048

# Generate CA certificate
echo "Generating CA certificate..."

openssl req -new -x509 -key ca.key -days 365 -extensions v3_ca -subj "/C=FR/ST=Alsace/CN=ca.freelan.org" -out ca.crt -config ca/ca.cnf

# Generate CSRs
echo "Generating certificate requests..."

openssl req -new -key alice.key -subj "/C=FR/ST=Alsace/CN=alice.freelan.org" -out alice.csr
openssl req -new -key bob.key -subj "/C=FR/ST=Alsace/CN=bob.freelan.org" -out bob.csr
openssl req -new -key chris.key -subj "/C=FR/ST=Alsace/CN=chris.freelan.org" -out chris.csr

# Sign CSRs
echo "Signing certificate requests..."

openssl ca -in alice.csr -out alice.crt -config ca/ca.cnf
openssl ca -in bob.csr -out bob.crt -config ca/ca.cnf
openssl ca -in chris.csr -out chris.crt -config ca/ca.cnf
