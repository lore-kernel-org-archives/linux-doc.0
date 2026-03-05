Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C135F163;
	Thu,  5 Mar 2026 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746980; cv=none; b=j75/XqwM6Yfd/u77bgGQhvslnhgBjwpsA3LPi7xEtJYe/4hRW5P0diInMwM/yGUlaIcYQymtrvYBz0/3Q0NVN2ROTE6iA1rF3Nbq3Fp1s3ow6JlZSWhYUjwHvsriEsujX1rSxzEVw2kpdTdfN0wG6PJ3bW0Aa0RdxuAtgAytCY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746980; c=relaxed/simple;
	bh=+Oer6TNv8UyvVi1qJXa9XSFeoFF8acMLP/IDYKtkZfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIiUqkb8n14cky49tQrYsPU3gUaLgl0ZmmGz5hJLQV7YF7afPaSVATQgTzSnFsLChZaSzL11IDgGekI1DMlyFTFcoDE8memPIHT3N8Rne/Qk+uqgem490wODJgYAJ22kLNeeDKWdqFUVkD+NS5i3rOqwRj60uxnIizrwXJEIZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqJebRzO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqJebRzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772746978; x=1804282978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Oer6TNv8UyvVi1qJXa9XSFeoFF8acMLP/IDYKtkZfY=;
  b=NqJebRzOjvLWEv4Y7EV95FLNCWBXEJsPTBAeeWohrIL92r/0hAVwwPAU
   RNdQkSygfvSc0Kf6YMz9juyymXUQ9z2ie9yvQX/hWJ7JhbaU9k+kJAstn
   1x7XmUobCVqRBKZ0gdVy+NY87CgZ+fH/Quoufp6fXdnUQIaSYPecUbQTC
   KTZcJr91fFjdlDoRogj7qfvHcN3DHTgLPyZkYJdp+IqDm54BWgb1Lq/uv
   UcZ+n25wl+rMNCZuiieIHeJdkYQvAjPDvSEHO1nSHAmL5SGwodtHPkzH8
   wlO496FsUXTlPJLcl9JEKdiEmTndYStiCZF9ghOD1Xjh+rDgEcZlZJSN3
   w==;
X-CSE-ConnectionGUID: Xj6oRfSkQvGcOG/AGo+F1A==
X-CSE-MsgGUID: tN6Y3smASdKa1HlhXraLmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73043853"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73043853"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 13:42:57 -0800
X-CSE-ConnectionGUID: 0BqT/flNRdGfCTvE7XLaeQ==
X-CSE-MsgGUID: RXyFnEuJTFmp5iIyRTvj9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="215562930"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 13:42:57 -0800
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
Subject: [PATCH v2 0/5] x86: Enable LASS support with vsyscall=xonly mode
Date: Thu,  5 Mar 2026 13:40:21 -0800
Message-ID: <20260305214026.3887452-1-sohil.mehta@intel.com>
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
support specifically to the default XONLY mode (vsyscall=xonly).

Changes in v2
-------------
- Pick up review tags from Dave.
- Improve commit messages based on feedback from Dave and Peter.
- Minor change in patch 4 to avoid unnecessary clearing of CR4.LASS.

v1: https://lore.kernel.org/lkml/20260219233600.154313-1-sohil.mehta@intel.com/

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
 arch/x86/entry/vsyscall/vsyscall_64.c         | 89 +++++++++++--------
 arch/x86/include/asm/vsyscall.h               | 13 ++-
 arch/x86/kernel/cpu/common.c                  | 15 ----
 arch/x86/kernel/traps.c                       | 12 +--
 arch/x86/kernel/umip.c                        |  3 +
 arch/x86/mm/fault.c                           |  2 +-
 7 files changed, 77 insertions(+), 61 deletions(-)


base-commit: 68400c1aaf02636a97c45ba198110b66feb270a9
-- 
2.43.0

