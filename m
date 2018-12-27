Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5CC6E7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Dec 2018 18:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbeL0SOF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Dec 2018 13:14:05 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:54294 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbeL0SOE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Dec 2018 13:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1545934439; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=yFq9PATHo+DDPckUfNumupkmaX3d3PAQeKsmpJweYF8=;
        b=HrfmVMfgl36GGP1ccpGslqVkkt4mzYQv9+JcDdRLfH6jj/o91c02TSbonmk9lvQofm3ngA
        MdqziwrdWO6cPfWx0zD2XIcYHg3pP/jlUqFzm9lfH5xDCrzW3Jo9Xc1AhHhHkYmSfLvbZQ
        aKBQt6mcuk64Zx4XwwuVXhkVsxbuJEI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v9 16/27] pwm: jz4740: Drop dependency on MACH_INGENIC, use COMPILE_TEST
Date:   Thu, 27 Dec 2018 19:13:08 +0100
Message-Id: <20181227181319.31095-17-paul@crapouillou.net>
In-Reply-To: <20181227181319.31095-1-paul@crapouillou.net>
References: <20181227181319.31095-1-paul@crapouillou.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Depending on MACH_INGENIC prevent us from creating a generic kernel that
works on more than one MIPS board. Instead, we just depend on MIPS being
set.

On other architectures, this driver can still be built, thanks to
COMPILE_TEST. This is used by automated tools to find bugs, for
instance.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Thierry Reding <thierry.reding@gmail.com>
---

Notes:
     v5: New patch
    
     v6: No change
    
     v7: No change

     v8: No change

     v9: No change

 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 0343f0c1238e..d6f62d9cdc18 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -201,7 +201,7 @@ config PWM_IMX
 
 config PWM_JZ4740
 	tristate "Ingenic JZ47xx PWM support"
-	depends on MACH_INGENIC
+	depends on MIPS || COMPILE_TEST
 	depends on COMMON_CLK
 	select INGENIC_TIMER
 	help
-- 
2.11.0

