Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB0EC433FE
	for <linux-doc@archiver.kernel.org>; Tue, 28 Dec 2021 01:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbhL1Bqf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Dec 2021 20:46:35 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:34849 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234433AbhL1Bqf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Dec 2021 20:46:35 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JNHSG2ShgzcbcY;
        Tue, 28 Dec 2021 09:46:06 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 09:46:33 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 28 Dec
 2021 09:46:33 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2 2/3] docs/zh_CN: Add power/index Chinese translation
Date:   Tue, 28 Dec 2021 10:14:06 +0800
Message-ID: <20211228021407.12449-3-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211228021407.12449-1-tangyizhou@huawei.com>
References: <20211228021407.12449-1-tangyizhou@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate power/index.rst into Chinese.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/power/index.rst        | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/power/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index e7f5fa3e7502..08144252630c 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -108,6 +108,7 @@ TODOList:
    cpu-freq/index
    iio/index
    infiniband/index
+   power/index
    virt/index
    sound/index
    filesystems/index
@@ -129,7 +130,6 @@ TODOList:
 * netlabel/index
 * networking/index
 * pcmcia/index
-* power/index
 * target/index
 * timers/index
 * spi/index
diff --git a/Documentation/translations/zh_CN/power/index.rst b/Documentation/translations/zh_CN/power/index.rst
new file mode 100644
index 000000000000..fd379adfda8e
--- /dev/null
+++ b/Documentation/translations/zh_CN/power/index.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/power/index.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+========
+电源管理
+========
+
+.. toctree::
+    :maxdepth: 1
+
+TODOList:
+
+    * apm-acpi
+    * basic-pm-debugging
+    * charger-manager
+    * drivers-testing
+    * energy-model
+    * freezing-of-tasks
+    * opp
+    * pci
+    * pm_qos_interface
+    * power_supply_class
+    * runtime_pm
+    * s2ram
+    * suspend-and-cpuhotplug
+    * suspend-and-interrupts
+    * swsusp-and-swap-files
+    * swsusp-dmcrypt
+    * swsusp
+    * video
+    * tricks
+
+    * userland-swsusp
+
+    * powercap/powercap
+    * powercap/dtpm
+
+    * regulator/consumer
+    * regulator/design
+    * regulator/machine
+    * regulator/overview
+    * regulator/regulator
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.17.1

