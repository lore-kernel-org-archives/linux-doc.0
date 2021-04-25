Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1,WEIRD_QUOTING
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EA5C433B4
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 02:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82B3661422
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 02:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhDYC0w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Apr 2021 22:26:52 -0400
Received: from m32-153.88.com ([43.250.32.153]:29784 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229514AbhDYC0u (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 24 Apr 2021 22:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=6c97WL3BzTPEf5MmjpP4iMbxCruksEpIYTbBk
        /xMAeo=; b=R202HwRTGra0qvm58GRnV0DeLiufdHCMFuCre+9j8AiR2AI7lrb2y
        EUU2iI8ZTkbOS3WCMtyVurHgIEdlF+yZHC3cbv6dl4l1OT/fVtlacERert5KZssX
        oOb8drKD4xCpKXSkAHJiPrmp9yMYfYAexrj5O2DpwvWUs0pEsSnArI=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHVlg+04RgrHoJAA--.26154S2;
        Sun, 25 Apr 2021 10:26:07 +0800 (CST)
Date:   Sun, 25 Apr 2021 10:26:05 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH v2 3/6] docs/zh_CN: Add translation
 zh_CN/maintainer/rebasing-and-merging.rst
Message-ID: <39df0b733dcbce32b725661c11617e0aa5523d9b.1619278582.git.bobwxc@email.cn>
References: <cover.1619278582.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1619278582.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHVlg+04RgrHoJAA--.26154S2
X-Coremail-Antispam: 1UD129KBjvAXoW3Zw1kZw47ur4rGr1DJw43Jrb_yoW8GrWDKo
        ZYk34Y9wsrGan8tFW3ua18ZasrursayF45ZrsFyF43Cr13Ww1Fv3WktwnxGr93urZ0kF4f
        X34xGFWYgFWUAFy3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5k7k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Gr1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x0zREtC7UUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst
and link it to zh_CN/maintainer/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/maintainer/index.rst   |   2 +-
 .../zh_CN/maintainer/rebasing-and-merging.rst | 166 ++++++++++++++++++
 2 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst

diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
index e263315f5e7a..21ab7cebf78b 100644
--- a/Documentation/translations/zh_CN/maintainer/index.rst
+++ b/Documentation/translations/zh_CN/maintainer/index.rst
@@ -14,10 +14,10 @@
    :maxdepth: 2
 
    configure-git
+   rebasing-and-merging
 
 TODOList:
 
--   rebasing-and-merging
 -   pull-requests
 -   maintainer-entry-profile
 -   modifying-patches
diff --git a/Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst b/Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst
new file mode 100644
index 000000000000..096c5115ca01
--- /dev/null
+++ b/Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst
@@ -0,0 +1,166 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/maintainer/rebasing-and-merging.rst
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+==========
+变基与合并
+==========
+
+一般来说，维护子系统需要熟悉Git源代码管理系统。Git是一个功能强大的工具，有
+很多功能；就像这类工具常出现的情况一样，使用这些功能的方法有对有错。本文档
+特别介绍了变基与合并的用法。维护者经常在错误使用这些工具时遇到麻烦，但避免
+问题实际上并不那么困难。
+
+总的来说，需要注意的一点是：与许多其他项目不同，内核社区并不害怕在其开发历史
+中看到合并提交。事实上，考虑到该项目的规模，避免合并几乎是不可能的。维护者会
+在希望避免合并时遇到一些问题，而过于频繁的合并也会带来另一些问题。
+
+变基
+====
+
+“变基（Rebase）”是更改存储库中一系列提交的历史记录的过程。有两种不同型的操作
+都被称为变基，因为这两种操作都使用 ``git rebase`` 命令，但它们之间存在显著
+差异：
+
+ - 更改生成一系列修补程序的父（开始）提交。例如，变基操作可以将基于上一
+   内核版本的一个补丁集重建到当前版本上。在下面的讨论中，我们将此操作称为
+   “变根”。
+
+ - 通过修复（或删除）损坏的提交、添加补丁、添加标记以更改一系列补丁的历史，
+   来提交变更日志或更改已应用提交的顺序。在下文中，这种类型的操作称为“历史
+   修改”
+
+术语“变基”将用于指代上述两种操作。如果使用得当，变基可以产生更清晰、更整洁的
+开发历史；如果使用不当，它可能会模糊历史并引入错误。
+
+以下一些经验法则可以帮助开发者避免最糟糕的变基风险：
+
+ - 已经发布到你私人系统之外世界的历史通常不应更改。其他人可能会拉取你的树
+   的副本，然后基于它进行工作；修改你的树会给他们带来麻烦。如果工作需要变基，
+   这通常是表明它还没有准备好提交到公共存储库的信号。
+
+   但是，总有例外。有些树（linux-next是一个典型的例子）由于它们的需要经常
+   变基，开发人员知道不要基于它们来工作。开发人员有时会公开一个不稳定的分支，
+   供其他人或自动测试服务进行测试。如果您确实以这种方式公开了一个可能不稳定
+   的分支，请确保潜在使用者知道不要基于它来工作。
+
+ - 不要在包含由他人创建的历史的分支上变基。如果你从别的开发者的仓库拉取了变更，
+   那你现在就成了他们历史记录的保管人。你不应该改变它，除了少数例外情况。例如
+   树中有问题的提交必须显式恢复（即通过另一个补丁修复），而不是通过修改历史而
+   消失。
+
+ - 没有合理理由，不要对树变根。仅为了切换到更新的基或避免与上游储存库的合并
+   通常不是合理理由。
+
+ - 如果你必须对储存库进行变根，请不要随机选取一个提交作为新基。在发布节点之间
+   内核通常处于一个相对不稳定的状态；基于其中某点进行开发会增加遇到意外错误的
+   几率。当一系列补丁必须移动到新基时，请选择移动到一个稳定节点（例如-rc版本
+   节点）。
+
+ - 请知悉对补丁系列进行变根（或做明显的历史修改）会改变它们的开发环境，且很
+   可能使做过的大部分测试失效。一般来说，变基后的补丁系列应当像新代码一样对
+   待，并重新测试。
+
+合并窗口麻烦的一个常见原因是，Linus收到了一个明显在拉取请求发送之前不久才变根
+（通常是变根到随机的提交上）的补丁系列。这样一个系列被充分测试的可能性相对较
+低，拉取请求被接受的几率也同样较低。
+
+相反，如果变基仅限于私有树、提交基于一个通用的起点、且经过充分测试，则引起
+麻烦的可能性就很低。
+
+合并
+====
+
+内核开发过程中，合并是一个很常见的操作；5.1版本开发周期中有超过1126个合并
+——差不多占了整体的9%。内核开发工作积累在100多个不同的子系统树中，每个
+子系统树都可能包含多个主题分支；每个分支通常独立于其他分支进行开发。因此
+在任何给定分支进入上游储存库之前，至少需要一次合并。
+
+许多项目要求拉取请求中的分支基于当前主干，这样历史记录中就不会出现合并提交。
+内核并不是这样；任何为了避免合并而重新对分支变基都很可能导致麻烦。
+
+子系统维护人员发现他们必须进行两种类型的合并：从较低层级的子系统树和从其他
+子系统树（同级树或主线）进行合并。这两种情况下要遵循的最佳实践是不同的。
+
+合并较低层级树
+--------------
+
+较大的子系统往往有多个级别的维护人员，较低级别的维护人员向较高级别发送拉取
+请求。合并这样的请求执行几乎肯定会生成一个合并提交；这也是应该的。实际上，
+子系统维护人员可能希望在极少数快进合并情况下使用 ``-–no-ff`` 标志来强制添加
+合并提交，以便记录合并的原因。 **任何** 类型的合并的变更日志必须说明
+*为什么* 合并。对于较低级别的树，“为什么”通常是对该取所带来的变化的总结。
+
+各级维护人员都应在他们的拉取请求上使用经签名的标签，上游维护人员应在拉取分支
+时验证标签。不这样做会威胁整个开发过程的安全。
+
+根据上面列出的规则，一旦您将其他人的历史记录合并到树中，您就不得对该分支进行
+变基，即使您能够这样做。
+
+合并同级树或上游树
+------------------
+
+虽然来自下游的合并是常见且不起眼的，但当需要将一个分支推向上游时，其中来自
+其他树的合并往往是一个危险信号。这种合并需要仔细考虑并加以充分证明，否则后续
+的拉取请求很可能会被拒绝。
+
+想要将主分支合并到存储库中是很自然的；这种类型的合并通常被称为“反向合并”
+。反向合并有助于确保与并行的开发没有冲突，并且通常会给人一种温暖、舒服的
+感觉，即处于最新。但这种诱惑几乎总是应该避免的。
+
+为什么呢？反向合并将搅乱你自己分支的开发历史。它们会大大增加你遇到来自社区
+其他地方的错误的机会，且使你很难确保你所管理的工作稳定并准备好合入上游。
+频繁的合并还可以掩盖树中开发过程中的问题；它们会隐藏与其他树的交互，而这些
+交互不应该（经常）发生在管理良好的分支中。
+
+也就是说，偶尔需要进行反向合并；当这种情况发生时，一定要在提交信息中记录
+*为什么* 。同样，在一个众所周知的稳定点进行合并，而不是随机提交。即使这样，
+你也不应该反向合并一棵比你的直接上游树更高层级的树；如果确实需要更高级别的
+反向合并，应首先在上游树进行。
+
+导致合并相关问题最常见的原因之一是：在发送拉取请求之前维护者合并上游以解决
+合并冲突。同样，这种诱惑很容易理解，但绝对应该避免。对于最终拉取请求来说
+尤其如此：Linus坚信他更愿意看到合并冲突，而不是不必要的反向合并。看到冲突
+可以让他了解潜在的问题所在。他做过很多合并（在5.1版本开发周期中是382次），
+而且在解决冲突方面也很在行——通常比参与的开发人员要强。
+
+那么，当他们的子系统分支和主线之间发生冲突时，维护人员应该怎么做呢？最重要
+的一步是在拉取请求中提示Linus会发生冲突；如果啥都没说则表明您的分支可以正常
+合入。对于特别困难的冲突，创建并推送一个 *独立* 分支来展示你将如何解决问题。
+在拉取请求中提到该分支，但是请求本身应该针对未合并的分支。
+
+即使不存在已知冲突，在发送拉取请求之前进行合并测试也是个好主意。它可能会提醒
+您一些在linux-next树中没有发现的问题，并帮助您准确地理解您正在要求上游做什么。
+
+合并上游树或另一个子系统树的另一个原因是解决依赖关系。这些依赖性问题有时确实
+会发生，而且有时与另一棵树交叉合并是解决这些问题的最佳方法；同样，在这种情况
+下，合并提交应该解释为什么要进行合并。花点时间把它做好；会有人阅读这些变更
+日志。
+
+然而依赖性问题通常表明需要改变方法。合并另一个子系统树以解决依赖性风险会带来
+其他缺陷，几乎永远不应这样做。如果该子系统树无法被合到上游，那么它的任何问题
+也都会阻碍你的树合并。更可取的选择包括与维护人员达成一致意见，在其中一个树中
+同时进行两组更改；或者创建一个主题分支专门处理可以合并到两个树中的先决条件提交。
+如果依赖关系与主要的基础结构更改相关，正确的解决方案可能是将依赖提交保留一个
+开发周期，以便这些更改有时间在主线上稳定。
+
+最后
+====
+
+在开发周期的开头合并主线是比较常见的，可以获取树中其他地方的更改和修复。同样，
+这样的合并应该选择一个众所周知的发布点，而不是一些随机点。如果在合并窗口期间
+上游分支已完全清空到主线中，则可以使用以下命令向前拉取它::
+
+  git merge v5.2-rc1^0
+
+“^0”使Git执行快进合并（在这种情况下这应该可以），从而避免多余的虚假合并提交。
+
+上面列出的就是指导方针了。总是会有一些情况需要不同的解决方案，这些指导原则
+不应阻止开发人员在需要时做正确的事情。但是，我们应该时刻考虑是否真的出现了
+这样的需求，并准备好解释为什么需要做一些不寻常的事情。
-- 
2.20.1

