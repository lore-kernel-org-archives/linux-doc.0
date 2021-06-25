Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6CEC2B9F4
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 19:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E10061976
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 19:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhFYT3o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 15:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYT3o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Jun 2021 15:29:44 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FA0C061574
        for <linux-doc@vger.kernel.org>; Fri, 25 Jun 2021 12:27:22 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o22so5984518wms.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Jun 2021 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/oK0jQ+nVsuIPUgqjRK3RcXtuf8pq3P6VppZA/DQBw=;
        b=VqNjh531wCKGPAl5s6XZxUqHtmXV5UmxMAs4/YdF8gdDDB+VuSb+emB79imNcvnU/U
         1mIQciLAquL6p5WhuU5ix5H1P35IvDlShVdp5qhzIhGg28jmpChu35Iz2AwkaL+tcI68
         OGWP0oO7wsKcqz8OaIBrz6eQZHaoLEX6MA0izS5yvIr/BzfTd9CkzPUXUU/6AzuuEJn1
         C+4euc9Q76k5SVQr8ZfxZh5jhLMFxG/2YixWMwhKc+zRGiXoc7uDWrF8We3tPUhPNYGf
         p4I0xxnwoRGNVN+59j6TQD/uokKelJjKsqfYnjXlL8w8y0SKimsdipqdCU+aWlFh4QtE
         IzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/oK0jQ+nVsuIPUgqjRK3RcXtuf8pq3P6VppZA/DQBw=;
        b=L6Ex8fonwDuSTD/hwabQPV8BEmxv7pm+FknlF/H0Tv5agHedMdEJf+3paZ/6fjJ2Da
         8MYgopgiZgMGGROZUg/5S5mHzgo/ZXpYeiEGzXnIBwABZdZiKE1oJ2X+KjYlRFacuUs8
         sw2f/10A/0vc58Q7iGygSaKE9YKbvFxooVM4yd2vFe4uTTW+Kjfz7QHdF4KlBGZ39UjL
         Czvp3fDliO0h5FcSVRfeNtr4ASHFCO4aeTwm7mrvu3vhisxhBiOzYQAEOrSBatdE3Bkl
         X1qsE4FlFPP+OEKyU55JQXy6EyDdgi/oYHJOqJwf/Afio+j8lbJ8Z9/RnFnBWd55e9tw
         qYfg==
X-Gm-Message-State: AOAM531MDJ/0fScTsl1/Pmx6fSh6NFb13qozKYEdoHfXhWBuWp4k5RWE
        7yHRogfRLc4pJ47KGub/6aZ+ZMVHinDtkS7h/ho=
X-Google-Smtp-Source: ABdhPJwOVnoGxAFANTW/yzbr3iO8FLtZF/BAXXMIYRzGTVvabdpwuQJYaPfYIPpObqmgEzyAun+Op6ZaSD4Xo5Osm9w=
X-Received: by 2002:a05:600c:4417:: with SMTP id u23mr12520669wmn.26.1624649241220;
 Fri, 25 Jun 2021 12:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAE7jHC_r86KNb_+beU10Vq3DU9wGA3X=sHpDjH-QQNrDGU5taw@mail.gmail.com>
 <YJP6bH/RXxcd/0Xf@mit.edu>
