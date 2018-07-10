Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 617BC7DE80
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 22:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732263AbeGJWfK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Jul 2018 18:35:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:16477 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732242AbeGJWcW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Jul 2018 18:32:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jul 2018 15:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,335,1526367600"; 
   d="scan'208";a="70305373"
Received: from 2b52.sc.intel.com ([143.183.136.52])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2018 15:31:11 -0700
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [RFC PATCH v2 04/27] x86/fpu/xstate: Add XSAVES system states for shadow stack
Date:   Tue, 10 Jul 2018 15:26:16 -0700
Message-Id: <20180710222639.8241-5-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710222639.8241-1-yu-cheng.yu@intel.com>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Intel Control-flow Enforcement Technology (CET) introduces the
following MSRs into the XSAVES system states.

    IA32_U_CET (user-mode CET settings),
    IA32_PL3_SSP (user-mode shadow stack),
    IA32_PL0_SSP (kernel-mode shadow stack),
    IA32_PL1_SSP (ring-1 shadow stack),
    IA32_PL2_SSP (ring-2 shadow stack).

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/include/asm/fpu/types.h            | 22 +++++++++++++++++++++
 arch/x86/include/asm/fpu/xstate.h           |  4 +++-
 arch/x86/include/uapi/asm/processor-flags.h |  2 ++
 arch/x86/kernel/fpu/xstate.c                | 10 ++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index 202c53918ecf..e55d51d172f1 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -114,6 +114,9 @@ enum xfeature {
 	XFEATURE_Hi16_ZMM,
 	XFEATURE_PT_UNIMPLEMENTED_SO_FAR,
 	XFEATURE_PKRU,
+	XFEATURE_RESERVED,
+	XFEATURE_SHSTK_USER,
+	XFEATURE_SHSTK_KERNEL,
 
 	XFEATURE_MAX,
 };
@@ -128,6 +131,8 @@ enum xfeature {
 #define XFEATURE_MASK_Hi16_ZMM		(1 << XFEATURE_Hi16_ZMM)
 #define XFEATURE_MASK_PT		(1 << XFEATURE_PT_UNIMPLEMENTED_SO_FAR)
 #define XFEATURE_MASK_PKRU		(1 << XFEATURE_PKRU)
+#define XFEATURE_MASK_SHSTK_USER	(1 << XFEATURE_SHSTK_USER)
+#define XFEATURE_MASK_SHSTK_KERNEL	(1 << XFEATURE_SHSTK_KERNEL)
 
 #define XFEATURE_MASK_FPSSE		(XFEATURE_MASK_FP | XFEATURE_MASK_SSE)
 #define XFEATURE_MASK_AVX512		(XFEATURE_MASK_OPMASK \
@@ -229,6 +234,23 @@ struct pkru_state {
 	u32				pad;
 } __packed;
 
+/*
+ * State component 11 is Control flow Enforcement user states
+ */
+struct cet_user_state {
+	u64 u_cet;	/* user control flow settings */
+	u64 user_ssp;	/* user shadow stack pointer */
+} __packed;
+
+/*
+ * State component 12 is Control flow Enforcement kernel states
+ */
+struct cet_kernel_state {
+	u64 kernel_ssp;	/* kernel shadow stack */
+	u64 pl1_ssp;	/* ring-1 shadow stack */
+	u64 pl2_ssp;	/* ring-2 shadow stack */
+} __packed;
+
 struct xstate_header {
 	u64				xfeatures;
 	u64				xcomp_bv;
diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xstate.h
index a32dc5f8c963..662562cbafe9 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -31,7 +31,9 @@
 				  XFEATURE_MASK_Hi16_ZMM | \
 				  XFEATURE_MASK_PKRU | \
 				  XFEATURE_MASK_BNDREGS | \
-				  XFEATURE_MASK_BNDCSR)
+				  XFEATURE_MASK_BNDCSR | \
+				  XFEATURE_MASK_SHSTK_USER | \
+				  XFEATURE_MASK_SHSTK_KERNEL)
 
 #ifdef CONFIG_X86_64
 #define REX_PREFIX	"0x48, "
diff --git a/arch/x86/include/uapi/asm/processor-flags.h b/arch/x86/include/uapi/asm/processor-flags.h
index bcba3c643e63..25311ec4b731 100644
--- a/arch/x86/include/uapi/asm/processor-flags.h
+++ b/arch/x86/include/uapi/asm/processor-flags.h
@@ -130,6 +130,8 @@
 #define X86_CR4_SMAP		_BITUL(X86_CR4_SMAP_BIT)
 #define X86_CR4_PKE_BIT		22 /* enable Protection Keys support */
 #define X86_CR4_PKE		_BITUL(X86_CR4_PKE_BIT)
+#define X86_CR4_CET_BIT		23 /* enable Control flow Enforcement */
+#define X86_CR4_CET		_BITUL(X86_CR4_CET_BIT)
 
 /*
  * x86-64 Task Priority Register, CR8
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index dd2c561c4544..91c0f665567b 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -35,6 +35,9 @@ static const char *xfeature_names[] =
 	"Processor Trace (unused)"	,
 	"Protection Keys User registers",
 	"unknown xstate feature"	,
+	"Control flow User registers"	,
+	"Control flow Kernel registers"	,
+	"unknown xstate feature"	,
 };
 
 static short xsave_cpuid_features[] __initdata = {
@@ -48,6 +51,9 @@ static short xsave_cpuid_features[] __initdata = {
 	X86_FEATURE_AVX512F,
 	X86_FEATURE_INTEL_PT,
 	X86_FEATURE_PKU,
+	0,		   /* Unused */
+	X86_FEATURE_SHSTK, /* XFEATURE_SHSTK_USER */
+	X86_FEATURE_SHSTK, /* XFEATURE_SHSTK_KERNEL */
 };
 
 /*
@@ -316,6 +322,8 @@ static void __init print_xstate_features(void)
 	print_xstate_feature(XFEATURE_MASK_ZMM_Hi256);
 	print_xstate_feature(XFEATURE_MASK_Hi16_ZMM);
 	print_xstate_feature(XFEATURE_MASK_PKRU);
+	print_xstate_feature(XFEATURE_MASK_SHSTK_USER);
+	print_xstate_feature(XFEATURE_MASK_SHSTK_KERNEL);
 }
 
 /*
@@ -562,6 +570,8 @@ static void check_xstate_against_struct(int nr)
 	XCHECK_SZ(sz, nr, XFEATURE_ZMM_Hi256, struct avx_512_zmm_uppers_state);
 	XCHECK_SZ(sz, nr, XFEATURE_Hi16_ZMM,  struct avx_512_hi16_state);
 	XCHECK_SZ(sz, nr, XFEATURE_PKRU,      struct pkru_state);
+	XCHECK_SZ(sz, nr, XFEATURE_SHSTK_USER,   struct cet_user_state);
+	XCHECK_SZ(sz, nr, XFEATURE_SHSTK_KERNEL, struct cet_kernel_state);
 
 	/*
 	 * Make *SURE* to add any feature numbers in below if
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
