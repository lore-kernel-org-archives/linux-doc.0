Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AF4C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 07:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC02222581
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 07:15:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbhAYHO6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jan 2021 02:14:58 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:57670 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727149AbhAYHMm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 25 Jan 2021 02:12:42 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 4A238440205;
        Mon, 25 Jan 2021 09:11:48 +0200 (IST)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Baruch Siach <baruch@tkos.co.il>, Rob Herring <robh@kernel.org>
Subject: [PATCH] Documentation: ARM: fix reference to DT format documentation
Date:   Mon, 25 Jan 2021 09:10:30 +0200
Message-Id: <7f07e544d9fc584242d496c2f54f9303d8de0724.1611558630.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The booting-without-of.rst file is no longer there. Link to
devicetree.org instead.

Fixes: 441848282c590 ("dt: Remove booting-without-of.rst")
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/arm/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm/booting.rst b/Documentation/arm/booting.rst
index a2263451dc2c..5974e37b3d20 100644
--- a/Documentation/arm/booting.rst
+++ b/Documentation/arm/booting.rst
@@ -128,7 +128,7 @@ it.  The recommended placement is in the first 16KiB of RAM.
 
 The boot loader must load a device tree image (dtb) into system ram
 at a 64bit aligned address and initialize it with the boot data.  The
-dtb format is documented in Documentation/devicetree/booting-without-of.rst.
+dtb format is documented at https://www.devicetree.org/specifications/.
 The kernel will look for the dtb magic value of 0xd00dfeed at the dtb
 physical address to determine if a dtb has been passed instead of a
 tagged list.
-- 
2.29.2

