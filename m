Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C18C54EBD
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 13:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjALNEJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 08:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbjALNDo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 08:03:44 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2FC672669
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 05:03:41 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.33])
        by gateway (Coremail) with SMTP id _____8Dxi+orBcBjODwBAA--.3887S3;
        Thu, 12 Jan 2023 21:03:39 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.33])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxg+UqBcBjo20YAA--.10283S2;
        Thu, 12 Jan 2023 21:03:38 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        tangyeechou@gmail.com, me@lirui.org, siyanteng01@gmail.com
Subject: [PATCH v2] docs/zh_CN: Add a glossary of Chinese translation terms
Date:   Thu, 12 Jan 2023 21:03:55 +0800
Message-Id: <20230112130355.696111-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxg+UqBcBjo20YAA--.10283S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZF1rCw18Kw4UCrWUKr1UAwb_yoW5Cw4kpr
        yUGFyxKa1xAF12kryfur1UWr1fK3WxG3y5Kry7Kwnaqr4DAFs5tF98KryUta97Jry8Cayj
        vF4F9FW8uw4jy37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
        6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
        0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
        c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
        v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
        07jFa0PUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As more and more documents are translated and some English
words are translated into different Chinese, it seems that
we need a glossary of Chinese translation terms.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
v2:

* Add more word entries under Yizhou's advice.
* 实体负载跟踪机制 -> 实体负载跟踪.

 Documentation/translations/zh_CN/glossary.rst | 36 +++++++++++++++++++
 Documentation/translations/zh_CN/index.rst    |  9 +++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/glossary.rst

diff --git a/Documentation/translations/zh_CN/glossary.rst b/Documentation/translations/zh_CN/glossary.rst
new file mode 100644
index 000000000000..b6d6676a1f83
--- /dev/null
+++ b/Documentation/translations/zh_CN/glossary.rst
@@ -0,0 +1,36 @@
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
+* DVFS: 动态电压频率升降。（Dynamic Voltage and Frequency Scaling）
+* EAS: 能耗感知调度。（Energy Aware Scheduling）
+* flush: 刷新，一般指对cache的冲洗操作。
+* fork: 创建。
+* futex: 快速用户互斥锁。（fast user mutex）
+* guest halt polling: 客户机停机轮询机制。
+* HugePage: 巨页。
+* hypervisor: 虚拟机超级管理器。
+* memory barriers: 内存屏障。
+* MIPS: 每秒百万指令。（Millions of Instructions Per Second）,注意与mips指令集区分开。
+* mutex: 互斥锁。
+* NUMA: 非统一内存访问。
+* OpenCAPI: 开放相干加速器处理器接口。（Open Coherent Accelerator Processor Interface）
+* OPP: 操作性能值。
+* overhead: 开销，一般指需要消耗的计算机资源。
+* PELT: 实体负载跟踪。（Per-Entity Load Tracking）
+* sched domain: 调度域。
+* semaphores: 信号量。
+* spinlock: 自旋锁。
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

