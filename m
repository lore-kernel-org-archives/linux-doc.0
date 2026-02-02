Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A5A263C8C;
	Mon,  2 Feb 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054206; cv=none; b=sjawcn5n7w3r297SAppM6jcbAJOMQrFZegF96qxzZxPmHGyFdsv6T8YiWQow+OO//H7MM+f+YCuaRxbHKc7cbE8w2KcqKY5ifdawzlFcXwD11N2F/pX8FDRDxbYgTwVEO+cOx3aUavPfblhvHGziPXTvbGmHxR1ZayM4PV7lD8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054206; c=relaxed/simple;
	bh=GpPLXQFAH5j67YcvtRYBXcozg4W/BXInprKa/DJePpc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DEG0g1Pj99HWH57YSwH+dFUOkB6tU8eKEefCkn6ZE7OPji34mx02aByHR9oAfg6nzwsIdm+R5pOd2x2VglSHj9i3GKFPwVikG+yvlrm22gc3fLKaa792nUGkyNZ6S8VwcJO2tEwZU355ZDM6ZGrlhO/Tnlf+MvMEGV3JXFgBHco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=eemFntpX; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="eemFntpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770054204; x=1801590204;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4HeTz+82MVw5VAqBWLGfcJblrW68oVtx4Q+FhZQ1Vko=;
  b=eemFntpX2BorD50BfaH128LOuJdwfoWhaDgcJv0ad/Z5BP3YglhpvMIH
   8ENo6uAXIkw6yXYKxFkbXOtls11YOY08srZanggsyp75zOy8X+3s395jI
   JwKfnCLR72VGh2XkO+FDnj3HNN5SKuZ7p8GR7bjS/J+Og5VR/+95H/wT+
   O8M5vO1esvstI8zufswoEK0hj2hniaSj9mabXFrB/ubCVghk0qC/SipTu
   I3wahCEu0r5NCkZfAQSxUiSGV1GdwyHmVYn2btGAJ+3av4eG0uEpaO+Jf
   4Ap8gbFziBCO3m3yYZKf1znlJJYZ2+2mCHUS/3/RcJrzx1ws2ErSgJhjz
   A==;
X-CSE-ConnectionGUID: Ju+a5x65R2yrbOBNZohNpg==
X-CSE-MsgGUID: zrPUXdLkSvWEz4q+zyW0/A==
X-IronPort-AV: E=Sophos;i="6.21,269,1763424000"; 
   d="scan'208";a="11915415"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 17:43:21 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:9998]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.92:2525] with esmtp (Farcaster)
 id e818eafa-82dd-4883-8b05-718937f7011b; Mon, 2 Feb 2026 17:43:21 +0000 (UTC)
X-Farcaster-Flow-ID: e818eafa-82dd-4883-8b05-718937f7011b
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:43:20 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:43:17 +0000
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
Date: Mon, 2 Feb 2026 17:43:14 +0000
Message-ID: <20260202174316.65044-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
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

