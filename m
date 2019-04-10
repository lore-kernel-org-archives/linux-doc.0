Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DC3A47D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 09:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730308AbfDJJ4i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 05:56:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60530 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727881AbfDJJ4h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 05:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6gYD4i2kCfLiq10f8dOgItEdjl6zdLWqSGB6Ne7Dio4=; b=JmkfCrxZPsAYiyhoCZfHPl5XPn
        c+bfU73iIXob5GKf+ZMcKIo3Yb4Jm507R1FclUyCQBKuQEZt+OI5U+Ae/5uW2WdMZ76mimKN7TDrm
        T4NpMlcZ0gMVBXNFUKlSmyG8PnHeRpgGiIy1ImXzP1l2/LlCm2oqBHdiZ/KnqIbp1XK4Iyj8x8S51
        6YkFYsXYSLk0udUnOpPxCeem4QiBx7rH7ZrNICTRwC38z45kS590YFpESY9GS2xhmgUucyefB9p7N
        Kc7OZ+GLYB5tMouzZ+e6TLofZEDgBorBlrwJhSsvaZBMUC/ca8gEPPO2+Jklu26In6Um1yYl8PEYC
        edxru6Ug==;
Received: from 177.41.129.23.dynamic.adsl.gvt.net.br ([177.41.129.23] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hE9y9-0003Cm-6v; Wed, 10 Apr 2019 09:56:37 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hE9y3-0000oL-SI; Wed, 10 Apr 2019 06:56:31 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 7/8] docs: ntb.txt: add blank lines to clean up some Sphinx warnings
Date:   Wed, 10 Apr 2019 06:56:26 -0300
Message-Id: <9f54993f859d5f7fda51842ffdf278a1bbc5d8b0.1554889999.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1554889999.git.mchehab+samsung@kernel.org>
References: <cover.1554889999.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to make it easier to parse and produce the right output,
add some extra blank lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/ntb.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/ntb.txt b/Documentation/ntb.txt
index 344a075f81f5..074a423c853c 100644
--- a/Documentation/ntb.txt
+++ b/Documentation/ntb.txt
@@ -77,11 +77,13 @@ outbound memory window so to have access to the shared memory region.
 
 As one can see the described scenarios can be combined in one portable
 algorithm.
+
  Local device:
   1) Allocate memory for a shared window
   2) Initialize memory window by translated address of the allocated region
      (it may fail if local memory window initialization is unsupported)
   3) Send the translated address and memory window index to a peer device
+
  Peer device:
   1) Initialize memory window with retrieved address of the allocated
      by another device memory region (it may fail if peer memory window
@@ -90,6 +92,7 @@ algorithm.
 
 In accordance with this scenario, the NTB Memory Window API can be used as
 follows:
+
  Local device:
   1) ntb_mw_count(pidx) - retrieve number of memory ranges, which can
      be allocated for memory windows between local device and peer device
@@ -105,6 +108,7 @@ follows:
   5) Send translated base address (usually together with memory window
      number) to the peer device using, for instance, scratchpad or message
      registers.
+
  Peer device:
   1) ntb_peer_mw_set_trans(pidx, midx) - try to set received from other
      device (related to pidx) translated address for specified memory
-- 
2.20.1

