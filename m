Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6A85B7D085
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 06:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbeGZICA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 04:02:00 -0400
Received: from mail.iluvatar.ai ([58.213.90.100]:40310 "EHLO mail.iluvatar.ai"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728509AbeGZICA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Jul 2018 04:02:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.iluvatar.ai (Postfix) with ESMTP id 3631713F10AA2;
        Thu, 26 Jul 2018 14:49:55 +0800 (CST)
Received: from mail.iluvatar.ai ([127.0.0.1])
        by localhost (mail.iluvatar.ai [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GlD__Xpd6ZEb; Thu, 26 Jul 2018 14:49:53 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
        by mail.iluvatar.ai (Postfix) with ESMTP id 3019613F10A9A;
        Thu, 26 Jul 2018 14:49:53 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.iluvatar.ai 3019613F10A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iluvatar.ai;
        s=809B2F8E-810B-11E8-86FD-A0A654EEFFEB; t=1532587793;
        bh=D2exeT7BZ05pwWgEQQPRYgG26cRqCBnVhiH72cfH67o=;
        h=From:To:Subject:Date:Message-Id;
        b=RosgOxkcooGQogOIvCq4qnMyKNggAgkrYnBPldXqq0/6CrNn6IJE1+MhTHQ8dLtcu
         k+45RvbePjUw91HZNo+cWNUb8VELdHgekNj01Nof1iyGQ89rHKAZYqaBKTvZIB7uQn
         kbGn8mEoneWnGGfSsR3XTCKKawJFwceUtkfCTuA8=
X-Virus-Scanned: amavisd-new at iluvatar.ai
Received: from mail.iluvatar.ai ([127.0.0.1])
        by localhost (mail.iluvatar.ai [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 2WONsjbwb8sa; Thu, 26 Jul 2018 14:49:53 +0800 (CST)
Received: from localhost.localdomain (unknown [180.166.124.10])
        by mail.iluvatar.ai (Postfix) with ESMTPSA id AE8F113F10A9B;
        Thu, 26 Jul 2018 14:49:52 +0800 (CST)
From:   Huang Shijie <sjhuang@iluvatar.ai>
To:     vkoul@kernel.org
Cc:     corbet@lwn.net, dan.j.williams@intel.com, robh@kernel.org,
        linux-doc@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, ashutosh.dixit@intel.com,
        Huang Shijie <sjhuang@iluvatar.ai>
Subject: [PATCH v2 2/2] dmaengine: mic_x100_dma: use the new helper to simplify the code
Date:   Thu, 26 Jul 2018 14:45:54 +0800
Message-Id: <20180726064554.24975-2-sjhuang@iluvatar.ai>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180726064554.24975-1-sjhuang@iluvatar.ai>
References: <20180726064554.24975-1-sjhuang@iluvatar.ai>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use dmaenginem_async_device_register() to simplify the code:
    remove the mic_dma_unregister_dma_device()

Signed-off-by: Huang Shijie <sjhuang@iluvatar.ai>
---
    Just add a user for the new helper.
---
 drivers/dma/mic_x100_dma.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/dma/mic_x100_dma.c b/drivers/dma/mic_x100_dma.c
index 68dd79783b54..b76cb17d879c 100644
--- a/drivers/dma/mic_x100_dma.c
+++ b/drivers/dma/mic_x100_dma.c
@@ -470,11 +470,6 @@ static void mic_dma_chan_destroy(struct mic_dma_chan *ch)
 	mic_dma_chan_mask_intr(ch);
 }
 
-static void mic_dma_unregister_dma_device(struct mic_dma_device *mic_dma_dev)
-{
-	dma_async_device_unregister(&mic_dma_dev->dma_dev);
-}
-
 static int mic_dma_setup_irq(struct mic_dma_chan *ch)
 {
 	ch->cookie =
@@ -630,7 +625,7 @@ static int mic_dma_register_dma_device(struct mic_dma_device *mic_dma_dev,
 		list_add_tail(&mic_dma_dev->mic_ch[i].api_ch.device_node,
 			      &mic_dma_dev->dma_dev.channels);
 	}
-	return dma_async_device_register(&mic_dma_dev->dma_dev);
+	return dmaenginem_async_device_register(&mic_dma_dev->dma_dev);
 }
 
 /*
@@ -678,7 +673,6 @@ static struct mic_dma_device *mic_dma_dev_reg(struct mbus_device *mbdev,
 
 static void mic_dma_dev_unreg(struct mic_dma_device *mic_dma_dev)
 {
-	mic_dma_unregister_dma_device(mic_dma_dev);
 	mic_dma_uninit(mic_dma_dev);
 	kfree(mic_dma_dev);
 }
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
