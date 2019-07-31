Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D8B37D910
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 11:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbfGaLpg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 07:45:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60274 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726232AbfGaLpg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Jul 2019 07:45:36 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3AA799B53BE7CAE83EC3;
        Wed, 31 Jul 2019 19:45:33 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Wed, 31 Jul 2019 19:45:23 +0800
From:   Chao Yu <yuchao0@huawei.com>
To:     <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>, <chao@kernel.org>,
        <linux-kernel@vger.kernel.org>, Chao Yu <yuchao0@huawei.com>
Subject: [PATCH] mailmap: add entry to connect my email addresses
Date:   Wed, 31 Jul 2019 19:45:10 +0800
Message-ID: <20190731114510.42003-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I've used several email accounts to contribute codes, samsung's one
is obsolete, so let me add entry to map them, in order to let people
find me easily when they blame my codes.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index ebdca3fba91f..45d358534ac5 100644
--- a/.mailmap
+++ b/.mailmap
@@ -47,6 +47,8 @@ Boris Brezillon <bbrezillon@kernel.org> <b.brezillon.dev@gmail.com>
 Boris Brezillon <bbrezillon@kernel.org> <b.brezillon@overkiz.com>
 Brian Avery <b.avery@hp.com>
 Brian King <brking@us.ibm.com>
+Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
+Chao Yu <chao@kernel.org> <yuchao0@huawei.com>
 Christoph Hellwig <hch@lst.de>
 Christophe Ricard <christophe.ricard@gmail.com>
 Corey Minyard <minyard@acm.org>
-- 
2.18.0.rc1

