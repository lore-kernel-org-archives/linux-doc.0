Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE763126CD;
	Sun, 12 Apr 2026 21:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776030681; cv=none; b=j1AEJeZqZi0skIg4eK6S6keWYE7O1eWPH5qA8/AgJnvYDqnvPa5zfRbu061mdIUVRBPkoaE7ur8jl6dviaKI15/OY7SDsk2o4cvcLA+A6G1HKp6W1wM4ixQtfqZrhioHEyvgnWp1w49ii+tV7EBocOfQATqkNVSjZhjQJ4R+ZTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776030681; c=relaxed/simple;
	bh=Evw1ssSF+o1/IlASNsdW6nI5+Y+t8SQaHNaAqPcPhnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DbE3jPuI104LORYEEkEH4wdhiSaipbMQw/bhv7kieygCW4zm/VnPQbNm5ghmajhNnqwBwPghQU+eA0kvvpEDhXVq9YI5AURnQDhXfJxUUtKs2V2dTlj1n0kzKf9K5pLE+WmHWFaiL38f0UM2mcmh5K9jBpp8umTb8+VjaL8UHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eQDH0Omd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eQDH0Omd"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0E066410AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776030679; bh=s2H8dBht0Wl1frY08R2NC+tk1TF2lzcuqg3AJ0Z1CGo=;
	h=From:To:Cc:Subject:Date:From;
	b=eQDH0OmdU1uuftvAEOgTCjiHGD6thwCUQMNVwBmgHGi0ujvuqlPwrtWXuV6WMClzh
	 7Q7ou0ECktXN+HSmIUoDO3554bpaXfKFBGKrj6IryC20aZhqfJWABWMu6qWnggplmh
	 PAGpBg/8O20qlMQP1vysv5IeBUaW0xrgsyMhhPPB3CteE71qpAjS4EahSgqHF22nQp
	 erj93Z/CYNkPgwIwip4pUY/IUzHTMy1ik2OwIa4izF8dnmTb4DvRZASrw5BTsdjXoU
	 OdLzV0ZRZ0z28g09j8/jaP6NTZFrDPADyBmKjzNtPAEMdhk3jlbDXLndcMq2SydFbt
	 HsIYG8/Ga4CWg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0E066410AA;
	Sun, 12 Apr 2026 21:51:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>
Subject: [GIT PULL] Documentation for 7.1
Date: Sun, 12 Apr 2026 15:51:18 -0600
Message-ID: <87bjfnzw2x.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.1

for you to fetch changes up to 40a3f6c5e2604ff7c007da6628120529569e950c:

  Documentation: core-api: real-time: correct spelling (2026-04-12 13:11:50=
 -0600)

----------------------------------------------------------------
A busier cycle than I had expected for docs, including:

- Translations: some overdue updates to the Japanese translations, Chinese
  translations for some of the Rust documentation, and the beginnings of a
  Portuguese translation.

- New documents covering CPU isolation, managed interrupts, debugging
  Python gbb scripts, and more.

- More tooling work from Mauro, reducing docs-build warnings, adding self
  tests, improving man-page output, bringing in a proper C tokenizer to
  replace (some of) the mess of kernel-doc regexes, and more.

- Update and synchronize changes.rst and scripts/ver_linux, and put both
  into alphabetical order.

...and a long list of documentation updates, typo fixes, and general
improvements.

Expect a simple conflict with the Rust tree due to the sorting of
Documentation/process/changes.rst.

----------------------------------------------------------------
Akira Yokosawa (1):
      docs/ja_JP: submitting-patches: Amend "Describe your changes"

Akiyoshi Kurita (2):
      docs: ja_JP: process: translate first half of 'Describe your changes'
      docs: ja_JP: process: translate second half of 'Describe your changes'

Ariful Islam Shoikot (3):
      Documentation: process: backporting: fix missing subject
      Documentation/mm: Fix typo in NUMA paragraph
      Documentation/mm/hwpoison.rst: fix typos and grammar.

Askar Safin (1):
      doc: early_userspace_support.rst: trivial fix: directory -> file

