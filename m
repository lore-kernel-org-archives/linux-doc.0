Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688E2FA0C7;
	Thu, 19 Feb 2026 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771544290; cv=none; b=aujwOumi2cxbXFTKQ71Enp4DgeCqZULjxqiMJ15cIShN9USyDQgNnlxsWyFCNf/7qKtiFsi7qhRe9n2fDd+dETQ9oJhR27gMhp4qVjtcNvmqQB5Am1rIim/Ydbign3EadKtUaPjeY34ziM6MFKjsbNqOXXuIVqkVFPnsfA8Lq9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771544290; c=relaxed/simple;
	bh=HBLnlChweswwJ+hMlOKGGo/R4pVrivTIt73bCjZcdAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gE+b63G8p2hcFqPXdBftX+ZSs9JgEbw4C4c35v1hRw6sV4MZNQzbFPBAiSEJShv6+rPyYDTUTUivtzVQ/K90qoCoyr77IQ+ABJ43lE+t2mWh7MzKRup8DoEaUlTjAF90DD3lCrBTCI7/Alm7JTnYjqtzFVHr+LJjnM8zkAEVXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eR/kR/Ca; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR/kR/Ca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771544288; x=1803080288;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HBLnlChweswwJ+hMlOKGGo/R4pVrivTIt73bCjZcdAs=;
  b=eR/kR/CayemrLHvAETjQTsfcpFn2DIf+K9Uv4u7UwaBd+l6uVLdSw9wJ
   aewscBj+dvK2DB9RUibgTui1W5YVsm5Z9l8gQia+bixOkOZtFIoopFLO+
   /MPGeIpuokBmanNypifMmnmjVfbBe04C2AJstXY4pdKaVLmgsXiNjnaZ7
   wWLR78DViDIqSfHYLmspTBhf5kOuC0mCYPfPEONivIj+xSLOymEpUq19/
   oWg/Mb2owgEbKigsjnV06MTylRtGipQWpEUpT4E8PBfV4xfqcuDY+QNn8
   OLRS1nZNCoIknseatPKyn4c7vcu1zlse5ZKIdmeVFioMPO/qf8MchLIZ5
   Q==;
X-CSE-ConnectionGUID: qKPKwqMDQbCVEYw2G8G4TA==
X-CSE-MsgGUID: fqJRmQDORPC+yqyI0Sjchg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72685691"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72685691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 15:38:08 -0800
X-CSE-ConnectionGUID: K9t7thXZTlqBOtNn7i76WQ==
X-CSE-MsgGUID: jODx2IIoTEeHpVZqp6EvQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214805172"
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
Subject: [PATCH 0/5] x86: Enable LASS support with vsyscall emulation
Date: Thu, 19 Feb 2026 15:35:55 -0800
Message-ID: <20260219233600.154313-1-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linear Address Space Separation (LASS) is currently disabled [1] when
support for EFI or vsyscall emulation is enabled. This series extends
LASS support to vsyscall-enabled configurations.

Patches
-------
These patches were posted earlier as part of the v10 LASS series [2]
before being split out into a smaller series to make it easier to merge.
The overall approach to enable vsyscall support was okayed by Andy
Lutomirski [3].

This series is based on the LASS-EFI series which enables LASS for EFI
configurations.
https://lore.kernel.org/lkml/20260120234730.2215498-1-sohil.mehta@intel.com/

The motivation for this series is to show the combined picture as well
as seek reviews on either series. The combined patches can also be viewed at:
https://github.com/sohilmeh/linux-dev/tree/lass-vsyscall

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

Links
-----
[1]: https://lore.kernel.org/lkml/20251118182911.2983253-1-sohil.mehta@intel.com/
[2]: https://lore.kernel.org/lkml/20251007065119.148605-1-sohil.mehta@intel.com/
[3]: https://lore.kernel.org/lkml/f4ae0030-9bc2-4675-ae43-e477cd894750@app.fastmail.com/

Sohil Mehta (5):
  x86/vsyscall: Reorganize the page fault emulation code
  x86/traps: Consolidate user fixups in the #GP handler
  x86/vsyscall: Add vsyscall emulation for #GP
  x86/vsyscall: Disable LASS if vsyscall mode is set to EMULATE
  x86/cpu: Remove LASS restriction on vsyscall emulation

 .../admin-guide/kernel-parameters.txt         |  4 +-
 arch/x86/entry/vsyscall/vsyscall_64.c         | 90 +++++++++++--------
 arch/x86/include/asm/vsyscall.h               | 13 ++-
 arch/x86/kernel/cpu/common.c                  | 15 ----
 arch/x86/kernel/traps.c                       | 12 +--
 arch/x86/kernel/umip.c                        |  3 +
 arch/x86/mm/fault.c                           |  2 +-
 7 files changed, 78 insertions(+), 61 deletions(-)

-- 
2.43.0

