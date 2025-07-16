Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A242264DC
	for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669478; cv=none; b=pbOu1lHgG3vFOX0+kSERogP6s+Eurfdob677wSDGcRDFTiYEjGZfy1ZwW5uO358eMAS2znnk+5JBggNjKfsoL9qhelihxx0iHtHR1C2NEe2gzK0JJAyR5VVh1uv2uVhAJklNc+5nq3gW7s83NIW8rk4CDPBTxXAXXU4jg7KEPBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669478; c=relaxed/simple;
	bh=5Owa48wB/dCPh/oS/jbcKVDLTJVA5hmFeOA7csZZl9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dzZrXpSi8Q+JuU3eG3stXSUZ6e2T1uzl45Fjjv7iGdfsIpVHVVHRuOE23TDRNpfAbaTIBw8Zy3kH5+bmTnY8Rl1xT6jgnhGpide0ycX71ky35TDky7DMSGt9XtFbzJatJvIDrEajLMSOWeSmxk7peAU1bMSpisqOeUwizB4ebrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=adWC/ws6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="adWC/ws6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23602481460so62165755ad.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752669476; x=1753274276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRLSENgI/MGJbaGVqAa8IBYA8T+PU3c6shTbsSeztZI=;
        b=adWC/ws6Dh9ng30zukjp8eaE6NXkpJHeNZr4w+O0VQcuz/p0eD2X8KXkf+SV4+Z2/n
         3Z97rJKt2o9amggd9LQzJ1T4jGv7nE4G+9FbzN4jhWXSRfwSC7prsnBGRTdtavZgWh/E
         mj6p8FgVnr2pigBU/o/0yQHqvfuKeG+emRXLTCz2COxPukNW199dwU8cAonR30zPuI57
         Q/4Y69l8rap6zi00gGYGCARXdiYj/dJK+1uy9ccKLbFkwO0F/WybTKiZW/d+bEC3HPLf
         7KNQy9KeLEFwp6GsJVEGqXCSMFCxKGMaofUVatAAuxjaghGdLWVYBQ/5otk2O0ZcVDOW
         9JEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669476; x=1753274276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRLSENgI/MGJbaGVqAa8IBYA8T+PU3c6shTbsSeztZI=;
        b=vzmqpjk9gqgRt5nqLaxVw32L71hoaU9hUckKiqTW1mY19RE/nsSvBjGcGApvHIGjex
         LIL4OVv9er7FxdSr1dpCiryGT9dJF25ttIqo8CqFPtQZn1e2LIqtgUQq/l7pFTG+ZyaD
         XWKvjr1XT99pNanTkwfSaFvkb3MKL3S6j4yiUXcGDgBeePUZa0d1j1wBqPuFR8Z89Elk
         Tpa1s1b81M3NgdDMt6/JlB0PMYKIPL5UQEX7oy6B9kR+ysRfE7A8ZO9J5uQfYfAWhA1+
         NoF9hA7F8+LBydVrDzA+pyzlZlVB/eoWC7M40+3iDaxnVpu7FTEYJSSVvzGkV96JCWBP
         9ISw==
X-Forwarded-Encrypted: i=1; AJvYcCU4MOJj/aYB1m3YeGDJAeZpkxqgOnxTqpr8qZTW4V0GDJjdwFllHpJs7xeh0ZT9fanz+yUsdHLYWHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+UzGWgjIUIc5as7Zp5xP1lF2QvaZWlHlh62FsFfbFX9oaN0p
	lV1fa8GhdpSVLuuAkz655H14/e4KcoGaKvR44YZEy/R9aNLKVwmAZogfYvmtdhriNqA=
X-Gm-Gg: ASbGnct6+gDPtasZxvastYvvLAzIvED9SM9Fw2v5UchrkFHnj3e+iWzduMAAZ2FeXt1
	Nfu62sqAPcVhEt1d3HW3GytCxuu6/rVdmJT+PsjGbnGap83w97nZK8vEbHCn3WlIVywNwCK1BBg
	eu2FJrzOgo2OtUZAY0jUTZfeXtTrY+rSRNUpy1GW43M8CWECVLpQ/3QTAyMl2iHdYMZZaHdBbf9
	bGHZH6RXmgOZEATo3yt+eDAcvRsRE32KKo5l+9tYarz+rbg6y/VbzY5GxZqysgDFp6MrCCHBHvi
	efW7HSRIVJKd7GUHEsoI3YWelZdePY6Q69rpJNqrknW/qkJa6P6At27z6udbEBUii3yhFKqpP1W
	cFo+pSWrZhCUA5WksyxAx4D7sbxtDzBcpeTuP7FUMQIEQyLIArwsvKw==
X-Google-Smtp-Source: AGHT+IFS0ERKXZDU/2paRwDAwj1qIE00GcJ4rlO9U8G8qiuVi07BwHIJVfO1FD2FE0d9SCuPJE4CnA==
X-Received: by 2002:a17:902:ecd1:b0:22c:3609:97ed with SMTP id d9443c01a7336-23e24fbf7bcmr36821175ad.30.1752669475780;
        Wed, 16 Jul 2025 05:37:55 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e2b31aba5sm5148085ad.0.2025.07.16.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:37:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
Date: Wed, 16 Jul 2025 18:07:45 +0530
Message-ID: <20250716123745.557585-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When injecting IPIs to a set of harts, the IMSIC IPI support will do
a separate MMIO write to the SETIPNUM_LE register of each target hart.
This means on a platform where IMSIC is trap-n-emulated, there will be
N MMIO traps when injecting IPI to N target harts hence IMSIC IPIs will
be slow on such platform compared to the SBI IPI extension.

