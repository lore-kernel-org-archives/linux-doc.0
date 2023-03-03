Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB04BC678D4
	for <linux-doc@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjCCNit (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Mar 2023 08:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbjCCNiX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 08:38:23 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913E670433
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 05:37:46 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id a9so2637372plh.11
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 05:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8QTnerj7bYskLlpj17RAvWj070+do7b32kQaiggteA=;
        b=RgJqREjhLWiT9HAwULg1TCKy3elPJioYn7o58gezsP6MvD88qFFcqTs8G4yvOZl1+x
         uACE7bocF1Nt5qSzzsw3Id8jszuDh4dCI34HMitP5OGUEy0rypJR0r1L+EWVBdLdPJOK
         L3W3Af6kXSq9+OjQxCsfQMpWrgqlvh/c3/grFMzOVy/bM+ARSvmoksPof6W9e0RUXsvj
         srUJfWInlYLWE1JJR6JImY+rNgxvrmC3zyQYnnq9efC8Y2f1zyc1D+I+Cj7T9ltu79mh
         t8GR2B13Tgo6izfj2S+7J1Chr1wjxfZs9uxJju+wjkhw0lZhR7quW1egY3yUltQV2PkU
         Rfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8QTnerj7bYskLlpj17RAvWj070+do7b32kQaiggteA=;
        b=zP6Gbj5hXNBHst+vWFLhvqW4quIU9YwlxJp/5e3xI+fjiBWjqDJJl8FYRMZcDlo/Mw
         Hu5ZeU3ByhFDj0qVJbeJFnOco3kPG30h8umxK47IrBXebwzMNEllTV9Lr+XqESK8fBMH
         pxjFd2YcJSCclqgN8q8Qx+Z6xML7Gftwoa+BdGQIs9ee5i70M+pqw7b7o+wwtF/fswH1
         KQyNzk0F/Tjtm31YxVhpOM6JKJYuOR52Cr3DnELM+MaG+lq62eqv2pD0zFeNoc3bA3Ow
         D188ouXS3AszibZkZQxsLrqBrSeQajS12tpM70Q1KFff7FmoMuzykK9f8Jk3bcPyTWey
         Yrtw==
X-Gm-Message-State: AO0yUKW5uXyu3Qomz9QQrAkUW0bqL7Kly8weGQwZEDSN7aBI/I0JcnAU
        FWpE622Uiib7A/58ekMfItJyeQ==
X-Google-Smtp-Source: AK7set+3syqBrexDfRhiXUmwPvMl0XTqXIm4cfBvm5pKr9zwZ/LM+g847U2jDtODoXH4qiNOEEMLMA==
X-Received: by 2002:a17:902:d4c8:b0:19e:7bce:cc65 with SMTP id o8-20020a170902d4c800b0019e7bcecc65mr1963990plg.66.1677850663667;
        Fri, 03 Mar 2023 05:37:43 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:43 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V3 10/20] RISC-V: smpboot: Add ACPI support in smp_setup()
Date:   Fri,  3 Mar 2023 19:06:37 +0530
Message-Id: <20230303133647.845095-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Enable SMP boot on ACPI based platforms by using the RINTC
structures in the MADT table.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/smpboot.c | 72 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 26214ddefaa4..27047322d3bb 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/arch_topology.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -70,6 +71,72 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
+#ifdef CONFIG_ACPI
+static unsigned int cpu_count = 1;
+
+static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const unsigned long end)
+{
+	unsigned long hart;
+	static bool found_boot_cpu;
+	struct acpi_madt_rintc *processor = (struct acpi_madt_rintc *)header;
+
+	/*
+	 * Each RINTC structure in MADT will have a flag. If ACPI_MADT_ENABLED
+	 * bit in the flag is not enabled, it means OS should not try to enable
+	 * the cpu to which RINTC belongs.
+	 */
+	if (!(processor->flags & ACPI_MADT_ENABLED))
+		return 0;
+
+	if (BAD_MADT_ENTRY(processor, end))
+		return -EINVAL;
+
+	acpi_table_print_madt_entry(&header->common);
+
+	hart = processor->hart_id;
+	if (hart == INVALID_HARTID) {
+		pr_warn("Invalid hartid\n");
+		return 0;
+	}
+
+	if (hart == cpuid_to_hartid_map(0)) {
+		BUG_ON(found_boot_cpu);
+		found_boot_cpu = true;
+		early_map_cpu_to_node(0, NUMA_NO_NODE);
+		return 0;
+	}
+
+	if (cpu_count >= NR_CPUS) {
+		pr_warn("NR_CPUS is too small for the number of ACPI tables.\n");
+		return 0;
+	}
+
+	cpuid_to_hartid_map(cpu_count) = hart;
+	early_map_cpu_to_node(cpu_count, NUMA_NO_NODE);
+	cpu_count++;
+
+	return 0;
+}
+
+static void __init acpi_parse_and_init_cpus(void)
+{
+	int cpuid;
+
+	cpu_set_ops(0);
+
+	acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_rintc, 0);
+
+	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
+		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID) {
+			cpu_set_ops(cpuid);
+			set_cpu_possible(cpuid, true);
+		}
+	}
+}
+#else
+#define acpi_parse_and_init_cpus(...)	do { } while (0)
+#endif
+
 static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
@@ -118,7 +185,10 @@ static void __init of_parse_and_init_cpus(void)
 
 void __init setup_smp(void)
 {
-	of_parse_and_init_cpus();
+	if (acpi_disabled)
+		of_parse_and_init_cpus();
+	else
+		acpi_parse_and_init_cpus();
 }
 
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
-- 
2.34.1

