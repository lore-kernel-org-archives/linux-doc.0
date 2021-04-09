Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,
	WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E45C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 09:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20AC9611C9
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 09:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhDIJKb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 05:10:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40680 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231370AbhDIJKa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 05:10:30 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxecnCGXBge84FAA--.9803S6;
        Fri, 09 Apr 2021 17:09:57 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 04/11] docs/zh_CN: add core-api irq irqflags-tracing.rst translation
Date:   Fri,  9 Apr 2021 17:10:06 +0800
Message-Id: <20210409091013.2493988-5-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210409091013.2493988-1-siyanteng@loongson.cn>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxecnCGXBge84FAA--.9803S6
X-Coremail-Antispam: 1UD129KBjvJXoWxury5Xr43JFy7Ary8Zw1rXrb_yoW5Kw4DpF
        Wv9a4fWa13ArWUZrWxur18Aw1rJF18WFZ7Aan7J3Z3XF95Jayjyr48KFn0yF1fWFy8A3yU
        tFs3ArWF9Fy5AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUbaLvtUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/irq/irqflags-tracing.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/irq/irqflags-tracing.rst   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst

diff --git a/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
new file mode 100644
index 000000000000..2a3f577ac6b5
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
@@ -0,0 +1,45 @@
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../../core-api/irq/irqflags-tracing`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_irqflags-tracing.rst:
+
+
+=======================
+IRQ-flags状态追踪
+=======================
+
+:Author: 最初由Ingo Molnar <mingo@redhat.com>开始撰写
+
+“irq-flags tracing”（中断标志追踪）功能可以 “追踪” hardirq和softirq的状态，它让
+感兴趣的子系统有机会了解到到内核中发生的每一个
+hardirqs-off/hardirqs-on、softirqs-off/softirqs-on事件。
+
+CONFIG_TRACE_IRQFLAGS_SUPPORT是通用锁调试代码提供的CONFIG_PROVE_SPIN_LOCKING
+和CONFIG_PROVE_RW_LOCKING所需要的。否则将只有CONFIG_PROVE_MUTEX_LOCKING和
+CONFIG_PROVE_RWSEM_LOCKING在一个架构上被提供--这些都是不在IRQ上下文中使用的
+锁API。（rwsems的一个异常是可以解决的）
+
+架构对这一点的支持当然不属于“微不足道”的范畴，因为很多低级的汇编代码都要处理irq-flags
+的状态变化。但是一个架构可以以一种相当直接且无风险的方式启用irq-flags-tracing。
+
+架构如果想支持这个，需要先做一些代码组织上的改变:
+
+- 在他们的arch级Kconfig文件中添加并启用TRACE_IRQFLAGS_SUPPORT。
+
+然后还需要做一些功能上的改变来实现对irq-flags-tracing的支持:
+
+- 在低级入口代码中增加（构建条件）对trace_hardirqs_off()/trace_hardirqs_on()
+  函数的调用。锁验证器会密切关注 “real”的irq-flags是否与 “virtual”的irq-flags
+  状态相匹配，如果两者不匹配，则会发出警告（并关闭自己）。通常维护arch中
+  irq-flags-track的大部分时间都是在这种状态下度过的：看看lockdep的警告，试着
+  找出我们还没有搞定的汇编代码。修复并重复。一旦系统启动，并且在irq-flags跟踪功
+  能中没有出现lockdep警告的情况下，arch支持就完成了。
+
+- 如果该架构有不可屏蔽的中断，那么需要通过lockdep_off()/lockdep_on()将这些中
+  断从irq跟踪[和锁验证]机制中排除。
+
+ 一般来说，在一个架构中，不完整的irq-flags-tracing实现是没有风险的：lockdep
+ 会检测到这一点，并将自己关闭。即锁验证器仍然可靠。应该不会因为irq-tracing的错
+ 误而崩溃。（除非通过修改不该修改的条件来更改汇编或寄存器而破坏其他代码）
-- 
2.27.0

