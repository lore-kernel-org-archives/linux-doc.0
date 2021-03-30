Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FE4C433E1
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 11:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8AEA61921
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 11:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhC3Lsd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Mar 2021 07:48:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46688 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232240AbhC3Lro (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 30 Mar 2021 07:47:44 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjSD2NgLF4CAA--.2278S6;
        Tue, 30 Mar 2021 19:47:35 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 4/8] docs/zh_CN: add cpu-freq index.rst translation
Date:   Tue, 30 Mar 2021 19:47:24 +0800
Message-Id: <20210330114728.2680-5-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330114728.2680-1-siyanteng@loongson.cn>
References: <20210330114728.2680-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxzcjSD2NgLF4CAA--.2278S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15WF4xZF48CrW7GFWktFb_yoW8Zry5pr
        n0grWfGF4UJFyxArZ3GF1UGF15X3Z7Cw47GF97Gw1FvFy8JF15tF1DtFW09a47Gr97ZFW8
        JFn7JrWv9ry8A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUbvD73UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documention/cpu-freq/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

