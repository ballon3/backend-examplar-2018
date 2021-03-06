#! /bin/bash
usage() { echo "Usage: $0 [-l] for a development build, [-s] for a staging build, or [-t] for a travis build " 1>&2; exit 1; }

while getopts ":lst" opt; do
    case "$opt" in
        l)
          docker-compose -f development-docker-compose.yml up
          ;;
        s)
          docker-compose -f staging-docker-compose.yml up
          ;;
        t)
          docker-compose -f travis-docker-compose.yml up
          ;;
        *)
          usage
          ;;
    esac
done
