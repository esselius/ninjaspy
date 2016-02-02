#!/usr/bin/env bash

asg_test() {
	source "${ROOT}/assert.sh"

	assert_raises "true"
	assert_end "asg"
}
