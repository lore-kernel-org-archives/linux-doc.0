Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31D9C636CC
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 18:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjBPSXg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 13:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbjBPSWx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:22:53 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200DB54541
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:22:17 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so6766140pjq.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjXwYmjlb4qLXAQKk4p+crKVMVgfMLiURDuGCOAQBXo=;
        b=V1EWcSn7s/zB5yoo0RZlAv/kS8CPk7pGWmyW8MmvfWwyIqESMo1MjwuqWg/GrXiycT
         IRlhq2vH4TRPjqX7MhEUvuxf2HAMFxTno3nTwzqLN7Hys2vkxT4VnLIRWoCjpgFE0OGJ
         eZNi5pce+I9VZkznd7sJnnhv14NvLcNNVkclgh3iyop6uIXFFD2lUYXuJWfNeZ2TEHfF
         lCb0ifNzr28mTfFrREt2B20mnaE0wHeFTC18v0zervqlQypET2v2Y6LCXohFYiPAjlyX
         CjBcMaogRlRp7aF3LrWJxWmuaT3vZhVsKyUcOAkehGm6q4i6NVgluPC6KGFe+nedMJnn
         9I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjXwYmjlb4qLXAQKk4p+crKVMVgfMLiURDuGCOAQBXo=;
        b=CjD/XIAbYY+9Ccap7mlShH4VJFWieCk7lG+13U1R71Zg1dFfg06iTngd6KD88fD91S
         pMJocYk/ReSjX8LIM4MSrn6owqti6BS0051TpuKeBc6BpC+8vF+pFMJYG2hba2yM38JH
         MYfu+72YxgcmIru3pO48dW9yLmuWmZ3AgCzBwEFhExie1GvjyBDVN1NQ/OPoM0XFWw39
         vYG2ehCe4z2qdUjpVK/6xGngS8/cByxQOH2dvUaRjM8I08fZfJ9AIBPptzOhr3y4aiZK
         2f2ASurysWvk6fBF3+vx0MNLwch4HCXkU2dlmephZtz7Q+eedwKkgUEtZPLAelamMqVY
         akcQ==
X-Gm-Message-State: AO0yUKVGkXaz7I5pCfodLugJoEq51giCMmeuOe7KFL4mfBHCHQCQs0JC
        eJkLCiLeMAt/fUIuNkAkaLRCww==
X-Google-Smtp-Source: AK7set9LxgFkAVbnm8jngPBu3SiXgJ9hu19zG34UJQxj6MufVqIhqHqG5LXGm9234ApK0t9Yz/YDOQ==
X-Received: by 2002:a17:90b:3852:b0:234:7ccf:3c7c with SMTP id nl18-20020a17090b385200b002347ccf3c7cmr3048070pjb.9.1676571733991;
        Thu, 16 Feb 2023 10:22:13 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:13 -0800 (PST)
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
Subject: [PATCH V2 17/21] RISC-V: time.c: Add ACPI support for time_init()
Date:   Thu, 16 Feb 2023 23:50:39 +0530
Message-Id: <20230216182043.1946553-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On ACPI based platforms, timer related information is
available in RHCT. Add ACPI based probe support to the
timer initialization.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/kernel/time.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1cf21db4fcc7..e49b897fc657 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/of_clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
@@ -18,17 +19,29 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
 void __init time_init(void)
 {
 	struct device_node *cpu;
+	struct acpi_table_rhct *rhct;
+	acpi_status status;
 	u32 prop;
 
-	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	of_node_put(cpu);
-	riscv_timebase = prop;
+	if (acpi_disabled) {
+		cpu = of_find_node_by_path("/cpus");
+		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
+			panic("RISC-V system with no 'timebase-frequency' in DTS\n");
+		of_node_put(cpu);
+		riscv_timebase = prop;
+	} else {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
+		if (ACPI_FAILURE(status))
+			panic("RISC-V ACPI system with no RHCT table\n");
+		riscv_timebase = rhct->time_base_freq;
+		acpi_put_table((struct acpi_table_header *)rhct);
+	}
 
 	lpj_fine = riscv_timebase / HZ;
 
-	of_clk_init(NULL);
+	if (acpi_disabled)
+		of_clk_init(NULL);
+
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
-- 
2.34.1

