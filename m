Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCB3C12002
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20E3F61165
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235032AbhGSJBy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:01:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39404 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235530AbhGSJBy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Jul 2021 05:01:54 -0400
Received: from localhost.localdomain (unknown [112.20.113.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0LvSPVghpEhAA--.19840S5;
        Mon, 19 Jul 2021 17:42:27 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 3/8] docs/zh_CN: add virt guest-halt-polling translation
Date:   Mon, 19 Jul 2021 17:42:50 +0800
Message-Id: <5fc0463fdee1a2efdf3085d27f39e338593cca89.1626687013.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1626687013.git.siyanteng@loongson.cn>
References: <cover.1626687013.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0LvSPVghpEhAA--.19840S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCryfCFy7GF4Dur45CFWrAFb_yoWrAr4DpF
        98KryxKr9Fyry5AFyxGFyDWr17G34kG347Gw4xJwnFgF4Uta1jyF4UKrWF9FZ7urW8ZFy8
        JF4jkFyqkry2ka7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUekucDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/virt/guest-halt-polling.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/virt/guest-halt-polling.rst         | 87 +++++++++++++++++++
 .../translations/zh_CN/virt/index.rst         |  2 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/guest-halt-polling.rst

diff --git a/Documentation/translations/zh_CN/virt/guest-halt-polling.rst b/Documentation/translations/zh_CN/virt/guest-halt-polling.rst
new file mode 100644
index 000000000000..6d35aeb88ffc
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/guest-halt-polling.rst
@@ -0,0 +1,87 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/virt/guest-halt-polling.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_virt_guest-halt-polling:
+
+========================================
+客户机停止轮询机制（Guest halt polling）
+========================================
+
+cpuidle_haltpoll驱动，与haltpoll管理器一起，允许客户机vcpus在停止前轮询
+一定的时间。
+
+这为物理机侧的轮询提供了以下好处:
+
+	1) 在执行轮询时，POLL标志被设置，这允许远程vCPU在执行唤醒时避免发送
+	   IPI（以及处理IPI的相关成本）。
+
+	2) 可以避免虚拟机退出的成本。
+
+客户机侧轮询的缺点是，即使在物理机中的其他可运行任务中也会进行轮询。
+
+其基本逻辑如下。一个全局值，即guest_halt_poll_ns，是由用户配置的，表示允
+许轮询的最大时间量。这个值是固定的。
+
+每个vcpu都有一个可调整的guest_halt_poll_ns（"per-cpu guest_halt_poll_ns"），
+它由算法响应事件进行调整（解释如下）。
+
+模块参数
+========
+
+haltpoll管理器有5个可调整的模块参数:
+
+1) guest_halt_poll_ns:
+
+轮询停止前执行的最大时间，以纳秒为单位。
+
+默认值: 200000
+
+2) guest_halt_poll_shrink:
+
+当唤醒事件发生在全局的guest_halt_poll_ns之后，用于缩减每个CPU的guest_halt_poll_ns
+的划分系数。
+
+默认值: 2
+
+3) guest_halt_poll_grow:
+
+当事件发生在per-cpu guest_halt_poll_ns之后但在global guest_halt_poll_ns之前，
+用于增长per-cpu guest_halt_poll_ns的乘法系数。
+
+默认值: 2
+
+4) guest_halt_poll_grow_start:
+
+在系统空闲的情况下，每个cpu guest_halt_poll_ns最终达到零。这个值设置了增长时的
+初始每cpu guest_halt_poll_ns。这个值可以从10000开始增加，以避免在最初的增长阶
+段出现失误。:
+
+10k, 20k, 40k, ... (例如，假设guest_halt_poll_grow=2).
+
+默认值: 50000
+
+5) guest_halt_poll_allow_shrink:
+
+允许缩减的Bool参数。设置为N以避免它（一旦达到全局的guest_halt_poll_ns值，每CPU的
+guest_halt_poll_ns将保持高位）。
+
+默认值: Y
+
+模块参数可以从Debugfs文件中设置，在::
+
+	/sys/module/haltpoll/parameters/
+
+进一步说明
+==========
+
+- 在设置guest_halt_poll_ns参数时应该小心，因为一个大的值有可能使机器上的cpu使用率
+  达到100%，否则几乎是完全空闲的。
diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
index 6adda3fba6e0..1c602b8638f5 100644
--- a/Documentation/translations/zh_CN/virt/index.rst
+++ b/Documentation/translations/zh_CN/virt/index.rst
@@ -21,12 +21,12 @@ Linux虚拟化支持
    :maxdepth: 2
 
    paravirt_ops
+   guest-halt-polling
 
 TODOLIST:
 
    kvm/index
    uml/user_mode_linux_howto_v2
-   guest-halt-polling
    ne_overview
    acrn/index
 
-- 
2.27.0

