#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo -e "Usage: docker run -it --rm -v $(pwd):/data gogaenrique/mwb2sql {MWB input file} {SQL output file}"
    exit 1
fi

/usr/bin/Xvfb :1 &
/opt/mwb2sql.sh $1 $2
exit 0
