#!/bin/bash

swift build -c release
cp -f .build/release/accs /usr/local/bin/.
