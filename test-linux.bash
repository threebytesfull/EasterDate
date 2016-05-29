#!/usr/bin/env bash

docker run --rm -ti -v "$(pwd)":/code --name swift swiftdocker/swift bash -c 'cd /code && swift build --clean && swift build && swift test'
