Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF2BC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 10:58:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3649B6112F
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 10:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234589AbhEFK7r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 06:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhEFK7q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 06:59:46 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA97EC061574
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 03:58:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x5so5110408wrv.13
        for <linux-doc@vger.kernel.org>; Thu, 06 May 2021 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Id4AvPNBtpL9YtyIgyvvBrv14fke9sfiiEzo5zUIs1o=;
        b=oOe+K2BVhpJKaxuW5cgfvQR+KHB70so1IiKKMI3nlLOhOrthJ6Csj5Z4Lc3js37+HH
         CTPzfpnF21OoMRJq7Hv+oOOnIdNBJ0JLJ8NXHVjJS9hZPT7cYEYepFDs68Q9Ncw1KHAZ
         yvCy47ApBQ7QdNtmnUPfd4bzcfLtU4an0A6A9VzhzN3Zebon/4pj49blRe0LgeYqWV1+
         0Pwpz6U+tkUGRjUarhy5WI9PznQMRHhWWZruJx7gmUdElvmUblJHUMItbZ0cYuW9gDyr
         0fdbLCHJyqdRotByRFJtE3MSBwS+rv6YZYVxZz3x9kIWeYkFgzjebNpXsm38ju9TQczz
         tvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Id4AvPNBtpL9YtyIgyvvBrv14fke9sfiiEzo5zUIs1o=;
        b=IMGVVKWgd56i+Aumw+mBXuKSPGm7X7vtopqr+ieQJiwlEQN8+NEupSycBDouRriA7w
         CpRVxS8AKa+vqhF6H8JlGtw81PYrVKKWZoEGDQPcBSdXlhsIo/fttBiePzchJy+vOqLu
         MN7Obz7RPB0ZT9jFDHs0A9pophUDlNVFMjpangW8qbt/gxZYMcj1h7AI1J0nnb76bPIw
         oeJGRvKu1/nS4cZf4KA1MpRLnzHj+DW7SYA5QiXQyIWVmqjRxYut03wnixHZXsbXTfWl
         gaItLWPUbrT/utiR3vyXkbkHRJKIph1I17+Vpm/w8v1sg9l2wfNfrrhcSEGI4Rf9A+1P
         f8xg==
X-Gm-Message-State: AOAM530PTtU0m03FMPCJN5lXx/NuJ3lj61G6YO+QAfbWErloHrvR0qHw
        XyLkVLdw0LhudCIwlBEQsOZ4R4qLjLZGIfw7nPwJ1xkXWhA=
X-Google-Smtp-Source: ABdhPJyK8U1fGGO4YHSoGi9XESHPSADCWoI+qgPKKwoDm9I+ymLQPpE1hAA3EqdUs4bTGl7s4j5NhiTz++HBBAcP4d0=
X-Received: by 2002:adf:f891:: with SMTP id u17mr4439625wrp.352.1620298727212;
 Thu, 06 May 2021 03:58:47 -0700 (PDT)
MIME-Version: 1.0
From:   Constantine Shulyupin <constantine.shulyupin@gmail.com>
Date:   Thu, 6 May 2021 13:58:35 +0300
Message-ID: <CAE7jHC_r86KNb_+beU10Vq3DU9wGA3X=sHpDjH-QQNrDGU5taw@mail.gmail.com>
Subject: Wikibook Linux kernel
To:     linux-doc@vger.kernel.org,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dear Linux kernel documentation writers and readers:

Writing Linux documentation is a huge complex collaborative process.
To make it better I invite you to contribute to
https://en.wikibooks.org/wiki/The_Linux_Kernel .

Main benefits of the book:
- Readers friendly architecture
- Matrix table of contents
- Convenient common wikimedia format
- Hosted on wikibooks.org
- Updateable by everyone.

I've designed the front page matrix table of contents and composed
draft articles with outline, links to kernel documentation, sources
and other resources. Sometimes visitors of the book contribute to it.
My vision is to have a complete updated wikibook about Linux kernel
written by many experienced developers. Please vist page
https://en.wikibooks.org/wiki/The_Linux_Kernel/About  for the book
desripton.

Welcome to contribute to https://en.wikibooks.org/wiki/The_Linux_Kernel!

Sincerely yours
Constantine Shulyupin

--
Constantine Shulyupin
