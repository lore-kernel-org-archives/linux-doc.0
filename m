Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1,
	WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FA0C433DB
	for <linux-doc@archiver.kernel.org>; Sat, 20 Feb 2021 09:30:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3F0E64EDB
	for <linux-doc@archiver.kernel.org>; Sat, 20 Feb 2021 09:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhBTJay (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 20 Feb 2021 04:30:54 -0500
Received: from [43.250.32.171] ([43.250.32.171]:39565 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229542AbhBTJaw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 20 Feb 2021 04:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=rcf69EXWQmsdh2t4I0/DY8CvGiJV5JrFHLrfO
        3glKo0=; b=g6trY+iExxVAgh2cEVpLSKVXHnolnRVstsGVVSKvefFUuoehCiHfe
        74QlvLYch2cBynRT5wiISGA5KIrp0TuPjw69tLKioUFlejfAaa7yT/roUariW8cF
        OEktLsoZnToEiBUB0pWLfS19Byr+DNEpOcFUEKOMx6m8ttPzn4cP6s=
Received: from mipc (unknown [120.242.71.224])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC3KtGh1jBg90cAAA--.840S2;
        Sat, 20 Feb 2021 17:30:11 +0800 (CST)
Date:   Sat, 20 Feb 2021 17:30:07 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/5] docs/zh_CN: Improve language in zh_CN/process/
Message-ID: <20210220093007.GA17987@mipc>
References: <cover.1613643617.git.bobwxc@email.cn>
 <80e38d8a-b141-386d-56b5-5644be41a799@linux.alibaba.com>
 <20210219090947.GA15328@mipc>
 <dd566130-eb54-6324-c0e3-3fc367e2d14d@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd566130-eb54-6324-c0e3-3fc367e2d14d@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgC3KtGh1jBg90cAAA--.840S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGr4fKw4ftF48Gw1DGFWxWFg_yoW8ArW8Go
        WfZ39akw4xtF4UWa1qkw4DGFy7W3WkGr4fZr15Xw4a9Fs0gw15G34rCwn8XayfCr1jkrWD
        ta48t34jvFy5J3Z3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5X7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
        GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-Originating-IP: [120.242.71.224]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 20, 2021 at 03:21:04PM +0800, Alex Shi wrote:
> 
> 
> 在 2021/2/19 下午5:09, Wu X.C. 写道:
> > On Fri, Feb 19, 2021 at 11:23:02AM +0800, Alex Shi wrote:
> >> Hi Xiangcheng,
> >>
> >> Thanks for polishing patchset, but i can find your patches in my email box.
> >> and even in lkml. Except https://lkml.org/lkml/2021/2/14/33 the first patch.
> >> Do I missed others?
> >>
> > No, that's all. I sent first patch in 02-14 and got no comment, so keep 
> > working and re-sent this one without cc kernel-list. You can simply skip 
> > the previous one.
> 
> well, send out your cover letter with patches is a standard process in kernel
> community. follow this could make reviewer more happy.
> 
> >>
> >> 在 2021/2/18 下午6:24, Wu XiangCheng 写道:
> >>> There are some errors in some files in zh_CN/process/, such as grammatical 
> >>> errors, translation errors and improper use of words etc., which make it 
> >>
> >> Could you like to point out each of specific incorrect words with reasons?
> >> Like the following incorrect I found in your patch:
> >>
> >> A, And end users, too, will often wish to change Linux to make it
> >>    better suit their needs.
> >>   
> >>    +最终用户也常常希望修改Linux，使之年能更好地满足他们的需求。
> >>    I couldn't find a word means '年'/year in original context, do you?
> >>
> > Sorry, I will correct such typo.
> >>
> >> B, Contribution of code is the fundamental action which makes the whole
> >>    process work.
> >>
> >> +- 代码的贡献是使整个流程顺畅的根本
> >>
> >> the point of the process is 工作/workable, your transltion change it to
> >> process 顺畅/fluency, why?
> >>
> > In fact, I did some free translation rather than literal translation. 
> 
> What means 'free' translation?
free translation 意译 literal translation 直译
> 
> > It's up to you to point out what you don't think is appropriate, we can 
> > change that. Like 'work' also can be translated as '工作起来', '起作用' etc.
> > 
> 
> Nope, work never have meaning of fluency. There is a standard in Chinese-English
> translation industry： 信，达，雅， it is fidelity, fluency, elegance in English.
> Let's not change the original meaning. At last we should hang on the fidelity
> and then try fluency and elegance.
Yeah. But fidelity could not solve all problems, sometimes, word by word 
translation make the sentences and names incomprehensible and very strange.
For Chinese, one need to eat the texts, chew them up, and then spit them out.
If the mean is incomprehensible, then the translation is meaningless.
Especially (26.) 
> 
> > As for:
> >> Could you like to point out each of specific incorrect words with reasons?
> >> Like the following incorrect I found in your patch:
> > It is hard to give all words one by one, here are the main points as 
> > example:
> 
> No explanation is fine for first translation, but better to have for each of
> correctness.
Got that. There will be more patch when next update. I'll try to give that for 
additional new patch.
> 
> > 
> > [Patch 1/5]
> > 1. 
> > These are some overall technical guides that have been put here for now 
> > for lack of a better place.
> > -这些是一些总体技术指南，由于缺乏更好的地方，现在已经放在这里
> > +这些是一些总体性技术指南，由于不大好分类而放在这里：
> 
> it's ok for better fluency.
> 
> > 	paraphrase
> > 
> > [Patch 2/5]
> > 2.
> > Introduction
> > -介绍
> > +引言
> 
> Ok.
> 
> > 	According to the purpose of this article
> > 
> > 3.
> > Executive summary
> > -执行摘要
> > +内容提要
> 
> for better Chinese custom, ok.
> 
> > 	Idiomatic words
> > 
> > 4. 
> > There is some discussion of tools and mailing lists. 
> > -涵盖了补丁开发、审查和合并周期中的各个阶段。有一些关于工具和邮件列表的讨论。
> > +涵盖了补丁开发、审查和合并周期中的各个阶段。还介绍了一些工具和邮件列表。
> 
> twisted the word 'discusion', change to 还有一些关于工具和邮件列表的讨论？
OK.
> 
> > 	Need to translate "discussion" according to the situation, same as
> > 	"interest", "work"
> > 
> > 5. 
> > Developers are cautioned against assuming that the job is done...
> > -开发人员要注意不要假定任务已经完成。
> > +开发人员要注意不要认为任务已经完成。
                       ^
> 
> Nope, don't see the reason.
更改一下习惯用词。
> 
> > 	Idiomatic words
> > 
> > 6. 
> > introduces a couple of "advanced" topics:
> > -:ref:`cn_development_advancedtopics` 介绍了两个“高级”主题：
> > +:ref:`cn_development_advancedtopics` 介绍了两个“进阶”主题：
> 
> ditto
Ok, keep it.
> 
> > 	Idiomatic words
> > 
> > 7.
> > -- 围绕专有内核模块分发的法律问题充其量是模糊的；相当多的内核版权所有者认为，
> > +- 围绕专有内核模块分发的法律问题其实较为模糊；相当多的内核版权所有者认为，
> 
> ok for better fluency.
> 
> > 	There are many "充其量" in the original translation, not always suitable.
> > 
> > 8.
> > by GPLv2 (with, optionally, language allowing distribution under later 
> > versions of the GPL) 
> > -着所有代码贡献都由GPLv2（可选地，语言允许在更高版本的GPL下分发）或3子句BSD
> > +着所有代码贡献都由GPLv2（原则上允许在更高版本的GPL下分发，可选）或3子句BSD
> 
> Nope, I got struggle here, but still have no idea if yours correct.
> 'language' has no meaning of principle, maybe the old translation with
> a comment or attach with the original English words?
Maybe, I also confused with it.
Ok, simply keep it.
> 
> > 	Hard to understand
> > 
> > 9.
> > (such as code which derives from reverse-engineering efforts lacking
> > proper safeguards) 
> > -相关问题的代码（例如，由缺乏适当保护的反向工程工作派生的代码）不能被接受。
> > +内核造成版权相关问题的代码（例如，由缺乏适当保护的逆向工程工作派生的代码）
> 
> Nope, 反向工程 is used a lot.
See，
《计算机科学技术名词 (第三版)》
规范用词：逆向工程
英语名：  reverse engineering
台湾名：  反向工程
定义：    通过分析软件系统后期制品，获取更高抽象度的前期模型的过程。
          是软件开发周期的反向过程。
学科： 	  计算机科学技术_软件工程
公布年度：2018
  ——全国科学技术名词审定委员会
> and why add extra words?
> 
> > 	Idiomatic words
> > 
> > [Patch 3/5]
> > 10. 
> > How the development process works
> > -开发流程如何工作
> > +开发流程如何进行
> 
> ok for fluency.
> 
> > 	According to the situation
> > 
> > 11.
> > in order to be an effective part of it.
> > -进来，内核因此必须发展许多流程来保持开发的顺利进行。要成为流程的有效组成
> > +内核因此必须发展出许多既定流程来保证开发的顺利进行。要参与到流程中来，
> 
> could you give more context here, can't judge for pieces of words.
（某人）要成为流程的有效组成部分
（某人）要参与到流程中来
Clear?
> 
> > 
> > 12.
> > they cannot cause regressions
> > -改变已有代码，则不会导致回归，并且应该可以随时安全地添加）。
> > +则不会导致回退，应该可以随时被安全地加入）。
> > 	regression, see (28.)
> > 
> 
> nope.
Ok.
> 
> > 13.
> > its ongoing maintenance
> > -一旦一个稳定的版本发布，它正在进行的维护工作就被移交给“稳定团队”，目前由
> > +一旦一个稳定的版本发布，它的持续维护工作就被移交给“稳定团队”，目前由
> 
> good on custom.
> 
> > 
> > 14.
> > The selection of a kernel for long-term support is purely a matter of a
> > maintainer having the need and the time to maintain that release.
> > -为长期支持选择内核纯粹是维护人员有必要和时间来维护该版本的问题。目前还没有
> > +长期支持内核的选择纯粹是维护人员是否有需求和时间来维护该版本的问题。
> 
> good on fluency.
> 
> > 	Mechanical translation
> > 
> > 15.
> > Use of the MMOTM tree is likely to be a frustrating experience, though;
> > -然而，使用mmotm树可能是一种令人沮丧的体验；它甚至可能无法编译。
> > +然而，使用MMOTM树可能会十分令人头疼；它甚至可能无法编译。
> 
> don't see reasons except the MMOTM change.
译文中满地都是直译“沮丧的体验”，太难受了，换个词表述
> 
> > 	paraphrase
> > 
> > 16.
> > The TODO file lists the pending work that the driver needs for 
> > acceptance into the kernel proper
> > -目录中还应该有一个TODO文件。todo文件列出了驱动程序需要接受的挂起的工作，
> > +目录中还应该有一个TODO文件。TODO文件列出了驱动程序即将进行的工作，
> 
> nope for fidelity.
What is "挂起的工作" ? Need a better word to change that.
> 
> > 	Mechanical translation
> > 
> > 17.
> > but there is space for a few pointers.
> > -这些工具的教程远远超出了本文档的范围，但是还是有一些指南的空间。
> > +这些工具的教程远远超出了本文档的范围，但还是用一点篇幅介绍一些关键点。
> 
> ok.
> 
> > 	Mechanical translation
> > 
> > 18.
> > the amount of noise is high
> > -每天的信息量可以达到500条，噪音很高，谈话技术性很强，参与者并不总是表现出
> > +每天的信息量可以达到500条，非常热闹，谈话技术性很强，且参与者并不总是表现出
> > 	"noise" actually is "热闹"、"干扰"
> 
> Nope, fidelity issue. and noise has much more meaning than it's in
> dictionary.
Please explain the extra meaning, otherwise double quotes are required.
> 
> > 
> > [Patch 4/5]
> > 19.
> > it is tempting to confuse the real problem with the proposed solution, 
> > and that can lead to difficulties.
> > -将实际问题与建议的解决方案混淆是很有诱惑力的，这可能会导致困难。
> > +很容易将实际问题与建议的解决方案混在一起，这可能会导致麻烦。
> 
> ok for custom.
> 
> > 	Mechanical translation
> > 
> > 20.
> > and ongoing latency reduction work in the long term.
                                  ^
> > -机制进行实时调度访问，以及长期的减少延迟的工作。
                                               ^
> > +机制进行实时调度访问，以及长期的减少延迟的改进。
                                               ^
> 
> more context?
> 
> > 
> > 21.
> > has caused Reiser4 to stay out of the mainline kernel.
> > -   导致Reiser4远离了主线内核。
> > +   导致Reiser4无法进入主线内核。
> 
> Reiser4 is in kernel now?
I don't know, or change to 导致Reiser4置身主线内核之外。
> 
> > 	paraphrase
> > 
> > 22.
> > When to post?
> > -何时邮寄？
> > +何时发布？
> 
> Nope, 邮寄 is more common words for continue patches resending.
?
This chapter aims to post your early plan to community, not only the patch.
Even if it's a patch, usually email only says "发送", not "邮寄".
> 
> > 	post, polysemes
> > 
> > 23.
> > (2) there is no shortage of people with grand plans and little code (or 
> > even prospect of code) to back them up
> > -反应。可悲的事实是：（1）内核开发人员往往很忙；（2）不缺少有宏伟计划和很少
> > -代码（甚至代码前景）支持他们的人；（3）没有人有义务审查或评论别人发表的
> > +反馈。令人伤心的事实是：（1）内核开发人员往往很忙；（2）不缺少有宏伟计划但
> > +代码（甚至代码设想）很少的人去支持他们；（3）没有人有义务审查或评论别人发表
> 
> more context?
only need to read (2)

One discouraging thing which can happen at this stage is not a hostile
reaction, but, instead, little or no reaction at all.  The sad truth of the
matter is (1) kernel developers tend to be busy, (2) there is no shortage
of people with grand plans and little code (or even prospect of code) to
back them up, and (3) nobody is obligated to review or comment on ideas
posted by others.  Beyond that, high-level designs often hide problems
which are only revealed when somebody actually tries to implement those
designs; for that reason, kernel developers would rather see the code.
> 
> > 
> > [Patch 5/5]
> > 24.
> > Then the focus will shift toward doing things right and the tools which can 
> > help in that quest.
> > -到正确的事情和可以帮助这个任务的工具上。
> > +到正确的做法和相关实用工具上。
> 
> more context?
> 
> > 	paraphrase
> > 
> > 25.
> > Coding style
> > -编码风格
> > +代码风格
> > 	Idiomatic words, also 代码规范
> 
> Nope, didn't see much idiomatic for word coding. and code is different from
> coding.
See linux/Documentation/translations/zh_CN/process/coding-style.rst,
the title is "代码风格"
> 
> > 
> > 26.
> > ... two independent hazards for kernel developers.
> > The first of these is to believe that the kernel coding standards do not
> > matter and are not enforced. 
> > -首先，要相信内核编码标准并不重要，也不强制执行。事实上，如果没有按照标准对代
> > +首先是错误相信内核代码标准并不重要，也不强制执行。但事实上，如果没有按照标准
> > 	The meaning is totally wrong
> 
> Nope, fidelity.
Please read the original document *carefully*. 
The meaning of the translation here is completely wrong, even contrary.
The fidelity is clearly not appropriate here.
==
As a result, there is a substantial amount of code in the kernel
which does not meet the coding style guidelines.  The presence of that code
leads to two independent hazards for kernel developers.

The first of these is to believe that the kernel coding standards do not
matter and are not enforced.  The truth of the matter is that adding new
code to the kernel is very difficult if that code is not coded according to
the standard; many developers will request that the code be reformatted
before they will even review it.  A code base as large as the kernel
requires some uniformity of code to make it possible for developers to
quickly understand any part of it.  So there is no longer room for
strangely-formatted code.

> 
> > 
> > 27.
> > sorting ``#includes``, for aligning variables/macros, for reflowing text 
                                                              ^
> > and other similar tasks
> > -可以方便地进行排序，包括对齐变量/宏、回流文本和其他类似任务。有关详细信息，请
                                          ^
> > +可以方便地排序 ``#includes`` 、对齐变量/宏、重排文本和其他类似任务。有关详细
                                                 ^
> > 	reflowing text
> 
> more context?
Only one word.
==
Note that you can also use the ``clang-format`` tool to help you with
these rules, to quickly re-format parts of your code automatically,
and to review full files in order to spot coding style mistakes,
typos and possible improvements. It is also handy for sorting ``#includes``,
for aligning variables/macros, for reflowing text and other similar tasks.
See the file :ref:`Documentation/process/clang-format.rst <clangformat>`
for more details.

> 
> > 
> > 28.
> > Regressions
> > -回归
> > +回退
> > 	"Regression" as a software term can be translated to "回归", but "回归" 
> > 	often refers to the mathematical name or belonging state, and we also
> > 	use "回归测试" as "regression test". 
> > 	Besides, there is also "rollback" but rollback is obviously different 
> > 	from regression, so we can't use "回滚". 
> > 	So, which word should we use to translate the proper term for kernel 
> > 	error, "回退" or just use "回归" ?
> 
> 'regression' here has same meaningful with 'regression test'. better no change.
Ok. 

Thanks!
Wu X.C.
>
> >>> difficult for native speakers to understand. Many errors are caused by 
> >>> machine translation without manual correction.
> >>>
> >>> This set of patchs aims to fix the above problems and synchronize them with
> >>> original files. Some structure modifications need to rewrite the whole 
> >>> sentences, so here are a lot of changes.
> >>>
> >>> Wu XiangCheng (5):
> >>>   docs/zh_CN: Improve zh_CN/process/index.rst
> >>>   docs/zh_CN: Improve zh_CN/process/1.Intro.rst
> >>>   docs/zh_CN: Improve zh_CN/process/2.Process.rst
> >>>   docs/zh_CN: Improve zh_CN/process/3.Early-stage.rst
> >>>   docs/zh_CN: Improve zh_CN/process/4.Coding.rst
> >>>
> >>>  .../translations/zh_CN/process/1.Intro.rst    | 146 ++++-----
> >>>  .../translations/zh_CN/process/2.Process.rst  | 296 +++++++++---------
> >>>  .../zh_CN/process/3.Early-stage.rst           | 120 +++----
> >>>  .../translations/zh_CN/process/4.Coding.rst   | 251 ++++++++-------
> >>>  .../translations/zh_CN/process/index.rst      |  10 +-
> >>>  5 files changed, 412 insertions(+), 411 deletions(-)
> >>>

