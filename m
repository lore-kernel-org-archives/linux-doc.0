Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 350057E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 12:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750724AbeDBM4a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 08:56:30 -0400
Received: from mout01.posteo.de ([185.67.36.65]:38521 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750776AbeDBM43 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Apr 2018 08:56:29 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id AF22520F93
        for <linux-doc@vger.kernel.org>; Mon,  2 Apr 2018 14:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1522673786; bh=/B/+fTxoFuNAiZGVcl6HhXtOHBdR70kmroo2wsQOec0=;
        h=From:To:Cc:Subject:Date:From;
        b=Vmlj+kHLeEe3DlNlJfSIvyUtsoerDdK88hZ9ORCCSo4wP6+sPsPlJ+rIvafibG/9n
         2Q5EytPFMrs3032wE08nX/jDA1YOrEc8WuOsKjyWObVesHcKV22KjLH5Nyahm9MN69
         5tFmi/kgB3V4VlqoOxSVrATch0n9KXmmJ8ICL//ou4ib3CbpakhXxfbsGzd2dbNySf
         qeNOO3UcgzQ/7IDPiNNGhw9x67MKcRs2NaG/ZwtDRfiaEpS9fHLNPyMAQ/Hs25PR1h
         gBZRfBdcXMASoPaUajPnK2KlHvppKq7vm0fsBLDYMHq3WEkD5HudXlZ+kST+JDpvOG
         qkWvEH/Gv+uow==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 40FC0B16Lsz9rxR;
        Mon,  2 Apr 2018 14:56:26 +0200 (CEST)
From:   Martin Kepplinger <martink@posteo.de>
To:     corbet@lwn.net, dmitry.torokhov@gmail.com
Cc:     gregkh@linuxfoundation.org, logang@deltatee.com,
        stefanha@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH 2/2] Documentation: devices.txt: remove the mk712 touchscreen device from the list
Date:   Mon,  2 Apr 2018 14:55:51 +0200
Message-Id: <20180402125551.13641-2-martink@posteo.de>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180402125551.13641-1-martink@posteo.de>
References: <20180402125551.13641-1-martink@posteo.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The input/touchscreen/mk712.c driver has been rewritten for the common
input event system. in 2005. There shouldn't a special device node be
created anymore.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

Please review this by looking at the driver too. Thanks,

                    martin



 Documentation/admin-guide/devices.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 4ec843123cc3..fb39bbf0789a 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -259,7 +259,6 @@
 		 11 = /dev/vrtpanel	Vr41xx embedded touch panel
 		 13 = /dev/vpcmouse	Connectix Virtual PC Mouse
 		 14 = /dev/touchscreen/ucb1x00  UCB 1x00 touchscreen
-		 15 = /dev/touchscreen/mk712	MK712 touchscreen
 		128 = /dev/beep		Fancy beep device
 		129 =
 		130 = /dev/watchdog	Watchdog timer port
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
