Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB291C4320E
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 23:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 829806113B
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 23:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242384AbhHEXbY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 19:31:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:6544 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242380AbhHEXbY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 19:31:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="201448375"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="201448375"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 16:31:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="481043903"
Received: from rmgular-mobl2.amr.corp.intel.com (HELO skuppusw-desk1.amr.corp.intel.com) ([10.251.138.25])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 16:31:08 -0700
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
Subject: [PATCH v3 3/5] x86/tdx: Expose TDX Guest #VE count in /proc/interrupts
Date:   Thu,  5 Aug 2021 16:30:34 -0700
Message-Id: <20210805233036.2949674-4-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805233036.2949674-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20210805233036.2949674-1-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support to expose TD Guest Virtualization Exception (#VE) count
in /proc/interrupts. It is useful in performance analysis of TD Guest.

Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v2:
 * None

 arch/x86/include/asm/hardirq.h | 3 +++
 arch/x86/kernel/irq.c          | 6 ++++++
 arch/x86/kernel/traps.c        | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/hardirq.h b/arch/x86/include/asm/hardirq.h
index 275e7fd20310..07d79fa9c5c6 100644
--- a/arch/x86/include/asm/hardirq.h
+++ b/arch/x86/include/asm/hardirq.h
@@ -44,6 +44,9 @@ typedef struct {
 	unsigned int irq_hv_reenlightenment_count;
 	unsigned int hyperv_stimer0_count;
 #endif
+#if IS_ENABLED(CONFIG_INTEL_TDX_GUEST)
+	unsigned int tdg_ve_count;
+#endif
 } ____cacheline_aligned irq_cpustat_t;
 
 DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index e28f6a5d14f1..669869bd46ec 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -181,6 +181,12 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 		seq_printf(p, "%10u ",
 			   irq_stats(j)->kvm_posted_intr_wakeup_ipis);
 	seq_puts(p, "  Posted-interrupt wakeup event\n");
+#endif
+#if IS_ENABLED(CONFIG_INTEL_TDX_GUEST)
+	seq_printf(p, "%*s: ", prec, "TGV");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->tdg_ve_count);
+	seq_puts(p, "  TDX Guest VE event\n");
 #endif
 	return 0;
 }
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index be56f0281cb5..3673186876ec 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -1187,6 +1187,8 @@ DEFINE_IDTENTRY(exc_virtualization_exception)
 
 	RCU_LOCKDEP_WARN(!rcu_is_watching(), "entry code didn't wake RCU");
 
+	inc_irq_stat(tdg_ve_count);
+
 	/*
 	 * NMIs/Machine-checks/Interrupts will be in a disabled state
 	 * till TDGETVEINFO TDCALL is executed. This prevents #VE
-- 
2.25.1

