Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C135F170;
	Thu,  5 Mar 2026 21:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746981; cv=none; b=Ez2KKVUVd1kq2IxLJqKJWzWv19Q4jU+21mo4DR/ThnSCDQBohv1r0IDbDddbexD7PriV1a0113jjUWc7lyE15IbcDZxUDqBQwn5xlkT9tpoG83eDynT5CGlTmEy/FkJBEZOfDjZ3rtp/LuCRIhCe9f+AxoXdFYIA0+fUq7BgJXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746981; c=relaxed/simple;
	bh=jm5pN4JlqYTYJWQIqJwy8y3zCh99ZeZ0PpUwm5waDa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYt+Vwhpv3GC9wT4DVP8KI32CeE6x1S+8kgDwzCRaBqGyJ9jXVUvDM2gGG9NlV4qbt1mb/VBVOOUvrZcYHIRfqt+E/pf/Y4x+zn+mtDv8QPATL/jcTPlVpvgfLVFFovESaTqkCtPjklQkV96PwmunN8Fy/f6rQWKRi9IbQ4BPks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5O5imiO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5O5imiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772746980; x=1804282980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jm5pN4JlqYTYJWQIqJwy8y3zCh99ZeZ0PpUwm5waDa0=;
  b=E5O5imiOCjsUYuMa+r4Rz/ETHG5FyKO9OHjyXPxeFR1H6ckaDASmaxVm
   u+S5lW5yWZ3F66TGvElKCYSWBC4gT4Y75pa7VriYjLCVoGejZkKJQ6clu
   5k0WaizL0vsk64NJpd12gBcxW5p5c1sv2LAOmZxtdcsb+wg9GS/A0/aaO
   5cL+/lDBWyo0Aw0YAtvgAH2diS/NQ/dEJ6ljyQFzMkQdeCVbiTthyxQyp
   95PsAvT+Y/Ypw4JtnB0cDiTpbnjSzn+DS2b1kIwXMhDJbKJMi9pxp7a4q
   TTnH8KKbyDrG5LYDqRtLYM6ZvBCO4JZmQvjNsFlR237qZK0wJWxwMA5eK
   g==;
X-CSE-ConnectionGUID: UxqL1VugRoWJ4q1Uw40QLg==
X-CSE-MsgGUID: rIaj7nIPTYipZ8DYa2iSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73043877"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73043877"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 13:42:58 -0800
X-CSE-ConnectionGUID: BO+zPG9BQ8+a9Fk2YA4S+w==
X-CSE-MsgGUID: nJ+hEHS+S/iXez/VT3JUBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="215562936"
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
Subject: [PATCH v2 2/5] x86/traps: Consolidate user fixups in the #GP handler
Date: Thu,  5 Mar 2026 13:40:23 -0800
Message-ID: <20260305214026.3887452-3-sohil.mehta@intel.com>
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

Move the UMIP exception fixup under the common "if (user_mode(regs))"
condition where the rest of user mode fixups reside. Also, move the UMIP
feature check into its fixup function to keep the calling code
consistent and clean.

No functional change intended.

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
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

