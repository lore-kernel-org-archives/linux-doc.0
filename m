Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED726C7EE2D
	for <linux-doc@archiver.kernel.org>; Mon, 15 May 2023 05:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238267AbjEOF4R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 May 2023 01:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238459AbjEOFzR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 May 2023 01:55:17 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6563F2681
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:51:48 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ab14cb3aaeso87506605ad.2
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129907; x=1686721907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRIRI8aArNgE1fextAvbnFu2fBTu5X0gP4d56RcrLtU=;
        b=P55VHJAeeZPFLn6MArdkdONPfKxSmHWuE5x9uwVEEo8fI8KbMUVEaDdai2FLBo197c
         m1IMiinKvSiNmbINs8Cjs90BwvOF9iQ99bPpIZlHLbjjg7rLEz5EFexQW58tZsGZs9Dm
         OezmSZw3QuY+j3EthAC5CUjagDzbnL6a1p5axq2e0GZvF6VEl0ZfjneirVX0dScfUfpa
         j4Ly8D8jpo/7BXqGPq5xwGDLgPgsLzPm79brEuKEGA1Fa9MA7P82rDM1Iqi5+d+4NOHm
         cf8DFDbDr1xpJzM0fXtKoTMrvtQrRv1B7WI0LjnHHlLnJLfd2VNrvnJC0dGqjFt3YKZZ
         KJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129907; x=1686721907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRIRI8aArNgE1fextAvbnFu2fBTu5X0gP4d56RcrLtU=;
        b=IYuCrBYQFOi5WneYfg0ZnwVlx4MxNPlR1rZlOqHSLwUU6wAutwajVGCctElD/nDo2e
         zBIydvCgHyhONzj8jvpSINYeAf7d8YO9XvPvxGTG4pIArpROIjpe1wnM73qgorYb30fR
         iQ0QxgcF5VGnDqoyMCUz76Dinx1tP1Kz4JNKxFdvHb7QUwo/sHec+lZ4hu+OFG4la3nV
         UKmQCMCRkh7dfJcsuUcB2xjb6lX6XIjGllTM2gO5jKJPyVgIiYglNmLZULNiKd8Pqvbx
         7JO2P6xqFtnjZU9TexZG+AoAyqt+2aAgq+pxKRQ47WIgqQMytnEkPECyboIi/6JR2uQT
         7gag==
X-Gm-Message-State: AC+VfDwMg8CpVmRGzdzn2ma0qR2oet89c+VO7j1vQTytysvN8Ny1l6HV
        he9sVDbr35aWVpGVf8Pf6J3tyzpkHC7c58tjTWs=
X-Google-Smtp-Source: ACHHUZ7MyqMNWbnzlW+Qm5Vs15EikGz5Gk7dGMK9zmxWk7Q0Vfy73hx3hlnowhqMEf+HVQzX9PIUCw==
X-Received: by 2002:a17:902:e751:b0:1ab:1eca:f6b6 with SMTP id p17-20020a170902e75100b001ab1ecaf6b6mr45146037plf.13.1684129906775;
        Sun, 14 May 2023 22:51:46 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:46 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V6 19/21] RISC-V: time.c: Add ACPI support for time_init()
Date:   Mon, 15 May 2023 11:19:26 +0530
Message-Id: <20230515054928.2079268-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/time.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index babaf3b48ba8..23641e82a9df 100644
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
+
+		of_node_put(cpu);
+		riscv_timebase = prop;
+		of_clk_init(NULL);
+	} else {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
+		if (ACPI_FAILURE(status))
+			panic("RISC-V ACPI system with no RHCT table\n");
+
+		riscv_timebase = rhct->time_base_freq;
+		acpi_put_table((struct acpi_table_header *)rhct);
+	}
 
 	lpj_fine = riscv_timebase / HZ;
 
-	of_clk_init(NULL);
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
-- 
2.34.1

