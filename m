Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898B428725D;
	Mon,  1 Dec 2025 23:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630719; cv=none; b=iJS+WRr9KOdKVq/gjGTCWpnJzsYl1pAjVxrrg9iM4FHrlqqdWRPY4v2P3N4VxtMJ9dtCOzYVXYqFO6zLpHMbHLewfELot62ZjlPbaUyXBw0LPmuXgXnjV8c6/qEJNDnNbwc3jQCZo2VoO38S3d6jS//QWet7smemcPn22KsqA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630719; c=relaxed/simple;
	bh=ybw1IluTXcB2/xZrS3VSS+5Qy5xoZ8hNT7lnuwKqvnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FRz6qfvQ22MtBJX9YSQGY8sBYebaSz6nBbmkw8TJ9UITC99FqhIOmAHZD40J09seGTDX8kuIH+/OqsAb9RUR+iBUpLg2NT6bBw8DbXecOTVCr3YdGOuXKkJ9HdLgT4xM+sLK45TIkviA8Yq5sbmdoBld5P/5rHlPKB629Cvn8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JWMON4v8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JWMON4v8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 34CBA4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764630710; bh=xkNQQIKaOtw484Iew4vnTIr2cA304h9u90ejBUaZYLI=;
	h=From:To:Cc:Subject:Date:From;
	b=JWMON4v8G1JzPKeyCbh/lm+3mf8/XLtGUkUsnmzj2WpyfVGsY7pLYbgLB4+LgokvT
	 nElHBlq+FDBKn/h7sgCuOosDjKK6rKDqH4QP2POlLHpe1FDwGcxUJovJETHTtixbpI
	 xCsCx4QHlSI64dx02IYXTnQHLAMcGMdwQ1BtzXdOTntP3luEvdqLX1EB8uMqMGf/R9
	 KhNMEQ9zsFBh5OLS+PdZByQJdbmxB2rCL2mhx0r9ydzAncknyg4UB7FxnI9H3Ii5iQ
	 HhDDu2VG9k+H1IMQlCAII/+Je+sEhnHYkD7mTWN0SMMw46oTvujmijFnghcfyieYRv
	 e3sKugWMAYYsA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 34CBA4040B;
	Mon,  1 Dec 2025 23:11:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation for 6.19
Date: Mon, 01 Dec 2025 16:11:49 -0700
Message-ID: <87wm35pzka.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-6.19

for you to fetch changes up to 464257baf99200d1be1c053f15aa617056361e81:

  docs: makefile: move rustdoc check to the build wrapper (2025-11-29 08:42:53 -0700)

----------------------------------------------------------------
This has been another busy cycle for documentation, with a lot of
build-system thrashing.  That work should slow down from here on out.

- The various scripts and tools for documentation were spread out in
  several directories; now they are (almost) all coalesced under
  tools/docs/.  The holdout is the kernel-doc script, which cannot be
  easily moved without some further thought.

- As the amount of Python code increases, we are accumulating modules that
  are imported by multiple programs.  These modules have been pulled
  together under tools/lib/python/ -- at least, for documentation-related
  programs.  There is other Python code in the tree that might eventually
  want to move toward this organization.

- The Perl kernel-doc.pl script has been removed.  It is no longer used by
  default, and nobody has missed it, least of all anybody who actually had
  to look at it.

- The docs build was controlled by a complex mess of makefilese that few
  dared to touch.  Mauro has moved that logic into a new program
  (tools/docs/sphinx-build-wrapper) that, with any luck at all, will be far
  easier to understand and maintain.

- The get_feat.pl program, used to access information under
  Documentation/features/, has been rewritten in Python, bringing an end to
  the use of Perl in the docs subsystem.

- The top-level README file has been reorganized into a more
  reader-friendly presentation.

- A lot of Chinese translation additions

- Typo fixes and documentation updates as usual

----------------------------------------------------------------
Akira Yokosawa (1):
      tools/docs/sphinx-build-wrapper: Emit $SPHINXOPTS later in args list

Akiyoshi Kurita (2):
      Documentation: admin-guide: Correct spelling of "userspace"
      docs: ja_JP: SubmittingPatches: describe the 'Fixes:' tag

Alex Shi (1):
      Revert "Docs/zh_CN: Translate skbuff.rst to Simplified Chinese"

Ally Heev (1):
      Documentation: fix dev-tools broken links in translations

Andy Shevchenko (1):
      kernel-doc: Issue warnings that were silently discarded

Ankit Khushwaha (1):
      docs: parse-headers.rst: Fix a typo

Bagas Sanjaya (12):
      Documentation: process: Arbitrarily bump kernel major version number
      Documentation: assoc_array: Indent function explanation text
      Documentation: assoc_array: Format internal tree layout tables
      Documentation: process: Also mention Sasha Levin as stable tree maintainer
      Documentation: treewide: Replace marc.info links with lore
      Documentation: pldmfw: Demote library overview section
      Documentation: uacce: Add explicit title
      Documentation: parport-lowlevel: Separate function listing code blocks
      Documentation: taskstats: Reindent payload kinds list
      Documentation: amd-sbi: Wrap miscdevice listing snippet in literal code block
      Documentation: mrvl-cn10k-dpi: Fix macro cross-reference syntax
      Documentation: tps6594-pfsm: Fix macro cross-reference syntax

