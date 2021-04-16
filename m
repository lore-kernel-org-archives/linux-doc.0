Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803BFC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56A186121E
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244834AbhDPOjR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:39:17 -0400
Received: from m32-153.88.com ([43.250.32.153]:10286 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240378AbhDPOix (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=c/yQLifQIDVULsXihE6+DEJvltSZOV9WEaiwI
        Y2UMxA=; b=JCa4OmzrcIreHZBGCoe/d3B4leZL+gbC06c3JWjCpIIE75Wt8utBN
        TOCiZGXNIg0VkD1mBgSVXp/2xT8sB2kO867+2y5ayQzQQ7ffQ+1cEgkEP049ExWb
        dsaNM2P2AS+CZ8TzQVyxuavD6VpR8qdChA34/12TYxpyil1Di7ZRTQ=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAXoiJaoXlg4OpzAA--.63836S2;
        Fri, 16 Apr 2021 22:38:22 +0800 (CST)
Date:   Fri, 16 Apr 2021 22:38:18 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huang JiangHui <huangjianghui@uniontech.com>,
        Bailu Lin <bailu.lin@vivo.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Adjust order and content of zh_CN/index.rst
Message-ID: <20210416143818.GA16963@bobwxc.top>
References: <20210416074652.GA6138@bobwxc.top>
 <CAMU9jJpH6Tat8f+R=+WF02mFGP2ggL95Vs_Lk3cOuEmLTmTeyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJpH6Tat8f+R=+WF02mFGP2ggL95Vs_Lk3cOuEmLTmTeyw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAXoiJaoXlg4OpzAA--.63836S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWDGryUtF13urWDuFy5XFb_yoW8Jw43pF
        93GF9YkF1fXr17K39IqF12qF1YkayxJw48XF42qwnYqryDAr1vyr4Utr1YgF9aqrWxZFW8
        ZF15GFnrCw47AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Xryl42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07UjD7-UUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 16, 2021 at 10:24:00PM +0800, teng sterling wrote:
> Wu XiangCheng <bobwxc@email.cn> 于2021年4月16日周五 下午4:06写道：
> >
> > Adjust order and content of zh_CN/index.rst to make it clear,
> > Complete introductions and TODOLists.
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> > docs-next tree
> > base-commit: f9bbc12ccb35ac8b3fa01cec1a19cb523a7707c7
> >
> >  Documentation/translations/zh_CN/index.rst | 168 +++++++++++++++++++++++++++--
> >  1 file changed, 159 insertions(+), 9 deletions(-)
> >
> > diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> > index 2c154e18b37d..868efe11bb9d 100644
[...]
> > +其他文档
> > +--------
> > +
> > +有几份未排序的文档似乎不适合放在文档的其他部分，或者可能需要进行一些调整和/或

> 和/或？
> emmm…… can you remove one? Or split into two sentences？:)

or may require some adjustments and/or conversion to ReStructured Text format
                                ^^^^^^
So as it, it's OK.

Thanks,

Wu X.C.

> > +转换为reStructureText格式，也有可能太旧。
> > +
> > +TODOList:
> > +
> > +* staging/index
> > +* watch_queue
> > +
> >  目录和表格
> >  ----------
> >
> >
> > --
> > 2.11.0
> >
> 
> Thanks,
> 
> Yanteng

