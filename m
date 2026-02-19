Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B3B318BAC;
	Thu, 19 Feb 2026 23:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771544292; cv=none; b=YQNhmBZcJqe3y5N3UA1NJv0M2LMP9G9/P0teFnRI2rnzJmqqSwhDKsqTlYxIsB0n+XRTTbInwRh3/Xhtwk6yaituwOeLyFknRlGlDMNuvm6T+rQjGIoBs4cUxvz7M3pL4M2CneIa3rEIc+j1B/qoY/YgqjgGvf9twgbPEeA1bqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771544292; c=relaxed/simple;
	bh=sSsR4pwoJ92DEAcXzaojB/1nkH/EgjXqXgmy2XE2Q38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikNBdSfvKV0YYifgufmrxl8gkZDzn1ZSshIGcfV1jdcYGAVLJjzApOegMGsz/vc3khBty3EPJtCYzU5kjyYN+U8Ym6UagqxKrG9gFs3ZLPSffa1O++3B7q5gUHyY3dHQRYfdXH3xzRpOQtMTmtCDozb9UsvOjgKQLRjkwxld8F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/Y1bhLD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/Y1bhLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771544291; x=1803080291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sSsR4pwoJ92DEAcXzaojB/1nkH/EgjXqXgmy2XE2Q38=;
  b=S/Y1bhLDxiBTfeTcBQ2sp2AGuM14S918jNLfjXQWM2F+la85XZ1J2Usx
   w7LFM4eMpa6yJhVh8F8Bv1ai7jX6UUZv0oufA/qrXi/KuzW8iPltIqe6E
   fjzrKHuovPuar1mqgOZv/0/pDMZJHAPQ+Gv2OZfNo7diAR0EzXvp5oFNV
   88V4BtR+zl8WS1AsPDqpcjebVurOVyGTRy2XA4Ln6o/RufCUAL5+WkqSf
   EQ799s/oqJCVzsHIW3ARHmtfP6NHXOGapXcT98X2DD90l/ANVqgRZxesA
   192UHqQM3lfhuNDXbUOeHDm5Uudjx0qK8Farrf99XbdWaolIJGTx1kWTO
   w==;
X-CSE-ConnectionGUID: Gcm71SV9Skq9hdNohEcpcQ==
X-CSE-MsgGUID: ZZ3MAlX8TvSLaiRwblUQiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72685740"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72685740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 15:38:10 -0800
X-CSE-ConnectionGUID: QtTT3sP2Rhe5K9vTdkp6+g==
X-CSE-MsgGUID: 72PuIhxnQIWYFHmmgoLlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214805201"
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
Subject: [PATCH 4/5] x86/vsyscall: Disable LASS if vsyscall mode is set to EMULATE
Date: Thu, 19 Feb 2026 15:35:59 -0800
Message-ID: <20260219233600.154313-5-sohil.mehta@intel.com>
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

The EMULATE mode of vsyscall maps the vsyscall page with a high kernel
address directly into user address space. Reading the vsyscall page in
EMULATE mode would cause LASS to trigger a #GP.

Fixing the LASS violation in EMULATE mode would require complex
instruction decoding because the resulting #GP does not include any
useful error information, and the vsyscall address is not readily
available in the RIP.

The EMULATE mode has been deprecated since 2022 and can only be enabled
using the command line parameter vsyscall=emulate. See commit
bf00745e7791 ("x86/vsyscall: Remove CONFIG_LEGACY_VSYSCALL_EMULATE") for
details. At this point, no one is expected to be using this insecure
mode. The rare usages that need it obviously do not care about security.

Disable LASS when EMULATE mode is requested to avoid breaking legacy
user software. Also, update the vsyscall documentation to reflect this.
LASS will only be supported if vsyscall mode is set to XONLY (default)
or NONE.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
Eventually, the plan is to get rid of the EMULATE mode altogether. Linus
and AndyL seem to be okay with such a change. However, those changes are
beyond the scope of this series.
---
 Documentation/admin-guide/kernel-parameters.txt | 4 +++-
 arch/x86/entry/vsyscall/vsyscall_64.c           | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9e3ae4071c4b..28aaebd9ca49 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8283,7 +8283,9 @@ Kernel parameters
 
 			emulate     Vsyscalls turn into traps and are emulated
 			            reasonably safely.  The vsyscall page is
-				    readable.
+				    readable.  This disables the Linear
+				    Address Space Separation (LASS) security
+				    feature and makes the system less secure.
 
 			xonly       [default] Vsyscalls turn into traps and are
 			            emulated reasonably safely.  The vsyscall
diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index b34c8763d5e9..e0faa4ca0382 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -62,6 +62,12 @@ static int __init vsyscall_setup(char *str)
 		else
 			return -EINVAL;
 
+		if (cpu_feature_enabled(X86_FEATURE_LASS) && vsyscall_mode == EMULATE) {
+			cr4_clear_bits(X86_CR4_LASS);
+			setup_clear_cpu_cap(X86_FEATURE_LASS);
+			pr_warn_once("x86/cpu: Disabling LASS due to vsyscall=emulate\n");
+		}
+
 		return 0;
 	}
 
-- 
2.43.0

