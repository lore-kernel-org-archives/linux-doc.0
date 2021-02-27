Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0650FC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 27 Feb 2021 06:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFB5B64EB3
	for <linux-doc@archiver.kernel.org>; Sat, 27 Feb 2021 06:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhB0G3S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Feb 2021 01:29:18 -0500
Received: from [43.250.32.171] ([43.250.32.171]:57421 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229554AbhB0G3M (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 27 Feb 2021 01:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=t1trTU56HBQf2S3Wn/uRf4Fj0eHxdYb7ojBAB
        D1dsS0=; b=eklA4vpS4wfLrzhKLTjRcMVU8lLXE/ccGXHIqzgR2JPxAbBpKL8dr
        ud3AapScr74+WGpnOc3q427RhqByUF+GqUaKzZmj+QcumytRUPMJDT9/DXenzJfO
        on3atYxPixScVjv16RXrbawPr6+LYY1egGZLlSAv/2eIUlX/WjQp34=
Received: from mipc (unknown [110.64.86.229])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB36c+A5jlg1l4IAA--.20688S2;
        Sat, 27 Feb 2021 14:28:18 +0800 (CST)
Date:   Sat, 27 Feb 2021 14:28:16 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 0/9] docs/zh_CN: Improve language in zh_CN/process/
Message-ID: <20210227062814.GB3863@mipc>
References: <cover.1614162064.git.bobwxc@email.cn>
 <770b71b2-e32b-c640-755a-3efb1e957823@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <770b71b2-e32b-c640-755a-3efb1e957823@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB36c+A5jlg1l4IAA--.20688S2
X-Coremail-Antispam: 1UD129KBjvAXoWDWw1xJFy7Zr4xtw4xKrWDCFg_yoWrCF4kWo
        WfC39avw4ktayUtF4Ykws8GFyDW3Z5Ar1fZw4Ygr43Zr15Xws5A3Z5CanxXFWavrW5CF45
        JryxG3W3GF43AFy3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5V7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42
        xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUnLSdPUU
        UUU==
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 26, 2021 at 04:21:41PM +0800, Alex Shi wrote:
> 
> 
> 在 2021/2/24 下午6:29, Wu XiangCheng 写道:
> > Hi all,
> > 
> > This set of patchs aims to fix some grammatical errors, translation errors
> > and improper use of words problems in some files in zh_CN/process/, and
> > synchronize them with original files. Some structure modifications need to
> > rewrite the wholesentences, so here are a lot of changes.
> 
> It's better to say your changes polishing context, improve on fluency
> and idiomatic， not correct 'errors'.
>
OK, thanks for the good advice. Adopted in next version.

And there will be no more improve patchs, that's all for this time. :D
> 
> > 
> > * V0
> > [Patch 1~5/9] have been reviewed by Alex Shi, and been modified under his
> > suggestions except one. Thanks for his kind help! Previous discussions
> > see:  <https://lore.kernel.org/linux-doc/20210219090947.GA15328@mipc/>
> > 
> 
> Would you like highlight the unaccept one? It could save reviewer much time.
>
As describled below (9.).
> 
> > [Patch 2/9]
> >>>>> 9.
> >>>>> (such as code which derives from reverse-engineering efforts lacking
> >>>>> proper safeguards)
> >>>>> -相关问题的代码（例如，由缺乏适当保护的反向工程工作派生的代码）不能被接受。
> >>>>> +内核造成版权相关问题的代码（例如，由缺乏适当保护的逆向工程工作派生的代码）
> >>>>
> >>>> Nope, 反向工程 is used a lot.
> >>> See，
> >>> 《计算机科学技术名词 (第三版)》
> >>> 规范用词：逆向工程
> >>> 英语名：  reverse engineering
> >>> 台湾名：  反向工程
> >>> 定义：    通过分析软件系统后期制品，获取更高抽象度的前期模型的过程。
> >>>           是软件开发周期的反向过程。
> >>> 学科： 	  计算机科学技术_软件工程
> >>> 公布年度：2018
> >>>   ——全国科学技术名词审定委员会
> >>
> >> search google online, I got "About 7,820,000 results (0.31 seconds)"
> >> for 逆向工程， and "About 64,900,000 results (0.33 seconds)" for 反向工程.
> >> Clearly the latter used more common.
> > If you search it on Baidu, you will get a opposite result, haha~ :)
> > The results are greatly influenced by search engines.
> > So please simply follow the standard.
> 
> standard is using, not in paper.
> still unnecessary.
>
Fine.
> 
> >> Let's pay more attention on interesting thing first. :)
> > 
> > * V1
> > Main changes:
> > 
> > [Patch 6/9] 5.Posting.rst
> > 29.
> > -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
> > +
> > +:Translator:
> > +
> > + 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> > +
> > +:校译:
> > +
> > + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> >     add this for all changed files.
> >  
> > 30.
> > Sooner or later, the time comes when your work is ready to be presented to
> > the community for review and, eventually, inclusion into the mainline
> > kernel.  Unsurprisingly, the kernel development community has evolved a set
> > -迟早，当您的工作准备好提交给社区进行审查，并最终包含到主线内核中时。不出所料，
> > +您的工作迟早会准备好提交给社区进行审查，并最终包含到主线内核中。毫不稀奇，
> >  内核开发社区已经发展出一套用于发布补丁的约定和过程；遵循这些约定和过程将使
> >     For fluent.
> > 
> > 31.
> > Unsurprisingly, the kernel development community has evolved a set
> > of conventions and procedures which are used in the posting of patches;
> > following them will make life much easier for everybody involved.  This
> > document will attempt to cover these expectations in reasonable detail;
> > more information can also be found in the files
> > -参与其中的每个人的生活更加轻松。本文件将试图合理详细地涵盖这些期望；更多信息
> > +参与其中的每个人的生活更加轻松。本文档试图描述这些约定的部分细节；更多信息
> >     I'm not sure if it's clearer？
> > 
> > 32.
> > -:ref:`Documentation/process/submitting-drivers.rst  <submittingdrivers>`
> > +:ref:`Documentation/translations/zh_CN/process/submitting-drivers.rst <cn_submittingdrivers>`
> >     There is already a Chinese version.
> > 
> > 33. 
> > There is a constant temptation to avoid posting patches before they are
> > completely "ready."  
> > -在补丁完全“准备好”之前，有一个不断的诱惑来避免发布补丁。对于简单的补丁，
> > +在补丁完全“准备好”之前，常有人一直坚持避免发布补丁。对于简单的补丁，
> >     This sentence is a bit difficult to translate. Any suggestion?
> 
> 在补丁完全“准备好”之前，避免发布补丁是一种持续的诱惑。？
> 
Ok.
> 
> > 
> > 34. 
> > When posting code which is not yet considered ready for inclusion, it is a
> > good idea to say so in the posting itself.  Also mention any major work
> > which remains to be done and any known problems.  Fewer people will look at
> > patches which are known to be half-baked, but those who do will come in
> > with the idea that they can help you drive the work in the right direction.
> > -当发布还没有准备好包含的代码时，最好在发布本身中这样说。还应提及任何有待完成
> > -的主要工作和任何已知问题。很少有人会看到那些被认为是半生不熟的补丁，但是那些
> > -人会想到他们可以帮助你把工作推向正确的方向。
> > +当发布中有尚未准备好被包含的代码，最好在发布中说明。还应提及任何有待完成
> > +的主要工作和任何已知问题。很少有人会愿意看那些被认为是半生不熟的补丁，但是
> > +那些愿意人会带着他们的点子来一起帮助你把工作推向正确的方向。
> >     For fluent.
> >  
> > 35. 
> > ensure that the kernel will build with all reasonable combinations of
> > configuration options
> > - - 尽可能地测试代码。利用内核的调试工具，确保内核使用所有合理的配置选项组合
> > + - 尽可能地测试代码。利用内核的调试工具，确保内核使用了所有可能的配置选项组合
> >     使用[了]所有[可能的]
> > 
> > 36.
> > The preparation of patches for posting can be a surprising amount of work,
> > but, once again, attempting to save time here is not generally advisable
> > even in the short term.
> > -准备发布补丁可能是一个惊人的工作量，但再次尝试节省时间在这里通常是不明智的，
> > -即使在短期内。
> > +准备补丁发布的工作量可能很惊人，但在此尝试节省时间通常是不明智的，
> > +即使在短期内亦然。
> >     For fluent.
> >  
> > 37.
> > It may become necessary to make versions against -mm, linux-next, or a
> > subsystem tree, though, to facilitate wider testing and review.  Depending
> > on the area of your patch and what is going on elsewhere, basing a patch
> > against these other trees can require a significant amount of work
> > resolving conflicts and dealing with API changes.
> > -但是，可能需要针对-mm、linux-next或子系统树生成版本，以便于更广泛的测试和审查。
> > -根据补丁的区域以及其他地方的情况，针对这些其他树建立补丁可能需要大量的工作来
> > +可能也需要针对-mm、linux-next或子系统树生成版本，以便于更广泛的测试和审查。
> > +根据补丁修改的区域以及其他情况，针对其他树建立的补丁可能需要大量的工作来
> >     For fluent.
> 
> don't see much different.
>
Thus keep it.
>
> > 
> > 38.
> >  - The patch series you post will almost certainly not be the series of
> >    changes found in your working revision control system.
> > - - 您发布的补丁程序系列几乎肯定不会是工作系统中的一系列更改。相反，您所做的
> > + - 您发布的补丁系列几乎肯定不会是工作区版本控制系统中的一系列更改。相反，需要对
> >     Correct.
> 
> still feel the older is better. '工作区‘ means working zone, which's not it
> original doc.
>
Or use 您发布的补丁系列几乎肯定不会是工作[时]版本控制系统中的一系列更改 ?
need to translate the 'revision control system'
> >
> > 39.
> >  - As a way of restating the guideline above: do not mix different types of
> >    changes in the same patch.  If a single patch fixes a critical security
> >    bug, rearranges a few structures, and reformats the code, there is a
> >    good chance that it will be passed over and the important fix will be
> >    lost.
> > - - 作为重申上述准则的一种方法：不要在同一补丁中混合不同类型的更改。如果一个
> > -   补丁修复了一个关键的安全漏洞，重新排列了一些结构，并重新格式化了代码，那么
> > -   很有可能它会被忽略，而重要的修复将丢失。
> > + - 换种方式重申上述准则，也就是说：不要在同一补丁中混合不同类型的更改。如果
> > +   一个补丁修复了一个关键的安全漏洞，又重新排列了一些结构，还重新格式化了代
> > +   码，那么它很有可能会被忽略，从而导致重要的修复丢失。
> >     For fluent.
> > 
> > 40.
> >  - Each patch should yield a kernel which builds and runs properly; if your
> >    patch series is interrupted in the middle, the result should still be a
> >    working kernel.  Partial application of a patch series is a common
> > - - 每个补丁都应该产生一个内核，它可以正确地构建和运行；如果补丁系列在中间被
> > -   中断，那么结果应该仍然是一个工作的内核。补丁系列的部分应用是使用
> > + - 每个补丁都应该能创建一个可以正确地构建和运行的内核；如果补丁系列在中间被
> > +   断开，那么结果仍应是一个正常工作的内核。部分应用一系列补丁是使用
> >     For fluent.
> > 
> > 
> > 41.
> >  - It can be tempting to add a whole new infrastructure with a series of
> >    patches, but to leave that infrastructure unused until the final patch
> >    in the series enables the whole thing.  This temptation should be
> > - - 用一系列补丁添加一个全新的基础设施是很有诱惑力的，但是在系列中的最后一个
> > -   补丁启用整个补丁之前，该基础设施是不使用的。如果可能的话，应该避免这种
> > + - 用一系列补丁添加一个全新的基础设施，但是该设施在系列中的最后一个补丁启用
> > +   整个变更之前不能使用，这看起来很诱人。如果可能的话，应该避免这种
> >     What is tempting? Only 'add a whole new infrastructure' or  the whole thing?
> > 
> > 42.
> > When done properly, though, it is time well spent.
> > -大量的时间和思考。但是，如果做得好，这是一段很好的时间。
> > +大量的时间和思考。但是如果做得好，花费的时间就是值得的。
> >  
> > 43.
> >  - An optional "From" line naming the author of the patch.  This line is
> >    only necessary if you are passing on somebody else's patch via email,
> >    but it never hurts to add it when in doubt.
> > - - 命名补丁作者的可选“from”行。只有当你通过电子邮件传递别人的补丁时，这一行
> > -   才是必要的，但是如果有疑问，添加它不会有任何伤害。
> > + - 可选的“From”行，表明补丁作者。只有当你通过电子邮件发送别人的补丁时，这一行
> > +   才是必须的，但是为防止疑问加上它也不会有什么坏处。
> > 
> > 44.
> >  - A one-line description of what the patch does.  This message should be
> >    enough for a reader who sees it with no other context to figure out the
> >    scope of the patch; it is the line that will show up in the "short form"
> >    changelogs.  This message is usually formatted with the relevant
> >    subsystem name first, followed by the purpose of the patch.  For
> >    example:
> > - - 一行描述补丁的作用。对于没有其他上下文的读者来说，此消息应该足够了解补丁
> > -   的范围；这是将在“短格式”变更日志中显示的行。此消息通常首先用相关的子系统
> > -   名称格式化，然后是补丁的目的。例如：
> > + - 一行描述，说明补丁的作用。对于在没有其他上下文的情况下看到该消息的读者来说，
> > +   该消息应足以确定修补程序的范围；此行将显示在“short form（简短格式）”变更
> > +   日志中。此消息通常需要先加上子系统名称前缀，然后是补丁的目的。例如：
> >     Correct.
> > 
> > 45.
> > -上面提到的标签用于描述各种开发人员如何与这个补丁的开发相关联。
> > +上面提到的标签（tag）用于描述各种开发人员如何与这个补丁的开发相关联。
> >     Add (tag)
> > 
> > 46.
> >  - Signed-off-by: this is a developer's certification that he or she has
> >    the right to submit the patch for inclusion into the kernel.  It is an
> >    agreement to the Developer's Certificate of Origin, the full text of
> >    which can be found in :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
> >    Code without a proper signoff cannot be merged into the mainline.
> > - - Signed-off-by: 这是一个开发人员的证明，他或她有权提交补丁以包含到内核中。
> > -   这是开发来源认证协议，其全文可在
> > + - Signed-off-by: 这用来证明开发人员有权提交补丁以包含到内核中。
> > +   也表明同意开发者来源证书，其全文见
> 
> ?? what's meaning of above line?
>
Emmm?
You mean '+ -' or '- -' ? The second dashs are original paragraph mark.
Or the 'Developer's Certificate of Origin' ? See 
    Documentation/translations/zh_CN/process/submitting-patches.rst
