Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10624C4363C
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 07:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98F512083B
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 07:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/143Crx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbgJGHIG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 03:08:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30146 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726041AbgJGHIG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Oct 2020 03:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602054484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2emVL8rNfBMhk//RxZehtElMhUSqx0aMuZNVdSt+Tbg=;
        b=E/143Crx91VOGtRd0nZJVCsCo7YHsmiYW7NEDc/ABSxLsdYtmt1zlE+xsxQVbUEh4KrI7O
        l7sip4gFgPOOGYvH2sVFjcwU/044l/tXSgK+FPl3ETZ3QLUxdq/RZFNzHmw36cisEQan8i
        2Z87jjDdbFUz42tLKTI9Uw+F/49sInk=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-66rJJJ5nPzy8Spc6zmnHdA-1; Wed, 07 Oct 2020 03:08:02 -0400
X-MC-Unique: 66rJJJ5nPzy8Spc6zmnHdA-1
Received: by mail-ot1-f69.google.com with SMTP id v7so343336ots.19
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2020 00:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2emVL8rNfBMhk//RxZehtElMhUSqx0aMuZNVdSt+Tbg=;
        b=S0mFwazjw7C8js40gdqQg0Cgv4p3l3/4BxDeNdVQSx+Rak8E/5dc61GRs4Sym8wYg9
         niYpZZFOaxBFYrrtPzrmQABIcc9UpmXA43M7m4lcw4o8/k67r4fdbU/GVDZveBxvk81V
         8BZ4JDC5LdqyOsfBEcXOpYEL1FsA607xAWEBwQAH8J++eVKeAnkDa1NAFBa0LvzVHxKH
         6ETW2vUvCka3IvWNd0j3SA0/tg5QmtcJw8eUZKbNCAsvwuVG8zFPg5GqFRYZV3MKtWT1
         1r6//LG8W/sN/AuawjH+NoTAyJ0vGt2WbqjYBTFADaSqMS9Y+ABzMvGK/7matkhiTyXH
         TdQw==
X-Gm-Message-State: AOAM530l9yLjkBnCt/7oNeN/zqYlmOUqqFcn9AsSedOj2Y+eM20ow7tO
        c2qf04urU42H1KHpkfpVODytBHb32XA1dzrZrCLrcgbM4lKgUouzTBUasac+e/8pY/GIza6dS3e
        uXWVSEB89w2lZ+4FrEkYNCyzF7JwPFCUdmk6C
X-Received: by 2002:a9d:2c05:: with SMTP id f5mr1035012otb.183.1602054481580;
        Wed, 07 Oct 2020 00:08:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxqFM0VBANixBZ3iYM60Mb5DOwhruP3A6xZ3YIOrzcgRBSdi5vOD4F6c0tfloDw4HFQZkV45djnvn9PEsUyME=
X-Received: by 2002:a9d:2c05:: with SMTP id f5mr1034994otb.183.1602054481228;
 Wed, 07 Oct 2020 00:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134745.25732-1-chenzhou10@huawei.com> <e9b1b5db-a848-468e-6baf-2f7b4d658805@oracle.com>
 <20201005170937.GA14576@gaia> <CACi5LpMWUmP1df8fB8psJY_cNGHF9MNn+TNK4B4edaRHvOXxGQ@mail.gmail.com>
 <20201006180012.GB31946@C02TF0J2HF1T.local>
In-Reply-To: <20201006180012.GB31946@C02TF0J2HF1T.local>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Wed, 7 Oct 2020 12:37:49 +0530
Message-ID: <CACi5LpMmccLX9p0ZXnEbWHgn2LRrVSDQZF9zBGzfZySe3TvXEQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/9] support reserving crashkernel above 4G on arm64 kdump
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     John Donnelly <john.p.donnelly@oracle.com>,
        Chen Zhou <chenzhou10@huawei.com>,
        Will Deacon <will@kernel.org>,
        James Morse <james.morse@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        RuiRui Yang <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Prabhakar Kushwaha <prabhakar.pkin@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, nsaenzjulienne@suse.de,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kexec mailing list <kexec@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        guohanjun@huawei.com, xiexiuqi@huawei.com, huawei.libin@huawei.com,
        wangkefeng.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Catalin,

