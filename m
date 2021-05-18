Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3163C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 14:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77D3C610E9
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 14:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243954AbhEROyl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 10:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243830AbhEROyk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 10:54:40 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F6FC061573
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 07:53:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id v5so11903878ljg.12
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fjg3qZs5k6I/97/2j2zryLOYba1okHDNwQ2ngYD7gmk=;
        b=LwA0jhocjIDkDCwgZ0OZcCFjqpnw2V0xSzfMAlQdZAOQGIrV9GBnO70USBBEv9zO2k
         p1YwV1+5v/q5SkZCI7X0f7Qct9ZwFynXefhV7wgMQuGN8uPVmMcaKpj1ogQXCnEZSX2p
         umL8I2s1e72TiY9IHZhKiTpEqqmQ8sxRi9sp2qe05EiVa83+bYm7iYP26wYlPG3LT30H
         gPGcyAjAlD1WbZHZCMH7be0HJ1XvnFbh2+Y2INQgyy4h1Ur4FZWqqNhJ5aMBH6Sf4aaw
         OFyLgxcZNOia6IxyxagPfQ5pETOqRZXv0u16+7bssu4KpYF0GvOX5GQRYAqwICq3TZx7
         IYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fjg3qZs5k6I/97/2j2zryLOYba1okHDNwQ2ngYD7gmk=;
        b=GJIs9tugafbl0A7/olF9qRs3+iq24kra551jAR3fcVeO6wzfSART/Ij5V98r7LoEJm
         92L9LvJy0UrsPR86wmiTZbm4p8d1k1sCru7ZY6p3Fwboy9MUxrBj7PM6BbcAmHljpeEp
         6rid0IkWr82x3BQIOFkFU/0m252ev5U8Tvn2SUV4ADyLaUSQMkmMs4EgLfKkcD7Eyrsp
         PBdLrdhbnm+Hi0MIOFsWjpry8jGIVUbDyoGeTwzMuuNHk7PGEbNtECmbBlPaWujrjXnj
         YPghJxF30mUD2nfP7hWw2zaEApjka/hcOvkXOkjYR9ayyrzhrPCDE13HgJ6BtrGUYyi+
         PaOA==
X-Gm-Message-State: AOAM533hHjOmgvoGYrwCPg/4E/xYqNLWcDrcCikz5khucGmWwNgeTvQ1
        CzjrnlAozphx6ro4V0+vpERQhSAXD3+LLZ0HOXBltA==
X-Google-Smtp-Source: ABdhPJzhydDaPkWDHaSpy2SL65NK6UM4/v57GFX517EaIpLAtdVeYSjHYQ1qhXwE039MUtgV59sTM9MdqCr3KqMiCyQ=
X-Received: by 2002:a2e:8557:: with SMTP id u23mr4357444ljj.221.1621349600234;
 Tue, 18 May 2021 07:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <1621239831-5870-1-git-send-email-beata.michalska@arm.com>
 <1621239831-5870-2-git-send-email-beata.michalska@arm.com>
 <CAKfTPtAPcayjhedNWaL20rsaUQbxXFdEXAF8aqwd9YX5gLVbOQ@mail.gmail.com> <20210518142746.GA3993@e120325.cambridge.arm.com>
In-Reply-To: <20210518142746.GA3993@e120325.cambridge.arm.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Tue, 18 May 2021 16:53:09 +0200
Message-ID: <CAKfTPtAk8pQfpN7FrBqdOiSz2Ncby4ozXOgQvT_QZMX67-FRKA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] sched/core: Introduce SD_ASYM_CPUCAPACITY_FULL
 sched_domain flag
To:     Beata Michalska <beata.michalska@arm.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 18 May 2021 at 16:27, Beata Michalska <beata.michalska@arm.com> wrote:
>
> On Tue, May 18, 2021 at 03:39:27PM +0200, Vincent Guittot wrote:
> > On Mon, 17 May 2021 at 10:24, Beata Michalska <beata.michalska@arm.com> wrote:
> > >
> > > Introducing new, complementary to SD_ASYM_CPUCAPACITY, sched_domain
> > > topology flag, to distinguish between shed_domains where any CPU
> > > capacity asymmetry is detected (SD_ASYM_CPUCAPACITY) and ones where
> > > a full range of CPU capacities is visible to all domain members
> > > (SD_ASYM_CPUCAPACITY_FULL).
> >
> > I'm not sure about what you want to detect:
> >
> > Is it a sched_domain level with a full range of cpu capacity, i.e.
> > with at least 1 min capacity and 1 max capacity ?
> > or do you want to get at least 1 cpu of each capacity ?
> That would be at least one CPU of each available capacity within given domain,
> so full -set- of available capacities within a domain.

Would be good to add the precision.

Although I'm not sure if that's the best policy compared to only
getting the range which would be far simpler to implement.
Do you have some topology example ?






>
> ---
> BR
> B.
> >
> >
> > >
> > > With the distinction between full and partial CPU capacity asymmetry,
> > > brought in by the newly introduced flag, the scope of the original
> > > SD_ASYM_CPUCAPACITY flag gets shifted, still maintaining the existing
> > > behaviour when one is detected on a given sched domain, allowing
> > > misfit migrations within sched domains that do not observe full range
> > > of CPU capacities but still do have members with different capacity
> > > values. It loses though it's meaning when it comes to the lowest CPU
> > > asymmetry sched_domain level per-cpu pointer, which is to be now
> > > denoted by SD_ASYM_CPUCAPACITY_FULL flag.
> > >
> > > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > > Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
> > > ---
> > >  include/linux/sched/sd_flags.h | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/include/linux/sched/sd_flags.h b/include/linux/sched/sd_flags.h
> > > index 34b21e9..57bde66 100644
> > > --- a/include/linux/sched/sd_flags.h
> > > +++ b/include/linux/sched/sd_flags.h
> > > @@ -91,6 +91,16 @@ SD_FLAG(SD_WAKE_AFFINE, SDF_SHARED_CHILD)
> > >  SD_FLAG(SD_ASYM_CPUCAPACITY, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
> > >
> > >  /*
> > > + * Domain members have different CPU capacities spanning all unique CPU
> > > + * capacity values.
> > > + *
> > > + * SHARED_PARENT: Set from the topmost domain down to the first domain where
> > > + *               all available CPU capacities are visible
> > > + * NEEDS_GROUPS: Per-CPU capacity is asymmetric between groups.
> > > + */
> > > +SD_FLAG(SD_ASYM_CPUCAPACITY_FULL, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
> > > +
> > > +/*
> > >   * Domain members share CPU capacity (i.e. SMT)
> > >   *
> > >   * SHARED_CHILD: Set from the base domain up until spanned CPUs no longer share
> > > --
> > > 2.7.4
> > >
