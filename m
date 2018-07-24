Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF5877D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Jul 2018 16:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388814AbeGXR5q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Jul 2018 13:57:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388414AbeGXR5p (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Jul 2018 13:57:45 -0400
Received: from localhost.localdomain (xdsl-188-155-58-14.adslplus.ch [188.155.58.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94B60208AD;
        Tue, 24 Jul 2018 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1532451024;
        bh=L/nRWfDZEhmyV7bMUeD4k/HdF1h9LbqVc2GCf9kFGOs=;
        h=From:To:Subject:Date:From;
        b=ERwnnWf2I7SeCtCw9iV/KO9rUZmzlC3lfRU69PtQcAeZpcNi81QswyYCNb9lesEav
         KKtdRfgG3A3PiEtOeRiiBFC9o4c+kZIEvJp+4wwHscIdP0thGIr71C/1l0Ws8f0ZsB
         194adtWrjbdarl8yn7o2mKJS4FJHp3YMlkqjbgfI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] ARM: exynos: Remove outdated maintainer information
Date:   Tue, 24 Jul 2018 18:49:43 +0200
Message-Id: <20180724164946.6274-1-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current maintainers are specified in MAINTAINERS file, so remove
in-sources information with outdated e-mail address (Thomas Abraham's
email does not work, Kukjin Kim uses @kernel.org).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
New patch.
---
 arch/arm/mach-exynos/exynos.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index f4b6c93a7fd0..865dcc4c3181 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -190,8 +190,6 @@ static void __init exynos_dt_fixup(void)
 }
 
 DT_MACHINE_START(EXYNOS_DT, "SAMSUNG EXYNOS (Flattened Device Tree)")
-	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
-	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
 	.l2c_aux_val	= 0x3c400001,
 	.l2c_aux_mask	= 0xc20fffff,
 	.smp		= smp_ops(exynos_smp_ops),
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
