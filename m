Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C03C433B4
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 13:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B165613A0
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 13:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240250AbhDFNBg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 09:01:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49374 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243477AbhDFNBf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 09:01:35 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax_cifW2xg9tQEAA--.6047S4;
        Tue, 06 Apr 2021 21:01:22 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 02/11] docs/zh_CN: add core-api irq irq-affinity.rst translation
Date:   Tue,  6 Apr 2021 21:02:01 +0800
Message-Id: <20210406130210.2725075-3-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210406130210.2725075-1-siyanteng@loongson.cn>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax_cifW2xg9tQEAA--.6047S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCFy3GFW3Cry3tF13WFW7Arb_yoW5KF18pF
        47K3Zaka1xW3srAw17C3Wavr18Xa4xWayay397Ga4IyFs5WwsrZr43Kry5G3yxGFW0vay7
        uFs7JFW0yryjy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
        v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
        Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
        0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIx
        AIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHbyAUUUUU
        =
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/irq/irq-affinity.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/irq/irq-affinity.rst       | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst

diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
new file mode 100644
index 000000000000..34aaf0d1ddc2
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
@@ -0,0 +1,73 @@
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
+/proc/irq/IRQ#/smp_affinity和/proc/irq/IRQ#/smp_affinity_list指明了给定IRQ源
+允许哪些目标CPU使用。它是被允许的CPU的位掩码(smp_affinity)或cpu列表(smp_affinity_list)。
+它不允许关闭所有的CPU，如果一个IRQ控制器不支持IRQ亲和性，那么所有cpu的默认值将不会发生
+变化。
+
+/proc/irq/default_smp_affinity指明了适用于所有非激活IRQ的默认亲和性掩码。一旦IRQ被
+分配/激活，它的亲和位掩码将被设置为默认掩码。然后可以如上所述改变它。默认掩码是0xffffffffff。
+
+下面是一个先将IRQ44(eth1)限制在CPU0-3上，然后限制在CPU4-7上的例子(这是一个8CPU的SMP box)
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
+下面是一个将相同的irq(44)限制在cpus 1024到1031的例子：。
+
+	[root@moon 44]# echo 1024-1031 > smp_affinity_list
+	[root@moon 44]# cat smp_affinity_list
+	1024-1031
+
+需要注意的是，如果要用位掩码来做这件事，就需要32个为0的位掩码来追踪其相关的一个。
-- 
2.27.0

