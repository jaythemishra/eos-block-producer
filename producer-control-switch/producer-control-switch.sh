#!/bin/sh

sleep 1.5

while true
do
	producerNodeIsPaused=$(timeout 0.5 curl -s http://1.1.1.5:8888/v1/producer/paused)
	exitCode=$?
	failoverNodeIsPaused=$(timeout 0.5 curl -s http://1.1.1.2:8888/v1/producer/paused)
	if [ "$producerNodeIsPaused" == "true" -a "$failoverNodeIsPaused" == "true" ]; then
		curl -f http://1.1.1.2:8888/v1/producer/resume
	elif [ "$exitCode" != "0" -a "$failoverNodeIsPaused" == "true" ]; then
		curl -f http://1.1.1.2:8888/v1/producer/resume
	fi
	sleep 0.5
done
