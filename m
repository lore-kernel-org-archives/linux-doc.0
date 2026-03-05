Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDCD35F18D;
	Thu,  5 Mar 2026 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746983; cv=none; b=eQKP1rYVCrxMaBBAehJ8+U7hB11PoDJoyOP2gHYcHOm0HCmuV9HULmueHxBUqCSk7JI6wNdNY1ADlQnKhz6VZDHPISUXc9e+AWvEYnMhKJxwilSKRaiBpyY+0n4vCGT0E9tM6bG6puDLBEDNo/pE/gyOJVwJp7RPSfWQB/odaOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746983; c=relaxed/simple;
	bh=QjkJwUpOlN6aV8Di5dQX1//cFiVDEulafb3/sxMP7hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjHN77tFTH1VKb6iZEbkLvmo/aIBtR+JLEA9GGitp0phIwnYHzqPg//322hfeX0gp7+gmtG6bAc1DxjQdeDgrZTE59Jo/eTosLKG7AV43mie69GJursvXC4UH5TsFURqXpBY0Y62/A7Q5syQzOXbqbZrM4GKQdjWNJIVSCoNhcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfR71Yrg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfR71Yrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772746981; x=1804282981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QjkJwUpOlN6aV8Di5dQX1//cFiVDEulafb3/sxMP7hs=;
  b=IfR71Yrg1maIyCorATNIH3lrjB3KD0IMXti2XdfQK4soM/0eHir/pFAb
   Kr3vmTVXHDWTiG63PGbu+J78Aj2WnRIUQ9Gp3UzJ4xBnkVoEDwMZUyJv9
   YMJMgsf3OzYmsV1+5W3nYl7yk3/miDULw8XzrElnz5a7iJbohnLSOGZ0h
   pZzS9IpRpsAjK4SO+my4pqbokWXms6lX2BOEcMeDAbZYSdAJWwqA32sju
   nhw/OGMWun6E3USuQBTJiSnRuYDBjfbZ4+BS65o/EBPGEE6gpVjXeN1+7
   NE17iYV9Exbl9cFKd7Se2fOGlY1J/1nl8RSzyeX5DchcMzr94DBPycRoQ
   g==;
X-CSE-ConnectionGUID: McNPOVgCT8KReNz/CNCqSw==
X-CSE-MsgGUID: UmqfwP9EQxKvwcWlHMuzCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73043901"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73043901"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 13:42:59 -0800
X-CSE-ConnectionGUID: Sd0YGaHkSseS3EIDFAD50Q==
X-CSE-MsgGUID: T668Ch1UQymkNIiWGIV5hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="215562949"
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
Subject: [PATCH v2 4/5] x86/vsyscall: Disable LASS if vsyscall mode is set to EMULATE
Date: Thu,  5 Mar 2026 13:40:25 -0800
Message-ID: <20260305214026.3887452-5-sohil.mehta@intel.com>
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

The EMULATE mode of vsyscall maps the vsyscall page with a high kernel
address directly into user address space. Reading the vsyscall page in
EMULATE mode would cause LASS to trigger a #GP.

Fixing the LASS violation in EMULATE mode would require complex
instruction decoding because the resulting #GP does include the
necessary error information, and the vsyscall address is not
readily available in the RIP.

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
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
---
Eventually, the plan is to get rid of the EMULATE mode altogether. Linus
and AndyL seem to be okay with such a change. However, those changes are
beyond the scope of this series.

v2:
 - Picked up Dave's review tag
 - Removed unnecessary CR4 clearing during vsyscall_setup().
   CR4.LASS is enabled much later via a late_initcall().
---
 Documentation/admin-guide/kernel-parameters.txt | 4 +++-
 arch/x86/entry/vsyscall/vsyscall_64.c           | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb850e5290c2..64df2c52b2e5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8376,7 +8376,9 @@ Kernel parameters
 
 			emulate     Vsyscalls turn into traps and are emulated
 			            reasonably safely.  The vsyscall page is
-				    readable.
+				    readable.  This disables the Linear
+				    Address Space Separation (LASS) security
+				    feature and makes the system less secure.
 
 			xonly       [default] Vsyscalls turn into traps and are
 			            emulated reasonably safely.  The vsyscall
diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index b34c8763d5e9..215ae07dd3c7 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -62,6 +62,11 @@ static int __init vsyscall_setup(char *str)
 		else
 			return -EINVAL;
 
+		if (cpu_feature_enabled(X86_FEATURE_LASS) && vsyscall_mode == EMULATE) {
+			setup_clear_cpu_cap(X86_FEATURE_LASS);
+			pr_warn_once("x86/cpu: Disabling LASS due to vsyscall=emulate\n");
+		}
+
 		return 0;
 	}
 
-- 
2.43.0

