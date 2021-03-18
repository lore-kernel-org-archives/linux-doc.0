Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B01C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 07:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC74164F10
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 07:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbhCRHUw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 03:20:52 -0400
Received: from [43.250.32.171] ([43.250.32.171]:40397 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229558AbhCRHUW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Mar 2021 03:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=CjJZUM2xkg6XQGiaWg1L6HsoNPL443aayjqDR
        lVfkzo=; b=cRULH//2908d+FFCI5c5UK90BPsNgroSgBmuNxfLFq66C5pDWcKeV
        ayFHvStBQBQrJ2riZbBklpu15RNgCq1ZvwLNpHWGbzAE/CggYHbHBtGPZhhcYAWb
        4YinUxdOwGfcmpznn0a1oJUmIeOOpVgvifKpXACR+9IZRKVjMEJ7t0=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgA3qtAr_1Jg3z0pAA--.31366S2;
        Thu, 18 Mar 2021 15:20:13 +0800 (CST)
Date:   Thu, 18 Mar 2021 15:20:11 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v2 4/6] docs/zh_CN: Add zh_CN/admin-guide/security-bugs.rst
Message-ID: <f4210d304fa3f0b2a6e9eb798f63bf2e267231a0.1616050069.git.bobwxc@email.cn>
References: <cover.1616050069.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1616050069.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgA3qtAr_1Jg3z0pAA--.31366S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr18tw15KFyxGw1xAr4rGrg_yoWxJr45pa
        sFkFyIgan7JFn8CFZa9r47Ja1xCrWfCw4fKay8G34fJF1kAr4vvr1qqr95WrZ3Z34rJay5
        ArW0kFW7ur1jkrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjxUUJ5rDUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add translation zh_CN/admin-guide/security-bugs.rst, and link it to
zh_CN/admin-guide/index.rst while clean its todo entry.

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../translations/zh_CN/admin-guide/index.rst  |  2 +-
 .../zh_CN/admin-guide/security-bugs.rst       | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/security-bugs.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index d487e8adb804..9669b32e90ef 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -36,13 +36,13 @@ Todolist:
    :maxdepth: 1
 
    reporting-issues
+   security-bugs
    bug-hunting
    bug-bisect
 
 Todolist:
 
    reporting-bugs
-   security-bugs
    tainted-kernels
    ramoops
    dynamic-debug-howto
diff --git a/Documentation/translations/zh_CN/admin-guide/security-bugs.rst b/Documentation/translations/zh_CN/admin-guide/security-bugs.rst
new file mode 100644
index 000000000000..b8120391755d
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/security-bugs.rst
@@ -0,0 +1,74 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../admin-guide/security-bugs`
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+安全缺陷
+=========
+
+Linux内核开发人员非常重视安全性。因此我们想知道何时发现了安全漏洞，以便尽快
+修复和披露。请向Linux内核安全团队报告安全漏洞。
+
+联络
+-----
+
+可以通过电子邮件<security@kernel.org>联系Linux内核安全团队。这是一个安全人员
+的私有列表，他们将帮助验证错误报告并开发和发布修复程序。如果您已经有了一个
+修复，请将其包含在您的报告中，这样可以大大加快进程。安全团队可能会从区域维护
+人员那里获得额外的帮助，以理解和修复安全漏洞。
+
+与任何缺陷一样，提供的信息越多，诊断和修复就越容易。如果您不清楚哪些信息有用，
+请查看“Documentation/translations/zh_CN/admin-guide/reporting-issues.rst”中
+概述的步骤。任何利用漏洞的攻击代码都非常有用，未经报告者同意不会对外发布，除
+非已经公开。
+
+请尽可能发送无附件的纯文本电子邮件。如果所有的细节都藏在附件里，那么就很难对
+一个复杂的问题进行上下文引用的讨论。把它想象成一个
+:doc:`常规的补丁提交 <../process/submitting-patches>` （即使你还没有补丁）：
+描述问题和影响，列出复现步骤，然后给出一个建议的解决方案，所有这些都是纯文本的。
+
+披露和限制信息
+---------------
+
+安全列表不是公开渠道。为此，请参见下面的协作。
+
+一旦开发出了健壮的补丁，发布过程就开始了。对公开的缺陷的修复会立即发布。
+
+尽管我们倾向于在未公开缺陷的修复可用时即发布补丁，但应报告者或受影响方的请求，
+这可能会被推迟到发布过程开始后的7日内，如果根据缺陷的严重性需要更多的时间，
+则可额外延长到14天。推迟发布修复的唯一有效原因是为了适应QA的逻辑和需要发布
+协调的大规模部署。
+
+虽然可能与受信任的个人共享受限信息以开发修复，但未经报告者许可，此类信息不会
+与修复程序一起发布或发布在任何其他披露渠道上。这包括但不限于原始错误报告和
+后续讨论（如有）、漏洞、CVE信息或报告者的身份。
+
+换句话说，我们唯一感兴趣的是修复缺陷。提交给安全列表的所有其他资料以及对报告
+的任何后续讨论，即使在解除限制之后，也将永久保密。
+
+协调
+------
+
+对敏感缺陷（例如那些可能导致权限提升的缺陷）的修复可能需要与私有邮件列表
+<linux-distros@vs.openwall.org>进行协调，以便分发供应商做好准备，在公开披露
+上游补丁时发布一个已修复的内核。发行版将需要一些时间来测试建议的补丁，通常
+会要求至少几天的限制，而供应商更新发布更倾向于周二至周四。若合适，安全团队
+可以协助这种协调，或者报告者可以从一开始就包括linux发行版。在这种情况下，请
+记住在电子邮件主题行前面加上“[vs]”，如linux发行版wiki中所述：
+<http://oss-security.openwall.org/wiki/mailing-lists/distros#how-to-use-the-lists>。
+
+CVE分配
+--------
+
+安全团队通常不分配CVE，我们也不需要它们来进行报告或修复，因为这会使过程不必
+要的复杂化，并可能耽误缺陷处理。如果报告者希望在公开披露之前分配一个CVE编号，
+他们需要联系上述的私有linux-distros列表。当在提供补丁之前已有这样的CVE编号时，
+如报告者愿意，最好在提交消息中提及它。
+
+保密协议
+---------
+
+Linux内核安全团队不是一个正式的机构实体，因此无法签订任何保密协议。
-- 
2.20.1

