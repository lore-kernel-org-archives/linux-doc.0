Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E98C433EF
	for <linux-doc@archiver.kernel.org>; Sun,  6 Mar 2022 20:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbiCFUcN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Mar 2022 15:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiCFUcN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Mar 2022 15:32:13 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297C757B1F
        for <linux-doc@vger.kernel.org>; Sun,  6 Mar 2022 12:31:20 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id u20so23015789lff.2
        for <linux-doc@vger.kernel.org>; Sun, 06 Mar 2022 12:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o4x3LB+e0ici79Acsr0qTkXLlNi+AeRm0Pw056tojvw=;
        b=h0YGKLCxmfD+Tuht2lkOVwseUarTkmVqA6F1b6hNY12cXjmK+zrbrkXq4bDDJ6G/Ok
         sR4TbLfaQifk1zBlAaJkzinXjrhZNpQRsAKGSrPYqo3Tn/Z+PSqyRA7eekf0bPTcE8o7
         YN0tht/85YfO+73tf2QooGvk4g8RManlAoWBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o4x3LB+e0ici79Acsr0qTkXLlNi+AeRm0Pw056tojvw=;
        b=Oq/L6mjZUDpU9buDf3I1BIM224fHEgbpCX0hwWWwOGS7DkulPMRFI86ztVj/TPDoz2
         M+VcsdevMkGzUahU/P6Y7vTve9llljebBubLK5EOylD12yvhIeELYT9Jy51FjB9iFbWp
         W6la6qb8r+4/w6SPCqs2lZl//I2uH8jNq60La1g19UlqCatE8S1Ua5aUR99lQWHrsjuG
         T+JAOqaZjpBegUr1S/FqjevGOS+Edh/KZSbeEHDgwYm2tr1g6qX3sGRgLCb+6R8G+Gox
         mPdlLhjZ7UMcrrgv40WeWrWbahNOu8kZTXWMnPBqtaYCKeOUo5bIgOsoOByME4TnTpil
         /oqw==
X-Gm-Message-State: AOAM532Vapvvk+ZXBa1u8FXQO1YbXy3AqtzmDTmu/HW4O65cqg0Xxi/+
        vYG4lMD+8slf9wJeJwrvppiHZCMtYgsEeqgXkpk=
X-Google-Smtp-Source: ABdhPJxnu8vBKWdHlvm37rvmEoct6gtm7V+GLoiyJWsW3C0vYb2BQvV1K64Q3FsqN2t/v1BH1CVIjw==
X-Received: by 2002:a05:6512:260f:b0:443:7ea6:5667 with SMTP id bt15-20020a056512260f00b004437ea65667mr5701466lfb.155.1646598676927;
        Sun, 06 Mar 2022 12:31:16 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id e7-20020a2e9847000000b00247a7dc53dasm2635261ljj.6.2022.03.06.12.31.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 12:31:12 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id n19so1902148lfh.8
        for <linux-doc@vger.kernel.org>; Sun, 06 Mar 2022 12:31:11 -0800 (PST)
X-Received: by 2002:a05:6512:e8a:b0:443:7b8c:579a with SMTP id
 bi10-20020a0565120e8a00b004437b8c579amr5784609lfb.687.1646598671471; Sun, 06
 Mar 2022 12:31:11 -0800 (PST)
MIME-Version: 1.0
References: <20220305170714.2043896-1-pasic@linux.ibm.com> <CAHk-=wgZ6fNG03pd2pAVw9RtymwPDyHNvTLHr2Q3LX3S0Y1k5Q@mail.gmail.com>
 <YiRpuGbjyU2M47pQ@infradead.org>
In-Reply-To: <YiRpuGbjyU2M47pQ@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 6 Mar 2022 12:30:55 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQGLgqqgsKXUCykiK9B1UwdCj2-NvDkBAuYhSgdtAmkQ@mail.gmail.com>
Message-ID: <CAHk-=wgQGLgqqgsKXUCykiK9B1UwdCj2-NvDkBAuYhSgdtAmkQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] swiotlb: rework "fix info leak with DMA_FROM_DEVICE"
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Halil Pasic <pasic@linux.ibm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        stable <stable@vger.kernel.org>,
        Doug Gilbert <dgilbert@interlog.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anshuman Khandual <khandual@linux.vnet.ibm.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        iommu <iommu@lists.linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Mar 5, 2022 at 11:58 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> All of thee apply to all I/O.  SG_IO is just a vector here as a
> particularly badly designed userspace interface that happens to get a
> decent test coverage.

I phrased that badly. I didn't mean SG_IO in particular, I meant any
of the "generate special commands" interfaces.

In particular, I meant it as "not *regular* read/write commands".

It seems extremely wasteful to do a completely unnecessary bounce
buffer operation for READ/WRITE commands.

Because honestly, if *those* are broken on some DMA device and they
don't fill the buffer completely - despite claiming they do - then
that device is so terminally broken that it's not even worth worrying
about.

So I would expect that

 (a) READ/WRITE actually fills the whole buffer

 (b) READ/WRITE are the only ones where we care about performance at a
bounce-buffer level

so it boils down to "do we still do this horrible memcpy even for
regular IO commands"? Because that would, in my opinion, just be
stupid.

                 Linus
