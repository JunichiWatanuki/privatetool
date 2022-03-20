#!/bin/bash


strTargetHostIpv4="
          192.168.10.102
          192.168.10.103
          "

listTargetHostIpv4=(${strTargetHostIpv4// / })

for element in ${listTargetHostIpv4[@]}; do
    echo "${element}"
    expect add-pubkey-hosts.expect ${element}
done
