Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75783B6C15;
	Mon, 15 Jun 2026 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561226; cv=none; b=oFtxJE70b1cu5wHh7HbCnws98ltDkC2sqjErzcwyIhEOfHRXYIzEl6i/fvtnSbFpNriwgdCnGWk1PG0ok6NSstSYhajxPn2mFQ/l0VC8qapww09SMnTMIhqgfDlGGSTRk2poL3umpDrYYMOHH2ABdlOFakuiTUGvH+YgyHzD/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561226; c=relaxed/simple;
	bh=DxPRd0yLBidKc79CwQXMWGR7E/ul4+6cy2nqVxfcL6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ntP+STA0ZNN60E5fJEfwD6K7MTol8zfIwVW+ecBUI2q6lbGeCVqvciMPFxK3P2ysn0YqPyuoJsZvLDa/xsMVaREbJIA25c2LE6pN/Hhg8NZoVtbhW8Df1iwuWjukfxdlF3XOawKtD1Xha/SnmAcsgaAbKUELodwAo84QK48C8Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rcqR6J/j; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rcqR6J/j"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1F7A740430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781561224; bh=dq90/nAwbXnuuadnTS5KVjyk0x0NfuSb52mKQ6IxBDU=;
	h=From:To:Cc:Subject:Date:From;
	b=rcqR6J/jQyem1oSHXzOjuE1rThusIHn/j6L7jQFAycN5jzCpZcym++zUFLoYcftCX
	 eixeHAvAGlnkBKqVofeCne131CLyxqE17Qez5k+ceTVu/cjt4xXnwjxJTcsGNKp3mL
	 6rA7pSbibLflTwn/NEzz2NyG4uVQEHxWcnIxJpeaEaEIRklDMpiytCUeQUhO6ZDS/f
	 XoiY21YKbzDguOhhzBvqkGYAinAAWJCkwl4ZvwI2opHaFtQjYHz07wkhL6mnIRi4mY
	 rnSBx7yBNwJE+uRQpcKz5P2LbGxTp5WmtKaobZnyYEjgSgEzoSLzxjU3FP7Rd6zG/w
	 2C25p7xFOziLg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1F7A740430;
	Mon, 15 Jun 2026 22:07:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] Documentation for 7.2
Date: Mon, 15 Jun 2026 16:07:03 -0600
Message-ID: <874ij3xxtk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit f2e65e4e5b4b4b9ecf43f03c3fdbe8c9a8a43a9e:

  docs: threat-model: don't limit root capabilities to CAP_SYS_ADMIN (2026-=
05-14 06:23:44 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.2

for you to fetch changes up to fa34b01aa0f59355206b0807f862cced06c2b7a1:

  docs: pt_BR: Translate 3.Early-stage.rst into Portuguese (2026-06-12 13:3=
4:26 -0600)

----------------------------------------------------------------
Things have calmed down a bit on the docs front, with no earthshaking
changes this time around:

- Ongoing work on the Japanese and Portuguese translations.

- Better integration of the MAINTAINERS file into the rendered documents,
  including a search interface.

- A seemingly infinite supply of fixes for typos, minor grammatical issues,
  and related problems that LLMs find with abandon.

Expect a minor conflict with the kbuild tree on the Portuguese version
of changes.rst.
----------------------------------------------------------------
Akiyoshi Kurita (3):
      docs/ja_JP: translate more of submitting-patches.rst
      docs/ja_JP: translate more of submitting-patches.rst (no-mime)
      docs/ja_JP: translate submitting-patches.rst (interleaved-replies)

Amanda Corr=C3=AAa (2):
      docs: pt_BR: update maintainer-handbooks
      docs: pt_BR: update "Purpose of Defconfigs" section in maintainer-soc=
.rst

Baolin Liu (1):
      Documentation: proc: fix section numbering in table of contents

Baruch Siach (1):
      docs: threat-model: add missing closing parenthesis

Brigham Campbell (1):
      docs: Fix minor grammatical error

Chao Gao (1):
      Documentation: core-api/cpu_hotplug: Remove stale cpu0_hotplug docs

Charlie Jenkins (1):
      Documentation/binfmt-misc.rst: Specify aux vector for "O" flag descri=
ption

Chen-Shi-Hong (1):
      docs: reporting-issues: replace "these advices" with "all of this adv=
ice"

