Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EB7C4742C
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 12:50:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F9FC2224B
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 12:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgKMMuT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 07:50:19 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:37402 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgKMMuS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 07:50:18 -0500
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id DC56B3B0EC4
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 12:38:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id A28A1100002;
        Fri, 13 Nov 2020 12:38:32 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] docs: mtd: Avoid htmldocs warnings
Date:   Fri, 13 Nov 2020 13:38:31 +0100
Message-Id: <20201113123831.32429-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Moving files around produced the following warnings:

       Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c
       Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c

Fix one by just dropping the reference because it is not relevant, the
other by using a better noun instead of a file name.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/driver-api/mtd/nand_ecc.rst | 2 +-
 Documentation/driver-api/mtdnand.rst      | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/driver-api/mtd/nand_ecc.rst b/Documentation/driver-api/mtd/nand_ecc.rst
index e8d3c53a5056..74347c14a70b 100644
--- a/Documentation/driver-api/mtd/nand_ecc.rst
+++ b/Documentation/driver-api/mtd/nand_ecc.rst
@@ -5,7 +5,7 @@ NAND Error-correction Code
 Introduction
 ============
 
-Having looked at the linux mtd/nand driver and more specific at nand_ecc.c
+Having looked at the linux mtd/nand Hamming software ECC engine driver
 I felt there was room for optimisation. I bashed the code for a few hours
 performing tricks like table lookup removing superfluous code etc.
 After that the speed was increased by 35-40%.
diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/driver-api/mtdnand.rst
index 0bf8d6ec3f54..ce77e024c4f1 100644
--- a/Documentation/driver-api/mtdnand.rst
+++ b/Documentation/driver-api/mtdnand.rst
@@ -972,9 +972,6 @@ hints" for an explanation.
 .. kernel-doc:: drivers/mtd/nand/raw/nand_base.c
    :export:
 
-.. kernel-doc:: drivers/mtd/nand/raw/nand_ecc.c
-   :export:
-
 Internal Functions Provided
 ===========================
 
-- 
2.20.1

