Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C79C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 09:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DD0E610D0
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 09:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbhDIJKM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 05:10:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40612 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231749AbhDIJKL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 05:10:11 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxecnCGXBge84FAA--.9803S4;
        Fri, 09 Apr 2021 17:09:36 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 02/11] docs/zh_CN: add core-api irq irq-affinity.rst translation
Date:   Fri,  9 Apr 2021 17:10:04 +0800
Message-Id: <20210409091013.2493988-3-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210409091013.2493988-1-siyanteng@loongson.cn>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxecnCGXBge84FAA--.9803S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1rGr1rZw4xJF1UCr13twb_yoW5Kw4xpF
        4UKasakF4xW3srAw17G3WYyF10qa4xW3y3t3s7Ka4xAFn5WwsrZr43Kry5G3yxGFW8Zay7
        uFs7JFy0yryjy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z2
        80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUbfb1UUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/irq/irq-affinity.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/irq/irq-affinity.rst       | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst

diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
new file mode 100644
index 000000000000..34aaf0d1ddc2
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
@@ -0,0 +1,74 @@
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../../core-api/irq/irq-affinity`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_irq-affinity.rst:
+
+
+================
+SMP IRQ 亲和性
+================
+
+变更记录:
+	- 作者：最初由Ingo Molnar <mingo@redhat.com>开始撰写
+	- 后期更新维护： Max Krasnyansky <maxk@qualcomm.com>
+
+
+/proc/irq/IRQ#/smp_affinity和/proc/irq/IRQ#/smp_affinity_list指定了哪些CPU能
+够关联到一个给定的IRQ源，这两个文件包含了这些指定cpu的cpu位掩码(smp_affinity)和cpu列
+表(smp_affinity_list)。它不允许关闭所有CPU， 同时如果IRQ控制器不支持中断请求亲和
+(IRQ affinity)，那么所有cpu的默认值将保持不变(即关联到所有CPU).
+
+/proc/irq/default_smp_affinity指明了适用于所有非激活IRQ的默认亲和性掩码。一旦IRQ被
+分配/激活，它的亲和位掩码将被设置为默认掩码。然后可以如上所述改变它。默认掩码是0xffffffff。
+
+下面是一个先将IRQ44(eth1)限制在CPU0-3上，然后限制在CPU4-7上的例子(这是一个8CPU的SMP box)
+
+::
+
+	[root@moon 44]# cd /proc/irq/44
+	[root@moon 44]# cat smp_affinity
+	ffffffff
+
+	[root@moon 44]# echo 0f > smp_affinity
+	[root@moon 44]# cat smp_affinity
+	0000000f
+	[root@moon 44]# ping -f h
+	PING hell (195.4.7.3): 56 data bytes
+	...
+	--- hell ping statistics ---
+	6029 packets transmitted, 6027 packets received, 0% packet loss
+	round-trip min/avg/max = 0.1/0.1/0.4 ms
+	[root@moon 44]# cat /proc/interrupts | grep 'CPU\|44:'
+		CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
+	44:       1068       1785       1785       1783         0          0           0         0    IO-APIC-level  eth1
+
+从上面一行可以看出，IRQ44只传递给前四个处理器（0-3）。
+现在让我们把这个IRQ限制在CPU(4-7)。
+
+::
+
+	[root@moon 44]# echo f0 > smp_affinity
+	[root@moon 44]# cat smp_affinity
+	000000f0
+	[root@moon 44]# ping -f h
+	PING hell (195.4.7.3): 56 data bytes
+	..
+	--- hell ping statistics ---
+	2779 packets transmitted, 2777 packets received, 0% packet loss
+	round-trip min/avg/max = 0.1/0.5/585.4 ms
+	[root@moon 44]# cat /proc/interrupts |  'CPU\|44:'
+		CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
+	44:       1068       1785       1785       1783      1784       1069        1070       1069   IO-APIC-level  eth1
+
+这次IRQ44只传递给最后四个处理器。
+即CPU0-3的计数器没有变化。
+
+下面是一个将相同的irq(44)限制在cpus 1024到1031的例子：
+
+	[root@moon 44]# echo 1024-1031 > smp_affinity_list
+	[root@moon 44]# cat smp_affinity_list
+	1024-1031
+
+需要注意的是，如果要用位掩码来做这件事，就需要32个为0的位掩码来追踪其相关的一个。
-- 
2.27.0

