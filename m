Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388F38759B;
	Mon,  9 Feb 2026 19:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770665572; cv=none; b=dYfvm1AQa67qHMzYpdIoPEUM4lQaH4lNIMdd3PLLT1oRlxpx5jpm6OvGpnj/6x3YxFWqShejQAPYGqV5CqpPLu4l1wTIbMA0ArUYdY0nGE0yBq0Leooy1NLMUDaPzX+JnxAkFr0ii4EEueSxWnUYDiBJjV35q4ELfWoikCgNHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770665572; c=relaxed/simple;
	bh=fesA/G7VZxxGIydyRYLiHx2PzdJvExsjsxS5xUruvz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DM8gmfftRVN8UiqDtvPxpcSqZGYD9jIW+8D8mfH1Jf0SnNGylC+8BRDvr6s8tu4HixXcHm+0NGEV9zknvt8BXR+ezfj3n7gP+XMwNoGU/q6nDBNz/Fy+deRTswewDfO2XVOTjmMmMh2xFjqJL0zKnnWPS2zW6zhtORNEJPiDydY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sSmmHDlc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sSmmHDlc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 489FA40C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770665571; bh=sANzSvFr6Cl0aKz6SU9xr/MQzcm8MulIlAB5LhDHzMg=;
	h=From:To:Cc:Subject:Date:From;
	b=sSmmHDlcGOdiYA+OIiWP+qLB1dYAYofg6XU5O5QkVyHW2oeyp4B+K37y5/HUgjLEN
	 tFRBXOzhLcQGryr6/lzwemjJbg9zRP1wRGA8YikMac4e8g+HjJ11mntT9ynYz3FaH8
	 iMmAG0xd/baJWsvUY/76ZL52cTRYOS6Cl73OjYm8gKpiO7ugL24h3etTGk9x5D/cHg
	 z7GEMXaaQLBtDkKQRTL3TIpOJZ6Ohd2+tubaWV54iKL4RrdpvE+muNHzx5qGFuERvS
	 HtAoCm9NHELxTyNukj01L77pFhh7A7CXYwcow2XklMRfHdMJFjjZOuHUJLuncahp/d
	 CUi9Ri6o0pNQw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 489FA40C3E;
	Mon,  9 Feb 2026 19:32:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>
