Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3FB329C41;
	Tue, 23 Dec 2025 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482715; cv=none; b=GUxDO/snXSXbXOlkFIuT3cFS0sDAApPI1C7Ryip5NIjLMRlct/lWXXP042y5QhgiwFob+km8BPYXocTsarS9UBVRln14j7xTSF3Iy5sBHq3BhWbeogjyha+goJtm6edr1sxtqBXFGG+InHdRzmFuHpNCEL5VEgfVOfbezMf68BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482715; c=relaxed/simple;
	bh=0tCAuhor98NX6pArSQFPs+Lf5cNk0Pw64krLvrl0x2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+/EHlFflj27gKUIpInZGjuPFcWSf/orAEGSbC7zcbf1Psvwai8hNu3IVz7UvXMct6NgBZrX6IJbaR2OLxU+ZNpsRktG/oFiLtq6VcevqQ0sJtZ1AAUdEwS4YkkwRYZuzvrlAFOTVWEFRiPN8+PyTq+rra0GeVEMFnv+d7+3LA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxwSgqka; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxwSgqka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A041C113D0;
	Tue, 23 Dec 2025 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766482714;
	bh=0tCAuhor98NX6pArSQFPs+Lf5cNk0Pw64krLvrl0x2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cxwSgqkadyvZ8pQ4lEyrcLOru5YsUsEv2NvVC5ROuRdVE1PKGXlPNJx+/lAnh5k7r
	 4wIHDfUSqqcksPZptgbYmm0zDUjzZoXQEJVuvpvbMQgstpy0beGMa85LorT1ysXM/9
	 FuddKfdevXD43gk64985bL/4YcO7YToGi0/cGvgyAot3fpvioQ5OPHQGKDYxGVIdFP
	 G6Xcauo/JVei9z0K4O9Ti2oyUj8MM5kPapvbCo8zhWbYCRDcFysiVA60w4N7oDG+Hf
	 dJ2Cg+suxyOWg20fIaKf9s7VuqHEK2YYcJjGhiECepzWUToyvVRDEp6XX5oWHHfLQA
	 HCs8sJVVj0WmA==
Message-ID: <4f82b8ef-77de-422b-a9a5-691c4eca24a3@kernel.org>
Date: Tue, 23 Dec 2025 10:38:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
To: Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>
References: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
 <CDAEC896-E3EB-4EAB-9F0F-70BC448B3B9A@linux.dev>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <CDAEC896-E3EB-4EAB-9F0F-70BC448B3B9A@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/22/25 15:55, Muchun Song wrote:
> 
> 
>> On Dec 22, 2025, at 22:18, David Hildenbrand (Red Hat) <david@kernel.org> wrote:
>>
>> ﻿On 12/22/25 15:02, Kiryl Shutsemau wrote:
>>>> On Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
>>>>
>>>>
>>>> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
>>>>> The upcoming changes in compound_head() require memmap to be naturally
>>>>> aligned to the maximum folio size.
>>>>>
>>>>> Add a warning if it is not.
>>>>>
>>>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
>>>>> kernel is still likely to be functional if this strict check fails.
>>>>
>>>> Different architectures default to 2 MB alignment (mainly to
>>>> enable huge mappings), which only accommodates folios up to
>>>> 128 MB. Yet 1 GB huge pages are still fairly common, so
>>>> validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
>>>> miss the most frequent case.
>>> I don't follow. 16 GB check is more strict that anything smaller.
>>> How can it miss the most frequent case?
>>>> I’m concerned that this might plant a hidden time bomb: it
>>>> could detonate at any moment in later code, silently triggering
>>>> memory corruption or similar failures. Therefore, I don’t
>>>> think a WARNING is a good choice.
>>> We can upgrade it BUG_ON(), but I want to understand your logic here
>>> first.
>>
>> Definitely no BUG_ON(). I would assume this is something we would find early during testing, so even a VM_WARN_ON_ONCE() should be good enough?
>>
>> This smells like a possible problem, though, as soon as some architecture wants to increase the folio size. What would be the expected step to ensure the alignment is done properly?
>>
>> But OTOH, as I raised Willy's work will make all of that here obsolete either way, so maybe not worth worrying about that case too much,
> 
> Hi David,
> 

Hi! :)

> I hope you're doing well. I must admit I have limited knowledge of Willy's work, and I was wondering if you might be kind enough to share any publicly available links where I could learn more about the future direction of this project. I would be truly grateful for your guidance.
> Thank you very much in advance.

There is some information to be had at [1], but more at [2]. Take a look 
at [2] in "After those projects are complete - Then we can shrink struct 
page to 32 bytes:"

In essence, all pages (belonging to a memdesc) will have a "memdesc" 
pointer (that replaces the compound_head pointer).

"Then we make page->compound_head point to the dynamically allocated 
memdesc rather than the first page. Then we can transition to the above 
layout. "

The "memdesc" could be a pointer to a "struct folio" that is allocated 
from the slab.

So in the new memdesc world, all pages part of a folio will point at the 
allocated "struct folio", not the head page where "struct folio" 
currently overlays "struct page".

That would mean that the proposal in this patch set will have to be 
reverted again.


At LPC, Willy said that he wants to have something out there in the 
first half of 2026.

[1] https://kernelnewbies.org/MatthewWilcox/Memdescs
[2] https://kernelnewbies.org/MatthewWilcox/Memdescs/Path

-- 
Cheers

David
