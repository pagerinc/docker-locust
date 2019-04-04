#!/usr/bin/env bats

@test "it installs locust in PATH" {
  command -v locust
}

@test "it installs locust" {
  locust --version | grep 0.11.0
}

@test "it sets a default workdir" {
  pwd | grep /etc/locust
}
