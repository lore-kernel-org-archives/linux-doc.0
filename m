Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765487;
	b=BhGnPOc9waT2R23H/6a09GZKrH9YBwnjLWrZAud4bqtOWvu/h3fCU+ou4pvV6PpLE4Wh
	 6JKywMDM/7Blp095eQuEKt93K/fxIR/QlvGYS3eXmIlVzVel59Bn9vcb7xb0KfQYnYy/2
	 7+MJrvUaiBspIgta/+wto2QxBhwOYB90b2OS0BXf88VIyM1aueooB5RERhHc4UO0acmho
	 +RiD4CrIrJARl6Q86y+ORgLXNacJgMs3M7gWru8BUqv5s3Ea5SFdeB2soHALMKnRghzXD
	 qWSP1LVoViQJsUfCuxo2LqNtaFiUxr4/xTi3SSF17vnTraRqGxvhCN0eK281C5W/2jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765487;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PRLAcDweMqHNjFma3VCqgAu3FKSwhCXsbr2P2istF8A=;
	b=hxbLvQdrpnLWedRYM1cTlICUTI9QfHVv9gf7sZXeYN8Ggw1RxBMQyx85DThHSWT5Jguv
	 lAsyVaeB4fxF/1A/6fSiIB1R0icsM4x6GfmKmuFABqdsFAuIUxyZ4leOqZTzsww0jRRnQ
	 qMC5EgyI/bLX7TFiVHI7OJ6sXx3u8ZEE0xY1CBTMEp55ag+V3WfVQovb1zIfSz7giOdqk
	 9wBUmz0uC5VoppXa6CPc2jW6ecAPfNirSd6RYAaorZc+RG6QB7iIJfaB4+sqD2gKOv+m2
	 51xQa9/p4Mt2etVye7r5KRVZSo4cyvOmkg9wiNFCzSR2lZKOcc9x+wAHhJEnaqPz+8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQmQzz2E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6689C606A32E
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQmQzz2E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF951F00A24;
	Fri, 27 Nov 2026 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795765486;
	bh=PRLAcDweMqHNjFma3VCqgAu3FKSwhCXsbr2P2istF8A=;
	h=From:To:Cc:Subject:Date;
	b=nQmQzz2EewPYy/IW3jy6Jba9enIt/EaimoBqq3iWz/uni8vTSM1bDYwtrENJ2p19q
	 CAFVA6WSgBWkOi29bfw9FHNZcfSjpwPkb97HG/G89hmXvrxKq/G0a3lNiNTAvtoS3P
	 eF/JB+lMzpUC0uOghA7OwgZfGMmi0DqOsSlKotMfuqXZKSe8P6aOQue2tmu5IOh6qu
	 /zdTeRzfVqM3A0od6Y9TQ4cWUlr9EJYWLqH5/TGrxnLRe4nMgJhHlZonBuby79dzUH
	 RB3JAyxlW9XzQsOFcfFB9A3AsKEpSR8hk5pODaaXf2zfRrN9QMnEpqy9jLs4rNSmyH
	 BeMrYDYXGKdWw==
