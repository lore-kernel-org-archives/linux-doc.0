Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CD4C6FD1D
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 02:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCPCp0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 22:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjCPCpY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 22:45:24 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A2D149A0
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 19:45:23 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PcWkP25zjzSkVR;
        Thu, 16 Mar 2023 10:42:05 +0800 (CST)
Received: from vm7-223-112-215.huawei.com (7.223.112.215) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 10:45:20 +0800
From:   Zang Leigang <zangleigang@hisilicon.com>
To:     <alexs@kernel.org>, <siyanteng@loongson.cn>, <corbet@lwn.net>
CC:     <rppt@kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH] docs/zh_CN: fix a wrong format
Date:   Thu, 16 Mar 2023 10:45:19 +0800
Message-ID: <20230316024519.27992-1-zangleigang@hisilicon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [7.223.112.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a missing markup for the code snippet at the end of lru_sort.rst

Signed-off-by: Zang Leigang <zangleigang@hisilicon.com>
---
 .../translations/zh_CN/admin-guide/mm/damon/lru_sort.rst        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
index 812ef315c8f6..03d33c710604 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
@@ -250,7 +250,7 @@ LRU的优先级的提升，同时降低那些超过120秒无人访问的内存
 理被限制在最多1%的CPU以避免DAMON_LRU_SORT消费过多CPU时间。在系统空闲内存超过50%
 时DAMON_LRU_SORT停止工作，并在低于40%时重新开始工作。如果DAMON_RECLAIM没有取得
 进展且空闲内存低于20%，再次让DAMON_LRU_SORT停止工作，以此回退到以LRU链表为基础
-以页面为单位的内存回收上。
+以页面为单位的内存回收上。 ::
 
     # cd /sys/modules/damon_lru_sort/parameters
     # echo 500 > hot_thres_access_freq
-- 
2.17.1

