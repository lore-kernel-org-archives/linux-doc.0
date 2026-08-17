Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F3F43B4B5;
	Mon, 17 Aug 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979523; cv=none; b=k+A3pjrSaIMN9x9uhidPL8IFfVGmGTKViRhJ/+COjSXnTKo8SpGZmesPee5S58Dozd1+UE3OUkfXBtBMRMmbSP39cFgdbPtkac5fqSPHNQVsih5f55nI6EOnD2qFL2Yz3plXssyMHy4MM5wB3gOprEF9DNdQPconjybZ8z1KdWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979523; c=relaxed/simple;
	bh=tjcehymQBddywTk4pQis/kmHd76IWcw07f8XVNaqfmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ekFEmq/rqNcr3m9CO43CfyoQ0YziGpJnsN/7dwTXbwc2aLzgpmj+26mqG8uVqRureedbTyhK4sFW/XItscXf+2w7uS4iwev1EDoapYr7EPrbuUNolCCbRGphel+uqHm7OUK1yZJCC3bycgrKv54fVzzg2zjl5H1aofIhImQJSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hUKVolMG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hUKVolMG"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 80F83408EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786979520; bh=IDW1eXUgohjRO2UhyFrMKEpEpLKLBLzf5TfmGhirEFg=;
	h=From:To:Cc:Subject:Date:From;
	b=hUKVolMGjp7cJR7wrfWMjjAm6vOnE8q0c8AClA4HsXaS6dpKI/ESOaAohT92Ru6fD
	 XEYlaORPGMW1U7ywOZe3g2Vv45BfTNHpilzFnWSj0fYprXbDajw0QvV/9dutUr5izy
	 QkToYy+oH09vaBDCq8e9DC4hq7H4E497j5k2BF8MLUXBa2xhUF/Q5lEehKOG7UmBSO
	 fY0QWAPowNLslm/NBzAe6ubee3CjjjnNs1EtE3Dd7EbWjFxH//C3RTwK7M8MNhoRpz
	 7G/bOwo/FtVM0GniGZ1NoHs0g6SqQm0CrzaywHrLE7s5i3pn1aGyKcZAUBVRW1Mtit
	 aS3x34710zFMg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 80F83408EC;
	Mon, 17 Aug 2026 15:12:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Documentation for 7.3
Date: Mon, 17 Aug 2026 09:11:59 -0600
Message-ID: <87v798bx34.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.3

for you to fetch changes up to 791e420360669d55b7f90ca0c6d61b10e4992aec:

  Doc: admin-guide: pm: Remove unnecessary backticks and fix a spell (2026-=
08-14 12:36:43 -0600)

----------------------------------------------------------------
It has been a not-too-busy cycle for docs; here's the highlights:

- A (hopefully) consensus change to our LLM-attribution requirements,
  removing the specific model name from the Assisted-by tag.

- A couple of new realtime documents

- Various docs-build-system fixes

- Ongoing work with the Chinese, Portuguese, and Japanese translations.

...and lots of typo fixes, grammar tweaks, etc.

Expect a conflict with the char-misc tree, which also made changes to
Documentation/process/coding-assistants.rst.

----------------------------------------------------------------
Ahmed S. Darwish (1):
      Documentation: real-time: Add kernel configuration guide

Akira Yokosawa (2):
      docs: submitting-patches: Fix section structure around DCO
      docs/ja_JP: submitting-patches: Refine wording etc for "splitting cha=
nges" and later

Akiyoshi Kurita (1):
      docs/ja_JP: translate submitting-patches.rst (sign-off)

Alison Schofield (2):
      docs: python: abi_regex: catch the right exception for a bad regex
      docs: python: abi_regex: convert adjacent index placeholders

Amanda Corr=C3=AAa (2):
      docs: pt_BR: update netdevsim section in maintainer-netdev.rst
      docs: pt_BR: translate the management-style.rst to Brazilian Portugue=
se

Antonin Godard (2):
      Documentation: html: show sections in the sidebar
      Documentation: html: adjust sidebar section titles styling

Anuj Bolewar (1):
      docs: kernel-parameters: Remove smsc-ircc2 IrDA parameters

Ben Guo (5):
      docs/zh_CN: add --no-merges to git log example in how-to.rst
      docs/zh_CN: Update rust/quick-start.rst translation
      docs/zh_CN: Update rust/general-information.rst translation
      docs/zh_CN: Update rust/arch-support.rst translation
      docs/zh_CN: Update rust/testing.rst translation

Bhaskar Chowdhury (1):
      Doc: admin-guide: pm: Remove unnecessary backticks and fix a spell