Ben Guo (2):
      docs/zh_CN: Update Rust index translation and add reference label
      docs/zh_CN: Add translation of rust/testing.rst

Bhanu Seshu Kumar Valluri (1):
      docs: Makefile: Sort Documentation targets case-insensitively in make help

Borislav Petkov (AMD) (1):
      Documentation/kernel-parameters: Move the kernel build options

Brendan Jackman (2):
      Documentation: clarify PR_SPEC_L1D_FLUSH
      Documentation: fix reference to PR_SPEC_L1D_FLUSH

Brian Norris (2):
      docs: checkpatch: Align block comment style
      docs: checkpatch: Drop networking comment style

Chenguang Zhao (1):
      docs/zh_CN: Update the Chinese translation of kbuild.rst

Gabriele Ricciardi (1):
      coding-style: fix verb typo

Gopi Krishna Menon (1):
      Documentation/rtla: rename common_xxx.rst files to common_xxx.txt

Gou Hao (1):
      xfs-doc: Fix typo error

Hugo Osvaldo Barrera (1):
      Documentation/x86: explain LINUX_EFI_INITRD_MEDIA_GUID

Jacob Keller (1):
      docs: kdoc: fix duplicate section warning message

Jiakai Xu (1):
      Documentation/admin-guide: fix typo and comment in cscope example

Jonathan Corbet (16):
      Merge branch 'media-uapi' into docs-mw
      Merge branch 'build-script' into docs-mw
      docs: Move the "features" tools to tools/docs
      docs: move checktransupdate.py to tools/docs
      docs: move scripts/documentation-file-ref-check to tools/docs
      docs: move get_abi.py to tools/docs
      docs: move test_doc_build.py to tools/docs
      docs: move find-unused-docs.sh to tools/docs
      docs: remove kernel-doc.pl
      Merge tag 'Chinese-docs-6.18' of gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux into alex
      Merge branch 'tools-final2' into docs-mw
      docs: Move the python libraries to tools/lib/python
      docs: bring some order to our Python module hierarchy
      Merge branch 'python-modules' into docs-mw
      Merge branch 'mauro' into docs-mw
      Merge tag 'Chinese-docs-6.19' of gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux into tmp

Krzysztof Kozlowski (1):
      docs: submitting-patches: Clarify that removal of Acks needs explanation too

Lukas Bulwahn (1):
      MAINTAINERS: extend DOCUMENTATION SCRIPTS to the full directories

