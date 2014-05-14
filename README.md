# Dockerfile for [eirikb/weecloud](https://github.com/eirikb/weecloud)
* This dockerfile installs ssh, nodejs, supervisord, and weecloud
* It then starts ssh and weecloud under supervisord

## Usage
```
git clone https://github.com/JimShoe/weecloud-docker.git
cd weecloud-docker
docker build -t jimshoe/weecloud .
docker run -d -p 80:3000 jimshoe/weecloud
```
