Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD973587A6;
	Thu, 22 Jan 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769081392; cv=none; b=ivDT9jHRPJCcrjJUFkpWd6XHb6vNpHEF6zbpIGZQoridzBs8dCusTlqaYGtN52Eh2tlRwAECcLwf5Gz6E9XAccsQjsdU4ux8VgMw2LVg2f13IH6uyVhA1SmZtKOGygXTFhfMZpIr12eXTFuDrOJNhjVNxFxQevmCt4LrMYe8IXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769081392; c=relaxed/simple;
	bh=6+k4UVNbT+w35km52qtWegiDJEC7IGtBYhfU8DZwtes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/KspYJM2W0oaJh+y7BZOYCDG9Bh876aRimXIbO56/1hJQ5Nhk1VFx9KF8jwlSmAJavtoTE27OuIy6PrQFoOfHt5jOjnEJHylRJ4WDXu0U5IQRWDvbotyr1lYLOENXzj0u8Tc4WrEJjQLhJJQa0k90oLWG/SjexRDAsqIlROnAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rW1gA+My; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rW1gA+My"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C3FC4AF09;
	Thu, 22 Jan 2026 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769081392;
	bh=6+k4UVNbT+w35km52qtWegiDJEC7IGtBYhfU8DZwtes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rW1gA+Mysg8qNsmPkZrSjxE9hLEPUy1tFzAO7z5dY0IkDeouLBOU0r2ljIA3fvUIQ
	 IUW/ZTYm42XPCFnIAfhUEYu2ZGxo8VBmz3LhT6lN+j8ukQEfMOt8MVdl/1TLvuxmf6
	 LCN/UP4caBRd7QMK19ZDXs/4jLIWvfkOQBwa1TgUm3POHqAzgclessdZz/nK3t304b
	 su5plVDH5YToWm1ZYFk4hmThulQL6Nf+1kyf2CJTEwe2SsTWfXw59K8omnzA20Aozq
	 HuN1syWuQY4sSmxZsozAaV5rmMMc7XvS5NFCrDd7oY1q04ZqBM3R72PFkoFCQ0hVNZ
	 DPCIL1Q4C2kzQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 931E3F40069;
	Thu, 22 Jan 2026 06:29:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 22 Jan 2026 06:29:50 -0500
X-ME-Sender: <xms:LgpyaRMCOqG6TSxsLeBIsmLJ9ou2avO5AwZCqCxKyd7atvN5aXW66g>
    <xme:LgpyafUSU0Wtv9NPso6hhIXRGICGK-gHqfUJmTlaZLf4IRlzjVzGuGmTF3DLD2l3z
    OkJa4NeP7gJtxDmSdbuZH1xhUp7sqgbpKB_5pQnhwSAMQ_vc4XN4no>
X-ME-Received: <xmr:LgpyaZo29EOFiQym1xfGjM85RhsqLDJpGA8Tq9JkrKhK2kvcGMm7U0RWGk_AdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeitdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeigfdvtdekveejhfehtdduueeuieekjeekvdfggfdtkeegieevjedvgeetvdeh
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepiihihiesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuh
    igqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhg
    sehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehu
    shgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgtphhtthhopehfvhgulhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdguvgdp
    rhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:LgpyaVfjbK06k--k_MSWJ66Q9g8RZysYYF-wNcrPVH3Dias3QjVrRg>
    <xmx:LgpyaVDhebcBkMkPOiycyCMVNdjkKN0AZULhpzXikCuVmgvuQTlxwQ>
    <xmx:LgpyaQT5d1PoaVkc3_G1s64mZdv1ZmaakCRlBVq2yFjXVgWGwdCE2A>
    <xmx:LgpyaQJpoCNxDXghyE26KFHY0vlttGsHCI_HzxfExV--1CV2hdt28w>
    <xmx:LgpyaYbc4KaLVQ1-VOARShkUV8Uk5W6Gk2_r3ovBVMnYT9oUUOKnOXfY>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jan 2026 06:29:48 -0500 (EST)
Date: Thu, 22 Jan 2026 11:29:43 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv4 05/14] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Message-ID: <aXIKBhHd7IbaJkXg@thinkstation>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-6-kas@kernel.org>
 <EB8941D9-B6E0-41DD-9C44-038D21583E17@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EB8941D9-B6E0-41DD-9C44-038D21583E17@nvidia.com>

On Wed, Jan 21, 2026 at 12:12:13PM -0500, Zi Yan wrote:
> > @@ -1244,8 +1244,8 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
> >  again:
> >  	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
> >  	memcpy(&ps->page_snapshot, page, sizeof(*page));
> > -	head = ps->page_snapshot.compound_info;
> > -	if ((head & 1) == 0) {
> > +	info = ps->page_snapshot.compound_info;
> > +	if ((info & 1) == 0) {
> 
> This could be “if (!(info & 1))” like _compound_head(), right?

Right. But I don't see why it has to change.


-- 
  Kiryl Shutsemau / Kirill A. Shutemov
