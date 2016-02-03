#!/usr/bin/env bash

asg_create() {
	aws asg create-auto-scaling-group
}

asg_test() {
	source "${ROOT}/test_helper.sh"

	stub aws
	asg_create < "${ROOT}/fixtures/asg.json"

	assert_raises "stub_called aws"
	assert_end "asg_create"
}
