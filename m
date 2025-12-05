Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE51230D35;
	Fri,  5 Dec 2025 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764967478; cv=none; b=JT3TQySZ1KeeosGoM1rBxyo63CEEKHqq3UlK+yW121o10jGfysFwbTgsv3WV2W673arcqAtw6t3OqaRX4wjeN5ul4Cw80tXyyHYiSzkod1cydubgnMDR0XSegBUzCbjmWZkMFdx1Dzy2ilpqvk1OwhKFLn5LAwV5kWCk8+aJbuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764967478; c=relaxed/simple;
	bh=pHz5hkhQL1nyO2Xo1UP+jCYA8k8KmKAPUsw1DEwwuH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJ4ZhRJWEJQGWi63QZ8nRAmD20bxpxOTovTrbEcDHymiY/hvlYEvP54MDw7XjIiZQanrHnKFAf7JPq9lB2lvXRME39/eMl8SnmuvYZxWr+jml77knQDV6h+BmWP+k9BNQuV8nJsaN1SMhCdNt+V6QSlDl+TNCJcD9GutNmYMuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GR9nhZsD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GR9nhZsD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD96C4CEF1;
	Fri,  5 Dec 2025 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764967477;
	bh=pHz5hkhQL1nyO2Xo1UP+jCYA8k8KmKAPUsw1DEwwuH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GR9nhZsDiAIoBkK8RJlqM8j3WIVzPu/DIos2PlJB8FUZa6IwT9sVMHNf+DxXGJRsl
	 TVljgZJpbw3njRaecgfLMH7L4FIS8PLfR7+oQ7gtzwr5ynAMtxVl2qyuNyy3ucr/bA
	 49yp8XMXYF2hP3iBADES7sZ+1t2cVQnAu0wCieoJu4ZGESqNyMW/nP/yypr2PSolxY
	 IMKKsy/NB2B9akd1Di06yKTiWRKK16gU9BSDWGKEq56yNliolY325xpLvfuuNnKghj
	 Nz1XqYsF329+1CdOAzPQN+IVvvDotUvyGd3+03Bv9pU36ouCZy3jFwmAy4NAfbCVoE
	 0VgDjb1aiyL4Q==
Message-ID: <01e5d0b3-dbf8-4f77-b38a-f48c46f7c31e@kernel.org>
Date: Fri, 5 Dec 2025 21:44:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Usama Arif <usamaarif642@gmail.com>, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251205194351.1646318-1-kas@kernel.org>
 <e1c50f7e-cec4-4676-b5d6-f6446cd64ba5@kernel.org>
 <bdie34dgpltxd5ayvjvqkusx4thdrrebgllvwp333psfuu4vgj@bkfxg2c5sfr2>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <bdie34dgpltxd5ayvjvqkusx4thdrrebgllvwp333psfuu4vgj@bkfxg2c5sfr2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/25 21:33, Kiryl Shutsemau wrote:
> On Fri, Dec 05, 2025 at 09:16:08PM +0100, David Hildenbrand (Red Hat) wrote:
>> On 12/5/25 20:43, Kiryl Shutsemau wrote:
>>> This series removes "fake head pages" from the HugeTLB vmemmap
>>> optimization (HVO) by changing how tail pages encode their relationship
>>> to the head page.
>>>
>>> It simplifies compound_head() and page_ref_add_unless(). Both are in the
>>> hot path.
>>>
>>> Background
>>> ==========
>>>
>>> HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
>>> and remapping the freed virtual addresses to a single physical page.
>>> Previously, all tail page vmemmap entries were remapped to the first
>>> vmemmap page (containing the head struct page), creating "fake heads" -
>>> tail pages that appear to have PG_head set when accessed through the
>>> deduplicated vmemmap.
>>>
>>> This required special handling in compound_head() to detect and work
>>> around fake heads, adding complexity and overhead to a very hot path.
>>>
>>> New Approach
>>> ============
>>>
>>> For architectures/configs where sizeof(struct page) is a power of 2 (the
>>> common case), this series changes how position of the head page is encoded
>>> in the tail pages.
>>>
>>> Instead of storing a pointer to the head page, the ->compound_info
>>> (renamed from ->compound_head) now stores a mask.
>>
>> (we're in the merge window)
>>
>> That doesn't seem to be suitable for the memdesc plans, where we want all
>> tail pages do directly point at the allocated memdesc (e.g., struct folio),
>> no?
> 
> Sure. My understanding is that it is going to eliminate a need in
> compound_head() completely. I don't see the conflict so far.

Right. All compound_head pointers will point at the allocated memdesc.

Would we still have to detect fake head pages though (at least for some 
transition period)?

I don't recall whether we'll really convert all memdesc users at once, 
or if some memdescs will co-exist with ordinary compound pages for a while.

-- 
Cheers

David
