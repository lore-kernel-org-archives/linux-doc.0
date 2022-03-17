Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1CFC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 02:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348937AbiCQC2m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 22:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiCQC2l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 22:28:41 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C1B1D0E3
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 19:27:26 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KJrbm417pzfYnH;
        Thu, 17 Mar 2022 10:25:56 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 10:27:24 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Thu, 17 Mar
 2022 10:27:24 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH] docs/zh_CN: Add sched-debug Chinese translation
Date:   Thu, 17 Mar 2022 10:59:14 +0800
Message-ID: <20220317025914.27588-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate scheduler/sched-debug.rst into Chinese.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 .../translations/zh_CN/scheduler/index.rst    |  1 +
 .../zh_CN/scheduler/sched-debug.rst           | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-debug.rst

diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index 12bf3bd02ccf..5c0e07aee299 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -27,6 +27,7 @@ Linux调度器
     sched-energy
     sched-nice-design
     sched-stats
+    sched-debug
 
 TODOList:
 
diff --git a/Documentation/translations/zh_CN/scheduler/sched-debug.rst b/Documentation/translations/zh_CN/scheduler/sched-debug.rst
new file mode 100644
index 000000000000..5e17740c2bf3
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/sched-debug.rst
@@ -0,0 +1,51 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/sched-debug.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+=============
+调度器debugfs
+=============
+
+用配置项CONFIG_SCHED_DEBUG=y启动内核后，将可以访问/sys/kernel/debug/sched
+下的调度器专用调试文件。其中一些文件描述如下。
+
+numa_balancing
+==============
+
+`numa_balancing` 目录用来存放控制非统一内存访问（NUMA）平衡特性的相关文件。
+如果该特性导致系统负载太高，那么可以通过 `scan_period_min_ms, scan_delay_ms,
+scan_period_max_ms, scan_size_mb` 文件控制NUMA缺页的内核采样速率。
+
+
+scan_period_min_ms, scan_delay_ms, scan_period_max_ms, scan_size_mb
+-------------------------------------------------------------------
+
+自动NUMA平衡会扫描任务地址空间，检测页面是否被正确放置，或者数据是否应该被
+迁移到任务正在运行的本地内存结点，此时需解映射页面。每个“扫描延迟”（scan delay）
+时间之后，任务扫描其地址空间中下一批“扫描大小”（scan size）个页面。若抵达
+内存地址空间末尾，扫描器将从头开始重新扫描。
+
+结合来看，“扫描延迟”和“扫描大小”决定扫描速率。当“扫描延迟”减小时，扫描速率
+增加。“扫描延迟”和每个任务的扫描速率都是自适应的，且依赖历史行为。如果页面被
+正确放置，那么扫描延迟就会增加；否则扫描延迟就会减少。“扫描大小”不是自适应的，
+“扫描大小”越大，扫描速率越高。
+
+更高的扫描速率会产生更高的系统开销，因为必须捕获缺页异常，并且潜在地必须迁移
+数据。然而，当扫描速率越高，若工作负载模式发生变化，任务的内存将越快地迁移到
+本地结点，由于远程内存访问而产生的性能影响将降到最低。下面这些文件控制扫描延迟
+的阈值和被扫描的页面数量。
+
+``scan_period_min_ms`` 是扫描一个任务虚拟内存的最小时间，单位是毫秒。它有效地
+控制了每个任务的最大扫描速率。
+
+``scan_delay_ms`` 是一个任务初始化创建（fork）时，第一次使用的“扫描延迟”。
+
+``scan_period_max_ms`` 是扫描一个任务虚拟内存的最大时间，单位是毫秒。它有效地
+控制了每个任务的最小扫描速率。
+
+``scan_size_mb`` 是一次特定的扫描中，要扫描多少兆字节（MB）对应的页面数。
-- 
2.17.1

