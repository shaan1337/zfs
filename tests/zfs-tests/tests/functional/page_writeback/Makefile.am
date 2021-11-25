include $(top_srcdir)/config/Rules.am

pkgdatadir = $(datadir)/@PACKAGE@/zfs-tests/tests/functional/page_writeback

dist_pkgdata_SCRIPTS = \
	setup.ksh \
	cleanup.ksh \
	run_msync_test.ksh

pkgexecdir = $(datadir)/@PACKAGE@/zfs-tests/tests/functional/page_writeback

pkgexec_PROGRAMS = msync_test
msync_test_SOURCES = msync_test.c

