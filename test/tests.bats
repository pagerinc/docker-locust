#!/usr/bin/env bats

@test "it installs locust in PATH" {
  command -v locust
}

@test "it sets a default workdir" {
  pwd | grep /etc/locust
}