On Tue, Oct 6, 2020 at 11:30 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Oct 05, 2020 at 11:12:10PM +0530, Bhupesh Sharma wrote:
> > I think my earlier email with the test results on this series bounced
> > off the mailing list server (for some weird reason), but I still see
> > several issues with this patchset. I will add specific issues in the
> > review comments for each patch again, but overall, with a crashkernel
> > size of say 786M, I see the following issue:
> >
> > # cat /proc/cmdline
> > BOOT_IMAGE=(hd7,gpt2)/vmlinuz-5.9.0-rc7+ root=<..snip..> rd.lvm.lv=<..snip..> crashkernel=786M
> >
> > I see two regions of size 786M and 256M reserved in low and high
> > regions respectively, So we reserve a total of 1042M of memory, which
> > is an incorrect behaviour:
> >
> > # dmesg | grep -i crash
> > [    0.000000] Reserving 256MB of low memory at 2816MB for crashkernel (System low RAM: 768MB)
> > [    0.000000] Reserving 786MB of memory at 654158MB for crashkernel (System RAM: 130816MB)
> > [    0.000000] Kernel command line: BOOT_IMAGE=(hd2,gpt2)/vmlinuz-5.9.0-rc7+ root=/dev/mapper/rhel_ampere--hr330a--03-root ro rd.lvm.lv=rhel_ampere-hr330a-03/root rd.lvm.lv=rhel_ampere-hr330a-03/swap crashkernel=786M cma=1024M
> >
> > # cat /proc/iomem | grep -i crash
> >   b0000000-bfffffff : Crash kernel (low)
> >   bfcbe00000-bffcffffff : Crash kernel
>
> As Chen said, that's the intended behaviour and how x86 works. The
> requested 768M goes in the high range if there's not enough low memory
> and an additional buffer for swiotlb is allocated, hence the low 256M.

I understand, but why 256M (as low) for arm64? x86_64 setups usually
have more system memory available as compared to several commercially
available arm64 setups. So is the intent, just to keep the behavior
similar between arm64 and x86_64?

Should we have a CONFIG option / bootarg to help one select the max
'low_size'? Currently the ' low_size' value is calculated as:

    /*
         * two parts from kernel/dma/swiotlb.c:
         * -swiotlb size: user-specified with swiotlb= or default.
         *
         * -swiotlb overflow buffer: now hardcoded to 32k. We round it
         * to 8M for other buffers that may need to stay low too. Also
         * make sure we allocate enough extra low memory so that we
         * don't run out of DMA buffers for 32-bit devices.
         */
        low_size = max(swiotlb_size_or_default() + (8UL << 20), 256UL << 20);

Since many arm64 boards ship with swiotlb=0 (turned off) via kernel
bootargs, the low_size, still ends up being 256M in such cases,
whereas this 256M can be used for some other purposes - so should we
be limiting this to 64M and failing the crash kernel allocation
request (gracefully) otherwise?

> We could (as an additional patch), subtract the 256M from the high
> allocation so that you'd get a low 256M and a high 512M, not sure it's
> worth it. Note that with a "crashkernel=768M,high" option, you still get
> the additional low 256M, otherwise the crashkernel won't be able to
> boot as there's no memory in ZONE_DMA. In the explicit ",high" request
> case, I'm not sure subtracted the 256M is more intuitive.

> In 5.11, we also hope to fix the ZONE_DMA layout for non-RPi4 platforms
> to cover the entire 32-bit address space (i.e. identical to the current
> ZONE_DMA32).
>
> > IMO, we should test this feature more before including this in 5.11
>
> Definitely. That's one of the reasons we haven't queued it yet. So any
> help with testing here is appreciated.

Sure, I am running more checks on this series. I will be soon back
with more updates.

Regards,
Bhupesh