Or any other question?
> 
> >     :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
> > -   中找到，如果没有适当的签字，则不能合并到主线中。
> 
> s/适当/合适/
>
Ok.
> 
> > +   没有正确签名的代码不能合并到主线中。
> >     Correct.
> > 47.
> >  - Co-developed-by: states that the patch was co-created by several developers;
> >    it is a used to give attribution to co-authors (in addition to the author
> >    attributed by the From: tag) when multiple people work on a single patch.
> >    Every Co-developed-by: must be immediately followed by a Signed-off-by: of
> >    the associated co-author.  Details and examples can be found in
> >   - Co-developed-by: 声明补丁是由多个开发人员共同创建的；当几个人在一个补丁上
> > -   工作时，它用于将属性赋予共同作者（除了 From: 所赋予的作者之外）。因为
> > -   Co-developed-by: 表示作者身份，所以每个共同开发人, 必须紧跟在相关合作作者
> > -   的签名之后。具体内容和示例可以在以下文件中找到
> > +   工作时，它用于给出共同作者（除了 From: 所给出的作者之外）。由于
> > +   Co-developed-by: 表示作者身份，所以每个共同开发人，必须紧跟在相关合作作者
> > +   的Signed-off-by之后。具体内容和示例见以下文件
> > 
> > 48.
> >  - Are you sure that your mailer will not corrupt the patches?  Patches
> >    which have had gratuitous white-space changes or line wrapping performed
> >    by the mail client will not apply at the other end, and often will not
> >    be examined in any detail.  If there is any doubt at all, mail the patch
> >    to yourself and convince yourself that it shows up intact.
> > - - 您确定您的邮件发送程序不会损坏补丁吗？有免费的空白更改或由邮件客户端
> > -   执行的行包装的补丁不会在另一端复原，并且通常不会进行任何详细检查。如果有
> > -   任何疑问，把补丁寄给你自己，让你自己相信它是完好无损的。
> > + - 您确定您的邮件发送程序不会损坏补丁吗？被邮件客户端更改空白或修饰了行的补丁
> > +   无法被另一端接受，并且通常不会进行任何详细检查。如果有任何疑问，先把补丁寄
> > +   给你自己，让你自己确定它是完好无损的。
> > 
> > 49.
> >  - Are you sure your patch is free of silly mistakes?  You should always
> >    run patches through scripts/checkpatch.pl and address the complaints it
> >    comes up with.  Please bear in mind that checkpatch.pl, while being the
> >    embodiment of a fair amount of thought about what kernel patches should
> >    look like, is not smarter than you.  If fixing a checkpatch.pl complaint
> >    would make the code worse, don't do it.
> > - - 你确定你的补丁没有愚蠢的错误吗？您应该始终通过scripts/checkpatch.pl运行
> > -   补丁程序，并解决它提出的投诉。请记住，checkpatch.pl虽然是大量思考内核
> > -   补丁应该是什么样子的体现，但它并不比您聪明。如果修复checkpatch.pl投诉会
> > + - 你确定你的补丁没有荒唐的错误吗？您应该始终通过scripts/checkpatch.pl检查
> > +   补丁程序，并解决它提出的问题。请记住，checkpatch.pl，虽然体现了对内核补丁
> > +   应该是什么样的大量思考，但它并不比您聪明。如果修复checkpatch.pl给的问题会
> >     使代码变得更糟，请不要这样做。
> > 
> > 50.
> >  - Send a copy to the relevant mailing list, or, if nothing else applies,
> >    the linux-kernel list.
> > - - 将副本发送到相关邮件列表，或者，如果没有其他应用，则发送到Linux内核列表。
> > + - 将副本发送到相关邮件列表，或者若无相关列表，则发送到linux-kernel列表。
> >     Correct.
> > 
> > [Patch 7/9] 6.Followthrough.rst
> > 
> > 51.
> > -人员来说，与审查人员合作可能是内核开发过程中最令人生畏的部分。但是，如果你
> > +人员来说，与审阅人员合作可能是内核开发过程中最令人生畏的部分。但是如果你
> >     change all 'reviewer' to 审阅人员、审阅者
> 
> Nope, I just see a ',' removed here.
>
There are many different tranlations of 'reviewer' in those articles.
Such as 审阅人员 审阅者 审查人员 审稿人 评论人员 etc, we need a unified
translation.
> > 
> > 52.
> >    ... But that value
> >    will not keep them from asking a fundamental question: what will it be
> >    like to maintain a kernel with this code in it five or ten years later?
> > -   费尽心思去写它。但是这个并不能阻止他们提出一个基本的问题：五年或十年后
> > -   用这个代码维护一个内核会是什么感觉？你可能被要求做出的许多改变——从编码风格
> > +   费尽心思去写它。但是这个并不能阻止他们提出一个基本的问题：在五年或十年后
> > +   维护含有此代码的内核会怎么样？你可能被要求做出的许多改变——从编码风格
> >     'maintain ... with this code' or 'kernel with this code' ?
> > 
> > 53.
> > Andrew Morton has suggested that every review comment which does not result
> > in a code change should result in an additional code comment instead; that
> > can help future reviewers avoid the questions which came up the first time
> > around.
> > -Andrew Morton建议，每一条不会导致代码更改的评论都应该导致额外的代码注释；
> > -这可以帮助未来的评论人员避免出现第一次出现的问题。
> > +Andrew Morton建议，每一个不会导致代码更改的审阅评论都应该产生一个额外的代码
> > +注释；这可以帮助未来的审阅人员避免第一次出现的问题。
> > 
> > 54.
> > One fatal mistake is to ignore review comments in the hope that they will
> > go away.  They will not go away.  
> > -一个致命的错误是忽视评论，希望它们会消失。他们不会走的。如果您在没有对之前
> > +忽视评论、希望它们会消失是一个致命的错误。它们不会走的。如果您在没有对之前
> > 
> 
> No much different.
>
Simply changed the words order of first sentence.
> 
> > 55.
> > ... Reviewers should not have to search
> > through list archives to familiarize themselves with what was said last
> > time; if you help them get a running start, they will be in a better mood
> > when they revisit your code.
> > -如果您帮助他们开始运行，当他们重新访问您的代码时，他们的心情会更好。
> > +如果您帮助他们直接开始，当他们重新查看您的代码时，心情会更好。
> > 
> > 56.
> > What if you've tried to do everything right and things still aren't going
> > anywhere?  Most technical disagreements can be resolved through discussion,
> > but there are times when somebody simply has to make a decision.  If you
> > honestly believe that this decision is going against you wrongly, you can
> > always try appealing to a higher power.  As of this writing, that higher
> > power tends to be Andrew Morton.  Andrew has a great deal of respect in the
> > kernel development community; he can often unjam a situation which seems to
> > be hopelessly blocked.  Appealing to Andrew should not be done lightly,
> > though, and not before all other alternatives have been explored.  And bear
> > in mind, of course, that he may not agree with you either.
> >  如果你已经试着做正确的事情，但事情仍然没有进展呢？大多数技术上的分歧都可以
> > -通过讨论来解决，但有时人们只需要做出决定。如果你真的认为这个决定对你不利，
> > -你可以试着向更高的权力上诉。在这篇文章中，更高的权力倾向于Andrew Morton。
> > -Andrew在内核开发社区中受i很大的尊重；他经常为似乎被绝望地阻塞事情清障。
> > -尽管如此，对Andrew的呼吁不应轻而易举，也不应在所有其他替代方案都被探索之前
> > -使用。当然，记住，他也可能不同意你的意见。
> > +通过讨论来解决，但有时人们仍需要做出决定。如果你真的认为这个决定对你不利，
> > +你可以试着向有更高权力的人上诉。对于本文，更高权力的人是Andrew Morton。
> > +Andrew在内核开发社区中非常受尊敬；他经常为似乎被绝望阻塞的事情清障。
> > +尽管如此，不应轻易就直接找Andrew，也不应在所有其他替代方案都被尝试之前
> > +找他。当然，记住，他也可能不同意你的意见。
> > 
> > 57.
> > If a patch is considered to be a good thing to add to the kernel,
> > -如果一个补丁被认为是添加到内核中的一件好事，并且一旦大多数审查问题得到解决，
> > +如果一个补丁被认为适合添加到内核中，并且大多数审查问题得到解决，
> > 
> > 58.
> > For patches applying to areas for which there is no obvious subsystem tree
> > (memory management patches, for example), the default tree often ends up
> > being -mm.  Patches which affect multiple subsystems can also end up going
> > through the -mm tree.
> > -对于应用于没有明显子系统树（例如内存管理修补程序）的区域的修补程序，默认树
> > -通常以-mm结尾。影响多个子系统的补丁也可以最终通过-mm树。
> > +对于应用到不属于明显子系统树（例如内存管理修补程序）的区域的修补程序，默认树
> > +通常上溯到-mm。影响多个子系统的补丁也可以最终进入-mm树。
> > 
> > 59.
> > What may also happen at this point, depending on the nature of your patch,
> > is that conflicts with work being done by others turn up.
> > -在这一点上也会发生什么，这取决于你的补丁的性质，是与其他人正在做的工作发生
> > +在这时也会发生点什么，这取决于你的补丁的性质，是否与其他人正在做的工作发生
> > 
> > 60.
> > ... This work can be a pain, but count your
> > blessings: before the advent of the linux-next tree, these conflicts often
> > only turned up during the merge window and had to be addressed in a hurry.
> > Now they can be resolved at leisure, before the merge window opens.
> > -事情，但要计算您的福祉：在Linux下一棵树出现之前，这些冲突通常只在合并窗口
> > -中出现，必须迅速解决。现在可以在合并窗口打开之前，在空闲时解决这些问题。
> > +事情，但也需庆幸现在的幸福：在linux-next树出现之前，这些冲突通常只在合并窗口
> > +中出现，必须迅速解决。现在可以在合并窗口打开之前的空闲时间解决这些问题。
> > 
> > 61.
> > The worst sort of bug reports are regressions.  If your patch causes a
> > regression, you'll find an uncomfortable number of eyes upon you;
> > -最糟糕的错误报告是回归。如果你的补丁导致回归，你会发现很多不舒服的眼睛盯着
> > +最糟糕的错误报告是回归。如果你的补丁导致回归，你会发现多到让你不舒服的眼睛盯着
> > 
> > 62. 
> > you can start creating cool new patches once any problems with the old
> > ones have been taken care of.
> >  ...一旦解决了旧补丁的任何问题，就
> > -可以开始创建酷的新补丁。
> > +可以开始尽情创建新补丁。
> > 
> > 63.
> > And don't forget that there are other milestones which may also create bug
> > reports: the next mainline stable release, when prominent distributors pick
> > up a version of the kernel containing your patch, etc.  Continuing to
> > respond to these reports is a matter of basic pride in your work.  If that
> > is insufficient motivation, though, it's also worth considering that the
> > development community remembers developers who lose interest in their code
> > after it's merged.  The next time you post a patch, they will be evaluating
> > it with the assumption that you will not be around to maintain it
> > afterward.
> > -别忘了，还有其他里程碑也可能会创建bug报告：下一个主线稳定版本，当著名的发行
> > -商选择包含补丁的内核版本时，等等。继续响应这些报告是您工作的基本骄傲。但是，
> > -如果这不是足够的动机，那么也值得考虑的是，开发社区会记住那些在合并后对代码
> > -失去兴趣的开发人员。下一次你发布补丁时，他们会以你以后不会在身边维护它为假
> > -设来评估它。
> > +别忘了，还有其他节点也可能会创建缺陷报告：下一个主线稳定版本，当著名的发行
> > +商选择包含您补丁的内核版本时等等。继续响应这些报告是您工作的基本素养。但是
> > +如果这不能提供足够的动机，那么也需要考虑：开发社区会记住那些在合并后对代码
> > +失去兴趣的开发人员。下一次你发布补丁时，他们会以你以后不会持续维护它为前提
> > +来评估它。
> >  
> > 64.
> > possible, tell the author what changes need to be made to make the patch
> > acceptable to you.  There is a certain resistance to merging patches which
> > are opposed by the author and maintainer of the code, but it only goes so
> > far.  If you are seen as needlessly blocking good work, those patches will
> > eventually flow around you and get into the mainline anyway.  In the Linux
> > kernel, nobody has absolute veto power over any code.  Except maybe Linus.
> > -做哪些更改才能让您接受补丁。对于代码的编写者和维护者所反对的合并补丁，存在着
> > +做哪些更改才能让您接受补丁。合并代码的编写者和维护者所反对的补丁的确存在着
> >  一定的阻力，但仅此而已。如果你被认为不必要的阻碍了好的工作，那么这些补丁最
> > -终会经过你身边并进入主线。在Linux内核中，没有人对任何代码拥有绝对的否决权。
> > -除了Linus。
> > +终会绕过你并进入主线。在Linux内核中，没有人对任何代码拥有绝对的否决权。
> > +可能除了Linus。
> > 
> > 65.
> > On very rare occasion, you may see something completely different: another
> > developer posts a different solution to your problem.  At that point,
> > chances are that one of the two patches will not be merged, and "mine was
> > here first" is not considered to be a compelling technical argument.  If
> > somebody else's patch displaces yours and gets into the mainline, there is
> > really only one way to respond: be pleased that your problem got solved and
> > get on with your work.  Having one's work shoved aside in this manner can
> > be hurtful and discouraging, but the community will remember your reaction
> > long after they have forgotten whose patch actually got merged.
> >  在非常罕见的情况下，您可能会看到完全不同的东西：另一个开发人员发布了针对您
> > -的问题的不同解决方案。在这一点上，两个补丁中的一个可能不会合并，“我的在这里
> > -是第一个”不被认为是一个令人信服的技术论据。如果有人的补丁取代了你的补丁而进
> > -入了主线，那么只有一种方法可以回应你：高兴你的问题得到解决，继续你的工作。
> > -以这种方式把一个人的工作推到一边可能会伤害和气馁，但是在他们忘记了谁的补丁
> > -真正被合并很久之后，社区会记住你的反应。
> > +的问题的不同解决方案。在这时，两个补丁之一可能不会被合并，“我的补丁首先
> > +发布”不被认为是一个令人信服的技术论据。如果有别人的补丁取代了你的补丁而进
> > +入了主线，那么只有一种方法可以回应你：很高兴你的问题解决了，请继续工作吧。
> > +以这种方式把某人的工作推到一边可能导致伤心和气馁，但是社区会记住你的反应，
> > +即使很久以后他们已经忘记了谁的补丁真正被合并。
> > 
> > [Patch 8/9] 7.AdvancedTopics.rst
> > 
> > 66.
> > The first order of business is to read the above sites and get a solid
> > understanding of how git works before trying to use it to make patches
> > available to others.  A git-using developer should be able to obtain a copy
> > of the mainline repository, explore the revision history, commit changes to
> > the tree, use branches, etc.  An understanding of git's tools for the
> > rewriting of history (such as rebase) is also useful.  Git comes with its
> > own terminology and concepts; a new user of git should know about refs,
> > remote branches, the index, fast-forward merges, pushes and pulls, detached
> > heads, etc.  It can all be a little intimidating at the outset, but the
> > concepts are not that hard to grasp with a bit of study.
> > -在尝试使用它使补丁可供其他人使用之前，第一要务是阅读上述站点，对Git的工作
> > -方式有一个扎实的了解。使用Git的开发人员应该能够获得主线存储库的副本，探索
> > -修订历史，提交对树的更改，使用分支等。了解Git用于重写历史的工具（如Rebase）
> > -也很有用。Git有自己的术语和概念；Git的新用户应该了解refs、远程分支、索引、
> > -快进合并、推拉、分离头等。一开始可能有点吓人，但这些概念不难通过一点学习来
> > +在尝试使用它生成补丁供他人使用之前，第一要务是阅读上述网页，对Git的工作
> > +方式有一个扎实的了解。使用Git的开发人员应能进行拉取主线存储库的副本，查询
> > +修订历史，提交对树的更改，使用分支等操作。了解Git用于重写历史的工具（如rebase）
> > +也很有用。Git有自己的术语和概念；Git的新用户应该了解引用、远程分支、索引、
> > +快进合并、推拉、游离头等。一开始可能有点吓人，但这些概念不难通过一点学习来
> >  理解。
> > 
> > 67. 
> > The normal git workflow involves the use of a lot of branches.  Each line
> > of development can be separated into a separate "topic branch" and
> > maintained independently.  Branches in git are cheap, there is no reason to
> > not make free use of them.  And, in any case, you should not do your
> > development in any branch which you intend to ask others to pull from.
> > Publicly-available branches should be created with care; merge in patches
> > from development branches when they are in complete form and ready to go -
> > not before.
> >  正常的Git工作流程涉及到许多分支的使用。每一条开发线都可以分为单独的“主题
> > -分支”，并独立维护。Git的分支机构很便宜，没有理由不免费使用它们。而且，在
> > -任何情况下，您都不应该在任何您打算让其他人从中受益的分支中进行开发。应该
> > -小心地创建公开可用的分支；当它们处于完整的形式并准备好运行时(而不是之前），
> > +分支”，并独立维护。Git的分支很容易使用，没有理由不使用它们。而且，在
> > +任何情况下，您都不应该在任何您打算让其他人从中拉取的分支中进行开发。应该
> > +小心地创建公开可用的分支；当开发分支处于完整状态并已准备好时(而不是之前）才
> >  合并开发分支的补丁。
> > 
> > 68.
> > Git will attempt to enforce this rule if
> > you try to push changes which do not result in a fast-forward merge
> >  因此，一旦将一组更改推送到公开可用的服务器上，就不应该重写这些更改。如果您
> > -尝试强制进行不会导致快进合并（即不共享同一历史记录的更改）的更改，Git将尝
> > +尝试强制进行无法快进合并的更改（即不共享同一历史记录的更改），Git将尝
> > and only moved into public branches when
> > it's in a reasonably advanced state.
> >  什么开发应该在私有分支中进行（必要时可以重写）并且只有在公共分支处于合理的
> > -高级状态时才转移到公共分支中的原因之一。
> > +较新状态时才转移到公共分支中的原因之一。
> > 
> > 69.
> > -一棵树被导出到全世界，rebasing就不是一个选项。一旦发生这种情况，就必须进行
> > +一棵树被导出到外界，rebasing就不可取了。一旦发生这种情况，就必须进行
> >                                 ^
> > 
> > 70.
> > 	You can send me patches, but for me to pull a git patch from you, I
> > 	need to know that you know what you're doing, and I need to be able
> > 	to trust things *without* then having to go and check every
> > 	individual change by hand.
> > -        你可以给我发补丁，但要我从你哪里取一个Git补丁，我需要知道你知道
> > -        你在做什么，我需要能够相信事情而不去检查每个个人改变。
> > +   你可以给我发补丁，但当我从你那里拉取一个Git补丁时，我需要知道你清楚
> > +   自己在做什么，我需要能够相信事情而 *无需* 手动检查每个单独的更改。
> >  
> > 71. 
> > Reviewing code can be an intimidating prospect, especially for a new kernel
> > -审查代码可能是一个令人生畏的前景，特别是对于一个新的内核开发人员来说，他们
> > +审查代码可能是一副令人生畏的图景，特别是对一个新的内核开发人员来说，他们
> > 
> > 72.
> > Different developers will review code from different points of view.  Some
> > are mostly concerned with coding style and whether code lines have trailing
> > white space.  Others will focus primarily on whether the change implemented
> > by the patch as a whole is a good thing for the kernel or not.  Yet others
> > will check for problematic locking, excessive stack usage, possible
> > -不同的开发人员将从不同的角度审查代码。一些主要关注的是编码样式以及代码行是
> > -否有尾随空格。其他人将主要关注补丁作为一个整体实现的变更是否对内核有好处。
> > -然而，其他人会检查是否存在锁定问题、堆栈使用过度、可能的安全问题、在其他
> > +不同的开发人员将从不同的角度审查代码。部分人会主要关注代码风格以及代码行是
> > +否有尾随空格。其他人会主要关注补丁作为一个整体实现的变更是否对内核有好处。
> > +同时也有人会检查是否存在锁问题、堆栈使用过度、可能的安全问题、在其他
> > 
> > [Patch 9/9] 8.Conclusion.rst
> > 
> > 73.
> > -        Linux设备驱动程序，第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）。
> > -        在线：http://lwn.net/kernel/ldd3/
> > +  《Linux设备驱动程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
> > +   线上版本在 http://lwn.net/kernel/ldd3/ 
> >  
> > -        Linux内核开发（Robert Love）。
> > +  《Linux内核设计与实现》（Robert Love）
> >  
> > -        了解Linux内核（Daniel Bovet和Marco Cesati）。
> > +  《深入理解Linux内核》(Daniel Bovet和Marco Cesati）
> >  
> > -然而，所有这些书都有一个共同的缺点：当它们上架时，它们往往有些过时，而且它们
> > -已经上架一段时间了。不过，在那里还可以找到相当多的好信息。
> > +然而，所有这些书都有一个共同的缺点：它们上架时就往往有些过时，而且已经
> > +上架一段时间了。不过，在那里还可以找到相当多的好信息。
> >     check the really names of Chinese version books
> > 
> > 74.
> > Conclusion
> > -结论
> > +总结
> 
> no much different.
>
Ok, keep it.
> 
> >  ====
> >     the last chapter title
> > 
> > 75.
> > Congratulations to anybody who has made it through this long-winded document.
> > -祝贺所有通过这篇冗长的文件的人。希望它能够帮助您理解Linux内核是如何开发的，
> > +祝贺所有读完这篇冗长的文档的人。希望它能够帮助您理解Linux内核是如何开发的，
> 
> Maybe the older is better.
>
'through' is not matter, but I think 'document' need change.
> 
> >  以及您如何参与这个过程。
> > 
> > 76.
> > ... The kernel is a premier example of what can be
> > done when thousands of people work together toward a common goal.
> > -更好。内核是一个主要的例子，说明当成千上万的人为了一个共同的目标一起工作时，
> > -可以做些什么。
> > +更好。内核是一个基本的例子，说明了当成千上万的人为了一个共同的目标一起工作时，
> > +可以做出什么。
> 
> premier could be tranlated as 最成功的？
>
Ok, I found I misunderstood 'premier'.
> 
> > 
> > 77.
> > Fire up your editor and come join us;
> > -等的关键。这是一种人人都赢的局面。踢开你的编辑，来加入我们吧，你会非常受
> > +等的关键。这是一种共赢的局面。启动你的编辑器，来加入我们吧；你会非常受
> >  欢迎的。
> 
> good fix!
> 
> Thanks!
> 
Thanks for your review!
Wu X.C.
>
> > 
> > Wu XiangCheng (9):
> >   docs/zh_CN: Improve zh_CN/process/index.rst
> >   docs/zh_CN: Improve zh_CN/process/1.Intro.rst
> >   docs/zh_CN: Improve zh_CN/process/2.Process.rst
> >   docs/zh_CN: Improve zh_CN/process/3.Early-stage.rst
> >   docs/zh_CN: Improve zh_CN/process/4.Coding.rst
> >   docs/zh_CN: Improve zh_CN/process/5.Posting.rst
> >   docs/zh_CN: Improve zh_CN/process/6.Followthrough
> >   docs/zh_CN: Improve zh_CN/process/7.AdvancedTopics
> >   docs/zh_CN: Improve zh_CN/process/8.Conclusion.rst
> > 
> >  .../translations/zh_CN/process/1.Intro.rst    | 155 +++++----
> >  .../translations/zh_CN/process/2.Process.rst  | 319 +++++++++---------
> >  .../zh_CN/process/3.Early-stage.rst           | 131 +++----
> >  .../translations/zh_CN/process/4.Coding.rst   | 262 +++++++-------
> >  .../translations/zh_CN/process/5.Posting.rst  | 225 ++++++------
> >  .../zh_CN/process/6.Followthrough.rst         | 143 ++++----
> >  .../zh_CN/process/7.AdvancedTopics.rst        | 121 ++++---
> >  .../zh_CN/process/8.Conclusion.rst            |  59 ++--
> >  .../translations/zh_CN/process/index.rst      |  10 +-
> >  9 files changed, 742 insertions(+), 683 deletions(-)
> > 

