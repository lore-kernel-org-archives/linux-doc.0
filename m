Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024E4C433ED
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:03:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF042613BC
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbhDFHDI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 03:03:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57276 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234664AbhDFHDH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:03:07 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax_ciRB2xgbLYEAA--.5852S6;
        Tue, 06 Apr 2021 15:02:49 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 4/8] docs/zh_CN: add cpu-freq index.rst translation
Date:   Tue,  6 Apr 2021 15:02:35 +0800
Message-Id: <20210406070239.19910-5-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406070239.19910-1-siyanteng@loongson.cn>
References: <20210406070239.19910-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax_ciRB2xgbLYEAA--.5852S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15WF4xZF48CrW7GFWktFb_yoW8ZF4kpF
        n0grWfGF4UJFyxZrZ3WF17GF15X3Z7Cw47GF97Gw1FvFyUJF15tF1DtFW09a47Gr97ZFyU
        JFn7JrWv9ry8ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
        0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
        SdkUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documention/cpu-freq/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/cpu-freq/index.rst     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/cpu-freq/index.rst

diff --git a/Documentation/translations/zh_CN/cpu-freq/index.rst b/Documentation/translations/zh_CN/cpu-freq/index.rst
new file mode 100644
index 000000000000..39d4b058fd7f
--- /dev/null
+++ b/Documentation/translations/zh_CN/cpu-freq/index.rst
@@ -0,0 +1,45 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../cpu-freq/index`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_index.rst:
+
+
+=======================================================
+Linux CPUFreq - Linux(TM)内核中的CPU频率和电压升降代码
+=======================================================
+
+Author: Dominik Brodowski  <linux@brodo.de>
+
+      时钟升降允许你在运行中改变CPU的时钟速度。这是一个很好的节省电池电量的方法，因为时
+      钟速度越低，CPU消耗的电量越少。
+
+
+.. toctree::
+   :maxdepth: 1
+
+   core
+   cpu-drivers
+   cpufreq-stats
+
+邮件列表
+------------
+这里有一个 CPU 频率变化的 CVS 提交和通用列表，您可以在这里报告bug、问题或提交补丁。要发
+布消息，请发送电子邮件到 linux-pm@vger.kernel.org。
+
+链接
+-----
+FTP档案:
+* ftp://ftp.linux.org.uk/pub/linux/cpufreq/
+
+如何访问CVS仓库:
+* http://cvs.arm.linux.org.uk/
+
+CPUFreq邮件列表:
+* http://vger.kernel.org/vger-lists.html#linux-pm
+
+SA-1100的时钟和电压标度:
+* http://www.lartmaker.nl/projects/scaling
-- 
2.25.1

