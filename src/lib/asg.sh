#!/usr/bin/env bash

asg_test() {
	source "${root}/assert.sh"

	assert_raises "true"
	assert_end "asg"
}