Unfortunately, there is no DT, ACPI, or any other way of discovering
whether the underlying IMSIC is trap-n-emulated. Using MMIO write to
the SETIPNUM_LE register for injecting IPI is purely a software choice
in the IMSIC driver hence add a kernel parameter to allow users disable
IMSIC IPIs on platforms with trap-n-emulated IMSIC.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v3:
 - Rebase upon Linux-6.16-rc4
 - Make imsic_noipi as __ro_after_init
Changes since v2:
 - Skip enabling/disabling IMSIC_IPI_ID in imsic_ipi_starting_cpu()
   and imsic_ipi_dying_cpu() when imsic_noipi is set
 - Re-use the reserved IPI ID for devices when imsic_noipi is set
Changes since v1:
 - Added more details to patch description
---
 .../admin-guide/kernel-parameters.txt         |  7 +++++++
 drivers/irqchip/irq-riscv-imsic-early.c       | 20 ++++++++++++++++++-
 drivers/irqchip/irq-riscv-imsic-state.c       |  7 ++++---
 drivers/irqchip/irq-riscv-imsic-state.h       |  1 +
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9..7f0e12d0d260 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2538,6 +2538,13 @@
 			requires the kernel to be built with
 			CONFIG_ARM64_PSEUDO_NMI.
 
+	irqchip.riscv_imsic_noipi
+			[RISC-V,EARLY]
+			Force the kernel to not use IMSIC software injected MSIs
+			as IPIs. Intended for system where IMSIC is trap-n-emulated,
+			and thus want to reduce MMIO traps when triggering IPIs
+			to multiple harts.
+
 	irqfixup	[HW]
 			When an interrupt is not handled search all handlers
 			for it. Intended to get systems with badly broken
diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..2709cacf4855 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -8,6 +8,7 @@
 #include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -21,6 +22,14 @@
 #include "irq-riscv-imsic-state.h"
 
 static int imsic_parent_irq;
+bool imsic_noipi __ro_after_init;
+
+static int __init imsic_noipi_cfg(char *buf)
+{
+	imsic_noipi = true;
+	return 0;
+}
+early_param("irqchip.riscv_imsic_noipi", imsic_noipi_cfg);
 
 #ifdef CONFIG_SMP
 static void imsic_ipi_send(unsigned int cpu)
@@ -32,12 +41,18 @@ static void imsic_ipi_send(unsigned int cpu)
 
 static void imsic_ipi_starting_cpu(void)
 {
+	if (imsic_noipi)
+		return;
+
 	/* Enable IPIs for current CPU. */
 	__imsic_id_set_enable(IMSIC_IPI_ID);
 }
 
 static void imsic_ipi_dying_cpu(void)
 {
+	if (imsic_noipi)
+		return;
+
 	/* Disable IPIs for current CPU. */
 	__imsic_id_clear_enable(IMSIC_IPI_ID);
 }
@@ -46,6 +61,9 @@ static int __init imsic_ipi_domain_init(void)
 {
 	int virq;
 
+	if (imsic_noipi)
+		return 0;
+
 	/* Create IMSIC IPI multiplexing */
 	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
 	if (virq <= 0)
@@ -88,7 +106,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	while ((local_id = csr_swap(CSR_TOPEI, 0))) {
 		local_id >>= TOPEI_ID_SHIFT;
 
-		if (local_id == IMSIC_IPI_ID) {
+		if (!imsic_noipi && local_id == IMSIC_IPI_ID) {
 			if (IS_ENABLED(CONFIG_SMP))
 				ipi_mux_process();
 			continue;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 77670dd645ac..dc95ad856d80 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -134,7 +134,7 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 	lockdep_assert_held(&lpriv->lock);
 
 	for_each_set_bit(i, lpriv->dirty_bitmap, imsic->global.nr_ids + 1) {
-		if (!i || i == IMSIC_IPI_ID)
+		if (!i || (!imsic_noipi && i == IMSIC_IPI_ID))
 			goto skip;
 		vec = &lpriv->vectors[i];
 
@@ -419,7 +419,7 @@ void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int i
 	seq_printf(m, "%*starget_cpu      : %5u\n", ind, "", vec->cpu);
 	seq_printf(m, "%*starget_local_id : %5u\n", ind, "", vec->local_id);
 	seq_printf(m, "%*sis_reserved     : %5u\n", ind, "",
-		   (vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
+		   (!imsic_noipi && vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
 	seq_printf(m, "%*sis_enabled      : %5u\n", ind, "", is_enabled ? 1 : 0);
 	seq_printf(m, "%*sis_move_pending : %5u\n", ind, "", mvec ? 1 : 0);
 	if (mvec) {
@@ -583,7 +583,8 @@ static int __init imsic_matrix_init(void)
 	irq_matrix_assign_system(imsic->matrix, 0, false);
 
 	/* Reserve IPI ID because it is special and used internally */
-	irq_matrix_assign_system(imsic->matrix, IMSIC_IPI_ID, false);
+	if (!imsic_noipi)
+		irq_matrix_assign_system(imsic->matrix, IMSIC_IPI_ID, false);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 3202ffa4e849..57f951952b0c 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -61,6 +61,7 @@ struct imsic_priv {
 	struct irq_domain			*base_domain;
 };
 
+extern bool imsic_noipi;
 extern struct imsic_priv *imsic;
 
 void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend, bool val);
-- 
2.43.0

