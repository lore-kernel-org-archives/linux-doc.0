Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB25D7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Aug 2019 03:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfHADSM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 23:18:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3686 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725793AbfHADSM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Jul 2019 23:18:12 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 1F2C6B5F8AF3181109BD;
        Thu,  1 Aug 2019 11:18:10 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 1 Aug 2019 11:17:59 +0800
From:   Chao Yu <yuchao0@huawei.com>
To:     <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>, <gaoxiang25@huawei.com>,
        <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>
Subject: [PATCH] mailmap: add entry for Gao Xiang
Date:   Thu, 1 Aug 2019 11:17:50 +0800
Message-ID: <20190801031750.17094-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry to connect all Gao Xiang's email addresses.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 4ff3f20b4f11..00588c37e99d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -79,6 +79,8 @@ Frank Rowand <frowand.list@gmail.com> <frowand@mvista.com>
 Frank Rowand <frowand.list@gmail.com> <frank.rowand@am.sony.com>
 Frank Rowand <frowand.list@gmail.com> <frank.rowand@sonymobile.com>
 Frank Zago <fzago@systemfabricworks.com>
+Gao Xiang <xiang@kernel.org> <gaoxiang25@huawei.com>
+Gao Xiang <xiang@kernel.org> <hsiangkao@aol.com>
 Greg Kroah-Hartman <greg@echidna.(none)>
 Greg Kroah-Hartman <gregkh@suse.de>
 Greg Kroah-Hartman <greg@kroah.com>
-- 
2.18.0.rc1