Mauro Carvalho Chehab (67):
      scripts/jobserver-exec: move the code to a class
      scripts/jobserver-exec: move its class to the lib directory
      scripts/jobserver-exec: add a help message
      scripts: check-variable-fonts.sh: convert to Python
      tools/docs: check-variable-fonts.py: split into a lib and an exec file
      check-variable-fonts.py: add a helper to display instructions
      scripts: sphinx-pre-install: move it to tools/docs
      tools/docs: sphinx-pre-install: drop a debug print
      tools/docs: sphinx-pre-install: allow check for alternatives and bail out
      tools/docs: python_version: move version check from sphinx-pre-install
      tools/docs: sphinx-build-wrapper: add a wrapper for sphinx-build
      docs: parallel-wrapper.sh: remove script
      docs: Makefile: document latex/PDF PAPER= parameter
      docs: Makefile: document FONTS_CONF_DENY_VF= parameter
      tools/docs: sphinx-build-wrapper: add an argument for LaTeX interactive mode
      tools/docs: sphinx-build-wrapper: allow building PDF files in parallel
      tools/docs,scripts: sphinx-*: prevent sphinx-build crashes
      tools/docs: sphinx-build-wrapper: Fix output for duplicated names
      docs: add support to build manpages from kerneldoc output
      tools: kernel-doc: add a see also section at man pages
      scripts: kdoc_parser.py: warn about Python version only once
      tools/docs: sphinx-build-wrapper: move rust doc builder to wrapper
      tools/docs: sphinx-* break documentation bulds on openSUSE
      tools/docs: sphinx-build-wrapper: add support to run inside venv
      tools/docs: sphinx-build-wrapper: handle sphinx-build errors
      scripts: remove sphinx-build-wrapper from scripts/
      docs: conf.py: get rid of load_config.py
      tools/docs: sphinx-build-wrapper: fix compat with recent Tumbleweed
      docs: Makefile: fix rustdoc detection
      tools/docs/sphinx-build-wrapper: allow skipping sphinx-build step
      docs: Makefile: avoid a warning when using without texlive
      tools/docs: sphinx-build-wrapper: pdflatex is needed only for pdf
      docs: Makefile: use PYTHONPYCACHEPREFIX
      kernel-doc: output source file name at SEE ALSO
      tools/docs: sphinx-build-wrapper: -q is a boolean, not an integer
      tools: docs: parse_data_structs.py: drop contents header
      tools: docs: parse_data_structs.py: output a line number
      docs: kernel_include.py: fix line numbers for TOC
      docs: kernel_include.py: propose alternatives
      tools: docs: parse_data_structs: make process_exceptions two stages
      tools: docs: parse_data_structs.py: get rid of process_exceptions()
      tools: docs: parse_data_structs.py: add namespace support
      tools: docs: parse_data_structs.py: accept more reftypes
      docs: media: dvb: use TOC instead of file contents at headers
      docs: media: dvb: enable warnings for most headers
      docs: media: rc: use TOC instead of file contents for LIRC header
      docs: media: mediactl: use TOC instead of file contents
      docs: kernel_include.py: use get_close_matches() to propose alternatives
      docs: media: add missing c namespace to V4L headers
      docs: media: videodev2.h.rst.exceptions: fix namespace on refs
      media: docs: add a missing reference for VIDIOC_QUERY_CTRL
      media: docs: videodev2.h.rst.exceptions: ignore struct __kernel_v4l2_timeval
      media: docs: add some C domain missing references
      docs: cec: cec.h.rst.exceptions: fix broken references from cec.h
      docs: cec: show broken xrefs and show TOC instead of cec.h content
      docs: media: dmx_types: place kerneldoc at the right namespace
      docs: media: dvb: headers: warn about broken cross references
      docs: media: dvb: fix dmx.h.rst.exceptions
      docs: doc-guide: parse-headers.rst update its documentation
      tools/docs/get_abi.py: fix get_abi library directory
      scripts: docs: kdoc_files.py: don't consider symlinks as directories
      docs: Makefile: update SPHINXDIRS documentation
      docs: parse-headers.rst: remove uneeded parenthesis
      tools/docs/get_feat.py: convert get_feat.pl to Python
      Documentation/sphinx/kernel_feat.py: use class directly
      get_feat.pl: remove it, as it got replaced by get_feat.py
      docs: makefile: move rustdoc check to the build wrapper

Nadav Tasher (1):
      docs: replace broken links in ramfs-rootfs-initramfs docs

Randy Dunlap (7):
      docs: w1: fix w1-netlink invalid URL
      doc-guide: kernel-doc: add %CONST examples
      docs: ABI: sysfs-module: update modules taint flags
      docs: MAINTAINERS: update Mauro's files/paths
      docs: kdoc_parser: add data/function attributes to ignore
      docs: kdoc_parser: use '@' for Excess enum value
      docs: kdoc: various fixes for grammar, spelling, punctuation

Sasha Levin (1):
      README: restructure with role-based documentation and guidelines

Shao Mingyin (5):
      Docs/zh_CN: Translate ubifs.rst to Simplified Chinese
      Docs/zh_CN: Translate ubifs-authentication.rst to Simplified Chinese
      Docs/zh_CN: Translate gfs2.rst to Simplified Chinese
      Docs/zh_CN: Translate gfs2-uevents.rst to Simplified Chinese
      Docs/zh_CN: Translate gfs2-glocks.rst to Simplified Chinese

Shuo Zhao (4):
      docs/zh_CN: Add security ipe Chinese translation
      docs/zh_CN: Add security lsm-development Chinese translation
      docs/zh_CN: Add security SCTP Chinese translation
      docs/zh_CN: Add secrets coco Chinese translation

Sun yuxi (2):
      Docs/zh_CN: Translate mptcp-sysctl.rst to Simplified Chinese
      Docs/zh_CN: Translate generic-hdlc.rst to Simplified Chinese

Tomas Glozar (9):
      Documentation/rtla: Fix typo in common_options.txt
      Documentation/rtla: Fix typo in common_timerlat_options.txt
      Documentation/rtla: Fix typo in rtla-timerlat-top.rst
      Documentation/rtla: Fix typo in common_timerlat_options.txt
      Documentation/rtla: Correct tracer name for common options
      Documentation/rtla: Mention default priority
      Documentation/rtla: Mention default cgroup state
      Documentation/trace: Specify exact priority for timerlat
      Documentation/rtla: Include defaults for tracer options

Wang Longjie (2):
      Docs/zh_CN: Translate dnotify.rst to Simplified Chinese
      Docs/zh_CN: Translate inotify.rst to Simplified Chinese

Wang Yaxin (2):
      Docs/zh_CN: Translate skbuff.rst to Simplified Chinese
      Docs/zh_CN: Translate timestamping.rst to Simplified Chinese

Xie Yuanbin (1):
      Documentation/kernel-parameters: fix typo in retbleed= kernel parameter description

Yohei Kojima (1):
      docs: admin-guide: Fix a typo in kernel-parameters.txt