Subject: [GIT PULL] Documentation for 7.0
Date: Mon, 09 Feb 2026 12:32:50 -0700
Message-ID: <87ikc590gt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9448598b22c50c8a5bb77a9103e2d49f134c9578:

  Linux 6.19-rc2 (2025-12-21 15:52:04 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.0

for you to fetch changes up to 0a83293322fde69f1fb4722bd3c79c2d52eef436:

  doc: development-process: add notice on testing (2026-02-02 10:02:05 -070=
0)

----------------------------------------------------------------
A slightly calmer cycle for docs this time around, though there is still a
fair amount going on, including:

- Some signs of life on the long-moribund Japanese translation

- Documentation on policies around the use of generative tools for patch
  submissions, and a separate document intended for consumption by
  generative tools.

- The completion of the move of the documentation tools to tools/docs.  For
  now we're leaving a /scripts/kernel-doc symlink behind to avoid breaking
  scripts.

- Ongoing build-system work includes the incorporation of documentation in
  Python code, better support for documenting variables, and lots of
  improvements and fixes.

- Automatic linking of man-page references -- cat(1), for example -- to
  the online pages in the HTML build.

...and the usual array of typo fixes and such.

Additional notes:

The removal of a bunch of indexing boilerplate has created a few merge
conflicts with various trees; the resolution is generally to take both
sides for every index.rst collision.

The kernel.org tree is new, but how I plan to do things in the future;
hopefully it's all set up right.  If all else fails, the git.lwn.net
tree is still current as well:

  git://git.lwn.net/linux.git tags/docs-7.0

----------------------------------------------------------------
Addison English (1):
      docs: fix typo in clang-format documentation

Akiyoshi Kurita (4):
      docs: keystone: fix typo in knav-qmss documentation
      docs: spufs: fix ppc64 architecture line break
      docs: ja_JP: Start translation of submitting-patches
      docs: ja_JP: process: translate 'Obtain a current source tree'

Andy Shevchenko (1):
      docs: Update documentation to avoid mentioning of kernel.h

Bagas Sanjaya (3):
      Documentation: kernel-hacking: Remove current macro annotation
      Documentation: kernel-hacking: Do not italicize EXPORT_SYMBOL{,_GPL}(=
) references
      Documentation: kernel-hacking: Convert internal links

Changbin Du (1):
      tools: jobserver: Prevent deadlock caused by incorrect jobserver conf=
iguration and enhance error reporting

Chen Pei (1):
      docs: kbuild: Fix typos in makefiles.rst

Danilo Krummrich (1):
      driver-core: improve driver binding documentation

Dave Hansen (1):
      Documentation: Provide guidelines for tool-generated content

Diego Viola (1):
      CREDITS: add whitespace before opening parentheses

Dmitry Antipov (1):
      doc: development-process: add notice on testing

Gabriel Whigham (1):
      docs: ioctl-number: fix a typo in ioctl-number.rst

Geert Uytterhoeven (1):
      Documentation: mailbox: mbox_chan_ops.flush() is optional

Jani Nikula (1):
      Documentation: use a source-read extension for the index link boilerp=
late

Jonathan Corbet (8):
      Merge branch 'mauro-vars' into docs-mw
      docs: kdoc: remove support for an external kernel-doc from sphinx
      docs: kdoc: move kernel-doc to tools/docs
      docs: sphinx-build-wrapper: stop setting kerneldoc_bin for Sphinx
      docs: add a scripts/kernel-doc symbolic link
      jobserver: Split up the big try: block
      Merge branch 'mauro' into docs-mw
      Merge branch 'mauro' into docs-mw

Lukas Bulwahn (2):
      Documentation: update config name in real-time architecture support
      MAINTAINERS: Add doc files on real-time support to Real-time Linux

Marc Herbert (1):
      docs: make kptr_restrict and hash_pointers reference each other

Masaharu Noguchi (3):
      docs/ja_JP: fix typos and duplicated phrases in kernel development gu=
ide
      docs/ja_JP: fix translation of freestanding C environment
      docs/ja_JP: fix typos in submit-checklist.rst

Mauro Carvalho Chehab (41):
      kernel-doc: add support for handling global variables
      kernel-doc: add support to handle DEFINE_ variables
      docs: media: v4l2-ioctl.h: document two global variables
      docs: kernel-doc.rst: don't let automarkup mangle with consts
      docs: kernel-doc.rst: document the new "var" kernel-doc markup
      docs: kernel-doc.rst: Parse DEFINE_ macros without prefixes
      docs: kdoc: fix logic to handle unissued warnings
      docs: kdoc: avoid error_count overflows
      docs: kdoc: ensure that comments are using our coding style
      docs: kdoc: some fixes to kernel-doc comments
      docs: kdoc: move the return values to the helper message
      docs: kdoc: improve description of MsgFormatter
      docs: conf.py: get rid of the now unused kerneldoc_bin env var
      docs: custom.css: prevent li marker to override text
      docs: conf.py: don't use doctree with a different meaning
      docs: conf: don't rely on cwd to get documentation location
      docs: enable Sphinx autodoc extension to allow documenting python
      docs: custom.css: add CSS for python
      docs: kdoc: latex_fonts: Improve docstrings and comments
      docs: kdoc_files: Improve docstrings and comments
      docs: kdoc_item: Improve docstrings and comments
      docs: kdoc_parser: Improve docstrings and comments
      docs: kdoc_output: Improve docstrings and comments
      docs: kdoc_re: Improve docstrings and comments
      docs: kdoc: parse_data_structs: Improve docstrings and comments
      docs: kdoc: enrich_formatter: Improve docstrings and comments
      docs: kdoc: python_version: Improve docstrings and comments
      docs: add kernel-doc modules documentation
      docs: add kabi modules documentation
      docs: python: abi_parser: do some improvements at documentation
      docs: python: abi_regex: do some improvements at documentation
      docs: kabi: system_symbols: end docstring phrases with a dot
      docs: kabi: helpers: add helper for debug bits 7 and 8
      docs: kabi: helpers: add documentation for each "enum" value
      docs: add jobserver module documentation
      docs: jobserver: do some documentation improvements
      docs: add parse_features module documentation
      docs: parse_features: make documentation more consistent
      docs: kdoc: Fix pdfdocs build for tools
      docs: sphinx-build-wrapper: allow -v override -q
      tools: sphinx-build-wrapper: improve its help message

Max Nikulin (2):
      docs: admin: devices: /dev/sr<N> for SCSI CD-ROM
      docs: admin: devices: remove /dev/cdwriter

Mustafa Elrasheid (1):
      docs: Makefile: wrap SPHINXDIRS help text

Nauman Sabir (1):
      Documentation: Fix typos and grammatical errors

Petr Vorel (5):
      Documentation: bug-hunting.rst: Remove wrong 'file:' syntax
      Documentation/trace: Fix links to other documents
      Documentation: Remove :manpage: from non-existing man pages
      Documentation: Link man pages to https://man7.org/
      Documentation: CSS: Improve man page font

Randy Dunlap (2):
      docs: find-unused-docs.sh: fixup directory usage
      docs: filesystems: add fs/open.c to api-summary

Rhys Tumelty (1):
      docs: fix 're-use' -> 'reuse' in documentation

Sasha Levin (1):
      docs: add AI Coding Assistants documentation

Sebastian Andrzej Siewior (1):
      Documentation: Add some hardware hints for real-time

SeongJae Park (2):
      docs: submitting-patches: suggest adding previous version links
      Docs/translations/ko_KR: remove memory-barriers

Shuah Khan (1):
      MAINTAINERS: Update for the doc subsystem

Shubham Sharma (1):
      Documentation: arm: keystone: update DT binding reference

Soham Metha (1):
      Documentation/rv: Fix dead link to monitor_synthesis.rst

Steven Price (1):
      kdoc: allow dots in inline @param names

Thomas B=C3=B6hler (1):
      docs: filesystems: ensure proc pid substitutable is complete

Thomas Wei=C3=9Fschuh (4):
      tools/docs: sphinx-build-wrapper: generate rust docs only once
      tools/docs: sphinx-build-wrapper: make 'rustdoc' a local variable
      tools/docs: sphinx-build-wrapper: compute sphinxdirs_list earlier
      tools/docs: sphinx-build-wrapper: only generate rust docs when reques=
ted

Thorsten Blum (2):
      Documentation: kernel-hacking: Remove comma
      Documentation: kernel-hacking: Remove :c:func: annotations

Uwe Kleine-K=C3=B6nig (1):
      Documentation: Improve wording on requirements for a free Nitrokey

Vincent Mailhol (2):
      docs: process: email-client: add Thunderbird "Toggle Line Wrap" exten=
sion
      doc-guide: kernel-doc: specify that W=3Dn does not check header files

Volodymyr Kot (1):
      Doc: correct spelling and wording mistakes

Willy Tarreau (1):
      Documentation: insist on the plain-text requirement for security repo=
rts

Wu Canhong (1):
      doc: input: fix typos in input.rst

Yiwei Lin (1):
      scsi: docs: Add description for missing options of link_power_managem=
ent_policy

Yu Liao (1):
      Documentation/kernel-parameters: Add tsa under mitigations=3Doff

junan (1):
      doc: kgdb: Add description about rodata=3Doff kernel parameter

wheatfox (1):
      docs: automarkup.py: Skip common English words as C identifiers

 CREDITS                                            |    8 +-
 Documentation/ABI/testing/pstore                   |    2 +-
 Documentation/Makefile                             |    3 +-
 Documentation/RCU/index.rst                        |    7 -
 Documentation/accel/index.rst                      |    7 -
 Documentation/admin-guide/README.rst               |    2 +-
 Documentation/admin-guide/aoe/index.rst            |    7 -
 Documentation/admin-guide/auxdisplay/index.rst     |    7 -
 Documentation/admin-guide/bug-hunting.rst          |    6 +-
 Documentation/admin-guide/cgroup-v1/hugetlb.rst    |   18 +-
 Documentation/admin-guide/cgroup-v1/index.rst      |    7 -
 Documentation/admin-guide/cgroup-v2.rst            |    2 +-
 Documentation/admin-guide/cifs/index.rst           |    7 -
 Documentation/admin-guide/device-mapper/index.rst  |    7 -
 Documentation/admin-guide/devices.rst              |   10 +-
 Documentation/admin-guide/devices.txt              |    6 +-
 Documentation/admin-guide/gpio/index.rst           |    7 -
 Documentation/admin-guide/index.rst                |    7 -
 Documentation/admin-guide/initrd.rst               |    2 +-
 Documentation/admin-guide/kdump/index.rst          |    7 -
 Documentation/admin-guide/kdump/kdump.rst          |    2 +-
 Documentation/admin-guide/kernel-parameters.txt    |    4 +
 Documentation/admin-guide/mm/nommu-mmap.rst        |    2 +-
 Documentation/admin-guide/sysctl/kernel.rst        |    3 +
 Documentation/arch/arc/index.rst                   |    7 -
 Documentation/arch/arm/index.rst                   |    8 -
 Documentation/arch/arm/keystone/knav-qmss.rst      |    2 +-
 Documentation/arch/arm/keystone/overview.rst       |    2 +-
 Documentation/arch/arm64/arm-acpi.rst              |    4 +-
 Documentation/arch/arm64/index.rst                 |    7 -
 Documentation/arch/loongarch/index.rst             |    7 -
 Documentation/arch/m68k/index.rst                  |    7 -
 Documentation/arch/mips/index.rst                  |    7 -
 Documentation/arch/openrisc/index.rst              |    7 -
 Documentation/arch/parisc/index.rst                |    7 -
 Documentation/arch/powerpc/index.rst               |    7 -
 Documentation/arch/riscv/index.rst                 |    7 -
 Documentation/arch/s390/driver-model.rst           |    2 +-
 Documentation/arch/s390/index.rst                  |    7 -
 Documentation/arch/x86/shstk.rst                   |    2 +-
 Documentation/bpf/index.rst                        |    7 -
 Documentation/cdrom/index.rst                      |    7 -
 Documentation/conf.py                              |   55 +-
 Documentation/core-api/index.rst                   |    7 -
 Documentation/core-api/kho/index.rst               |    2 -
 Documentation/core-api/kobject.rst                 |    2 +-
 .../core-api/real-time/architecture-porting.rst    |    3 +-
 Documentation/core-api/real-time/hardware.rst      |  132 +
 Documentation/core-api/real-time/index.rst         |    1 +
 Documentation/dev-tools/checkpatch.rst             |    2 +-
 Documentation/dev-tools/clang-format.rst           |    2 +-
 Documentation/dev-tools/index.rst                  |    8 -
 Documentation/doc-guide/index.rst                  |    7 -
 Documentation/doc-guide/kernel-doc.rst             |   63 +-
 Documentation/driver-api/80211/index.rst           |    7 -
 Documentation/driver-api/basics.rst                |   17 +-
 Documentation/driver-api/coco/index.rst            |    2 -
 Documentation/driver-api/crypto/iaa/index.rst      |    7 -
 Documentation/driver-api/crypto/index.rst          |    7 -
 Documentation/driver-api/cxl/index.rst             |    2 -
 Documentation/driver-api/dmaengine/index.rst       |    7 -
 Documentation/driver-api/driver-model/binding.rst  |    9 +-
 .../driver-api/driver-model/design-patterns.rst    |    2 +-
 Documentation/driver-api/driver-model/index.rst    |    7 -
 Documentation/driver-api/early-userspace/index.rst |    7 -
 Documentation/driver-api/firmware/index.rst        |    7 -
 Documentation/driver-api/index.rst                 |    7 -
 Documentation/driver-api/mailbox.rst               |    2 +-
 Documentation/driver-api/memory-devices/index.rst  |    7 -
 Documentation/driver-api/pci/index.rst             |    7 -
 Documentation/driver-api/phy/index.rst             |    8 -
 Documentation/driver-api/phy/phy.rst               |    2 +-
 Documentation/driver-api/pm/index.rst              |    7 -
 Documentation/driver-api/serial/index.rst          |    7 -
 Documentation/driver-api/soundwire/index.rst       |    7 -
 .../surface_aggregator/clients/index.rst           |    7 -
 .../driver-api/surface_aggregator/index.rst        |    7 -
 Documentation/driver-api/tty/tty_ldisc.rst         |    2 +-
 Documentation/driver-api/usb/gadget.rst            |    2 +-
 Documentation/driver-api/usb/index.rst             |    7 -
 Documentation/driver-api/xilinx/index.rst          |    7 -
 Documentation/fault-injection/index.rst            |    7 -
 Documentation/fb/index.rst                         |    7 -
 Documentation/filesystems/api-summary.rst          |    3 +
 Documentation/filesystems/erofs.rst                |    2 +-
 Documentation/filesystems/proc.rst                 |    6 +-
 Documentation/filesystems/relay.rst                |    2 +-
 Documentation/filesystems/resctrl.rst              |    2 +-
 Documentation/filesystems/spufs/spu_create.rst     |    4 +-
 Documentation/filesystems/spufs/spu_run.rst        |    4 +-
 .../firmware-guide/acpi/DSD-properties-rules.rst   |    2 +-
 Documentation/firmware-guide/acpi/enumeration.rst  |    2 +-
 Documentation/fpga/index.rst                       |    7 -
 Documentation/gpu/drivers.rst                      |    7 -
 Documentation/gpu/index.rst                        |    7 -
 Documentation/hwmon/index.rst                      |    7 -
 Documentation/i2c/index.rst                        |    7 -
 Documentation/infiniband/index.rst                 |    7 -
 Documentation/input/devices/index.rst              |    7 -
 Documentation/input/gamepad.rst                    |    2 +-
 Documentation/input/index.rst                      |    7 -
 Documentation/input/input.rst                      |    2 +-
 Documentation/isdn/index.rst                       |    7 -
 Documentation/kbuild/index.rst                     |    7 -
 Documentation/kbuild/kbuild.rst                    |    2 +-
 Documentation/kbuild/kconfig-language.rst          |    2 +-
 Documentation/kbuild/makefiles.rst                 |    2 +-
 Documentation/kernel-hacking/hacking.rst           |  183 +-
 Documentation/livepatch/index.rst                  |    7 -
 Documentation/locking/index.rst                    |    7 -
 Documentation/mhi/index.rst                        |    7 -
 Documentation/netlabel/index.rst                   |    7 -
 .../networking/device_drivers/atm/index.rst        |    7 -
 .../networking/device_drivers/can/index.rst        |    7 -
 .../networking/device_drivers/cellular/index.rst   |    7 -
 .../networking/device_drivers/ethernet/index.rst   |    7 -
 .../ethernet/mellanox/mlx5/index.rst               |    7 -
 .../networking/device_drivers/fddi/index.rst       |    7 -
 .../networking/device_drivers/hamradio/index.rst   |    7 -
 Documentation/networking/device_drivers/index.rst  |    7 -
 .../networking/device_drivers/wifi/index.rst       |    7 -
 .../networking/device_drivers/wwan/index.rst       |    7 -
 Documentation/networking/diagnostic/index.rst      |    7 -
 Documentation/networking/index.rst                 |    7 -
 Documentation/pcmcia/index.rst                     |    7 -
 Documentation/peci/index.rst                       |    7 -
 Documentation/power/index.rst                      |    7 -
 Documentation/process/1.Intro.rst                  |    2 +-
 Documentation/process/2.Process.rst                |    2 +-
 Documentation/process/4.Coding.rst                 |    6 +-
 Documentation/process/5.Posting.rst                |    7 +-
 Documentation/process/7.AdvancedTopics.rst         |    2 +-
 Documentation/process/adding-syscalls.rst          |   20 +-
 Documentation/process/changes.rst                  |    2 +-
 Documentation/process/coding-assistants.rst        |   59 +
 Documentation/process/coding-style.rst             |   12 +-
 Documentation/process/debugging/index.rst          |    9 -
 Documentation/process/debugging/kgdb.rst           |    7 +
 Documentation/process/email-clients.rst            |    9 +-
 Documentation/process/generated-content.rst        |  109 +
 Documentation/process/index.rst                    |    9 +-
 Documentation/process/maintainer-pgp-guide.rst     |    4 +-
 Documentation/process/security-bugs.rst            |    6 +-
 Documentation/process/submitting-patches.rst       |    6 +-
 Documentation/rust/index.rst                       |    7 -
 Documentation/scheduler/index.rst                  |    7 -
 Documentation/scsi/ChangeLog.sym53c8xx             |    6 +-
 .../scsi/link_power_management_policy.rst          |   23 +-
 Documentation/sound/hd-audio/notes.rst             |    2 +-
 Documentation/sound/index.rst                      |    7 -
 Documentation/sphinx-includes/subproject-index.rst |    7 +
 Documentation/sphinx-static/custom.css             |   20 +-
 Documentation/sphinx/automarkup.py                 |   10 +
 Documentation/sphinx/kerneldoc.py                  |   60 +-
 Documentation/spi/index.rst                        |    7 -
 Documentation/staging/rpmsg.rst                    |    7 +-
 Documentation/target/index.rst                     |    7 -
 Documentation/tee/index.rst                        |    7 -
 Documentation/timers/index.rst                     |    7 -
 Documentation/tools/feat.rst                       |   10 +
 Documentation/tools/index.rst                      |    8 +-
 Documentation/tools/jobserver.rst                  |   10 +
 Documentation/tools/kabi.rst                       |   13 +
 Documentation/tools/kabi_helpers.rst               |   11 +
 Documentation/tools/kabi_parser.rst                |   10 +
 Documentation/tools/kabi_regex.rst                 |   10 +
 Documentation/tools/kabi_symbols.rst               |   10 +
 Documentation/tools/kdoc.rst                       |   12 +
 Documentation/tools/kdoc_ancillary.rst             |   46 +
 Documentation/tools/kdoc_output.rst                |   14 +
 Documentation/tools/kdoc_parser.rst                |   29 +
 Documentation/tools/python.rst                     |   13 +
 Documentation/tools/rtla/index.rst                 |    7 -
 Documentation/tools/rv/index.rst                   |    7 -
 Documentation/trace/fprobe.rst                     |    2 +-
 Documentation/trace/ftrace-uses.rst                |    2 +-
 Documentation/trace/index.rst                      |    7 -
 .../trace/rv/da_monitor_instrumentation.rst        |    6 +-
 .../translations/it_IT/doc-guide/kernel-doc.rst    |    8 +-
 .../translations/it_IT/process/adding-syscalls.rst |   16 +-
 Documentation/translations/ja_JP/index.rst         |    1 +
 Documentation/translations/ja_JP/process/howto.rst |    6 +-
 .../ja_JP/process/submit-checklist.rst             |    4 +-
 .../ja_JP/process/submitting-patches.rst           |   56 +
 .../ko_KR/core-api/wrappers/memory-barriers.rst    |   18 -
 Documentation/translations/ko_KR/index.rst         |    1 -
 .../translations/ko_KR/memory-barriers.txt         | 2952 ----------------=
----
 .../translations/sp_SP/process/adding-syscalls.rst |   16 +-
 .../translations/sp_SP/process/coding-style.rst    |    2 +-
 .../translations/zh_CN/doc-guide/kernel-doc.rst    |   10 +-
 Documentation/translations/zh_CN/kbuild/kbuild.rst |    2 +-
 .../translations/zh_CN/process/coding-style.rst    |    2 +-
 .../translations/zh_TW/process/coding-style.rst    |    2 +-
 Documentation/usb/index.rst                        |    7 -
 Documentation/userspace-api/gpio/index.rst         |    7 -
 Documentation/userspace-api/index.rst              |    7 -
 Documentation/userspace-api/ioctl/ioctl-number.rst |    2 +-
 Documentation/virt/index.rst                       |    7 -
 Documentation/w1/index.rst                         |    7 -
 Documentation/watchdog/index.rst                   |    7 -
 Documentation/wmi/devices/index.rst                |    7 -
 Documentation/wmi/index.rst                        |    8 -
 MAINTAINERS                                        |    5 +-
 Makefile                                           |    2 +-
 README                                             |   12 +
 drivers/gpu/drm/i915/Makefile                      |    2 +-
 include/linux/util_macros.h                        |    2 +-
 include/media/v4l2-ioctl.h                         |   15 +
 scripts/kernel-doc                                 |    2 +-
 tools/docs/find-unused-docs.sh                     |    4 +-
 scripts/kernel-doc.py =3D> tools/docs/kernel-doc     |   89 +-
 tools/docs/sphinx-build-wrapper                    |  125 +-
 tools/lib/python/abi/abi_parser.py                 |   33 +-
 tools/lib/python/abi/abi_regex.py                  |   26 +-
 tools/lib/python/abi/helpers.py                    |   42 +-
 tools/lib/python/abi/system_symbols.py             |   14 +-
 tools/lib/python/feat/parse_features.py            |   27 +-
 tools/lib/python/jobserver.py                      |  158 +-
 tools/lib/python/kdoc/enrich_formatter.py          |   20 +-
 tools/lib/python/kdoc/kdoc_files.py                |   23 +-
 tools/lib/python/kdoc/kdoc_item.py                 |   18 +
 tools/lib/python/kdoc/kdoc_output.py               |  104 +-
 tools/lib/python/kdoc/kdoc_parser.py               |  287 +-
 tools/lib/python/kdoc/kdoc_re.py                   |   28 +-
 tools/lib/python/kdoc/latex_fonts.py               |   95 +-
 tools/lib/python/kdoc/parse_data_structs.py        |   62 +-
 tools/lib/python/kdoc/python_version.py            |   20 +-
 227 files changed, 1806 insertions(+), 4378 deletions(-)
 create mode 100644 Documentation/core-api/real-time/hardware.rst
 create mode 100644 Documentation/process/coding-assistants.rst
 create mode 100644 Documentation/process/generated-content.rst
 create mode 100644 Documentation/sphinx-includes/subproject-index.rst
 create mode 100644 Documentation/tools/feat.rst
 create mode 100644 Documentation/tools/jobserver.rst
 create mode 100644 Documentation/tools/kabi.rst
 create mode 100644 Documentation/tools/kabi_helpers.rst
 create mode 100644 Documentation/tools/kabi_parser.rst
 create mode 100644 Documentation/tools/kabi_regex.rst
 create mode 100644 Documentation/tools/kabi_symbols.rst
 create mode 100644 Documentation/tools/kdoc.rst
 create mode 100644 Documentation/tools/kdoc_ancillary.rst
 create mode 100644 Documentation/tools/kdoc_output.rst
 create mode 100644 Documentation/tools/kdoc_parser.rst
 create mode 100644 Documentation/tools/python.rst
 create mode 100644 Documentation/translations/ja_JP/process/submitting-pat=
ches.rst
 delete mode 100644 Documentation/translations/ko_KR/core-api/wrappers/memo=
ry-barriers.rst
 delete mode 100644 Documentation/translations/ko_KR/memory-barriers.txt
 rename scripts/kernel-doc.py =3D> tools/docs/kernel-doc (88%)
