Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 381197D923
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Sep 2018 22:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbeIGDQh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Sep 2018 23:16:37 -0400
Received: from mail.bootlin.com ([62.4.15.54]:45368 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728943AbeIGDQh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Sep 2018 23:16:37 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 17FEF20877; Fri,  7 Sep 2018 00:38:56 +0200 (CEST)
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id 77799207AD;
        Fri,  7 Sep 2018 00:38:55 +0200 (CEST)
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Ryan Mallon <rmallon@gmail.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Alexander Clouter <alex@digriz.org.uk>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Subject: [PATCH 01/19] mtd: rawnand: Leave chip->IO_ADDR_{R,W} to NULL when unused
Date:   Fri,  7 Sep 2018 00:38:33 +0200
Message-Id: <20180906223851.6964-2-boris.brezillon@bootlin.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180906223851.6964-1-boris.brezillon@bootlin.com>
References: <20180906223851.6964-1-boris.brezillon@bootlin.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There's no point in poisoning the ->IO_ADDR_{R,W}, a NULL pointer
is just as good to detect unexpected ->IO_ADDR_{R,W} usage.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 3 ---
 drivers/mtd/nand/raw/socrates_nand.c     | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index fee40a3ce5d2..851db4a7d3e4 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2270,9 +2270,6 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &pdev->dev;
 
-	chip->IO_ADDR_R = (void __iomem *)0xdeadbeef;
-	chip->IO_ADDR_W = (void __iomem *)0xdeadbeef;
-
 	chip->cmd_ctrl = brcmnand_cmd_ctrl;
 	chip->cmdfunc = brcmnand_cmdfunc;
 	chip->waitfunc = brcmnand_waitfunc;
diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 64ea9a014054..aa42b4ea4d23 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -152,10 +152,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd->name = "socrates_nand";
 	mtd->dev.parent = &ofdev->dev;
 
-	/*should never be accessed directly */
-	nand_chip->IO_ADDR_R = (void *)0xdeadbeef;
-	nand_chip->IO_ADDR_W = (void *)0xdeadbeef;
-
 	nand_chip->cmd_ctrl = socrates_nand_cmd_ctrl;
 	nand_chip->read_byte = socrates_nand_read_byte;
 	nand_chip->write_buf = socrates_nand_write_buf;
-- 
2.14.1

