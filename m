Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9DA5C7E0C1
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 17:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbeHUUjm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 16:39:42 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:38980 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbeHUUjm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 16:39:42 -0400
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
Subject: [PATCH v7 21/24] MIPS: qi_lb60: Reduce system timer and clocksource to 750 kHz
Date:   Tue, 21 Aug 2018 19:18:34 +0200
Message-Id: <20180821171834.22995-1-paul@crapouillou.net>
In-Reply-To: <20180821171635.22740-1-paul@crapouillou.net>
References: <20180821171635.22740-1-paul@crapouillou.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net; s=mail; t=1534871919; bh=l7GCE4NGarN8V5qbHWr7E7L8pP76QhZujNSFQmSIfIM=; h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=K862FE2Y6PmbSNZ/1r/qTyn2iV9oiLDN2TOjvVjj/iZa3lSVZF18xTzCpf0j8WI4Zge8aBmyOjNwW8P6QWp8jOgik77j+B0f6ssIkGX4xVaVe7629tG3PMNDIdwnWd0mQh+wWP27iWv8kf8Hs0bkxg0WqjiqgY+036AhC+5liiU=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The default clock (12 MHz) is too fast for the system timer, which fails
to report time accurately.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
     v5: New patch
    
     v6: Remove ingenic,clocksource-channel property
    
     v7: No change

 arch/mips/boot/dts/ingenic/qi_lb60.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
index 85529a142409..de9d45e2c24a 100644
--- a/arch/mips/boot/dts/ingenic/qi_lb60.dts
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -45,3 +45,9 @@
 		bias-disable;
 	};
 };
+
+&tcu {
+	/* 750 kHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
+	assigned-clock-rates = <750000>, <750000>;
+};
-- 
2.11.0