Yujie Zhang (2):
      docs/zh_CN: Add libsas.rst translation
      docs/zh_CN: Add wd719x.rst translation

doubled (7):
      docs/zh_CN: Add scsi/index.rst translation
      docs/zh_CN: Add scsi.rst translation
      docs/zh_CN: Add scsi_mid_low_api.rst translation
      docs/zh_CN: Add scsi_eh.rst translation
      docs/zh_CN: Add scsi-parameters.rst translation
      docs/zh_CN: Add link_power_management_policy.rst translation
      docs/zh_CN: Add sd-parameters.rst translation

ke zijie (4):
      docs: zh_CN: scsi: fix broken references in scsi-parameters.rst
      docs/zh_CN: Add block/index.rst translation
      docs/zh_CN: Add blk-mq.rst translation
      docs/zh_CN: Add data-integrity.rst translation

pierwill (1):
      docs: Fix missing word in spectre.rst

shaomingyin (3):
      Docs/zh_CN: add fixed format for the header of gfs2-glocks.rst
      Docs/zh_CN: align title underline for ubifs.rst
      Docs/zh_CN: fix the format of proofreader

 .pylintrc                                          |    2 +-
 Documentation/ABI/testing/sysfs-module             |    2 +
 Documentation/Kconfig                              |    2 +-
 Documentation/Makefile                             |  160 +-
 Documentation/accounting/taskstats.rst             |   54 +-
 Documentation/admin-guide/efi-stub.rst             |    3 +
 Documentation/admin-guide/hw-vuln/l1d_flush.rst    |    2 +-
 Documentation/admin-guide/hw-vuln/spectre.rst      |    2 +-
 Documentation/admin-guide/kernel-parameters.rst    |   97 +-
 Documentation/admin-guide/kernel-parameters.txt    |  102 +-
 Documentation/admin-guide/tainted-kernels.rst      |    2 +-
 Documentation/admin-guide/workload-tracing.rst     |   10 +-
 Documentation/arch/x86/boot.rst                    |   40 +-
 Documentation/conf.py                              |   15 +-
 Documentation/core-api/assoc_array.rst             |  196 +-
 Documentation/dev-tools/checkpatch.rst             |   13 +-
 Documentation/doc-guide/checktransupdate.rst       |    6 +-
 Documentation/doc-guide/contributing.rst           |    2 +-
 Documentation/doc-guide/kernel-doc.rst             |   33 +-
 Documentation/doc-guide/parse-headers.rst          |  189 +-
 Documentation/doc-guide/sphinx.rst                 |    6 +-
 Documentation/driver-api/parport-lowlevel.rst      |    5 +
 Documentation/driver-api/pldmfw/index.rst          |    1 -
 .../driver-api/usb/writing_musb_glue_layer.rst     |    2 +-
 .../filesystems/ramfs-rootfs-initramfs.rst         |   12 +-
 .../filesystems/xfs/xfs-online-fsck-design.rst     |    2 +-
 Documentation/misc-devices/amd-sbi.rst             |    6 +-
 Documentation/misc-devices/mrvl_cn10k_dpi.rst      |    4 +-
 Documentation/misc-devices/tps6594-pfsm.rst        |   12 +-
 Documentation/misc-devices/uacce.rst               |    7 +-
 Documentation/mm/active_mm.rst                     |    2 +-
 Documentation/process/2.Process.rst                |   47 +-
 Documentation/process/coding-style.rst             |    2 +-
 Documentation/process/submitting-patches.rst       |    5 +-
 Documentation/sphinx/kernel_abi.py                 |    6 +-
 Documentation/sphinx/kernel_feat.py                |   26 +-
 Documentation/sphinx/kernel_include.py             |  112 +-
 Documentation/sphinx/kerneldoc-preamble.sty        |    2 +-
 Documentation/sphinx/kerneldoc.py                  |    6 +-
 Documentation/sphinx/load_config.py                |   60 -
 Documentation/sphinx/parallel-wrapper.sh           |   33 -
 .../{common_appendix.rst => common_appendix.txt}   |    0
 ...on_hist_options.rst => common_hist_options.txt} |    0
 .../{common_options.rst => common_options.txt}     |   16 +-
 ...cription.rst => common_osnoise_description.txt} |    0
 ...oise_options.rst => common_osnoise_options.txt} |    0
 ...mmon_timerlat_aa.rst => common_timerlat_aa.txt} |    0
 ...ription.rst => common_timerlat_description.txt} |    0
 ...lat_options.rst => common_timerlat_options.txt} |    4 +-
 ...mmon_top_options.rst => common_top_options.txt} |    0
 Documentation/tools/rtla/rtla-hwnoise.rst          |    8 +-
 Documentation/tools/rtla/rtla-osnoise-hist.rst     |   10 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst      |   10 +-
 Documentation/tools/rtla/rtla-osnoise.rst          |    4 +-
 Documentation/tools/rtla/rtla-timerlat-hist.rst    |   12 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst     |   14 +-
 Documentation/tools/rtla/rtla-timerlat.rst         |    4 +-
 Documentation/tools/rtla/rtla.rst                  |    2 +-
 Documentation/trace/timerlat-tracer.rst            |   12 +-
 .../translations/it_IT/doc-guide/parse-headers.rst |    8 +-
 .../translations/it_IT/doc-guide/sphinx.rst        |    4 +-
 Documentation/translations/ja_JP/SubmittingPatches |   28 +-
 .../translations/zh_CN/admin-guide/README.rst      |    2 +-
 Documentation/translations/zh_CN/block/blk-mq.rst  |  130 ++
 .../translations/zh_CN/block/data-integrity.rst    |  192 ++
 Documentation/translations/zh_CN/block/index.rst   |   35 +
 .../zh_CN/dev-tools/gdb-kernel-debugging.rst       |    2 +-
 .../zh_CN/doc-guide/checktransupdate.rst           |    6 +-
 .../translations/zh_CN/doc-guide/contributing.rst  |    2 +-
 .../translations/zh_CN/doc-guide/parse-headers.rst |    8 +-
 .../translations/zh_CN/doc-guide/sphinx.rst        |    4 +-
 .../translations/zh_CN/filesystems/dnotify.rst     |   67 +
 .../translations/zh_CN/filesystems/gfs2-glocks.rst |  211 ++
 .../zh_CN/filesystems/gfs2-uevents.rst             |   97 +
 .../translations/zh_CN/filesystems/gfs2.rst        |   57 +
 .../translations/zh_CN/filesystems/index.rst       |   17 +-
 .../translations/zh_CN/filesystems/inotify.rst     |   80 +
 .../zh_CN/filesystems/ubifs-authentication.rst     |  354 +++
 .../translations/zh_CN/filesystems/ubifs.rst       |  114 +
 Documentation/translations/zh_CN/how-to.rst        |    4 +-
 Documentation/translations/zh_CN/kbuild/kbuild.rst |   27 +-
 Documentation/translations/zh_CN/mm/active_mm.rst  |    2 +-
 .../translations/zh_CN/networking/generic-hdlc.rst |  176 ++
 .../translations/zh_CN/networking/index.rst        |    7 +-
 .../translations/zh_CN/networking/mptcp-sysctl.rst |  139 ++
 .../translations/zh_CN/networking/timestamping.rst |  674 ++++++
 .../zh_CN/rust/general-information.rst             |    1 +
 Documentation/translations/zh_CN/rust/index.rst    |   33 +-
 Documentation/translations/zh_CN/rust/testing.rst  |  215 ++
 Documentation/translations/zh_CN/scsi/index.rst    |   92 +
 Documentation/translations/zh_CN/scsi/libsas.rst   |  425 ++++
 .../zh_CN/scsi/link_power_management_policy.rst    |   32 +
 .../translations/zh_CN/scsi/scsi-parameters.rst    |  118 +
 Documentation/translations/zh_CN/scsi/scsi.rst     |   48 +
 Documentation/translations/zh_CN/scsi/scsi_eh.rst  |  482 ++++
 .../translations/zh_CN/scsi/scsi_mid_low_api.rst   | 1174 ++++++++++
 .../translations/zh_CN/scsi/sd-parameters.rst      |   38 +
 Documentation/translations/zh_CN/scsi/wd719x.rst   |   35 +
 Documentation/translations/zh_CN/security/SCTP.rst |  317 +++
 .../translations/zh_CN/security/index.rst          |    4 +-
 Documentation/translations/zh_CN/security/ipe.rst  |  398 ++++
 .../zh_CN/security/lsm-development.rst             |   19 +
 .../translations/zh_CN/security/secrets/coco.rst   |   96 +
 .../translations/zh_CN/security/secrets/index.rst  |    9 +-
 .../translations/zh_CN/subsystem-apis.rst          |    3 +-
 .../translations/zh_TW/admin-guide/README.rst      |    2 +-
 .../zh_TW/dev-tools/gdb-kernel-debugging.rst       |    2 +-
 .../userspace-api/media/cec/cec-header.rst         |    8 +-
 .../userspace-api/media/cec/cec.h.rst.exceptions   |    3 +
 .../userspace-api/media/dvb/dmx.h.rst.exceptions   |   86 +-
 .../userspace-api/media/dvb/dmx_types.rst          |    1 +
 .../media/dvb/frontend.h.rst.exceptions            |    5 +-
 Documentation/userspace-api/media/dvb/headers.rst  |   31 +-
 .../userspace-api/media/mediactl/media-header.rst  |    8 +-
 .../media/mediactl/media.h.rst.exceptions          |    3 +
 .../userspace-api/media/rc/lirc-header.rst         |   14 +-
 Documentation/userspace-api/media/v4l/app-pri.rst  |    1 +
 Documentation/userspace-api/media/v4l/audio.rst    |    1 +
 Documentation/userspace-api/media/v4l/biblio.rst   |    1 +
 Documentation/userspace-api/media/v4l/buffer.rst   |    2 +
 .../userspace-api/media/v4l/capture-example.rst    |    1 +
 .../userspace-api/media/v4l/capture.c.rst          |    1 +
 .../userspace-api/media/v4l/colorspaces-defs.rst   |    1 +
 .../media/v4l/colorspaces-details.rst              |    1 +
 .../userspace-api/media/v4l/colorspaces.rst        |    1 +
 .../userspace-api/media/v4l/common-defs.rst        |    1 +
 Documentation/userspace-api/media/v4l/common.rst   |    1 +
 Documentation/userspace-api/media/v4l/compat.rst   |    1 +
 Documentation/userspace-api/media/v4l/control.rst  |    1 +
 Documentation/userspace-api/media/v4l/crop.rst     |    1 +
 .../userspace-api/media/v4l/depth-formats.rst      |    1 +
 .../userspace-api/media/v4l/dev-decoder.rst        |    1 +
 .../userspace-api/media/v4l/dev-encoder.rst        |    1 +
 .../userspace-api/media/v4l/dev-event.rst          |    1 +
 .../userspace-api/media/v4l/dev-mem2mem.rst        |    1 +
 Documentation/userspace-api/media/v4l/dev-meta.rst |    1 +
 Documentation/userspace-api/media/v4l/dev-osd.rst  |    1 +
 .../userspace-api/media/v4l/dev-overlay.rst        |    1 +
 .../userspace-api/media/v4l/dev-radio.rst          |    1 +
 Documentation/userspace-api/media/v4l/dev-sdr.rst  |    1 +
 .../media/v4l/dev-stateless-decoder.rst            |    1 +
 .../userspace-api/media/v4l/dev-subdev.rst         |    1 +
 .../userspace-api/media/v4l/dev-touch.rst          |    1 +
 Documentation/userspace-api/media/v4l/devices.rst  |    1 +
 .../userspace-api/media/v4l/dv-timings.rst         |    1 +
 .../userspace-api/media/v4l/ext-ctrls-camera.rst   |    1 +
 .../media/v4l/ext-ctrls-codec-stateless.rst        |    1 +
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |    1 +
 .../media/v4l/ext-ctrls-colorimetry.rst            |    1 +
 .../userspace-api/media/v4l/ext-ctrls-detect.rst   |    1 +
 .../userspace-api/media/v4l/ext-ctrls-dv.rst       |    1 +
 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |    1 +
 .../userspace-api/media/v4l/ext-ctrls-fm-rx.rst    |    1 +
 .../userspace-api/media/v4l/ext-ctrls-fm-tx.rst    |    1 +
 .../media/v4l/ext-ctrls-image-process.rst          |    1 +
 .../media/v4l/ext-ctrls-image-source.rst           |    1 +
 .../userspace-api/media/v4l/ext-ctrls-jpeg.rst     |    1 +
 .../userspace-api/media/v4l/ext-ctrls-rf-tuner.rst |    1 +
 .../userspace-api/media/v4l/extended-controls.rst  |    1 +
 .../userspace-api/media/v4l/field-order.rst        |    1 +
 Documentation/userspace-api/media/v4l/fourcc.rst   |    1 +
 .../userspace-api/media/v4l/hsv-formats.rst        |    1 +
 Documentation/userspace-api/media/v4l/libv4l.rst   |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-c3-isp.rst     |    1 +
 .../userspace-api/media/v4l/metafmt-d4xx.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-generic.rst    |    1 +
 .../userspace-api/media/v4l/metafmt-intel-ipu3.rst |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-be.rst    |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |    1 +
 .../userspace-api/media/v4l/metafmt-rkisp1.rst     |    1 +
 .../userspace-api/media/v4l/metafmt-uvc.rst        |    1 +
 .../userspace-api/media/v4l/metafmt-vivid.rst      |    1 +
 .../userspace-api/media/v4l/metafmt-vsp1-hgo.rst   |    1 +
 .../userspace-api/media/v4l/metafmt-vsp1-hgt.rst   |    1 +
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |    1 +
 .../userspace-api/media/v4l/pixfmt-cnf4.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-compressed.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-indexed.rst     |    1 +
 .../userspace-api/media/v4l/pixfmt-intro.rst       |    1 +
 .../userspace-api/media/v4l/pixfmt-inzi.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-m420.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-packed-hsv.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-reserved.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-cs08.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-cs14le.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-cu08.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-cu16le.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-ru12le.rst  |    1 +
 .../media/v4l/pixfmt-srggb10-ipu3.rst              |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb10.rst     |    1 +
 .../media/v4l/pixfmt-srggb10alaw8.rst              |    1 +
 .../media/v4l/pixfmt-srggb10dpcm8.rst              |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb10p.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb12.rst     |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb12p.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb14.rst     |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb14p.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb16.rst     |    1 +
 .../media/v4l/pixfmt-srggb8-pisp-comp.rst          |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb8.rst      |    1 +
 .../userspace-api/media/v4l/pixfmt-tch-td08.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-tch-td16.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-tch-tu08.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-tch-tu16.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-uv8.rst         |    1 +
 .../userspace-api/media/v4l/pixfmt-v4l2-mplane.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-v4l2.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-y12i.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-y16i.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-y8i.rst         |    1 +
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-z16.rst         |    1 +
 Documentation/userspace-api/media/v4l/pixfmt.rst   |    1 +
 .../userspace-api/media/v4l/planar-apis.rst        |    1 +
 Documentation/userspace-api/media/v4l/querycap.rst |    1 +
 .../userspace-api/media/v4l/sdr-formats.rst        |    1 +
 .../media/v4l/selection-api-configuration.rst      |    1 +
 .../media/v4l/selection-api-examples.rst           |    1 +
 .../media/v4l/selection-api-intro.rst              |    1 +
 .../media/v4l/selection-api-targets.rst            |    1 +
 .../media/v4l/selection-api-vs-crop-api.rst        |    1 +
 .../userspace-api/media/v4l/selection-api.rst      |    1 +
 .../userspace-api/media/v4l/selections-common.rst  |    1 +
 Documentation/userspace-api/media/v4l/standard.rst |    1 +
 .../userspace-api/media/v4l/subdev-formats.rst     |    1 +
 .../userspace-api/media/v4l/tch-formats.rst        |    1 +
 Documentation/userspace-api/media/v4l/tuner.rst    |    1 +
 .../userspace-api/media/v4l/user-func.rst          |    1 +
 .../media/v4l/v4l2-selection-flags.rst             |    1 +
 .../media/v4l/v4l2-selection-targets.rst           |    1 +
 Documentation/userspace-api/media/v4l/v4l2.rst     |    1 +
 .../userspace-api/media/v4l/v4l2grab-example.rst   |    1 +
 .../userspace-api/media/v4l/v4l2grab.c.rst         |    1 +
 Documentation/userspace-api/media/v4l/video.rst    |    1 +
 Documentation/userspace-api/media/v4l/videodev.rst |    9 +-
 .../media/v4l/videodev2.h.rst.exceptions           |  288 +--
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |    8 +
 .../userspace-api/media/v4l/yuv-formats.rst        |    1 +
 Documentation/userspace-api/spec_ctrl.rst          |    6 +-
 Documentation/w1/w1-netlink.rst                    |    2 +-
 MAINTAINERS                                        |   17 +-
 Makefile                                           |    7 +-
 README                                             |  160 +-
 scripts/check-variable-fonts.sh                    |  115 -
 scripts/get_feat.pl                                |  641 -----
 scripts/jobserver-exec                             |   88 +-
 scripts/kernel-doc.pl                              | 2439 --------------------
 scripts/kernel-doc.py                              |    6 +-
 scripts/sphinx-build-wrapper                       |  719 ------
 scripts/split-man.pl                               |   28 -
 tools/docs/check-variable-fonts.py                 |   37 +
 {scripts => tools/docs}/checktransupdate.py        |    8 +-
 .../docs}/documentation-file-ref-check             |    2 +-
 .../scripts => tools/docs}/features-refresh.sh     |    0
 {scripts => tools/docs}/find-unused-docs.sh        |    6 +-
 {scripts => tools/docs}/get_abi.py                 |   10 +-
 tools/docs/get_feat.py                             |  225 ++
 .../features => tools/docs}/list-arch.sh           |    2 +-
 tools/docs/parse-headers.py                        |   14 +-
 tools/docs/sphinx-build-wrapper                    |  864 +++++++
 {scripts => tools/docs}/sphinx-pre-install         |  140 +-
 {scripts => tools/docs}/test_doc_build.py          |    0
 tools/{docs/lib => lib/python}/__init__.py         |    0
 tools/lib/python/abi/__init__.py                   |    0
 .../lib => tools/lib/python}/abi/abi_parser.py     |    2 +-
 {scripts/lib => tools/lib/python}/abi/abi_regex.py |    4 +-
 {scripts/lib => tools/lib/python}/abi/helpers.py   |    0
 .../lib => tools/lib/python}/abi/system_symbols.py |    2 +-
 tools/lib/python/feat/parse_features.py            |  494 ++++
 tools/lib/python/jobserver.py                      |  149 ++
 tools/lib/python/kdoc/__init__.py                  |    0
 .../lib => lib/python/kdoc}/enrich_formatter.py    |    0
 .../lib => tools/lib/python}/kdoc/kdoc_files.py    |   15 +-
 .../lib => tools/lib/python}/kdoc/kdoc_item.py     |    3 +-
 .../lib => tools/lib/python}/kdoc/kdoc_output.py   |   97 +-
 .../lib => tools/lib/python}/kdoc/kdoc_parser.py   |   61 +-
 {scripts/lib => tools/lib/python}/kdoc/kdoc_re.py  |   24 +-
 tools/lib/python/kdoc/latex_fonts.py               |  167 ++
 .../lib => lib/python/kdoc}/parse_data_structs.py  |  230 +-
 tools/lib/python/kdoc/python_version.py            |  178 ++
 287 files changed, 9639 insertions(+), 5290 deletions(-)
 delete mode 100644 Documentation/sphinx/load_config.py
 delete mode 100644 Documentation/sphinx/parallel-wrapper.sh
 rename Documentation/tools/rtla/{common_appendix.rst => common_appendix.txt} (100%)
 rename Documentation/tools/rtla/{common_hist_options.rst => common_hist_options.txt} (100%)
 rename Documentation/tools/rtla/{common_options.rst => common_options.txt} (82%)
 rename Documentation/tools/rtla/{common_osnoise_description.rst => common_osnoise_description.txt} (100%)
 rename Documentation/tools/rtla/{common_osnoise_options.rst => common_osnoise_options.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_aa.rst => common_timerlat_aa.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_description.rst => common_timerlat_description.txt} (100%)
 rename Documentation/tools/rtla/{common_timerlat_options.rst => common_timerlat_options.txt} (95%)
 rename Documentation/tools/rtla/{common_top_options.rst => common_top_options.txt} (100%)
 create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
 create mode 100644 Documentation/translations/zh_CN/block/data-integrity.rst
 create mode 100644 Documentation/translations/zh_CN/block/index.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/dnotify.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/inotify.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/ubifs-authentication.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/ubifs.rst
 create mode 100644 Documentation/translations/zh_CN/networking/generic-hdlc.rst
 create mode 100644 Documentation/translations/zh_CN/networking/mptcp-sysctl.rst
 create mode 100644 Documentation/translations/zh_CN/networking/timestamping.rst
 create mode 100644 Documentation/translations/zh_CN/rust/testing.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/index.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/libsas.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/link_power_management_policy.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi-parameters.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi_eh.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/sd-parameters.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/wd719x.rst
 create mode 100644 Documentation/translations/zh_CN/security/SCTP.rst
 create mode 100644 Documentation/translations/zh_CN/security/ipe.rst
 create mode 100644 Documentation/translations/zh_CN/security/lsm-development.rst
 create mode 100644 Documentation/translations/zh_CN/security/secrets/coco.rst
 delete mode 100755 scripts/check-variable-fonts.sh
 delete mode 100755 scripts/get_feat.pl
 delete mode 100755 scripts/kernel-doc.pl
 delete mode 100755 scripts/sphinx-build-wrapper
 delete mode 100755 scripts/split-man.pl
 create mode 100755 tools/docs/check-variable-fonts.py
 rename {scripts => tools/docs}/checktransupdate.py (97%)
 rename {scripts => tools/docs}/documentation-file-ref-check (99%)
 rename {Documentation/features/scripts => tools/docs}/features-refresh.sh (100%)
 rename {scripts => tools/docs}/find-unused-docs.sh (85%)
 rename {scripts => tools/docs}/get_abi.py (95%)
 create mode 100755 tools/docs/get_feat.py
 rename {Documentation/features => tools/docs}/list-arch.sh (83%)
 create mode 100755 tools/docs/sphinx-build-wrapper
 rename {scripts => tools/docs}/sphinx-pre-install (93%)
 rename {scripts => tools/docs}/test_doc_build.py (100%)
 rename tools/{docs/lib => lib/python}/__init__.py (100%)
 create mode 100644 tools/lib/python/abi/__init__.py
 rename {scripts/lib => tools/lib/python}/abi/abi_parser.py (99%)
 rename {scripts/lib => tools/lib/python}/abi/abi_regex.py (99%)
 rename {scripts/lib => tools/lib/python}/abi/helpers.py (100%)
 rename {scripts/lib => tools/lib/python}/abi/system_symbols.py (99%)
 create mode 100755 tools/lib/python/feat/parse_features.py
 create mode 100755 tools/lib/python/jobserver.py
 create mode 100644 tools/lib/python/kdoc/__init__.py
 rename tools/{docs/lib => lib/python/kdoc}/enrich_formatter.py (100%)
 rename {scripts/lib => tools/lib/python}/kdoc/kdoc_files.py (95%)
 rename {scripts/lib => tools/lib/python}/kdoc/kdoc_item.py (93%)
 rename {scripts/lib => tools/lib/python}/kdoc/kdoc_output.py (88%)
 rename {scripts/lib => tools/lib/python}/kdoc/kdoc_parser.py (97%)
 rename {scripts/lib => tools/lib/python}/kdoc/kdoc_re.py (91%)
 create mode 100755 tools/lib/python/kdoc/latex_fonts.py
 rename tools/{docs/lib => lib/python/kdoc}/parse_data_structs.py (75%)
 create mode 100644 tools/lib/python/kdoc/python_version.py
