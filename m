Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D66CE7D09E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 01:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752739AbeF1B40 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Jun 2018 21:56:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:44474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752691AbeF1B4Z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 27 Jun 2018 21:56:25 -0400
Received: from localhost.localdomain (user-0ccsrjt.cable.mindspring.com [24.206.110.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 91286258CB;
        Thu, 28 Jun 2018 01:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1530150985;
        bh=XjqoDzxio8MYil7DBB1uflCzxslxiKI9qlqcc7G3Wcs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IrRI9MopF5Tjkbd5sKue85wz5SljJC4ZGGCRvu+rPUxFXzQwcyn4k/HZCpBzO9DyU
         sDSnrUSwMXC3dekmxKUJETZ3uJ5LPJm6VV4k6RHsCE4lG0UpznuJ98h4/mmYzrpUHi
         LCBkoyUldLxzScPvRc0hhLg8pa512eqkUfPkps4c=
From:   Alan Tull <atull@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Moritz Fischer <mdf@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fpga@vger.kernel.org, Alan Tull <atull@kernel.org>,
        Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] fpga: altera-cvp: Fix an error handling path in 'altera_cvp_probe()'
Date:   Wed, 27 Jun 2018 20:56:18 -0500
Message-Id: <1530150979-5693-2-git-send-email-atull@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530150979-5693-1-git-send-email-atull@kernel.org>
References: <1530150979-5693-1-git-send-email-atull@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

If 'fpga_mgr_create()' fails, we should release some resources, as done
in the other error handling path of the function.

Fixes: 7085e2a94f7d ("fpga: manager: change api, don't use drvdata")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Moritz Fischer <mdf@kernel.org>
Acked-by: Alan Tull <atull@kernel.org>
---
 drivers/fpga/altera-cvp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/altera-cvp.c b/drivers/fpga/altera-cvp.c
index dd4edd8..7fa7936 100644
--- a/drivers/fpga/altera-cvp.c
+++ b/drivers/fpga/altera-cvp.c
@@ -455,8 +455,10 @@ static int altera_cvp_probe(struct pci_dev *pdev,
 
 	mgr = fpga_mgr_create(&pdev->dev, conf->mgr_name,
 			      &altera_cvp_ops, conf);
-	if (!mgr)
-		return -ENOMEM;
+	if (!mgr) {
+		ret = -ENOMEM;
+		goto err_unmap;
+	}
 
 	pci_set_drvdata(pdev, mgr);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
