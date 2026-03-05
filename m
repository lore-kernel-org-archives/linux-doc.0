Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78B735F180;
	Thu,  5 Mar 2026 21:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746982; cv=none; b=BddsQOgDhKQJ266mfmIO2Kdf35aeR5wFnBihXXylitU0u/uuPjDy1jYjhnTUpGlFQ6v0ZVih5nyr/8e0VLcl6Rc3Ayto6EE8EF7Kpsjxs4xtVnHelgNipJgi1UlCMP027cIXgUajiWKzPOIX78XU0pzbJQK1vlP5mtfKO3XgLss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746982; c=relaxed/simple;
	bh=z2r3KorHteDgQLOuiYVS8zVcbfrFsAeLqgofdqmOQ8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOvvqJfu92Ubf0FjmzcsX5hkC8XEFQWn9XxX6VsHNdjoM2IipILplZaHUShpHWbvAtgmMZTcUNamwtoii8l0KL6p+5UYCrDFqp7hWi73nHb8IuwYF5WrBZds6BX8ou/NFbAKDCJs7pd6PFbWklTu72/3/FkVnTHBsXmWYKWKwYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDj/j6PP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDj/j6PP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772746981; x=1804282981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z2r3KorHteDgQLOuiYVS8zVcbfrFsAeLqgofdqmOQ8o=;
  b=UDj/j6PPyAUwIldx5pG7gsUutvQzgkBxJ8fomkGb9qWiTOpEkQoupTP9
   07oRoo7TDSxYE3mVceChrwY1UIbDfaBAyVU2g2fbH4okhP45w50cAo0I3
   ejnvjntcG2Jc8ag2CuMdCVJbqsvcvpShI8NYHE+DUZneIHRDJ7123wYhJ
   goaZT+NLsv/lvNReelPe+0H2gvKwfhZws6BDYIWQG1Iggz7UjR0K0U1hP
   Cz0Zvt45j+uJH8QLkuD+GFKw4BTL2vsL/i6umpjHZ32nkPYLBeZ+l+Ja/
   Ew91rBfrRFAeJmnf8qBtYpaX3+mHFj0ZqELfDsq4vto2XTqQ46GkWTr3V
   Q==;
X-CSE-ConnectionGUID: +G/2GHtNRkSCBf0yze5gkA==
X-CSE-MsgGUID: eUbiIp2xQiGjzn0gEzstlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73043889"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73043889"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 13:42:58 -0800
X-CSE-ConnectionGUID: heZ3F5HrSmi0ewMtaxduXA==
X-CSE-MsgGUID: 2QAQxoOOSLeUpvJs0b0Jbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="215562941"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 13:42:58 -0800
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
Subject: [PATCH v2 3/5] x86/vsyscall: Restore vsyscall=xonly mode under LASS
Date: Thu,  5 Mar 2026 13:40:24 -0800
Message-ID: <20260305214026.3887452-4-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305214026.3887452-1-sohil.mehta@intel.com>
References: <20260305214026.3887452-1-sohil.mehta@intel.com>
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
---
v2:
 - Rewrote the commit message
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