Chen-Yu Yeh (1):
      MAINTAINERS: update Traditional Chinese documentation maintainers

Christian Brauner (1):
      coding-assistants: simplify attribution

Coiby Xu (1):
      Documentation: dev-tools: scripts/container prefers Podman

Daniel Pereira (14):
      docs: pt_BR: Translate 4.coding.rst into Portuguese
      docs: pt_BR: Translate patch posting documentation
      docs: pt_BR: process: Translate the patch followthrough guide
      docs: pt_BR: process: translate 7.AdvancedTopics and 8.Conclusion
      docs: pt_BR: Add translation for applying-patches and update index
      docs: pt_BR: translate backporting.rst documentation
      docs: pt_BR: process: translate botching-up-ioctls guide
      docs: pt_BR: process: translate contribution maturity model
      docs: pt_BR: translate process/adding-syscalls.rst
      docs: pt_BR: Translate submit-checklist to Portuguese
      docs: pt_BR: Translate code-of-conduct-interpretation to Portuguese
      docs: pt_BR: Translate Code of Conduct to Portuguese
      docs: pt_BR: Translate deprecated interfaces guide to Portuguese
      docs: pt_BR: Reorganize process/index.rst to follow english structure

Doehyun Baek (1):
      Docs/translations/it_IT: sync changes.rst requirements

Dongliang Mu (2):
      docs/zh_CN: polish how-to.rst
      docs/zh_CN: restructure how-to.rst patch submission workflow

Ethan Nelson-Moore (2):
      docs/zh_CN: fix CONFIG_CGROUP typo for CONFIG_CGROUPS
      docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT

Evan Castillo (1):
      README: remove out of place emdashes

Fabio Pereira da Silva (1):
      docs: pt_BR: process: Translate CVE documentation

Federico Vaga (1):
      doc:it_IT: align doc-guide translation

Igor Giamoniano (1):
      docs: pt_BR: process: Translate the kernel driver statement

Iwata Koki (1):
      Documentation: admin-guide: fix a doc for efi_no_storage_paranoia the=
 "5KB" instead of the "50%"

Jeff Layton (1):
      checkpatch.pl: adapt to new Assisted-by: format

Jesse Van Gavere (1):
      overlayfs.rst: remove mention of workdir needing to be empty

Jonathan Corbet (3):
      Revert "docs: allow inline literals in paragraphs to wrap to prevent =
overflow"
      Merge tag 'Chinese-docs-7.3' of gitolite.kernel.org:pub/scm/linux/ker=
nel/git/alexs/linux into alex
      Merge branch 'html' into docs-mw

Jyun-An Chen (1):
      Documentation/core-api: min_heap: remove documented but unimplemented=
 min_heap_empty()

Liang Luo (1):
      sched/doc: Fix stale em_pd_energy() reference in sched-energy

Lorenzo Stoakes (1):
      docs: link AI coding assistants and tool-generated content pages

Lukasz Tymoszczuk (1):
      docs: ipmi: fix word order in create-user description

Manuel Ebner (9):
      docs: kernel-hacking: fix typo
      Documentation: admin-guide: fix brackets and translation issue
      Documentation: locking.rst: update deprecated function
      docs: packing: fix brackets
      Docs: list: Fix bracket
      errseq: add missing bracket
      docs: dma-api: remove needless bracket
      sched/Documentation: fix code
      Documentation/kernel-parameters: fix brackets

Mauro Carvalho Chehab (2):
      docs: maintainers_include: fix entry names
      docs: custom.css: don't limit rendering to old 800px monitors

Randy Dunlap (8):
      Docs: conf.py: fix typos in comments
      Docs: SMP: add an SMP docbook chapter
      MAINTAINERS: docs: add reviewer
      docs: kdoc_parser: drop extraneous blank line in warning message
      docs: xforms_lists: support DEFINE_IDTENTRY_IRQ()
      docs: sphinx-build-wrapper: include localversion in kernel version st=
ring
      doc tools: fix 'path' typos
      docs: conf.py: fix the 'utf-8' typo

Ryszard Knop (2):
      scripts/kernel-doc: Suggest possible names for excess descriptions
      scripts/kernel-doc: Fix kdoc for Python 3.9-3.11

Sebastian Andrzej Siewior (1):
      Documentation: Extend the real-time hardware bits with some firmware =
bits

Seongjun Hong (1):
      docs: ABI: README: fix grammatical error

Utsav Shankar (1):
      Documentation: usb: remove dead link to external USB programming guide

Yahya Toubali (1):
      Documentation: proc: fix repeated word 'page'

Yan Zhu (2):
      docs/zh_CN: add module-signing Chinese translation
      docs/zh_CN: update admin-guide/index.rst translation

