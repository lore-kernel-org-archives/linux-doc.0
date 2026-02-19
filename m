Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E163A1D5CD9;
	Thu, 19 Feb 2026 23:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771544291; cv=none; b=VpTvMpc/+bZMZ5Wa+eOkt6HeX5GUz4BzHuVE3Y8PfIwZhk9jNvTwaqWYZhBK7FfCX2FGXlaPPaclgXUO8U53B8WY8k+xU/9EnH3Np+lYc6L8IY43XQ4I06GWi2wKPqzOyQpHx/CYl3y9qAE73TajlFyMs7sp1rXfWMKf6yhKYq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771544291; c=relaxed/simple;
	bh=sUnxRmePbDNVJguI5BQGGnhht0CrViyCGX1gaDyH53s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Si6Yxm1/NUzzjVD9TgvRZ3bszSiRDQ7afP0SQGKcrOycOMwWMdpQcEmw66SBNexCakE03PmugKK7AGbBuobPdRCkR4goyVEornD5OMpKeefc0VkrDjzvNzpfQvv6UXMYCqlUsrwW7qpvY3RwC4rpvL0cXGJlDeuItod401IuTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBHmx0q+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBHmx0q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771544290; x=1803080290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sUnxRmePbDNVJguI5BQGGnhht0CrViyCGX1gaDyH53s=;
  b=LBHmx0q+xZyN8Jl/Fj5YQfQ8YZBLL2SRccWP6cQHma3tLGy8SiPmkLOf
   csvvGkM9TMiusDdhpBJLBaaP4jzUou3G2LDnXCOofyOqGQNP11pevvHv7
   njVKDUvJV/AuVi81HeTZR5aYuIsui22PBhbUEKN7moyliQf0/P7TttMHl
   ecH64Ge8JZF8I7OzL8VinJ/8QVRgfAFiYmdNZqQSBXY7KVgUH6LpKl/73
   ATWyTPo8VjNrGn+TKwPzfXc43xYLzvPQoDrU+lHItx2/ncCSR5yotmNb+
   H6k3oRUu6g82DcE8dLeoCzKMnBA4lie97ZRlp2VBQLxvcd0upWavg0mdw
   Q==;
X-CSE-ConnectionGUID: Y2lYJ0sTSSGg9FCNzAbl4A==
X-CSE-MsgGUID: 0FDC/ULdTiel6L8YIFPq5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72685703"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72685703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 15:38:08 -0800
X-CSE-ConnectionGUID: fxDMCSdnSIih1ObLWm+NEQ==
X-CSE-MsgGUID: hcv8FBQxQi+Jl+MEQEGLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214805177"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 15:38:08 -0800
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
Subject: [PATCH 1/5] x86/vsyscall: Reorganize the page fault emulation code
Date: Thu, 19 Feb 2026 15:35:56 -0800
Message-ID: <20260219233600.154313-2-sohil.mehta@intel.com>
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

With LASS, vsyscall page accesses will cause a #GP instead of a #PF.
Separate out the core vsyscall emulation code from the #PF specific
handling in preparation for the upcoming #GP emulation.

No functional change intended.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/entry/vsyscall/vsyscall_64.c | 64 ++++++++++++++-------------
 arch/x86/include/asm/vsyscall.h       |  7 ++-
 arch/x86/mm/fault.c                   |  2 +-
 3 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index 4bd1e271bb22..5c6559c37c5b 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -111,43 +111,13 @@ static bool write_ok_or_segv(unsigned long ptr, size_t size)
 	}
 }
 
