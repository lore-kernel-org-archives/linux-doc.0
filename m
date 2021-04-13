Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB6DC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA2DE613B2
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244253AbhDMFec (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 01:34:32 -0400
Received: from m32-153.88.com ([43.250.32.153]:32332 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229705AbhDMFec (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 01:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=vUYvv/UVntUpsdkn0cd0Shhom2Hrk4u8WnHiF
        D0Iihg=; b=G6O+GQQbZ2Goj8BLyRoyG3Cl+Hj0AsYbjavDjvtEL5cUuSNKQdeWn
        zD597dHZFgYDipkX6e9QMgwHJxfgoVaDKnBxMxbRl0sJABUi4fszDglatIJDeTDK
        h45d4sMIdlUhnvY2Xgh+bCGoN4m6dQxAYDBW+xlW0PUkOqkeXIqIjs=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHkyNPLXVglgltAA--.58494S2;
        Tue, 13 Apr 2021 13:34:09 +0800 (CST)
Date:   Tue, 13 Apr 2021 13:34:07 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 4/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/parse-headers.rst
Message-ID: <20210413053407.GA19607@bobwxc.top>
References: <cover.1617699755.git.bobwxc@email.cn>
 <ebccf009f3cf77b3340e39e9675f26d8d75ca3f6.1617699755.git.bobwxc@email.cn>
 <CAMU9jJpeyNBMg4a0GcyBZfPLtP2JheTD-JZ3e197VweyYhv-jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJpeyNBMg4a0GcyBZfPLtP2JheTD-JZ3e197VweyYhv-jg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHkyNPLXVglgltAA--.58494S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4kKryDtF1fKr1ftrWfAFb_yoW8ArWrpw
        1kKrZ3Ganrtr1akrWSgrW7AF15AFWfua1jg3Wxtw1fKrWvqFW5JrsIkry3Wr9xXFW8AFy8
        uFWYgr1UCr13AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_GrWl42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07UbBMNUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 13, 2021 at 12:12:32AM +0800, teng sterling wrote:
> Wu XiangCheng <bobwxc@email.cn> 于2021年4月7日周三 下午3:51写道：
> >
> > Add new translation
> >   Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/doc-guide/parse-headers.rst         | 182 ++++++++++++++++++
> >  1 file changed, 182 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> >
> > diff --git a/Documentation/translations/zh_CN/doc-guide/parse-headers.rst b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> > new file mode 100644
> > index 000000000000..4f6fa083a3c5
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> > @@ -0,0 +1,182 @@
[...]
> > +
> > +
> > +说明
> > +~~~~~
> > +
> > +
> > +通过描述API的文档中的有交叉引用的解析后文本块，将C头文件或源文件（<C文件>）

> This line is difficult for me to understand, and it seems to say:
> 通过解析C头文件或C文件中对API（一个函数原型）描述的文本块（以一定格式约定写的注释）……到ReStructureText。
> I'm not sure.   ：）
> 

I thought again, maybe

通过C头文件或源文件（<C文件>）中为描述API文档编写的
带交叉引用的 ..预格式化文本 块将其转换成ReStructureText。


> > +转换进ReStructureText。它接受一个可选的<例外文件>，其中描述了哪些元素将被忽略
> > +或指向非默认引用。
> > +
[...]
> > --
> > 2.20.1
> >
> 
> Thanks！
> 
> Yan teng

