#!/bin/bash

# check exists.
if [[ -f /usr/local/bin/ccache ]]; then 
    echo "ccache is ok";
    exit 0;
fi

# check sudoer.
echo "ok" > /dev/null 2>&1; 
ret=$?; if [[ 0 -ne ${ret} ]]; then echo "you must be sudoer"; exit 1; fi

unzip ccache-3.1.9.zip && cd ccache-3.1.9 && ./configure && make
ret=$?; if [[ $ret -ne 0 ]]; then echo "build ccache failed."; exit $ret; fi

cp ccache /usr/local/bin && ln -s ccache /usr/local/bin/gcc && ln -s ccache /usr/local/bin/g++ && ln -s ccache /usr/local/bin/cc && ln -s ccache /usr/local/bin/c++
ret=$?; if [[ $ret -ne 0 ]]; then echo "install ccache failed."; exit $ret; fi
