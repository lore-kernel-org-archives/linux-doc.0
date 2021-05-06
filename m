Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1886C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 12:00:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 946FF613E4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 12:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhEFMBp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 08:01:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:45520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232144AbhEFMBn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 08:01:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0809C61132;
        Thu,  6 May 2021 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620302445;
        bh=VFpEVeaa7gU7YzF2rt9Wdkj/e5kAXE7N2Zojw4mSCPE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g8No9gQcTjuodaTKORTRNc0c9LFJ4iL2XeBtDV5iruDF0wd3B5q2cgn2H3GRSMyiG
         LZ4L74wgLcScNM3wKjlEKsyCBh9FJhbwtVK1tKtw4GSrUMl7vCFr18q9kUxjaO1T4E
         QcDzBsEK0FhALbfnyd5KJ/KXCjahQ5JSfg4C5Dn1vW33aD3eeRh3G/+pmZb07UNFsC
         mPOx5oXxe+B5uZWlnEVG0Rqmn4rbbyIOid3KSaG7WO4IXCY0BCnXoU6Urg+oVmITEW
         yK3kPe16TIwhZ4syoJNb/vipbiZpYPKkQU+ppa4nvFlCBiEumI9vQStGnfb13F8QX7
         TWLRjL2N1gaow==
Date:   Thu, 6 May 2021 14:00:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Constantine Shulyupin <constantine.shulyupin@gmail.com>,
        linux-doc@vger.kernel.org,
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
        mic@linux.microsoft.com, mkl@pengutronix.de, mpe@ellerman.id.au,
        mszeredi@redhat.com, natet@google.com, nicolas.dichtel@6wind.com,
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
Message-ID: <20210506135559.7dea098e@coco.lan>
In-Reply-To: <YJPS8i3XYGnXiCak@zn.tnic>
References: <CAE7jHC_r86KNb_+beU10Vq3DU9wGA3X=sHpDjH-QQNrDGU5taw@mail.gmail.com>
        <YJPS8i3XYGnXiCak@zn.tnic>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 6 May 2021 13:28:50 +0200
Borislav Petkov <bp@alien8.de> escreveu:

> On Thu, May 06, 2021 at 01:58:35PM +0300, Constantine Shulyupin wrote:
> > Dear Linux kernel documentation writers and readers:
> > 
> > Writing Linux documentation is a huge complex collaborative process.
> > To make it better I invite you to contribute to
> > https://en.wikibooks.org/wiki/The_Linux_Kernel .

And btw, the licenses there are not compatible:

	Text is available under the Creative Commons Attribution-ShareAlike License.

Pointing to:
	CC BY-SA 3.0 

IANAL, but, AFAIKT, is not compatible with GPL version 2[1].

[1] at least, there's a comment here:
    https://github.com/todbot/SoftI2CMaster/issues/14
    I didn't read it in full, but it seems to be endorsed by CC
    people:
	https://creativecommons.org/2015/10/08/cc-by-sa-4-0-now-one-way-compatible-with-gplv3/
    Btw, even if this were using CC BY-SA 4.0, it would still be
    incompatible with GPL v2, as the one-way compatibility is just
    with v3.

So, porting texts/documents from/to wikibooks can be an issue from
legal standpoint.

If you want to contribute with Kernel docs, the best way would be
to send additions/improvements against the Kernel tree to the
linux-doc mailing list.

> 
> You have seen this, right?
> 
> https://www.kernel.org/doc/html/latest/
> 
> which is generated from the kernel repo.
> 
> I'm sure Jon has even a grand idea about how to organize our
> documentation in an even better way.
> 
> So it looks like we already have most of the topics and you could
> probably even generate the wikibook from the kernel documentation. :)
> 
> Thx.
> 



Thanks,
Mauro
