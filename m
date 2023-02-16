Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE0CC61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjBPSVo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 13:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjBPSVn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:21:43 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B3685F7E
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:17 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id c11so2164935ple.9
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRX9Rh9lefADAfWYEbY0yIAAiynI9MZaTYH+yetjREM=;
        b=IaeR6uCOYqxkxcPO2OyZK+7eC6B5XWUpETzkV429cXcAgdslHLazNahirlmg6GJ8nt
         ZxrE9y/gCeS9R3rDQdwL6ajjbBDd26jf7ah+E/ozJpUScU2Hs+caXXwpejxxCR18bBU5
         QNKpQffB0OL67KNEN3pFW1lBC/gH9rY9bKHvtpm6/Plg4D4UklunHYOF9ee3xh/FJ8fg
         YWtE0U1o4BV11Ioa48QOdk/Y5DLLCGTR9ZcNpwCOm0D6MtRbodmOEuxChDMNlSDPHFN5
         VLFqJLp/kX3fdGCWO4vPoek08/oItOINvIreIDT7iodgxsdmmImQdjNXsthZ5FVMYJ15
         EWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRX9Rh9lefADAfWYEbY0yIAAiynI9MZaTYH+yetjREM=;
        b=3CFgsPnp/ijf0v70WhghLCZ5thMrdmp0V4Tc31+Vv58Jlyu5hvr3fTSaLWfC1hqPWZ
         P/qgCaA3aNViPC/ShuBkuEZCSW4kfVL37FbBleKGuTlJeozuDFBDPAwdYJ+RZU5TM3vs
         YiprsYpnspvsWCoemk1j4nkItmssK63/CVqNxQFK1pLmoyW5th3LJrqdb6kKKUNk8KWJ
         CAW1CrhPoMYjG/AmUNARx6fr+55qkjOcnpa3cdOVTP7W1FRVJW1U4dKVl5rclb5/7Enh
         PdkRgbRQ9np/iYE03PPJxEkctZNkiA+ltbnP9OLAypakuJnl2zHljQmmVsMbi14k99SU
         ewgw==
X-Gm-Message-State: AO0yUKXOsINcN7xq7sMLj/FB+VTHZlBvmFROMCSnuC/M5Faq2yd1Fp6H
        9bcTT5/YpNho/noOmt6Cr1b4LQ==
X-Google-Smtp-Source: AK7set8xLrx+1PXJVXcHl9Dg9zSUmVDJVoqpG5XSTjL+yDDVADutOhkLtType5mYRLOojwQIa6F3zw==
X-Received: by 2002:a05:6a20:3d0c:b0:bc:61d5:7bf2 with SMTP id y12-20020a056a203d0c00b000bc61d57bf2mr7783217pzi.34.1676571676972;
        Thu, 16 Feb 2023 10:21:16 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:16 -0800 (PST)
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
Subject: [PATCH V2 05/21] ACPI: Kconfig: Enable ACPI_PROCESSOR for RISC-V
Date:   Thu, 16 Feb 2023 23:50:27 +0530
Message-Id: <20230216182043.1946553-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Enable the ACPI processor driver for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ccbeab9500ec..b44ac8e55b54 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -281,7 +281,7 @@ config ACPI_CPPC_LIB
 
 config ACPI_PROCESSOR
 	tristate "Processor"
-	depends on X86 || IA64 || ARM64 || LOONGARCH
+	depends on X86 || IA64 || ARM64 || LOONGARCH || RISCV
 	select ACPI_PROCESSOR_IDLE
 	select ACPI_CPU_FREQ_PSS if X86 || IA64 || LOONGARCH
 	select THERMAL
-- 
2.34.1

