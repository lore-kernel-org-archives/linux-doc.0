Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119292D0C92;
	Mon,  9 Mar 2026 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079962; cv=none; b=kjcLu1xcWH0SwvsA2lIoJdYVQV5lm9I/fSgQr+mtNA1xSXyv5rVQW7kS2aPukTVPTp1k5+yPC3Un2r7Fzqw+q5hs6scZheCVOvZaaO+gYI+GbWNQ2CeiOHvE0bnwL4eOWatq04yEGrsQYb2zGJ/dFx1zC5pr/qjyHPh+gmP/lW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079962; c=relaxed/simple;
	bh=vv6YWxEJ4PIxGMLDlwY2P30jDjpKSWyC+WmfT7BLFCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpgTJ54l2ZsTGIZkG8VifPMopXCYrDrDYTPOgoEHYDQXxYq2rI9NRH4uPxFg8D70eNX3cR12gBWkhusuGtnCXXPIAOirH3RUNNB2eMIXFLIFHe6usjFiymKmZusmQRUAsaoEVIGVxd2xWq7s9YnTOGM8w1r2eaDrs48K8//yNt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijXwK5h4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijXwK5h4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773079961; x=1804615961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vv6YWxEJ4PIxGMLDlwY2P30jDjpKSWyC+WmfT7BLFCw=;
  b=ijXwK5h4TbRvdVbJXw7irJhTBeVYrr1IWDcsgQcE93gOIBJWZfsSmWoQ
   YJ/rxsgmjio7mdWwWjmkTIu8iNOooCJvLWaP2yhRGYZwyRj0g8Yg4qlwP
   yfSaDhTmzpScjs9/zWU50AZTKI4COx+snaVJG2Y5baf3GTQaQ1ngN2yQG
   /swy7xEeI2zIB5xLl3PR/qv+FseGByEOH+/ExbNbsIK4GD51yUeGuCMZS
   KQKp1yeF6OLAEPQXxa2lFMqaTizx39w10BHCsKlC2sy2apEegbyDGTuSd
   3gnO6gy8G/c5n08WJidK7VZxl3htXt2GFAnylN6vzcrz8evZP5AzEEERG
   A==;
X-CSE-ConnectionGUID: xrIJwjtiSRarax5Kj2BgDQ==
X-CSE-MsgGUID: PI0LjpsRS9ChaRmB/eb6TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73992042"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73992042"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 11:12:40 -0700
X-CSE-ConnectionGUID: E8GbfMlZQV2QL37I3ZPTjA==
X-CSE-MsgGUID: FbqQIrf1TAConcX/EF2ILw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224774455"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2026 11:12:39 -0700
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
Subject: [PATCH v3 2/5] x86/traps: Consolidate user fixups in the #GP handler
Date: Mon,  9 Mar 2026 11:10:26 -0700
Message-ID: <20260309181029.398498-3-sohil.mehta@intel.com>
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

Move the UMIP exception fixup under the common "if (user_mode(regs))"
condition where the rest of user mode fixups reside. Also, move the UMIP
feature check into its fixup function to keep the calling code
consistent and clean.

No functional change intended.

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
v3:
 - Pickup review and tested-by tags.

v2:
 - No change
---
 arch/x86/kernel/traps.c | 8 +++-----
 arch/x86/kernel/umip.c  | 3 +++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 4dbff8ef9b1c..614a281bd419 100644
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

