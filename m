Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E97607D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 11:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfCRLRS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 07:17:18 -0400
Received: from sym2.noone.org ([178.63.92.236]:42930 "EHLO sym2.noone.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbfCRLRS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Mar 2019 07:17:18 -0400
X-Greylist: delayed 497 seconds by postgrey-1.27 at vger.kernel.org; Mon, 18 Mar 2019 07:17:17 EDT
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 44ND2f6TvrzvjcX; Mon, 18 Mar 2019 12:08:58 +0100 (CET)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH] doc: fix link to MSG_ZEROCOPY patchset
Date:   Mon, 18 Mar 2019 12:08:58 +0100
Message-Id: <1552907338-1784-1-git-send-email-tklauser@distanz.ch>
X-Mailer: git-send-email 1.7.10.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use https and link to the patch directly.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 Documentation/networking/msg_zerocopy.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/msg_zerocopy.rst b/Documentation/networking/msg_zerocopy.rst
index 18c1415e7bfa..ace56204dd03 100644
--- a/Documentation/networking/msg_zerocopy.rst
+++ b/Documentation/networking/msg_zerocopy.rst
@@ -50,7 +50,7 @@ the excellent reporting over at LWN.net or read the original code.
 
   patchset
     [PATCH net-next v4 0/9] socket sendmsg MSG_ZEROCOPY
-    http://lkml.kernel.org/r/20170803202945.70750-1-willemdebruijn.kernel@gmail.com
+    https://lkml.kernel.org/netdev/20170803202945.70750-1-willemdebruijn.kernel@gmail.com
 
 
 Interface
-- 
2.20.0

