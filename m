Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D63090F1;
	Thu, 19 Feb 2026 23:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771544291; cv=none; b=rJfp2ODOSN8CCtdcK7DKgVsFiZgHP+kGO0vdrRy4r8fRInVfVnapVEPEIrLyog7NgxLNXR+PxESyH3o+jLlsZwe/6ZqNJF4dgqExA3P9J1xWJWU1onIe6ta9mxa6G2LGNd0ID9IptrkTlOvis0bCOcUs/kDnKPvqDnqyD8tveWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771544291; c=relaxed/simple;
	bh=WiqpJDuzZ0MkcljcN52DPJR59sV0PTedJ6H1tMhOPz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adN9gnEBz9meZbKcEG73JtD4OBKJN8Ar7uvvFbRL4fZgwYyM9CTX4pAWPteYO/fRNN9xRe1puCGkbJ3apu9Ko/UU1GMbMY8MqS9klyLjcanZSAG/VB10m3Tk7sWeE3lgeOMAcZv46huDqZrHXZVcfJSj1M50z4buS+I7NSOzh98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1cUz8hH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1cUz8hH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771544290; x=1803080290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WiqpJDuzZ0MkcljcN52DPJR59sV0PTedJ6H1tMhOPz8=;
  b=b1cUz8hHPN2ww70FHSaNAP3XVG8sDfI+XWwPcbo2GSFhsseMrtsvQ5yb
   R4DFEtamPl3rkwSNS/6y4iaeoRN0okKXGC78+wCDZhGl7pkjj7/KjRacW
   qiAQ65E1WVottjic2UdiJvcU/rlaC+CQgYquiBYxMHMACaW31EI4qF2uM
   oBRMXjd64ks4WIxGGuvos1xFdEUnzrA4xj2wbkhbaSlCTNKK5CY5I78fJ
   crAWXYOMdZuOodR8eVMQC8ybhenXw+tzba7rqk+DZFEYHU7j+3HHcstMi
   b5J7K6h21HsmLh1wzKorWN9ZclOoF0RX79GGbJDM8ilndWl0ft9+IWyop
   w==;
X-CSE-ConnectionGUID: yB2CiRyoQuGbqXnuAJ4OeA==
X-CSE-MsgGUID: fl14sga3TXC6sFS2xU7FTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72685715"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72685715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 15:38:09 -0800
X-CSE-ConnectionGUID: BH2OffyoR9uHvHOXUQUTpg==
X-CSE-MsgGUID: /TJQ9ldQQQSkm0aompqjwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214805188"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 15:38:09 -0800
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
Subject: [PATCH 2/5] x86/traps: Consolidate user fixups in the #GP handler
Date: Thu, 19 Feb 2026 15:35:57 -0800
Message-ID: <20260219233600.154313-3-sohil.mehta@intel.com>
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

Move the UMIP exception fixup under the common "if (user_mode(regs))"
condition where the rest of user mode fixups reside. Also, move the UMIP
feature check into its fixup function to keep the calling code
consistent and clean.

No functional change intended.

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/kernel/traps.c | 8 +++-----
 arch/x86/kernel/umip.c  | 3 +++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 5a6a772e0a6c..e21f8ad2f9d7 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -921,11 +921,6 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
 
 	cond_local_irq_enable(regs);
 
-	if (static_cpu_has(X86_FEATURE_UMIP)) {
-		if (user_mode(regs) && fixup_umip_exception(regs))
-			goto exit;
-	}
-
 	if (v8086_mode(regs)) {
 		local_irq_enable();
 		handle_vm86_fault((struct kernel_vm86_regs *) regs, error_code);
@@ -940,6 +935,9 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
 		if (fixup_vdso_exception(regs, X86_TRAP_GP, error_code, 0))
 			goto exit;
 
+		if (fixup_umip_exception(regs))
+			goto exit;
+
 		gp_user_force_sig_segv(regs, X86_TRAP_GP, error_code, desc);
 		goto exit;
 	}
diff --git a/arch/x86/kernel/umip.c b/arch/x86/kernel/umip.c
index d432f3824f0c..3ce99cbcf187 100644
--- a/arch/x86/kernel/umip.c
+++ b/arch/x86/kernel/umip.c
@@ -354,6 +354,9 @@ bool fixup_umip_exception(struct pt_regs *regs)
 	void __user *uaddr;
 	struct insn insn;
 
+	if (!cpu_feature_enabled(X86_FEATURE_UMIP))
+		return false;
+
 	if (!regs)
 		return false;
 
-- 
2.43.0