-bool emulate_vsyscall(unsigned long error_code,
-		      struct pt_regs *regs, unsigned long address)
+static bool __emulate_vsyscall(struct pt_regs *regs, unsigned long address)
 {
 	unsigned long caller;
 	int vsyscall_nr, syscall_nr, tmp;
 	long ret;
 	unsigned long orig_dx;
 
-	/* Write faults or kernel-privilege faults never get fixed up. */
-	if ((error_code & (X86_PF_WRITE | X86_PF_USER)) != X86_PF_USER)
-		return false;
-
-	/*
-	 * Assume that faults at regs->ip are because of an
-	 * instruction fetch. Return early and avoid
-	 * emulation for faults during data accesses:
-	 */
-	if (address != regs->ip) {
-		/* Failed vsyscall read */
-		if (vsyscall_mode == EMULATE)
-			return false;
-
-		/*
-		 * User code tried and failed to read the vsyscall page.
-		 */
-		warn_bad_vsyscall(KERN_INFO, regs, "vsyscall read attempt denied -- look up the vsyscall kernel parameter if you need a workaround");
-		return false;
-	}
-
-	/*
-	 * X86_PF_INSTR is only set when NX is supported.  When
-	 * available, use it to double-check that the emulation code
-	 * is only being used for instruction fetches:
-	 */
-	if (cpu_feature_enabled(X86_FEATURE_NX))
-		WARN_ON_ONCE(!(error_code & X86_PF_INSTR));
-
 	/*
 	 * No point in checking CS -- the only way to get here is a user mode
 	 * trap to a high address, which means that we're in 64-bit user code.
@@ -280,6 +250,38 @@ bool emulate_vsyscall(unsigned long error_code,
 	return true;
 }
 
+bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs,
+			 unsigned long address)
+{
+	/* Write faults or kernel-privilege faults never get fixed up. */
+	if ((error_code & (X86_PF_WRITE | X86_PF_USER)) != X86_PF_USER)
+		return false;
+
+	/*
+	 * Assume that faults at regs->ip are because of an instruction
+	 * fetch. Return early and avoid emulation for faults during
+	 * data accesses:
+	 */
+	if (address != regs->ip) {
+		 /* User code tried and failed to read the vsyscall page. */
+		if (vsyscall_mode != EMULATE)
+			warn_bad_vsyscall(KERN_INFO, regs,
+					  "vsyscall read attempt denied -- look up the vsyscall kernel parameter if you need a workaround");
+
+		return false;
+	}
+
+	/*
+	 * X86_PF_INSTR is only set when NX is supported.  When
+	 * available, use it to double-check that the emulation code
+	 * is only being used for instruction fetches:
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_NX))
+		WARN_ON_ONCE(!(error_code & X86_PF_INSTR));
+
+	return __emulate_vsyscall(regs, address);
+}
+
 /*
  * A pseudo VMA to allow ptrace access for the vsyscall page.  This only
  * covers the 64bit vsyscall page now. 32bit has a real VMA now and does
diff --git a/arch/x86/include/asm/vsyscall.h b/arch/x86/include/asm/vsyscall.h
index 472f0263dbc6..f34902364972 100644
--- a/arch/x86/include/asm/vsyscall.h
+++ b/arch/x86/include/asm/vsyscall.h
@@ -14,12 +14,11 @@ extern void set_vsyscall_pgtable_user_bits(pgd_t *root);
  * Called on instruction fetch fault in vsyscall page.
  * Returns true if handled.
  */
-extern bool emulate_vsyscall(unsigned long error_code,
-			     struct pt_regs *regs, unsigned long address);
+bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs, unsigned long address);
 #else
 static inline void map_vsyscall(void) {}
-static inline bool emulate_vsyscall(unsigned long error_code,
-				    struct pt_regs *regs, unsigned long address)
+static inline bool emulate_vsyscall_pf(unsigned long error_code,
+				       struct pt_regs *regs, unsigned long address)
 {
 	return false;
 }
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index b83a06739b51..f0e77e084482 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1314,7 +1314,7 @@ void do_user_addr_fault(struct pt_regs *regs,
 	 * to consider the PF_PK bit.
 	 */
 	if (is_vsyscall_vaddr(address)) {
-		if (emulate_vsyscall(error_code, regs, address))
+		if (emulate_vsyscall_pf(error_code, regs, address))
 			return;
 	}
 #endif
-- 
2.43.0

