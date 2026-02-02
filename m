Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E83876D2;
	Mon,  2 Feb 2026 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054208; cv=none; b=DzE9DwRvw44QQlALKusTRc3pXTuhyqmjkLuSIuQKHWILhjPzFV10FeJpX0MogdCKIl+kGzwSTRXg5u70PBq0MzNxcZ5U5pG8UU7VQWUApADzgZKQRVzDIS1pTYnrjzpzdIB2V0ZLorUurqJ9gjpIqK/f198mCWpbVK4TxlBuBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054208; c=relaxed/simple;
	bh=PwS1BklAw/fAJjlcBEmfx1rvHA/vDAagwYoXbb3sf4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Df8y1fbVSwI7c7mfXQmYdHKSfz4euMgJUUrV4AqnD5yEPIGWNds3SwxU0eABZ9Y85pHQezPdA87P4A/SUIRQfcdK7b6Ndp8LrkYSSnJJTLXSSB+TuE77r0sdOaRmJ0HcuGPrObVn7LGwSg45brsWXcYQFwaVfy95y5jwEA1PjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=M7IvrrWs; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="M7IvrrWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770054207; x=1801590207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NNLvmkRavPtZH5zkQp4kBfvTqFyTbFv3bieV7hRZAEQ=;
  b=M7IvrrWslHaaPhixyqyET7j3e3g7mSp/G6RFplKPl3RGZWQe1o2HjYOn
   kDvOmN+VEk7XqzcEBVC43QRuFiFnwUl+7gKsUhSaoLSk7EfPIwJgmIcen
   kKhIM1aURuajL+N0R21MTC75SMo9CwWlGvYR9RsL77I177ppOkDY4Aos+
   swBIebH1uh2GxwWcDty3fbbeVBD8yI1iSUPFf8WCI3DZwRCDgtd+mPNGY
   PY5uCduQwr49j13J2uSUI4bHFg7/pkvM6eh/6Zoj3v5yebQDthR+ka1ig
   9XYBpQdOrTgDeyI+HlPKPocOOjelBEYSLGyP7nJlwGc1v7EqolcbfWNmZ
   g==;
X-CSE-ConnectionGUID: FebwFGXYSRq1Ub03zSTwcQ==
X-CSE-MsgGUID: KZYBp/KjSViaZF3zI+2j/Q==
X-IronPort-AV: E=Sophos;i="6.21,269,1763424000"; 
   d="scan'208";a="11995861"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 17:43:24 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:15787]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.92:2525] with esmtp (Farcaster)
 id 3afc8dd0-f63b-47fb-8aa3-e7ca4ef78ac5; Mon, 2 Feb 2026 17:43:24 +0000 (UTC)
X-Farcaster-Flow-ID: 3afc8dd0-f63b-47fb-8aa3-e7ca4ef78ac5
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:43:23 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:43:20 +0000
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
Subject: [PATCH 1/2] x86/ioapic: Add NMI delivery configuration helper
Date: Mon, 2 Feb 2026 17:43:15 +0000
Message-ID: <20260202174316.65044-2-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260202174316.65044-1-graf@amazon.com>
References: <20260202174316.65044-1-graf@amazon.com>
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

To implement an HPET based NMI watchdog, the HPET code will need to
reconfigure an IOAPIC pin to NMI mode. Add a function that allows driver
code to configure an IOAPIC pin for NMI delivery mode.

(Disclaimer: Some of this code was written with the help of Kiro, an AI
coding assistant)

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 arch/x86/include/asm/io_apic.h |  2 ++
 arch/x86/kernel/apic/io_apic.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/x86/include/asm/io_apic.h b/arch/x86/include/asm/io_apic.h
index 0d806513c4b3..58cfb338bf39 100644
--- a/arch/x86/include/asm/io_apic.h
+++ b/arch/x86/include/asm/io_apic.h
@@ -158,6 +158,8 @@ extern void mp_save_irq(struct mpc_intsrc *m);
 
 extern void disable_ioapic_support(void);
 
+extern int ioapic_set_nmi(u32 gsi, bool broadcast);
+
 extern void __init io_apic_init_mappings(void);
 extern unsigned int native_io_apic_read(unsigned int apic, unsigned int reg);
 extern void native_restore_boot_irq_mode(void);
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index 28f934f05a85..006f328929cd 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -2951,6 +2951,38 @@ int mp_irqdomain_ioapic_idx(struct irq_domain *domain)
 	return (int)(long)domain->host_data;
 }
 
+/**
+ * ioapic_set_nmi - Configure an IOAPIC pin for NMI delivery
+ * @gsi: Global System Interrupt number
+ * @broadcast: true to broadcast to all CPUs, false to send to CPU 0 only
+ *
+ * Configures the specified GSI for NMI delivery mode.
+ *
+ * Returns 0 on success, negative error code on failure.
+ */
+int ioapic_set_nmi(u32 gsi, bool broadcast)
+{
+	struct IO_APIC_route_entry entry = { };
+	int ioapic_idx, pin;
+
+	ioapic_idx = mp_find_ioapic(gsi);
+	if (ioapic_idx < 0)
+		return -ENODEV;
+
+	pin = mp_find_ioapic_pin(ioapic_idx, gsi);
+	if (pin < 0)
+		return -ENODEV;
+
+	entry.delivery_mode = APIC_DELIVERY_MODE_NMI;
+	entry.destid_0_7 = broadcast ? 0xFF : 0;
+	entry.dest_mode_logical = 0;
+	entry.masked = 0;
+
+	ioapic_write_entry(ioapic_idx, pin, entry);
+
+	return 0;
+}
+
 const struct irq_domain_ops mp_ioapic_irqdomain_ops = {
 	.alloc		= mp_irqdomain_alloc,
 	.free		= mp_irqdomain_free,
-- 
2.47.1




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

