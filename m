Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AADC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 11:28:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77E64613E3
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 11:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbhEFL3x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 07:29:53 -0400
Received: from mail.skyhub.de ([5.9.137.197]:36648 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234589AbhEFL3w (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 07:29:52 -0400
Received: from zn.tnic (p200300ec2f0c9f00fce1694b4b9f4649.dip0.t-ipconnect.de [IPv6:2003:ec:2f0c:9f00:fce1:694b:4b9f:4649])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C23B51EC027D;
        Thu,  6 May 2021 13:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1620300532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=qSr9erdTtmFQPEy602QmLuBnh3zcDUD+5x1WA62Gp+s=;
        b=S0Ay0D2tcJf1nvmCdFfOP4DuXox9u49JhYvP3D/iyu4r8tjMKRCyf8MtMZSrxTb6kYycdM
        UxfWd0kweP9a63tuK5PfcHK9ru/YLFqMtRmDtZ/7ZovuUxiGy/lt2T03gP2mCNWV1BDBFW
        M12WgYv5i2/yiz14ZWWX5Klh1HsmIAs=
Date:   Thu, 6 May 2021 13:28:50 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Constantine Shulyupin <constantine.shulyupin@gmail.com>
Cc:     linux-doc@vger.kernel.org,
        kernelnewbies <kernelnewbies@kernelnewbies.org>, aaptel@suse.com,
        aisheng.dong@nxp.com, alexandru.elisei@arm.com,
        alex.williamson@redhat.com, andreyknvl@google.com,
        anshuman.khandual@arm.com, aquini@redhat.com,
        Arnd Bergmann <arnd@arndb.de>, ast@kernel.org, axboe@kernel.dk,
        bernard@vivo.com, bobwxc@email.cn, brijesh.singh@amd.com,
        broonie@kernel.org, catalin.marinas@arm.com,
        chris.packham@alliedtelesis.co.nz,
        Jonathan Corbet <corbet@lwn.net>, cw00.choi@samsung.com,
        daniel@iogearbox.net, davem@davemloft.net, davidgow@google.com,
        dhowells@redhat.com, dikshita@codeaurora.org, dlatypov@google.com,
        eesposit@redhat.com, eric.auger@redhat.com, erik@flodin.me,
        erik.rosen@metormote.com, federico.vaga@vaga.pv.it,
        festevam@gmail.com, georgi.djakov@linaro.org,
        gi-oh.kim@cloud.ionos.com, gi-oh.kim@ionos.com,
        gregkh@linuxfoundation.org, Gustavo.Pimentel@synopsys.com,
        haren@linux.ibm.com, hca@linux.ibm.com, hch@lst.de,
        hdegoede@redhat.com, heikki.krogerus@linux.intel.com,
        hengqi.chen@gmail.com, hverkuil-cisco@xs4all.nl, i@zenithal.me,
        jaegeuk@kernel.org, James.Bottomley@hansenpartnership.com,
        jamorris@linux.microsoft.com, jarkko@kernel.org, jgg@nvidia.com,
        jianyong.wu@arm.com, jonas@protocubo.io,
        Jonathan.Cameron@huawei.com, kabel@kernel.org,
        keescook@chromium.org, kuba@kernel.org, kubernat@cesnet.cz,
        linus.walleij@linaro.org, linux@leemhuis.info,
        linux@rasmusvillemoes.dk, Guenter Roeck <linux@roeck-us.net>,
        luzmaximilian@gmail.com, macro@orcam.me.uk, marcan@marcan.st,
        masahiroy@kernel.org, mathieu.poirier@linaro.org, maz@kernel.org,
        mchehab+huawei@kernel.org, mic@linux.microsoft.com,
        mkl@pengutronix.de, mpe@ellerman.id.au, mszeredi@redhat.com,
        natet@google.com, nicolas.dichtel@6wind.com,
        niklas.soderlund+renesas@ragnatech.se, npiggin@gmail.com,
        ogabbay@kernel.org, parav@nvidia.com, pbonzini@redhat.com,
        pcc@google.com, peterz@infradead.org, pmladek@suse.com,
        rafael.j.wysocki@intel.com, rppt@linux.ibm.com, saeedm@nvidia.com,
        sakari.ailus@linux.intel.com, sbhat@linux.ibm.com,
        schnelle@linux.ibm.com, sean.j.christopherson@intel.com,
        sebastian.reichel@collabora.com, shy828301@gmail.com,
        siyanteng@loongson.cn, skhan@linuxfoundation.org, sozeri@habana.ai,
        srutherford@google.com, stanimir.varbanov@linaro.org,
        stephane.blondon@gmail.com, stern@rowland.harvard.edu,
        stfrench@microsoft.com, sumit.garg@linaro.org,
        tamar.mashiah@intel.com, tglx@linutronix.de,
        tom.zanussi@linux.intel.com, torvalds@linux-foundation.org,
        unixbhaskar@gmail.com, vbabka@suse.cz, vincenzo.frascino@arm.com,
        vkoul@kernel.org, vladyslavt@nvidia.com,
        wilken.gottwalt@posteo.net, willy@infradead.org, yangbo.lu@nxp.com,
        yangtiezhu@loongson.cn, yuchao0@huawei.com, yuzenghui@huawei.com
Subject: Re: Wikibook Linux kernel
Message-ID: <YJPS8i3XYGnXiCak@zn.tnic>
References: <CAE7jHC_r86KNb_+beU10Vq3DU9wGA3X=sHpDjH-QQNrDGU5taw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE7jHC_r86KNb_+beU10Vq3DU9wGA3X=sHpDjH-QQNrDGU5taw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 06, 2021 at 01:58:35PM +0300, Constantine Shulyupin wrote:
> Dear Linux kernel documentation writers and readers:
> 
> Writing Linux documentation is a huge complex collaborative process.
> To make it better I invite you to contribute to
> https://en.wikibooks.org/wiki/The_Linux_Kernel .

You have seen this, right?

https://www.kernel.org/doc/html/latest/

which is generated from the kernel repo.

I'm sure Jon has even a grand idea about how to organize our
documentation in an even better way.

So it looks like we already have most of the topics and you could
probably even generate the wikibook from the kernel documentation. :)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
