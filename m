Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F10C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 10:35:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8A53611CA
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 10:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236273AbhEQKgy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 06:36:54 -0400
Received: from [43.250.32.171] ([43.250.32.171]:5771 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S236047AbhEQKgy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 06:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=8XdNl6RlOwj4fgGks1E96HhP7ub8t08dzvdDf
        9csySc=; b=QUNC0K5QFNcJWFn5inZQuXD9ZRl7NAiWMzSCAAbVO98JZ4RXlHEn2
        hQ8qoi0tT8IlpKaUSUpyhm79bce3LxKTfB5xsxC6rOCwwyYe2L4OMXbI+c2f1IaH
        AiZS0MFYdCsHDhhlCbnrcJ9PclUSgPM4Lw5nsR+cEg17P8UqoAaFYY=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC3L0L1RqJg5uEuAA--.48626S2;
        Mon, 17 May 2021 18:35:35 +0800 (CST)
Date:   Mon, 17 May 2021 18:35:33 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 5/6] docs/zh_CN: Add translation
 zh_CN/maintainer/maintainer-entry-profile.rst
Message-ID: <e5b0838317cbc2f8fb3a9480f4604b6f099db975.1621243426.git.bobwxc@email.cn>
References: <cover.1621243426.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1621243426.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgC3L0L1RqJg5uEuAA--.48626S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr47XF1xZryUJw1rXryxZrb_yoW7KrWfpa
        42gr97GF18Jry5ZFW8GF1UJF15AFyxCrWUtrn7uas3XFn2yrW0vr4Ut3saya4fWrZ3uFW3
        ZF4fCFyrKwsYgFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRRJPEDUU
        UUU==
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
and link it to zh_CN/maintainer/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/maintainer/index.rst   |  2 +-
 .../maintainer/maintainer-entry-profile.rst   | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst

diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
index 1a1222b78715..18a820741f52 100644
--- a/Documentation/translations/zh_CN/maintainer/index.rst
+++ b/Documentation/translations/zh_CN/maintainer/index.rst
@@ -16,8 +16,8 @@
    configure-git
    rebasing-and-merging
    pull-requests
+   maintainer-entry-profile
 
 TODOList:
 
--   maintainer-entry-profile
 -   modifying-patches
diff --git a/Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst b/Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
new file mode 100644
index 000000000000..a1ee99c4786e
--- /dev/null
+++ b/Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
@@ -0,0 +1,92 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/maintainer/maintainer-entry-profile.rst
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+.. _maintainerentryprofile_zh:
+
+维护者条目概要
+==============
+
+维护人员条目概要补充了顶层过程文档（提交补丁，提交驱动程序……），增加了子系
+统/设备驱动程序本地习惯以及有关补丁提交生命周期的相关内容。贡献者使用此文档
+来调整他们的期望和避免常见错误；维护人员可以使用这些信息超越子系统层面查看
+是否有机会汇聚到通用实践中。
+
+
+总览
+----
+
+提供了子系统如何操作的介绍。MAINTAINERS文件告诉了贡献者应发送某文件的补丁到哪，
+但它没有传达其他子系统的本地基础设施和机制以协助开发。
+
+请考虑以下问题：
+
+- 当补丁被本地树接纳或合并到上游时是否有通知？
+- 子系统是否使用patchwork实例？Patchwork状态变更是否有通知？
+- 是否有任何机器人或CI基础设施监视列表，或子系统是否使用自动测试反馈以便把
+  控接纳补丁？
+- 被拉入-next的Git分支是哪个？
+- 贡献者应针对哪个分支提交？
+- 是否链接到其他维护者条目概要？例如一个设备驱动可能指向其父子系统的条目。
+  这使得贡献者意识到某维护者可能对提交链中其他维护者负有的义务。
+
+
+提交检查单补遗
+--------------
+
+列出强制性和咨询性标准，超出通用标准“提交检查表，以便维护者检查一个补丁是否
+足够健康。例如：“通过checkpatch.pl，没有错误、没有警告。通过单元测试详见某处”。
+
+提交检查单补遗还可以包括有关硬件规格状态的详细信息。例如，子系统接受补丁之前
+是否需要考虑在某个修订版上发布的规范。
+
+
+开发周期的关键日期
+------------------
+
+提交者常常会误以为补丁可以在合并窗口关闭之前的任何时间发送，且下一个-rc1时仍
+可以。事实上，大多数补丁都需要在下一个合并窗口打开之前提前进入linux-next中。
+向提交者澄清关键日期（以-rc发布周为标志）以明确什么时候补丁会被考虑合并以及
+何时需要等待下一个-rc。
+
+至少需要讲明：
+
+- 最后一个可以提交新功能的-rc：
+  针对下一个合并窗口的新功能提交应该在此点之前首次发布以供考虑。在此时间点
+  之后提交的补丁应该明确他们的目标为下下个合并窗口，或者给出应加快进度被接受
+  的充足理由。通常新特性贡献者的提交应出现在-rc5之前。
+
+- 最后合并-rc：合并决策的最后期限。
+  向贡献者指出尚未接受的补丁集需要等待下下个合并窗口。当然，维护者没有义务
+  接受所有给定的补丁集，但是如果审阅在此时间点尚未结束，那么希望贡献者应该
+  等待并在下一个合并窗口重新提交。
+
+可选项：
+
+- 开发基线分支的首个-rc，列在概述部分，视为已为新提交做好准备。
+
+
+审阅节奏
+--------
+
+贡献者最担心的问题之一是：补丁集已发布却未收到反馈，应在多久后发送提醒。除了
+指定在重新提交之前要等待多长时间，还可以指示更新的首选样式；例如，重新发送
+整个系列，或私下发送提醒邮件。本节也可以列出本区域的代码审阅方式，以及获取
+不能直接从维护者那里得到的反馈的方法。
+
+
+现有概要
+--------
+
+这里列出了现有的维护人员条目概要；我们可能会想要在不久的将来做一些不同的事情。
+
+.. toctree::
+   :maxdepth: 1
+
+   ../doc-guide/maintainer-profile
+   ../../../nvdimm/maintainer-entry-profile
+   ../../../riscv/patch-acceptance
-- 
2.20.1

