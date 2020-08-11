#!/bin/bash

# This script should be run on your local machine, not on the server

scp ~/.ssh/id_rsa_seppe.dev root@seppe.dev:.ssh/id_rsa
scp ~/.ssh/id_rsa_seppe.dev.pub root@seppe.dev:.ssh/id_rsa.pub
