Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F04C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 14 Dec 2022 14:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238547AbiLNOd0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Dec 2022 09:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238518AbiLNOdZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Dec 2022 09:33:25 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F2C2339A
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 06:33:24 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u12so19487669wrr.11
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 06:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OuqN6i3xDgWDQgdyvZ62ncqNwC02Nmosxvyp2oT1Vek=;
        b=kA8djj3SxcJzPd/tkyA19nr3VqDPI2W2mU4PabaNpfy0KhdGPok5EOhpPqRRkgHEp7
         UsKlkYzkhjJsubXy7jcirzMdIKXYiXOt1FzNgYnyMhZf2WV901v4IKLYc71zKUWapzXU
         BoJpjUXMGDRMpk2qasc76sLgOIB1gJdRcXp9M+rr+1R43dtYejor15lFhGeG+yivQk1/
         GWsl63/+gB8hodUg9lU56b1NKlQlXMe4xosZ2yPrQCM3Gk4nq2BXfWVb92TW2T0UR1Yy
         CQQRcoIm4tebkW+I57ebyGM7YG72xZ9njf/560IBLB3nCsNqh9b1JfwCSPBLyo5OU0Df
         5y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuqN6i3xDgWDQgdyvZ62ncqNwC02Nmosxvyp2oT1Vek=;
        b=Tudb4oALrzjjtEX+fFzZAxAVdBXepZugtwd5MVt5CUXVUWkwl0sr65V4ugVADUQTPD
         1zxUv9UZVTgtEuvjjpwZka0Z2z+6CfllOQA+8eQhMv+o9NSliXu+/ylgO01pn2iM56mY
         I3Z3Wm5t8+pS2OScKpJUDuJ7zAJGhJk813nV/tq7M6l8i+lFxqARLNmXQnpjWpRG0R9X
         wpqoN4BvogGynnM75a6vyJCPkXI5e5O5mZEqfIRVsNKqCzLtwz9ujwId5a/wtQEcXj8K
         uh6g/w+uXlP0+MMIltnnd4L2CoVRFUw8ZASEmSJ5aFfe2ARmOlIoDBEGT55DZBIF5OTC
         HSag==
X-Gm-Message-State: ANoB5pmauTMhPhil0Tm1TPBKszsWf7FEoa31FEKqBqX3eoeWx4IYehm5
        yZtf4RFmifrNN0c932hWGiyA8A==
X-Google-Smtp-Source: AA0mqf7xIJIgXYZsxK2tSCzIVle8ET5dDH8ooORx5cJ2R6fVlqM69PBiGsZ4kH0G3Q+gQWAxnTgswA==
X-Received: by 2002:adf:f206:0:b0:242:4b69:883 with SMTP id p6-20020adff206000000b002424b690883mr16140492wro.10.1671028403021;
        Wed, 14 Dec 2022 06:33:23 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id d22-20020a05600c34d600b003cfa80443a0sm2741896wmq.35.2022.12.14.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 06:33:22 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Allow to downgrade paging mode from the command line
Date:   Wed, 14 Dec 2022 15:33:11 +0100
Message-Id: <20221214143311.960266-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add 2 early command line parameters called "no5lvl" and "no4lvl" (using
the same naming as x86) to allow a user to downgrade from sv57 (the
default mode if the hardware supports it) to sv48 or sv39.

Note that going through the device tree to get the kernel command line
works with ACPI too since the efi stub creates a device tree anyway with
the command line.

Also, as those params are treated very early in the boot process and we
use standard device tree functions that may be kasan instrumented, we
only enable them for !KASAN configurations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Tested on both DT/ACPI kernel successfully

 .../admin-guide/kernel-parameters.txt         |  5 ++-
 arch/riscv/mm/init.c                          | 43 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a465d5242774..6741524aa980 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3548,7 +3548,10 @@
 			emulation library even if a 387 maths coprocessor
 			is present.
 
-	no5lvl		[X86-64] Disable 5-level paging mode. Forces
+	no4lvl		[RISCV] Disable 4-level paging mode. Forces
+			kernel to use 3-level paging instead.
+
+	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
 			kernel to use 4-level paging instead.
 
 	nofsgsbase	[X86] Disables FSGSBASE instructions.
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b56a0a75533f..8140fefe0e57 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -752,12 +752,35 @@ static void __init disable_pgtable_l4(void)
  * then read SATP to see if the configuration was taken into account
  * meaning sv48 is supported.
  */
-static __init void set_satp_mode(void)
+static __init void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
 	bool check_l4 = false;
 
+#ifndef CONFIG_KASAN
+	/*
+	 * The below fdt functions are kasan instrumented, since at this point
+	 * there is no mapping for the kasan shadow memory, this can't be used
+	 * when kasan is enabled.
+	 */
+	int chosen_node;
+
+	chosen_node = fdt_path_offset((void *)dtb_pa, "/chosen");
+	if (chosen_node >= 0) {
+		const char *cmdline = fdt_getprop((void *)dtb_pa, chosen_node,
+						  "bootargs", NULL);
+		if (strstr(cmdline, "no5lvl")) {
+			disable_pgtable_l5();
+			check_l4 = true;
+		} else if (strstr(cmdline, "no4lvl")) {
+			disable_pgtable_l5();
+			disable_pgtable_l4();
+			return;
+		}
+	}
+#endif
+
 	create_p4d_mapping(early_p4d,
 			set_satp_mode_pmd, (uintptr_t)early_pud,
 			P4D_SIZE, PAGE_TABLE);
@@ -800,6 +823,22 @@ static __init void set_satp_mode(void)
 	memset(early_pud, 0, PAGE_SIZE);
 	memset(early_pmd, 0, PAGE_SIZE);
 }
+
+#ifndef CONFIG_KASAN
+static int __init print_no4lvl(char *p)
+{
+	pr_info("Disabled 4-level and 5-level paging");
+	return 0;
+}
+early_param("no4lvl", print_no4lvl);
+
+static int __init print_no5lvl(char *p)
+{
+	pr_info("Disabled 5-level paging");
+	return 0;
+}
+early_param("no5lvl", print_no5lvl);
+#endif
 #endif
 
 /*
@@ -979,7 +1018,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
-	set_satp_mode();
+	set_satp_mode(dtb_pa);
 #endif
 
 	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
-- 
2.37.2

