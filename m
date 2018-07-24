Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A3BC97DE7F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Jul 2018 16:51:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388836AbeGXR5u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Jul 2018 13:57:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:41130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388414AbeGXR5u (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Jul 2018 13:57:50 -0400
Received: from localhost.localdomain (xdsl-188-155-58-14.adslplus.ch [188.155.58.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EA7720883;
        Tue, 24 Jul 2018 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1532451029;
        bh=12umIieZcuTxguc4cgZt2eNAjuSBXV7eA2Lj+nsGSgE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=of1YjaVGaO5Z4lnHWB+B95pHHnH8QIqonga6XGXzkZ+YwYCQVtHmpoyITdei7iFFc
         OmWUTR+RpzBgaVWUcuGx/4McF714uW5MpPIHPXzuWJQlEIoALvTP3WMK8cRlY9Xizn
         mJaBzgeLeUi7Jxd3BG7DAUJ9Hfza67BHQN/IoOz4=
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
Subject: [PATCH v2 3/4] ARM: exynos: Clear global variable on init error path
Date:   Tue, 24 Jul 2018 18:49:45 +0200
Message-Id: <20180724164946.6274-3-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180724164946.6274-1-krzk@kernel.org>
References: <20180724164946.6274-1-krzk@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For most of Exynos SoCs, Power Management Unit (PMU) address space is
mapped into global variable 'pmu_base_addr' very early when initializing
PMU interrupt controller.  A lot of other machine code depends on it so
when doing iounmap() on this address, clear the global as well to avoid
usage of invalid value (pointing to unmapped memory region).

Properly mapped PMU address space is a requirement for all other machine
code so this fix is purely theoretical.  Boot will fail immediately in
many other places after following this error path.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
New patch.
---
 arch/arm/mach-exynos/suspend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 5d4822e5d0ba..d42ef1be2c70 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -207,6 +207,7 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
 					  NULL);
 	if (!domain) {
 		iounmap(pmu_base_addr);
+		pmu_base_addr = NULL;
 		return -ENOMEM;
 	}
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
