Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 379A77E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 12:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750776AbeDBM4c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 08:56:32 -0400
Received: from mout01.posteo.de ([185.67.36.65]:56872 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750798AbeDBM4a (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Apr 2018 08:56:30 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 1C3D6211A6
        for <linux-doc@vger.kernel.org>; Mon,  2 Apr 2018 14:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1522673787; bh=3/8mz5kSn2pomTdRhyMuw0OE2swrnP4TjxaKhxTybDo=;
        h=From:To:Cc:Subject:Date:From;
        b=h+BrfPCJK+T8DrRiOUDKWayyOF4wc6VViJwyP2Q+7P8P7g2Y8sis+olsg2szNaFr6
         KczCjXoOVsfWUyf2yJHxe4j1dyqXVEo0DDgZt9xqtCFSQeaA5caWFAjaHdioVTJhH3
         +s90Dd0X8oJ+E5dz4KdINbNritb3NKCoZ50QhLpbrqkTRedygLNf+H6WbCY+DJlkH4
         H9sa5liva9D6NCbHSDoJgVVnFduQoJPEYn0WpJXagHRsYilNjBog20Ln4VTw1gjYPu
         NWabCN+gwUCWrnvT8lgOw7Rq42CBhQ+uiuGqV5FWTLyDyKmcIQqzFM59dm74aOU7Kn
         l6DfPupG3pJDA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 40FC074SKQz9rxM;
        Mon,  2 Apr 2018 14:56:23 +0200 (CEST)
From:   Martin Kepplinger <martink@posteo.de>
To:     corbet@lwn.net, dmitry.torokhov@gmail.com
Cc:     gregkh@linuxfoundation.org, logang@deltatee.com,
        stefanha@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH 1/2] Input: mk712: update documentation web link
Date:   Mon,  2 Apr 2018 14:55:50 +0200
Message-Id: <20180402125551.13641-1-martink@posteo.de>
X-Mailer: git-send-email 2.16.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

At the mentioned address there's nothing found. By searching information
on the controller chip still can be found, so update the link to the
resulting page.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 drivers/input/touchscreen/mk712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/mk712.c b/drivers/input/touchscreen/mk712.c
index bd5352824f77..c179060525ae 100644
--- a/drivers/input/touchscreen/mk712.c
+++ b/drivers/input/touchscreen/mk712.c
@@ -17,7 +17,7 @@
  * found in Gateway AOL Connected Touchpad computers.
  *
  * Documentation for ICS MK712 can be found at:
- *	http://www.idt.com/products/getDoc.cfm?docID=18713923
+ *	https://www.idt.com/general-parts/mk712-touch-screen-controller
  */
 
 /*
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
