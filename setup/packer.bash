#!/bin/bash

ghq look shiguredo/packer-templates
cd ubuntu-14.04/
packer build -only=virtualbox-iso template.json
vagrant box add ubuntu-14.04 ubuntu-14-04-x64-virtualbox.box
