Return-Path: <SRS0=H0Zm=CE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C92BC433E1
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B6C6206EB
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598438900;
	bh=sA+LLjFnYe1xhNIVyej80xZ8cWbaGG48uMqipjGVTpU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=Nv3A/SBNlNhEKLKdG9w/iQpyqs6ARFVqzq+TM8E53zx1HOomipucEFtN6j3MLleQY
	 lKGP50ZNXlCi6+0hXX5rVXz81aBPjrFINhdCOwseGJretQACmidgw6M10vaUUidQiK
	 HLCBSiZGqpOB+llJbeqNwsnQ2j5M1deYSaB7+Cog=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgHZKsT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Aug 2020 06:48:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:35994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728662AbgHZKrk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:47:40 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0127C206EB;
        Wed, 26 Aug 2020 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598438860;
        bh=sA+LLjFnYe1xhNIVyej80xZ8cWbaGG48uMqipjGVTpU=;
        h=From:To:Cc:Subject:Date:From;
        b=drWgVtUjlEW193ffUizq1GNP3tFx9uVKivX3rGSl6VWuI78HtADFWYXo98v02hF4q
         1JC4JutOnopRaXGjcqMnsQD6WfYnq2nGhDuo6lOEQD+p+0Ty/US+ctdZw78f4SVqZ8
         raQ7+JhnCdtupkqYDssg+YxisODHD3YbIX3h9Ky4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAsxt-002EMx-VS; Wed, 26 Aug 2020 12:47:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] drivers: net: hamradio: fix document location
Date:   Wed, 26 Aug 2020 12:47:37 +0200
Message-Id: <20200826104737.531851-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The hamradio docs were moved to a different dir.
Update its location accordingly.

Fixes: 14474950252c ("docs: networking: move z8530 to the hw driver section")

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/net/hamradio/scc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/scc.c b/drivers/net/hamradio/scc.c
index 1e915871baa7..36eeb80406f2 100644
--- a/drivers/net/hamradio/scc.c
+++ b/drivers/net/hamradio/scc.c
@@ -7,7 +7,7 @@
  *            ------------------
  *
  * You can find a subset of the documentation in 
- * Documentation/networking/device_drivers/wan/z8530drv.rst.
+ * Documentation/networking/device_drivers/hamradio/z8530drv.rst.
  */
 
 /*
-- 
2.26.2

