Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990A7C4332F
	for <linux-doc@archiver.kernel.org>; Fri,  4 Nov 2022 12:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiKDMe2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Nov 2022 08:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiKDMe1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Nov 2022 08:34:27 -0400
X-Greylist: delayed 475 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Nov 2022 05:34:24 PDT
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFC2DFB1;
        Fri,  4 Nov 2022 05:34:24 -0700 (PDT)
Received: from newone.lan (_gateway [10.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 4DC7123094;
        Fri,  4 Nov 2022 13:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1667564786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2L8fmfhqQ98aaiOa4Iv/kYogfYH9MccMvpIHyU9mjvc=;
        b=m5IM7SWEldP7qPq/ESJLuDPWRqn614OfF0YqOAe8udgJBDJIg3RqG5+dFrVOFI6lnZXukc
        zl4l2Pt927HJt0ne0Kn6seaPCiV1ET3/p7zC5IM8zcP0nbISaKBWzUFqBdWLTEx6N57jsl
        MdbFeF2uGUq9aBzZQutpEWIOo7T10aw=
From:   David Heidelberg <david@ixit.cz>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Docs/admin-guide/mm/zswap: remove a paragraph about zswap being a new feature
Date:   Fri,  4 Nov 2022 13:26:11 +0100
Message-Id: <20221104122612.14906-1-david@ixit.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Nine years have passed since Linux 3.11.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/admin-guide/mm/zswap.rst | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
index 6e6f7b0d6562..f67de481c7f6 100644
--- a/Documentation/admin-guide/mm/zswap.rst
+++ b/Documentation/admin-guide/mm/zswap.rst
@@ -14,13 +14,7 @@ for potentially reduced swap I/O.  This trade-off can also result in a
 significant performance improvement if reads from the compressed cache are
 faster than reads from a swap device.
 
-.. note::
-   Zswap is a new feature as of v3.11 and interacts heavily with memory
-   reclaim.  This interaction has not been fully explored on the large set of
-   potential configurations and workloads that exist.  For this reason, zswap
-   is a work in progress and should be considered experimental.
-
-   Some potential benefits:
+Some potential benefits:
 
 * Desktop/laptop users with limited RAM capacities can mitigate the
   performance impact of swapping.
-- 
2.35.1

