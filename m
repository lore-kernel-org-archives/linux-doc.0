Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F30C00528
	for <linux-doc@archiver.kernel.org>; Wed,  2 Aug 2023 07:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbjHBHqK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 03:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbjHBHpj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 03:45:39 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211DD3592
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 00:43:19 -0700 (PDT)
Received: from dggpemm500014.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RG3pb0wbVz1GDKL;
        Wed,  2 Aug 2023 15:42:15 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 15:43:16 +0800
From:   Wupeng Ma <mawupeng1@huawei.com>
To:     <akpm@linux-foundation.org>, <corbet@lwn.net>, <david@redhat.com>
CC:     <linux-mm@kvack.org>, <mawupeng1@huawei.com>,
        <linux-doc@vger.kernel.org>
Subject: [PATCH] doc: update params of memhp_default_state=
Date:   Wed, 2 Aug 2023 15:43:12 +0800
Message-ID: <20230802074312.2111074-1-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ma Wupeng <mawupeng1@huawei.com>

Commit 5f47adf762b7 ("mm/memory_hotplug: allow to specify a default
online_type") allows to specify a default online_type which make
online memory to kernel or movable zone possible but fail to update
to doc. Update doc to fit this change.

Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1457995fd41..09bad9c62f41 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3105,7 +3105,7 @@
 			[KNL,SH] Allow user to override the default size for
 			per-device physically contiguous DMA buffers.
 
-	memhp_default_state=online/offline
+	memhp_default_state=online/offline/online_kernel/online_movable
 			[KNL] Set the initial state for the memory hotplug
 			onlining policy. If not specified, the default value is
 			set according to the
-- 
2.25.1