Cheng-Han Wu (4):
      docs: admin-guide: fix typos in workload tracing guide
      docs: admin-guide: fix stress-ng command examples
      docs: admin-guide: clarify perf bench all behavior
      docs: admin-guide: add IGNORE_DIRS example for cscope

Clinton Phillips (1):
      docs: sphinx-static: fix typo "wich" -> "which"

Costa Shulyupin (9):
      docs: Remove stale ISDN parameters
      docs: locking: Fix stale dquot.c path
      docs: housekeeping: Fix struct member access in code example
      docs: sysctl/net: Remove ax25, netrom, rose entries
      docs: kernel-parameters: Remove sa1100ir IrDA parameter
      docs: sonypi: Fix stale header file path
      docs: kgdb: Fix stale source file paths
      docs: real-time: Fix duplicated sched(7) text
      docs: kernel-parameters: Fix stale sticore file paths

Daniel Pereira (6):
      docs/pt_BR: process: link maintainer-kvm-x86 in maintainer-handbooks
      docs: pt_BR: translate process/license-rules.rst
      docs: pt_BR: Translate process/kernel-docs.rst into Portuguese
      docs: pt_BR: update minimal software requirements in changes.rst
      docs: pt_BR: add translation for kernel development process guides
      docs: pt_BR: Translate 3.Early-stage.rst into Portuguese

Ethan Nelson-Moore (1):
      docs/{it_it,sp_SP,zh_CN,zh_TW}: update references to removed CONFIG_D=
EBUG_SLAB

Gabriele Monaco (1):
      Documentation/rv: Replace stale website link

Hyeonjin Kim (1):
      docs: fix typos in kernel documentation

Ilai Levin (1):
      docs: driver-api: eisa: add SPDX license identifier

Jim Cromie (2):
      docs/dyndbg: update examples \012 to \n
      docs/dyndbg: explain flags parse 1st

Jinjie Ruan (1):
      docs: Update nosmt support for arm64

Jonathan Corbet (3):
      Merge branch 'mauro' into docs-mw
      Merge branch 'docs-fixes' into docs-mw
      Merge branch 'mauro' into docs-mw

Krzysztof Kozlowski (1):
      docs: submitting-patches: Clarify that "reviewer" is a person

Manuel Ebner (6):
      Documentation: adopt new coding style of type-aware kmalloc-family
      Documentation: RCU: adopt new coding style of type-aware kmalloc-fami=
ly
      Documentation: deprecated.rst: kmalloc-family: mark argument as optio=
nal
      Documentation: arch: fix brackets
      Documentation: process: fix brackets
      Documentation: bug-hunting.rst: fix grammar

Mauro Carvalho Chehab (25):
      docs: maintainers: add SPDX license to the file
      docs: maintainers_include: auto-generate maintainer profile TOC
      docs: auto-generate maintainer entry profile links
      docs: maintainers_include: use a better title for profiles
      docs: maintainers_include: add external profile URLs
      docs: maintainers_include: preserve names for files under process/
      docs: maintainers_include: Only show main entry for profiles
      docs: maintainers_include: improve its output
      docs: maintainers_include: fix support for O=3Ddir
      docs: maintainers_include: parse MAINTAINERS just once
      docs: maintainers_include: keep hidden TOC sorted
      docs: maintainers_include: split state machine on multiple funcs
      docs: maintainers_include: cleanup the code
      docs: maintainers_include: clean most SPHINXDIRS=3Dprocess warnings
      docs: maintainers_include: do some coding style cleanups
      docs: maintainers_include: store maintainers entries on a dict
      docs: maintainers_include: properly handle file patterns
      docs: maintainers_include: add a filtering javascript
      docs: maintainers_include: don't ignore invalid profile entries
      docs: maintainers_include: better handle directories
      docs: maintainers_include: better handle doc wildcards
      MAINTAINERS: make clearer about what's expected for "P" field
      MAINTAINERS: use a URL for pin-init maintainer's profile entry
      docs: maintainers_include: restore compatibility with Python 3.6
      docs: maintainers_include: keep the last entry at the end

Mayank Gite (1):
      Documentation: fix typo and formattting in security/credentials.rst

Miguel Mart=C3=ADn Gil (1):
      docs: md: fix grammar in speed_limit description

Miles Krause (1):
      Documentation/scheduler: Fix duplicated word in sched-deadline

