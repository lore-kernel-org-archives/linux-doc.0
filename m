Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF47C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 22 Apr 2021 12:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41BE861463
	for <linux-doc@archiver.kernel.org>; Thu, 22 Apr 2021 12:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236337AbhDVM23 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Apr 2021 08:28:29 -0400
Received: from [43.250.32.171] ([43.250.32.171]:28251 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S236338AbhDVM21 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Apr 2021 08:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=QgIoqH1bORRCEDce/h3NxN2AAtIuKvKth6n7v
        y83+AM=; b=W/kjfB/WoBpkKoFStMVyqvKYclpA2VfbvM1ibhzsjU6H0Y6A447gD
        +NkPzzd6VxbJCcur2P8SNJl8wXjhXtl8cvnDzA9Ht+EflJzgfncT9XfUtEVYw3zH
        6feeXkbXWWgyvtsaiaOxcWbGQvqDjcy9jqkN19ddeh3mdVOSnbUt9U=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBnLkHAa4FghfQDAA--.12087S2;
        Thu, 22 Apr 2021 20:27:46 +0800 (CST)
Date:   Thu, 22 Apr 2021 20:27:44 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH 5/6] docs/zh_CN: Add translation
 zh_CN/maintainer/maintainer-entry-profile.rst
Message-ID: <9ba8f3c4e086bedf8052fb33e597636f4828e00d.1619093668.git.bobwxc@email.cn>
References: <cover.1619093668.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1619093668.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBnLkHAa4FghfQDAA--.12087S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFWxZr15Gry8Wr45KF47twb_yoW7tw4rpa
        42gr97GF18Jr98ZFW8GF1UJF15AFyxCrWUtrn7uas3XFn2yrW0vF4Ut3saya4fWrZ3uFW3
        ZF4fCFyrKwsYgFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Xr1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
        v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
        67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
        IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UY_M-UUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
and link it to zh_CN/maintainer/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
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

