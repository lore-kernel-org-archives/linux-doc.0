Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5F12FB0B4;
	Wed, 28 Jan 2026 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605176; cv=none; b=RjlAbDmE1Y3sewD382cPlea5VrmOdJfjhDJ8K7b6FjzHdi+ifxmfMRHBXkv53pxRO2e9FsUu8O8HsEi9mJXklBq8kJZmNavbvb0rYqEb5X3E8FUwWu8rDFCSrd8mORHL080cxw/x+FjwXB9jkUlaC9oKGiNgUj/tYiMU2mpL3pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605176; c=relaxed/simple;
	bh=MWbIAfBchoyoNYFkExtCSdFr3OpWnWDSLBb7n5YyyiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlljmokXIY00UibLI66uMqkgXB1X6ERvjpo+cHes8DCnvmXcmboMyzhVZrmRx0Lw8OfCQ5Dk77I0KscVddZCKxhCbc4iMaDguUHjXARh24y+KTDXQS4mdZhseRRwwnNq65NZc7MKByUJCqWU05ZMZbSWJyszZgINGGAuyJ2Qvak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBTfHOg/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBTfHOg/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC5FC116C6;
	Wed, 28 Jan 2026 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769605175;
	bh=MWbIAfBchoyoNYFkExtCSdFr3OpWnWDSLBb7n5YyyiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBTfHOg/whqQDUteF39OH1O7ZJV51aj1KWZNMqn2BlAwriZqvU9IoZ/jZGACQeOOs
	 RY7LMe0UJOen4cmLwQBNrDcMDy56MPDWJ7np7Ikasy4kHva3n0BUX8hR6aL9EOi9YE
	 mlXIwUdNS4qAm74KUFZ20w3K6tOlCi4sVloSu+xt0crpAue8ir9NQbWD8IwuLWwc+h
	 YMBsDW8aw/h+cIyR4oLjLbBpX7mBlzGfiasa67G+soyR4d3nNiMo977M0sdrh3WSiy
	 yj6QsWFFsFGfkkF0mMHShiviwCxiDvGQSKWEm2oUnrF5vN+s9IOjnJboogs7pY7RaV
	 DiaYPOiCYs61w==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id BCE41F40077;
	Wed, 28 Jan 2026 07:59:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 28 Jan 2026 07:59:33 -0500
X-ME-Sender: <xms:NQh6afJ7LEqqoM5OQSBBhs1ZhRV5cTf9wzuYgk14848G84yEUL4JXg>
    <xme:NQh6aehQo8l2ezJmorIdL7M6yzV1beZOHBIYpcHHCn0MjO6m28O33o2rlRu4WKY-g
    BGFt2JyJ-htIcu3PBsrEpT6BkAbnyKg3-y_Cf0KpHY90_DvZIxNBg>
X-ME-Received: <xmr:NQh6aRHpyody9eTimhv_gyGyZe_jgAV4SdZQpmXiadWipdjHg7ntDgmQQtOrEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeigfdvtdekveejhfehtdduueeuieekjeekvdfggfdtkeegieevjedvgeetvdeh
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopehosh
    grlhhvrgguohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehvsggrsghkrgesshhushgvrdgtiidprhgtphhtthhopehloh
    hrvghniihordhsthhorghkvghssehorhgrtghlvgdrtghomhdprhgtphhtthhopeiiihih
    sehnvhhiughirgdrtghomhdprhgtphhtthhopegshhgvsehrvgguhhgrthdrtghomhdprh
    gtphhtthhopehmhhhotghkohesshhushgvrdgtohhmpdhrtghpthhtohephhgrnhhnvghs
    segtmhhpgigthhhgrdhorhhg
X-ME-Proxy: <xmx:NQh6aQLK4Svpd37QFpMIaymOrWp1qX2ZTSoVI1al2iVT_IfrNGYaTQ>
    <xmx:NQh6aR-6IYa0nfLGKvBuinoM9HaZ1f-cbZ_w4jpQlSYZA0loNeZtCw>
    <xmx:NQh6aSdDjX6urIZ_w9RfeIvmxqcCdOAVohyQ46LpJhQWyc_Q0uqfmg>
    <xmx:NQh6aelrkE7J2Oj3AEWTG9Sesr0fqbLAaX-QIFQtaGLKQVLLHSqMcg>
    <xmx:NQh6aeGioZD_gZGiZgG1YG8MLXwUDabCbuNEzFIW8SNHV1PjIH2Lh723>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 07:59:32 -0500 (EST)
Date: Wed, 28 Jan 2026 12:59:26 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>
Subject: Re: [PATCHv4 09/14] mm/hugetlb: Remove fake head pages
Message-ID: <aXoHb5fYfZNQxmMe@thinkstation>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-10-kas@kernel.org>
 <ffe9811b-d7f8-4924-9ad6-96057a16b693@linux.dev>
 <aXjPf_fIWX74YVWD@thinkstation>
 <25C01EB2-FC77-43A5-A737-7BD3D2D98EDE@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25C01EB2-FC77-43A5-A737-7BD3D2D98EDE@linux.dev>

On Wed, Jan 28, 2026 at 10:43:13AM +0800, Muchun Song wrote:
> 
> 
> > On Jan 27, 2026, at 22:51, Kiryl Shutsemau <kas@kernel.org> wrote:
> > 
> > On Thu, Jan 22, 2026 at 03:00:03PM +0800, Muchun Song wrote:
> >>> + if (pfn)
> >>> + 	return pfn_to_page(pfn);
> >>> +
> >>> + tail = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
> >>> + if (!tail)
> >>> + 	return NULL;
> >>> +
> >>> + p = page_to_virt(tail);
> >>> + for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
> >>> + 	prep_compound_tail(p + i, NULL, order);
> >>> +
> >>> + spin_lock(&hugetlb_lock);
> >> 
> >> hugetlb_lock is considered a contended lock, better not to abuse it.
> >> cmpxchg() is enought in this case.
> > 
> > We hit the lock once per node (excluding races). Its contribution to the
> > lock contention is negligible. spin_lock() is easier to follow. I will
> > keep it.
> 
> I don't think cmpxchg() is hard to follow. It’s precisely because of
> your abuse that interrupts still have to be disabled here—hugetlb_lock
> must be an irq-off lock. Are you really going to use spin_lock_irq just
> because “it feels simpler” to you?

I looked again at it and reconsidered. I will use cmpxchg(), but mostly
because hugetlb_lock is a bad fit to protect anything in pg_data_t.
vmemmap_tails can be used by code outside hugetlb.

Here's the fixup.

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 29e9bbb43178..63e7ca85c8c9 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -512,18 +512,11 @@ static struct page *vmemmap_get_tail(unsigned int order, int node)
 	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
 		prep_compound_tail(p + i, NULL, order);
 
-	spin_lock(&hugetlb_lock);
-	if (!NODE_DATA(node)->vmemmap_tails[idx]) {
-		pfn = PHYS_PFN(virt_to_phys(p));
-		NODE_DATA(node)->vmemmap_tails[idx] = pfn;
-		tail = NULL;
-	} else {
-		pfn = NODE_DATA(node)->vmemmap_tails[idx];
-	}
-	spin_unlock(&hugetlb_lock);
-
-	if (tail)
+	pfn = PHYS_PFN(virt_to_phys(p));
+	if (cmpxchg(&NODE_DATA(node)->vmemmap_tails[idx], 0, pfn)) {
 		__free_page(tail);
+		pfn = READ_ONCE(NODE_DATA(node)->vmemmap_tails[idx]);
+	}
 
 	return pfn_to_page(pfn);
 }
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
