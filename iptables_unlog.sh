#!/bin/bash

rules="$@"

setChain(){
    tbl=$1
    chain=$2
    iptables -t $tbl -D $chain $rules -j LOG --log-prefix "IPT-$tbl-$chain "
}

setTable(){
    tbl=$1
    shift
    for c in $*; do
        setChain $tbl $c
    done
}

setTable raw PREROUTING OUTPUT
setTable mangle PREROUTING INPUT FORWARD OUTPUT POSTROUTING
setTable filter INPUT FORWARD OUTPUT
setTable nat PREROUTING INPUT OUTPUT POSTROUTING

