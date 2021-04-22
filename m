Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C46C43461
	for <linux-doc@archiver.kernel.org>; Thu, 22 Apr 2021 12:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D0C961452
	for <linux-doc@archiver.kernel.org>; Thu, 22 Apr 2021 12:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235791AbhDVM2J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Apr 2021 08:28:09 -0400
Received: from m32-153.88.com ([43.250.32.153]:56642 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236174AbhDVM2J (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Apr 2021 08:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=DCjLJsGq9PalyN4R8DeQxCVMhEEcEopM4IY3L
        J8vRpQ=; b=nuzRDdG6dPJl9Db4ykJ0u1BAs/x0ZR5q3q4UjjDs7FS0R2F4fbtkh
        fUj1u8jMCwhqc6DDP0raRu7VTsyp2V3h4xV4YY9oex1OADaj+4RtKqtlp5xiEu4Z
        T6oTvoCxQJh0vWsXu4misr2oHKDGUGHCcTXo8heDraqvrolCPxJuZY=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBHl1mua4FgPFcEAA--.12567S2;
        Thu, 22 Apr 2021 20:27:28 +0800 (CST)
Date:   Thu, 22 Apr 2021 20:27:26 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH 4/6] docs/zh_CN: Add translation
 zh_CN/maintainer/pull-requests.rst
Message-ID: <a3964f4a3dd174bcaa7303c4c2078db99bb426ba.1619093668.git.bobwxc@email.cn>
References: <cover.1619093668.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1619093668.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBHl1mua4FgPFcEAA--.12567S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFWxuw48AFWDJF15ZrW8Zwb_yoWfuF43p3
        97Kr93Ka1xJ34DAFZ7GFWUCF15Gay3Cr43Crn2k3WrA34kJrWqyw1Dta4DWasxWry8CFWU
        Zr93Grs0yw4qvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Xr1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
        v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
        67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
        IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jGyIUUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/pull-requests.rst
and link it to zh_CN/maintainer/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/maintainer/index.rst   |   2 +-
 .../zh_CN/maintainer/pull-requests.rst        | 148 ++++++++++++++++++
 2 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/maintainer/pull-requests.rst

diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
index 21ab7cebf78b..1a1222b78715 100644
--- a/Documentation/translations/zh_CN/maintainer/index.rst
+++ b/Documentation/translations/zh_CN/maintainer/index.rst
@@ -15,9 +15,9 @@
 
    configure-git
    rebasing-and-merging
+   pull-requests
 
 TODOList:
 
--   pull-requests
 -   maintainer-entry-profile
 -   modifying-patches
diff --git a/Documentation/translations/zh_CN/maintainer/pull-requests.rst b/Documentation/translations/zh_CN/maintainer/pull-requests.rst
new file mode 100644
index 000000000000..7ed55708e09b
--- /dev/null
+++ b/Documentation/translations/zh_CN/maintainer/pull-requests.rst
@@ -0,0 +1,148 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/maintainer/pull-requests.rst
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+.. _pullrequests_zh:
+
+如何创建拉取请求
+================
+
+本章描述维护人员如何创建并向其他维护人员提交拉取请求。这对将更改从一个维护者
+树转移到另一个维护者树非常有用。
+
+本文档由Tobin C. Harding（当时他尚不是一名经验丰富的维护人员）编写，内容主要
+来自Greg Kroah Hartman和Linus Torvalds在LKML上的评论。Jonathan Corbet和Mauro
+Carvalho Chehab提出了一些建议和修改。错误不可避免，如有问题，请找Tobin C.
+Harding <me@tobin.cc>。
+
+原始邮件线程::
+
+	http://lkml.kernel.org/r/20171114110500.GA21175@kroah.com
+
+
+创建分支
+--------
+
+首先，您需要将希望包含拉取请求里的所有更改都放在单独分支中。通常您会基于您打算
+向其发送拉取请求的开发人员树中的某个分支。
+
+为了创建拉取请求，您必须首先标记刚刚创建的分支。建议您选择一个有意义的标记名，
+以即使过了一段时间您和他人仍能理解的方式。在名称中包含源子系统和目标内核版本
+的指示也是一个好的做法。
+
+Greg提供了以下内容。对于一个含有drivers/char中混杂事项、将应用于4.15-rc1内核的
+拉取请求，可以命名为 ``char-misc-4.15-rc1`` 。如果这样的标记会标注在名为
+``char-misc-next`` 的分支上，您将使用以下命令::
+
+	git tag -s char-misc-4.15-rc1 char-misc-next
+
+这将在 ``char-misc-next`` 分支的最后一个提交上创建一个名为 ``char-misc-4.15-rc1``
+的标记，并用您的gpg密钥签名（参见 Documentation/maintainer/configure-git.rst ）。
+
+Linus只接受基于签名过的标记的拉取请求。其他维护者可能会有所不同。
+
+当您运行上述命令时 ``git`` 会打开编辑器要求你描述一下这个标签。在本例中您需要
+描述拉取请求，所以请概述一下包含的内容，为什么要合并，是否完成任何测试。所有
+这些信息都将留在标记中，然后在维护者合并拉取请求时保留在合并提交中。所以把它
+写好，它将永远留在内核中。
+
+正如Linus所说::
+
+	不管怎么样，至少对我来说，重要的是 *消息* 。我需要知道我在拉取什么、
+	为什么我要拉取。我也希望将此消息用于合并消息，因此它不仅应该对我有
+	意义，也应该可以成为一个有意义的历史记录。
+
+	注意，如果拉取请求有一些不寻常的地方，请详细说明。如果你修改了并非
+	由你维护的文件，请解释 **为什么** 。我总会在差异中看到的，如果你不
+	提的话，我只会觉得分外可疑。当你在合并窗口后给我发新东西的时候，
+	（甚至是比较重大的错误修复），不仅需要解释做了什么、为什么这么做，
+	还请解释一下 **时间** 。为什么错过了合并窗口……
+
+	我会看你写在拉取请求邮件和签名标记里面的内容，所以根据你的工作流，
+	你可以在签名标记里面描述工作内容（也会自动放进拉取请求邮件），也
+	可以只在标记里面放个占位符，稍后在你实际发给我拉取请求时描述工作内容。
+
+	是的，我会编辑这些消息。部分因为我需要做一些琐碎的格式调整（整体缩进、
+	括号等），也因为此消息可能对我有意义（描述了冲突或一些个人问题）而对
+	合并提交信息上下文没啥意义，无噢耶我需要尽力让它有意义起来。我也会
+	修复一些拼写和语法错误，特别是非母语者（母语者也是;^）。但我也会删掉
+	或增加一些内容。
+
+			Linus
+
+Greg给出了一个拉取请求的例子::
+
+	Char/Misc patches for 4.15-rc1
+
+	Here is the big char/misc patch set for the 4.15-rc1 merge window.
+	Contained in here is the normal set of new functions added to all
+	of these crazy drivers, as well as the following brand new
+	subsystems:
+		- time_travel_controller: Finally a set of drivers for the
+		  latest time travel bus architecture that provides i/o to
+		  the CPU before it asked for it, allowing uninterrupted
+		  processing
+		- relativity_shifters: due to the affect that the
+		  time_travel_controllers have on the overall system, there
+		  was a need for a new set of relativity shifter drivers to
+		  accommodate the newly formed black holes that would
+		  threaten to suck CPUs into them.  This subsystem handles
+		  this in a way to successfully neutralize the problems.
+		  There is a Kconfig option to force these to be enabled
+		  when needed, so problems should not occur.
+
+	All of these patches have been successfully tested in the latest
+	linux-next releases, and the original problems that it found have
+	all been resolved (apologies to anyone living near Canberra for the
+	lack of the Kconfig options in the earlier versions of the
+	linux-next tree creations.)
+
+	Signed-off-by: Your-name-here <your_email@domain>
+
+
+此标记消息格式就像一个git提交。顶部有一行“总结标题”， 一定要在下面sign-off。
+
+现在您已经有了一个本地签名标记，您需要将它推送到可以被拉取的位置::
+
+	git push origin char-misc-4.15-rc1
+
+
+创建拉取请求
+------------
+
+最后要做的是创建拉取请求消息。可以使用 ``git request-pull`` 命令让 ``git``
+为你做这件事，但它需要确定你想拉取什么，以及拉取针对的基础（显示正确的拉取
+更改和变更状态）。以下命令将生成一个拉取请求::
+
+	git request-pull master git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/ char-misc-4.15-rc1
+
+引用Greg的话::
+
+	此命令要求git比较从“char-misc-4.15-rc1”标记位置到“master”分支头（上述
+	例子中指向了我从Linus的树分叉的地方，通常是-rc发布）的差异，并去使用
+	git:// 协议拉取。如果你希望使用 https:// 协议，也可以用在这里（但是请
+	注意，部分人由于防火墙问题没法用https协议拉取）。
+
+	如果char-misc-4.15-rc1标记没有出现在我要求拉取的仓库中，git会提醒
+	它不在那里，所以记得推送到公开地方。
+
+	“git request-pull”会包含git树的地址和需要拉取的特定标记，以及标记
+	描述全文（详尽描述标记）。同时它也会创建此拉取请求的差异状态和单个
+	提交的缩短日志。
+
+Linus回复说他倾向于 ``git://`` 协议。其他维护者可能有不同的偏好。另外，请注意
+如果你创建的拉取请求没有签名标记， ``https://`` 可能是更好的选择。完整的讨论
+请看原邮件。
+
+
+提交拉取请求
+------------
+
+拉取请求的提交方式与普通补丁相同。向维护人员发送内联电子邮件并抄送LKML以及
+任何必要特定子系统的列表。对Linus的拉取请求通常有如下主题行::
+
+	[GIT PULL] <subsystem> changes for v4.15-rc1
-- 
2.20.1

