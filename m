Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 11C9C7DE7D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 17:18:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbeHUUiQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 16:38:16 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33106 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbeHUUiP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 16:38:15 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     od@zcrc.me, Mathieu Malaterre <malat@debian.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@linux-mips.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v7 15/24] pwm: jz4740: Remove unused devicetree compatible strings
Date:   Tue, 21 Aug 2018 19:16:26 +0200
Message-Id: <20180821171635.22740-16-paul@crapouillou.net>
In-Reply-To: <20180821171635.22740-1-paul@crapouillou.net>
References: <20180821171635.22740-1-paul@crapouillou.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net; s=mail; t=1534871834; bh=5Qi3CDFsvJoYRmKgcyWNjWFvL4eKwfcw1U/GwZYuE9A=; h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SG3GyBZcmutwaKIUU/oiqTG6rD4bbZWqE0i22ul4/1kGfrvUvApGT3LKwc64GZXMKLzsHBndELUEzMQtMR+9WSXaTULsidQ+xoiAepuZJd6DLYOFKRdqDzUaLsb3Ce0oe/T+FlUSNAHZCoVYBJfC6WMWwBVthNkErg5Nfq8r/6c=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Right now none of the Ingenic-based boards probe this driver from
devicetree. This driver defined three compatible strings for the exact
same behaviour. Before these strings are used, we can remove two of
them.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
     v5: New patch
    
     v6: No change
    
     v7: No change

 drivers/pwm/pwm-jz4740.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pwm/pwm-jz4740.c b/drivers/pwm/pwm-jz4740.c
index d08274ec007f..5814825d9bed 100644
--- a/drivers/pwm/pwm-jz4740.c
+++ b/drivers/pwm/pwm-jz4740.c
@@ -235,8 +235,6 @@ static int jz4740_pwm_remove(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id jz4740_pwm_dt_ids[] = {
 	{ .compatible = "ingenic,jz4740-pwm", },
-	{ .compatible = "ingenic,jz4770-pwm", },
-	{ .compatible = "ingenic,jz4780-pwm", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, jz4740_pwm_dt_ids);
-- 
2.11.0

