Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0FAAA7E6B7
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 11:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755996AbeCWLAz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 07:00:55 -0400
Received: from mail.bootlin.com ([62.4.15.54]:43960 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755966AbeCWLAp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Mar 2018 07:00:45 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 30934208A6; Fri, 23 Mar 2018 12:00:40 +0100 (CET)
Received: from localhost.localdomain (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr [90.63.216.87])
        by mail.bootlin.com (Postfix) with ESMTPSA id 55F12208A9;
        Fri, 23 Mar 2018 12:00:29 +0100 (CET)
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        linux-gpio@vger.kernel.org,
        Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH v3 11/11] dt-bindings: gpio: Add bindings for Cadence I3C gpio expander
Date:   Fri, 23 Mar 2018 12:00:20 +0100
Message-Id: <20180323110020.19080-12-boris.brezillon@bootlin.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180323110020.19080-1-boris.brezillon@bootlin.com>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the Cadence I3C gpio expander bindings.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 .../devicetree/bindings/gpio/gpio-cdns-i3c.txt     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt b/Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt
new file mode 100644
index 000000000000..634b1f268215
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt
@@ -0,0 +1,38 @@
+* Cadence I3C GPIO expander
+
+The Cadence I3C GPIO expander provides 8 GPIOs controllable over I3C.
+This GPIOs can be configured in output or input mode and if they are in input
+mode they can generate IBIs (In Band Interrupts).
+
+Required properties for GPIO node:
+- reg : 3 cells encoding the I3C static address (none in our case) and the I3C
+	Provisional ID. See Documentation/devicetree/bindings/i3c/i3c.txt for
+	more details.
+	Should be <0x0 0x392 0x0>.
+- gpio-controller : Marks the device node as a gpio controller.
+- #gpio-cells : Should be two. The first cell is the pin number and
+  the second cell is used to specify the gpio polarity:
+      0 = active high
+      1 = active low
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells : Should be 2.  The first cell is the GPIO number.
+  The second cell bits[3:0] is used to specify trigger type and level flags:
+      1 = low-to-high edge triggered.
+      2 = high-to-low edge triggered.
+      3 = triggered on both edges.
+      4 = active high level-sensitive.
+      8 = active low level-sensitive.
+
+Example:
+
+	i3c-master@xxx {
+		...
+		i3c_gpio_expander: gpio@0,1c9,0 {
+			reg = <0 0x392 0x0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+		...
+	};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
