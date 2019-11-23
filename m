Return-Path: <SRS0=pmrK=ZP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A04EC432C0
	for <linux-doc@archiver.kernel.org>; Sat, 23 Nov 2019 23:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A40C20706
	for <linux-doc@archiver.kernel.org>; Sat, 23 Nov 2019 23:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="yeA/sLZw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfKWXgC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 23 Nov 2019 18:36:02 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46836 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbfKWXgC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Nov 2019 18:36:02 -0500
Received: by mail-oi1-f193.google.com with SMTP id n14so9821294oie.13
        for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2019 15:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T5L4Gn1hhSzVUcUQ6WI2TNf9x3LhnvpN90/COmumAnw=;
        b=yeA/sLZwxejLTkTA4QQrsDuj/+2JYc5Gz1JKu2xDO772QyAN3CDOdByAmUeMBoy5LJ
         zz8BMIPq0ShSOgKiRHjQ7bkDm6oGcBC9wtgcJ9gWsQmOKdpfZ9dtOsZ2PjmMCDjgGAib
         KF2otB1MAajxcKrsHB9/C2zgTgd+IUSjyqh7A7wQGmtJj4Qx/ebW1UK3AktErcSoRbdN
         o55EOdxvb3aowA/aKXe9EoJrwLOsTjzybS3c7QzVXu/SVHg8SHtbiLsxgmgs8x9huWCA
         WZd+lvKr5ZkU7egEzJFwE1Pv9DwLE7y7pMgmMpmtALlviycGBsPhvtK6MHt4RTAjoouH
         N8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T5L4Gn1hhSzVUcUQ6WI2TNf9x3LhnvpN90/COmumAnw=;
        b=eIKXYf+50iOcmxP0+7bvJcstxhPfRjIsCShE9V3GOJdL2ps8ea4w7cFP6uxZ8ftab7
         6kuYgrpz2Lqj/OKAJp63PNbvBYKqGbXDb8IwfP3Yu9yvEfDppgm2orTWnFz6Qq+04S/a
         fn4xKX+gR1CEJaPniGpZDomNJWz0dX/C2sD/3iBtoQT4rrbTrVmA5LDYIwSb+mgDY5kH
         HMZ9XQSQRFXopEqkWjGsArwJdINispd+hwsqHODgsGZpfLdvQzzYPvruEATn6Rpoo5tP
         SiF7GAvJZOX0wffBgmdcKZDz7tu0+syPP0Cuy2UcxmIDPfAj17ba1ImHH4+cTdSBTZHv
         kTfg==
X-Gm-Message-State: APjAAAUsW62Nk+ZpIM0V8mJ9roCbcjm/nf+wrKANwzLqjksBRW4Pvy01
        EaD/2rSc3PbnC30F87UfRkAT23E/398kTsqpC9fXrw==
X-Google-Smtp-Source: APXvYqzYAzV9FzTAnT3siA1wHlJKRAHjMitc1EcCn6cfgNohnZwV6E4k19jMHeqWhusSSVyNMc4q1Be4wCoNN73QqDI=
X-Received: by 2002:aca:ead7:: with SMTP id i206mr18410174oih.0.1574552161328;
 Sat, 23 Nov 2019 15:36:01 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com>
 <20191123092552.1438bc95@lwn.net> <alpine.DEB.2.21.9999.1911231523390.14532@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1911231523390.14532@viisi.sifive.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 23 Nov 2019 15:35:50 -0800
Message-ID: <CAPcyv4hmagCVLCTYmmv0U8-YD5BEoQPV=wtm5hbp3MxqwZRQUA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: riscv: add patch acceptance guidelines
To:     Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, krste@berkeley.edu,
        waterman@eecs.berkeley.edu,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Nov 23, 2019 at 3:27 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Hi Jon,
>
> On Sat, 23 Nov 2019, Jonathan Corbet wrote:
>
> > On Fri, 22 Nov 2019 18:44:39 -0800 (PST) Paul Walmsley
> > <paul.walmsley@sifive.com> wrote:
> >
> > > Formalize, in kernel documentation, the patch acceptance policy for
> > > arch/riscv.  In summary, it states that as maintainers, we plan to only
> > > accept patches for new modules or extensions that have been frozen or
> > > ratified by the RISC-V Foundation.
> > >
> > > We've been following these guidelines for the past few months.  In the
> > > meantime, we've received quite a bit of feedback that it would be
> > > helpful to have these guidelines formally documented.
> >
> > If at all possible, I would really love to have this be part of the
> > maintainer profile documentation:
> >
> >       https://lwn.net/ml/linux-kernel/156821692280.2951081.18036584954940423225.stgit@dwillia2-desk3.amr.corp.intel.com/
> >
> > ...if we could only (hint...CC'd...) get Dan to resubmit it with the
> > needed tweaks so it could be merged...
>
> It looks like the main thing that would be needed would be to add the P:
> entry with the path to our patch-acceptance.rst file into the MAINTAINERS
> file, after Dan's patches are merged.
>
> Of course, we could also add more information about sparse cleanliness,
> checkpatch warnings, etc., but we mostly try to follow the common kernel
> guidelines there.

Those could likely be automated to highlight warnings that a given
subsystem treats as errors, but wherever possible my expectation is
that the policy should be specified globally.

>
> Is that summary accurate, or did I miss some additional steps?
>

I'll go fixup and get the into patch submitted today then we can go from there.
