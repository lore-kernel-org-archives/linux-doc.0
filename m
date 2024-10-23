Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC461AAC4
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 00:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729644380; cv=none; b=HZrqbzsD8EWepm+V7X9m/z+t7JpJg0QvfXmUOSOyXI8FM72vskhBN2FAnJZQ8lL8AG44hGNyr1fTNs9gUO5LaZoFNTlwM0ADsPSkqSOJ630kStQ6rgBOItZo4G1UVK43FNuLBI3bVuCYmGfhwoZ1qNtGDRGZazOhHem49dASx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729644380; c=relaxed/simple;
	bh=AwFPasjpqb3XFrQ+EU3pKzTQisB3kEoJsciOeoRSIrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNXx2ryCbnKBzK8X3v6RMXXkBOZkQswdQLhFDXtoiFN7mtawrbWfwGaJmHRmmALmatZt5AufOFPxe4GsplKKMUtZb2mRcAW5eRPEzCeSWe4NZQ3jXvqRTEd0ycw2R76yimBa0aVpHsWKm82DMPHCKbFQPhZbbVPkUPpYH2BUIA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pm7fWzL6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pm7fWzL6"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso890251666b.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 17:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729644377; x=1730249177; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DA7hqLuD0SjigMcr5CX7c/N2Gt0IuASV0oXAPrAxSYE=;
        b=pm7fWzL6vO1NI4DfvTYAjk8E3RrvEcP0fDskncZBHMod6T7IB8aeJlpWyOi/dfl9y+
         lPCwiiqPsH29vhQKZuxTlXHNNyihF93P+5BmefVqomypCa4Y+blUd0MGEKrvgThgyuWd
         00PmnuzDwsT8qYIzlcb0kP4Ox5TrZ0u9s4xGQbct5tz7UJADrEkW5H/OKFZGNcsx86R/
         vlsiiGSldZ1jCVRU71Yf5Qw5V8z+PvxELRmRNsFhzF6Fb6xPzC3AhQrPYKH0D0grgEi1
         vtA22XkQqFuEdPiZzMyyvaNpu6zeBfXF2VWbqsL2xemSgl5onrwunI1kGeAhn/bDT1T3
         KHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729644377; x=1730249177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DA7hqLuD0SjigMcr5CX7c/N2Gt0IuASV0oXAPrAxSYE=;
        b=YQaE78GVAge79zjjTm9TzHhbFSlK6NCagD6rqIiND/E43OEa3wkTUT6XiQ4lK/3yEQ
         4M9xT58rIUo/pmB3J7LQUpFJNe4XI9z0gHq9W2w3Sh8EdGdDWMalbxJeHftVB1VzpxHX
         a/zz1/a03pvsi3r6G4qG/FpL7/3NyB1dJ9qcW2n/eoIoHmqikQa0eBCSU4WOtAVLa8SG
         P7TphI3r0qJW519je+KqWyEcIlVnm3isAHLXhnVlL9yLZ33Nv5HrNd+1HMWDbFx4xHm+
         9VlSS/N7JWJ7uaCMZBaRSaiBi4p7p1uj6swajVZ9ne6i3qPLUisbMPvQ2HGNTAgzGrNo
         ya2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo6vck/FQJaHtFd1aO9rY4PrKysf4hpplTJqd57djXH1zOTrf/KJ4vmfra27E/JwyQakocujaXuBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1EBBHu/sTHmK4M14vzXqDRrLRZsESGKJ2avbfwGV31zkOVj+W
	LmfevExn80gbzZ0JlVaSqzJ4h+I8cN93yaoeAabMBH7YYeVDL+35ofCbS8lPHRawawXyo9XTkuT
	Oo/STUtHyrTI0YpYKqTfJPdilcdRpSsEKNyYm
X-Google-Smtp-Source: AGHT+IGoIXJSAkpe8fqP9IrcYJDa0aJQe1g/26o/fr+1FgSNM3uCwl32CQGzeahCvVbb7An+pP6mrWo8wwZaJmOUvUU=
X-Received: by 2002:a17:907:3fa6:b0:a99:c0be:a8ac with SMTP id
 a640c23a62f3a-a9abf8b233amr58602066b.37.1729644377238; Tue, 22 Oct 2024
 17:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018105026.2521366-1-usamaarif642@gmail.com>
 <20241018105026.2521366-2-usamaarif642@gmail.com> <CAJD7tkYEe10Xw-8azM-80pHv6YjvosZDHTdZfYttAuD5u1+s8A@mail.gmail.com>
 <07e6018b-bc6f-4e1e-9bc3-07a4b5a384fc@gmail.com>
