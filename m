Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC4AC4361B
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 05:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9801B222B6
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 05:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgLOF0C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Dec 2020 00:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgLOFZs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Dec 2020 00:25:48 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A85C0617A6
        for <linux-doc@vger.kernel.org>; Mon, 14 Dec 2020 21:25:07 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id jx16so25814892ejb.10
        for <linux-doc@vger.kernel.org>; Mon, 14 Dec 2020 21:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MScTYxoSfPHDqz2+BVl+z1OvhQSJGBAoa571MEAuHI4=;
        b=PqgXMNZceI4SB6cXF6KAwobxmAq2mWRYSmt1J7X2On2p9iERZ9EHp0wSCUHmr46nsA
         SiCwHB16rEaVFSz5S2cNai9io+ir85igzuvOeQxyzjrpDIJyYqM0edHmhXroY3ugrf5U
         vG+K6XMPNKiGltpjDNsd/fv+34ukFW87xPush957W4n8LPg+NRTkXlBKEFrh7RDL3ELg
         +NrHsEN0yhForooPRicwb0+rf2zyzDHoKPiRphHpvnYLVXlHvKXCabrv89+aqbKRIm7h
         ppofgZKJxBzXzrqZtg2ol62BAXZhibT3/fhVl7ar7++OuCr2CNrYzxhRDTMLjFZ7y4i5
         wn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MScTYxoSfPHDqz2+BVl+z1OvhQSJGBAoa571MEAuHI4=;
        b=hYJNSlRui+cuOcTNjTK2350QhsmGIJ56+TmkTrGcQ9x/VYPz+4agF9P3Prw5zbehdy
         7p+dqWsIst1rWSkHIEgnt3KSYUjcNSjSxBCxntLiFw/8Lq9aek10DvmJQR2+zCUKpsdi
         fhAwZzbEqTV3xRxNw17dbJYmLoLJVeVpGb6emCClYJGFEpWFdnupuIIn75MK6pgDy3xy
         2dAgfuWpNu5ufNcMrIRov/ZpR/B2xZ4msPpfb4gM3kS28q1yXc5ikTShBk1ETV2eP3FE
         cygjUwre03S8Rj774s+At+QQIhQy/k5Olnh+zmdR6/fsVRpGELAJo73zl85GDPQ5Gdjv
         qdNw==
X-Gm-Message-State: AOAM531Z6+4UCmysgXtv4Bwyelpcore6tZ5DIOY2w9t5KpYCzGaj7qsh
        bHqswPcHKob6yLyT7vFxEjmGsRDVDdNJ817WUNn/Zg==
X-Google-Smtp-Source: ABdhPJzSf89CWG1p4ITg2ctL0KI5p4iXHWylwwTq4hUdYg2dZW8IXnq3qsDC1bdRJLlKyGL3SSbqnjripuO24mHQCKA=
X-Received: by 2002:a17:906:4a4f:: with SMTP id a15mr25977973ejv.541.1608009906509;
 Mon, 14 Dec 2020 21:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
 <20201211202140.396852-5-pasha.tatashin@soleen.com> <20201214141715.GF32193@dhcp22.suse.cz>
In-Reply-To: <20201214141715.GF32193@dhcp22.suse.cz>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 15 Dec 2020 00:24:30 -0500
Message-ID: <CA+CK2bCWkPDw-Aif6iXHq15Dpa+50hmrcAk_LpMCMk30zY5aFw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mm: honor PF_MEMALLOC_PIN for all movable pages
To:     Michal Hocko <mhocko@suse.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 14, 2020 at 9:17 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Fri 11-12-20 15:21:38, Pavel Tatashin wrote:
> [...]
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index c2dea9ad0e98..4d8e7f801c66 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -3802,16 +3802,12 @@ alloc_flags_nofragment(struct zone *zone, gfp_t gfp_mask)
> >       return alloc_flags;
> >  }
> >
> > -static inline unsigned int current_alloc_flags(gfp_t gfp_mask,
> > -                                     unsigned int alloc_flags)
> > +static inline unsigned int cma_alloc_flags(gfp_t gfp_mask,
> > +                                        unsigned int alloc_flags)
>
> Do you have any strong reason to rename? Even though the current

Yes :)

> implementation only does something for cma I do not think this is all
> that important. The naming nicely fits with current_gfp_context so I
> would stick with it.

I am renaming because current->flags is removed from this function,
therefore keeping the name
becomes misleading. This function only addresses cma flag check
without looking at the thread local state now.

>
> Other than that the patch looks reasonable. I would just add a comment
> explaining that current_alloc_flags should be called _after_
> current_gfp_context because that one might change the gfp_mask.

Thanks, I will add it.

>
> With that addressed, feel free to add
> Acked-by: Michal Hocko <mhocko@suse.com>

Thank you,
Pasha
