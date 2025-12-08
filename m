Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2814A2DF3C6;
	Mon,  8 Dec 2025 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765183894; cv=none; b=SmqlI55o9My1B6L+iFO7USPCn7eR3RAqyQQtEKqf/0DKEkOd+tW484AfzggpyIUppOHo31wRj7a5eOqibNtAdWtWCNUyExmo223JLQ/Sxh1bkC9dLuEr89mFfmdRlXuEU/ouOLM8J2ZFYiwwuNrIt7uV/HUHfZUfUP4vqAepaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765183894; c=relaxed/simple;
	bh=VJIYaAqKOVNUR+Rg7ZHgeKhTWwi4euQtMnCdZt/0PUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmUZPMKN9p3Or53feBa5pHlQhDYoBoYJqs4LU8e1xAXIqORB5y1BNfOiMWdP2e36UK7/GvlEc2TOct9bsDNnDKdcMcEa7I3fU4FUGpmc7RBpaDc6g+/CQOCuAqM+x45SPn2mypmM3+3iJVmjGryMlPLR1pQhkPswpG8f0pGXvn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr1DCUmR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr1DCUmR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAE7C4CEF1;
	Mon,  8 Dec 2025 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765183893;
	bh=VJIYaAqKOVNUR+Rg7ZHgeKhTWwi4euQtMnCdZt/0PUE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cr1DCUmRwq97YX8qI+fsQH6Nnatf0InWW3TZngZE6rYJvidws+6jIYYjKa5bz/lIJ
	 QoYjEKv1VH6g4Y74txefNK4WVb0kVzHyWc3ObUTBYEFcekosO9ijr9B/vFVzf1JPFw
	 cbOXfnN/6d7fN9dAWqV/90UufL1GrZtdlpgf+l4ZfpxeOa6kwTSwB/QrXK2Tt/Xyl8
	 VZ84ikJqfLUn9QVOdD/CCBfn0FitqNDB23iYppF+ERZHx64E0QZwuHCcYM+XC3tsUV
	 mn4rQrhzzs2jVESkwOwNLCVnuMQ+QXrki/YpHTOZzQtqMbEMAeNElw0NShmrE8+tiA
	 ohTB7nlmHwk7w==
Message-ID: <3563e215-1301-4c2e-8a4b-b690dfa643d1@kernel.org>
Date: Mon, 8 Dec 2025 09:51:26 +0100
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
 <1b659d59-b1c1-4910-baab-0eef7cda234f@kernel.org>
 <3v5hdubqnil6w54kimvbgapghj7irjp7xuqma6uxtsrpvj22ph@6t47vsevdwyi>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <3v5hdubqnil6w54kimvbgapghj7irjp7xuqma6uxtsrpvj22ph@6t47vsevdwyi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/25 22:41, Kiryl Shutsemau wrote:
> On Fri, Dec 05, 2025 at 10:34:48PM +0100, David Hildenbrand (Red Hat) wrote:
>> On 12/5/25 21:54, Kiryl Shutsemau wrote:
>>> On Fri, Dec 05, 2025 at 09:44:30PM +0100, David Hildenbrand (Red Hat) wrote:
>>>> On 12/5/25 21:33, Kiryl Shutsemau wrote:
>>>>> On Fri, Dec 05, 2025 at 09:16:08PM +0100, David Hildenbrand (Red Hat) wrote:
>>>>>> On 12/5/25 20:43, Kiryl Shutsemau wrote:
>>>>>>> This series removes "fake head pages" from the HugeTLB vmemmap
>>>>>>> optimization (HVO) by changing how tail pages encode their relationship
>>>>>>> to the head page.
>>>>>>>
>>>>>>> It simplifies compound_head() and page_ref_add_unless(). Both are in the
>>>>>>> hot path.
>>>>>>>
>>>>>>> Background
>>>>>>> ==========
>>>>>>>
>>>>>>> HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
>>>>>>> and remapping the freed virtual addresses to a single physical page.
>>>>>>> Previously, all tail page vmemmap entries were remapped to the first
>>>>>>> vmemmap page (containing the head struct page), creating "fake heads" -
>>>>>>> tail pages that appear to have PG_head set when accessed through the
>>>>>>> deduplicated vmemmap.
>>>>>>>
>>>>>>> This required special handling in compound_head() to detect and work
>>>>>>> around fake heads, adding complexity and overhead to a very hot path.
>>>>>>>
>>>>>>> New Approach
>>>>>>> ============
>>>>>>>
>>>>>>> For architectures/configs where sizeof(struct page) is a power of 2 (the
>>>>>>> common case), this series changes how position of the head page is encoded
>>>>>>> in the tail pages.
>>>>>>>
>>>>>>> Instead of storing a pointer to the head page, the ->compound_info
>>>>>>> (renamed from ->compound_head) now stores a mask.
>>>>>>
>>>>>> (we're in the merge window)
>>>>>>
>>>>>> That doesn't seem to be suitable for the memdesc plans, where we want all
>>>>>> tail pages do directly point at the allocated memdesc (e.g., struct folio),
>>>>>> no?
>>>>>
>>>>> Sure. My understanding is that it is going to eliminate a need in
>>>>> compound_head() completely. I don't see the conflict so far.
>>>>
>>>> Right. All compound_head pointers will point at the allocated memdesc.
>>>>
>>>> Would we still have to detect fake head pages though (at least for some
>>>> transition period)?
>>>
>>> If we need to detect if the memdesc is tail it should be as trivial as
>>> comparing the given memdesc to the memdesc - 1. If they match, you are
>>> looking at the tail.
>>
>> How could you assume memdesc - 1 exists without performing other checks?
> 
> Map zero page in front of every discontinuous vmemmap region :P

Good luck convincing memory hotplug maintainers about this added 
complexity when making vmemmap ranges (un)available ;)

-- 
Cheers

David
