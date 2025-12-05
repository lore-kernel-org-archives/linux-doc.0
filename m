Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626226562D;
	Fri,  5 Dec 2025 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764970497; cv=none; b=emTuMv4vEMwIBpm4PanoNh3UYRfVjEgOdcxwq+eUhj2Cj9uWHCsGwVwEw+hKeRkLRr83B6ujO2Vm2p6Vbz8W5JdOzeYn+boRVoeiP+i9rqlQ76NHjyILMMz3h0WrmIkG/zpOMV2vFn3hWbS9LgUS0we5nmDlZXB1qSKceyiXsBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764970497; c=relaxed/simple;
	bh=pIWFu1CpvEX7ARO6h8yJ5dcbxsEBwILGEiRBs91Q2JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgKeudbDzKlcifhQ0yi1FLgM5KFv8OyquK1EIzq3lp+f/lLiWsVkqTlKqs631Q5f3bmdrL7PnckQsTrtjWKyagL9yXArV0KelF7sB/uXZY6x+XvBAQ7x9SUsg8Yf7y0HLONLE4o255XRTykj8YjpmMiPju8MILo+ojFgxXhRy38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gh8ajqRA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gh8ajqRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8AEC4CEF1;
	Fri,  5 Dec 2025 21:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764970497;
	bh=pIWFu1CpvEX7ARO6h8yJ5dcbxsEBwILGEiRBs91Q2JU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gh8ajqRAdx3KnvpVzycs8kZ9NxVSF8yjDJuVXe53wnCjS5LnpIVL4+aNqaWp288YU
	 3w0PoKfc1wCSHDVk2USqz1GQ63BPL+4hGYC0lMXJCmyUe3nYS/QCa+mC/Aaj9+n+4U
	 HTuA6pi7Bown/zCHdd/J3ZDu9FdIms8EeWa+ADYhQGMS4ttS/+EVpklKpMBf54v6rD
	 pcOvrW2sLm2HOhYl5uLML5TvP5QNZR4jouoaz8cKPQByQ+JSHmscjNsZ2+iMNoMcRK
	 tG0vltG31lDKB8ZRsNGy24xJbpSlfjc0ejInjaE2Pbxff++sAEke6sszaQsK5Fzx+5
	 Fb/VLbA5rUxNw==
Message-ID: <1b659d59-b1c1-4910-baab-0eef7cda234f@kernel.org>
Date: Fri, 5 Dec 2025 22:34:48 +0100
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
 <01e5d0b3-dbf8-4f77-b38a-f48c46f7c31e@kernel.org>
 <ysvhofzg5mdtvxfujdsmffkuqna72pr52ehrpglmlhxnvwstas@xurgptkgtnbe>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <ysvhofzg5mdtvxfujdsmffkuqna72pr52ehrpglmlhxnvwstas@xurgptkgtnbe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/25 21:54, Kiryl Shutsemau wrote:
> On Fri, Dec 05, 2025 at 09:44:30PM +0100, David Hildenbrand (Red Hat) wrote:
>> On 12/5/25 21:33, Kiryl Shutsemau wrote:
>>> On Fri, Dec 05, 2025 at 09:16:08PM +0100, David Hildenbrand (Red Hat) wrote:
>>>> On 12/5/25 20:43, Kiryl Shutsemau wrote:
>>>>> This series removes "fake head pages" from the HugeTLB vmemmap
>>>>> optimization (HVO) by changing how tail pages encode their relationship
>>>>> to the head page.
>>>>>
>>>>> It simplifies compound_head() and page_ref_add_unless(). Both are in the
>>>>> hot path.
>>>>>
>>>>> Background
>>>>> ==========
>>>>>
>>>>> HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
>>>>> and remapping the freed virtual addresses to a single physical page.
>>>>> Previously, all tail page vmemmap entries were remapped to the first
>>>>> vmemmap page (containing the head struct page), creating "fake heads" -
>>>>> tail pages that appear to have PG_head set when accessed through the
>>>>> deduplicated vmemmap.
>>>>>
>>>>> This required special handling in compound_head() to detect and work
>>>>> around fake heads, adding complexity and overhead to a very hot path.
>>>>>
>>>>> New Approach
>>>>> ============
>>>>>
>>>>> For architectures/configs where sizeof(struct page) is a power of 2 (the
>>>>> common case), this series changes how position of the head page is encoded
>>>>> in the tail pages.
>>>>>
>>>>> Instead of storing a pointer to the head page, the ->compound_info
>>>>> (renamed from ->compound_head) now stores a mask.
>>>>
>>>> (we're in the merge window)
>>>>
>>>> That doesn't seem to be suitable for the memdesc plans, where we want all
>>>> tail pages do directly point at the allocated memdesc (e.g., struct folio),
>>>> no?
>>>
>>> Sure. My understanding is that it is going to eliminate a need in
>>> compound_head() completely. I don't see the conflict so far.
>>
>> Right. All compound_head pointers will point at the allocated memdesc.
>>
>> Would we still have to detect fake head pages though (at least for some
>> transition period)?
> 
> If we need to detect if the memdesc is tail it should be as trivial as
> comparing the given memdesc to the memdesc - 1. If they match, you are
> looking at the tail.

How could you assume memdesc - 1 exists without performing other checks?

> 
> But I don't think we wound need it.

I would guess so.

> 
> The memdesc itself doesn't hold anything you want to touch if don't hold
> reference to the folio. You wound need dereference memdesc and after it
> you don't care if the memdesc it tail.

Hopefully.

So the real question is how this would affect the transition period 
(some memdescs allocated, others not allocated separately) that Willy 
might soon want to start. And the dual mode where, whether "struct 
folio" is allocated separately will be a config option.

Let's wait for Willy's reply.

-- 
Cheers

David
