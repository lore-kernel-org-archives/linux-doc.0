Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E92C0303;
	Mon,  9 Mar 2026 18:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079961; cv=none; b=DOJxsQIHRJLB5r+lZX5VSDUTMkITsgHdABMtBygCe6gSzvYIG6T2s50beyKhRzTrDGA+Q80H+ie7mnkecw24vOun9CelaU+gojeq7ZfX3mbZtRlwWfJwDBt/+g9Ib+hfL8khk+medHWqpJa/nSmlxMW4yOVFP6MDar96TbsrBC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079961; c=relaxed/simple;
	bh=oaES2sEc9N3xIIhZcMfmd7bFcesKKy2fZX/llHamKwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uzsUDHVhzyIpbMJIuCFdpBOYnrn1uiijtvF+nghmWiiUGFhydjgdxAkw2ocyvpnh0by3Jmv8POBMabATpOt73O/mXDaIQPBZYTJ1+4VWe/N7f0f2Ph2fEE1GQ9eQ0q2fwRR/qlwIVKX0dl2fc8giWmQpcC8QFKlpH9XOSg0Xmjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XT+MySc7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XT+MySc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773079959; x=1804615959;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oaES2sEc9N3xIIhZcMfmd7bFcesKKy2fZX/llHamKwc=;
  b=XT+MySc7TGD/fQCIFKfA0wI6W6U/jp24Bu0/yRolYH/FQQjymZ8/0eXA
   Ekmf6r1wWX/S5ruKtS3fY2yyfX44Wb5Lnku2eIZAOTMuIV49w5YR1/ZL9
   YUcV12+9J52wbM1R2K2HtD8iPTkujPts4p2jrGg6tMLyA4EXUXly3X5s1
   erHWUVsGCJFpKqm+J0DQUZG0Q8jGAoQAKP+lvovePwjqtA9ywJJbIZgn2
   1AFLf3pSm+6rEibllB3luGHFmNQR0y+IgqXXo0p9EWpr3ljaZHQIEk1ag
   oLc5SJArknpRDPhuieYvsuTuM//5gDNw51aSgGW4XNSdcaTSYXOzEnqft
   g==;
X-CSE-ConnectionGUID: n9O3FPPaTCypyaCj0cUzAQ==
X-CSE-MsgGUID: g1lLZ5gHRd+p45xkXzlAgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73992013"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73992013"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 11:12:37 -0700
X-CSE-ConnectionGUID: VZa45FFDQnKViOT+7U8qIA==
X-CSE-MsgGUID: ZyRW4zXQSLqt2TudOrdmaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224774431"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2026 11:12:36 -0700
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
Subject: [PATCH v3 0/5] x86: Enable LASS support with vsyscall=xonly mode
Date: Mon,  9 Mar 2026 11:10:24 -0700
Message-ID: <20260309181029.398498-1-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linear Address Space Separation (LASS) is currently disabled [1] when
support for vsyscall emulation is configured. This series extends LASS
support specifically to the default mode (vsyscall=xonly).

Changes in v3
-------------
 - Pick up review tags from Peter Anvin.
 - Pick up tested-by tags from Maciej.
 - Minor change in patch 1 to make the reorganized code flow similar to
   the original.

Note, Peter suggested a few more changes to tighten the #PF vsyscall
emulation code. I'll post those separately as they are beyond the scope
of this series.

v2: https://lore.kernel.org/lkml/20260305214026.3887452-1-sohil.mehta@intel.com/

Patches
-------
These patches were originally part of the v10 LASS series [2] before
being split out into a smaller series to make it easier to review and
merge. The overall approach to enable vsyscall support was okayed by
Andy Lutomirski [3].

The patches are based on the tip x86/cpu branch which has the recently
merged LASS-EFI series [4].

Issue
-----
Userspace attempts to access any kernel address generate a #GP when LASS
is enabled. Legacy vsyscall functions are located in the address range
0xffffffffff600000 - 0xffffffffff601000. Prior to LASS, default access
(XONLY) to the vsyscall page would generate a page fault and the access
would be emulated in the kernel. Currently, as the #GP handler lacks any
emulation support, LASS is disabled when config X86_VSYSCALL_EMULATION
is set.

Solution
--------
These patches primarily update the #GP handler to reuse the existing
vsyscall emulation code for #PF. In XONLY mode, the faulting RIP is
readily available and can be used to determine if the #GP was triggered
due to a vsyscall access.

In contrast, the vsyscall EMULATE mode is deprecated and not expected to
be used by anyone. Supporting EMULATE mode with LASS would require
complex instruction decoding in the #GP fault handler, which is not
worth the effort. So, LASS is disabled in the rare case when someone
absolutely needs to enable vsyscall=emulate via the command line.

Please find more details in the individual commit messages.

Links
-----
[1]: https://lore.kernel.org/lkml/20251118182911.2983253-1-sohil.mehta@intel.com/
[2]: https://lore.kernel.org/lkml/20251007065119.148605-1-sohil.mehta@intel.com/
[3]: https://lore.kernel.org/lkml/f4ae0030-9bc2-4675-ae43-e477cd894750@app.fastmail.com/
[4]: https://lore.kernel.org/lkml/20260120234730.2215498-1-sohil.mehta@intel.com/

Sohil Mehta (5):
  x86/vsyscall: Reorganize the page fault emulation code
  x86/traps: Consolidate user fixups in the #GP handler
  x86/vsyscall: Restore vsyscall=xonly mode under LASS
  x86/vsyscall: Disable LASS if vsyscall mode is set to EMULATE
  x86/cpu: Remove LASS restriction on vsyscall emulation

 .../admin-guide/kernel-parameters.txt         |  4 +-
 arch/x86/entry/vsyscall/vsyscall_64.c         | 91 ++++++++++++-------
 arch/x86/include/asm/vsyscall.h               | 13 ++-
 arch/x86/kernel/cpu/common.c                  | 15 ---
 arch/x86/kernel/traps.c                       | 12 ++-
 arch/x86/kernel/umip.c                        |  3 +
 arch/x86/mm/fault.c                           |  2 +-
 7 files changed, 79 insertions(+), 61 deletions(-)


base-commit: 68400c1aaf02636a97c45ba198110b66feb270a9
-- 
2.43.0