Myro Demma (1):
      docs: proc: fix minor grammar and formatting issues

Nicolas Pitre (2):
      Documentation: filesystems: cramfs: correct stale hard-link and endia=
nness claims
      cramfs: drop obsolete Future Development notes and update tools URL

Ninad Naik (1):
      Documentation: fix spelling mistake "stucture" -> "structure"

Randy Dunlap (8):
      docs: xforms_lists: allow __maybe_unused in func parameters
      docs: watchdog: mlx-wdt: small fixes
      docs: watchdog: pcwd: fix typo and driver info.
      docs: watchdog-api: general cleaning
      docs: watchdog-kernel-api: general cleanups
      docs: watchdog-parameters: add missing watchdog_core parameters
      kdoc: xforms: move context attrs to function_xforms list
      iommu: Documentation: rearrange, update kernel-parameters

Sakurai Shun (2):
      docs: fix typo in leds-lp55xx.rst
      docs: fix typo in user_mode_linux_howto_v2.rst

Sebastian Andrzej Siewior (1):
      Documentation/kernel-parameters: Remove "Deprecated" from isolcpus=3D

Shuicheng Lin (1):
      scripts/kernel-doc: Detect mismatched inline member documentation tags

Tudor Ambarus (1):
      docs: kernel-doc: python: strip __counted_by_ptr macro

Uwe Kleine-K=C3=B6nig (1):
      Documentation: Fix syntax of kmalloc_objs example in coding style doc

Zhan Xusheng (1):
      docs: changes.rst: restore pahole 1.26 minimum (regressed by sort)

Zhang Xiaolei (1):
      docs: staging: fix various typos and grammar issues

 .../RCU/Design/Requirements/Requirements.rst       |   6 +-
 Documentation/RCU/listRCU.rst                      |   2 +-
 Documentation/RCU/whatisRCU.rst                    |   4 +-
 Documentation/admin-guide/binfmt-misc.rst          |   8 +-
 Documentation/admin-guide/bug-hunting.rst          |   4 +-
 Documentation/admin-guide/dynamic-debug-howto.rst  |  35 +-
 Documentation/admin-guide/kernel-parameters.txt    |  72 +--
 Documentation/admin-guide/laptops/sonypi.rst       |   2 +-
 Documentation/admin-guide/md.rst                   |   2 +-
 .../admin-guide/quickly-build-trimmed-linux.rst    |   2 +-
 Documentation/admin-guide/reporting-issues.rst     |   4 +-
 Documentation/admin-guide/sysctl/net.rst           |  11 +-
 Documentation/admin-guide/workload-tracing.rst     |  41 +-
 Documentation/arch/arc/arc.rst                     |   2 +-
 .../arch/arm/samsung/clksrc-change-registers.awk   |   2 +-
 Documentation/arch/arm/vlocks.rst                  |   4 +-
 .../arch/arm64/memory-tagging-extension.rst        |   2 +-
 Documentation/arch/powerpc/vas-api.rst             |   2 +-
 Documentation/arch/sparc/oradax/dax-hv-api.txt     |  18 +-
 Documentation/arch/sparc/oradax/oracle-dax.rst     |   2 +-
 Documentation/arch/x86/x86_64/fsgs.rst             |   4 +-
 Documentation/block/data-integrity.rst             |   2 +-
 Documentation/core-api/cpu_hotplug.rst             |   5 -
 Documentation/core-api/housekeeping.rst            |   2 +-
 Documentation/core-api/kref.rst                    |   4 +-
 Documentation/core-api/list.rst                    |   6 +-
 Documentation/core-api/real-time/theory.rst        |   2 +-
 Documentation/driver-api/eisa.rst                  |   2 +
 Documentation/driver-api/mailbox.rst               |   4 +-
 Documentation/driver-api/media/v4l2-fh.rst         |   2 +-
 Documentation/filesystems/cramfs.rst               |  22 +-
 Documentation/filesystems/locking.rst              |   2 +-
 Documentation/filesystems/proc.rst                 |  18 +-
 Documentation/gpu/drm-uapi.rst                     |   2 +-
 Documentation/kernel-hacking/locking.rst           |   4 +-
 Documentation/leds/leds-lp55xx.rst                 |   2 +-
 Documentation/locking/locktypes.rst                |   4 +-
 .../maintainer/maintainer-entry-profile.rst        |  26 +-
 Documentation/process/changes.rst                  |   7 +-
 Documentation/process/coding-style.rst             |   8 +-
 Documentation/process/debugging/kgdb.rst           |   4 +-
 Documentation/process/deprecated.rst               |  15 +-
 Documentation/process/maintainer-handbooks.rst     |  17 +-
 Documentation/process/maintainer-soc.rst           |   2 +-
 Documentation/process/maintainers.rst              |   2 +
 Documentation/process/submitting-patches.rst       |  12 +-
 Documentation/process/threat-model.rst             |   2 +-
 Documentation/scheduler/sched-deadline.rst         |   2 +-
 Documentation/security/credentials.rst             |   6 +-
 .../sound/kernel-api/writing-an-alsa-driver.rst    |  12 +-
 Documentation/sphinx-static/custom.css             |   2 +-
 Documentation/sphinx/maintainers_include.py        | 516 ++++++++++++++---=
