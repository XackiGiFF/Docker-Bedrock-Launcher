@echo off
TITLE PocketMine-MP server on Docker software for Minecraft: Bedrock Edition
docker run -it --rm --name mcpe-php --privileged -p 19132:19132/udp -p 19132:19132 -p 19133:19133/udp -p 19133:19133 -v D:\ForWork\DevOps\MPE\Docker\server:/home/mcpe/server xackigiff/mcpe-php:lite ./server/start.sh -l