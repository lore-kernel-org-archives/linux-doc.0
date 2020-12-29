Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DFBC433E6
	for <linux-doc@archiver.kernel.org>; Tue, 29 Dec 2020 09:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB9FA21D7F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Dec 2020 09:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgL2JJf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Dec 2020 04:09:35 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:47622 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgL2JJf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Dec 2020 04:09:35 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 9AEEA440AEE;
        Tue, 29 Dec 2020 11:08:50 +0200 (IST)
From:   Baruch Siach <baruch@tkos.co.il>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        =?UTF-8?q?Ulisses=20Alonso=20Camar=C3=B3?= <uaca@alumni.uv.es>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2 1/2] docs: networking: packet_mmap: fix formatting for C macros
Date:   Tue, 29 Dec 2020 11:08:38 +0200
Message-Id: <5cb47005e7a59b64299e038827e295822193384c.1609232919.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The citation of macro definitions should appear in a code block.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/networking/packet_mmap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/packet_mmap.rst b/Documentation/networking/packet_mmap.rst
index 6c009ceb1183..f3646c80b019 100644
--- a/Documentation/networking/packet_mmap.rst
+++ b/Documentation/networking/packet_mmap.rst
@@ -437,7 +437,7 @@ and the following flags apply:
 Capture process
 ^^^^^^^^^^^^^^^
 
-     from include/linux/if_packet.h
+From include/linux/if_packet.h::
 
      #define TP_STATUS_COPY          (1 << 1)
      #define TP_STATUS_LOSING        (1 << 2)
-- 
2.29.2

