Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2623AC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 08:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4D546102A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 08:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbhDUIMj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Apr 2021 04:12:39 -0400
Received: from m32-153.88.com ([43.250.32.153]:19546 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234439AbhDUIMj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Apr 2021 04:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=X9WzkN7QRxqIdlha33D5jP4WGYLE8KqhQmRKt
        zHxTpY=; b=aUQCFk1ncDgJmT4HqvJHd6I5eHp8H56Fjeu0P83wLGbupCIdFEDuJ
        fygBOPzyjIjqI7NcR0ePJshA32aNA7V8z4dY1V6Z2PfZiBfQtnh4diuE9eNPapLF
        JykGlyfAthVKE+epgTYdUV2aU+gpB1TjpGLtYKWDf2KWeG6b91CqLM=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDXJllH3n9gAP8BAA--.5885S2;
        Wed, 21 Apr 2021 16:11:52 +0800 (CST)
Date:   Wed, 21 Apr 2021 16:11:50 +0800
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
Message-ID: <20210421081150.GA22902@bobwxc.top>
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <c79b09e5d9ea442bd301894a7bc512eebfddcedc.1618836460.git.siyanteng@loongson.cn>
 <20210420052823.GA14788@bobwxc.top>
 <CAMU9jJpO6ktBrCqAYMbn6x0qSkhrM=QN4w19CixoYvX=tVi1aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJpO6ktBrCqAYMbn6x0qSkhrM=QN4w19CixoYvX=tVi1aw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDXJllH3n9gAP8BAA--.5885S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4DZr15Zr4rWF1fJFW7CFg_yoW8Xr45p3
        WfKr93Gan3t3W7GwsagryUtr15Aay8uayUWanIqw1YvF1kCF1Fyr4xtr1fur9agryxAFW0
        vr4avFyDua45A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_GFyl42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07Ur8nOUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 21, 2021 at 03:15:40PM +0800, teng sterling wrote:
> Wu X.C. <bobwxc@email.cn> 于2021年4月20日周二 下午1:28写道：
> On Mon, Apr 19, 2021 at 09:10:57PM +0800, Yanteng Si wrote:
> > This patch translates Documentation/core-api/printk-formats.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../zh_CN/core-api/printk-formats.rst         | 577 ++++++++++++++++++
> >  1 file changed, 577 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/core-api/printk-formats.rst
> >
> > diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> > new file mode 100644
> > index 000000000000..8552bbb3c797
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
[...]
> > +
> > +用于打印IPv6网络顺序的16位十六进制地址。 ``I6`` 和 ``i6`` 说明符的结果是
> > +打印的地址有(I6)或没有(i6)分号。始终使用前导零。
> > +
> > +额外的 ``c`` 说明符可与 ``I`` 说明符一起使用，以打印压缩的IPv6地址，如下
> > +所述
> > +https://tools.ietf.org/html/rfc5952
> > +
> 
> 如https://sspai.com/post/45516所述
> 
> OK！ 

Oh, here I wrote a wrong link.
Should be

	如https://tools.ietf.org/html/rfc5952所述

Sorry for the inconvience!

Wu

