Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D60C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 14:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbiDHOPx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 10:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbiDHOPw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 10:15:52 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BF334F4B7
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 07:13:46 -0700 (PDT)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KZgFk0TzJzdZp6;
        Fri,  8 Apr 2022 22:13:14 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 8 Apr 2022 22:13:43 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 8 Apr
 2022 22:13:43 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2 1/2] docs/zh_CN: Add locking/index Chinese translation
Date:   Fri, 8 Apr 2022 22:47:41 +0800
Message-ID: <20220408144742.23225-2-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220408144742.23225-1-tangyizhou@huawei.com>
References: <20220408144742.23225-1-tangyizhou@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate locking/index.rst into Chinese.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/locking/index.rst      | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/locking/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 88d8df957a78..ac32d8e306ac 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -108,6 +108,7 @@ TODOList:
    :maxdepth: 2
 
    core-api/index
+   locking/index
    accounting/index
    cpu-freq/index
    iio/index
@@ -123,7 +124,6 @@ TODOList:
 TODOList:
 
 * driver-api/index
-* locking/index
 * block/index
 * cdrom/index
 * ide/index
diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
new file mode 100644
index 000000000000..700df8a2bb70
--- /dev/null
+++ b/Documentation/translations/zh_CN/locking/index.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/locking/index.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+==
+锁
+==
+
+.. toctree::
+    :maxdepth: 1
+
+TODOList:
+
+    * locktypes
+    * lockdep-design
+    * lockstat
+    * locktorture
+    * mutex-design
+    * rt-mutex-design
+    * rt-mutex
+    * seqlock
+    * spinlocks
+    * ww-mutex-design
+    * preempt-locking
+    * pi-futex
+    * futex-requeue-pi
+    * hwspinlock
+    * percpu-rw-semaphore
+    * robust-futexes
+    * robust-futex-ABI
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.17.1

