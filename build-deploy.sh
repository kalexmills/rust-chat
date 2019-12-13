#!/usr/bin/env bash

docker build -t gcr.io/s5s-big-hot-k8s/slack:alex_manual .
docker push gcr.io/s5s-big-hot-k8s/slack:alex_manual

kubectl apply -f k8s.yaml --force