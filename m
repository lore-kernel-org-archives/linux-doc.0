Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EB7417DE7E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 15:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbeIEUM7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 16:12:59 -0400
Received: from mail.bootlin.com ([62.4.15.54]:54539 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbeIEUMC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Sep 2018 16:12:02 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id C75062079D; Wed,  5 Sep 2018 17:41:16 +0200 (CEST)
Received: from localhost.localdomain (AAubervilliers-681-1-92-107.w90-88.abo.wanadoo.fr [90.88.33.107])
        by mail.bootlin.com (Postfix) with ESMTPSA id 228712071E;
        Wed,  5 Sep 2018 17:41:16 +0200 (CEST)
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
        linux-gpio@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
        Przemyslaw Gaj <pgaj@cadence.com>,
        Peter Rosin <peda@axentia.se>,
        Mike Shettel <mshettel@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH v7 05/10] dt-bindings: i3c: Add macros to help fill I3C/I2C device's reg property
Date:   Wed,  5 Sep 2018 17:41:03 +0200
Message-Id: <20180905154108.20770-6-boris.brezillon@bootlin.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180905154108.20770-1-boris.brezillon@bootlin.com>
References: <20180905154108.20770-1-boris.brezillon@bootlin.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The reg property of devices connected to an I3C bus have 3 cells, and
filling them manually is not trivial. Provides macros to help doing
that.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v5:
- none
---
 include/dt-bindings/i3c/i3c.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/i3c/i3c.h

diff --git a/include/dt-bindings/i3c/i3c.h b/include/dt-bindings/i3c/i3c.h
new file mode 100644
index 000000000000..97448c546649
--- /dev/null
+++ b/include/dt-bindings/i3c/i3c.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2017 Cadence Design Systems Inc.
+ *
+ * Author: Boris Brezillon <boris.brezillon@bootlin.com>
+ */
+
+#ifndef _DT_BINDINGS_I3C_I3C_H
+#define _DT_BINDINGS_I3C_I3C_H
+
+#define IS_I2C_DEV		0x80000000
+
+#define I2C_DEV(addr, lvr)					\
+	(addr) (IS_I2C_DEV | (lvr)) 0x0
+
+#define I3C_PID(manufid, partid, instid, extrainfo)		\
+	((manufid) << 1)					\
+	(((partid) << 16) | ((instid) << 12) | (extrainfo))
+
+#define I3C_DEV_WITH_STATIC_ADDR(addr, manufid, partid,		\
+				 instid, extrainfo)		\
+	(addr) I3C_PID(manufid, partid, instid, extrainfo)
+
+#define I3C_DEV(manufid, partid, instid, extrainfo)		\
+	I3C_DEV_WITH_STATIC_ADDR(0x0, manufid, partid,		\
+				 instid, extrainfo)
+
+#endif
-- 
2.14.1

