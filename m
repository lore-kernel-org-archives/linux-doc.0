Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE89C4361B
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 05:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C57422287
	for <linux-doc@archiver.kernel.org>; Tue, 15 Dec 2020 05:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgLOFXQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Dec 2020 00:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgLOFV5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Dec 2020 00:21:57 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBECC0617B0
        for <linux-doc@vger.kernel.org>; Mon, 14 Dec 2020 21:21:17 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id c7so19628666edv.6
        for <linux-doc@vger.kernel.org>; Mon, 14 Dec 2020 21:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DtoFrDGyRzomOBINo4k6/LLWjzIuvMntHICBSDufujU=;
        b=JccyEeDCqJGvzrnf2MTHV8vENXCE6EcEbKHITxFkBO6S45+kn+osTIpTjWRM3JtZzb
         vPNNdbh5S1JVM6LI9b4DAi1HSURysZF24us8TaPcZPi4KFLMvmggU5+OyCQKe8XTQsAc
         33BL/38GifT8ctNK9/YkhL2cd4BcyB0koGRZHwFnm8E6zJWZ2ODFlYlUqZxwvLxgedwT
         PJKUgrfIFKkNGGBF7KS7nYRoNQznH13b87lhRhv3fJymmBExXI74BqviWJOlMg02DfSB
         mqjs+rdiet8J7N3eIxlNMVG7tLXZZIZGnLNjjC7+UaB3cYlooKmKrAG1qCFKu2x4n5U+
         Nwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DtoFrDGyRzomOBINo4k6/LLWjzIuvMntHICBSDufujU=;
        b=sRLFqQH4qUftLC12WR39pABvyXAJU3AHSho9BF0UbRBgbCVwGC7U2+zDNeJPJCQIkW
         f+GuJ50LnCMJEdQg9HHldJsT3GJb2C4cmps1uOh0XSfDeh5VDyt+3AixdRl4YLDq9Nni
         eO+j0FBwXhBemoNQPyekDkEEpN3zU4vT5eK+V63/IZhOjUMEh4Fc2YsihGV+XFYqaMRA
         MEf4T1jWrYpwQ7foX4EGQofA662L0qlZWySQx2ilkFYVvnxaBe7/cEz9yh/jBrb4A2UC
         PJBDEtk94DIztrEPAtAUNPHuJlZwBdjxMtBWaDmxYd9EdsLtrR1Enf3VLyz2BQrVowQJ
         xb4A==
X-Gm-Message-State: AOAM5326tKzIP9ixOTZaixnOG0Tr945ypxX0Pz7NxaMbNWyp0XUimS+n
        EEjvmamd3085QvDrWik4kjvlqQoAAd9uUpXG+y9aUA==
X-Google-Smtp-Source: ABdhPJymYnD0yKSOBXxwE4d162v7Rhh7achqxetqFLI95KAw3f9XowfmwGq2H2/sTiKf/Lsn8U2gqBc4k8RGnx9uCRI=
X-Received: by 2002:a05:6402:95c:: with SMTP id h28mr853886edz.26.1608009675762;
 Mon, 14 Dec 2020 21:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
 <20201211202140.396852-4-pasha.tatashin@soleen.com> <20201214140912.GE32193@dhcp22.suse.cz>
In-Reply-To: <20201214140912.GE32193@dhcp22.suse.cz>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 15 Dec 2020 00:20:39 -0500
Message-ID: <CA+CK2bA9u_ZUosha0JvW6ezs-h95UBHZztoFojMyFbC791ximw@mail.gmail.com>
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

> Ack to this.

Thank you.

>
> But I do not really understand this. All allocation contexts should have
> a proper gfp mask so why do we have to call current_gfp_context here?
> In fact moving the current_gfp_context in the allocator path should have
> made all this games unnecessary. Memcg reclaim path might need some
> careful check because gfp mask is used more creative there but the
> general reclaim paths should be ok.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
>
> Again, why do we need this when the gfp_mask
> >       };
> >
--

Hi Michal,

Beside from __alloc_pages_nodemask(), the current_gfp_context() is
called from the following six functions:

try_to_free_pages()
try_to_free_mem_cgroup_pages()
__node_reclaim()
__need_fs_reclaim()
alloc_contig_range()
pcpu_alloc()

As I understand, the idea is that because the allocator now honors
gfp_context values for all paths, the call can be removed from some of
the above functions. I think you are correct. But, at least from a
quick glance, this is not obvious, and is not the case for all of the
above functions.

For example:

alloc_contig_range()
  __alloc_contig_migrate_range
   isolate_migratepages_range
     isolate_migratepages_block
        /*
         * Only allow to migrate anonymous pages in GFP_NOFS context
         * because those do not depend on fs locks.
         */
       if (!(cc->gfp_mask & __GFP_FS) && page_mapping(page))
          goto isolate_fail;

If we remove current_gfp_context() from alloc_contig_range(), the
cc->gfp_mask will not be updated with proper __GFP_FS flag.
I have studied some other paths, and they are also convoluted.
Therefore, I am worried about performing this optimization in this
series.
