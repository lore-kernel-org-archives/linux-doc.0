Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70841C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 07:41:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4653664E84
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 07:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbhCDHlR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Mar 2021 02:41:17 -0500
Received: from [43.250.32.171] ([43.250.32.171]:6829 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S233476AbhCDHkw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Mar 2021 02:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=2WaLG0FLX0VmRdZorbJajqf9YjVMRmmjvLBDt
        VfzRc0=; b=aKBSBuRL3YTosA4ywecG+ySbufbd4E3z0EV3l0WFvkkpgZCtyhc5o
        8RQP+YV3Emhf8epMQ5OwvIFisi6SelySSHcYzQTzKsHBxrP3wMl7JbSETVxbrfOO
        dpSs0CygvI9Oxt3Q9qBrjmKcPcS4RzzGx1aSqLmBFIJNek8Wm+XxVA=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB36tDdjkBg4UYPAA--.40448S2;
        Thu, 04 Mar 2021 15:40:15 +0800 (CST)
Date:   Thu, 4 Mar 2021 15:40:13 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 7/9] docs/zh_CN: Improve zh_CN/process/6.Followthrough
Message-ID: <20210304074012.GA14632@mipc>
References: <cover.1614488009.git.bobwxc@email.cn>
 <e841b93b26de20861dd4b224fd6815555429de83.1614488009.git.bobwxc@email.cn>
 <f71b3159-7ea4-c482-8383-7d113ef68511@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f71b3159-7ea4-c482-8383-7d113ef68511@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB36tDdjkBg4UYPAA--.40448S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1fKF1rGF13WFW7AFW8Zwb_yoW8ZFy3pF
        W7KF13Wa18Gry2k3y7Kw1xGF18t3Z7JF48Gw4Iv3s0vr95Jwsayry3t3s8WF93WryIyayr
        ZF4fKFW7CF1av37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqSb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUUVyIUUUU
        U
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 04, 2021 at 03:23:43PM +0800, Alex Shi wrote:
> 
> 
> 在 2021/2/28 下午1:40, Wu XiangCheng 写道:
> > Improve language and grammar of zh_CN/process/6.Followthrough.rst
> > 
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/process/6.Followthrough.rst         | 141 +++++++++---------
> >  1 file changed, 74 insertions(+), 67 deletions(-)
> > 
> > diff --git a/Documentation/translations/zh_CN/process/6.Followthrough.rst b/Documentation/translations/zh_CN/process/6.Followthrough.rst
> > index f509e077e1cb..c5442c356dad 100644
> > --- a/Documentation/translations/zh_CN/process/6.Followthrough.rst
> > +++ b/Documentation/translations/zh_CN/process/6.Followthrough.rst
> > @@ -1,145 +1,152 @@
> >  .. include:: ../disclaimer-zh_CN.rst
> >  
> >  :Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
> > -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
> > +
> > +:Translator:
> > +
> > + 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> > +
> > +:校译:
> > +
> > + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> >  
> >  .. _cn_development_followthrough:
> >  
> >  跟进
> >  ====
> >  
> > -在这一点上，您已经遵循了到目前为止给出的指导方针，并且，随着您自己的工程技能
> > +此时，您已经遵循了到目前为止给出的指导方针，并且，随着您自己的工程技能
> 
> Seems there are many lines shorter than before, this may make new
> doc are bit more ugly and cause reader uncomfort, consider your change
> may widerly used or reference for long time. Line width control is
> very meanignful and valuable things.
> 
> Would you like try to refill all shorter lines, make context more
> pretty?
>
OK, good suggestion.
I'll try to fill the shorter lines or return at a word or punctuation.
But I won't fill a modified single line in a large paragraph, that may
cause many unnecessary line changes.

Thanks
Wu X.C.