In-Reply-To: <YJP6bH/RXxcd/0Xf@mit.edu>
From:   Constantine Shulyupin <constantine.shulyupin@gmail.com>
Date:   Fri, 25 Jun 2021 22:27:09 +0300
Message-ID: <CAE7jHC-mPi285C4ydzQ3ZEydNEJGewEjxoLFEwozyD-_XB2RmQ@mail.gmail.com>
Subject: Re: Wikibook Linux kernel
To:     "Theodore Ts'o" <tytso@mit.edu>
Cc:     linux-doc@vger.kernel.org,
        kernelnewbies <kernelnewbies@kernelnewbies.org>, aaptel@suse.com,
        aisheng.dong@nxp.com, alexandru.elisei@arm.com,
        alex.williamson@redhat.com, andreyknvl@google.com,
        anshuman.khandual@arm.com, aquini@redhat.com,
        Arnd Bergmann <arnd@arndb.de>, ast@kernel.org, axboe@kernel.dk,
        bernard@vivo.com, bobwxc@email.cn, bp@alien8.de,
        brijesh.singh@amd.com, broonie@kernel.org, catalin.marinas@arm.com,
        chris.packham@alliedtelesis.co.nz,
        Jonathan Corbet <corbet@lwn.net>, cw00.choi@samsung.com,
        daniel@iogearbox.net, davem@davemloft.net,
        David Gow <davidgow@google.com>, dhowells@redhat.com,
        dikshita@codeaurora.org, Daniel Latypov <dlatypov@google.com>,
        eesposit@redhat.com, eric.auger@redhat.com,
        Erik Flodin <erik@flodin.me>, erik.rosen@metormote.com,
        federico.vaga@vaga.pv.it, festevam@gmail.com,
        georgi.djakov@linaro.org, gi-oh.kim@cloud.ionos.com,
        gi-oh.kim@ionos.com, gregkh@linuxfoundation.org,
        Gustavo.Pimentel@synopsys.com, haren@linux.ibm.com,
        hca@linux.ibm.com, hch@lst.de, hdegoede@redhat.com,
        heikki.krogerus@linux.intel.com, hengqi.chen@gmail.com,
        hverkuil-cisco@xs4all.nl, i@zenithal.me, jaegeuk@kernel.org,
        James.Bottomley@hansenpartnership.com,
        jamorris@linux.microsoft.com, jarkko@kernel.org, jgg@nvidia.com,
        jianyong.wu@arm.com, jonas@protocubo.io,
        Jonathan.Cameron@huawei.com, kabel@kernel.org,
        Kees Cook <keescook@chromium.org>, kuba@kernel.org,
        kubernat@cesnet.cz, Linus Walleij <linus.walleij@linaro.org>,
        linux@leemhuis.info, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Guenter Roeck <linux@roeck-us.net>, luzmaximilian@gmail.com,
        macro@orcam.me.uk, marcan@marcan.st, masahiroy@kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>, maz@kernel.org,
        mchehab+huawei@kernel.org, mic@linux.microsoft.com,
        mkl@pengutronix.de, mpe@ellerman.id.au, mszeredi@redhat.com,
        natet@google.com, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        niklas.soderlund+renesas@ragnatech.se, npiggin@gmail.com,
        ogabbay@kernel.org, parav@nvidia.com, pbonzini@redhat.com,
        Peter Collingbourne <pcc@google.com>, peterz@infradead.org,
        pmladek@suse.com, rafael.j.wysocki@intel.com, rppt@linux.ibm.com,
        saeedm@nvidia.com, sakari.ailus@linux.intel.com,
        sbhat@linux.ibm.com, schnelle@linux.ibm.com,
        sean.j.christopherson@intel.com, sebastian.reichel@collabora.com,
        shy828301@gmail.com, siyanteng@loongson.cn,
        skhan@linuxfoundation.org, sozeri@habana.ai,
        Steve Rutherford <srutherford@google.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        stephane.blondon@gmail.com, stern@rowland.harvard.edu,
        stfrench@microsoft.com, sumit.garg@linaro.org,
        tamar.mashiah@intel.com, tglx@linutronix.de,
        tom.zanussi@linux.intel.com, torvalds@linux-foundation.org,
        unixbhaskar@gmail.com, vbabka@suse.cz, vincenzo.frascino@arm.com,
        vkoul@kernel.org, vladyslavt@nvidia.com,
        wilken.gottwalt@posteo.net, willy@infradead.org, yangbo.lu@nxp.com,
        yangtiezhu@loongson.cn, yuchao0@huawei.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thank you, Ted, for pointing to https://wiki.kernel.org/.
Out of 29 wikis 8 are outdated. Here is a summary:
https://en.wikibooks.org/wiki/The_Linux_Kernel/wikis

Regards


On Thu, 6 May 2021 at 17:18, Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Thu, May 06, 2021 at 01:58:35PM +0300, Constantine Shulyupin wrote:
> > Dear Linux kernel documentation writers and readers:
> >
> > Writing Linux documentation is a huge complex collaborative process.
> > To make it better I invite you to contribute to
> > https://en.wikibooks.org/wiki/The_Linux_Kernel
>
> There are some wiki's that are available at *.wiki.kernel.org.  For
> example, ext4.wiki.kernel.org.  We've largely abandoned it, in favor
> of using Documentation in the kernel sources, because if you leave it
> "updated by anyone", unless you have people constantly watching for
> spam or trash updates which have to be reverted, it quickly becomes a
> mess.  Or you can keep tight control over who you give accounts to,
> but then it doesn't get updated all that often.
>
> Keeping the documentation in sync with the kernel sources means it's
> much more likely for the documentation to be updated when the kernel
> is updated, and so for example we've migrated:
>
> https://ext4.wiki.kernel.org/index.php/Ext4_Disk_Layout
>
> to:
>
> https://www.kernel.org/doc/html/latest/filesystems/ext4/index.html
>
> with the sources available at:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git/tree/Documentation/filesystems/ext4
>
> ... and been much happier with the result.
>
> Cheers,
>
>                                         - Ted



-- 
Constantine Shulyupin
