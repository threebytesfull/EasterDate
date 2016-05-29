#!/usr/bin/env bash

export TOOLCHAINS=swift
swift build --clean && swift build && swift test