In-Reply-To: <07e6018b-bc6f-4e1e-9bc3-07a4b5a384fc@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 22 Oct 2024 17:45:41 -0700
Message-ID: <CAJD7tkaD0m7ciiy6Nj7CZb2_26Dv4T=2cRW7h728vLxczOVkYg@mail.gmail.com>
Subject: Re: [RFC 1/4] mm/zswap: skip swapcache for swapping in zswap pages
To: Usama Arif <usamaarif642@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hannes@cmpxchg.org, 
	david@redhat.com, willy@infradead.org, kanchana.p.sridhar@intel.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, ryan.roberts@arm.com, 
	ying.huang@intel.com, 21cnbao@gmail.com, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Kairui Song <kasong@tencent.com>, 
	Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

[..]
> >> @@ -1576,6 +1576,52 @@ bool zswap_store(struct folio *folio)
> >>         return ret;
> >>  }
> >>
> >> +static bool swp_offset_in_zswap(unsigned int type, pgoff_t offset)
> >> +{
> >> +       return (offset >> SWAP_ADDRESS_SPACE_SHIFT) <  nr_zswap_trees[type];
> >
> > I am not sure I understand what we are looking for here. When does
> > this return false? Aren't the zswap trees always allocated during
> > swapon?
> >
>
> Hi Yosry,
>
> Thanks for the review!
>
> It becomes useful in patch 3 when trying to determine if a large folio can be allocated.
>
> For e.g. if the swap entry is the last entry of the last tree, and 1M folios are enabled
> (nr_pages = 256), then the while loop in zswap_present_test will try to access a tree
> that doesn't exist from the 2nd 4K page onwards if we dont have this check in
> zswap_present_test.

Doesn't swap_pte_batch() make sure that the range of swap entries
passed here all corresponds to existing swap entries, and those
entries should always have a corresponding zswap tree? How can the
passed in range contain an entry that is not in any zswap tree?

I feel like I am missing something.

>
> >> +}
> >> +
> >> +/* Returns true if the entire folio is in zswap */
> >
> > There isn't really a folio at this point, maybe "Returns true if the
> > entire range is in zswap"?
>
> Will change, Thanks!
>
> >
> > Also, this is racy because an exclusive load, invalidation, or
> > writeback can cause an entry to be removed from zswap. Under what
> > conditions is this safe? The caller can probably guarantee we don't
> > race against invalidation, but can we guarantee that concurrent
> > exclusive loads or writebacks don't happen?
> >
> > If the answer is yes, this needs to be properly documented.
>
> swapcache_prepare should stop things from becoming racy.
>
> lets say trying to swapin a mTHP of size 32 pages:
> - T1 is doing do_swap_page, T2 is doing zswap_writeback.
> - T1 - Check if the entire 32 pages is in zswap, swapcache_prepare(entry, nr_pages) in do_swap_page is not yet called.
> - T2 - zswap_writeback_entry starts and lets say writes page 2 to swap. it calls __read_swap_cache_async -> swapcache_prepare increments swap_map count, writes page to swap.

Can the folio be dropped from the swapcache at this point (e.g. by
reclaim)? If yes, it seems like swapcache_prepare() can succeed and
try to read it from zswap.

> - T1 - swapcache_prepare is then called and fails and then there will be a pagefault again for it.
>
> I will try and document this better.

We need to establish the rules for zswap_present_test() to not be
racy, document them at the definition, establish the safety of racy
callers (i.e. can_swapin_thp()), and document them at the call sites.

>
> >
> >> +bool zswap_present_test(swp_entry_t swp, int nr_pages)
> >> +{
> >> +       pgoff_t offset = swp_offset(swp), tree_max_idx;
> >> +       int max_idx = 0, i = 0, tree_offset = 0;
> >> +       unsigned int type = swp_type(swp);
> >> +       struct zswap_entry *entry = NULL;
> >> +       struct xarray *tree;
> >> +
> >> +       while (i < nr_pages) {
> >> +               tree_offset = offset + i;
> >> +               /* Check if the tree exists. */
> >> +               if (!swp_offset_in_zswap(type, tree_offset))
> >> +                       return false;
> >> +
> >> +               tree = swap_zswap_tree(swp_entry(type, tree_offset));
> >> +               XA_STATE(xas, tree, tree_offset);
> >
> > Please do not mix declarations with code.
> >
> >> +
> >> +               tree_max_idx = tree_offset % SWAP_ADDRESS_SPACE_PAGES ?
> >> +                       ALIGN(tree_offset, SWAP_ADDRESS_SPACE_PAGES) :
> >> +                       ALIGN(tree_offset + 1, SWAP_ADDRESS_SPACE_PAGES);
> >
> > Does this work if we always use ALIGN(tree_offset + 1,
> > SWAP_ADDRESS_SPACE_PAGES)?
>
> Yes, I think max_idx = min(offset + nr_pages, ALIGN(tree_offset + 1, SWAP_ADDRESS_SPACE_PAGES)) - 1;
> will work. I will test it out, Thanks!

Might need to split it over two lines.