From: alexs@kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [GIT PULL] Chinese-docs changes for v7.5
Date: Fri, 27 Nov 2026 15:44:32 +0800
Message-ID: <20261127074432.230097-1-alexs@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit d3b70c91af11cdf08aebbfdb166b333ada0276be:

  docs: ioctl-number: update DRM entries (2026-11-25 09:43:10 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git tags/Chinese-docs-7.5

for you to fetch changes up to b25dfb30dde02eff911950646bd9d6060337bd98:

  docs/zh_CN: improve maintainer/pull-requests translation (2026-11-27 11:26:36 +0800)

----------------------------------------------------------------
Chinese translation docs for 7.5

Update the Chinese translation subtree for the 7.5 release cycle:

- Add zh_CN translations of build requirements, AI coding assistants,
  generated-content guidelines, and the threat model.
- Refresh zh_CN Sphinx, Git configuration, PGP, and pull-request
  documentation, including kernel.org trust references and Nitrokey guidance.
- Clean up zh_TW maintainer contact information, remove unreachable
  translations, and add original-source references and unmaintained notices.
- Align zh_TW document locations with upstream, improve index navigation,
  and remove an unused enforcement-statement label.

Tested with 'make htmldocs'.

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Chen-Yu Yeh (15):
      docs/zh_TW: process: remove maintainer contact information
      docs/zh_TW: admin-guide: remove maintainer contact information
      docs/zh_TW: arch: remove maintainer contact information
      docs/zh_TW: dev-tools: remove maintainer contact information
      docs/zh_TW: filesystems: remove maintainer contact information
      docs/zh_TW: cpu-freq: remove maintainer contact information
      docs/zh_TW: remove the last maintainer contact references
      docs/zh_TW: remove the unreachable plain-text translations
      docs/zh_TW: move security-bugs to process/
      docs/zh_TW: move magic-number to staging/
      docs/zh_TW: move gdb-kernel-debugging to process/debugging/
      docs/zh_TW: add missing :Original: fields
      docs/zh_TW: add a notice for translations not kept in sync
      docs/zh_TW: mark translations outside the maintained set
      docs/zh_TW: link filesystems/ and cpu-freq/ from the index

Dongliang Mu (4):
      docs/zh_CN: translate coding-assistants.rst
      docs/zh_CN: translate generated-content.rst
      docs/zh_CN: translate threat-model.rst
      docs/zh_CN: link AI guide to translated documents

Jiandong Qiu (2):
      docs/zh_CN: add process/changes.rst translation
      docs/zh_CN: update sphinx.rst translation

Weijie Yuan (8):
      docs/zh_TW: drop unused enforcement statement label
      docs/zh_CN: update maintainer-pgp-guide translation
      docs/zh_CN: clarify free Nitrokey requirements
      docs/zh_CN: update maintainer-pgp-guide kernel.org link
      docs/zh_CN: add kernel.org trust repository reference
      docs/zh_CN: remove empty proofreader field from maintainer PGP guide
      docs/zh_CN: sync maintainer/configure-git with upstream
      docs/zh_CN: improve maintainer/pull-requests translation

 .../translations/zh_CN/doc-guide/sphinx.rst        | 167 +++++--
 .../zh_CN/maintainer/configure-git.rst             |  48 +-
 .../zh_CN/maintainer/pull-requests.rst             | 127 ++---
 .../translations/zh_CN/process/changes.rst         | 528 +++++++++++++++++++++
 .../zh_CN/process/coding-assistants.rst            |  74 +++
 .../zh_CN/process/generated-content.rst            |  97 ++++
 Documentation/translations/zh_CN/process/index.rst |   2 +-
 .../zh_CN/process/maintainer-pgp-guide.rst         | 154 +++---
 .../translations/zh_CN/process/threat-model.rst    | 168 +++++++
 Documentation/translations/zh_TW/IRQ.txt           |  41 --
 .../translations/zh_TW/admin-guide/README.rst      |   6 +-
 .../translations/zh_TW/admin-guide/bootconfig.rst  |   3 +-
 .../translations/zh_TW/admin-guide/bug-bisect.rst  |   6 +-
 .../translations/zh_TW/admin-guide/bug-hunting.rst |   6 +-
 .../zh_TW/admin-guide/clearing-warn-once.rst       |   3 +-
 .../translations/zh_TW/admin-guide/cpu-load.rst    |   3 +-
 .../translations/zh_TW/admin-guide/cputopology.rst |   5 +-
 .../translations/zh_TW/admin-guide/index.rst       |   4 +-
 .../translations/zh_TW/admin-guide/init.rst        |   6 +-
 .../zh_TW/admin-guide/lockup-watchdogs.rst         |   2 +-
 .../zh_TW/admin-guide/mm/damon/index.rst           |   7 +-
 .../zh_TW/admin-guide/mm/damon/lru_sort.rst        |   7 +-
 .../zh_TW/admin-guide/mm/damon/reclaim.rst         |   7 +-
 .../zh_TW/admin-guide/mm/damon/start.rst           |   7 +-
 .../zh_TW/admin-guide/mm/damon/usage.rst           |   7 +-
 .../translations/zh_TW/admin-guide/mm/index.rst    |   6 +-
 .../translations/zh_TW/admin-guide/mm/ksm.rst      |   6 +-
 .../zh_TW/admin-guide/reporting-issues.rst         |   7 +-
 .../zh_TW/admin-guide/reporting-regressions.rst    |   6 +-
 .../translations/zh_TW/admin-guide/sysrq.rst       |   9 +-
 .../zh_TW/admin-guide/tainted-kernels.rst          |   6 +-
 .../translations/zh_TW/admin-guide/unicode.rst     |   6 +-
 Documentation/translations/zh_TW/arch/arm/Booting  | 176 -------
 .../zh_TW/arch/arm/kernel_user_helpers.txt         | 285 -----------
 .../translations/zh_TW/arch/arm64/amu.rst          |   4 +-
 .../translations/zh_TW/arch/arm64/booting.txt      | 251 ----------
 .../translations/zh_TW/arch/arm64/elf_hwcaps.rst   |   4 +-
 .../translations/zh_TW/arch/arm64/hugetlbpage.rst  |   4 +-
 .../translations/zh_TW/arch/arm64/index.rst        |   3 +-
 .../zh_TW/arch/arm64/legacy_instructions.txt       |  77 ---
 .../translations/zh_TW/arch/arm64/memory.txt       | 119 -----
 .../translations/zh_TW/arch/arm64/perf.rst         |   4 +-
 .../zh_TW/arch/arm64/silicon-errata.txt            |  79 ---
 .../zh_TW/arch/arm64/tagged-pointers.txt           |  57 ---
 Documentation/translations/zh_TW/arch/index.rst    |   4 +
 .../translations/zh_TW/arch/loongarch/booting.rst  |   5 +-
 .../translations/zh_TW/arch/loongarch/features.rst |   2 +-
 .../translations/zh_TW/arch/loongarch/index.rst    |   2 +-
 .../zh_TW/arch/loongarch/introduction.rst          |   2 +-
 .../zh_TW/arch/loongarch/irq-chip-model.rst        |   2 +-
 .../translations/zh_TW/arch/mips/booting.rst       |   5 +-
 .../translations/zh_TW/arch/mips/features.rst      |   5 +-
 .../translations/zh_TW/arch/mips/index.rst         |   5 +-
 .../translations/zh_TW/arch/mips/ingenic-tcu.rst   |   5 +-
 .../translations/zh_TW/arch/openrisc/index.rst     |   5 +-
 .../zh_TW/arch/openrisc/openrisc_port.rst          |   5 +-
 .../translations/zh_TW/arch/openrisc/todo.rst      |   5 +-
 .../translations/zh_TW/arch/parisc/debugging.rst   |   5 +-
 .../translations/zh_TW/arch/parisc/index.rst       |   5 +-
 .../translations/zh_TW/arch/parisc/registers.rst   |   5 +-
 Documentation/translations/zh_TW/cpu-freq/core.rst |   9 +-
 .../translations/zh_TW/cpu-freq/cpu-drivers.rst    |   9 +-
 .../translations/zh_TW/cpu-freq/cpufreq-stats.rst  |   9 +-
 .../translations/zh_TW/cpu-freq/index.rst          |   5 +-
 .../translations/zh_TW/dev-tools/gcov.rst          |   2 +-
 .../translations/zh_TW/dev-tools/index.rst         |   3 +-
 .../translations/zh_TW/dev-tools/kasan.rst         |   2 +-
 .../translations/zh_TW/dev-tools/sparse.rst        |  11 +-
 .../zh_TW/dev-tools/testing-overview.rst           |   2 +-
 .../translations/zh_TW/disclaimer-zh_TW.rst        |  12 +-
 .../translations/zh_TW/filesystems/debugfs.rst     |  11 +-
 .../translations/zh_TW/filesystems/index.rst       |   3 +-
 .../translations/zh_TW/filesystems/sysfs.txt       |  10 -
 .../translations/zh_TW/filesystems/tmpfs.rst       |   1 +
 .../translations/zh_TW/filesystems/virtiofs.rst    |   9 +-
 Documentation/translations/zh_TW/index.rst         |  13 +-
 Documentation/translations/zh_TW/io_ordering.txt   |  68 ---
 .../translations/zh_TW/process/1.Intro.rst         |  10 -
 .../translations/zh_TW/process/2.Process.rst       |  10 -
 .../translations/zh_TW/process/3.Early-stage.rst   |   9 -
 .../translations/zh_TW/process/4.Coding.rst        |   9 -
 .../translations/zh_TW/process/5.Posting.rst       |  10 -
 .../translations/zh_TW/process/6.Followthrough.rst |   9 -
 .../zh_TW/process/7.AdvancedTopics.rst             |  10 -
 .../translations/zh_TW/process/8.Conclusion.rst    |   9 -
 .../process/code-of-conduct-interpretation.rst     |   3 -
 .../translations/zh_TW/process/code-of-conduct.rst |   2 -
 .../translations/zh_TW/process/coding-style.rst    |  14 -
 .../debugging}/gdb-kernel-debugging.rst            |   4 +-
 .../translations/zh_TW/process/debugging/index.rst |  70 +++
 .../zh_TW/process/development-process.rst          |   2 -
 .../translations/zh_TW/process/email-clients.rst   |  12 -
 .../zh_TW/process/embargoed-hardware-issues.rst    |   3 -
 Documentation/translations/zh_TW/process/howto.rst |  18 -
 Documentation/translations/zh_TW/process/index.rst |  12 +-
 .../zh_TW/process/kernel-driver-statement.rst      |   2 -
 .../zh_TW/process/kernel-enforcement-statement.rst |   4 -
 .../translations/zh_TW/process/license-rules.rst   |   3 -
 .../zh_TW/process/management-style.rst             |   2 -
 .../zh_TW/process/programming-language.rst         |   3 -
 .../{admin-guide => process}/security-bugs.rst     |   6 +-
 .../zh_TW/process/stable-api-nonsense.rst          |  10 -
 .../zh_TW/process/stable-kernel-rules.rst          |  12 -
 .../zh_TW/process/submit-checklist.rst             |   4 -
 .../zh_TW/process/submitting-patches.rst           |  12 -
 .../zh_TW/process/volatile-considered-harmful.rst  |  12 -
 Documentation/translations/zh_TW/staging/index.rst |  24 +
 .../zh_TW/{process => staging}/magic-number.rst    |   9 +-
 .../translations/zh_TW/subsystem-apis.rst          |  99 ++++
 .../translations/zh_TW/unmaintained-zh_TW.rst      |   6 +
 110 files changed, 1439 insertions(+), 1825 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/changes.rst
 create mode 100644 Documentation/translations/zh_CN/process/coding-assistants.rst
 create mode 100644 Documentation/translations/zh_CN/process/generated-content.rst
 create mode 100644 Documentation/translations/zh_CN/process/threat-model.rst
 delete mode 100644 Documentation/translations/zh_TW/IRQ.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm/Booting
 delete mode 100644 Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/booting.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/memory.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
 delete mode 100644 Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
 delete mode 100644 Documentation/translations/zh_TW/io_ordering.txt
 rename Documentation/translations/zh_TW/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (98%)
 create mode 100644 Documentation/translations/zh_TW/process/debugging/index.rst
 rename Documentation/translations/zh_TW/{admin-guide => process}/security-bugs.rst (97%)
 create mode 100644 Documentation/translations/zh_TW/staging/index.rst
 rename Documentation/translations/zh_TW/{process => staging}/magic-number.rst (85%)
 create mode 100644 Documentation/translations/zh_TW/subsystem-apis.rst
 create mode 100644 Documentation/translations/zh_TW/unmaintained-zh_TW.rst
