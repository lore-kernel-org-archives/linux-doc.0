Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4557D7D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 29 Dec 2018 02:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbeL2COo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 28 Dec 2018 21:14:44 -0500
Received: from owa.iluvatar.ai ([103.91.158.24]:62077 "EHLO owa.iluvatar.ai"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727137AbeL2COo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 Dec 2018 21:14:44 -0500
X-Greylist: delayed 906 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Dec 2018 21:14:43 EST
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=iluvatar.ai; s=key_2018;
        c=relaxed/relaxed; t=1546048767; h=from:subject:to:date:message-id;
        bh=L6Cn/A0nKjoKq2LKU/bOE4c8OruEBiP21sdPd2ytLPc=;
        b=Caq51BcXsGKBx05AB6mAbTKSoJZSPG7DTGH1bJ+VXYrndXyQZ72zXCVQWGbfyXaWDXTsnQQwwbJ
        +/K3DKRSayjwSrPe/6xhJKWDDTUC2FLWiMsje4AWVd9fRb5mD5FE4vD2Lq3M4FY5+VBzw28/BXsyB
        6tIohtbR9T57mFwyA1k=
Received: from localhost.localdomain (10.101.1.99) by
 S-10-101-1-102.iluvatar.local (10.101.1.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1415.2; Sat, 29 Dec 2018 09:59:27 +0800
From:   Huang Shijie <sjhuang@iluvatar.ai>
To:     <akpm@linux-foundation.org>
CC:     <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Huang Shijie <sjhuang@iluvatar.ai>
Subject: [PATCH] Documentation: rename addr_in_gen_pool to gen_pool_has_addr
Date:   Sat, 29 Dec 2018 09:59:14 +0800
Message-ID: <20181229015914.5573-1-sjhuang@iluvatar.ai>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.101.1.99]
X-ClientProxiedBy: S-10-101-1-105.iluvatar.local (10.101.1.105) To
 S-10-101-1-102.iluvatar.local (10.101.1.102)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the document, since we have renamed addr_in_gen_pool to
gen_pool_has_addr.

Signed-off-by: Huang Shijie <sjhuang@iluvatar.ai>
---

Sorry, I missed to update this document...

---
 Documentation/core-api/genalloc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/genalloc.rst b/Documentation/core-api/genalloc.rst
index 6b38a39fab24..a534cc7ebd05 100644
--- a/Documentation/core-api/genalloc.rst
+++ b/Documentation/core-api/genalloc.rst
@@ -129,7 +129,7 @@ writing of special-purpose memory allocators in the future.
    :functions: gen_pool_for_each_chunk
 
 .. kernel-doc:: lib/genalloc.c
-   :functions: addr_in_gen_pool
+   :functions: gen_pool_has_addr
 
 .. kernel-doc:: lib/genalloc.c
    :functions: gen_pool_avail
-- 
2.17.1