Ygor Otavio (1):
      docs: translations: pt_BR: translate email-clients.rst

Yousef Alhouseen (1):
      docs: kdoc: fix troff output description typo

Zenghui Yu (1):
      docs: pagemap: fix flags location, member name and sample code

chengyaqiang (1):
      docs/zh_CN: fix KASAN SW_TAGS mode description

panzhipop (1):
      docs/zh_TW: replace =E6=8E=A5=E5=8F=A3 with =E4=BB=8B=E9=9D=A2 in sta=
ble-api-nonsense.rst

=C3=81lysson Gleyson da Silva (1):
      docs: pt_BR: process: Translate the security-bugs.rst

=E5=B2=B3=E7=A7=89=E5=9D=A4 (1):
      Documentation: fix "readng" typo in EDAC memory-repair ABI doc

 CREDITS                                            |   4 +
 Documentation/ABI/README                           |   2 +-
 Documentation/ABI/testing/sysfs-edac-memory-repair |   2 +-
 Documentation/admin-guide/kernel-parameters.txt    |  34 +-
 Documentation/admin-guide/media/bttv.rst           |   2 +-
 Documentation/admin-guide/mm/pagemap.rst           |   8 +-
 Documentation/admin-guide/pm/amd-pstate.rst        |   2 +-
 Documentation/conf.py                              |   6 +-
 Documentation/core-api/SMP.rst                     |  11 +
 Documentation/core-api/dma-api.rst                 |   2 +-
 Documentation/core-api/errseq.rst                  |   2 +-
 Documentation/core-api/index.rst                   |   1 +
 Documentation/core-api/list.rst                    |   2 +-
 Documentation/core-api/min_heap.rst                |  13 -
 Documentation/core-api/packing.rst                 |   4 +-
 Documentation/core-api/real-time/hardware.rst      | 104 +++
 Documentation/core-api/real-time/index.rst         |   1 +
 .../core-api/real-time/kernel-configuration.rst    | 307 +++++++++
 Documentation/dev-tools/container.rst              |   6 +-
 Documentation/driver-api/ipmi.rst                  |   2 +-
 .../driver-api/usb/writing_usb_driver.rst          |   3 -
 Documentation/filesystems/overlayfs.rst            |   3 +-
 Documentation/filesystems/proc.rst                 |   2 +-
 Documentation/index.rst                            |   8 +
 Documentation/kernel-hacking/locking.rst           |   8 +-
 Documentation/process/coding-assistants.rst        |  12 +-
 Documentation/process/generated-content.rst        |   7 +
 Documentation/process/submitting-patches.rst       |  14 +-
 Documentation/scheduler/sched-energy.rst           |   2 +-
 Documentation/scheduler/sched-pelt.c               |   3 +-
 Documentation/sphinx-static/custom.css             |  24 +-
 Documentation/sphinx/maintainers_include.py        |   7 +-
 .../it_IT/doc-guide/checktransupdate.rst           |  59 ++
 .../translations/it_IT/doc-guide/contributing.rst  | 319 ++++++++++
 .../translations/it_IT/doc-guide/index.rst         |  13 +-
 .../translations/it_IT/doc-guide/kernel-doc.rst    |  88 ++-
 .../it_IT/doc-guide/maintainer-profile.rst         |  60 ++
 .../translations/it_IT/doc-guide/parse-headers.rst | 220 +++----
 .../translations/it_IT/doc-guide/sphinx.rst        | 178 ++++--
 .../translations/it_IT/process/changes.rst         | 118 ++--
 .../ja_JP/process/submitting-patches.rst           | 227 ++++---
 Documentation/translations/pt_BR/index.rst         |  13 +-
 .../translations/pt_BR/process/4.Coding.rst        | 440 +++++++++++++
 .../translations/pt_BR/process/5.Posting.rst       | 376 +++++++++++
 .../translations/pt_BR/process/6.Followthrough.rst | 220 +++++++
 .../pt_BR/process/7.AdvancedTopics.rst             | 201 ++++++
 .../translations/pt_BR/process/8.Conclusion.rst    |  73 +++
 .../translations/pt_BR/process/adding-syscalls.rst | 700 +++++++++++++++++=
