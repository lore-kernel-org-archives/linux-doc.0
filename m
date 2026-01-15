Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619431AA81;
	Thu, 15 Jan 2026 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506369; cv=none; b=XXD5dHZUKo+iAdmfbFdirokT5V3ai5GEC9EjkQqmjAlGw5TjkaBvE20a0y+Ueq+l25zi26eb8Fp4bdaFonSLGuBc3CpAxF8HG0AvDOUjLdOSrMLMPTjWmPzSd1yZ9zpWP76onRIgjGtzjg6EwZ6U1kNMj3z0rc3p3LrsTWEskT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506369; c=relaxed/simple;
	bh=LhWnu62cfOyQJ3ARTOTa8rucVSi8LwKMxYb1uIgntTM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VSpLtm30XSwVzDWhV4ZwbTjnqvtNYNj4v5BJdiWPbMIyc6JLO80TMhvDkgbV0KSN1tgmMQSIHdyqkoD4v6WNkpPMTXQmBTIgxB0lCEsOq5E/GINQe9KDX7Ak6NuGxDgpzYVuowYRo4/+KBitqEmiPPT1DNjd9JeHepizfhkocyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8Sx4xn0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8Sx4xn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DBCC116D0;
	Thu, 15 Jan 2026 19:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768506368;
	bh=LhWnu62cfOyQJ3ARTOTa8rucVSi8LwKMxYb1uIgntTM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=I8Sx4xn04viygNYbwBcqLbW3A+1NMl+9DVjolPZJ2TZrKLtVJMZB2mROLGbCVtz3n
	 jO58/gWeE+Fj9PDh8ZyUEufnleXbWquSRBtzvmyVXRpJdq/W7BIRabdQUNim8DKnGA
	 IptFgMDamSuoe5T/PiOf+bbv1JpPq/0sw98DH+FMVDmdv8rvAAvy0kdZeJGF7og0ZR
	 kRDU475A4ebqHYKGs/Ky6vkrrctgU5E41qzwdR4Iw1SysVAUn5C9jfJjGJHlBs7AK7
	 Gu1Gur5vrV1/5dLyCWpBRdRA231pF74rZMfED1Vw//70ccyJf6wZzPTGVkcmeMGL0t
	 bwP473aKna1uA==
Message-ID: <15a0dd88-3ec5-4538-ae6c-d2ad39f284e1@kernel.org>
Date: Thu, 15 Jan 2026 20:46:02 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 10/15] mm/hugetlb: Remove fake head pages
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260115144604.822702-1-kas@kernel.org>
 <20260115144604.822702-11-kas@kernel.org>
 <30ae1623-63f9-4729-9c19-9b0a9a0ae9f1@kernel.org>
 <aWkhbWR-3fWjeTaE@thinkstation>
 <b10e3b2a-b298-4d27-b8ce-63327864c220@kernel.org>
 <aWk1tZyFZOOkF0AH@thinkstation>
 <f87a904e-ac1b-4eb7-897c-79b49615511e@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
