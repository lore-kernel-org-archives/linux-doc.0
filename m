Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CC0D07D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Jul 2018 20:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729324AbeGRUj3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Jul 2018 16:39:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:38408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729309AbeGRUj3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Jul 2018 16:39:29 -0400
Received: from localhost.localdomain (xdsl-188-155-58-14.adslplus.ch [188.155.58.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8215C2075E;
        Wed, 18 Jul 2018 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1531944002;
        bh=Ig8IrYTGzMScTYPsqPbbWdZ1SYiNc6j6Lg7O1nRmCzs=;
        h=From:To:Cc:Subject:Date:From;
        b=Q71qw1u+oVoTujJAnH8FKc5ioIpUhOBl5Metv+0PYzFv1Iu8UKCgXXUD2a7Qst3hX
         IpLeKxErcEm/LVRq7t+2ReHBUeyTv6VK5y8y2WkXlhW48EUW04DPw0r3y7JlCxC1Zu
         1kGJkwx2NqDNoXK8wD0l6405sw7QtpdjVULEdQI0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [RFC] ARM: exynos: Fix imprecise abort during Exynos5422 suspend to RAM
Date:   Wed, 18 Jul 2018 21:59:29 +0200
Message-Id: <20180718195929.5852-1-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Suspend to RAM on Odroid XU3/XU4/HC1 family (Exynos5422) causes
imprecise abort:

	PM: Syncing filesystems ... done.
	Freezing user space processes ... (elapsed 0.003 seconds) done.
	OOM killer disabled.
	Freezing remaining freezable tasks ... (elapsed 0.003 seconds) done.
	wake enabled for irq 139
	Disabling non-boot CPUs ...
	IRQ51 no longer affine to CPU1
	IRQ52 no longer affine to CPU2
	IRQ53 no longer affine to CPU3
	IRQ54 no longer affine to CPU4
	IRQ55 no longer affine to CPU5
	IRQ56 no longer affine to CPU6
	cpu cpu4: Dropping the link to regulator.40
	IRQ57 no longer affine to CPU7
	Unhandled fault: external abort on non-linefetch (0x1008) at 0xf081a028
	Internal error: : 1008 [#1] PREEMPT SMP ARM

with last call trace in exynos_suspend_enter().

The abort is caused by writing to register in secure part of sysram.
All Exynos5422 devices, including Hardkernel Odroid boards, boot with
TrustZone in non-secure mode therefore they should access non-secure
sysram.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Comments, whether my understanding is correct, are welcomed!
---
 Documentation/arm/Samsung/Bootloader-interface.txt | 1 +
 arch/arm/mach-exynos/suspend.c                     | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/arm/Samsung/Bootloader-interface.txt b/Documentation/arm/Samsung/Bootloader-interface.txt
index ed494ac0beb2..d17ed518a7ea 100644
--- a/Documentation/arm/Samsung/Bootloader-interface.txt
+++ b/Documentation/arm/Samsung/Bootloader-interface.txt
@@ -26,6 +26,7 @@ Offset        Value                                        Purpose
 0x20          0xfcba0d10 (Magic cookie)                    AFTR
 0x24          exynos_cpu_resume_ns                         AFTR
 0x28 + 4*cpu  0x8 (Magic cookie, Exynos3250)               AFTR
+0x28          0x0 or last value during resume (Exynos542x) System suspend
 
 
 2. Secure mode
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index d3db306a5a70..0ec52f442b97 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -256,7 +256,7 @@ static int exynos5420_cpu_suspend(unsigned long arg)
 	unsigned int cluster = MPIDR_AFFINITY_LEVEL(mpidr, 1);
 	unsigned int cpu = MPIDR_AFFINITY_LEVEL(mpidr, 0);
 
-	writel_relaxed(0x0, sysram_base_addr + EXYNOS5420_CPU_STATE);
+	writel_relaxed(0x0, sysram_ns_base_addr + EXYNOS5420_CPU_STATE);
 
 	if (IS_ENABLED(CONFIG_EXYNOS5420_MCPM)) {
 		mcpm_set_entry_vector(cpu, cluster, exynos_cpu_resume);
@@ -328,7 +328,7 @@ static void exynos5420_pm_prepare(void)
 	 * needs to restore it back in case, the primary cpu fails to
 	 * suspend for any reason.
 	 */
-	exynos5420_cpu_state = readl_relaxed(sysram_base_addr +
+	exynos5420_cpu_state = readl_relaxed(sysram_ns_base_addr +
 					     EXYNOS5420_CPU_STATE);
 
 	exynos_pm_enter_sleep_mode();
@@ -448,7 +448,7 @@ static void exynos5420_pm_resume(void)
 
 	/* Restore the sysram cpu state register */
 	writel_relaxed(exynos5420_cpu_state,
-		       sysram_base_addr + EXYNOS5420_CPU_STATE);
+		       sysram_ns_base_addr + EXYNOS5420_CPU_STATE);
 
 	pmu_raw_writel(EXYNOS5420_USE_STANDBY_WFI_ALL,
 			S5P_CENTRAL_SEQ_OPTION);
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
