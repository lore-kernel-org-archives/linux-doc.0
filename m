Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DDE8A7D9ED
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Oct 2018 14:48:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbeJZXYw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Oct 2018 19:24:52 -0400
Received: from mail.bootlin.com ([62.4.15.54]:46249 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbeJZXVB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Oct 2018 19:21:01 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 53C3220970; Fri, 26 Oct 2018 16:43:39 +0200 (CEST)
Received: from localhost.localdomain (aaubervilliers-681-1-12-210.w90-88.abo.wanadoo.fr [90.88.133.210])
        by mail.bootlin.com (Postfix) with ESMTPSA id 963C8208CE;
        Fri, 26 Oct 2018 16:43:38 +0200 (CEST)
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
Subject: [PATCH v10 5/9] MAINTAINERS: Add myself as the I3C subsystem maintainer
Date:   Fri, 26 Oct 2018 16:43:29 +0200
Message-Id: <20181026144333.12276-6-boris.brezillon@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181026144333.12276-1-boris.brezillon@bootlin.com>
References: <20181026144333.12276-1-boris.brezillon@bootlin.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Create an entry for the I3C subsystem and mark it as maintained by me.
There's no official git repository, patchwork instance, mailing list or
website yet, but this will be added after the subsystem has been
accepted.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v10:
- None

Changes in v9:
- None

Changes in v8:
- None

Changes in v7:
- Add a ML (not created yet) and a git repo

Changes in v5:
- Add the sysfs ABI file
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a5b256b25905..293c863b6f9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,18 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/i2c-stub.c
 
+I3C SUBSYSTEM
+M:	Boris Brezillon <boris.brezillon@bootlin.com>
+L:	linux-i3c@vger.kernel.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-i3c
+F:	Documentation/devicetree/bindings/i3c/
+F:	Documentation/driver-api/i3c
+F:	drivers/i3c/
+F:	include/linux/i3c/
+F:	include/dt-bindings/i3c/
+
 IA64 (Itanium) PLATFORM
 M:	Tony Luck <tony.luck@intel.com>
 M:	Fenghua Yu <fenghua.yu@intel.com>
-- 
2.17.1

