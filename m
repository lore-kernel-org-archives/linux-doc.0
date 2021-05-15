Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1F6C433B4
	for <linux-doc@archiver.kernel.org>; Sat, 15 May 2021 16:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F01613D1
	for <linux-doc@archiver.kernel.org>; Sat, 15 May 2021 16:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbhEOQat (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 May 2021 12:30:49 -0400
Received: from m32-153.88.com ([43.250.32.153]:11005 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233573AbhEOQae (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 15 May 2021 12:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=co+nnJNt28RyiqfIzgUs5NhL/pBRYJgt4EoYe
        4o4Nc4=; b=VMN+6k0B18awxsFSTiYhpQoHW+UZ+0kxaA05xs3Mlal2c9sRBqm+V
        VcFr8vqN2rEbJYWSgibrEdf3TLmuZJLpBnurS8c1h8/rgh7MEYP94vkTyMo6HhJ6
        f30Hrvt21fUYzCBHH7N026lNN225awOTktnVk101Uwf8aelkgdVlsI=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgB3xljV9p9gFC0zAA--.64657S2;
        Sun, 16 May 2021 00:29:11 +0800 (CST)
Date:   Sun, 16 May 2021 00:29:09 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <seakeel@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3 6/6] docs/zh_CN: Add translation
 zh_CN/maintainer/modifying-patches.rst
Message-ID: <20210515162908.GA13063@bobwxc.top>
References: <cover.1620932189.git.bobwxc@email.cn>
 <683aff6409087841713738816067a01f250008c8.1620932189.git.bobwxc@email.cn>
 <11ebacfe-994b-5df6-8411-3830d8df3ca7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11ebacfe-994b-5df6-8411-3830d8df3ca7@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgB3xljV9p9gFC0zAA--.64657S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF45JFy7GFWDuw15WF4rKrg_yoWrGw1fpF
        yIgryfGa1kJF13CrWSgFyrXF15KFyxGFW7Jr4ag3ZYvFyDtrs2yryDtr9Igry3Wry8XFWa
        9Fs3GFykCw45AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3UUUUU
        =
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 14, 2021 at 05:30:51PM +0800, Alex Shi wrote:
> 
> 
> On 2021/5/14 上午3:08, Wu XiangCheng wrote:
> > Add a new translation
> >   Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> > and link it to zh_CN/maintainer/index.rst
> > 
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../translations/zh_CN/maintainer/index.rst   |  4 +-
> >  .../zh_CN/maintainer/modifying-patches.rst    | 51 +++++++++++++++++++
> >  2 files changed, 52 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> > 
> > diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
> > index 18a820741f52..eb75ccea9a21 100644
> > --- a/Documentation/translations/zh_CN/maintainer/index.rst
> > +++ b/Documentation/translations/zh_CN/maintainer/index.rst
> > @@ -17,7 +17,5 @@
> >     rebasing-and-merging
> >     pull-requests
> >     maintainer-entry-profile
> > +   modifying-patches
> >  
> > -TODOList:
> > -
> > --   modifying-patches
> > diff --git a/Documentation/translations/zh_CN/maintainer/modifying-patches.rst b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> > new file mode 100644
> > index 000000000000..6f3bf493440c
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> > @@ -0,0 +1,51 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/maintainer/modifying-patches.rst
> > +
> > +:译者:
> > +
> > + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +.. _modifyingpatches_zh:
> > +
> > +修改补丁
> > +========
> > +
> > +如果你是子系统或者分支的维护者，由于代码在你的和提交者的树中并不完全相同，
> > +有时你需要稍微修改一下收到的补丁以合并它们。
> > +
> > +如果你严格遵守开发者来源证书的规则（c），你应该要求提交者重做，但这完全是会
> > +适得其反的时间、精力浪费。规则（b）允许你调整代码，但这样修改提交者的代码并
> > +让他背书你的错误是非常不礼貌的。为解决此问题，建议在你之前最后一个
> > +Signed-off-by标签和你的之间添加一行，以指示更改的性质。这没有强制性要求，最
> > +好在描述前面加上你的邮件和/或姓名，用方括号括住整行，以明显指出你对最后一刻
> > +的更改负责。例如::
> > +
> > +        Signed-off-by: Random J Developer <random@developer.example.org>
> > +        [lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
> > +        Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>
> > +
> > +如果您维护着一个稳定的分支，并希望同时明确贡献、跟踪更改、合并修复，并保护
> > +提交者免受责难，这种做法尤其有用。请注意，在任何情况下都不得更改作者的身份
> > +（From头），因为它会在变更日志中显示。
> > +
> > +回传（back-port）者特别要注意：为了便于跟踪，请在提交消息的顶部（就在主题行
> 
> I saw backport was translated a lot as 回合. Need a reconsideration?
> 
> Thanks
> Alex
> 

find a issue from pro-git2 zh translation team
https://github.com/progit/progit2-zh/issues/224

use 向后移植

their term list
https://github.com/progit/progit2-zh/blob/master/TRANSLATION_NOTES.asc

and this
https://github.com/git/git/blob/master/po/zh_CN.po

Thanks
Wu X.C.

