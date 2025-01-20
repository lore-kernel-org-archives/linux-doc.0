Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0111B1EEA51;
	Mon, 20 Jan 2025 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737402536; cv=none; b=HRhQ59Kp8g2HBcxDkzYB02X1390BLcmSN7hyiwUcPDR4Y1e7g+3w/wpxvp/aUdUZn4BcLWX/e0IakTHNUW2s54IunvJB2yDDIPrYWms/HywgFlyNfPznt1rRSKIGFLtNZZGEOG9IbgALtrIQY1eB+4U9cEDCOX+7KjeHz9VKuCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737402536; c=relaxed/simple;
	bh=LzW0/3jRkVaDbsN4CWkU7KtEZggyYhrJunNxhpn3exk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g7VSxkfg+7QScvsgkJn66Hc7Ad383369u0XQfeZnPvvSy4o2hXLoTqZnzpe/4MrNms2AA1AJ6KdTMjs472QKhioF6J+cuXPiIV3GxntmqiYg9imiUxmB63J8D1Oh3aj9AmJZ+UeVhEpmipbQni69JSuj7/mGEyYDRHrccbaqV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sljq2JDG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sljq2JDG"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2CDB2404ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737402525; bh=lkP0gBTT9TTMcDlDY3BgWNl5pfiBRx6aVU3meRlyt0k=;
	h=From:To:Cc:Subject:Date:From;
	b=sljq2JDG/LtDLm9WHP2DVi2b79WM1YwUpQq9qVlYFauwlOcBJY3jGA8qdUkCWREy/
	 j7SuBYKA8PAU8FWimqFs6BftlYJXuLoD0tI7WfyBTlbkY68Ui5UE1bWkY0LQwtwYAH
	 5cPbAkhuS4Kl0LPC48iMbGFHRvPa1bgcDgCwo7fPDrbD7jIHzakeq1OsQy6zSY1K7u
	 mlW9du0FxQS1dph6o7basbi3Zd2Ty6f6FJIhSceL0pa173Fj6iz+iStVpTOIMSAjT0
	 d7tvd6Q5aFdBjr+arJDCNHQwzh+auWoM8m2A2J1MNzCfPEU2l/O5n2Xo+l70WzEQz7
	 5/eYaXWIQvzuw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2CDB2404ED;
	Mon, 20 Jan 2025 19:48:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation for 6.14
Date: Mon, 20 Jan 2025 12:48:44 -0700
Message-ID: <87a5bltgf7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit d9339496729f1471b8dc326face17c4cf108b027:

  scripts/kernel-doc: Get -export option working again (2024-12-11 09:15:26=
 -0700)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-6.14

for you to fetch changes up to 6912bdb7c676019b6dd4520f555079c4d3ab1bdb:

  Documentation: Fix x86_64 UEFI outdated references to elilo (2025-01-16 1=
1:21:29 -0700)

----------------------------------------------------------------
Documentation changes this time around include:

- Quite a bit of Chinese and Spanish translation work.

- Clarifying that Git commit IDs >12chars are OK

- A new nvme-multipath document

- A reorganization of the admin-guide top-level page to make it readable

- Clarification of the role of Acked-by and maintainer discretion on their
  acceptance.

- Some reorganization of debugging-oriented docs.

...and typo fixes, documentation updates, etc. as usual.

----------------------------------------------------------------
Ahmad Fatoum (1):
      docs: process: submitting-patches: split canonical patch format secti=
on

Andrew Kreimer (1):
      Documentation/rv: Fix typos

Andy Shevchenko (3):
      x86/Documentation: Make Literal Blocks to follow reStructuredText spe=
cification
      x86/Documentation: Align Note Blocks style
      x86/Documentation: Elaborate Intel MID device list

Avadhut Naik (3):
      docs/sp_SP: Add translation of process/5.Posting.rst
      docs/sp_SP: Add translation of process/7.AdvancedTopics.rst
      docs/sp_SP: Add translation of process/8.Conclusion.rst

Bingwu Zhang (1):
      Documentation: filesystems: fix two misspells

Carlos Bilbao (4):
      docs/sp_SP: Add translation of process/3.Early-stage.rst
      docs/sp_SP: Add translation of process/4.Coding.rst
      docs/sp_SP: Add translation of process/6.Followthrough.rst
      docs/sp_SP: Move development-process to top of index

Carlos Maiolino (1):
      Documentation: Fix simple typo on filesystems/porting.rst