---
 Documentation/spi/spi-summary.rst                  |   4 +-
 Documentation/staging/crc32.rst                    |   2 +-
 Documentation/staging/lzo.rst                      |   2 +-
 Documentation/staging/remoteproc.rst               |   2 +-
 Documentation/staging/static-keys.rst              |   2 +-
 Documentation/trace/histogram-design.rst           |   2 +-
 Documentation/trace/rv/monitor_sched.rst           |   7 +-
 .../translations/it_IT/kernel-hacking/locking.rst  |   4 +-
 .../translations/it_IT/locking/locktypes.rst       |   4 +-
 .../translations/it_IT/process/coding-style.rst    |   2 +-
 .../it_IT/process/submit-checklist.rst             |   2 +-
 .../ja_JP/process/submitting-patches.rst           | 237 +++++++++-
 Documentation/translations/pt_BR/index.rst         |   3 +
 .../translations/pt_BR/process/2.Process.rst       | 520 +++++++++++++++++=
++++
 .../translations/pt_BR/process/3.Early-stage.rst   | 233 +++++++++
 .../translations/pt_BR/process/changes.rst         |  56 +--
 .../pt_BR/process/development-process.rst          |  22 +
 .../translations/pt_BR/process/kernel-docs.rst     | 373 +++++++++++++++
 .../translations/pt_BR/process/license-rules.rst   | 483 +++++++++++++++++=
++
 .../pt_BR/process/maintainer-handbooks.rst         |  18 +-
 .../translations/pt_BR/process/maintainer-soc.rst  |  12 +-
 .../translations/sp_SP/process/coding-style.rst    |   2 +-
 .../sp_SP/process/submit-checklist.rst             |   2 +-
 Documentation/translations/zh_CN/core-api/kref.rst |   4 +-
 .../translations/zh_CN/process/coding-style.rst    |   2 +-
 .../zh_CN/process/submit-checklist.rst             |   2 +-
 .../zh_CN/video4linux/v4l2-framework.txt           |   2 +-
 .../translations/zh_TW/process/coding-style.rst    |   2 +-
 .../zh_TW/process/submit-checklist.rst             |   2 +-
 .../virt/uml/user_mode_linux_howto_v2.rst          |   2 +-
 Documentation/watchdog/mlx-wdt.rst                 |   4 +-
 Documentation/watchdog/pcwd-watchdog.rst           |  19 +-
 Documentation/watchdog/watchdog-api.rst            |  38 +-
 Documentation/watchdog/watchdog-kernel-api.rst     |  20 +-
 Documentation/watchdog/watchdog-parameters.rst     |  11 +-
 MAINTAINERS                                        |   8 +-
 fs/cramfs/README                                   |  92 +---
 tools/lib/python/kdoc/kdoc_parser.py               |  54 ++-
 tools/lib/python/kdoc/xforms_lists.py              |  22 +-
 tools/unittests/test_cmatch.py                     |   1 +
 92 files changed, 2665 insertions(+), 559 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/process/2.Process.rst
 create mode 100644 Documentation/translations/pt_BR/process/3.Early-stage.=
rst
 create mode 100644 Documentation/translations/pt_BR/process/development-pr=
ocess.rst
 create mode 100644 Documentation/translations/pt_BR/process/kernel-docs.rst
 create mode 100644 Documentation/translations/pt_BR/process/license-rules.=
rst