Ben Guo (4):
      docs/zh_CN: update rust/arch-support.rst translation
      docs/zh_CN: update rust/coding-guidelines.rst translation
      docs/zh_CN: update rust/quick-start.rst translation
      docs/zh_CN: update rust/index.rst translation

Bhaskar Chowdhury (1):
      Doc: dev-tools: Added Gentoo in the Operating system list under Getti=
ng Coccinelle

Costa Shulyupin (2):
      Documentation/rtla: Add hwnoise to main page
      Documentation/rtla: Convert links to RST format

Daniel Castro (1):
      docs: pt_BR: translate process/1.Intro.rst

Daniel Pereira (8):
      docs: pt_BR: Add initial Portuguese translation
      docs: pt_BR: translate process/changes.rst
      docs: pt_BR: Add translation for maintainer-handbooks
      docs: pt_BR: add netdev and maintainer handbook translations
      docs/pt_BR: translation of maintainer-soc.rst
      docs/pt_BR: translation of maintainer-soc-clean-dts.rst
      docs: pt_BR: Add translation for process/conclave.rst
      docs: pt_BR: Add translation for KVM x86 maintainer guide

Daniel Tang (1):
      docs: path-lookup: fix unrenamed WALK_GET

David Hildenbrand (Arm) (1):
      docs: filesystems: clarify KernelPageSize vs. MMUPageSize in smaps

Florian Fainelli (1):
      Documentation: Provide hints on how to debug Python GDB scripts

Frederic Weisbecker (1):
      doc: Add CPU Isolation documentation

Gleb Golovko (1):
      docs: fix typo in zoran driver documentation

Haowen Hu (1):
      docs/zh_TW: remove trailing space

Haoyang LIU (2):
      tools/docs/checktransupdate.py: add support for scanning directory
      tools/docs/checktransupdate.py: fix all issues reported by pylint

Harry Wentland (1):
      scripts/checkpatch: add Assisted-by: tag validation

Jonathan Corbet (11):
      docs: Fix an erroneous reference to sphinx.rst
      docs: remove unneeded maintainer_handbooks_main label
      Merge branch 'mauro' into docs-mw
      Merge branch 'mauro' into docs-mw
      Merge branch 'mauro' into docs-mw
      Merge branch 'mauro' into docs-mw
      Merge branch 'docs-fixes' into docs-mw
      Revert "scripts: ver_linux: expand and fix list"
      Revert "scripts/checkpatch: add Assisted-by: tag validation"
      docs: add an Assisted-by mention to submitting-patches.rst
      Merge tag 'Chinese-docs-7.1' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/alexs/linux into tmp

Julia Lawall (1):
      coccinelle: update Coccinelle URL

Kuan-Wei Chiu (2):
      docs: interconnect: Add provider APIs to documentation
      docs: interconnect: Document consumer APIs and drop outdated text

LIU Haoyang (2):
      docs/dev-tools: fix a broken URL in dev-tools/coccinelle.rst
      docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overvi=
ew

Li RongQing (1):
      Documentation/kernel-parameters: fix architecture alignment for pt, n=
opt, and nobypass

Manuel Cortez (1):
      docs: fix typos and duplicated words across documentation

Manuel Ebner (3):
      scripts: ver_linux: expand and fix list
      docs: changes/ver_linux: fix entries and add several tools
      docs: changes.rst and ver_linux: sort the lists

Matteo Martelli (1):
      sched_deadline, docs: fix cpuset example for cgroupv2

