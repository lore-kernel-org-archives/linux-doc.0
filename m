Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED4631B108;
	Thu, 19 Feb 2026 23:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771544293; cv=none; b=lPdG8OQb559q2pArhq8O/wTnoKXhresG8CjnhcnyOHWafvDr/RrpnRgYLUPXwjDXKgD3aPq6KvPki891HYxz848hNUa3JfzYpeNw8qV127LieIe7obgeYrLKRHzO0ssd9gzLiMdPKs9E65rPoq77wU3KMvjWfcvAPXEUTvRMtPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771544293; c=relaxed/simple;
	bh=vH54bd3bnODuU9YcmKZXZsBBTrynsYxwRm8fyHLVIK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRk5macQVESuR/b/pWJdu02Y9sYX5xTMj5FF9VEtFvo/Z5XRDQ9XqYIGszrLImOkGYJVfuaoOtDKTU+mQAsYbWv6bgMK9P+JbMLxWgqwzmJ87b8X6NdAiX+sg9koJDB2koeVOY7YxJS18KpHKuzjuP6furQSf0xmWFCHTjkCjGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFxc3XSZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFxc3XSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771544292; x=1803080292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vH54bd3bnODuU9YcmKZXZsBBTrynsYxwRm8fyHLVIK0=;
  b=hFxc3XSZp31wvszXvVV+20YsAxk9LP6Q5RTICUIv45omOSdjkazVLiQS
   QGh009UrMg4oKYyCwYcEfmJUViGTnkZ4qQqKRkRhco5JR6cJq4Xk+SEJ7
   S6YfcjZaNkHjzZztwxT3EMH1rp+ceok+yIXWYwZ3XiSdDpp29dZjCdhTW
   9M72TVnReMiBiuuZsNjE5UuQG1gqITWF7+Iqtl/2ftwhPtdqY3O8djOH2
   H1MzQjBkrjVN5gE94Ge+246OS1YCVsIMylJtGcfv6N897gN7ZCDR5yMgO
   agf7AezKlYRcoUzgyjNPicvE9d+265CZDx1/xXU7+TFqg6Xaumogj8J3O
   A==;
X-CSE-ConnectionGUID: owWDhfvERb6KpqT8MIvfNg==
X-CSE-MsgGUID: zcqspG0sRUGgW3fcNrvbzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72685755"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72685755"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 15:38:11 -0800
X-CSE-ConnectionGUID: bdB+jvocRIesOgkrLgHFOw==
X-CSE-MsgGUID: p3tWiBwnRX+mvdC6QEpnuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214805207"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 15:38:11 -0800
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
Subject: [PATCH 5/5] x86/cpu: Remove LASS restriction on vsyscall emulation
Date: Thu, 19 Feb 2026 15:36:00 -0800
Message-ID: <20260219233600.154313-6-sohil.mehta@intel.com>
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

As vsyscall emulation is now supported during #GP, remove the
restriction on LASS when vsyscall emulation is compiled in.

As a result, there is no need for setup_lass() anymore. LASS is enabled
by default through a late_initcall().

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
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