Cengiz Can (1):
      Documentation: remove :kyb: tags

Geert Uytterhoeven (2):
      Align git commit ID abbreviation guidelines and checks
      overlayfs.rst: Fix and improve grammar

Gianfranco Trad (1):
      Documentation: kvm: fix typo in api.rst

Greg Kroah-Hartman (1):
      Documentation: bug-hunting.rst: remove odd contact information

Guixin Liu (1):
      docs, nvme: introduce nvme-multipath document

I Hsin Cheng (1):
      docs/mm: Physical memory: Remove zone_t

Jonathan Corbet (4):
      Merge branch 'docs-fixes' into docs-mw
      docs: admin-guide: join the sysfs information in one place
      docs: admin-guide: add some subsection headings
      docs: admin-guide: bring some order to the "everything else" section

Li Zhijian (1):
      Documentation: Fix typo localmodonfig -> localmodconfig

Lubomir Rintel (1):
      Documentation/kernel-parameters: Fix a reference to vga-softcursor.rst

Matthew Wilcox (Oracle) (1):
      kref: Improve documentation

Michal Koutn=C3=BD (1):
      Documentation: sched/RT: Update paragraphs about RT bandwidth control

Miguel Ojeda (3):
      docs: submitting-patches: clarify Acked-by and introduce "# Suffix"
      docs: submitting-patches: clarify difference between Acked-by and Rev=
iewed-by
      docs: submitting-patches: clarify that signers may use their discreti=
on on tags

Nir Lichtman (1):
      Documentation: Fix x86_64 UEFI outdated references to elilo

Phil Auld (1):
      Documentation/sysctl: Add timer_migration to kernel.rst

Randy Dunlap (3):
      Documentation: core-api: add generic parser docbook
      docs: debugging: add more info about devcoredump
      Documentation: move dev-tools debugging files to process/debugging/

Ruffalo Lavoisier (1):
      docs: remove duplicate word

Saru2003 (2):
      Documentation/accounting: Fix typo in taskstats-struct.rst
      Documentation: zram: fix dictionary spelling

Shuo Zhao (2):
      docs/zh_CN: Add security digsig Chinese translation
      docs/zh_CN: Add security IMA-templates Chinese translation

Thorsten Leemhuis (1):
      docs: 5.Posting: mentioned Suggested-by: tag

Uwe Kleine-K=C3=B6nig (2):
      doc: module: Fix documented type of namespace
      doc: module: DEFAULT_SYMBOL_NAMESPACE must be defined before #includes

Vegard Nossum (1):
      scripts/kernel-doc: fix identifier parsing regex

Yuehui Zhao (2):
      docs/zh_CN: Add security index Chinese translation
      docs/zh_CN: Add security lsm Chinese translation

Yuxian Mao (1):
      docs/zh_CN: Add landlock index Chinese translation

zhangwei (2):
      docs/zh_CN: Add siphash index Chinese translation
      docs/zh_CN: Add sak index Chinese translation

 Documentation/accounting/taskstats-struct.rst      |   2 +-
 Documentation/admin-guide/README.rst               |   4 +-
 Documentation/admin-guide/blockdev/zram.rst        |   6 +-
 Documentation/admin-guide/braille-console.rst      |   4 +-
 Documentation/admin-guide/bug-hunting.rst          |   9 -
 Documentation/admin-guide/index.rst                | 162 ++++---
 Documentation/admin-guide/kernel-parameters.txt    |   2 +-
 Documentation/admin-guide/nvme-multipath.rst       |  72 ++++
 .../admin-guide/quickly-build-trimmed-linux.rst    |   2 +-
 Documentation/admin-guide/sysctl/fs.rst            |   2 +-
 Documentation/admin-guide/sysctl/kernel.rst        |   7 +
 Documentation/admin-guide/sysrq.rst                |  20 +-
 .../verify-bugs-and-bisect-regressions.rst         |   2 +-
 Documentation/arch/x86/boot.rst                    | 369 ++++++++--------
 Documentation/arch/x86/x86_64/uefi.rst             |  37 +-
 Documentation/core-api/index.rst                   |   1 +
 Documentation/core-api/kref.rst                    |   7 +-
 Documentation/core-api/parser.rst                  |  17 +
 Documentation/core-api/symbol-namespaces.rst       |  11 +-
 Documentation/dev-tools/index.rst                  |   5 +-
 Documentation/filesystems/iomap/operations.rst     |   2 +-
 Documentation/filesystems/overlayfs.rst            |   8 +-
 Documentation/filesystems/porting.rst              |   2 +-
 Documentation/mm/physical_memory.rst               |   2 +-
 Documentation/process/5.Posting.rst                |   4 +
 .../driver_development_debugging_guide.rst         |  20 +-
 .../debugging}/gdb-kernel-debugging.rst            |   0
 Documentation/process/debugging/index.rst          |   2 +
 .../{dev-tools =3D> process/debugging}/kgdb.rst      |  50 +--
 Documentation/process/email-clients.rst            |   8 +-
 Documentation/process/maintainer-tip.rst           |   2 +-
 Documentation/process/submitting-patches.rst       |  86 ++--
 Documentation/scheduler/sched-deadline.rst         |  13 +-
 Documentation/scheduler/sched-ext.rst              |   6 +-
 Documentation/scheduler/sched-rt-group.rst         |   8 +-
 Documentation/trace/rv/runtime-verification.rst    |   4 +-
 .../translations/it_IT/process/email-clients.rst   |   8 +-
 .../translations/sp_SP/process/3.Early-stage.rst   | 234 ++++++++++-
 .../translations/sp_SP/process/4.Coding.rst        | 463 +++++++++++++++++=
