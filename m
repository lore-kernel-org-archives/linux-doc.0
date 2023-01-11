Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BDCC46467
	for <linux-doc@archiver.kernel.org>; Wed, 11 Jan 2023 08:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbjAKIfY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Jan 2023 03:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236002AbjAKIfC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jan 2023 03:35:02 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2239813D55
        for <linux-doc@vger.kernel.org>; Wed, 11 Jan 2023 00:34:09 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.33])
        by gateway (Coremail) with SMTP id _____8CxzvB_dL5jy+kAAA--.3242S3;
        Wed, 11 Jan 2023 16:34:07 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.33])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxPuR+dL5j5dUXAA--.7495S2;
        Wed, 11 Jan 2023 16:34:07 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        tangyeechou@gmail.com, me@lirui.org, siyanteng01@gmail.com
Subject: [PATCH] docs/zh_CN: Add a glossary of Chinese translation terms
Date:   Wed, 11 Jan 2023 16:34:23 +0800
Message-Id: <20230111083423.513461-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuR+dL5j5dUXAA--.7495S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZr47Zw1xGrWkXF13WrWUtwb_yoW5WFyDpr
        yUKF93Ka1xAF13CrWfCr1UWr1ft3WxG3y2gFy2g3Zavr4DA39YqF98Kr98ta93J34rAa90
        qa1F9Fy8uw42y37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
        87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
        xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
        1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
        6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
        AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
        07jepB-UUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As more and more documents are translated and some English
words are translated into different Chinese, it seems that
we need a glossary of Chinese translation terms.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/glossary.rst | 31 +++++++++++++++++++
 Documentation/translations/zh_CN/index.rst    |  9 ++++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/glossary.rst

diff --git a/Documentation/translations/zh_CN/glossary.rst b/Documentation/translations/zh_CN/glossary.rst
new file mode 100644
index 000000000000..22b80367412c
--- /dev/null
+++ b/Documentation/translations/zh_CN/glossary.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+术语表
+======
+
+这不是一个完善的术语表，我们只是将有争议的和陌生的翻译词汇记录于此，
+它的篇幅应该根据内核文档翻译的需求而增加。新词条最好随翻译补丁一起
+提交，且仅在以下情况下收录新词条：
+
+        - 在翻译过程中遇到陌生词汇，且尚无翻译先例的；
+        - 在审阅过程中，针对某词条出现了不同的翻译意见；
+        - 使用频率不高的词条和首字母缩写类型的词条；
+        - 已经存在且有歧义的词条翻译。
+
+
+* atomic: 原子的，一般指不可中断的极小的临界区操作。
+* DVFS: 动态电压频率升降（Dynamic Voltage and Frequency Scaling）
+* EAS: 能耗感知调度（Energy Aware Scheduling）
+* flush: 刷新，一般指对cache的冲洗操作。
+* futex: 快速用户互斥锁（fast user mutex）
+* guest halt polling: 客户机停机轮询机制。
+* hypervisor: 虚拟机超级管理器
+* memory barriers: 内存屏障
+* MIPS: 每秒百万指令（Millions of Instructions Per Second）,注意与mips指令集区分开。
+* mutex: 互斥锁
+* OpenCAPI: 开放相干加速器处理器接口（Open Coherent Accelerator Processor Interface）
+* overhead: 开销，一般指需要消耗的计算机资源。
+* PELT: 实体负载跟踪机制（Per-Entity Load Tracking）
+* semaphores: 信号量
+* spinlock: 自旋锁
+* watermark: 水位，一般指页表的消耗水平。
diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 3660a3451c86..7c3216845b71 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -133,6 +133,15 @@ TODOList:
 
    staging/index
 
+术语表
+------
+
+.. toctree::
+   :maxdepth: 1
+
+   glossary
+
+
 索引和表格
 ----------
 
-- 
2.31.1

