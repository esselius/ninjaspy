# Notes

Pipe a ASG.json into script.sh like so: `cat asg.json | ninjaspy create asg`
will be able to create a aws asg

`src/lib` contains modules
`src/lib.sh` sources `src/lib/*.sh`
`src/entrypoint.sh` sources `lib.sh`
`src/entrypoint.sh` handle CLI and command routing

modules must implement all actions and at minimum return true

Actions:
- test
- create
- destroy
- show

- `cat elb.json | ninjaspy create elb`
- `ninjaspy test` or `ninjaspy test asg` will run all tests or module-tests
