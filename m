Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 960607D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 14:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934742AbeFGOmf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 10:42:35 -0400
Received: from mga17.intel.com ([192.55.52.151]:61234 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933109AbeFGOma (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 10:42:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2018 07:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,486,1520924400"; 
   d="scan'208";a="235505935"
Received: from 2b52.sc.intel.com ([143.183.136.51])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2018 07:42:29 -0700
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH 0/7] Control Flow Enforcement - Part (4)
Date:   Thu,  7 Jun 2018 07:38:48 -0700
Message-Id: <20180607143855.3681-1-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.15.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series introduces CET - indirect branch tracking

The major task of indirect branch tracking is for the compiler to
insert the ENDBR instructions at all valid branch targets.

The kernel provides:
	CPUID enumeration and feature setup;
	Legacy bitmap allocation;
	Some basic supporting routines.

In this patch, there are also a CET command-line utility and
PTRACE support.

H.J. Lu (2):
  x86: Insert endbr32/endbr64 to vDSO
  tools: Add cetcmd

Yu-cheng Yu (5):
  x86/cet: Add Kconfig option for user-mode Indirect Branch Tracking
  x86/cet: User-mode indirect branch tracking support
  mm/mmap: Add IBT bitmap size to address space limit check
  x86/cet: add arcp_prctl functions for indirect branch tracking
  x86/cet: Add PTRACE interface for CET

 arch/x86/Kconfig                               |  12 +++
 arch/x86/entry/vdso/.gitignore                 |   4 +
 arch/x86/entry/vdso/Makefile                   |  34 +++++++
 arch/x86/entry/vdso/endbr.sh                   |  32 ++++++
 arch/x86/include/asm/cet.h                     |   9 ++
 arch/x86/include/asm/disabled-features.h       |   8 +-
 arch/x86/include/asm/fpu/regset.h              |   7 +-
 arch/x86/include/uapi/asm/prctl.h              |   1 +
 arch/x86/include/uapi/asm/resource.h           |   5 +
 arch/x86/kernel/cet.c                          |  73 ++++++++++++++
 arch/x86/kernel/cet_prctl.c                    |  54 +++++++++-
 arch/x86/kernel/cpu/common.c                   |  20 +++-
 arch/x86/kernel/elf.c                          |  19 +++-
 arch/x86/kernel/fpu/regset.c                   |  41 ++++++++
 arch/x86/kernel/process.c                      |   2 +
 arch/x86/kernel/ptrace.c                       |  16 +++
 include/uapi/asm-generic/resource.h            |   3 +
 include/uapi/linux/elf.h                       |   1 +
 mm/mmap.c                                      |   8 +-
 tools/Makefile                                 |  13 +--
 tools/arch/x86/include/uapi/asm/elf_property.h |  16 +++
 tools/arch/x86/include/uapi/asm/prctl.h        |  33 ++++++
 tools/cet/.gitignore                           |   1 +
 tools/cet/Makefile                             |  11 ++
 tools/cet/cetcmd.c                             | 134 +++++++++++++++++++++++++
 tools/include/uapi/asm/elf_property.h          |   4 +
 tools/include/uapi/asm/prctl.h                 |   4 +
 27 files changed, 549 insertions(+), 16 deletions(-)
 create mode 100644 arch/x86/entry/vdso/endbr.sh
 create mode 100644 tools/arch/x86/include/uapi/asm/elf_property.h
 create mode 100644 tools/arch/x86/include/uapi/asm/prctl.h
 create mode 100644 tools/cet/.gitignore
 create mode 100644 tools/cet/Makefile
 create mode 100644 tools/cet/cetcmd.c
 create mode 100644 tools/include/uapi/asm/elf_property.h
 create mode 100644 tools/include/uapi/asm/prctl.h

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