Mauro Carvalho Chehab (80):
      docs: kdoc_re: add support for groups()
      docs: kdoc_re: don't go past the end of a line
      docs: kdoc_parser: move var transformers to the beginning
      docs: kdoc_parser: don't mangle with function defines
      docs: kdoc_parser: fix variable regexes to work with size_t
      docs: kdoc_parser: fix the default_value logic for variables
      docs: kdoc_parser: don't exclude defaults from prototype
      docs: kdoc_parser: fix parser to support multi-word types
      docs: kdoc_parser: add support for LIST_HEAD
      docs: kdoc_re: better show KernRe() at documentation
      docs: kdoc_parser: move transform lists to a separate file
      docs: kdoc_re: handle strings and escape chars on NextMatch
      docs: kdoc_re: don't recompile NestedMatch regex every time
      docs: kdoc_re: Change NestedMath args replacement to \0
      docs: kdoc_re: make NestedMatch use KernRe
      docs: kdoc_parser: move nested match transforms to xforms_lists.py
      docs: kdoc_files: allows the caller to use a different xforms class
      docs: kdoc_files: document KernelFiles() ABI
      docs: sphinx-build-wrapper: better handle troff .TH markups
      docs: sphinx-build-wrapper: don't allow "/" on file names
      docs: kdoc_output: use a method to emit the .TH header
      docs: kdoc_output: remove extra attribute on man .TH headers
      docs: kdoc_output: use a single manual for everything
      docs: kdoc_output: don't use a different modulename for functions
      docs: kdoc_output: fix naming for DOC markups
      docs: kdoc_output: describe the class init parameters
      docs: kdoc_output: pick a better default for modulename
      docs: kdoc_output: Change the logic to handle man highlight
      docs: kdoc_output: add a logic to handle tables inside kernel-doc mar=
kups
      docs: kdoc_output: add support to handle code blocks
      docs: kdoc_output: better handle lists
      docs: python: add helpers to run unit tests
      unittests: add a testbench to check public/private kdoc comments
      docs: kdoc: don't add broken comments inside prototypes
      docs: kdoc: properly handle empty enum arguments
      docs: add a C tokenizer to be used by kernel-doc
      docs: kdoc: use tokenizer to handle comments on structs
      unittests: test_private: modify it to use CTokenizer directly
      unittests: test_tokenizer: check if the tokenizer works
      unittests: add a runner to execute all unittests
      docs: kdoc: create a CMatch to match nested C blocks
      tools: unittests: add tests for CMatch
      docs: c_lex: properly implement a sub() method for CMatch
      unittests: test_cmatch: add tests for sub()
      docs: kdoc: replace NestedMatch with CMatch
      docs: kdoc_re: get rid of NestedMatch class
      docs: xforms_lists: handle struct_group directly
      docs: xforms_lists: better evaluate struct_group macros
      docs: c_lex: setup a logger to report tokenizer issues
      docs: kernel-doc.rst: document private: scope propagation
      docs: kdoc: ensure that comments are dropped before calling split_str=
uct_proto()
      docs: kdoc_parser: avoid tokenizing structs everytime
      docs: xforms_lists: use CMatch for all identifiers
      unittests: test_tokenizer: better handle mismatch error
      docs: kdoc_re: better represent long regular expressions
      docs: kdoc: add c_lex to generated documentation
      docs: kdoc_files: use a class to group config parameters
      docs: kdoc_files: move output symbols logic to kdoc_output
      docs: kdoc_item: fix initial value for parameterdesc_start_lines
      docs: kdoc_item: add support to generate a KdocItem from a dict
      docs: kdoc_item: fix a typo on sections_start_lines
      docs: unittests: add a parser to test kernel-doc parser logic
      docs: add a schema to help creating unittests for kernel-doc
      docs: add a simple kdoc-test.yaml together with a validation tool
      docs: test_kdoc_parser: add support for dynamic test creation
      docs: add a new file to write kernel-doc output to a YAML file
      docs: kernel-doc: add support to store output on a YAML file
      MAINTAINERS: update documentation scripts to add unittests
      unittests: test_kdoc_parser: add command line arg to read a YAML file
      docs: tools: include kdoc_yaml_file at documentation
      docs: kdoc_yaml_file: add a representer to make strings look nicer
      docs: kdoc-test.yaml: add more tests
      docs: kdoc_output: fix handling of simple tables
      docs: kdoc: better handle source when producing YAML output
      docs: kdoc_yaml_file: use a better name for the tests
      docs: kdoc_output: raise an error if full_proto not available for var
      docs: c_lex.py: store logger on its data
      doc tools: better handle KBUILD_VERBOSE
      tools: unittest_helper: add a quiet mode
      docs: kdoc_diff: add a helper tool to help checking kdoc regressions

Miquel Sabat=C3=A9 Sol=C3=A0 (1):
      documentation: update arch features

Pranav Kharche (1):
      docs: kernel-parameters: Fix repeated word in initramfs_options entry

Praveen Kumar Singh (1):
      docs: memory-hotplug: fix typo 'fo' -> 'for' in NODE_ADDED_FIRST_MEMO=
