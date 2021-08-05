Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59764C4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F96C60F01
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241061AbhHETB5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 15:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbhHETB5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 15:01:57 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122E1C061765
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 12:01:43 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so11852345pjh.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 12:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E8rgxwLRPKfKRs5Day4e6JuDr2G47VjuZVduSzU3YGM=;
        b=uJoC+XvkELEyV96zslG8ZZH8bHHs0oITVSMKlzN2BlwhQl1d98Vp35s4tevlIsXU/j
         Sx4TTfvmbFJ/dsIdq0LWfsQtmXzlXlzTFJjM7jYiWAzrLdWmV1wR5JrSOePwcKdUVErZ
         3HpzVph/MxhiflxWpV0G9eyNVgiAxcECuToU/fvcPMBCA8ChxhCdsGTJwCGhaNArRLvt
         1vJV7DB9zOL3iKrXR/EJUiTvqGNygjgPgc6ycFRPrE0ZM+AGDvW0Jp2G8Nus0lpJsue4
         xCoA4gA4JYIM1UPnEYq0SP3mIwt4nv+tQT3Z33avNvfUmoSLCGi8v5PiWPgJMMFFFWix
         V9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E8rgxwLRPKfKRs5Day4e6JuDr2G47VjuZVduSzU3YGM=;
        b=h4QWSp1E9n1rLZtNpK7zWmWx//NzeFlx/BlMaGIxIGzGAx/laIe0HzVBHb7tdbrc4H
         hOUeiozkb67T/mB5InGSsKBPEuDMtsoilQ3ux6I34axwzWUel6s3dRGjqrJ3ReHk/VXi
         p9jCzj3v0CcIH8DEvr44TIam5y32b3z2OGdD7Lp0UvvZT3UyY0inORyAfMaNCjYDpge5
         XV7RlAQaj9qNxatjSY1qSY1AK52T7pgZsvGTnijF1+GdlaVMsVn0QgLKwH2wMkO7bqDf
         gw6woVtu5CbUe2zeiFrkONDVdazqU33HKNRUojCFOw1qIwaM/42tm149cAOom89q34H7
         qq+w==
X-Gm-Message-State: AOAM530tiABZHFZLfssrzOJVsgoJZ+CgfM55MJsH96Jc2LLfyfPmBrWK
        1jUKKb17KXQ97djLKXA0RZrZvRd8E1flfUFK/V3TLnYd9Fs=
X-Google-Smtp-Source: ABdhPJzREWkvJnn0U5OC8p5NMCWVUuOcpyq4KMj3djWHEKxkVS9biP1Cz0WWbkofTKx6lzHWf8hvfV679eIWNcxcsbY=
X-Received: by 2002:a17:903:22c6:b029:12c:8da8:fd49 with SMTP id
 y6-20020a17090322c6b029012c8da8fd49mr5050471plg.79.1628190102561; Thu, 05 Aug
 2021 12:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210804174322.2898409-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YQrqhYEL64CSLRTy@kroah.com> <f2b1d564-8174-f8e9-9fee-12e938c6d846@linux.intel.com>
 <YQuYCePPZEmVbkfc@kroah.com> <YQuZdVuaGG/Cr62y@kroah.com> <YQuaJ78y8j1UmBoz@kroah.com>
 <fdf8b6b6-58c3-8392-2fc6-1908a314e991@linux.intel.com> <YQwlHrJBw79xhTSI@kroah.com>
 <21db8884-5aa1-3971-79ef-f173a0a95bef@linux.intel.com> <YQwpa+LAYt7YZ5dh@kroah.com>
 <1e0967ee-c41e-fd5d-f553-e4d7ab88838c@linux.intel.com>
In-Reply-To: <1e0967ee-c41e-fd5d-f553-e4d7ab88838c@linux.intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 5 Aug 2021 12:01:31 -0700
Message-ID: <CAPcyv4h26QmPhJKjtUB-VPc4TP95rBAer78OzkgXncg77tFWVw@mail.gmail.com>
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 5, 2021 at 11:44 AM Andi Kleen <ak@linux.intel.com> wrote:
>
>
> On 8/5/2021 11:09 AM, Greg Kroah-Hartman wrote:
> > On Thu, Aug 05, 2021 at 10:58:46AM -0700, Andi Kleen wrote:
> >> On 8/5/2021 10:51 AM, Greg Kroah-Hartman wrote:
> >>> It's controlled by whatever you want to use in userspace.  usbguard has
> >>> been handling this logic in userspace for over a decade now just fine.
> >>
> >> So how does that work with builtin USB drivers? Do you delay the USB binding
> >> until usbguard starts up?
> > Yes.
>
> That won't work for confidential guests, e.g. we need a virtio driver
> for the console and some other things.
>
>
> >
> >>>> This doesn't help us handle builtin drivers that initialize before user
> >>>> space is up.
> >>> Then have the default setting for your bus be "unauthorized" like we
> >>> allow for some busses today.
> >> We need some early boot drivers, just not all of them. For example in your
> >> scheme we would need to reject all early platform drivers, which would break
> >> booting. Or allow all early platform drivers, but then we exactly get into
> >> the problem that there are far too many of them to properly harden.
> > Define "harden" please.  Why not just allow all platform drivers, they
> > should all be trusted.  If not, well, you have bigger problems...
>
> Trusted here means someone audited them and also fuzzed them. That's all
> a lot of work and also needs to be maintained forever so we're trying to
> do only a minimum set. There are actually quite a few platform drivers,
> it's difficult to audit them all.
>

What's wrong with the generic authorized proposal? The core can
default to deauthorizing devices on the platform bus, or any bus,
unless on an allow list. It's a bit more work to uplevel the local
"authorized" implementations from USB and Thunderbolt to the core, but
it's functionally identical to the "filter" approach in terms of
protection, i.e. avoiding probe of unnecessary unvetted drivers.

[..]
> That's why I think the builtin allow list hook is still needed. Thoughts?

I see nothing that prevents a built-in allow list to augment the
driver-core default. Is there a gap I'm missing?
