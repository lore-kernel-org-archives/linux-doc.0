Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E52F57D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Jul 2019 17:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfGXR1y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Jul 2019 13:27:54 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:51996 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfGXR1x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jul 2019 13:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563988658; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BjCs03RgyL58fApfd5l7g+XTdviV2rlk+1oKzHn4OQY=;
        b=hbQH6Sp0nenqEgvgUEZNod3LWjqpLxBEKr2asH/MDxWfDn87Sqp79548njrUFhcGleL1Me
        VngAn19XYduheQ55FcxHwrx5TQtcwZjAXoORKz2RRf0JaepkbpTg6mQXlNUScoP71av3zq
        zER53S/Q0ZaEftgbISx8GGtbs4kk9vI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me,
        Mathieu Malaterre <malat@debian.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v15 10/13] MIPS: qi_lb60: Reduce system timer and clocksource to 750 kHz
Date:   Wed, 24 Jul 2019 13:16:12 -0400
Message-Id: <20190724171615.20774-11-paul@crapouillou.net>
In-Reply-To: <20190724171615.20774-1-paul@crapouillou.net>
References: <20190724171615.20774-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The default clock (12 MHz) is too fast for the system timer, which fails
to report time accurately.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v5: New patch
    
    v6: Remove ingenic,clocksource-channel property
    
    v7-v15: No change

 arch/mips/boot/dts/ingenic/qi_lb60.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
index cc26650562c2..933d98ca8d93 100644
--- a/arch/mips/boot/dts/ingenic/qi_lb60.dts
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include "jz4740.dtsi"
+#include <dt-bindings/clock/ingenic,tcu.h>
 #include <dt-bindings/gpio/gpio.h>
 
 / {
@@ -64,3 +65,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_mmc>;
 };
+
+&tcu {
+	/* 750 kHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
+	assigned-clock-rates = <750000>, <750000>;
+};
-- 
2.21.0.593.g511ec345e18

