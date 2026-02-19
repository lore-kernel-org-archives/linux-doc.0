Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13B630BBB7;
	Thu, 19 Feb 2026 23:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771544292; cv=none; b=P0x1Q5yUtunzwm+7vy9I2yMcomof3EMEvxbXB1ulhYuDJDDCyErFNFJBmVZPHtur2EQVbC6/7zxP6wpalm/L93e/z+C6W8zf2F5zLtYu4MeNJ8cy9VbMW8XVtQuQJrjC/t9RJ5EzOQdSnWVvaVfcR4BX859tCDWCuSKAQxUO5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771544292; c=relaxed/simple;
	bh=MhOZJua0PouCiI8MZEs15/KCfXiv1uJqvK9DjTy5C1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0oWH6XDxAUgWHrrq7CWeuL4fH0Z+sL4ehGBZk3muoQvETNaFuQEQiS64y7XpZIsaqHI+6e3p7DDgtzeYbGJx2VfnJHMkoUWIOvkU/FhY110rixtWFihFduDk+XfmMgPytJb6GN3T9bT5lkb4PzITJS8NLwLDxZm6jrJ/tdXwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PA2vo5mG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PA2vo5mG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771544291; x=1803080291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MhOZJua0PouCiI8MZEs15/KCfXiv1uJqvK9DjTy5C1s=;
  b=PA2vo5mGbrG9ZFbt9xNdfMO3gQqeOJiLoT1nDgx4JhhJSPnSVuSh7++J
   06oj417i1FJMSpH8kUYYeIh+zx03HvBmG+cY2Bo15eQYJZvNTF9/MSYFz
   FS420Dz/FqmkYWllGxb9EwueWYiyk2TarGIe+yWv6cFVhqQcXd0CkkCSE
   h5LcQu9aBHdSw9YvwSJ46B6SY8k9NqJRWLL3DrkWJBCLLKcyx8Zb6EZ3W
   ZTshXeQEWZa2ko7rP7wJk34H+H8nB/XmttxfCJVMOyVlpWZcwoNyB+gtw
   X7Bg2QSr0h4ru4sfbkK+lCP4AcpyZvrP6DnH2YAnAGGm8SsZYhq6jynji
   g==;
X-CSE-ConnectionGUID: QVNKATXCQMOVGRdEeMPeCg==
X-CSE-MsgGUID: Kg7kKFFiRDaXO1s4KMEarg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72685727"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72685727"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 15:38:10 -0800
X-CSE-ConnectionGUID: qUb7aequRw6F2kKnKn7Z1Q==
X-CSE-MsgGUID: 1Kdc/I9iTtyjtbIpjsIa3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214805196"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 15:38:10 -0800
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
Subject: [PATCH 3/5] x86/vsyscall: Add vsyscall emulation for #GP
Date: Thu, 19 Feb 2026 15:35:58 -0800
Message-ID: <20260219233600.154313-4-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219233600.154313-1-sohil.mehta@intel.com>
References: <20260219233600.154313-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy vsyscall page is mapped at a fixed address in the kernel
address range 0xffffffffff600000-0xffffffffff601000. Prior to LASS, a
vsyscall page access from userspace would always generate a #PF. The
kernel emulates the execute (XONLY) accesses in the #PF handler and
returns the appropriate values to userspace.

With LASS, these accesses are intercepted before the paging structures
are traversed triggering a #GP instead of a #PF. The #GP doesn't provide
much information in terms of the error code.

However, as clarified in the SDM, the LASS violation only triggers after
an instruction fetch happens from the vsyscall address. So, the faulting
RIP, which is preserved in the user registers, can be used to determine
if the #GP was triggered due to a vsyscall access in XONLY mode.

Reuse the common emulation code during a #GP and emulate the vsyscall
access in XONLY mode without going through complex instruction decoding.
Note, this doesn't work for EMULATE mode which maps the vsyscall page as
readable.

Add an extra check in the common emulation code to ensure that the fault
really happened in 64-bit user mode. This is primarily a sanity check
with the #GP handler reusing the emulation code.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/entry/vsyscall/vsyscall_64.c | 22 +++++++++++++++++-----
 arch/x86/include/asm/vsyscall.h       |  6 ++++++
 arch/x86/kernel/traps.c               |  4 ++++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index 5c6559c37c5b..b34c8763d5e9 100644
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
@@ -282,6 +281,19 @@ bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs,
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
index e21f8ad2f9d7..a896f9225434 100644
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

