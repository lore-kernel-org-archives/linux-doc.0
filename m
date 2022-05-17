Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14C7C43217
	for <linux-doc@archiver.kernel.org>; Tue, 17 May 2022 17:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350013AbiEQRJt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 May 2022 13:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351416AbiEQRJU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 13:09:20 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D79506EA
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 10:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=1tueaQft9o0KNcFkKQtb/wSUwD9R1tYxzWUmf
        WDV4h0=; b=ekkSUOC8uH1Nuh6uYE0EdgMziwDlRSiM7z5irbxc/jOAXeRLNWpTZ
        sx80p7kIhy9+0EyQ9PJVizT1gr+Gx5wHeWLuBb03C0v2jijuVeqGRweGt+oeFwXs
        6t2ki6S/0GWzVl0s4Z9scrbXdrlXhL06cSf8ITPextu2r+W7UGov0k=
Received: from bobwxc.mipc (unknown [120.242.69.144])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgA3nb2x1oNilxSHAA--.7904S2;
        Wed, 18 May 2022 01:09:06 +0800 (CST)
Date:   Wed, 18 May 2022 01:09:05 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] docs/zh_CN: sync reporting-issues.rst
Message-ID: <7bd8932126dc970022c94249a64e6934b719b840.1652792205.git.bobwxc@email.cn>
References: <cover.1652792205.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1652792205.git.bobwxc@email.cn>
X-CM-TRANSID: LCKnCgA3nb2x1oNilxSHAA--.7904S2
X-Coremail-Antispam: 1UD129KBjvJXoW3tFyrAr1fZF1kJw4fWF17Jrb_yoWkJF1UpF
        ZFgryIk3W7CF1qk3y8Cr4xXa1akF48C3y3G3ykCw1fArn8GF9FyrsFqFyjqa4fWry8GFZ0
        vrZF9ryru342yFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8MxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
        0xZFpf9x07jtgA7UUUUU=
X-Originating-IP: [120.242.69.144]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sync zh_CN/admin-guide/reporting-issues.rst to newest version

