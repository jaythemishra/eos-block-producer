#!/bin/sh

sleep 1.5

while true
do
	producerNodeIsPaused=$(curl http://1.1.1.5:8888/v1/producer/paused)
	failoverNodeIsPaused=$(curl http://1.1.1.2:8888/v1/producer/paused)
	if [ "$producerNodeIsPaused" == "true" -a "$failoverNodeIsPaused" == "true" ]; then
		resumeFailoverNode=$(curl http://1.1.1.2:8888/v1/producer/resume)
	fi
	sleep 0.5
done
