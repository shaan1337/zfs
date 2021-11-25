#!/bin/ksh -p

#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright (c) 2015, 2016 by Delphix. All rights reserved.
#

. $STF_SUITE/include/libtest.shlib

#
# Description:
# Run the tests for msync.
#

if is_linux; then
    log_assert "Run the tests for msync"

    saved_vm_dirty_expire_centisecs=$(cat /proc/sys/vm/dirty_expire_centisecs)
    saved_vm_dirty_background_ratio=$(cat /proc/sys/vm/dirty_background_ratio)
    saved_vm_dirty_writeback_centisecs=$(cat /proc/sys/vm/dirty_writeback_centisecs)

    log_must sudo /bin/sh -c "echo 1 > /proc/sys/vm/dirty_expire_centisecs"
    log_must sudo /bin/sh -c "echo 1 > /proc/sys/vm/dirty_background_bytes"
    log_must sudo /bin/sh -c "echo 1 > /proc/sys/vm/dirty_writeback_centisecs"

    log_must $STF_SUITE/tests/functional/page_writeback/msync_test

    sudo /bin/sh -c "echo $saved_vm_dirty_expire_centisecs > /proc/sys/vm/dirty_expire_centisecs"
    sudo /bin/sh -c "echo $saved_vm_dirty_background_ratio > /proc/sys/vm/dirty_background_ratio"
    sudo /bin/sh -c "echo $saved_vm_dirty_writeback_centisecs > /proc/sys/vm/dirty_writeback_centisecs"

    log_pass "msync tests passed."
fi
