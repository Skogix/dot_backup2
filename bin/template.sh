#!/usr/bin/env sh

sudo pacman -S docker 
sudo systemctl start docker.service
sudo systemctl status docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
docker run hello-world
