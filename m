Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F328EC001DB
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235281AbjHCSAZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 14:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbjHCSAK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 14:00:10 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E7944B4
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 10:59:57 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686efb9ee3cso1078144b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Aug 2023 10:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085597; x=1691690397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlgMxBU+gnbxavLK2CnXHLqjxrOHpsQhLJivrmp7gq8=;
        b=Mn/vo0MoTkPiEepTolmO07DSHUYqv7rFmArT6LTUsVmzAqnBvKBjkRZBvhSJTyiZAM
         1h1+n6DkofxPjLLD7asRa2i/oE66f7GWtWQqA9+nDJYue6PrwjDM067chowzEAr4ODxH
         vSRhcalLZi64uzfoqGFqhxbjGjGGDhdaLNb94wU3+LcfSd6SGzYCkrAI2qx43QP8mXm+
         DJ0Il1lN5U+uqlCxzJ+JnPkr+AJ87TQm7Mbi6Aqs2pV30Apw6vIAlJMrvnORHqksud91
         revKW71DM8rTMoqvZp3Ftaus2TBe8ju/o/MzItnmUE5tDKZn5+PQ0RhtNd0uQFIakZk6
         1UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085597; x=1691690397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlgMxBU+gnbxavLK2CnXHLqjxrOHpsQhLJivrmp7gq8=;
        b=NwHmx+D5RWbpUMQdfiGmudVIwA9u8yhfXnGx/CafBGK8JJCoriYe9TnEc7xh4/6S9t
         jBHd3cE93wDbzkZkiLL5gJAZsZqnA4m5iK3fNrL3sQV629hvF5FQcXIPHWyU9gPykkzC
         ZDmF2SNZNGbLEXoKgnoUdvT+NUWFwxZxg68a7eoMJm9aULYgUA62hXCOEcgAjLJqkr8L
         esPur6D0UrizR7EHAcVlUveqp18Ise1L0HAyN7pr301Rld+aaJgxjpdQvTVGBhdWQMPr
         TTiSHxjgWbRPz63MTgTW8iJqr15KVxiuXQXOY+3iQQ69XGhxMyzsNraDfwMRWswUDrtA
         2EhA==
X-Gm-Message-State: ABy/qLbivyww7YlnDs89QQdRZsBOaqQ3+kxEXH+8vahaU9glbASUCBTE
        spGa6o3RSc7Qivd5RpekBriVbTcEJ1V3oLRiwpc=
X-Google-Smtp-Source: APBJJlHeLQhx5wJXxieN87kQ/FrrGdUXv58YAFTjJ6UeQQPmtQGf8bvG5vbiImqAXiXcjHGvc1bNlw==
X-Received: by 2002:a05:6a00:c86:b0:682:4c9f:aa0 with SMTP id a6-20020a056a000c8600b006824c9f0aa0mr23559310pfv.29.1691085596954;
        Thu, 03 Aug 2023 10:59:56 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.10.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:59:56 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anup Patel <anup@brainfault.org>,
        Marc Zyngier <maz@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Robert Moore <robert.moore@intel.com>,
        Haibo Xu <haibo1.xu@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        kernel test robot <lkp@intel.com>
Subject: [RFC PATCH v1 03/21] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address
Date:   Thu,  3 Aug 2023 23:28:58 +0530
Message-Id: <20230803175916.3174453-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

acpi_os_ioremap() currently is a wrapper to memremap() on
RISC-V. But the callers of acpi_os_ioremap() expect it to
return __iomem address and hence sparse tool reports a new
warning. Fix this issue by type casting to  __iomem type.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@intel.com/
Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h | 2 +-
 arch/riscv/kernel/acpi.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index f71ce21ff684..d5604d2073bc 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -19,7 +19,7 @@ typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HARTID
 
 /* ACPI table mapping after acpi_permanent_mmap is set */
-void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
+void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
 #define acpi_os_ioremap acpi_os_ioremap
 
 #define acpi_strict 1	/* No out-of-spec workarounds on RISC-V */
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 5ee03ebab80e..56cb2c986c48 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -215,9 +215,9 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 	early_iounmap(map, size);
 }
 
-void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
+void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 {
-	return memremap(phys, size, MEMREMAP_WB);
+	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
 }
 
 #ifdef CONFIG_PCI
-- 
2.39.2

