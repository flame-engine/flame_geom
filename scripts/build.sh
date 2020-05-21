#!/bin/bash -e

flutter analyze
flutter format .
flutter test