RY description

Randy Dunlap (5):
      linux-next: update maintainer info.
      docs: admin-guide: update tiny script for number of taint flags
      docs: kdoc_parser: handle struct member macro VIRTIO_DECLARE_FEATURES=
(name)
      docs: xforms_lists: ignore context analysis and lock attributes
      Docs: hid: intel-ish-hid: make long URL usable

Ricardo Ungerer (1):
      jobserver: Fix typo in docstring

Rito Rhymes (5):
      docs: use logo.svg as favicon
      docs: allow inline literals in paragraphs to wrap to prevent overflow
      docs: contain horizontal overflow in C API descriptions
      docs: allow long table reference links to wrap and prevent overflow
      docs: allow long links to wrap per character to prevent page overflow

Ryan Cheevers (1):
      docs: fix typo in housekeeping

Sebastian Andrzej Siewior (1):
      Documentation: Add managed interrupts

Shubham Chakraborty (2):
      docs: sysctl: add documentation for crypto and debug
      docs: sysctl: Add documentation for /proc/sys/xen/

Song Hongyi (1):
      docs/zh_CN: sync process/2.Process.rst with English version

Steven Rostedt (1):
      tracing: Documentation: Update histogram-design.rst for fn() handling

Sukrut Heroorkar (1):
      Documentation: core-api: real-time: correct spelling

Thorsten Blum (1):
      Documentation/maintainer-tip: Fix grammar

Thorsten Leemhuis (6):
      docs: handling-regressions: add, trim, and sort quotes from Linus
      docs: reporting-issues: mention text is best viewed rendered
      docs: reporting-issues: tweak the reference section intro
      docs: reporting-issues: add conclusion to the step-by-step guide
      docs: verify-bugs-=E2=80=A6 and quickly-build-=E2=80=A6: improve feed=
back section
      docs: reporting-issues: create a proper appendix explaining specialti=
es

Tommaso Cucinotta (1):
      sched/deadline: document new sched_getattr() feature for retrieving c=
urrent parameters for DEADLINE tasks

Tom=C3=A1s Pando (1):
      docs: driver-api: fix 6 spelling typos in Documentation/driver-api

Wolfram Sang (1):
      Documentation: seq_file: drop 2.6 reference

Zenghui Yu (Huawei) (1):
      docs: proc: remove description of prof_cpu_mask

fangqiurong (1):
      sched/doc: Update yield_task description in sched-design-CFS

