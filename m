Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FCA21D3D6;
	Mon,  8 Dec 2025 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187614; cv=none; b=iX2Y+hUb6zuGNXm6NpSGCm36VVpSAOGOniBPGN67mQOsDi2izeeHPSUoNN7SNjZFAubJ+iHpN94tEdJBkQmcn79x2AnuyGJAYZVaxgOMzo6+X2VndhrCBHrWhGBV4brwJACwyLzSyhjzJ0Rb+fbuBTA3wofkBlPGN/BPnTKLho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187614; c=relaxed/simple;
	bh=hT7K5W2YCnKax0fvHnXRBMbXRa4tpjlXidtYs1BbGf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOjEoliWPjCOvBO8NuPWdIbFJXc4GohF3UbmhnKLWjQi9y0kOzBo4jAh6pooM8/r9Y4PFQ1hqhn0OGv0oWoEC9J83IBmVLPeODuUrfYKW7b972F0+ujnnLMYNaunuVgnOXvLY6Tq8t0CIGmJUEXWYUbO5+gbbvci1mvbeL78HDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtJQjBeT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtJQjBeT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF59FC4CEF1;
	Mon,  8 Dec 2025 09:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765187613;
	bh=hT7K5W2YCnKax0fvHnXRBMbXRa4tpjlXidtYs1BbGf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VtJQjBeTrVApKnn0YxiAsOgWw39ue2X/xghej7XHe66SWnRsdBM+Z92legsDLIfua
	 cKBibEDxdc6uJvCRbQZPlcg5gZMVkEsjo6hHlOE+AGgUygQ+Dd7FoG2oxTpPwcmmD/
	 /L/Q71wP3gU4xjF6fQu7hJ+yB+Wyg1qZo+ZNr0KpDBmDe89RwIsaOaXx2zEPwj1k6/
	 Fjn4V4M/772+MWopwZxXz4i9diE2KPkm3TVPxsoLVKsOWakSYVxoWx3eOr+VNWKZJB
	 NGpgx4i/Z9ng6qjG9XZjn2Drmbfe39UOlD+ViaeYY+R+YcbP65GSG2ip2Fwet+iVTS
	 lQL6H2F4V+jtA==
Message-ID: <66b6e4fa-9541-4cc8-8578-dbffd5f19ecc@kernel.org>
Date: Mon, 8 Dec 2025 10:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
To: Usama Arif <usamaarif642@gmail.com>, Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251205194351.1646318-1-kas@kernel.org>
 <e1c50f7e-cec4-4676-b5d6-f6446cd64ba5@kernel.org>
 <bdie34dgpltxd5ayvjvqkusx4thdrrebgllvwp333psfuu4vgj@bkfxg2c5sfr2>
 <01e5d0b3-dbf8-4f77-b38a-f48c46f7c31e@kernel.org>
 <ysvhofzg5mdtvxfujdsmffkuqna72pr52ehrpglmlhxnvwstas@xurgptkgtnbe>
 <1b659d59-b1c1-4910-baab-0eef7cda234f@kernel.org>
 <3v5hdubqnil6w54kimvbgapghj7irjp7xuqma6uxtsrpvj22ph@6t47vsevdwyi>
 <8e59b242-6311-48a7-b9f5-e698c4eccd2e@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <8e59b242-6311-48a7-b9f5-e698c4eccd2e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/25 18:47, Usama Arif wrote:
> 
> 
> On 05/12/2025 21:41, Kiryl Shutsemau wrote:
>> On Fri, Dec 05, 2025 at 10:34:48PM +0100, David Hildenbrand (Red Hat) wrote:
>>> On 12/5/25 21:54, Kiryl Shutsemau wrote:
>>>> On Fri, Dec 05, 2025 at 09:44:30PM +0100, David Hildenbrand (Red Hat) wrote:
>>>>> On 12/5/25 21:33, Kiryl Shutsemau wrote:
>>>>>> On Fri, Dec 05, 2025 at 09:16:08PM +0100, David Hildenbrand (Red Hat) wrote:
>>>>>>> On 12/5/25 20:43, Kiryl Shutsemau wrote:
>>>>>>>> This series removes "fake head pages" from the HugeTLB vmemmap
>>>>>>>> optimization (HVO) by changing how tail pages encode their relationship
>>>>>>>> to the head page.
>>>>>>>>
>>>>>>>> It simplifies compound_head() and page_ref_add_unless(). Both are in the
>>>>>>>> hot path.
>>>>>>>>
>>>>>>>> Background
>>>>>>>> ==========
>>>>>>>>
>>>>>>>> HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
>>>>>>>> and remapping the freed virtual addresses to a single physical page.
>>>>>>>> Previously, all tail page vmemmap entries were remapped to the first
>>>>>>>> vmemmap page (containing the head struct page), creating "fake heads" -
>>>>>>>> tail pages that appear to have PG_head set when accessed through the
>>>>>>>> deduplicated vmemmap.
>>>>>>>>
>>>>>>>> This required special handling in compound_head() to detect and work
>>>>>>>> around fake heads, adding complexity and overhead to a very hot path.
>>>>>>>>
>>>>>>>> New Approach
>>>>>>>> ============
>>>>>>>>
>>>>>>>> For architectures/configs where sizeof(struct page) is a power of 2 (the
>>>>>>>> common case), this series changes how position of the head page is encoded
>>>>>>>> in the tail pages.
>>>>>>>>
>>>>>>>> Instead of storing a pointer to the head page, the ->compound_info
>>>>>>>> (renamed from ->compound_head) now stores a mask.
>>>>>>>
>>>>>>> (we're in the merge window)
>>>>>>>
>>>>>>> That doesn't seem to be suitable for the memdesc plans, where we want all
>>>>>>> tail pages do directly point at the allocated memdesc (e.g., struct folio),
>>>>>>> no?
>>>>>>
>>>>>> Sure. My understanding is that it is going to eliminate a need in
>>>>>> compound_head() completely. I don't see the conflict so far.
>>>>>
>>>>> Right. All compound_head pointers will point at the allocated memdesc.
>>>>>
>>>>> Would we still have to detect fake head pages though (at least for some
>>>>> transition period)?
>>>>
>>>> If we need to detect if the memdesc is tail it should be as trivial as
>>>> comparing the given memdesc to the memdesc - 1. If they match, you are
>>>> looking at the tail.
>>>
>>> How could you assume memdesc - 1 exists without performing other checks?
>>
>> Map zero page in front of every discontinuous vmemmap region :P
>>
> 
> I made an initial pass at reviewing the series. I think the best thing about this is that
> someone looking at compound_head won't need to understand HVO to know how compound_head works,
> so its a very nice clean up :)

Yeah, I am also not a particular fan of fake-head detection code, and 
how this hugetlb monstrosity affects our implementation of compound 
pages. :)

Moving from compound_head -> compound_info sounds like a suboptimal 
temporary step, though, as we want compound_head to to point at "struct 
folio" etc soon (either allocated separately or an overlay of "struct 
page", based on a config option). So operating on vmemmap addresses is 
not what the new world will look like.

Of course, we could lookup the head page first and then use the memdesc 
pointer in there to get our "struct folio", but it will be one 
unnecessary roundtrip through the head page.

I'm sure Willy has an opinion on this. but likely has other priorities 
given we are in the merge window and LPC is coming up.

-- 
Cheers

David
