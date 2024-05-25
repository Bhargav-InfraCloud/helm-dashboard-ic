#!/usr/bin/env bash

docker rm helm-dashboard
docker build --file=dev.Dockerfile -t helm-dashboard .
docker create --name helm-dashboard helm-dashboard
docker cp helm-dashboard:/app/bin/dashboard ./bin/dashboard
./bin/dashboard
