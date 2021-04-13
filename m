Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53E7C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 04:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0BFB613AE
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 04:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhDME6Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 00:58:25 -0400
Received: from [43.250.32.171] ([43.250.32.171]:45741 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229515AbhDME6Y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 00:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=WXOpFFH9MVFWY7Xzunx0EDN/cuHAsfgac56hN
        1GHt4w=; b=VXApu/ojWOQEik163/hUGEFiKlKl6+rvxIBBpbcqAkpgM/gjvEhtv
        oJyoWGx5xxrz3zp4FoKtMGexLQRLzg44DOypXDPFFZsgVnNuI1i+PXRyCW5RHtZE
        B84nkr6J1mp6MEdkkQeOwciXf7/M/o0u9iZbaPyJHSeV8aaW9J0q6k=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgD3atHRJHVgZGdaAA--.7427S2;
        Tue, 13 Apr 2021 12:57:55 +0800 (CST)
Date:   Tue, 13 Apr 2021 12:57:53 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <seakeel@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/8] docs/zh_CN: Add two image example files
Message-ID: <20210413045753.GA17682@bobwxc.top>
References: <cover.1617699755.git.bobwxc@email.cn>
 <26826d7401a12a82ced72936c74c698b2875fe93.1617699755.git.bobwxc@email.cn>
 <c0fb15ba-0433-3d6c-385f-3b5e9d6461a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0fb15ba-0433-3d6c-385f-3b5e9d6461a7@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgD3atHRJHVgZGdaAA--.7427S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF48ZFyfKw47KF13ur48JFb_yoW8Krykpa
        yDKryxKan7tw1jk3y8WrWUCF15CFWxCa13Ww1Iqwn5Xrn5tw4vqr4DKryagrZ7Jry0yFWY
        qF4FvF1DuFy5ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Gryl42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUUKZX7UUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 13, 2021 at 12:51:52PM +0800, Alex Shi wrote:
> 
> 
> On 2021/4/7 下午3:50, Wu XiangCheng wrote:
> > Add two image exaple files used by zh_CN/doc-guide/sphinx.rst
> >   Documentation/translations/zh_CN/doc-guide/hello.dot
> >   Documentation/translations/zh_CN/doc-guide/svg_image.svg
> > 
> 
> Could we just use/reference to original docs? Looks there no much
> meaningful to have Chinese version of them. Also we may save new
> translations if original doc changed.
> 
> Thanks
> Alex

OK

> 
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/translations/zh_CN/doc-guide/hello.dot   |  3 +++
> >  .../translations/zh_CN/doc-guide/svg_image.svg         | 10 ++++++++++
> >  2 files changed, 13 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.dot
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_image.svg
> > 
> > diff --git a/Documentation/translations/zh_CN/doc-guide/hello.dot b/Documentation/translations/zh_CN/doc-guide/hello.dot
> > new file mode 100644
> > index 000000000000..2740ad882e6a
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/doc-guide/hello.dot
> > @@ -0,0 +1,3 @@
> > +graph G {
> > +      你好 -- 世界
> > +}
> > diff --git a/Documentation/translations/zh_CN/doc-guide/svg_image.svg b/Documentation/translations/zh_CN/doc-guide/svg_image.svg
> > new file mode 100644
> > index 000000000000..5405f85b8137
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/doc-guide/svg_image.svg
> > @@ -0,0 +1,10 @@
> > +<?xml version="1.0" encoding="UTF-8"?>
> > +<!-- originate: https://commons.wikimedia.org/wiki/File:Variable_Resistor.svg -->
> > +<svg xmlns="http://www.w3.org/2000/svg"
> > +	version="1.1" baseProfile="full"
> > +	width="70px" height="40px" viewBox="0 0 700 400">
> > +	<line x1="0" y1="200" x2="700" y2="200" stroke="black" stroke-width="20px"/>
> > +	<rect x="100" y="100" width="500" height="200" fill="white" stroke="black" stroke-width="20px"/>
> > +	<line x1="180" y1="370" x2="500" y2="50" stroke="black" stroke-width="15px"/>
> > +	<polygon points="585 0 525 25 585 50" transform="rotate(135 525 25)"/>
> > +</svg>
> > 