+++-
 .../translations/sp_SP/process/5.Posting.rst       | 388 ++++++++++++++++-
 .../translations/sp_SP/process/6.Followthrough.rst | 223 +++++++++-
 .../sp_SP/process/7.AdvancedTopics.rst             | 207 ++++++++-
 .../translations/sp_SP/process/8.Conclusion.rst    |  75 +++-
 .../sp_SP/process/development-process.rst          |  21 +-
 .../translations/sp_SP/process/email-clients.rst   |   8 +-
 Documentation/translations/sp_SP/process/index.rst |   2 +-
 .../translations/zh_CN/admin-guide/bug-hunting.rst |   9 -
 .../translations/zh_CN/admin-guide/sysrq.rst       |  22 +-
 .../translations/zh_CN/process/email-clients.rst   |   8 +-
 .../translations/zh_CN/security/IMA-templates.rst  |  97 +++++
 .../translations/zh_CN/security/digsig.rst         | 103 +++++
 .../translations/zh_CN/security/index.rst          |  34 ++
 .../translations/zh_CN/security/landlock.rst       | 123 ++++++
 Documentation/translations/zh_CN/security/lsm.rst  |  95 +++++
 Documentation/translations/zh_CN/security/sak.rst  |  86 ++++
 .../translations/zh_CN/security/siphash.rst        | 195 +++++++++
 .../translations/zh_CN/subsystem-apis.rst          |   2 +-
 .../translations/zh_TW/admin-guide/bug-hunting.rst |  10 -
 .../translations/zh_TW/admin-guide/sysrq.rst       |  22 +-
 .../translations/zh_TW/process/email-clients.rst   |   8 +-
 Documentation/virt/kvm/api.rst                     |   2 +-
 MAINTAINERS                                        |   2 +-
 include/linux/kref.h                               |  48 ++-
 include/linux/tty_driver.h                         |   2 +-
 lib/Kconfig.debug                                  |   2 +-
 lib/Kconfig.kgdb                                   |   2 +-
 lib/parser.c                                       |   5 +-
 scripts/checkpatch.pl                              |   4 +-
 scripts/kernel-doc                                 |   2 +-
 69 files changed, 2992 insertions(+), 478 deletions(-)
 create mode 100644 Documentation/admin-guide/nvme-multipath.rst
 create mode 100644 Documentation/core-api/parser.rst
 rename Documentation/{dev-tools =3D> process/debugging}/gdb-kernel-debuggi=
ng.rst (100%)
 rename Documentation/{dev-tools =3D> process/debugging}/kgdb.rst (96%)
 create mode 100644 Documentation/translations/zh_CN/security/IMA-templates=
.rst
 create mode 100644 Documentation/translations/zh_CN/security/digsig.rst
 create mode 100644 Documentation/translations/zh_CN/security/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/landlock.rst
 create mode 100644 Documentation/translations/zh_CN/security/lsm.rst
 create mode 100644 Documentation/translations/zh_CN/security/sak.rst
 create mode 100644 Documentation/translations/zh_CN/security/siphash.rst
