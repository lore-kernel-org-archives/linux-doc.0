Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 073D27D926
	for <lwn-linux-doc@archive.lwn.net>; Thu,  9 Aug 2018 21:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbeHJAOw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 9 Aug 2018 20:14:52 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:43048 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727321AbeHJAOw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Aug 2018 20:14:52 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Mathieu Malaterre <malat@debian.org>,
        Ezequiel Garcia <ezequiel@collabora.co.uk>
Cc:     linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@linux-mips.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 23/24] MIPS: CI20: defconfig: enable OST driver
Date:   Thu,  9 Aug 2018 23:47:57 +0200
Message-Id: <20180809214757.21453-1-paul@crapouillou.net>
In-Reply-To: <20180809214414.20905-1-paul@crapouillou.net>
References: <20180809214414.20905-1-paul@crapouillou.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net; s=mail; t=1533851284; bh=tk6M+ua8mb6DhgViyUaRmq2oXaP1I8t84z0lr62+GBI=; h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=am69FDuRruCukwa/sXff5Le9KSibVw2FO5bP0niLaOh4rAAM2CthqTVqwfS+9Usu0eDeWX1L9NfyomLMo7fg/EkZK+RXYDRyZWRX5rTmRmNy1a8EYzUmqC8rTM8U4ArpFbB1HLyfQINgquLORqTPM3Y409OlHtp7X98P1eatS3s=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The OST driver provides a clocksource and sched_clock that are much more
accurate than the default ones.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

 v5: New patch

 v6: No change

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index be23fd25eeaa..e56dc5c024b9 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -109,6 +109,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
+CONFIG_INGENIC_OST=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_MEMORY=y
 CONFIG_EXT4_FS=y
-- 
2.11.0

