Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5192EC636CC
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 18:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjBPSXF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 13:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbjBPSWb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:22:31 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5271C50363
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:57 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso6724912pju.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/B7oU0oZMzvSlnZ6Slk2M4LeGqm6SOf/DwHx2JHpN8=;
        b=JhzKrMk2y0c0UJJY9R3LAeDqup2Vy26n7fKJF2EJ8p9IKFWGnI1YedBoBhqO8F3LkM
         tVZ+fGNaffll2OfDmYRq+19mu8tuigJ54kj92JxCQHc1ux9gKkHGlD6/60HYZK/ZNGTo
         M3kerTUxSK6phuUl/DKNjGQyHWtPG5QMv4mHhe3+juD7WJQynDSgsNO+hKRxoKLPXcyg
         fk5/451Gdasyf10nauCTje7081IndfdWP2CXIZbgriIouer1UlPFOB6pBqXuYsTQcSO9
         xbPXfLEPHK2SFHFpnQZA7O6nt+QPejZjwMal7uNgk+Hakcw4VJJ7MArqKBxLJzJHHUF0
         L2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/B7oU0oZMzvSlnZ6Slk2M4LeGqm6SOf/DwHx2JHpN8=;
        b=SrO/wGblvUPhdMXhhOjeEe8fdQ+v28kKxkIJR438Gb6G01erx5nlADakXcNoKSpf9k
         Lqv3kAw7U7dfub+qJZxnrnaUQ0p8wZqDEhv3FkVPCW8PNEXV2yD+7XhX6vI0Q6d/GunK
         HR7WIqZI7XL0J+BkIES3tEv/Oc/VMC5/hbbm4IoR7L/Q/9E8qx1msp2GJBBL+ECeMpDZ
         EghRnvDrMY+ls/wXx1FZEdX7gyIwC8pgkhf/kRkuO31KzDy7wKGqvss35cJBT9Oxbms0
         DC4ximYx3ax1Xn17j9zCxXK2rIZ2mDMIfFCqH4l7cjPLoxZ/8UPzCa3OQP8WWgBsiw8e
         fdfA==
X-Gm-Message-State: AO0yUKWtNQkpW03dubEgQTyN303o6gHqHrvQg2uxTQDwhOBwMhcqT2jX
        TCZp6zA7cDtaxuNwnWKfGvOv0g==
X-Google-Smtp-Source: AK7set+UGGwky0KcCyPjol1FGoQkgy43ytFVLWD+NpcOvsVqZI0SmSkUdXxAOwokXN5tYcdCUF81Bw==
X-Received: by 2002:a05:6a20:8e16:b0:c6:dfe3:8663 with SMTP id y22-20020a056a208e1600b000c6dfe38663mr6729908pzj.9.1676571715195;
        Thu, 16 Feb 2023 10:21:55 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:54 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V2 13/21] RISC-V: cpu: Enable cpuinfo for ACPI systems
Date:   Thu, 16 Feb 2023 23:50:35 +0530
Message-Id: <20230216182043.1946553-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On ACPI based platforms, few details like ISA need to be read
from the ACPI table. Enable cpuinfo on ACPI based systems.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/kernel/cpu.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..a227c0661b19 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -3,10 +3,12 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/acpi.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
@@ -256,26 +258,41 @@ static void c_stop(struct seq_file *m, void *v)
 {
 }
 
+static void acpi_print_hart_info(struct seq_file *m, unsigned long cpu)
+{
+	const char *isa;
+
+	if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
+		print_isa(m, isa);
+}
+
 static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
-	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
 	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
+	struct device_node *node;
 	const char *compat, *isa;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
-	if (!of_property_read_string(node, "riscv,isa", &isa))
-		print_isa(m, isa);
+
+	if (acpi_disabled) {
+		node = of_get_cpu_node(cpu_id, NULL);
+		if (!of_property_read_string(node, "riscv,isa", &isa))
+			print_isa(m, isa);
+		if (!of_property_read_string(node, "compatible", &compat) &&
+		    strcmp(compat, "riscv"))
+			seq_printf(m, "uarch\t\t: %s\n", compat);
+		of_node_put(node);
+	} else {
+		acpi_print_hart_info(m, cpu_id);
+	}
+
 	print_mmu(m);
-	if (!of_property_read_string(node, "compatible", &compat)
-	    && strcmp(compat, "riscv"))
-		seq_printf(m, "uarch\t\t: %s\n", compat);
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 	seq_puts(m, "\n");
-	of_node_put(node);
 
 	return 0;
 }
-- 
2.34.1

