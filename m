Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF57F28643D
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766412142; cv=none; b=i3AwWxaeK39659w0J8EZZ4A7n0biR7SmsOVPpKH8ppWU0pSZkK3ZuvFumX209SLgUYs72f4pXv/lUM0Hb0SZmIO+zOs1K7mP/KP81xRQIIIGDdqS/afUzUy1kFNLG9AiCnE3pShMRA1QA5GJU34a+5zHMa+iep/Cr4AXhuMLEzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766412142; c=relaxed/simple;
	bh=angDPqsri1l4EgPCTQmTTdKIzaMZfzd8+IQC+H/aT94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdlXLHWehnq5RyD+XQV6YYwJEmwJqzd4ABjlM+M7fSwTH2hHiceyhQm6ZVYMchYCPqwCo9MelheyVJTF+JlKgT+3N/Zk4uHxNZ1Mu3CUlP1wo08qdskCwpOf0hPLDuBWR2N5+9rALeL6gEympzSdLBhJL8/lBEGR+11l8RFWRc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYFrts4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYFrts4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB074C4CEF1;
	Mon, 22 Dec 2025 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766412141;
	bh=angDPqsri1l4EgPCTQmTTdKIzaMZfzd8+IQC+H/aT94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYFrts4xxirZO22X9CKr9WB0kdffJivhT8qfT+xtawnIcCKoEYoBzS/tVdPt8Ux/8
	 Q4KJ12mLmASXzyWEyRXQrW+v5HuI7GwR3BSW9vWTMvW8DAPkINNqJfY/W6xRxwIdfp
	 rtAUAeRm1Sj2TRIrifkjyXu5rwtEW5YyFEqbgZo2Oj2vmIUObgppiI831obbl682kH
	 yT9OeqFvSrr5qGzWy7tfXJKbV+sG+FTJ4C9mVyqy3zgxwy/jkj1/EVoS1ZonggzlB8
	 /27kR+L0saXw9hC+5Nu2n6m06zppqMljKqZdY7lvjn+HhVm0JPDnbt1jLi+x02GWFE
	 ilItFqXkzhHsw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0CCA4F4006A;
	Mon, 22 Dec 2025 09:02:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 22 Dec 2025 09:02:20 -0500
X-ME-Sender: <xms:a09JaZtnaUXQ4I2PSprIbMw-RRZLUBM0JlXpSAuOgDNJ7OSZ-6OE4A>
    <xme:a09Jad19GUwjHcmMHVkgRDv1W0CkRxB7-ufpdm4C2WtK1ZSRwJ702Oc57dwt60so6
    OXvHGf4l0KtAIC5rCthKsGzlWqxEZuqrCkYYg_iwOLqz92kQ-ITukI>
X-ME-Received: <xmr:a09JaWIrXChbBF057lHRcADCLqo0lIxIQB9Y3U1e1cJxhRtsOXX4FRl8fYVZ9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjedufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgestheksfdttddtjeenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepvddufeetkedvheektdefhfefjeeujeejtdejuedufefhveekkeeffeetvedvffek
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
X-ME-Proxy: <xmx:a09JaX_M-2vxdtu08YVROLuORFY8naL_-GK9_bhTIMqt9F0FXNG8EQ>
    <xmx:bE9JaVgXreAMY98sPJEgWQpKNsDW4rIDdB_H155eE9vvuqiGwEKVeA>
    <xmx:bE9JaWwqMaDOPVPTfagL47fTmsRjsJdvBalg7uwmI8oNqRCWmj6ewg>
    <xmx:bE9JaUrivezvxDm3npsh7Dckqioi3u-rU_4uTe3KwrG1jAizcu1pEw>
    <xmx:bE9JaS4wxAFXrkKNV6urY0QeM3TOmEZfW6y5doYXV0BXOX_50xGm-Git>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Dec 2025 09:02:19 -0500 (EST)
Date: Mon, 22 Dec 2025 14:02:18 +0000
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
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
Message-ID: <4ctnfkw5zqneume6px2wqgdgusfdricr4uuonv7bfjheknrt2g@fdb5ceiiar4q>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-3-kas@kernel.org>
 <430d554c-840f-4813-b715-5191d74571a0@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430d554c-840f-4813-b715-5191d74571a0@linux.dev>

On Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
> 
> 
> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
> > The upcoming changes in compound_head() require memmap to be naturally
> > aligned to the maximum folio size.
> > 
> > Add a warning if it is not.
> > 
> > A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> > kernel is still likely to be functional if this strict check fails.
> 
> Different architectures default to 2 MB alignment (mainly to
> enable huge mappings), which only accommodates folios up to
> 128 MB. Yet 1 GB huge pages are still fairly common, so
> validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
> miss the most frequent case.

I don't follow. 16 GB check is more strict that anything smaller.
How can it miss the most frequent case?

> I’m concerned that this might plant a hidden time bomb: it
> could detonate at any moment in later code, silently triggering
> memory corruption or similar failures. Therefore, I don’t
> think a WARNING is a good choice.

We can upgrade it BUG_ON(), but I want to understand your logic here
first.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
