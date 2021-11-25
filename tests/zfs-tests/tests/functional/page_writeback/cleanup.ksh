#!/bin/ksh -p
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#

#
# Copyright (c) 2013, 2016 by Delphix. All rights reserved.
#

. $STF_SUITE/include/libtest.shlib

# Revert the settings to some sensible defaults if something went wrong
# and we were not able to revert back to the original values. (e.g if the
# test had failed or the previous test run was interrupted)

if [ $(cat /proc/sys/vm/dirty_expire_centisecs) -eq 1 ]; then
    sudo /bin/sh -c "echo 3000 > /proc/sys/vm/dirty_expire_centisecs"
fi

if [ $(cat /proc/sys/vm/dirty_background_ratio) -eq 0 ]; then
    sudo /bin/sh -c "echo 10 > /proc/sys/vm/dirty_background_ratio"
fi

if [ $(cat /proc/sys/vm/dirty_writeback_centisecs) -eq 1 ]; then
    sudo /bin/sh -c "echo 500 > /proc/sys/vm/dirty_writeback_centisecs"
fi

default_cleanup
