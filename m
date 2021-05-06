Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC78EC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 14:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BAFE61075
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 14:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234602AbhEFOSw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 10:18:52 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:55086 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S234612AbhEFOSv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 10:18:51 -0400
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 146EHGrC026650
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 6 May 2021 10:17:17 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
        id B22B415C39BD; Thu,  6 May 2021 10:17:16 -0400 (EDT)
Date:   Thu, 6 May 2021 10:17:16 -0400
From:   "Theodore Ts'o" <tytso@mit.edu>
To:     Constantine Shulyupin <constantine.shulyupin@gmail.com>
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
Message-ID: <YJP6bH/RXxcd/0Xf@mit.edu>
References: <CAE7jHC_r86KNb_+beU10Vq3DU9wGA3X=sHpDjH-QQNrDGU5taw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
> https://en.wikibooks.org/wiki/The_Linux_Kernel

There are some wiki's that are available at *.wiki.kernel.org.  For
example, ext4.wiki.kernel.org.  We've largely abandoned it, in favor
of using Documentation in the kernel sources, because if you leave it
"updated by anyone", unless you have people constantly watching for
spam or trash updates which have to be reverted, it quickly becomes a
mess.  Or you can keep tight control over who you give accounts to,
but then it doesn't get updated all that often.

Keeping the documentation in sync with the kernel sources means it's
much more likely for the documentation to be updated when the kernel
is updated, and so for example we've migrated:

https://ext4.wiki.kernel.org/index.php/Ext4_Disk_Layout

to:

https://www.kernel.org/doc/html/latest/filesystems/ext4/index.html

with the sources available at:

https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git/tree/Documentation/filesystems/ext4

... and been much happier with the result.

Cheers,

					- Ted
