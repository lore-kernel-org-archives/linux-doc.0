Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46576C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 21:03:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F97B64DE0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 21:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhBOVDB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 16:03:01 -0500
Received: from ms.lwn.net ([45.79.88.28]:60580 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229923AbhBOVC6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Feb 2021 16:02:58 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 79F93733;
        Mon, 15 Feb 2021 21:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 79F93733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1613422931; bh=wUTeGNRP/gSSt5CapF2oZXn4SjieixV3CfkItIeLZHE=;
        h=From:To:Cc:Subject:Date:From;
        b=qaSEqaKilGZ2/GQNbEQL92wi7KyOsh/COyIaCkhc/vE1lCFp43Cwxfe/PIG5Fyp1i
         YfSIcI4ufx3W1CdwxJjAci/fpZ2LcgqG2Ezp8p0CzJNlD0rphWlVhbGknWEH6thwQK
         SCofm4wl7GjVMh40iUEJDZs+4gcDYXB2ZJDfYd5Wg4LkVJRpCYJ5OXM8LDE/7hOfdc
         QsIi8gU3UUvxMukaRKLbLYVxSSs0sH/xJarUMDoTx39MpHVx5Bz+p4DcnhTkDpTbkf
         dfPaPvEbmemwoPMcNXA38rZveUXJxMcgdLzdi+aFegphItHG8/fKguwXoG+UxBqxbt
         Wmy/aALsFmwpQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation for 5.12
Date:   Mon, 15 Feb 2021 14:02:10 -0700
Message-ID: <87lfbpjb8t.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-5.12

for you to fetch changes up to 3c2e0a489da6a7c48ad67a246c7a287fcb4a4607:

  docs: kernel-hacking: be more civil (2021-02-11 10:00:40 -0700)

----------------------------------------------------------------
It has been a relatively quiet cycle in docsland.

 - As promised, the minimum Sphinx version to build the docs is now 1.7,
   and we have dropped support for Python 2 entirely.  That allowed the
   removal of a bunch of compatibility code.

 - A set of treewide warning fixups from Mauro that I applied after it
   became clear nobody else was going to deal with them.

 - The automarkup mechanism can now create cross-references from relative
   paths to RST files.

 - More translations, typo fixes, and warning fixes.

No conflicts with any other tree as far as I know.

----------------------------------------------------------------
Alex Shi (1):
      docs/zh_CN: remove cn_index tag in mips

Andr=C3=A9 Almeida (2):
      docs: Make syscalls' helpers naming consistent
      Documentation: admin-guide: Update kvm/xen config option

Baruch Siach (1):
      Documentation: ARM: fix reference to DT format documentation

Bhaskar Chowdhury (1):
      docs: kernel-hacking: be more civil

Borislav Petkov (1):
      Documentation/submitting-patches: Add blurb about backtraces in commi=
t messages

Cao jin (1):
      Documentation/x86/boot.rst: Correct the example of SETUP_INDIRECT

Colin Ian King (1):
      doc/admin-guide: fix spelling mistake: "perfomance" -> "performance"

Eric Curtin (1):
      Update Documentation/admin-guide/sysctl/fs.rst

Flavio Suligoi (1):
      docs: thermal: fix spelling mistakes

Florian Fainelli (1):
      Documentation/admin-guide: kernel-parameters: Update nohlt section

Hao Li (1):
      Documentation/dax: Update description of DAX policy changing

Jiang Biao (1):
      Documentation: Fix typos found in cgroup-v2.rst

Joe Pater (1):
      Documentation: kernel-hacking: change 'current()' to 'current'

Joe Perches (2):
      Documentation: Replace lkml.org links with lore
      coding-style.rst: Avoid comma statements

Johannes Thumshirn (1):
      Documentation: document dma device use for mcb

Jonathan Corbet (2):
      Move our minimum Sphinx version to 1.7
      Docs: drop Python 2 support

Jonathan Neusch=C3=A4fer (1):
      docs: Include ext4 documentation via filesystems/

Kir Kolyshkin (9):
      docs/scheduler/sched-bwc: formatting fix
      docs/scheduler/sched-design-CFS: formatting fix
      docs/scheduler/sched-bwc: fix note rendering
      docs/scheduler/sched-bwc: note/link cgroup v2
      docs/admin-guide: cgroup-v2: typos and spaces
      docs/admin-guide: cgroup-v2: fix cgroup.type rendering
      doc/admin-guide/cgroup-v2: use tables
      docs/admin-guide/cgroup-v2: nit
      docs/admin-guide/cgroup-v2: fix mount opt rendering

Lee Jones (1):
      docs: submitting-patches: Emphasise the requirement to Cc: stable whe=
n using Fixes: tag

Liao Pingfang (1):
      docs: filesystems: vfs: Correct the struct name

Lukas Bulwahn (3):
      doc/zh_CN: adjust table markup in mips/ingenic-tcu.rst
      doc/zh_CN: mips: use doc references instead
      arch/Kconfig: update a broken file reference

Marc Koderer (2):
      samples/kprobes: Remove misleading comment
      samples/kprobes: Add ARM support

Mauro Carvalho Chehab (11):
      scripts: kernel-doc: validate kernel-doc markup with the actual names
      parport: fix a kernel-doc markup
      rapidio: fix kernel-doc a markup
      fs: fix kernel-doc markups
      pstore/zone: fix a kernel-doc markup
      firmware: stratix10-svc: fix kernel-doc markups
      connector: fix a kernel-doc markup
      lib/crc7: fix a kernel-doc markup
      memblock: fix kernel-doc markups
      w1: fix a kernel-doc markup
      selftests: kselftest_harness.h: partially fix kernel-doc markups

Michal Wajdeczko (1):
      scripts/kernel-doc: add internal hyperlink to DOC: sections

Milan Lakhani (2):
      docs: Remove make headers_check from checklist
      docs: Update DTB format references

N=C3=ADcolas F. R. A. Prado (2):
      docs: Enable usage of relative paths to docs on automarkup
      docs: Document cross-referencing using relative path

Pali Roh=C3=A1r (4):
      Documentation: arm: Fix marvell file name
      Documentation: arm: marvell: Add link to public Armada 37xx Hardware =
Spec
      Documentation: arm: marvell: Fix dead link to Armada 37xx Product Bri=
ef
      Documentation: arm: marvell: Update link to unrestricted Armada 38x F=
unctional Spec

Peter Hutterer (1):
      Documentation: input: define ABS_PRESSURE/ABS_MT_PRESSURE resolution =
as grams

Randy Dunlap (3):
      AFS: Documentation: fix a few typos in afs.rst
      Documentation/admin-guide: kernel-parameters: update CMA entries
      Documentation: /proc/loadavg: add 3 more field descriptions

Rolf Eike Beer (1):
      Documentation: fix typos in split page table lock description

SeongJae Park (3):
      Documentation/kokr/howto: Replace HTTP links with HTTPS ones: Documen=
tation/process
      docs/kokr: make reporting-bugs.rst obsolete
      docs/kokr: Link memory-barriers.txt to rst

Thorsten Leemhuis (1):
      docs: process/howto.rst: make sections on bug reporting match practice

Wolfram Sang (1):
      Documentation: kernel-parameters: add missing '<'

Yanteng Si (8):
      doc/zh_CN: add mips index.rst translation
      doc/zh_CN: add mips booting.rst translation
      doc/zh_CN: add mips features.rst translation
      doc/zh_CN: add mips ingenic-tcu.rst translation
      docs: iio: Correct a typo
      docs/zh_CN: add iio iio_configfs.rst translation
      docs/zh_CN: add iio ep93xx_adc.rst translation
      docs: zh_CN: add iio index.rst translation

Yorick de Wid (1):
      docs: Remove the Microsoft rhetoric

 Documentation/RCU/RTFP.txt                         |  94 +++++++++--------=
--
 Documentation/accounting/cgroupstats.rst           |   4 +-
 Documentation/admin-guide/README.rst               |   7 +-
 Documentation/admin-guide/cgroup-v1/memory.rst     |  14 +--
 Documentation/admin-guide/cgroup-v2.rst            |  64 +++++++------
 Documentation/admin-guide/cpu-load.rst             |   2 +-
 Documentation/admin-guide/kernel-parameters.rst    |   2 +-
 Documentation/admin-guide/kernel-parameters.txt    |  19 ++--
 .../admin-guide/kernel-per-CPU-kthreads.rst        |   2 +-
 Documentation/admin-guide/perf-security.rst        |   2 +-
 Documentation/admin-guide/sysctl/fs.rst            |   4 +-
 Documentation/arm/booting.rst                      |   2 +-
 Documentation/arm/index.rst                        |   2 +-
 Documentation/arm/{marvel.rst =3D> marvell.rst}      |   7 +-
 Documentation/conf.py                              |  75 +--------------
 Documentation/devicetree/usage-model.rst           |   2 +-
 Documentation/doc-guide/sphinx.rst                 |  30 ++++--
 Documentation/driver-api/gpio/driver.rst           |   4 +-
 Documentation/driver-api/men-chameleon-bus.rst     |  12 +++
 Documentation/driver-api/thermal/sysfs-api.rst     |   6 +-
 Documentation/filesystems/afs.rst                  |   8 +-
 Documentation/filesystems/dax.txt                  |  17 +---
 Documentation/filesystems/index.rst                |   1 +
 Documentation/filesystems/proc.rst                 |   5 +-
 Documentation/filesystems/vfs.rst                  |   2 +-
 Documentation/gpu/todo.rst                         |   2 +-
 Documentation/iio/ep93xx_adc.rst                   |   2 +-
 Documentation/index.rst                            |  11 ---
 Documentation/input/event-codes.rst                |  15 +++
 Documentation/input/multi-touch-protocol.rst       |   4 +
 Documentation/kernel-hacking/hacking.rst           |   4 +-
 Documentation/kernel-hacking/locking.rst           |   2 +-
 Documentation/power/freezing-of-tasks.rst          |   2 +-
 Documentation/process/adding-syscalls.rst          |  20 ++--
 Documentation/process/coding-style.rst             |  20 +++-
 Documentation/process/howto.rst                    |  20 ++--
 Documentation/process/submit-checklist.rst         |  14 ++-
 Documentation/process/submitting-patches.rst       |  29 +++++-
 Documentation/scheduler/sched-bwc.rst              |  17 +++-
 Documentation/scheduler/sched-deadline.rst         |   2 +-
 Documentation/scheduler/sched-design-CFS.rst       |   6 +-
 Documentation/security/lsm-development.rst         |   2 +-
 Documentation/sphinx/automarkup.py                 |   7 +-
 Documentation/sphinx/cdomain.py                    |   8 +-
 Documentation/sphinx/kernel_abi.py                 |  27 +-----
 Documentation/sphinx/kernel_feat.py                |  25 +----
 Documentation/sphinx/kerneldoc.py                  |  26 +-----
 Documentation/sphinx/kernellog.py                  |  26 ++----
 Documentation/sphinx/kfigure.py                    |  14 +--
 Documentation/sphinx/maintainers_include.py        |   2 -
 Documentation/sphinx/requirements.txt              |   1 -
 Documentation/sphinx/rstFlatTable.py               |  10 --
 Documentation/timers/timers-howto.rst              |   2 +-
 .../translations/it_IT/process/adding-syscalls.rst |  18 ++--
 .../it_IT/process/submitting-patches.rst           |   4 +-
 Documentation/translations/ja_JP/SubmittingPatches |   4 +-
 Documentation/translations/ko_KR/howto.rst         |   4 +-
 Documentation/translations/ko_KR/index.rst         |  15 +++
 .../translations/zh_CN/admin-guide/cpu-load.rst    |   2 +-
 Documentation/translations/zh_CN/arm/Booting       |   2 +-
 .../translations/zh_CN/iio/ep93xx_adc.rst          |  46 ++++++++++
 .../translations/zh_CN/iio/iio_configfs.rst        | 102 +++++++++++++++++=
++++
 Documentation/translations/zh_CN/iio/index.rst     |  20 ++++
 Documentation/translations/zh_CN/mips/booting.rst  |  31 +++++++
 Documentation/translations/zh_CN/mips/features.rst |  10 ++
 Documentation/translations/zh_CN/mips/index.rst    |  26 ++++++
 .../translations/zh_CN/mips/ingenic-tcu.rst        |  69 ++++++++++++++
 .../zh_CN/process/submitting-patches.rst           |   4 +-
 Documentation/vm/split_page_table_lock.rst         |   2 +-
 Documentation/x86/boot.rst                         |   2 +-
 arch/Kconfig                                       |   4 +-
 drivers/parport/share.c                            |   2 +-
 drivers/rapidio/rio.c                              |   2 +-
 fs/dcache.c                                        |  63 ++++++-------
 fs/inode.c                                         |   4 +-
 fs/pstore/zone.c                                   |   2 +-
 fs/seq_file.c                                      |   5 +-
 fs/super.c                                         |  12 +--
 include/linux/connector.h                          |   2 +-
 .../linux/firmware/intel/stratix10-svc-client.h    |  10 +-
 include/linux/memblock.h                           |   4 +-
 include/linux/parport.h                            |  31 +++++++
 include/linux/w1.h                                 |   2 +-
 lib/crc7.c                                         |   2 +-
 samples/kprobes/kprobe_example.c                   |   9 +-
 scripts/kernel-doc                                 |  63 +++++++++----
 scripts/sphinx-pre-install                         |   4 +-
 tools/testing/selftests/kselftest_harness.h        |  26 +++---
 88 files changed, 812 insertions(+), 503 deletions(-)
 rename Documentation/arm/{marvel.rst =3D> marvell.rst} (97%)
 create mode 100644 Documentation/translations/zh_CN/iio/ep93xx_adc.rst
 create mode 100644 Documentation/translations/zh_CN/iio/iio_configfs.rst
 create mode 100644 Documentation/translations/zh_CN/iio/index.rst
 create mode 100644 Documentation/translations/zh_CN/mips/booting.rst
 create mode 100644 Documentation/translations/zh_CN/mips/features.rst
 create mode 100644 Documentation/translations/zh_CN/mips/index.rst
 create mode 100644 Documentation/translations/zh_CN/mips/ingenic-tcu.rst
