Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C0EC57DE6E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 Aug 2018 19:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730223AbeHNWEd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 Aug 2018 18:04:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727755AbeHNWEP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Aug 2018 18:04:15 -0400
Received: from localhost.localdomain (unknown [192.55.54.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA5352173C;
        Tue, 14 Aug 2018 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1534274137;
        bh=gBzOo3ogiY/r/7JY6KAxiPceAodQw57DHJ7nma32vlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ELDHvOLJ2CCD2YLZmpq2WBOZKHwUkuBjW1D5adMKrF2a4bAv1do4UMWeNCaQqRe03
         cCmziUJFb9BcZX5q1vetIaMCwRlFNdhgxvAMukOIkbdLz/+C8z11fpG6cfOA8yep99
         g8nK5zw0XS05IuiQOJn908z/yGH1T2qOVd0wyVAE=
From:   Alan Tull <atull@kernel.org>
To:     Moritz Fischer <mdf@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Tull <atull@kernel.org>
Subject: [PATCH 6/8] fpga: bridge: fix obvious function documentation error
Date:   Tue, 14 Aug 2018 14:15:24 -0500
Message-Id: <20180814191526.3247-7-atull@kernel.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180814191526.3247-1-atull@kernel.org>
References: <20180814191526.3247-1-atull@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

fpga_bridge_dev_match() returns a FPGA bridge struct, not a
FPGA manager struct so s/manager/bridge/.

Signed-off-by: Alan Tull <atull@kernel.org>
---
 drivers/fpga/fpga-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
index c39d35f..7b0071a 100644
--- a/drivers/fpga/fpga-bridge.c
+++ b/drivers/fpga/fpga-bridge.c
@@ -125,7 +125,7 @@ static int fpga_bridge_dev_match(struct device *dev, const void *data)
  *
  * Given a device, get an exclusive reference to a fpga bridge.
  *
- * Return: fpga manager struct or IS_ERR() condition containing error code.
+ * Return: fpga bridge struct or IS_ERR() condition containing error code.
  */
 struct fpga_bridge *fpga_bridge_get(struct device *dev,
 				    struct fpga_image_info *info)
-- 
2.7.4