In-Reply-To: <f87a904e-ac1b-4eb7-897c-79b49615511e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/26 20:33, David Hildenbrand (Red Hat) wrote:
> On 1/15/26 19:58, Kiryl Shutsemau wrote:
>> On Thu, Jan 15, 2026 at 06:41:44PM +0100, David Hildenbrand (Red Hat) wrote:
>>> On 1/15/26 18:23, Kiryl Shutsemau wrote:
>>>> On Thu, Jan 15, 2026 at 05:49:43PM +0100, David Hildenbrand (Red Hat) wrote:
>>>>> On 1/15/26 15:45, Kiryl Shutsemau wrote:
>>>>>> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
>>>>>> vmemmap pages for huge pages and remapping the freed range to a single
>>>>>> page containing the struct page metadata.
>>>>>>
>>>>>> With the new mask-based compound_info encoding (for power-of-2 struct
>>>>>> page sizes), all tail pages of the same order are now identical
>>>>>> regardless of which compound page they belong to. This means the tail
>>>>>> pages can be truly shared without fake heads.
>>>>>>
>>>>>> Allocate a single page of initialized tail struct pages per NUMA node
>>>>>> per order in the vmemmap_tails[] array in pglist_data. All huge pages
>>>>>> of that order on the node share this tail page, mapped read-only into
>>>>>> their vmemmap. The head page remains unique per huge page.
>>>>>>
>>>>>> This eliminates fake heads while maintaining the same memory savings,
>>>>>> and simplifies compound_head() by removing fake head detection.
>>>>>>
>>>>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>>>>>> ---
>>>>>>      include/linux/mmzone.h | 16 ++++++++++++++-
>>>>>>      mm/hugetlb_vmemmap.c   | 44 ++++++++++++++++++++++++++++++++++++++++--
>>>>>>      mm/sparse-vmemmap.c    | 44 ++++++++++++++++++++++++++++++++++--------
>>>>>>      3 files changed, 93 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>>>>>> index 322ed4c42cfc..2ee3eb610291 100644
>>>>>> --- a/include/linux/mmzone.h
>>>>>> +++ b/include/linux/mmzone.h
>>>>>> @@ -82,7 +82,11 @@
>>>>>>       * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
>>>>>>       * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
>>>>>>       */
>>>>>> -#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
>>>>>> +#ifdef CONFIG_64BIT
>>>>>> +#define MAX_FOLIO_ORDER		(34 - PAGE_SHIFT)
>>>>>> +#else
>>>>>> +#define MAX_FOLIO_ORDER		(30 - PAGE_SHIFT)
>>>>>> +#endif
>>>>>
>>>>> Where do these magic values stem from, and how do they related to the
>>>>> comment above that clearly spells out 16G vs. 1G ?
>>>>
>>>> This doesn't change the resulting value: 1UL << 34 is 16GiB, 1UL << 30
>>>> is 1G. Subtract PAGE_SHIFT to get the order.
>>>>
>>>> The change allows the value to be used to define NR_VMEMMAP_TAILS which
>>>> is used specify size of vmemmap_tails array.
>>>
>>> get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G) should evaluate to a
>>> constant by the compiler.
>>>
>>> See __builtin_constant_p handling in get_order().
>>>
>>> If that is not working then we have to figure out why.
>>
>> asm-offsets.s compilation fails:
>>
>> ../include/linux/mmzone.h:1574:16: error: fields must have a constant size:
>>         'variable length array in structure' extension will never be supported
>>    1574 |         unsigned long vmemmap_tails[NR_VMEMMAP_TAILS];
>>
>> Here's how preprocessor dump of vmemmap_tails looks like:
>>
>>    unsigned long vmemmap_tails[(get_order(1 ? (0x400000000ULL) : 0x40000000) - (( __builtin_constant_p(2 * ((1UL) << 12) / sizeof(struct page)) ? ((2 * ((1UL) << 12) / sizeof(struct page)) < 2 ? 0 : 63 - __builtin_clzll(2 * ((1UL) << 12) / sizeof(struct page))) : (sizeof(2 * ((1UL) << 12) / sizeof(struct page)) <= 4) ? __ilog2_u32(2 * ((1UL) << 12) / sizeof(struct page)) : __ilog2_u64(2 * ((1UL) << 12) / sizeof(struct page)) )) + 1)];
>>
>> And here's get_order():
>>
>> static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((no_instrument_function)) __attribute__((__always_inline__)) __attribute__((__const__)) int get_order(unsigned long size)
>> {
>>    if (__builtin_constant_p(size)) {
>>     if (!size)
>>      return 64 - 12;
>>
>>     if (size < (1UL << 12))
>>      return 0;
>>
>>     return ( __builtin_constant_p((size) - 1) ? (((size) - 1) < 2 ? 0 : 63 - __builtin_clzll((size) - 1)) : (sizeof((size) - 1) <= 4) ? __ilog2_u32((size) - 1) : __ilog2_u64((size) - 1) ) - 12 + 1;
>>    }
>>
>>    size--;
>>    size >>= 12;
>>
>>
>>
>>    return fls64(size);
>>
>> }
>>
>> I am not sure why it is not compile-time constant. I have not dig
>> deeper.
> 
> Very weird. Almost sounds like a bug given that get_order() ends up using ilog2.
> 
> But it gets even weirder:
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6f959d8ca4b42..a54445682ccc4 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2281,6 +2281,9 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>     * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
>     */
>    #define MAX_FOLIO_ORDER                get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
> +
> +static_assert(__builtin_constant_p(MAX_FOLIO_ORDER));
> +
>    #else
>    /*
>     * Without hugetlb, gigantic folios that are bigger than a single PUD are
> 
> gives me
> 
> 
> ./include/linux/build_bug.h:78:41: error: static assertion failed: "__builtin_constant_p(MAX_FOLIO_ORDER)"
>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>         |                                         ^~~~~~~~~~~~~~
> ./include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>         |                                  ^~~~~~~~~~~~~~~
> ./include/linux/mm.h:2285:1: note: in expansion of macro 'static_assert'
>    2285 | static_assert(__builtin_constant_p(MAX_FOLIO_ORDER));
>         | ^~~~~~~~~~~~~
> 
> And reversing the condition fixes it.
> 
> ... so it is a constant? Huh?

I've been staring at the computer for too long, this is not BUILD_BUG 
semantics. So we don't get a constant.

For some reason :)

Even when I just use get_order(4096).

-- 
Cheers

David
