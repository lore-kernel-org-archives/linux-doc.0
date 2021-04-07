Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D936CC433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 15:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB6B561262
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 15:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353452AbhDGPWd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 11:22:33 -0400
Received: from m32-153.88.com ([43.250.32.153]:14214 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229812AbhDGPWd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 11:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=7YNIA6GG+q0oBXI/5wREa+E2jIdfk49gg6z9N
        dEf08w=; b=SzInjxOVg/19dgIfNDAIzbTTggQkYuXrBzmUMie2pFPk8WhPddF/i
        +6tkafz5JXC5FaozN1T5yZRAbyLmpF1HgCtMgRi8QD/hytVEJC2cZeGEqC0tKJg5
        vsULXCn0pqxGhxzPrsxCtmLbWIZeKNKYYXxJg5o/kZJdLs+wPi0l44=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAXoiIpzm1gRd1hAA--.20275S2;
        Wed, 07 Apr 2021 23:22:19 +0800 (CST)
Date:   Wed, 7 Apr 2021 23:22:17 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 5/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/contributing.rst
Message-ID: <20210407152216.GA13278@bobwxc.top>
References: <cover.1617699755.git.bobwxc@email.cn>
 <6b0eeced74f21696fd15edea9f24ef1f20736652.1617699755.git.bobwxc@email.cn>
 <CAMU9jJqkveD3rDgRG5Y3Oi2niU6Ji3XTm_ed84vy_j2TCGAAjg@mail.gmail.com>
 <20210407095454.GC2492@bobwxc.top>
 <CAMU9jJoKwVGuzjuNGNNg2pX=aV_b-xF8m+aB+mMhK1-inPTA6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJoKwVGuzjuNGNNg2pX=aV_b-xF8m+aB+mMhK1-inPTA6Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAXoiIpzm1gRd1hAA--.20275S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4UGr4kAr15urW8tFyDGFg_yoW5GrWrpr
        yUKF4xKF1jkr1ayw1xK34xtwnxK3yxGw4Svw17KFn8Gr9xt39IyrWUCwnIgrWfWryftFWq
        gF4avFW7ur13Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqvb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
        1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3U
        UUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 07, 2021 at 11:00:10PM +0800, teng sterling wrote:
> Wu X.C. <bobwxc@email.cn> 于2021年4月7日周三 下午5:55写道：
> >
> > On Wed, Apr 07, 2021 at 05:30:03PM +0800, teng sterling wrote:
> > > Wu XiangCheng <bobwxc@email.cn> 于2021年4月7日周三 下午3:51写道：
> > > >
> > > > Add new translation
> > > >   Documentation/translations/zh_CN/doc-guide/contributing.rst
> > > >
> > > > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > > > ---
> > > >  .../zh_CN/doc-guide/contributing.rst          | 238 ++++++++++++++++++
> > > >  1 file changed, 238 insertions(+)
> > > >  create mode 100644 Documentation/translations/zh_CN/doc-guide/contributing.rst
> > > >
> > > > diff --git a/Documentation/translations/zh_CN/doc-guide/contributing.rst b/Documentation/translations/zh_CN/doc-guide/contributing.rst
[...]
> > > > +“上古”文档
> > > > +~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +一些内核文档是最新的、被维护的，并且非常有用，有些文件确并非如此。尘封、陈旧
> > > > +和不准确的文档可能会误导读者，并对我们的整个文档产生怀疑。任何解决这些问题的
> > > > +事情都是非常受欢迎的。
> > > > +
> > > > +无论何时处理文档，请考虑它是否是最新的，是否需要更新，或者是否应该完全删除。
> > > > +您可以注意以下几个警告标志：
> > > > +
> > > > + - 对2.x内核的引用
> > > > + - 指向SourceForge存储库
> > > > + - 历史记录除了拼写错误啥也没有持续几年
> > > > + - 讨论Git之前时代的工作流
> > > > +
> > > > +当然，最好的办法是更新文档，添加所需的任何信息。这样的工作通常需要熟悉相关
> > > 通常需要与熟悉相
> > >
> > Nope.
> >
> > 这样的工作通常需要 / 熟悉相关子系统的开发人员 / 的合作。
> More than two people can “合作”。how about this:
> 这样的工作通常需要与熟悉相关子系统的开发人员的合作？ or
> 这样的工作通常需要熟悉相关子系统的开发人员之间的合作？

use 这样的工作通常需要与熟悉相关子系统的开发人员合作

> 
> >
> > > > +子系统的开发人员的合作。当有人善意地询问开发人员，并听取他们的回答然后采取
> > > > +行动时，开发人员通常更愿意与这些致力于改进文档的人员合作。
> > > > +

Thanks !

Wu X.C.

