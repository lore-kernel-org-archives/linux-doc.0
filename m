Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A8D2FD695;
	Mon,  9 Mar 2026 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079963; cv=none; b=NdxDokDIGdhuZhtURILk12XljxiWPTEGIE0uVwHjKKSNuyVCi4Kl/3UMPnXKdB1+rRonyJRI5oPiMDXaCtzKrYdiezRfbzs1wb34FcInKSGd/qOesXk59qkuajSrYQGmjjmFpEAUspQ3Yuny997TaRicgQKObh7vyuyXyEltf3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079963; c=relaxed/simple;
	bh=n9R5ZYXCcp7UGrAzZghqZU527LLKI9taOUYp1CkiIbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQy/mPCOYdb6hmR6iEFx7UiyCE0Mx1QOVZB6MsBsjkYk/5x2U7apUQP9FWvHOAbLEAv7Lr8t2ivHhKIp5AIpENBB5eBGSDnrfvMoC/tqu826YZEOdwdxHtWfNOJZkCBeu0/4X+C+sfDmwQQ7Rg6Vhtims6aUAYBb29kEogTCFAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZwfoVRp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZwfoVRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773079962; x=1804615962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n9R5ZYXCcp7UGrAzZghqZU527LLKI9taOUYp1CkiIbE=;
  b=cZwfoVRpyAdwvUn7LLouQmcE2BQtz5fv4JHRy0r2z15rV6YpcbI/2zJC
   xB3mLqOg6bTAPuykojDs9KQDRPG9HQm0DHoxDXHoJcPsUCIQYyW+ld/jw
   FYbYG9T5ExSL1EDZobtEkj82B3zvY6GT89eBkAwG2/85510sDc40mSAln
   HbfzGY5fDmft6TQwLpzvp5sLXEE/M4swRcGjJsGxYMYdQtJh35iyVDYWN
   gp9ITkhr9S9aoMaVtGfzwpCzprieqWcOBlwjoJXxZYIr4XPiB9ptOAsq+
   4003+zCt//FRVOa7j9PvgLEb0id/y1U2NpkLN5sRAt0dnFt4h7b/137ML
   A==;
X-CSE-ConnectionGUID: jsoTBEP/Qs6Q1CWzefVlJA==
X-CSE-MsgGUID: ONlj6MAsRK6xM5ZBY4kumg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73992057"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73992057"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 11:12:41 -0700
X-CSE-ConnectionGUID: kkmcXaibRAC2NyAnVHV6tQ==
X-CSE-MsgGUID: Cf+YSycvSi+YaMunfPh5iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224774464"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2026 11:12:41 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Nam Cao <namcao@linutronix.de>,
	Cedric Xing <cedric.xing@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tony Luck <tony.luck@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] x86/vsyscall: Restore vsyscall=xonly mode under LASS
Date: Mon,  9 Mar 2026 11:10:27 -0700
Message-ID: <20260309181029.398498-4-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309181029.398498-1-sohil.mehta@intel.com>
References: <20260309181029.398498-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Background
==========
The vsyscall page is located in the high/kernel part of the address
space. Prior to LASS, a vsyscall page access from userspace would always
generate a #PF. The kernel emulates the accesses in the #PF handler and
returns the appropriate values to userspace.

Vsyscall emulation has two modes of operation, specified by the
vsyscall={xonly, emulate} kernel command line option. The vsyscall page
behaves as execute-only in XONLY mode or read-execute in EMULATE mode.
XONLY mode is the default and the only one expected to be commonly used.
The EMULATE mode has been deprecated since 2022 and is considered
insecure.

With LASS, a vsyscall page access triggers a #GP instead of a #PF.
Currently, LASS is only enabled when all vsyscall modes are disabled.

LASS with XONLY mode
====================
Now add support for LASS specifically with XONLY vsyscall emulation. For
XONLY mode, all that is needed is the faulting RIP, which is trivially
available regardless of the type of fault. Reuse the #PF emulation code
during the #GP when the fault address points to the vsyscall page.

As multiple fault handlers will now be using the emulation code, add a
sanity check to ensure that the fault truly happened in 64-bit user
mode.