h3288824963 (1):
      Documentation: printk: Add section about avoiding lockups

 Documentation/admin-guide/bcache.rst               |    2 +-
 Documentation/admin-guide/cpu-isolation.rst        |  357 ++++
 Documentation/admin-guide/index.rst                |    1 +
 Documentation/admin-guide/kernel-parameters.txt    |    8 +-
 .../admin-guide/pm/intel-speed-select.rst          |    2 +-
 .../admin-guide/quickly-build-trimmed-linux.rst    |   14 +-
 Documentation/admin-guide/reporting-issues.rst     |  210 +--
 Documentation/admin-guide/sysctl/crypto.rst        |   47 +
 Documentation/admin-guide/sysctl/debug.rst         |   52 +
 Documentation/admin-guide/sysctl/index.rst         |    9 +-
 Documentation/admin-guide/sysctl/xen.rst           |   31 +
 Documentation/admin-guide/tainted-kernels.rst      |    2 +-
 .../verify-bugs-and-bisect-regressions.rst         |   15 +-
 Documentation/conf.py                              |    1 +
 Documentation/core-api/housekeeping.rst            |    2 +-
 Documentation/core-api/irq/index.rst               |    1 +
 Documentation/core-api/irq/managed_irq.rst         |  116 ++
 Documentation/core-api/memory-hotplug.rst          |    2 +-
 Documentation/core-api/printk-basics.rst           |   36 +
 .../core-api/real-time/architecture-porting.rst    |    2 +-
 Documentation/core-api/real-time/differences.rst   |    2 +-
 Documentation/dev-tools/coccinelle.rst             |    5 +-
 Documentation/doc-guide/kernel-doc.rst             |    6 +
 Documentation/driver-api/acpi/acpi-drivers.rst     |    2 +-
 .../driver-api/cxl/platform/acpi/cedt.rst          |    2 +-
 .../driver-api/cxl/platform/bios-and-efi.rst       |    2 +-
 Documentation/driver-api/dmaengine/pxa_dma.rst     |    2 +-
 .../early-userspace/early_userspace_support.rst    |    2 +-
 Documentation/driver-api/interconnect.rst          |   16 +-
 Documentation/driver-api/libata.rst                |    2 +-
 Documentation/driver-api/media/drivers/zoran.rst   |    2 +-
 Documentation/driver-api/pci/p2pdma.rst            |    2 +-
 .../features/perf/perf-regs/arch-support.txt       |    2 +-
 .../features/perf/perf-stackdump/arch-support.txt  |    2 +-
 Documentation/filesystems/path-lookup.rst          |    2 +-
 Documentation/filesystems/proc.rst                 |   52 +-
 Documentation/filesystems/seq_file.rst             |    2 +-
 Documentation/hid/intel-ish-hid.rst                |    4 +-
 Documentation/mm/hwpoison.rst                      |    2 +-
 Documentation/mm/numa.rst                          |    2 +-
 Documentation/process/2.Process.rst                |    2 +-
 Documentation/process/backporting.rst              |    2 +-
 Documentation/process/changes.rst                  |   58 +-
 .../process/debugging/gdb-kernel-debugging.rst     |    9 +
 Documentation/process/handling-regressions.rst     |  695 +++++---
 Documentation/process/maintainer-handbooks.rst     |    2 -
 Documentation/process/maintainer-tip.rst           |    2 +-
 Documentation/process/submitting-patches.rst       |   12 +-
 Documentation/scheduler/sched-deadline.rst         |   22 +-
 Documentation/scheduler/sched-design-CFS.rst       |    5 +-
 Documentation/sphinx-static/custom.css             |   26 +
 Documentation/sphinx/translations.py               |    1 +
 Documentation/tools/kdoc_ancillary.rst             |   17 +
 Documentation/tools/kdoc_parser.rst                |    8 +
 Documentation/tools/python.rst                     |    2 +
 Documentation/tools/rtla/rtla-hwnoise.rst          |    2 +-
 Documentation/tools/rtla/rtla-osnoise-hist.rst     |    2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst      |    2 +-
 Documentation/tools/rtla/rtla-osnoise.rst          |    2 +-
 Documentation/tools/rtla/rtla-timerlat-hist.rst    |    2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst     |    2 +-
 Documentation/tools/rtla/rtla-timerlat.rst         |    2 +-
 Documentation/tools/rtla/rtla.rst                  |    6 +-
 Documentation/tools/unittest.rst                   |   24 +
 Documentation/trace/histogram-design.rst           |   20 +-
 Documentation/translations/index.rst               |    4 +-
 .../translations/it_IT/process/4.Coding.rst        |    3 +-
 .../ja_JP/process/submitting-patches.rst           |  129 +-
 .../translations/pt_BR/disclaimer-pt_BR.rst        |   11 +
 Documentation/translations/pt_BR/index.rst         |   77 +
 .../translations/pt_BR/process/1.Intro.rst         |  269 ++++
 .../translations/pt_BR/process/changes.rst         |  576 +++++++
 .../translations/pt_BR/process/conclave.rst        |   40 +
 Documentation/translations/pt_BR/process/howto.rst |  637 ++++++++
 .../pt_BR/process/maintainer-handbooks.rst         |   18 +
 .../pt_BR/process/maintainer-kvm-x86.rst           |  435 +++++
 .../pt_BR/process/maintainer-netdev.rst            |  596 +++++++
 .../pt_BR/process/maintainer-soc-clean-dts.rst     |   28 +
 .../translations/pt_BR/process/maintainer-soc.rst  |  222 +++
 .../translations/sp_SP/process/4.Coding.rst        |    3 +-
 .../sp_SP/process/submitting-patches.rst           |    2 +-
 .../sp_SP/scheduler/sched-design-CFS.rst           |    6 +-
 .../zh_CN/dev-tools/testing-overview.rst           |    2 +-
 .../translations/zh_CN/process/2.Process.rst       |   56 +-
 .../translations/zh_CN/process/4.Coding.rst        |    2 +-
 .../translations/zh_CN/rust/arch-support.rst       |    9 +-
 .../translations/zh_CN/rust/coding-guidelines.rst  |  262 ++-
 Documentation/translations/zh_CN/rust/index.rst    |   17 -
 .../translations/zh_CN/rust/quick-start.rst        |  190 ++-
 .../zh_CN/scheduler/sched-design-CFS.rst           |    4 +-
 .../translations/zh_TW/admin-guide/README.rst      |    2 +-
 .../translations/zh_TW/process/4.Coding.rst        |    2 +-
 MAINTAINERS                                        |   10 +-
 scripts/ver_linux                                  |   63 +-
 tools/docs/checktransupdate.py                     |   22 +-
 tools/docs/kdoc_diff                               |  508 ++++++
 tools/docs/kernel-doc                              |   49 +-
 tools/docs/sphinx-build-wrapper                    |   17 +-
 tools/lib/python/jobserver.py                      |    4 +-
 tools/lib/python/kdoc/c_lex.py                     |  662 ++++++++
 tools/lib/python/kdoc/kdoc_files.py                |  151 +-
 tools/lib/python/kdoc/kdoc_item.py                 |   45 +-
 tools/lib/python/kdoc/kdoc_output.py               |  324 +++-
 tools/lib/python/kdoc/kdoc_parser.py               |  292 ++--
 tools/lib/python/kdoc/kdoc_re.py                   |  205 +--
 tools/lib/python/kdoc/kdoc_yaml_file.py            |  178 ++
 tools/lib/python/kdoc/xforms_lists.py              |  153 ++
 tools/lib/python/unittest_helper.py                |  363 +++++
 tools/unittests/kdoc-test-schema.yaml              |  156 ++
 tools/unittests/kdoc-test.yaml                     | 1698 ++++++++++++++++=
