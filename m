Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A462C7D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Aug 2019 01:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbfHBBWJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Aug 2019 21:22:09 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:54934 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729345AbfHBBWJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Aug 2019 21:22:09 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id AB44843D26697CDE4409;
        Fri,  2 Aug 2019 09:22:06 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 2 Aug 2019 09:21:49 +0800
From:   Chao Yu <yuchao0@huawei.com>
To:     <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chao@kernel.org>, <jaegeuk@kernel.org>,
        Chao Yu <yuchao0@huawei.com>
Subject: [PATCH] mailmap: add entry for Jaegeuk Kim
Date:   Fri, 2 Aug 2019 09:21:35 +0800
Message-ID: <20190802012135.31419-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry to connect all Jaegeuk's email addresses.

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 .mailmap | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.mailmap b/.mailmap
index 477debe3d960..70d41c86e644 100644
--- a/.mailmap
+++ b/.mailmap
@@ -89,6 +89,9 @@ Henrik Kretzschmar <henne@nachtwindheim.de>
 Henrik Rydberg <rydberg@bitmath.org>
 Herbert Xu <herbert@gondor.apana.org.au>
 Jacob Shin <Jacob.Shin@amd.com>
+Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk@google.com>
+Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk@motorola.com>
+Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk.kim@samsung.com>
 James Bottomley <jejb@mulgrave.(none)>
 James Bottomley <jejb@titanic.il.steeleye.com>
 James E Wilson <wilson@specifix.com>
-- 
2.18.0.rc1

