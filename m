Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA76C43462
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:57:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2FB5610CE
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbhDAR5w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:57:52 -0400
Received: from m34-101.88.com ([104.250.34.101]:49985 "EHLO 88.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236382AbhDARyT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 13:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=f7RlGg0aEU2tgMSyKfVBbwhIcx9nWJDynfhEe
        vV0EAI=; b=gGTofAVvHIGBbKGxHDaTuXz6nxq/E1ag7Afo3u8dbcAwY3QnM7JIA
        /39b78Xis0MYWKXeWiR2g12oI37mclzJ+qm+2KmRboCMj4BV6tjlkfLEjWFc11cY
        1MuxynRYDNN7ACZ0Wx1SFxPFw5guh5F6sDcbuayw/9Vbq7qLhnTLJc=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAXoiLPzmVg7VJVAA--.57057S2;
        Thu, 01 Apr 2021 21:46:56 +0800 (CST)
Date:   Thu, 1 Apr 2021 21:46:54 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] docs/zh_CN: Add translation
 zh_CN/doc-guide/kernel-doc.rst
Message-ID: <20210401134654.GB27759@mipc>
References: <cover.1617260163.git.bobwxc@email.cn>
 <7655ab75cf3f7cfc5c1788ceb70a7ba822f34335.1617260163.git.bobwxc@email.cn>
 <CAMU9jJopesz8zvy4yppcecxMQT7JVsadqkJJcSDEdNfiMGFm-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJopesz8zvy4yppcecxMQT7JVsadqkJJcSDEdNfiMGFm-w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAXoiLPzmVg7VJVAA--.57057S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyftr4fJF43tF15Aw43Jrb_yoW8AF4fpr
        1kKrWfGFsayFy7Gw1fWr1xCrWrAr4xWw4Ygr4xtw1Fqr9Igr4qqr4UKry7uryIgrW0yFW5
        CF1jvFWj93y7Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6ry8MxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjxU1_MaUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 01, 2021 at 08:54:46PM +0800, teng sterling wrote:
> Hi~
> Xiangcheng
> 
> Wu XiangCheng <bobwxc@email.cn> 于2021年4月1日周四 下午3:08写道：
> >
> > Add new translation
> >   Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/doc-guide/kernel-doc.rst            | 497 ++++++++++++++++++
> >  1 file changed, 497 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> >
> > diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> > new file mode 100644
> > index 000000000000..84f91eeedf61
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> > @@ -0,0 +1,497 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/doc-guide/kernel-doc.rst
> > +
> > +:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +编写kernel-doc注释
> > +===========================
> > +
> > +Linux内核源文件可以包含kernel-doc格式的结构化文档注释，用以描述代码的函数、
> > +类型和设计。将文档嵌入源文件更容易保持文档最新。
> > +
> > +.. note:: 内核文档格式与javadoc、gtk-doc或Doxygen看似很相似，但由于历史原因，
> > +          实际有着明显的不同。内核源包含成千上万个kernel-doc注释。请坚持遵循
> > +          此处描述的风格。
>
> Missing two lines！！！

Ah, ok.
The two have been in next tree for 22h.

[...]
> > --
> > 2.20.1
> >
> 
> Thanks！
> 
> Yanteng

Thanks for your review!

Wu X.C.

