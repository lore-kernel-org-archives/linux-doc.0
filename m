Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1540A7D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Jul 2018 23:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388461AbeGYAgg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Jul 2018 20:36:36 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56350 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388446AbeGYAgg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jul 2018 20:36:36 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-mips@linux-mips.org,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 18/21] MIPS: qi_lb60: Use 750 kHz system timer & enable clocksource
Date:   Wed, 25 Jul 2018 01:19:55 +0200
Message-Id: <20180724231958.20659-19-paul@crapouillou.net>
In-Reply-To: <20180724231958.20659-1-paul@crapouillou.net>
References: <20180724231958.20659-1-paul@crapouillou.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net; s=mail; t=1532474441; bh=EEz/GKrnXn4JAhjCV6BzW7toYuI/mDnN4ODmk32Ka2E=; h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=fi1Po8wHmOTIeGX+Tqd1B7A0nnS6+UomKjN92RBfVKGYQRuSgj4BbDjdTZhwYqMpM2G6ZkcgKlL9Ys4q+m6FMg1rcNNHQ6aEZNCVCwYAHwfzcMV5Q2nPmYneG5UJevldFzvh5Sz19fVX3AP8kOlH35iyhExcw3VO5dVO9nRrZzQ=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The default clock (12 MHz) is too fast for the system timer, which fails
to report time accurately.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/qi_lb60.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

 v5: New patch

diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
index 85529a142409..5d2aca867427 100644
--- a/arch/mips/boot/dts/ingenic/qi_lb60.dts
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -45,3 +45,12 @@
 		bias-disable;
 	};
 };
+
+&tcu {
+	/* Use TCU1 channel as clocksource */
+	ingenic,clocksource-channel = <1>;
+
+	/* 750 kHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
+	assigned-clock-rates = <750000>, <750000>;
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
