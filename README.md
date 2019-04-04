# Locust

Locust is a distributed user load testing tool intended for figuring out how many concurrent users a system can handle.

## Overview

The idea is that during a test, a swarm of locusts will attack your website. The behavior of each locust (or test user if you will) is defined by you and the swarming process is monitored from a web UI in real-time. This will help you battle test and identify bottlenecks in your code before letting real users in.

Locust is completely event-based, and therefore it's possible to support thousands of concurrent users on a single machine. In contrast to many other event-based apps it doesn't use callbacks. Instead it uses light-weight processes, through gevent. Each locust swarming your site is actually running inside its own process (or greenlet, to be correct). This allows you to write very expressive scenarios in Python without complicating your code with callbacks.

More info and documentation can be found at: http://docs.locust.io

## Running this image

```
docker build -t pagerinc/locust:test --rm .
docker run --rm -it -p 8089:8089 -v $PWD/tasks:/etc/locust/tasks:ro pagerinc/locust:test locust --master -f /etc/locust/tasks/my_task.py
```

A Helm chart is available under `charts/locust` for easy instalation on
Kubernetes:

```helm install --debug charts/locust```
