Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448A35CBB8;
	Tue, 27 Jan 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525512; cv=none; b=Pp2pc7REb5UsKFK8Hnk1cH0XJYk56PX9xLZnzH6XyphHOo8m+klbi5kpgGsL754p1LaV6EYW3v9B7Hv3OaD/uyObGqlF1s27BTov/RJQO9JLZGfMBEMCdO6c4P9A1bOy2BaL+kkKLEAGLV3dCHiF/l66GHRJc9SUKROBPvGT30I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525512; c=relaxed/simple;
	bh=5QkDTL6egAnUB1nGC9oZeltVJm7ADFUMjzrh7J9CPm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crkYHokVIJTb9ihnak/aNsaHC8nddV58lvHnHl3/Wsx+uRvn5zQkKkjgT3v1YMBYPYjhDl/Hl9TwI6WBbwYRTWqrZGmE2xtfVhU2cdsDaxDXVpBbHXa3HuhjnKWgIFX7vCDk8iQiOeEDGcAwOyomCQiSFdZASeh7xbqRkh0YfEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qdcig6Dm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qdcig6Dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D726FC19422;
	Tue, 27 Jan 2026 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769525512;
	bh=5QkDTL6egAnUB1nGC9oZeltVJm7ADFUMjzrh7J9CPm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qdcig6Dm2T7kkQUYhrTQEhj/vQIsZok6gZ5kAyNcIppTfVTZvUMEM6Odge7NHZ4AR
	 W6wDPaOjR/hXuuOw0oacWd+48Q7WkMoxQqvnpC7NF3Ik7P27KVq+rwUumfeo3HeNE6
	 F90zs7LTS6s1lD6jfm9g26Tvigbbci8t1++dKB+9aN7AMG3mU/EVcx+9k2MVfl53z7
	 EQ46/P7pXvhoPW3y/oQlQazC24wvOr5ua01xhT6ibuwTZfP6Y3Wcgt2stpz3SxxwyZ
	 Z+evKf+2aYpCcpxvnBrntdUQEj7/DwAWuqkfpzLg3NwtW5sbnCYEFltfCFNavHTW2s
	 OU6wj0460ZYuQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id DF9ECF4006A;
	Tue, 27 Jan 2026 09:51:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 27 Jan 2026 09:51:50 -0500
X-ME-Sender: <xms:BtF4aZX7ZGvL60aSOai63pDHfU-w0OOc0qiHKoFnwzE96cRkQXXFYA>
    <xme:BtF4aU8borUUIgTSMCu75bhRo807gqcrK3kDr3UTPHAmBRZsUR9jf4Xpol8LO_3xl
    XMbkQ57PvIDKE5TgOuI6AgWWjur1jN1Mv1C8EjK6IhPMhyyzRbfEr4>
X-ME-Received: <xmr:BtF4aeygE9YPhnLQCzWM7vpz9RMu5WOw_L9MKlQnmdlYG8tcBnb5XTo4cOh9Aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedtkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepohhsrg
    hlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgiipdhrtghpthhtoheplhhorh
    gvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepiihihies
    nhhvihguihgrrdgtohhmpdhrtghpthhtohepsghhvgesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepmhhhohgtkhhosehsuhhsvgdrtghomhdprhgtphhtthhopehhrghnnhgvshes
    tghmphigtghhghdrohhrgh
X-ME-Proxy: <xmx:BtF4aUHU6j0lgE0w0xbQ1DS3XW57Jy6NPAYThyEByjs8bgTEcO2Rkw>
    <xmx:BtF4afKwQ2c7u2-NxxXOBr6iK0-mP1Rt3CvZpGGFi405w2V2e31U-A>
    <xmx:BtF4af7sSGKl5Sl0uGoJTAIqslThNJxjOeixVhXomvAq2ELC5d-IvQ>
    <xmx:BtF4aXTmQuSjg9HPM5kKkE_iCu7gYHojZT0N4n6zqvH1qXEa24q8IQ>
    <xmx:BtF4aRCy3CmU27FBHhnA2ROT2GBD1KPdwnAL7q09pdyo5F-BQlznYvxT>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 09:51:48 -0500 (EST)
Date: Tue, 27 Jan 2026 14:51:43 +0000
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
Message-ID: <aXjPf_fIWX74YVWD@thinkstation>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-10-kas@kernel.org>
 <ffe9811b-d7f8-4924-9ad6-96057a16b693@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffe9811b-d7f8-4924-9ad6-96057a16b693@linux.dev>

On Thu, Jan 22, 2026 at 03:00:03PM +0800, Muchun Song wrote:
> > +	if (pfn)
> > +		return pfn_to_page(pfn);
> > +
> > +	tail = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
> > +	if (!tail)
> > +		return NULL;
> > +
> > +	p = page_to_virt(tail);
> > +	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
> > +		prep_compound_tail(p + i, NULL, order);
> > +
> > +	spin_lock(&hugetlb_lock);
> 
> hugetlb_lock is considered a contended lock, better not to abuse it.
> cmpxchg() is enought in this case.

We hit the lock once per node (excluding races). Its contribution to the
lock contention is negligible. spin_lock() is easier to follow. I will
keep it.

Ack for the rest of your comments.


-- 
  Kiryl Shutsemau / Kirill A. Shutemov