commit 247097e2bbff4 ("docs: reporting-issues.rst: link new document
                       about regressions")

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/admin-guide/reporting-issues.rst    | 69 +++++++++++--------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst b/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
index 6cb098feed94..8b97e09652c5 100644
--- a/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
+++ b/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
@@ -1,13 +1,6 @@
 .. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
-..
-   If you want to distribute this text under CC-BY-4.0 only, please use 'The
-   Linux kernel developers' for author attribution and link this as source:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/admin-guide/reporting-issues.rst
-..
-   Note: Only the content of this RST file as found in the Linux kernel sources
-   is available under CC-BY-4.0, as versions of this text that were processed
-   (for example by the kernel's build system) might contain content taken from
-   files which use a more restrictive license.
+.. See the bottom of this file for additional redistribution information.
+
 
 .. include:: ../disclaimer-zh_CN.rst
 
@@ -300,17 +293,14 @@ Linus Torvalds和主要的Linux内核开发人员希望看到一些问题尽快
 报告过程中有一些“高优先级问题”的处理略有不同。有三种情况符合条件:回归、安全
 问题和非常严重的问题。
 
-如果在旧版本的Linux内核中工作的东西不能在新版本的Linux内核中工作，或者某种
-程度上在新版本的Linux内核中工作得更差，那么你就需要处理“回归”。因此，当一个
-在Linux 5.7中表现良好的WiFi驱动程序在5.8中表现不佳或根本不能工作时，这是一
-种回归。如果应用程序在新的内核中出现不稳定的现象，这也是一种回归，这可能是
-由于内核和用户空间之间的接口（如procfs和sysfs）发生不兼容的更改造成的。显著
-的性能降低或功耗增加也可以称为回归。但是请记住:新内核需要使用与旧内核相似的
-配置来构建（参见下面如何实现这一点）。这是因为内核开发人员在实现新特性时有
-时无法避免不兼容性；但是为了避免回归，这些特性必须在构建配置期间显式地启用。
+如果某个应用程序或实际用例在原先的Linux内核上运行良好，但在使用类似配置编译的
+较新版本上效果更差、或者根本不能用，那么你就需要处理回归问题。
+Documentation/admin-guide/reporting-regressions.rst 对此进行了更详细的解释。
+它还提供了很多你可能想知道的关于回归的其他信息；例如，它解释了如何将您的问题
+添加到回归跟踪列表中，以确保它不会被忽略。
 
 什么是安全问题留给您自己判断。在继续之前，请考虑阅读
-“Documentation/translations/zh_CN/admin-guide/security-bugs.rst”，
+Documentation/translations/zh_CN/admin-guide/security-bugs.rst ，
 因为它提供了如何最恰当地处理安全问题的额外细节。
 
 当发生了完全无法接受的糟糕事情时，此问题就是一个“非常严重的问题”。例如，
@@ -394,7 +384,7 @@ Linux内核破坏了它处理的数据或损坏了它运行的硬件。当内核
 核未被污染，那么它应该以“Not infected”结束；如果你看到“Tainted:”且后跟一些
 空格和字母，那就被污染了。
 
-如果你的内核被污染了，请阅读“Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst”
+如果你的内核被污染了，请阅读 Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst
 以找出原因。设法消除污染因素。通常是由以下三种因素之一引起的：
 
  1. 发生了一个可恢复的错误（“kernel Oops”），内核污染了自己，因为内核知道在
@@ -807,10 +797,10 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
 重现它。
 
 有一个叫做“二分”的过程可以来寻找变化，这在
-“Documentation/translations/zh_CN/admin-guide/bug-bisect.rst”文档中进行了详细
+Documentation/translations/zh_CN/admin-guide/bug-bisect.rst 文档中进行了详细
 的描述，这个过程通常需要你构建十到二十个内核镜像，每次都尝试在构建下一个镜像
 之前重现问题。是的，这需要花费一些时间，但不用担心，它比大多数人想象的要快得多。
-多亏了“binary search二进制搜索”，这将引导你在源代码管理系统中找到导致回归的提交。
+多亏了“binary search二分搜索”，这将引导你在源代码管理系统中找到导致回归的提交。
 一旦你找到它，就在网上搜索其主题、提交ID和缩短的提交ID（提交ID的前12个字符）。
 如果有的话，这将引导您找到关于它的现有报告。
 
@@ -828,9 +818,10 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
 当处理回归问题时，请确保你所面临的问题真的是由内核引起的，而不是由其他东西
 引起的，如上文所述。
 
-在整个过程中，请记住：只有当旧内核和新内核的配置相似时，问题才算回归。最好
-的方法是：把配置文件（``.config``）从旧的工作内核直接复制到你尝试的每个新内
-核版本。之后运行 ``make olddefconfig`` 来调整它以适应新版本的需要。
+在整个过程中，请记住：只有当旧内核和新内核的配置相似时，问题才算回归。这可以
+通过 ``make olddefconfig`` 来实现，详细解释参见
+Documentation/admin-guide/reporting-regressions.rst ；它还提供了大量其他您
+可能希望了解的有关回归的信息。
 
 
 撰写并发送报告
@@ -992,7 +983,7 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
 报告，请将报告的文本转发到这些地址；但请在报告的顶部加上注释，表明您提交了
 报告，并附上工单链接。
 
-更多信息请参见“Documentation/translations/zh_CN/admin-guide/security-bugs.rst”。
+更多信息请参见 Documentation/translations/zh_CN/admin-guide/security-bugs.rst 。
 
 
 发布报告后的责任
@@ -1206,7 +1197,7 @@ FLOSS 问题报告的人看，询问他们的意见。同时征求他们关于
 前一段基本粗略地概述了“二分”方法。一旦报告出来，您可能会被要求做一个正确的
 报告，因为它允许精确地定位导致问题的确切更改（然后很容易被恢复以快速修复问题）。
 因此如果时间允许，考虑立即进行适当的二分。有关如何详细信息，请参阅“对回归的
-特别关照”部分和文档“Documentation/translations/zh_CN/admin-guide/bug-bisect.rst”。
+特别关照”部分和文档 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst 。
 如果成功二分的话，请将“罪魁祸首”的作者添加到收件人中；同时抄送所有在
 signed-off-by链中的人，您可以在提交消息的末尾找到。
 
@@ -1225,7 +1216,7 @@ signed-off-by链中的人，您可以在提交消息的末尾找到。
 
 即使是微小的、看似明显的代码变化，有时也会带来新的、完全意想不到的问题。稳
 定版和长期支持内核的维护者非常清楚这一点，因此他们只对这些内核进行符合
-“Documentation/translations/zh_CN/process/stable-kernel-rules.rst”中所列出的
+Documentation/translations/zh_CN/process/stable-kernel-rules.rst 中所列出的
 规则的修改。
 
 复杂或有风险的修改不符合条件，因此只能应用于主线。其他的修复很容易被回溯到
@@ -1351,3 +1342,27 @@ signed-off-by链中的人，您可以在提交消息的末尾找到。
 向 Linux 内核开发者报告问题是很难的：这个文档的长度和复杂性以及字里行间的内
 涵都说明了这一点。但目前就是这样了。这篇文字的主要作者希望通过记录现状来为
 以后改善这种状况打下一些基础。
+
+
+..
+   end-of-content
+..
+   This English version of this document is maintained by Thorsten Leemhuis
+   <linux@leemhuis.info>. If you spot a typo or small mistake, feel free to
+   let him know directly and he'll fix it. For translation problems, please
+   contact with translators. You are free to do the same in a mostly informal
+   way if you want to contribute changes to the text, but for copyright
+   reasons please CC linux-doc@vger.kernel.org and "sign-off" your
+   contribution as Documentation/process/submitting-patches.rst outlines in
+   the section "Sign your work - the Developer's Certificate of Origin".
+..
+   This text is available under GPL-2.0+ or CC-BY-4.0, as stated at the top
+   of the file. If you want to distribute this text under CC-BY-4.0 only,
+   please use "The Linux kernel developers" for author attribution and link
+   this as source:
+   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/admin-guide/reporting-issues.rst
+..
+   Note: Only the content of this RST file as found in the Linux kernel sources
+   is available under CC-BY-4.0, as versions of this text that were processed
+   (for example by the kernel's build system) might contain content taken from
+   files which use a more restrictive license.
-- 
2.30.2

