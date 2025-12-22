Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092792BE048;
	Mon, 22 Dec 2025 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766413116; cv=none; b=jPCbP0YdKZSj7BxOQtyqEvNGr/JEApVLHy4rRnCDRGG6VxNqzXw9RUxbqJA2T4F/qbZdHJgzTLvyH/IHDW6dSxPsBKKivwV68NfObl7dOh7Y//m2QQnDcjU8OYFOsOwtJq5vfKFf1yMA1D3m7rIAcAtf4ctOsSfyv9r8zATubJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766413116; c=relaxed/simple;
	bh=5oLoO9OoLlqXGFG0p2UfKM+IYdkIP8vX17iyc6xkjvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZZsHwVquqF/y+qw6NSXwW1EtuX7DWZjIiwwNhRrQj81Rl8TA9FTZg2IOCdAB5YKrVOkSY6mULxEkPyuGIF066wZtfviv6g/0DQ8lUS3mElyWZi9ZElM5M1r8YYIBLJkPtglvMX4S+Mr2kY+p3H6c1F3yaIHpyT5ZicJBSY1DNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWgvlFeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWgvlFeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C533C4CEF1;
	Mon, 22 Dec 2025 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766413115;
	bh=5oLoO9OoLlqXGFG0p2UfKM+IYdkIP8vX17iyc6xkjvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UWgvlFeEPgbZsomKQU1NvUIqK9fYWIkSSFCZHKAujA8KMLt8SSs6oMNOc2uIQPKib
	 uEH7FKwnZcYGq+Z5VDNECI06wwfFScwuZ592Ebe8nEoIQj6ruwaOfLiLGKHqYIB0oH
	 d1uIgkKv4jK7+8++MofJdtFvbV/xlunr1UjAD3MYlrLntzIOA8Tz8LX51EvL0ev4HL
	 XhajvbQRN3wQZIB1kbvnDqPFHHuBbnVT+ke69lMC5yQ5fCErx4M7nL5q2JBvDQWLsx
	 KStuO1h5ulmIRoiwJBTkn+5YcEgRwrz5jfBBK2bo8sxTsDo3ZTZO8sBmue58hiCzeT
	 OBPdUMlA59PQA==
Message-ID: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
Date: Mon, 22 Dec 2025 15:18:29 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
To: Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Matthew Wilcox <willy@infradead.org>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-3-kas@kernel.org>
 <430d554c-840f-4813-b715-5191d74571a0@linux.dev>
 <4ctnfkw5zqneume6px2wqgdgusfdricr4uuonv7bfjheknrt2g@fdb5ceiiar4q>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <4ctnfkw5zqneume6px2wqgdgusfdricr4uuonv7bfjheknrt2g@fdb5ceiiar4q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/22/25 15:02, Kiryl Shutsemau wrote:
> On Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
>>
>>
>> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
>>> The upcoming changes in compound_head() require memmap to be naturally
>>> aligned to the maximum folio size.
>>>
>>> Add a warning if it is not.
>>>
>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
>>> kernel is still likely to be functional if this strict check fails.
>>
>> Different architectures default to 2 MB alignment (mainly to
>> enable huge mappings), which only accommodates folios up to
>> 128 MB. Yet 1 GB huge pages are still fairly common, so
>> validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
>> miss the most frequent case.
> 
> I don't follow. 16 GB check is more strict that anything smaller.
> How can it miss the most frequent case?
> 
>> I’m concerned that this might plant a hidden time bomb: it
>> could detonate at any moment in later code, silently triggering
>> memory corruption or similar failures. Therefore, I don’t
>> think a WARNING is a good choice.
> 
> We can upgrade it BUG_ON(), but I want to understand your logic here
> first.

Definitely no BUG_ON(). I would assume this is something we would find 
early during testing, so even a VM_WARN_ON_ONCE() should be good enough?

This smells like a possible problem, though, as soon as some 
architecture wants to increase the folio size. What would be the 
expected step to ensure the alignment is done properly?

But OTOH, as I raised Willy's work will make all of that here obsolete 
either way, so maybe not worth worrying about that case too much,

-- 
Cheers

David