++++
 tools/unittests/run.py                             |   17 +
 tools/unittests/test_cmatch.py                     |  821 ++++++++++
 tools/unittests/test_kdoc_parser.py                |  560 +++++++
 tools/unittests/test_kdoc_test_schema.py           |   94 ++
 tools/unittests/test_tokenizer.py                  |  469 ++++++
 115 files changed, 11356 insertions(+), 1057 deletions(-)
 create mode 100644 Documentation/admin-guide/cpu-isolation.rst
 create mode 100644 Documentation/admin-guide/sysctl/crypto.rst
 create mode 100644 Documentation/admin-guide/sysctl/debug.rst
 create mode 100644 Documentation/admin-guide/sysctl/xen.rst
 create mode 100644 Documentation/core-api/irq/managed_irq.rst
 create mode 100644 Documentation/tools/unittest.rst
 create mode 100644 Documentation/translations/pt_BR/disclaimer-pt_BR.rst
 create mode 100644 Documentation/translations/pt_BR/index.rst
 create mode 100644 Documentation/translations/pt_BR/process/1.Intro.rst
 create mode 100644 Documentation/translations/pt_BR/process/changes.rst
 create mode 100644 Documentation/translations/pt_BR/process/conclave.rst
 create mode 100644 Documentation/translations/pt_BR/process/howto.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-han=
dbooks.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-kvm=
-x86.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-net=
dev.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-soc=
-clean-dts.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-soc=
.rst
 create mode 100755 tools/docs/kdoc_diff
 create mode 100644 tools/lib/python/kdoc/c_lex.py
 create mode 100644 tools/lib/python/kdoc/kdoc_yaml_file.py
 create mode 100644 tools/lib/python/kdoc/xforms_lists.py
 create mode 100755 tools/lib/python/unittest_helper.py
 create mode 100644 tools/unittests/kdoc-test-schema.yaml
 create mode 100644 tools/unittests/kdoc-test.yaml
 create mode 100755 tools/unittests/run.py
 create mode 100755 tools/unittests/test_cmatch.py
 create mode 100755 tools/unittests/test_kdoc_parser.py
 create mode 100755 tools/unittests/test_kdoc_test_schema.py
 create mode 100755 tools/unittests/test_tokenizer.py
