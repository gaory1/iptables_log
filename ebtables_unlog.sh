#!/bin/bash

rules="$@"

setChain(){
    tbl=$1
    chain=$2
    ebtables -t $tbl -D $chain $rules --log --log-ip --log-prefix "EBT-$tbl-$chain"
}

setTable(){
    tbl=$1
    shift
    for c in $*; do
        setChain $tbl $c
    done
}

setTable broute BROUTING
setTable filter INPUT FORWARD OUTPUT
setTable nat PREROUTING OUTPUT POSTROUTING

