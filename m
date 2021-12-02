Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13E9C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  2 Dec 2021 12:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347032AbhLBMi3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Dec 2021 07:38:29 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:32868 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346987AbhLBMiZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Dec 2021 07:38:25 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J4b4t3TNnzcbmh;
        Thu,  2 Dec 2021 20:34:54 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 20:35:02 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 20:35:01 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH -next v2] doc/zh-CN: Update cpu-freq/core.rst to make it more readable
Date:   Thu, 2 Dec 2021 21:02:40 +0800
Message-ID: <20211202130240.27942-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
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

These Chinese translations are easier to understand.

Also update the first memeber of struct cpufreq_freqs.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
Acked-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
v2:
1. Take Yangteng's advice.
2. Add proofreader.
3. Add Acked-by and Reviewed-by tag.

 .../translations/zh_CN/cpu-freq/core.rst      | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/translations/zh_CN/cpu-freq/core.rst b/Documentation/translations/zh_CN/cpu-freq/core.rst
index 0c6fd447ced6..b3c095306ffe 100644
--- a/Documentation/translations/zh_CN/cpu-freq/core.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/core.rst
@@ -7,7 +7,9 @@
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_core.rst:
+:校译:
+
+ 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
 
 ====================================
 CPUFreq核心和CPUFreq通知器的通用说明
@@ -29,10 +31,10 @@ CPUFreq核心和CPUFreq通知器的通用说明
 ======================
 
 cpufreq核心代码位于drivers/cpufreq/cpufreq.c中。这些cpufreq代码为CPUFreq架构的驱
-动程序（那些操作硬件切换频率的代码）以及 "通知器 "提供了一个标准化的接口。
-这些是设备驱动程序或需要了解策略变化的其它内核部分（如 ACPI 热量管理）或所有频率更改（除
-计时代码外），甚至需要强制确定速度限制的通知器（如 ARM 架构上的 LCD 驱动程序）。
-此外， 内核 "常数" loops_per_jiffy会根据频率变化而更新。
+动程序（那些执行硬件频率切换的代码）以及 "通知器" 提供了一个标准化的接口。
+包括设备驱动程序；需要了解策略变化（如 ACPI 热量管理），或所有频率变化（如计时代码），
+甚至需要强制限制为指定频率（如 ARM 架构上的 LCD 驱动程序）的其它内核组件。
+此外，内核 "常数" loops_per_jiffy 会根据频率变化而更新。
 
 cpufreq策略的引用计数由 cpufreq_cpu_get 和 cpufreq_cpu_put 来完成，以确保 cpufreq 驱
 动程序被正确地注册到核心中，并且驱动程序在 cpufreq_put_cpu 被调用之前不会被卸载。这也保证
@@ -41,7 +43,7 @@ cpufreq策略的引用计数由 cpufreq_cpu_get 和 cpufreq_cpu_put 来完成，
 2. CPUFreq 通知器
 ====================
 
-CPUFreq通知器符合标准的内核通知器接口。
+CPUFreq通知器遵循标准的内核通知器接口。
 关于通知器的细节请参阅 linux/include/linux/notifier.h。
 
 这里有两个不同的CPUfreq通知器 - 策略通知器和转换通知器。
@@ -69,20 +71,20 @@ CPUFreq通知器符合标准的内核通知器接口。
 
 第三个参数是一个包含如下值的结构体cpufreq_freqs：
 
-=====	====================
-cpu	受影响cpu的编号
+======	===============================
+policy	指向struct cpufreq_policy的指针
 old	旧频率
 new	新频率
 flags	cpufreq驱动的标志
-=====	====================
+======	===============================
 
 3. 含有Operating Performance Point (OPP)的CPUFreq表的生成
 ==================================================================
 关于OPP的细节请参阅 Documentation/power/opp.rst
 
 dev_pm_opp_init_cpufreq_table -
-	这个功能提供了一个随时可用的转换程序，用来将OPP层关于可用频率的内部信息翻译成一种容易提供给
-	cpufreq的格式。
+	这个函数提供了一个随时可用的转换例程，用来将OPP层关于可用频率的内部信息翻译成一种
+	cpufreq易于处理的格式。
 
 	.. Warning::
 
-- 
2.17.1

