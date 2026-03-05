Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05D35F19A;
	Thu,  5 Mar 2026 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746983; cv=none; b=WfqIlo3Cehx+jiybdT/VW0w58c16nr1cy0ccuDhGMSTQK+0lFKMgTkkW3961G+g2DhrMclTr4FcU+jU21wJKUwiUR/19VhPwlQhkAS2OnL8dvcYc5j/wEn2Dh0x9xSAWEtXyfa6dXj8XLiweHJ6EZUIrleZDKb1YqaK2BoV55SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746983; c=relaxed/simple;
	bh=TkRy/P4zS6HL/scOhBZsKuA26qdvarrGBX3iVkXHy4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ab2DxWy7Zp55WUvDfgiJQxQ9c+YsbGShLMxTS7h/AQlVst1NWyLyQ27OL0hIR4BrINzt/8zLg+wvlFFN8yWWlc2V3DWxxPM6URhqnCxgjac0W+gzqPvT+cs4v2AfVNheu3MoEPgItSkrodB0wST/wo8moQpk+ictpZH76Pr3U30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1KUwKOw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1KUwKOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772746981; x=1804282981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TkRy/P4zS6HL/scOhBZsKuA26qdvarrGBX3iVkXHy4w=;
  b=P1KUwKOwP75Y+S67kxui00CuiMWt2V4iWp3SnFS0Vb1Od7/LInEw1QKO
   qHH4luH6BwcwMfhyGSRqv9RgLhKHG1lPOPZ+DITrwb823yUmn6EyhCQj5
   kLwdHQY0MK2MA9cqE3tOX+MFVrZ8GgVs/8AtQxRB8mysjEUeRuwfVOdZJ
   qic71bCBKl3L7ZeJus8v27C0C75hOrmq3QZ0ER+UMl6Wca+tQfhjU2ZYe
   nOcxDMbH4yaG2xQ2nvvJCvKiLDhURkdNiZtVt45VSoxV+oQHUqYBlXik1
   Fo50g6E68jLiCHfudpG14ExGOB/OxE88jimoa9O2yGSRlyKQmg3MbmxRO
   A==;
X-CSE-ConnectionGUID: m4pFDetmS4uubZ4ab/BNOw==
X-CSE-MsgGUID: EqCrCGRQSZqqEffXfJ+/Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73043914"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73043914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 13:42:59 -0800
X-CSE-ConnectionGUID: 3VWFPrsIRcewzED7cN5dsw==
X-CSE-MsgGUID: yXrLcB7KRMScgclHrkN0MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="215562954"
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
Subject: [PATCH v2 5/5] x86/cpu: Remove LASS restriction on vsyscall emulation
Date: Thu,  5 Mar 2026 13:40:26 -0800
Message-ID: <20260305214026.3887452-6-sohil.mehta@intel.com>
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

Vsyscall emulation has two modes of operation: XONLY and EMULATE. The
default XONLY mode is now supported with a LASS-triggered #GP. OTOH,
LASS is disabled if someone requests the deprecated EMULATE mode via the
vsyscall=emulate command line option. So, remove the restriction on LASS
when the overall vsyscall emulation support is compiled in.

As a result, there is no need for setup_lass() anymore. LASS is enabled
by default through a late_initcall().

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
---
v2:
 - Picked up Dave's review tag
 - Improve commit message
---
 arch/x86/kernel/cpu/common.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3557f0e6b3aa..02472fc763d9 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -406,20 +406,6 @@ static __always_inline void setup_umip(struct cpuinfo_x86 *c)
 	cr4_clear_bits(X86_CR4_UMIP);
 }
 
-static __always_inline void setup_lass(struct cpuinfo_x86 *c)
-{
-	if (!cpu_feature_enabled(X86_FEATURE_LASS))
-		return;
-
-	/*
-	 * Legacy vsyscall page access causes a #GP when LASS is active.
-	 * Disable LASS because the #GP handler doesn't support vsyscall
-	 * emulation.
-	 */
-	if (IS_ENABLED(CONFIG_X86_VSYSCALL_EMULATION))
-		setup_clear_cpu_cap(X86_FEATURE_LASS);
-}
-
 static int enable_lass(unsigned int cpu)
 {
 	cr4_set_bits(X86_CR4_LASS);
@@ -2061,7 +2047,6 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	setup_smep(c);
 	setup_smap(c);
 	setup_umip(c);
-	setup_lass(c);
 
 	/* Enable FSGSBASE instructions if available. */
 	if (cpu_has(c, X86_FEATURE_FSGSBASE)) {
-- 
2.43.0

