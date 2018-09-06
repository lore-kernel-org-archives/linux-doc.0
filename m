Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 79CD97DD50
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Sep 2018 22:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbeIGDRK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Sep 2018 23:17:10 -0400
Received: from mail.bootlin.com ([62.4.15.54]:45759 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727693AbeIGDRJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Sep 2018 23:17:09 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id E0D0F20A31; Fri,  7 Sep 2018 00:39:27 +0200 (CEST)
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id CE13920877;
        Fri,  7 Sep 2018 00:39:16 +0200 (CEST)
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
Subject: [PATCH 15/19] mtd: rawnand: Inline onfi_get_async_timing_mode()
Date:   Fri,  7 Sep 2018 00:38:47 +0200
Message-Id: <20180906223851.6964-16-boris.brezillon@bootlin.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180906223851.6964-1-boris.brezillon@bootlin.com>
References: <20180906223851.6964-1-boris.brezillon@bootlin.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

onfi_get_async_timing_mode() is only used in one place inside
nand_base.c. Let's inline the code and kill the helper.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 5 +++--
 include/linux/mtd/rawnand.h      | 9 ---------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 2f8bbc3bca7a..136ccdc61a06 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1310,8 +1310,9 @@ static int nand_init_data_interface(struct nand_chip *chip)
 	 * if the NAND does not support ONFI, fallback to the default ONFI
 	 * timing mode.
 	 */
-	modes = onfi_get_async_timing_mode(chip);
-	if (modes == ONFI_TIMING_MODE_UNKNOWN) {
+	if (chip->parameters.onfi) {
+		modes = chip->parameters.onfi->async_timing_mode;
+	} else {
 		if (!chip->onfi_timing_mode_default)
 			return 0;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 04e11a314e9c..7f0e3dc222ed 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1540,15 +1540,6 @@ int nand_isbad_bbt(struct nand_chip *chip, loff_t offs, int allowbbt);
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
 
-/* return the supported asynchronous timing mode. */
-static inline int onfi_get_async_timing_mode(struct nand_chip *chip)
-{
-	if (!chip->parameters.onfi)
-		return ONFI_TIMING_MODE_UNKNOWN;
-
-	return chip->parameters.onfi->async_timing_mode;
-}
-
 int onfi_fill_data_interface(struct nand_chip *chip,
 			     enum nand_data_interface_type type,
 			     int timing_mode);
-- 
2.14.1

