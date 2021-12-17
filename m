Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D987C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 05:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhLQFH2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Dec 2021 00:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhLQFH2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 00:07:28 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAD9C06173F
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 21:07:27 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id v13-20020a17090a088d00b001b0e3a74cf7so3469965pjc.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 21:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A9pI3PLDD+OS9t2q3FMIaJurBaIWrkrm6Rd7tPFvvQ0=;
        b=Sd8ve/vPQ5ZGfHHTvAX9sXYdzR7AA9xakeshpgsZljkscsGfndi4UvDeEzzhIIza//
         U0TqH6XVH7O5D0aLNYUBPKIcO9/OH9t/yMcCOFSN13bx82dJ+4CcPBsYOOyNcn7gnP3e
         udlyeb11MWvlMCDH/8oo4txJUlo/ZOf/Kca3VA9Ph2giZUdDbeAkbsVExn6L950mssK9
         NcsQo+LnV8mkP/3h75kDYjzDbQXbpqVE5iIr+CjEfiNSEEmzM5NDywDyo/HNYy3xeGqS
         XjF2PTPmJREzBdnjP6LuO+nH9FJ9qfiR0C/sLAmTSFZsFSYnJ//BWmLBR9VZwst3uftf
         TRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A9pI3PLDD+OS9t2q3FMIaJurBaIWrkrm6Rd7tPFvvQ0=;
        b=2NPqia1oCBEe5ZDPQgfFOcV65XF+DDEIDWJOTgE6CRE0yHup6P3p0MnS45fOtxk3OP
         qAeNrT8/rjaticuyMjclLZow//kD17w/NXLzVNZWcshREHmZGchgkc89Da8a7iLVwVfv
         pv3eNw2AamFh0SiJK6EkiLfviqX5roJR3d+rVxeD1dj8uyFm5R98ljYvK7KjmFUw5Tiu
         o4syHZNHPbpyZJLEa30PXSulf+C6I5e1IJ7FTk5iCPQTgSHnQhNadEpd7S14let8Te0E
         qkZX3w0W4We4NYCYcLPJSJT2GjuKnfrzNMzPlbG7v0/3HXIj4UkGYTJwGvf9TvEraz7h
         z76Q==
X-Gm-Message-State: AOAM532AZMOhjTu7mupa/Hb57Mhu4qJ3zlMbyvPktjgrsraYIZqeRZ6c
        sneIt0WEa5937E2DHbIArZHitldWlp/2b/vi5K+ang==
X-Google-Smtp-Source: ABdhPJzJKq1o8f6WEFg2rwwpF/uLHHrJJQdAZ5qIarI3++tyiyHB2lJXCUrdzb4fKcVDtdOMe0LppqrWVFSkUg+uzAM=
X-Received: by 2002:a17:902:a717:b0:142:76bc:da69 with SMTP id
 w23-20020a170902a71700b0014276bcda69mr1468880plq.12.1639717646845; Thu, 16
 Dec 2021 21:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20211216055958.634097-1-sharinder@google.com> <20211216055958.634097-4-sharinder@google.com>
 <CANpmjNOGaVgP25xNOSGOyjcA9Lmk4uFmU=f6RrRNJBP_CMEVrQ@mail.gmail.com>
 <87czlwcfav.fsf@meer.lwn.net> <CAHLZCaGh6Z1m50CYMae8AuY_524TzXtv-SP52FbLRj2Ks0fN1g@mail.gmail.com>
In-Reply-To: <CAHLZCaGh6Z1m50CYMae8AuY_524TzXtv-SP52FbLRj2Ks0fN1g@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 17 Dec 2021 00:07:15 -0500
Message-ID: <CAFd5g44f1VyJKkwzxkLxwkDQT+pB2ZBWo_g0ficNkOf_Oa1u1g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] Documentation: KUnit: Added KUnit Architecture
To:     Harinder Singh <sharinder@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Marco Elver <elver@google.com>,
        David Gow <davidgow@google.com>, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tim.Bird@sony.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 16, 2021 at 11:57 PM Harinder Singh <sharinder@google.com> wrote:
>
> Hello Jonathan and Marco,
>
>
> On Fri, Dec 17, 2021 at 4:45 AM Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > Marco Elver <elver@google.com> writes:
> >
> > > In response to the other email: Adding binary blobs just creates
> > > problems, for comparing different versions, and general bloating the
> > > whole repo, where better alternatives exist.
> > >
> > > I suppose an ASCII diagram is a bit primitive. :-)
> > >
> > > However, SVG files on the other hand are not binary blobs, they are
> > > text-markup based (XML), and e.g. diffing them often provides useful
> > > information about what changed. SVG also has the benefit of being
> > > vector graphics, and not being limited to one resolution.
> > >
> > > Looking at the diagram you added, I think this can easily be turned
> > > into vector graphics, and most likely will not use up 24KiB as a
> > > result.
> >
> > I agree with all of this; we shouldn't be adding binary images to the
> > docs, and we've decided at other times that SVG is generally the best
> > compromise there.
> >
> I did not realize that .SVG is in XML format and preferred over .PNG.
> Thanks for pointing this out. I replaced .SVG with .PNG.
>
> > Thanks, Marco, for pointing this out and producing an alternative.
> >
> A big thanks to Marco for creating  this .SVG file for the documentation :-)
>
> > Once this is all settled, do you want it to go through the docs tree?
> >
> Yeah! that's the plan.

Yep, please take this through the docs tree.

I will send out my Reviewed-by on the other patches shortly.
