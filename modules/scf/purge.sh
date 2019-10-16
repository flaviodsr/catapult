#!/usr/bin/env bash

. ../../include/common.sh
. .envrc

debug_mode

info "Purging all apps, buildpacks and services from the CF instance"

# Delete leftover apps
for app in $(cf apps | awk '{print $1}'); do cf delete -f $app; done

# Delete all buildpacks (in case there are leftovers)
for buildpack in $(cf buildpacks | tail -n +4 | awk '{print $1}'); do cf delete-buildpack -f $buildpack; done

# Delete all services 
for service in $(cf services | tail -n +4 | awk '{print $1}'); do cf delete-service -f $service; done

ok "Purge completed"