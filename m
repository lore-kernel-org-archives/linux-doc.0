Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35B5C4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:52:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2ECF603E7
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239579AbhHETw4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 15:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbhHETw4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 15:52:56 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13EDC061765
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 12:52:41 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id nh14so11538764pjb.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QJmOpEwE9lxeEjSBDZIktawPgAevjn7yO4pdJHSJHNE=;
        b=vuEGFs4GQM/KoJIky8OccECbir3mh2bt8xA1UttsQZWB4BqQBfCwN5YuTUpxOwLHtL
         QShYEYe7XF1f/j0NqYJb7Fuf09UurlM48C1WpCOEJlmwzrxhV00xwg5GVoGyHbzujXXh
         PGQba1GDGo0oQTkQqgp/9nUPoCsS4bdKF7x8WjYlr+1X4E5xzYid025cEwPun9Rz1VGi
         iRTftullhxPJWVvVqlE9irP9OnjGOoL7Zuy3tlpAirmZoYlTVjQ7akyxXLqP8HJiEgAc
         RP2i5BVKDnZYs1pVSABgyF2rsRC8bzRZl0xURqaRj6q7oVfOlCOcTx6zDjM4MRKUXF0f
         Pxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QJmOpEwE9lxeEjSBDZIktawPgAevjn7yO4pdJHSJHNE=;
        b=nG2pip9QZztEc999qMmyw4W9Cj7uTlXZAef8QJNhc4o1jg4YPWJuKVNifYqdyP47f6
         tbZx4XvrKoed2IAc6hOlYv9/YYQ2YlWx0AApyyMunVVRIxVsvxsF58dY60wTv08qPdla
         kAKjx4htRN9bYsSQGnSQbRUUctiE+5exe5VyZkL2LdovfHGKPpxwCQkkAB+kOyLf8oxl
         HIVD9q5p2Nay3J94Yd+F5cFDU/zJegGsPoLoiGg57ayNSPPXguYVxslHQ5y5KIVZ68SQ
         yDOCuXgNfq6AQ226pwMxNTeKdPrGiUHb9hwoHx1sqjC3TmHk26tA1ZX5D+RSUZyEQV6M
         KMSQ==
X-Gm-Message-State: AOAM530NghRVgnEyNrV/UNg1hEMUUlYmHGIYthBxjgynXKiwbOXOv1bB
        czv9T4+/91mbTc1zZ1BeP8rlnzODT95SJ8AQCweXaQ==
X-Google-Smtp-Source: ABdhPJykpLaKn49AsycfvP9cpaaDTsNQ2/hCbG6nsZZi8ZnboN5frJKZHGCWPDWRhIKqvttVczmTrVNWGKGeYJ+C2+Q=
X-Received: by 2002:a17:902:ab91:b029:12b:8dae:b1ff with SMTP id
 f17-20020a170902ab91b029012b8daeb1ffmr5316523plr.52.1628193161219; Thu, 05
 Aug 2021 12:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <YQuYCePPZEmVbkfc@kroah.com> <YQuZdVuaGG/Cr62y@kroah.com>
 <YQuaJ78y8j1UmBoz@kroah.com> <fdf8b6b6-58c3-8392-2fc6-1908a314e991@linux.intel.com>
 <YQwlHrJBw79xhTSI@kroah.com> <21db8884-5aa1-3971-79ef-f173a0a95bef@linux.intel.com>
 <YQwpa+LAYt7YZ5dh@kroah.com> <7d6751b1-c476-51d3-25c6-b65c0e93d23b@linux.intel.com>
 <YQw4AEwIUGe3RpCx@kroah.com> <CAPcyv4gV9GK93rgtoHxhshzDGk0ueJn0d9LXYitJ8=wJWzmWHg@mail.gmail.com>
 <YQw71hBx4/w14Fir@kroah.com>
In-Reply-To: <YQw71hBx4/w14Fir@kroah.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 5 Aug 2021 12:52:30 -0700
Message-ID: <CAPcyv4g1oBU3J3qpd+hDy9cKMYqn0FAsAO4BxxfrNCnpaxzO9g@mail.gmail.com>
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[ add Jonathan ]

On Thu, Aug 5, 2021 at 12:28 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 05, 2021 at 12:18:12PM -0700, Dan Williams wrote:
> > On Thu, Aug 5, 2021 at 12:12 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Aug 05, 2021 at 11:53:52AM -0700, Kuppuswamy, Sathyanarayanan wrote:
> > > > I am not sure how USB and Thunderbolt "authorzied" model works. But I
> > > > don't think it prevents built-in driver probes during kernel boot right?
> > >
> > > Yes it does.
> > >
> > > Again Intel created this framework well over a decade ago for busses
> > > that it deemed that it did not want to "trust" to instantly probe
> > > drivers for and made it part of the Wireless USB specification.
> > >
> > > Then Intel went and added the same framework to Thunderbolt for the same
> > > reason.
> > >
> > > To ignore this work is quite odd, you might want to talk to your
> > > coworkers...
> >
> > Sometimes we need upstream to connect us wayward drones back into the
> > hive mind. Forgive me for not immediately recognizing that the
> > existing 'authorized' mechanisms might be repurposed for this use
> > case.
>
> Not your fault, I'm more amazed that Andi doesn't remember this, he's
> been around longer :)
>

In the driver core? No, not so much, and I do remember it flying by,
just did not connect the dots. In fact, it had just gone upstream when
you and I had that thread about blocking PCI drivers [1], September
2017 vs June 2017 when the Thunderbolt connection manager was merged.
There was no internal review process back then so I failed to
internalize its implications for this TDX filter. You had taken the
time to review it in a way that I had not.

> But the first instinct should not be "let's go add a new feature", but
> rather, "how has this problem been solved by others first" because,
> really, this is not a new issue at all.  You should not rely on just me
> to point out existing kernel features, we do have documentation you
> know...

I have added, "review driver core attribute proposal for duplication
of bus-local capabilities" to my review checklist.

The good news is I think this generic authorization support in the
core may answer one of Jonathan's questions about how to integrate PCI
SPDM/CMA support [2].

[1]: https://lore.kernel.org/lkml/20170928090901.GC12599@kroah.com/
[2]: https://lore.kernel.org/r/20210804161839.3492053-1-Jonathan.Cameron@huawei.com
