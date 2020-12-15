Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA55C4361B
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 08:28:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 896122229C
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 08:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgLOI2g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Dec 2020 03:28:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:43338 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgLOI2f (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Dec 2020 03:28:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1608020869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BcRdGe+BwGu/P3zGHntuQl4s/cuwIdbN+JJKDivcwsQ=;
        b=ohfCrHHgr2quArA8JO/yaH5tWvtHs2Q3srZkxnSQgMo48bWJHDBsV4sl+7x0dsQVvSJncz
        NcfvPc7q0OMQKQOqgg8+bHPdyfXQgmhA5NpGAJ+TYiEV+xceNyQrEJI7eJv5nKmyokN2PH
        0y+JLdG0ud3+p17jlhJ9WWGTPpdTag0=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CA69AAC7F;
        Tue, 15 Dec 2020 08:27:48 +0000 (UTC)
Date:   Tue, 15 Dec 2020 09:27:48 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
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
Subject: Re: [PATCH v3 4/6] mm: honor PF_MEMALLOC_PIN for all movable pages
Message-ID: <20201215082748.GL32193@dhcp22.suse.cz>
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
 <20201211202140.396852-5-pasha.tatashin@soleen.com>
 <20201214141715.GF32193@dhcp22.suse.cz>
 <CA+CK2bCWkPDw-Aif6iXHq15Dpa+50hmrcAk_LpMCMk30zY5aFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bCWkPDw-Aif6iXHq15Dpa+50hmrcAk_LpMCMk30zY5aFw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue 15-12-20 00:24:30, Pavel Tatashin wrote:
> On Mon, Dec 14, 2020 at 9:17 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Fri 11-12-20 15:21:38, Pavel Tatashin wrote:
> > [...]
> > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > index c2dea9ad0e98..4d8e7f801c66 100644
> > > --- a/mm/page_alloc.c
> > > +++ b/mm/page_alloc.c
> > > @@ -3802,16 +3802,12 @@ alloc_flags_nofragment(struct zone *zone, gfp_t gfp_mask)
> > >       return alloc_flags;
> > >  }
> > >
> > > -static inline unsigned int current_alloc_flags(gfp_t gfp_mask,
> > > -                                     unsigned int alloc_flags)
> > > +static inline unsigned int cma_alloc_flags(gfp_t gfp_mask,
> > > +                                        unsigned int alloc_flags)
> >
> > Do you have any strong reason to rename? Even though the current
> 
> Yes :)
> 
> > implementation only does something for cma I do not think this is all
> > that important. The naming nicely fits with current_gfp_context so I
> > would stick with it.
> 
> I am renaming because current->flags is removed from this function,
> therefore keeping the name
> becomes misleading. This function only addresses cma flag check
> without looking at the thread local state now.

Fair enough. I still dislike cma being called out explicitly because
that is slightly misleading as well. gpf_to_alloc_flags would be more
explicit I believe. But I do not want to bikeshed this to death.

-- 
Michal Hocko
SUSE Labs
