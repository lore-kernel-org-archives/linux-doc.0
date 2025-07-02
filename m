Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0899623A994
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 11:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456806; cv=none; b=REKWE2+tpJ5ibiPlHtXdmzoGEF7R4sjFM4GbNf1L/NPfjsZQXyvlGy+okGrIerglVFxJo+ehC7Hmwwkdk8tBM/ij8l3ETobDufEZOdyRsugrNlkPdW5MT97+W54lloV0gOWpwzUGiSquEmux1jFJURctJfqFyQPhLFxH0hmjwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456806; c=relaxed/simple;
	bh=w73s5wwmHyDmazvgbqmdpnOAO0VFNbxIsAs4Unf+SZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fqe+jUZE5TWtDbanSRiochNuYVQohgJm3iKIq7I9WS7eOWYqmWUKxTIie2o7dI7KpLuHUQQbSuPrfD7ra0eZl/0EQQy9K5U/xu2IVAFTNHlDRlynahRG3Ttfb19DW+STFC4XHyQKp0ContViQGYACOShVaM6vELm5hdNtE0QbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=JiSVtPjd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="JiSVtPjd"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so6618920b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751456804; x=1752061604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yk2XrB5jQ5gWfcg8j5KkpuXSbfKXmb2HHqWVHfhl1GI=;
        b=JiSVtPjdojxxTKi4BAsEegCr/yyDaqh88cV0gfY3+2iXGzoF7gBD8JzvdBRHdtKobV
         p3xTo5Wc0u5e+9YIVEiVFt4Y0xaAraE6ag+L+VkCREdUOCT11gQRjxk236em766g03p6
         vTEGQA+4UUtTQuBw0oL+67AOcQN+r5Trz4g3wShpqrmxpbbIJojC8HC8M4SUu/00iaTY
         lUKALL9T6hqVEog6KNwkCvji7h50dOJj8MYA4ovJxP+mDIxcBjKZUOmuNGWVThZdjCN3
         l/Uak9QxKuXndUNmQ9DJiIrDhWBWOU41C47fb0MBMi612z6TxHMmI5Jgs5iMKHQk/ikH
         NNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456804; x=1752061604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk2XrB5jQ5gWfcg8j5KkpuXSbfKXmb2HHqWVHfhl1GI=;
        b=fKSziXZqRZ4xgrgeh8vpnERfOAK3aXAMqWlyrSnJ1V2ekD+TJtaEkbaqkey2bmO7DT
         yOFG1WYfOC5pkzvJLK43o6SI93q0FjWhRQSUsVdzwJLO5AqE9FVo99VQVfx5eAh3Q7Ha
         30YZNjpjlQOLNFodabxYg9kzLLiC0T+4t/+Y9bH9TbS8WThrKF/P1XXwBXpt69BpKf9C
         YqyF1eF8DnWM/AXSBkaMv18EORRez9WDP9wRiHEMu2Lgkbmhds++f8Nv8iP9lPALVMZv
         Ncr2P3hEI7TsKBKHJG1eY5YInDBXg87c1USWSlJZEhzaO1bf7hRpR39qnOWp6SIf2x9E
         GLpw==
X-Forwarded-Encrypted: i=1; AJvYcCX+m8P4T0JIdRf5puF92AVUp1Nn9J+HFDvW/bVKB/lodR618uV9+16NV1nwCbUZfSm/EzbTklCynZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/cFZr1VpibItXv9dYISMQLLDZdqSoHVO5jFogfIjIUepDVLe
	YgxBv/TEr7gkER6U3HVRAMll6vcdX4fqIVFcIkLCH71rFjjT85+MJUrNe2zc8Eb6kdE=
X-Gm-Gg: ASbGncumD1T8Nxd1spdfUWISDSBCh+Gud2CnQfuT0djJ7XG2EtNwDQS3cmAMCpAp4ZF
	nQ/0q3tTzwXi2RV35w5utsYyJF+cp0SWSXPw1uhwAGKUOY9wzAM+vNnXcTAFfRLsIjbqxyG6TZE
	/kHJDFslcwH1B38xcbEf2CBlkoKappSPTolutKDd8B+RMHN02Fpa9AvpcLjMwIULnFhzVDhNVHV
	qlp0MJ4LFXvb243gA8cJryUcTVyhn4W51CC3jX9KIqyEgQhSZ+pqzrKhXZygq+wRx5PgVz4Tnqd
	VtDSLiv48b5PsME+as91e89zDQElve5BB2HOsvBUv+OtbjxA9HFcQ1c11AlYMZAkKMbboZerOnE
	B2gbRp5uh7r+1zhMOZ6U=
X-Google-Smtp-Source: AGHT+IFCWxOZ8rl0VoQzyP66lbRbXpHM77edYEAEhKu5qS8o5WzfskN91xaYVQWAyRdHNQm0i8dLEg==
X-Received: by 2002:a17:90b:2dd2:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-31a917837f9mr3736824a91.2.1751456804171;
        Wed, 02 Jul 2025 04:46:44 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm18150271a91.26.2025.07.02.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:46:43 -0700 (PDT)
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
Subject: [PATCH v2] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
Date: Wed,  2 Jul 2025 17:16:33 +0530
Message-ID: <20250702114633.1490974-1-apatel@ventanamicro.com>
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
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 drivers/irqchip/irq-riscv-imsic-early.c         | 12 ++++++++++++
 2 files changed, 19 insertions(+)

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
index 1dbc41d7fe80..c6fba92dd5a9 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -9,6 +9,7 @@
 #include <linux/cpu.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -22,6 +23,14 @@
 #include "irq-riscv-imsic-state.h"
 
 static int imsic_parent_irq;
+static bool imsic_noipi;
+
+static int __init imsic_noipi_cfg(char *buf)
+{
+	imsic_noipi = true;
+	return 0;
+}
+early_param("irqchip.riscv_imsic_noipi", imsic_noipi_cfg);
 
 #ifdef CONFIG_SMP
 static void imsic_ipi_send(unsigned int cpu)
@@ -47,6 +56,9 @@ static int __init imsic_ipi_domain_init(void)
 {
 	int virq;
 
+	if (imsic_noipi)
+		return 0;
+
 	/* Create IMSIC IPI multiplexing */
 	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
 	if (virq <= 0)
-- 
2.43.0

