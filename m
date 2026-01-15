Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD51227B340
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768497812; cv=none; b=p8K4HnI9T8SgOv0aKy6owmlrXXmliM7Tmb0E/X9GdTb3qB/0LJZiHaYO9wILloKiI37tRoDJXlkH7pzNq3Aqc0eRh344wTM2K+rGOKtPOJYO4VJ53kAMQ+BH/o83+Qn4/4NZ6BtugxTHHJRH7NC01NF93lTfxGuonj1BbfrDLPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768497812; c=relaxed/simple;
	bh=mNdqCNiv3YpkIfV+LBX1fZkrX1vRUP6RN453FsHaaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljHdYiRdpOuiEQbLtj+PXlQYRyfny9mi4xZAHFAxUodfa2zavTaZNFxndg4B4UukZ8sUqie4UOI5vmBxDypIFZAV1YTmeqNuUymi7uxYLGbqlGBtL59YJ8ozKecQIL/GP1QNUGkCzretINVy/qqiBbjlEfTwztF8JL0Nw1g13rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTKAoUZr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTKAoUZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9BBC16AAE;
	Thu, 15 Jan 2026 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768497812;
	bh=mNdqCNiv3YpkIfV+LBX1fZkrX1vRUP6RN453FsHaaLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTKAoUZrRJTFIUXC+qBThBUef1tfw6+caWhlQmOrJlq1y4Y59B3nRrdC4p8tbfznr
	 +zYDahECxJh6XLBQSjVQ5lK/Z+FUz0gmdZkSMK/jz9ByXSdTbeLqklfkHPSsuONOh8
	 0XC9uGGQNYkaBkMOk3bvdCOyMoMq7Sbn7Xggxu6SWJo0jJL5gdubSTNSVl3FeAvd0Q
	 QbcwB9UlxNYDoc0nqWaFjEobZ6M5xk+8Jkoxcu42Tq7j5ZT4nW8Cocavj/DD10gBjr
	 FALpdF9Edq5DGhAecQFzJT85k44erYcpDGKLqAnhim68UNPehkJVIW1N7dS5gSpMfl
	 8HWEpAJ/us2CA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 10D2FF40068;
	Thu, 15 Jan 2026 12:23:31 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 15 Jan 2026 12:23:31 -0500
X-ME-Sender: <xms:kyJpaQlmKR4zWD4yNkrPq64SA1xp7c-4NlCNztIXOAjPV7sUrJ7Mjw>
    <xme:kyJpabOm1wWiz3SP3UTlIMK8kFwcfca9opGoMojNNhIPcB9nknMvO6v56vjI57Vqh
    ks4GebSZ_BvDU_GFRvVA3Wyt5ALqWrj26WiHljIomzmAKx92kpD-FU>
X-ME-Received: <xmr:kyJpaYDSS1BWvW1HxFQLWONhcViWOVpUksiuG9v7CDzYzZvvBw_4EEnlsRswcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeiieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinh
    hugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhn
    gheslhhinhhugidruggvvhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:kyJpaUXo0tCYhkX-oXD9KdOoJ7QqO_gqdcH0YL3zhRO8DU-lpdGRRg>
    <xmx:kyJpaabOv2GsX6wd9z_1oGf6UIPxMc3CFAB5a0LyU8aw66SWH7z5wg>
    <xmx:kyJpaaJKwQUXAogKqTYlQcK5mC24RWiEp-psBYSnLcKywz3bBvD4Cw>
    <xmx:kyJpaUgd1C3TR_3mnUHIvuGoa2y3I4abzU23Etdz-tWDHpd4FGrO6Q>
    <xmx:kyJpaVSCY1dGwv-wWPPWaU8Dg923g_coG7UvpT854GH_qjzGmXCDuwHy>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 12:23:28 -0500 (EST)
Date: Thu, 15 Jan 2026 17:23:23 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv3 10/15] mm/hugetlb: Remove fake head pages
Message-ID: <aWkhbWR-3fWjeTaE@thinkstation>
References: <20260115144604.822702-1-kas@kernel.org>
 <20260115144604.822702-11-kas@kernel.org>
 <30ae1623-63f9-4729-9c19-9b0a9a0ae9f1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30ae1623-63f9-4729-9c19-9b0a9a0ae9f1@kernel.org>

On Thu, Jan 15, 2026 at 05:49:43PM +0100, David Hildenbrand (Red Hat) wrote:
> On 1/15/26 15:45, Kiryl Shutsemau wrote:
> > HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
> > vmemmap pages for huge pages and remapping the freed range to a single
> > page containing the struct page metadata.
> > 
> > With the new mask-based compound_info encoding (for power-of-2 struct
> > page sizes), all tail pages of the same order are now identical
> > regardless of which compound page they belong to. This means the tail
> > pages can be truly shared without fake heads.
> > 
> > Allocate a single page of initialized tail struct pages per NUMA node
> > per order in the vmemmap_tails[] array in pglist_data. All huge pages
> > of that order on the node share this tail page, mapped read-only into
> > their vmemmap. The head page remains unique per huge page.
> > 
> > This eliminates fake heads while maintaining the same memory savings,
> > and simplifies compound_head() by removing fake head detection.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > ---
> >   include/linux/mmzone.h | 16 ++++++++++++++-
> >   mm/hugetlb_vmemmap.c   | 44 ++++++++++++++++++++++++++++++++++++++++--
> >   mm/sparse-vmemmap.c    | 44 ++++++++++++++++++++++++++++++++++--------
> >   3 files changed, 93 insertions(+), 11 deletions(-)
> > 
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 322ed4c42cfc..2ee3eb610291 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -82,7 +82,11 @@
> >    * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
> >    * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
> >    */
> > -#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
> > +#ifdef CONFIG_64BIT
> > +#define MAX_FOLIO_ORDER		(34 - PAGE_SHIFT)
> > +#else
> > +#define MAX_FOLIO_ORDER		(30 - PAGE_SHIFT)
> > +#endif
> 
> Where do these magic values stem from, and how do they related to the
> comment above that clearly spells out 16G vs. 1G ?

This doesn't change the resulting value: 1UL << 34 is 16GiB, 1UL << 30
is 1G. Subtract PAGE_SHIFT to get the order.

The change allows the value to be used to define NR_VMEMMAP_TAILS which
is used specify size of vmemmap_tails array.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
