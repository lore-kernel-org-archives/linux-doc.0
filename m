Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AE0C74A5B
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 16:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjCWQiJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 12:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbjCWQhp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 12:37:45 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6294737B58
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 09:36:04 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r11so4487954wrr.12
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 09:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679589360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFIdVMyY2JcOEfEYtk1Mrcm+ayayJpn4ssJH1y+Y8SY=;
        b=XRx/qjnE9uNVUhjrkckwtZNfRSeDtPWLGHujMYbX+pUc6W8XwJmyzK1Ozrgu3VrsCw
         ixX8yG4vVRdtvMmjSzsPFW6TAPtaQxa32kDhr/vEIxz/liX5Jnxy5ks5DMPn+9Tyqa0I
         dhuIn3YjYroXQczSAF05RgaY7Kx28T0tYXahdqAvORqBe/APPcYemeDL+w3XcSMRAei/
         FKvdHHP06rtfOitHpAAyJ0P4XX7VIzxGjRd4JUWIFZkTI6oVrvarr15s7codKgs0PYNT
         zS2CfmUgxC4epAxnNbYREJe7YzKCstK51eH0rVUpoZ7mNbioJ0ywr2VQq6ujrDbSqDWe
         XaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFIdVMyY2JcOEfEYtk1Mrcm+ayayJpn4ssJH1y+Y8SY=;
        b=GLecP9zuc16h4GNTN72hma+diXM5XEPwH14VwPmhAUwA/VhHyTcMQkhkL6L3bxBVV0
         hVd28EWxc9R+65AjFY4QG+c2eWf53o7/Mq+1RxaBEkJkpmb7ud3vo22rihse/7i7lg2s
         nOk0vgdaD6n3NJhxTuy0fj0f3PnKRBNOWYZiVl3nSKWwui9a4gYk7DFXchkky1fttIGH
         2GBD4is36wmdJ1PucWaDyh/JSErYpfvmpweduPZ2qoma8bub0wsnbtD2Jzr1Me1mNKCs
         FR9NEmjCdRebQnTxHzPws4ReNpRsC0sPW+R1r5gBX7IX7Fr8nl3zHBW/Zezckwwf5XZr
         Q1Cw==
X-Gm-Message-State: AAQBX9duGZyqvKZkBVtsvir7P+PtqL6s7ak+qPVacjMh8AxQwKGm1hiO
        fsSeK2D9J4iGSiSD3QlFuJktuw==
X-Google-Smtp-Source: AKy350bZB6XINZ/e2OvUeiAx/NAII4Q3/0majzUkK7Zk38kV4Ea31iChLco4fr0gnvIX/KOBcmR+sw==
X-Received: by 2002:adf:da50:0:b0:2cf:f312:86dd with SMTP id r16-20020adfda50000000b002cff31286ddmr2991280wrl.18.1679589359878;
        Thu, 23 Mar 2023 09:35:59 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v3-20020adfe4c3000000b002cf8220cc75sm8570661wrm.24.2023.03.23.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:35:59 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 2/2] riscv: Do not set initial_boot_params to the linear address of the dtb
Date:   Thu, 23 Mar 2023 17:33:47 +0100
Message-Id: <20230323163347.182895-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323163347.182895-1-alexghiti@rivosinc.com>
References: <20230323163347.182895-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that the dtb early mapping was moved in the fixmap region, we can
keep using this address since it is present in swapper_pg_dir, so remove
the dtb relocation which was wrong anyway since early_memremap is
restricted to 256K whereas the maximum fdt size is 2MB.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c |  5 +----
 arch/riscv/mm/init.c      | 21 ++-------------------
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 542eed85ad2c..a059b73f4ddb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -278,10 +278,7 @@ void __init setup_arch(char **cmdline_p)
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
-	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
-		unflatten_device_tree();
-	else
-		pr_err("No DTB found in kernel mappings\n");
+	unflatten_device_tree();
 #endif
 	misc_mem_init();
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb78d6bbabae..0f14f4a8d179 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -249,25 +249,8 @@ static void __init setup_bootmem(void)
 	 * early_init_fdt_reserve_self() since __pa() does
 	 * not work for DTB pointers that are fixmap addresses
 	 */
-	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
-		/*
-		 * In case the DTB is not located in a memory region we won't
-		 * be able to locate it later on via the linear mapping and
-		 * get a segfault when accessing it via __va(dtb_early_pa).
-		 * To avoid this situation copy DTB to a memory region.
-		 * Note that memblock_phys_alloc will also reserve DTB region.
-		 */
-		if (!memblock_is_memory(dtb_early_pa)) {
-			size_t fdt_size = fdt_totalsize(dtb_early_va);
-			phys_addr_t new_dtb_early_pa = memblock_phys_alloc(fdt_size, PAGE_SIZE);
-			void *new_dtb_early_va = early_memremap(new_dtb_early_pa, fdt_size);
-
-			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
-			early_memunmap(new_dtb_early_va, fdt_size);
-			_dtb_early_pa = new_dtb_early_pa;
-		} else
-			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
-	}
+	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
+		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
 
 	dma_contiguous_reserve(dma32_phys_limit);
 	if (IS_ENABLED(CONFIG_64BIT))
-- 
2.37.2

