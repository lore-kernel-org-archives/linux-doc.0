Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A574DC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 02:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83BEC613C7
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 02:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239586AbhDNCim (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 22:38:42 -0400
Received: from [43.250.32.171] ([43.250.32.171]:44531 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S230303AbhDNCik (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 22:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Zlxu2Whbo1dgvERGvsjAB1kDZCG5u5iTjuDlt
        pdhbQo=; b=ZLDUl1Yr6SY1vGONh15+M5mBUvHiIKtpHBe1p5JuO1p7Ib1U93wCS
        CcWKDWBMkrpjSBPu0ViE5qMJ5wREgJ8pCuQE5SCSp0slQXdKPrRBHXere6mw0iT3
        lU3fZ5CUuG8+gJaeaOkU8TjpHZjgBTRhYKXJ3N5oACV3R5ARHDiHHQ=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdCWVXZg0M5bAA--.11991S2;
        Wed, 14 Apr 2021 10:38:16 +0800 (CST)
Date:   Wed, 14 Apr 2021 10:38:14 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/7] docs/zh_CN: Add translation
 zh_CN/doc-guide/kernel-doc.rst
Message-ID: <20210414023814.GA23966@bobwxc.top>
References: <cover.1618295149.git.bobwxc@email.cn>
 <783d134b1dd18f580f2c0511c2330382a86e79b5.1618295149.git.bobwxc@email.cn>
 <87lf9lrgp3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lf9lrgp3.fsf@meer.lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdCWVXZg0M5bAA--.11991S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7tF1kCF18WryDtFWUArb_yoW5Jr17pF
        4vkayfGan3Ar17G3W3Wr1xCFW3AFWxua15Kr4xtw1rJrnIyrWktr47Kryj934xurW0yFW5
        ZF12vFyj93y7ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8JwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvjxUTUGOUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 13, 2021 at 03:57:12PM -0600, Jonathan Corbet wrote:
> Wu XiangCheng <bobwxc@email.cn> writes:
> 
> > Add new translation
> >   Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../zh_CN/doc-guide/kernel-doc.rst            | 500 ++++++++++++++++++
> >  1 file changed, 500 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> >
> > diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> > new file mode 100644
> > index 000000000000..b0427944f8f0
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> > @@ -0,0 +1,500 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/doc-guide/kernel-doc.rst
> > +
> > +:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +编写kernel-doc注释
> > +==================
> > +
> > +Linux内核源文件可以包含kernel-doc格式的结构化文档注释，用以描述代码的函数、
> > +类型和设计。将文档嵌入源文件更容易保持文档最新。
> > +
> > +.. note:: 内核文档格式与javadoc、gtk-doc或Doxygen看似很相似，但由于历史原因，
> > +          实际有着明显的不同。内核源包含成千上万个kernel-doc注释。请坚持遵循
> > +          此处描述的风格。
> > +
> > +.. note:: kernel-doc无法包含Rust代码：请参考
> > +          :ref:`Documentation/rust/docs.rst <rust_docs>`。

Hi Jonathan,

> 
> Note that this reference adds a warning to the docs-next build - this
> translation is evidently against linux-next instead.  The warning will
> eventually go away, but it would be better not to do this if possible.

Yeah, seems rust doc do not merge into docs-next yet. It's quite new.

BTW, I'd like to ask does "git.lwn.net" has a web access like git-web or
cgit... ?

> 
> Also, there is no need for a :ref: here; just say
> "Documentation/rust/docs.rst" and the automarkup code will do the right
> thing.  Yes, that should be changed in the original as well.
> 

I'll send another patch to replace the two refs.

And use "Documentation/rust/docs.rst" will also fix the warning.


Thanks,

Wu X.C.

