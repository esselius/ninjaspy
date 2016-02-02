#!/usr/bin/env bash

source "${root}/assert.sh"

asg_test() {
	assert_raises "true"
	assert_end "asg"
}
