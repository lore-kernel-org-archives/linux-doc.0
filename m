Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0692FC4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 23:31:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB5CB61104
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 23:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237674AbhHEXbW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 19:31:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:6542 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236808AbhHEXbW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 19:31:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="201448365"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="201448365"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 16:31:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="481043884"
Received: from rmgular-mobl2.amr.corp.intel.com (HELO skuppusw-desk1.amr.corp.intel.com) ([10.251.138.25])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 16:31:06 -0700
From:   Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>
Subject: [PATCH v3 0/5] Add TDX Guest Support (Debug support)
Date:   Thu,  5 Aug 2021 16:30:31 -0700
Message-Id: <20210805233036.2949674-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi All,

Intel's Trust Domain Extensions (TDX) protect guest VMs from malicious
hosts and some physical attacks.

Following patches adds tracepoint support for TDX Guest TDCALL requests
and #VE exceptions. It also includes helper function to detect TD-DEBUG
mode which will be used by patches in other TDX series to add TD-DEBUG
mode specific features support.

This series is the continuation of the following TDX guest related patches.

[set 1, v5] - https://lore.kernel.org/patchwork/project/lkml/list/?series=510805
[set 2, v4] - https://lore.kernel.org/patchwork/project/lkml/list/?series=510814
[set 3, v4] - https://lore.kernel.org/patchwork/project/lkml/list/?series=510816
[set 4, v4] - https://lore.kernel.org/patchwork/project/lkml/list/?series=510836

Also please note that this series alone is not necessarily fully
functional. You need to apply all the above 4 patch series to get 
a fully functional TDX guest.

Changes since v2:
 * Added taint flag support for TDX overrides.
 * Moved patch titled "x86/tdx: Add tdg_debug_enabled() interface" to
   the patch series which actually uses it.
 * Added support to override protected guest flags.

Changes since v1:
 * Rebased on top of v5.14-rc1.

Andi Kleen (2):
  Add taint flag for TDX overrides
  x86/tdx: Add option to override prot values

Kuppuswamy Sathyanarayanan (2):
  x86/tdx: Add TDCALL tracepoint
  x86/tdx: Expose TDX Guest #VE count in /proc/interrupts

Sean Christopherson (1):
  x86/tdx: Add #VE tracepoint

 .../admin-guide/kernel-parameters.txt         |   8 +
 Documentation/admin-guide/tainted-kernels.rst |   7 +-
 arch/x86/include/asm/hardirq.h                |   3 +
 arch/x86/include/asm/tdx.h                    |   2 +
 arch/x86/include/asm/trace/tdx.h              | 158 ++++++++++++++++++
 arch/x86/kernel/irq.c                         |   6 +
 arch/x86/kernel/tdx.c                         |  88 ++++++++--
 arch/x86/kernel/traps.c                       |   2 +
 include/linux/panic.h                         |   3 +-
 kernel/panic.c                                |   1 +
 10 files changed, 263 insertions(+), 15 deletions(-)
 create mode 100644 arch/x86/include/asm/trace/tdx.h

-- 
2.25.1