++++
 .../pt_BR/process/applying-patches.rst             | 447 +++++++++++++
 .../translations/pt_BR/process/backporting.rst     | 598 ++++++++++++++++++
 .../pt_BR/process/botching-up-ioctls.rst           | 256 ++++++++
 .../process/code-of-conduct-interpretation.rst     | 257 ++++++++
 .../translations/pt_BR/process/code-of-conduct.rst |  88 +++
 .../pt_BR/process/contribution-maturity-model.rst  | 111 ++++
 Documentation/translations/pt_BR/process/cve.rst   | 125 ++++
 .../translations/pt_BR/process/deprecated.rst      | 422 +++++++++++++
 .../pt_BR/process/development-process.rst          |   5 +
 .../translations/pt_BR/process/email-clients.rst   | 368 +++++++++++
 Documentation/translations/pt_BR/process/index.rst | 102 +++
 .../pt_BR/process/kernel-driver-statement.rst      | 205 ++++++
 .../pt_BR/process/maintainer-netdev.rst            |  23 +-
 .../pt_BR/process/management-style.rst             | 265 ++++++++
 .../translations/pt_BR/process/security-bugs.rst   | 368 +++++++++++
 .../pt_BR/process/submit-checklist.rst             | 145 +++++
 .../translations/zh_CN/accounting/psi.rst          |   2 +-
 .../translations/zh_CN/admin-guide/index.rst       | 202 ++++--
 .../zh_CN/admin-guide/module-signing.rst           | 250 ++++++++
 .../translations/zh_CN/dev-tools/kasan.rst         |   2 +-
 Documentation/translations/zh_CN/how-to.rst        | 149 +++--
 .../translations/zh_CN/rust/arch-support.rst       |   1 +
 .../zh_CN/rust/general-information.rst             |  82 ++-
 .../translations/zh_CN/rust/quick-start.rst        |  48 +-
 Documentation/translations/zh_CN/rust/testing.rst  |   4 +
 .../translations/zh_CN/scheduler/sched-energy.rst  |   2 +-
 .../zh_CN/security/self-protection.rst             |   2 +-
 .../zh_TW/process/stable-api-nonsense.rst          |  62 +-
 MAINTAINERS                                        |   7 +-
 README                                             |  18 +-
 scripts/checkpatch.pl                              |   7 +-
 tools/docs/documentation-file-ref-check            |   2 +-
 tools/docs/sphinx-build-wrapper                    |  13 +-
 tools/lib/python/abi/abi_regex.py                  |  11 +-
 tools/lib/python/kdoc/kdoc_output.py               |   2 +-
 tools/lib/python/kdoc/kdoc_parser.py               |  58 +-
 tools/lib/python/kdoc/xforms_lists.py              |   1 +
 85 files changed, 8019 insertions(+), 604 deletions(-)
 create mode 100644 Documentation/core-api/SMP.rst
 create mode 100644 Documentation/core-api/real-time/kernel-configuration.r=
st
 create mode 100644 Documentation/translations/it_IT/doc-guide/checktransup=
date.rst
 create mode 100644 Documentation/translations/it_IT/doc-guide/contributing=
.rst
 create mode 100644 Documentation/translations/it_IT/doc-guide/maintainer-p=
rofile.rst
 create mode 100644 Documentation/translations/pt_BR/process/4.Coding.rst
 create mode 100644 Documentation/translations/pt_BR/process/5.Posting.rst
 create mode 100644 Documentation/translations/pt_BR/process/6.Followthroug=
h.rst
 create mode 100644 Documentation/translations/pt_BR/process/7.AdvancedTopi=
cs.rst
 create mode 100644 Documentation/translations/pt_BR/process/8.Conclusion.r=
st
 create mode 100644 Documentation/translations/pt_BR/process/adding-syscall=
s.rst
 create mode 100644 Documentation/translations/pt_BR/process/applying-patch=
es.rst
 create mode 100644 Documentation/translations/pt_BR/process/backporting.rst
 create mode 100644 Documentation/translations/pt_BR/process/botching-up-io=
ctls.rst
 create mode 100644 Documentation/translations/pt_BR/process/code-of-conduc=
t-interpretation.rst
 create mode 100644 Documentation/translations/pt_BR/process/code-of-conduc=
t.rst
 create mode 100644 Documentation/translations/pt_BR/process/contribution-m=
aturity-model.rst
 create mode 100644 Documentation/translations/pt_BR/process/cve.rst
 create mode 100644 Documentation/translations/pt_BR/process/deprecated.rst
 create mode 100644 Documentation/translations/pt_BR/process/email-clients.=
rst
 create mode 100644 Documentation/translations/pt_BR/process/index.rst
 create mode 100644 Documentation/translations/pt_BR/process/kernel-driver-=
statement.rst
 create mode 100644 Documentation/translations/pt_BR/process/management-sty=
le.rst
 create mode 100644 Documentation/translations/pt_BR/process/security-bugs.=
rst
 create mode 100644 Documentation/translations/pt_BR/process/submit-checkli=
st.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/module-sig=
ning.rst
