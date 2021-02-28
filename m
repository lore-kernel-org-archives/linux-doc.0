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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37FAC433E0
	for <linux-doc@archiver.kernel.org>; Sun, 28 Feb 2021 05:41:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D7E964E01
	for <linux-doc@archiver.kernel.org>; Sun, 28 Feb 2021 05:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhB1Fli (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Feb 2021 00:41:38 -0500
Received: from m32-153.88.com ([43.250.32.153]:27570 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229610AbhB1Flh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 28 Feb 2021 00:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=0IU7nk0PizpZ4XbzXVCT1R/Ord9WSB/qSGb5z
        ijQaxk=; b=bPwkt3MSkziHkjko5zVM0QjobxFUxlxO2qmsATXT6IMtQ16U0phTy
        dEjTQHSOuSJgJs4WukvWEYMf9AcCnUdHQBjC/3TQ/Eyo5wYfp7c8MxtWrVU7jXge
        TBbAcp3ANeeFJs+ony4a2ulL6OtUnYwMYG8VEP0cQfaXpN9pQAqbZs=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAXoiLTLDtgnC4OAA--.28932S2;
        Sun, 28 Feb 2021 13:40:37 +0800 (CST)
Date:   Sun, 28 Feb 2021 13:40:35 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v2 8/9] docs/zh_CN: Improve zh_CN/process/7.AdvancedTopics
Message-ID: <9e36fadfc1852b92c5dfe921bd446bc2c8e69aa9.1614488009.git.bobwxc@email.cn>
References: <cover.1614488009.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1614488009.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAXoiLTLDtgnC4OAA--.28932S2
X-Coremail-Antispam: 1UD129KBjvAXoW3ZF1UZr1UCr1kGw1UXrW8Zwb_yoW8ArW3Go
        WYka1Sqw1kJ3y2qa1Ygws5GF9rurnYkF4fAws8GFnxAF1UGw1Fv3WkXrsxZrn093s0kF15
        J3yrGFWfWF45AFy3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU537k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42
        xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3U
        UUUU=
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve language and grammar of zh_CN/process/7.AdvancedTopics.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/process/7.AdvancedTopics.rst        | 121 ++++++++++--------
 1 file changed, 65 insertions(+), 56 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
index 2f0ef750746f..00a7f87e1b9c 100644
--- a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
@@ -1,7 +1,14 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: :ref:`Documentation/process/7.AdvancedTopics.rst <development_advancedtopics>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
+
+:Translator:
+
+ 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
+
+:校译:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
 
 .. _cn_development_advancedtopics:
 
@@ -15,110 +22,112 @@
 ---------------
 
 内核使用分布式版本控制始于2002年初，当时Linus首次开始使用专有的Bitkeeper应用
-程序。虽然bitkeeper存在争议，但它所体现的软件版本管理方法却肯定不是。分布式
-版本控制可以立即加速内核开发项目。在当前的时代，有几种免费的比特保持器替代品。
-无论好坏，内核项目都将Git作为其选择的工具。
+程序。虽然BitKeeper存在争议，但它所体现的软件版本管理方法却肯定不是。分布式
+版本控制可以立即加速内核开发项目。现在有好几种免费的BitKeeper替代品。
+但无论好坏，内核项目都已经选择了Git作为其工具。
 
-使用Git管理补丁可以使开发人员的生活更加轻松，尤其是随着补丁数量的增加。Git
-也有其粗糙的边缘和一定的危险，它是一个年轻和强大的工具，仍然在其开发人员完善
+使用Git管理补丁可以使开发人员的生活更加轻松，尤其是随着补丁数量的增长。Git
+也有其粗糙的边角和一定的危险性，它是一个年轻和强大的工具，仍然在其开发人员完善
 中。本文档不会试图教会读者如何使用git；这会是个巨长的文档。相反，这里的重点
-将是Git如何特别适合内核开发过程。想要加快Git的开发人员可以在以下网站上找到
-更多信息：
+将是Git如何特别适合内核开发过程。想要加快用Git速度的开发人员可以在以下网站上
+找到更多信息：
 
 	https://git-scm.com/
 
 	https://www.kernel.org/pub/software/scm/git/docs/user-manual.html
 
-在尝试使用它使补丁可供其他人使用之前，第一要务是阅读上述站点，对Git的工作
-方式有一个扎实的了解。使用Git的开发人员应该能够获得主线存储库的副本，探索
-修订历史，提交对树的更改，使用分支等。了解Git用于重写历史的工具（如Rebase）
-也很有用。Git有自己的术语和概念；Git的新用户应该了解refs、远程分支、索引、
-快进合并、推拉、分离头等。一开始可能有点吓人，但这些概念不难通过一点学习来
+同时网上也能找到各种各样的教程。
+
+在尝试使用它生成补丁供他人使用之前，第一要务是阅读上述网页，对Git的工作
+方式有一个扎实的了解。使用Git的开发人员应能进行拉取主线存储库的副本，查询
+修订历史，提交对树的更改，使用分支等操作。了解Git用于重写历史的工具（如rebase）
+也很有用。Git有自己的术语和概念；Git的新用户应该了解引用、远程分支、索引、
+快进合并、推拉、游离头等。一开始可能有点吓人，但这些概念不难通过一点学习来
 理解。
 
 使用git生成通过电子邮件提交的补丁是提高速度的一个很好的练习。
 
-当您准备好开始安装Git树供其他人查看时，您当然需要一个可以从中提取的服务器。
-如果您有一个可以访问Internet的系统，那么使用git守护进程设置这样的服务器相
-对简单。否则，免费的公共托管网站（例如github）开始出现在网络上。成熟的开发
-人员可以在kernel.org上获得一个帐户，但这些帐户并不容易找到；有关更多信息，
-请参阅 https://kernel.org/faq/
+当您准备好开始建立Git树供其他人查看时，无疑需要一个可以从中拉取的服务器。
+如果您有一个可以访问因特网的系统，那么使用git-daemon设置这样的服务器相
+对简单。同时，免费的公共托管网站（例如github）也开始出现在网络上。成熟的开发
+人员可以在kernel.org上获得一个帐户，但这些帐户并不容易得到；更多有关信息，
+请参阅 https://kernel.org/faq/ 。
 
 正常的Git工作流程涉及到许多分支的使用。每一条开发线都可以分为单独的“主题
-分支”，并独立维护。Git的分支机构很便宜，没有理由不免费使用它们。而且，在
-任何情况下，您都不应该在任何您打算让其他人从中受益的分支中进行开发。应该
-小心地创建公开可用的分支；当它们处于完整的形式并准备好运行时(而不是之前），
+分支”，并独立维护。Git的分支很容易使用，没有理由不使用它们。而且，在
+任何情况下，您都不应该在任何您打算让其他人从中拉取的分支中进行开发。应该
+小心地创建公开可用的分支；当开发分支处于完整状态并已准备好时(而不是之前）才
 合并开发分支的补丁。
 
 Git提供了一些强大的工具，可以让您重写开发历史。一个不方便的补丁（比如说，
 一个打破二分法的补丁，或者有其他一些明显的缺陷）可以在适当的位置修复，或者
-完全从历史中消失。一个补丁系列可以被重写，就好像它是在今天的主线之上写的
+完全从历史中消失。一个补丁系列可以被重写，就好像它是在今天的主线上写的
 一样，即使你已经花了几个月的时间在写它。可以透明地将更改从一个分支转移到另
 一个分支。等等。明智地使用git修改历史的能力可以帮助创建问题更少的干净补丁集。
 
-然而，过度使用这种能力可能会导致其他问题，而不仅仅是对创建完美项目历史的
-简单痴迷。重写历史将重写该历史中包含的更改，将经过测试（希望）的内核树变
-为未经测试的内核树。但是，除此之外，如果开发人员没有对项目历史的共享视图，
+然而，过度使用这种功能可能会导致其他问题，而不仅仅是对创建完美项目历史的
+简单痴迷。重写历史将重写该历史中包含的更改，将经过测试（希望如此）的内核树
+变为未经测试的内核树。除此之外，如果开发人员没有共享项目历史，
 他们就无法轻松地协作；如果您重写了其他开发人员拉入他们存储库的历史，您将
 使这些开发人员的生活更加困难。因此，这里有一个简单的经验法则：被导出到其他
-人的历史在此后通常被认为是不可变的。
+地方的历史在此后通常被认为是不可变的。
 
 因此，一旦将一组更改推送到公开可用的服务器上，就不应该重写这些更改。如果您
-尝试强制进行不会导致快进合并（即不共享同一历史记录的更改）的更改，Git将尝
-试强制执行此规则。可以重写此检查，有时可能需要重写导出的树。在树之间移动变
-更集以避免Linux-next中的冲突就是一个例子。但这种行为应该是罕见的。这就是为
+尝试强制进行无法快进合并的更改（即不共享同一历史记录的更改），Git将尝
+试强制执行此规则。这可能覆盖检查，有时甚至需要重写导出的树。在树之间移动变
+更集以避免linux-next中的冲突就是一个例子。但这种行为应该是罕见的。这就是为
 什么开发应该在私有分支中进行（必要时可以重写）并且只有在公共分支处于合理的
-高级状态时才转移到公共分支中的原因之一。
+较新状态时才转移到公共分支中的原因之一。
 
 当主线（或其他一组变更所基于的树）前进时，很容易与该树合并以保持领先地位。
 对于一个私有的分支，rebasing 可能是一个很容易跟上另一棵树的方法，但是一旦
-一棵树被导出到全世界，rebasing就不是一个选项。一旦发生这种情况，就必须进行
+一棵树被导出到外界，rebasing就不可取了。一旦发生这种情况，就必须进行
 完全合并（merge）。合并有时是很有意义的，但是过于频繁的合并会不必要地扰乱
-历史。在这种情况下，建议的技术是不经常合并，通常只在特定的发布点（如主线-rc
+历史。在这种情况下建议的做法是不要频繁合并，通常只在特定的发布点（如主线-rc
 发布）合并。如果您对特定的更改感到紧张，则可以始终在私有分支中执行测试合并。
-在这种情况下，git rerere 工具很有用；它记住合并冲突是如何解决的，这样您就
+在这种情况下，git “rerere”工具很有用；它能记住合并冲突是如何解决的，这样您就
 不必重复相同的工作。
 
 关于Git这样的工具的一个最大的反复抱怨是：补丁从一个存储库到另一个存储库的
 大量移动使得很容易陷入错误建议的变更中，这些变更避开审查雷达进入主线。当内
-核开发人员看到这种情况发生时，他们往往会感到不高兴；在Git树上放置未查看或
-主题外的补丁可能会影响您将来获取树的能力。引用Linus:
+核开发人员看到这种情况发生时，他们往往会感到不高兴；在Git树上放置未审阅或
+主题外的补丁可能会影响您将来让树被拉取的能力。引用Linus的话:
 
 ::
 
-        你可以给我发补丁，但要我从你哪里取一个Git补丁，我需要知道你知道
-        你在做什么，我需要能够相信事情而不去检查每个个人改变。
+   你可以给我发补丁，但当我从你那里拉取一个Git补丁时，我需要知道你清楚
+   自己在做什么，我需要能够相信事情而 *无需* 手动检查每个单独的更改。
 
 （http://lwn.net/articles/224135/）。
 
 为了避免这种情况，请确保给定分支中的所有补丁都与相关主题紧密相关；“驱动程序
 修复”分支不应更改核心内存管理代码。而且，最重要的是，不要使用Git树来绕过
-审查过程。不时的将树的摘要发布到相关的列表中，当时间合适时，请求
-Linux-next 中包含该树。
+审查过程。不时的将树的摘要发布到相关的列表中，在合适时候请求linux-next
+中包含该树。
 
-如果其他人开始发送补丁以包含到您的树中，不要忘记查看它们。还要确保您维护正确
-的作者信息； ``git am`` 工具在这方面做得最好，但是如果它通过第三方转发给您，
-您可能需要在补丁中添加“From：”行。
+如果其他人开始发送补丁以包含到您的树中，不要忘记审阅它们。还要确保您维护正确
+的作者信息； git “am”工具在这方面做得最好，但是如果补丁通过第三方转发给您，
+您可能需要在补丁中添加“From:”行。
 
-请求pull操作时，请务必提供所有相关信息：树的位置、要拉的分支以及拉操作将导致
-的更改。在这方面，git request pull 命令非常有用；它将按照其他开发人员的预期
-格式化请求，并检查以确保您记住了将这些更改推送到公共服务器。
+请求拉取时，请务必提供所有相关信息：树的位置、要拉取的分支以及拉取将导致
+的更改。在这方面 git request-pull 命令非常有用；它将按照其他开发人员的期望
+格式化请求，并检查以确保您已记得将这些更改推送到公共服务器。
 
-审查补丁
+审阅补丁
 --------
 
-一些读者当然会反对将本节与“高级主题”放在一起，因为即使是刚开始的内核开发人员
-也应该检查补丁。当然，学习如何在内核环境中编程没有比查看其他人发布的代码更好
-的方法了。此外，审阅者永远供不应求；通过查看代码，您可以对整个流程做出重大贡献。
+一些读者显然会反对将本节与“高级主题”放在一起，因为即使是刚开始的内核开发人员
+也应该审阅补丁。当然，没有比查看其他人发布的代码更好的方法来学习如何在内核环境
+中编程了。此外，审阅者永远供不应求；通过审阅代码，您可以对整个流程做出重大贡献。
 
-审查代码可能是一个令人生畏的前景，特别是对于一个新的内核开发人员来说，他们
+审查代码可能是一副令人生畏的图景，特别是对一个新的内核开发人员来说，他们
 可能会对公开询问代码感到紧张，而这些代码是由那些有更多经验的人发布的。不过，
-即使是最有经验的开发人员编写的代码也可以得到改进。也许对评审员（所有评审员）
-最好的建议是：把评审评论当成问题而不是批评。询问“在这条路径中如何释放锁？”
+即使是最有经验的开发人员编写的代码也可以得到改进。也许对（所有）审阅者
+最好的建议是：把审阅评论当成问题而不是批评。询问“在这条路径中如何释放锁？”
 总是比说“这里的锁是错误的”更好。
 
-不同的开发人员将从不同的角度审查代码。一些主要关注的是编码样式以及代码行是
-否有尾随空格。其他人将主要关注补丁作为一个整体实现的变更是否对内核有好处。
-然而，其他人会检查是否存在锁定问题、堆栈使用过度、可能的安全问题、在其他
+不同的开发人员将从不同的角度审查代码。部分人会主要关注代码风格以及代码行是
+否有尾随空格。其他人会主要关注补丁作为一个整体实现的变更是否对内核有好处。
+同时也有人会检查是否存在锁问题、堆栈使用过度、可能的安全问题、在其他
 地方发现的代码重复、足够的文档、对性能的不利影响、用户空间ABI更改等。所有
-类型的检查，如果它们导致更好的代码进入内核，都是受欢迎和值得的。
+类型的检查，只要它们能引导更好的代码进入内核，都是受欢迎和值得的。
-- 
2.20.1

