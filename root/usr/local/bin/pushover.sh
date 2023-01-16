#!/bin/bash

# shellcheck disable=SC2220,SC2086

## All options are required
while getopts T:U:t:M: option
do
  case "${option}" in
    T) TOKEN=${OPTARG};;
    U) USER=${OPTARG};;
    t) TITLE=${OPTARG};;
    M) MSG=${OPTARG};;
  esac
done

## Testing parameters
if [[ -z ${TOKEN} ]] || [[ -z ${USER} ]] || [[ -z ${TITLE} ]] || [[ -z ${MSG} ]]
then
  echo "Not all parameters provided"
  exit 1
fi

## Sending message
Output=$(curl -s \
  --form-string "token=${TOKEN}" \
  --form-string "user=${USER}" \
  --form-string "title=${TITLE}" \
  --form-string "message=${MSG}" \
  https://api.pushover.net/1/messages.json)

OutputStatus=$(echo ${Output} | tr ',' "\n" | grep status | cut -d ":" -f2)

case "${OutputStatus}" in
  0)
    echo "Error: message not sent!.
    Output: ${Output}"
    exit 1
  ;;

  1)
    echo "Message sent"
    exit 0
  ;;

  *)
    echo "Status unknown..."
    exit 1
  ;;
esac
