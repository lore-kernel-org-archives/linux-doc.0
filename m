Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847B1C4361B
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 17:37:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FCF522ADC
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 17:37:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731025AbgLORhM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Dec 2020 12:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730979AbgLORg7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Dec 2020 12:36:59 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578FAC0617A6
        for <linux-doc@vger.kernel.org>; Tue, 15 Dec 2020 09:36:19 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id b73so21889509edf.13
        for <linux-doc@vger.kernel.org>; Tue, 15 Dec 2020 09:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBDK63GlHOlyO9RlKcvZ9t4IBZeQgUAddkJzA4+pZfE=;
        b=lejNhdsWwxo/TT82p6OQnURH17yYY423IOsbvMePcbxrq8W9i6ecPLPycmpqjQZmCa
         iGA+MVyZFekLrDOFc5wGuk7e+Bk+/Qhcxbf873i2d4yaQwW1WLlqheEc91isimu2z9mz
         6m96OzgwbX8Q5MgIesIlxfG1j8yg6hkiSMhPTYHQLZR2aDV1B9Vsts5QVqXNZBBRciS3
         K9Tnv5xYp6a1Z/d9yHpdeThyKicpY68R1/rkaylrnML9zrabfTLG9fbRrZEno6UEYo3S
         qisR7eLQxXulS/UTnWWec9cweZP8thNI64LTL85awbDA0QZloGHSADDPD8UJKlkNkIZ3
         OQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBDK63GlHOlyO9RlKcvZ9t4IBZeQgUAddkJzA4+pZfE=;
        b=Dp4Bk7ngV1E/hrgpRQq9t3wVmX31RL2J0r1HQHylPkb+t6WVAWq/0/UeTtPJYB5MBm
         mlpkm9CvZUAIwHSdKrBTcwxLq7cA5F5xXeTjeSEOGJlrII0Ng20jD/PZCZUXG5KRu9WG
         OnhwBv0dh69mp+evIYCqoLn5w0fsoUA304/t35XzbhznlJR9fXGmosvg9B84s/goEHAZ
         9OuzNRdeFL3TU9xKS8VDR9M4MPtFTbfeKAC9+YNUruFdWWiw1xd8vLkf9Ga9xcUYcqW7
         BCLtGX8gOML6Gq5YdsdJruu4ammPJzuuMLnzfA+BiofGUpwXODXBGP21k31OoPFF3HSK
         jzzA==
X-Gm-Message-State: AOAM531IoGOokZEjvVM8PIAcyFtNCL2n5QPQnfAf9bL33ogaZtPClVFv
        TyYD89QKsPFhcvWUgNm6lycDP25Y12mfFJe8JEymmQ==
X-Google-Smtp-Source: ABdhPJxkotDtBwePrZNWACOguhUCy52yTPCC9JS1qHIZNRcgMlWANMKWpPVVHpMtEbUV8FCdN5GO9PdQMVLqe7y78Zk=
X-Received: by 2002:a50:d757:: with SMTP id i23mr30805137edj.116.1608053778064;
 Tue, 15 Dec 2020 09:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
 <20201211202140.396852-4-pasha.tatashin@soleen.com> <20201214140912.GE32193@dhcp22.suse.cz>
 <CA+CK2bA9u_ZUosha0JvW6ezs-h95UBHZztoFojMyFbC791ximw@mail.gmail.com> <20201215082524.GK32193@dhcp22.suse.cz>
In-Reply-To: <20201215082524.GK32193@dhcp22.suse.cz>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 15 Dec 2020 12:35:42 -0500
Message-ID: <CA+CK2bD2en+N2BAGNYD+8DvLqd-MA0pkCkgFTyX3Ga1QTvThyQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] mm: apply per-task gfp constraints in fast path
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

On Tue, Dec 15, 2020 at 3:25 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 15-12-20 00:20:39, Pavel Tatashin wrote:
> > > Ack to this.
> >
> > Thank you.
> >
> > >
> > > But I do not really understand this. All allocation contexts should have
> > > a proper gfp mask so why do we have to call current_gfp_context here?
> > > In fact moving the current_gfp_context in the allocator path should have
> > > made all this games unnecessary. Memcg reclaim path might need some
> > > careful check because gfp mask is used more creative there but the
> > > general reclaim paths should be ok.
> > >
> > > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > >
> > > Again, why do we need this when the gfp_mask
> > > >       };
> > > >
> > --
> >
> > Hi Michal,
> >
> > Beside from __alloc_pages_nodemask(), the current_gfp_context() is
> > called from the following six functions:
> >
> > try_to_free_pages()
> > try_to_free_mem_cgroup_pages()
> > __node_reclaim()
> > __need_fs_reclaim()
> > alloc_contig_range()
> > pcpu_alloc()
> >
> > As I understand, the idea is that because the allocator now honors
> > gfp_context values for all paths, the call can be removed from some of
> > the above functions. I think you are correct. But, at least from a
> > quick glance, this is not obvious, and is not the case for all of the
> > above functions.
> >
> > For example:
> >
> > alloc_contig_range()
> >   __alloc_contig_migrate_range
> >    isolate_migratepages_range
> >      isolate_migratepages_block
> >         /*
> >          * Only allow to migrate anonymous pages in GFP_NOFS context
> >          * because those do not depend on fs locks.
> >          */
> >        if (!(cc->gfp_mask & __GFP_FS) && page_mapping(page))
> >           goto isolate_fail;
> >
> > If we remove current_gfp_context() from alloc_contig_range(), the
> > cc->gfp_mask will not be updated with proper __GFP_FS flag.
>
> I do not think I was proposing to drop current_gfp_context from
> alloc_contig_range. ACR needs some work to be properly scoped gfp mask
> aware. This should be addressed but I do not think think the code
> works properly now so I wouldn't lose sleep over it in this series. At
> least __alloc_contig_migrate_range should follow the gfp mask given to
> alloc_contig_range.
>
> > I have studied some other paths, and they are also convoluted.
> > Therefore, I am worried about performing this optimization in this
> > series.
>
> Dropping current_gfp_context from the reclaim context should be done in
> a separate patch. I didn't mean to push for this here. All I meant was
> to simply not touch gfp/zone_idx in the reclaim path. The changelog
> should call out that the page allocator always provides proper gfp mask.

I see what you mean. I will remove reclaim changes, and will add a
note to changelog.

Thank you,
Pasha

>
> --
> Michal Hocko
> SUSE Labs
