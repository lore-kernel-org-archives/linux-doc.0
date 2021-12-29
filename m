Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F525C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Dec 2021 02:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236890AbhL2COg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Dec 2021 21:14:36 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:17309 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhL2COg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Dec 2021 21:14:36 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JNw1Z3Rl1z9rws;
        Wed, 29 Dec 2021 10:13:38 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 10:14:34 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 29 Dec
 2021 10:14:33 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v3 1/3] docs/zh_CN: Cleanup index.rst
Date:   Wed, 29 Dec 2021 10:42:10 +0800
Message-ID: <20211229024212.32752-2-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211229024212.32752-1-tangyizhou@huawei.com>
References: <20211229024212.32752-1-tangyizhou@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Many */index in the Chinese index.rst are not in the same order as the
English version. Put them to where they should be.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/index.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 46e14ec9963d..e7f5fa3e7502 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -104,13 +104,13 @@ TODOList:
    :maxdepth: 2
 
    core-api/index
+   accounting/index
    cpu-freq/index
    iio/index
+   infiniband/index
+   virt/index
    sound/index
    filesystems/index
-   virt/index
-   infiniband/index
-   accounting/index
    scheduler/index
 
 TODOList:
-- 
2.17.1

