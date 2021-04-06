Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BECC433B4
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:02:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB582613BD
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhDFHC6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 03:02:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57136 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234018AbhDFHC5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:02:57 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax_ciRB2xgbLYEAA--.5852S3;
        Tue, 06 Apr 2021 15:02:45 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 1/8] docs/zh_CN: add cpu-freq core.rst translation
Date:   Tue,  6 Apr 2021 15:02:32 +0800
Message-Id: <20210406070239.19910-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406070239.19910-1-siyanteng@loongson.cn>
References: <20210406070239.19910-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax_ciRB2xgbLYEAA--.5852S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWrAw15AFy7ZryfuryfWFg_yoWrtw1fpF
        n3JrZ7JF15Ar95Aw4qgF47Wr1UJF4kAw47CFs7XrnYqryDAr45Xw4UKryxZryDGryUAFyU
        tr43tryxArWUCrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU86wZUUUU
        U
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documention/cpu-freq/core.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/cpu-freq/core.rst      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/cpu-freq/core.rst

diff --git a/Documentation/translations/zh_CN/cpu-freq/core.rst b/Documentation/translations/zh_CN/cpu-freq/core.rst
new file mode 100644
index 000000000000..1571087c2581
--- /dev/null
+++ b/Documentation/translations/zh_CN/cpu-freq/core.rst
@@ -0,0 +1,105 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../cpu-freq/core`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_core.rst:
+
+
+====================================
+CPUFreq核心和CPUFreq通知器的通用说明
+====================================
+
+作者:
+	- Dominik Brodowski  <linux@brodo.de>
+	- David Kimdon <dwhedon@debian.org>
+	- Rafael J. Wysocki <rafael.j.wysocki@intel.com>
+	- Viresh Kumar <viresh.kumar@linaro.org>
+
+.. 目录:
+
+   1.  CPUFreq核心和接口
+   2.  CPUFreq通知器
+   3.  含有Operating Performance Point (OPP)的CPUFreq表的生成
+
+1. CPUFreq核心和接口
+======================
+
+cpufreq核心代码位于drivers/cpufreq/cpufreq.c中。这些cpufreq代码为CPUFreq架构的驱
+动程序（那些操作硬件切换频率的代码）以及 "通知器 "提供了一个标准化的接口。
+这些是设备驱动程序或需要了解策略变化的其它内核部分（如 ACPI 热量管理）或所有频率更改（除
+计时代码外），甚至需要强制确定速度限制的通知器（如 ARM 架构上的 LCD 驱动程序）。
+此外， 内核 "常数" loops_per_jiffy会根据频率变化而更新。
+
+cpufreq策略的引用计数由 cpufreq_cpu_get 和 cpufreq_cpu_put 来完成，以确保 cpufreq 驱
+动程序被正确地注册到核心中，并且驱动程序在 cpufreq_put_cpu 被调用之前不会被卸载。这也保证
+了每个CPU核的cpufreq 策略在使用期间不会被释放。
+
+2. CPUFreq 通知器
+====================
+
+CPUFreq通知器符合标准的内核通知器接口。
+关于通知器的细节请参阅 linux/include/linux/notifier.h。
+
+这里有两个不同的CPUfreq通知器 - 策略通知器和转换通知器。
+
+
+2.1 CPUFreq策略通知器
+----------------------------
+
+当创建或移除策略时，这些都会被通知。
+
+阶段是在通知器的第二个参数中指定的。当第一次创建策略时，阶段是CPUFREQ_CREATE_POLICY，当
+策略被移除时，阶段是CPUFREQ_REMOVE_POLICY。
+
+第三个参数 ``void *pointer`` 指向一个结构体cpufreq_policy，其包括min，max(新策略的下限和
+上限（单位为kHz）)这几个值。
+
+
+2.2 CPUFreq转换通知器
+--------------------------------
+
+当CPUfreq驱动切换CPU核心频率时，策略中的每个在线CPU都会收到两次通知，这些变化没有任何外部干
+预。
+
+第二个参数指定阶段 - CPUFREQ_PRECHANGE or CPUFREQ_POSTCHANGE.
+
+第三个参数是一个包含如下值的结构体cpufreq_freqs：
+
+=====	====================
+cpu	受影响cpu的编号
+old	旧频率
+new	新频率
+flags	cpufreq驱动的标志
+=====	====================
+
+3. 含有Operating Performance Point (OPP)的CPUFreq表的生成
+==================================================================
+关于OPP的细节请参阅 Documentation/power/opp.rst
+
+dev_pm_opp_init_cpufreq_table -
+	这个功能提供了一个随时可用的转换程序，用来将OPP层关于可用频率的内部信息翻译成一种容易提供给
+	cpufreq的格式。
+
+	.. Warning::
+
+		不要在中断上下文中使用此函数。
+
+	例如::
+
+	 soc_pm_init()
+	 {
+		/* Do things */
+		r = dev_pm_opp_init_cpufreq_table(dev, &freq_table);
+		if (!r)
+			policy->freq_table = freq_table;
+		/* Do other things */
+	 }
+
+	.. note::
+
+		该函数只有在CONFIG_PM_OPP之外还启用了CONFIG_CPU_FREQ时才可用。
+
+dev_pm_opp_free_cpufreq_table
+	释放dev_pm_opp_init_cpufreq_table分配的表。
-- 
2.25.1

