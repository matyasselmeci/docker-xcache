#!/bin/bash

if [[ $XC_FIX_DIR_OWNERS != 'yes' ]]; then
    return
fi

namespace_dir=$(cconfig -c "/etc/xrootd/xrootd-$XC_IMAGE_NAME.cfg" 2>&1 \
                     | awk "/^oss.localroot/ {print \$2}")
space_dirs=$(cconfig -c "/etc/xrootd/xrootd-$XC_IMAGE_NAME.cfg" 2>&1 \
                     | awk "/^oss.space/ {print \$3}")

find $namespace_dir $space_dirs -not -name lost+found -exec chown xrootd:xrootd {} +
