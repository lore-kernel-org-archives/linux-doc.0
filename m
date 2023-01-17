Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6229C63797
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 09:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbjAQJfe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 04:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236307AbjAQJeW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 04:34:22 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B1ACA15570
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 01:34:02 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.204])
        by gateway (Coremail) with SMTP id _____8BxKuqIa8ZjnxACAA--.6197S3;
        Tue, 17 Jan 2023 17:34:00 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.204])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxPuSGa8ZjqK0aAA--.15625S2;
        Tue, 17 Jan 2023 17:33:59 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, tangyeechou@gmail.com, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, me@lirui.org, siyanteng01@gmail.com
Subject: [PATCH v3] docs/zh_CN: Add a glossary of Chinese translation terms
Date:   Tue, 17 Jan 2023 17:34:16 +0800
Message-Id: <20230117093416.2262787-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuSGa8ZjqK0aAA--.15625S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxury7ZFW8AF1ftw48JFW7CFg_yoW5tF48pr
        y7KFyxKa1xAF12yr1fuF17Wr1fKa4xG3yYgr9FgwnIqr4DArZ5tF98Kryjqa97ArykCFWY
        vF4F9FW8u34Yy37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b3xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
        e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E
        5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
        W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
        1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
        0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
        U8CksDUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As more and more documents are translated and some English
words are translated into different Chinese, it seems that
we need a glossary of Chinese translation terms.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Tang Yizhou <tangyeechou@gmail.com>
Acked-by: Wu XiangCheng <bobwxc@email.cn>
---
v3:
* Modify "fork" under Alex's advice.
  fork: 创建。 -> fork: 创建, 通常指父进程创建子进程。

v2:

* Add more word entries under Yizhou's advice.
* 实体负载跟踪机制 -> 实体负载跟踪.
 Documentation/translations/zh_CN/glossary.rst | 36 +++++++++++++++++++
 Documentation/translations/zh_CN/index.rst    |  9 +++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/glossary.rst

diff --git a/Documentation/translations/zh_CN/glossary.rst b/Documentation/translations/zh_CN/glossary.rst
new file mode 100644
index 000000000000..24f094df97cd
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
+* fork: 创建, 通常指父进程创建子进程。
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
2.39.0

