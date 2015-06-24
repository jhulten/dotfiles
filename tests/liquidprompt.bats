#!/usr/bin/env bats

load test_helper

@test "Liquidprompt is installed" {
  assert_contains ~/.fresh/build/shell.sh "_lp_set_prompt()"
}

@test "Liquidprompt config in place" {
  assert_exists ~/.liquidpromptrc
}
