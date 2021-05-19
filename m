Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF651C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 14:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 910D6611AD
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 14:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346649AbhESOF5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 10:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48249 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346333AbhESOF4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 10:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621433076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q0X6ufyJH5fadmIknxn4nGcWs1xnqbL6wQGkTAtdW1c=;
        b=Tw8RKgQRCXH+fmkXIrxv+lnkjg+Y1aqhfdZycLors3SXtB9ey72H2FSEA15QtBFt/+IlF3
        R1XyJO7Cp3tReLJlLHbQCHo5Agiw0KsQ8CaUrG4VXnHM8sn8Z3wJ29NKAFT3e1Xgs7DlU2
        hUOR2RpO1DWbuVpTmx1jVrMrIRr/Cm4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-mFPbNjjiOwmL7fxap42D7w-1; Wed, 19 May 2021 10:04:34 -0400
X-MC-Unique: mFPbNjjiOwmL7fxap42D7w-1
Received: by mail-qv1-f72.google.com with SMTP id r11-20020a0cb28b0000b02901c87a178503so10353221qve.22
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q0X6ufyJH5fadmIknxn4nGcWs1xnqbL6wQGkTAtdW1c=;
        b=Ys6XNVbrSoadFYVhXOni8hraTsjqZGYxKoBXsW/VqjZ9+FNj2kjejj5Dz1Gul8/rCl
         uxD6iL/wgAlpBhi/KvsGYKreS6dPXB+ZFo4wdokr32iiW74JcmFVmjZjgqN98IcNrewU
         VKl6l87jfiDFzlQhRn8F20XTYyGBo2jQ5rqjtdztHaB/2za/jtKC0RmVzGyLHaiJHF+k
         tLV/H524aJ/bhEWjCm+rj2Jpi/AWd474AxErggax1V8uSi6s0HfLd0Q62fAgSt+/X+r+
         adxpiaSdPc943bUZ1D0q3nr5EK48eqdlPxSXRTAPTvPf6sPRiaNvAm9Qu3ECJEVDUNq4
         L18g==
X-Gm-Message-State: AOAM532ll39ll1ueouH8v7h96vOenY5TwBulRV/7TAoT2rZ+gFd6nHCh
        Nxia9nYW+aFgGTJRW8wQfvx4/x6OZdn4cmxFsZUNTysEESiqYaFYDZo5qWyb8beu5QcBPNIPl+f
        8FIeWPTe5yP9sFQ5UmnqS
X-Received: by 2002:a05:6214:d87:: with SMTP id e7mr13037366qve.53.1621433074135;
        Wed, 19 May 2021 07:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6J2iQWttFbTggjwn9zrUjjmVN+9VOim38VY5Z448bl6PpUs3xqQHJcSoYTLuhDbSvYY+iNA==
X-Received: by 2002:a05:6214:d87:: with SMTP id e7mr13037337qve.53.1621433073770;
        Wed, 19 May 2021 07:04:33 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id b13sm802748qkl.16.2021.05.19.07.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:04:33 -0700 (PDT)
Date:   Wed, 19 May 2021 10:04:32 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, linux-mm@kvack.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jhubbard@nvidia.com, rcampbell@nvidia.com, jglisse@redhat.com,
        hch@infradead.org, daniel@ffwll.ch, willy@infradead.org,
        bsingharora@gmail.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKUa8HZjfFW2Dhb1@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <2235357.HsqDk0zIjc@nvdebian>
 <YKUBbVuvm5FUJRMl@t490s>
 <2569629.VzlulnA7BY@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2569629.VzlulnA7BY@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 19, 2021 at 11:11:55PM +1000, Alistair Popple wrote:
> On Wednesday, 19 May 2021 10:15:41 PM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > On Wed, May 19, 2021 at 09:04:53PM +1000, Alistair Popple wrote:
> > > Failing fork() because we couldn't take a lock doesn't seem like the right
> > > approach though, especially as there is already existing code that
> > > retries. I get this adds complexity though, so would be happy to take a
> > > look at cleaning copy_pte_range() up in future.
> > 
> > Yes, I proposed that as this one won't affect any existing applications
> > (unlike the existing ones) but only new userspace driver apps that will use
> > this new atomic feature.
> > 
> > IMHO it'll be a pity to add extra complexity and maintainance burden into
> > fork() if only for keeping the "logical correctness of fork()" however the
> > code never triggers. If we start with trylock we'll know whether people
> > will use it, since people will complain with a reason when needed; however
> > I still doubt whether a sane userspace device driver should fork() within
> > busy interaction with the device underneath..
> 
> I will refrain from commenting on the sanity or otherwise of doing that :-)
> 
> Agree such a scenario seems unlikely in practice (and possibly unreasonable). 
> Keeping the "logical correctness of fork()" still seems worthwhile to me, but 
> if the added complexity/maintenance burden for an admittedly fairly specific 
> feature is going to stop progress here I am happy to take the fail fork 
> approach. I could then possibly fix it up as a future clean up to 
> copy_pte_range(). Perhaps others have thoughts?

Yes, it's more about making this series easier to be accepted, and it'll be
great to have others' input.

Btw, just to mention that I don't even think fail fork() on failed trylock() is
against "logical correctness of fork()": IMHO it's still 100% correct just like
most syscalls can return with -EAGAIN, that suggests the userspace to try again
the syscall, and I hope that also works for fork().  I'd be more than glad to
be corrected too.

-- 
Peter Xu