LASS with EMULATE mode
======================
Supporting vsyscall=emulate with LASS is much harder because the #GP
doesn't provide enough error information (such as PFEC and CR2 as in
case of a #PF). So, complex instruction decoding would be required to
emulate this mode in the #GP handler.

This isn't worth the effort as remaining users of EMULATE mode can be
reasonably assumed to be niche users, who are already trading off
security for compatibility. LASS and vsyscall=emulate will be kept
mutually exclusive for simplicity.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
v3:
 - Pick up review and tested-by tags.

v2:
 - Rewrote the commit message
---
 arch/x86/entry/vsyscall/vsyscall_64.c | 22 +++++++++++++++++-----
 arch/x86/include/asm/vsyscall.h       |  6 ++++++
 arch/x86/kernel/traps.c               |  4 ++++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index 398b1ed16f1e..e740f3b42278 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -23,7 +23,7 @@
  * soon be no new userspace code that will ever use a vsyscall.
  *
  * The code in this file emulates vsyscalls when notified of a page
- * fault to a vsyscall address.
+ * fault or a general protection fault to a vsyscall address.
  */
 
 #include <linux/kernel.h>
@@ -118,10 +118,9 @@ static bool __emulate_vsyscall(struct pt_regs *regs, unsigned long address)
 	long ret;
 	unsigned long orig_dx;
 
-	/*
-	 * No point in checking CS -- the only way to get here is a user mode
-	 * trap to a high address, which means that we're in 64-bit user code.
-	 */
+	/* Confirm that the fault happened in 64-bit user mode */
+	if (!user_64bit_mode(regs))
+		return false;
 
 	if (vsyscall_mode == NONE) {
 		warn_bad_vsyscall(KERN_INFO, regs,
@@ -284,6 +283,19 @@ bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs,
 	return __emulate_vsyscall(regs, address);
 }
 
+bool emulate_vsyscall_gp(struct pt_regs *regs)
+{
+	/* Without LASS, vsyscall accesses are expected to generate a #PF */
+	if (!cpu_feature_enabled(X86_FEATURE_LASS))
+		return false;
+
+	/* Emulate only if the RIP points to the vsyscall address */
+	if (!is_vsyscall_vaddr(regs->ip))
+		return false;
+
+	return __emulate_vsyscall(regs, regs->ip);
+}
+
 /*
  * A pseudo VMA to allow ptrace access for the vsyscall page.  This only
  * covers the 64bit vsyscall page now. 32bit has a real VMA now and does
diff --git a/arch/x86/include/asm/vsyscall.h b/arch/x86/include/asm/vsyscall.h
index f34902364972..538053b1656a 100644
--- a/arch/x86/include/asm/vsyscall.h
+++ b/arch/x86/include/asm/vsyscall.h
@@ -15,6 +15,7 @@ extern void set_vsyscall_pgtable_user_bits(pgd_t *root);
  * Returns true if handled.
  */
 bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs, unsigned long address);
+bool emulate_vsyscall_gp(struct pt_regs *regs);
 #else
 static inline void map_vsyscall(void) {}
 static inline bool emulate_vsyscall_pf(unsigned long error_code,
@@ -22,6 +23,11 @@ static inline bool emulate_vsyscall_pf(unsigned long error_code,
 {
 	return false;
 }
+
+static inline bool emulate_vsyscall_gp(struct pt_regs *regs)
+{
+	return false;
+}
 #endif
 
 /*
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 614a281bd419..0ca3912ecb7f 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -70,6 +70,7 @@
 #include <asm/tdx.h>
 #include <asm/cfi.h>
 #include <asm/msr.h>
+#include <asm/vsyscall.h>
 
 #ifdef CONFIG_X86_64
 #include <asm/x86_init.h>
@@ -938,6 +939,9 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
 		if (fixup_umip_exception(regs))
 			goto exit;
 
+		if (emulate_vsyscall_gp(regs))
+			goto exit;
+
 		gp_user_force_sig_segv(regs, X86_TRAP_GP, error_code, desc);
 		goto exit;
 	}
-- 
2.43.0

