Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954537AA8B;
	Mon,  2 Feb 2026 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054492; cv=none; b=NYc0/fGm+zzvPSnjS52FQpGpiSCZZViJuKuzobHruu2N+5pox5UxdjUgB43jVtwSFNXJNPbyNGO5jbmcCVmrBn7hCBiQCFzensTvF1PRqyqG4p/8ttt17IaAtLRxUgpC6Mc1QHx2hyAw3gepYIZH7sHTEF3GJiTMGdjnigvkzFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054492; c=relaxed/simple;
	bh=GpPLXQFAH5j67YcvtRYBXcozg4W/BXInprKa/DJePpc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IzKFBYoffmUxcOe2PneNaqIDHda8R1NdxP+c+OAohcADAnjxVrclPXi6thBOc9PLtGMyD6TTZTko7kvWknEDh8UC3ID2UfI8rGUOMjWmRjLDvDoc0WbVAiwPQuaKhM7xAcNQnaQiW4jKpcIWeddmMAD8FIfYA3AtgchWLvsvFIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=h1vtXyYf; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="h1vtXyYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770054491; x=1801590491;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4HeTz+82MVw5VAqBWLGfcJblrW68oVtx4Q+FhZQ1Vko=;
  b=h1vtXyYflYY3C0xTtFF0P2WlVxWXK0fpgFzLhsjjiZBYanS/pBgMSn08
   RGTHt9O4ABVVbrhPdUkTSTCc0bR4Mxj/Va+Eyz+QtI8oDDtiLRmzjmw/P
   wDU/6Yayl937dp0aVs+EZ2KgUbW1q34xFjqUzWEAgQezJz2ONDhg+g6Ud
   ABZ4Jw+o+HJ6yqgRf3XBGWpkj3vfKHQ+wCm5rV4LCnIxPL3b9lUSDFZMq
   n1DAj+n2lw3jvbBITE+ccJBHWRFPdV3dnTVc7XJYFtNxiCPWzQ5DwJzeI
   O9RdSeclI1Ee0+PxBU3x8LTZbissIsCY17Sa0aStcYsf4VpTLz2H0xfiY
   g==;
X-CSE-ConnectionGUID: 2BcfAZhWR6O1yja3WECC0Q==
X-CSE-MsgGUID: kXRREQR7STGAKTaNjj7Qsg==
X-IronPort-AV: E=Sophos;i="6.21,269,1763424000"; 
   d="scan'208";a="11890277"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 17:48:08 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:11262]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.59.32:2525] with esmtp (Farcaster)
 id 0f56f94a-89af-4850-9137-d2bbc0751219; Mon, 2 Feb 2026 17:48:08 +0000 (UTC)
X-Farcaster-Flow-ID: 0f56f94a-89af-4850-9137-d2bbc0751219
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:48:08 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:48:05 +0000
From: Alexander Graf <graf@amazon.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Clemens
 Ladisch" <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
	<mingo@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, <nh-open-source@amazon.com>, "Nicolas Saenz
 Julienne" <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>, Filippo
 Sironi <sironi@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>,
	=?UTF-8?q?Jan=20Sch=C3=B6nherr?= <jschoenh@amazon.de>
Subject: [PATCH 0/2] Add HPET NMI Watchdog support
Date: Mon, 2 Feb 2026 17:48:01 +0000
Message-ID: <20260202174803.66640-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The current NMI watchdog relies on performance counters and consistently
occupies one on each CPU. When running virtual machines, we want to pass
performance counters to virtual machines so they can make use of them.
In addition the host system wants to use performance counters to check
the system to identify when anything looks abnormal, such as split
locks.

That makes PMCs a precious resource. So any PMC we can free up is a PMC
we can use for something useful. That made me look at the NMI watchdog.

The PMC based NMI watchdog implementation does not actually need any
performance counting. It just needs a per-CPU NMI timer source. X86
systems can make anything that emits an interrupt descriptor (IOAPIC,
MSI(-X), etc) become an NMI source. So any time goes. Including the
HPET. And while they can't really operate per-CPU, in almost all cases
you only really want the NMI on *all* CPUs, rather than per-CPU.

So I took a stab at building an HPET based NMI watchdog. In my (QEMU
based) testing, it's fully functional and can successfully detect when
CPUs get stuck. It even survives suspend/resume cycles.

For now, its enablement is a config time option because the hardlockup
framework does not support dynamic switching of multiple detectors.
That's ok for our use case. But maybe something for the interested
reader to tackle eventually :).

You can enable the HPET watchdog by default by setting

  CONFIG_HARDLOCKUP_DETECTOR_HPET_DEFAULT=y

or passing "hpet=watchdog" to the kernel command line. When active, it
will emit a kernel log message to indicate it works:

  [    0.179176] hpet: HPET watchdog initialized on timer 0, GSI 2

The HPET can only be in either watchdog or generic mode. I am a bit
worried about IO-APIC pin allocation logic, so I opted to reuse the
generic timer pin. And that means I'm effectively breaking the normal
interrupt delivery path. so the easy way out was to say when watchdog is
active, PIT and HPET are not available as timer sources. Which is ok on
modern systems. There are way too many (unreliable) timer sources on x86
already. Trimming a few surely won't hurt.

I'm open to inputs on how to make the HPET multi-purpose though, in case
anyone feels strongly about it.

Alex

Alexander Graf (2):
  x86/ioapic: Add NMI delivery configuration helper
  hpet: Add HPET-based NMI watchdog support

 .../admin-guide/kernel-parameters.txt         |   5 +-
 arch/x86/Kconfig                              |  19 ++
 arch/x86/include/asm/io_apic.h                |   2 +
 arch/x86/kernel/apic/io_apic.c                |  32 ++++
 arch/x86/kernel/hpet.c                        | 172 ++++++++++++++++++
 arch/x86/kernel/i8253.c                       |   9 +
 drivers/char/hpet.c                           |   3 +
 include/linux/hpet.h                          |  14 ++
 8 files changed, 255 insertions(+), 1 deletion(-)

-- 
2.47.1




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

