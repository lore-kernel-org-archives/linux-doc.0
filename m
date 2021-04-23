Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0521AC433B4
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 16:05:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB4E96103E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 16:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhDWQGX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Apr 2021 12:06:23 -0400
Received: from m32-153.88.com ([43.250.32.153]:26439 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229691AbhDWQGX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Apr 2021 12:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=NZs0RRVKseK0PV9N0u6OEAj51EPIjWkjrqfjW
        rqcszc=; b=fizTrFywwSaNWk+eT+g7rfDrMZoydgnjL89aMRxRMtUNt8MIYO0Nz
        P6XgSqwmJG4bzZeUMqazas5d1f7AQ2jflEo/dxCzs1T/BFAu7hTx93FGd3Im4jeE
        tCPmAKDrCe8ntucyBOX3opr7tjplsTMqC/MAcqFCJgua87+V+GXDNc=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDXJllR8IJgVJgGAA--.19064S2;
        Sat, 24 Apr 2021 00:05:39 +0800 (CST)
Date:   Sat, 24 Apr 2021 00:05:32 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        Yanteng Si <siyanteng01@gmail.com>
Subject: Re: [PATCH 3/3] docs/zh_CN: add core-api printk-formats.rst
 translation
Message-ID: <20210423160532.GB28530@bobwxc.top>
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <c79b09e5d9ea442bd301894a7bc512eebfddcedc.1618836460.git.siyanteng@loongson.cn>
 <20210420052823.GA14788@bobwxc.top>
 <CAMU9jJpO6ktBrCqAYMbn6x0qSkhrM=QN4w19CixoYvX=tVi1aw@mail.gmail.com>
 <CAMU9jJqrf76hxj2FNE+0JbQ+T0NVqA+LED_WokFO2NTTcyDRAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJqrf76hxj2FNE+0JbQ+T0NVqA+LED_WokFO2NTTcyDRAA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDXJllR8IJgVJgGAA--.19064S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1ktF18tF48Jw1kuF4rZrb_yoW8WF45p3
        WfKF4fGa1kJF17ArnIgr13Jr13tay0ka15uwsIqr1rZFyqkryUJr4Utryrur9rCryUAF4I
        yFsxtrWvkryYy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r4UM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1U
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r1l42xK82IYc2
        Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZE
        Xa7IUboKZJUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 23, 2021 at 11:22:48PM +0800, teng sterling wrote:
> Hi all
> 
> sorry, There are some new modify.
> 
> teng sterling <sterlingteng@gmail.com> 于2021年4月21日周三 下午3:15写道：
> >
> > Wu X.C. <bobwxc@email.cn> 于2021年4月20日周二 下午1:28写道：
> > On Mon, Apr 19, 2021 at 09:10:57PM +0800, Yanteng Si wrote:
> > > This patch translates Documentation/core-api/printk-formats.rst into Chinese.
> > >
> > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > ---
> > >  .../zh_CN/core-api/printk-formats.rst         | 577 ++++++++++++++++++
> > >  1 file changed, 577 insertions(+)
> > >  create mode 100644 Documentation/translations/zh_CN/core-api/printk-formats.rst
> > >
> > > diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> > > new file mode 100644
> > > index 000000000000..8552bbb3c797
> > > --- /dev/null
> > > +++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> > > +
[...]
> > > +资源（Resources）结构体
> 结构体资源（Resources）
> 
> > > +-----------------------
> > > +
> > > +::
> > > +
> > > +     %pr     [mem 0x60000000-0x6fffffff flags 0x2200] or
> > > +             [mem 0x0000000060000000-0x000000006fffffff flags 0x2200]
> > > +     %pR     [mem 0x60000000-0x6fffffff pref] or
> > > +             [mem 0x0000000060000000-0x000000006fffffff pref]
> > > +
> > > +用于打印结构资源。 ``R`` 和 ``r`` 说明符的结果是打印出的资源带有(R)或不带有(r)解码标志
> 打印结构体资源
> >            ^^^^^^^^
> > OK!

Aye.

Wu X.C.

