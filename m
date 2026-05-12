Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760312D94A0;
	Tue, 12 May 2026 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566466; cv=none; b=V4tOXcPVnGdtAUi4Nag7jcscM1Q1dk7LSENAB4pxdnxl0BUkPiNp/4bqAfnyVQN67S0nSyCBIG3HHAik8082Z1VGAE+yg1+i1Id83/3hATyGjwQD6xWwNkDEz1HgCLq1LL1SpIYwpQbAUFOOa7o4XMwfCAbRBR6aesLtDX3ieB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566466; c=relaxed/simple;
	bh=0EZtptM8iTZEc9KkhIGOPS4y0SLEEYo00bdW3QFajZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFUvKWeZZorIeEXU4t78WcAE0s3UDMC8pjkEd9N2GFqMqOgn/KkmFv1HQRCK+BlIqL8/QmQz0EzW30zrZxayUU5ukLFClCNTSxaZjtRLXSn0yD6GpLf6KYJeeLhkaZczQ+rglxLw0h/Q1HQNtT2HzOmexO8RhexHSIuf5nd6gWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDehqxco; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDehqxco"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E579C2BCB8;
	Tue, 12 May 2026 06:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778566464;
	bh=0EZtptM8iTZEc9KkhIGOPS4y0SLEEYo00bdW3QFajZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HDehqxcoOny8+q9R/EQrECENhPrcPyoKzzgP48p0XVXIeAHZK7kpMVnvB44IoPzBo
	 t6peJordL6ZByfnTUShrHNma+rjCqHTXfn9dvabV+92O0EfkBkI8KUoBKymYSOty0d
	 0DAxql17MW5mjR1tyRF5NcCKv0QZCAUpwjGe6tslOAClLsNNSGbJ6CB+qQ2vBal5uB
	 +th+LAgu3k/fmOJc1Du1SrOEBn/5tIRmvvsIdh9cXGYHQ35ks0K9D8FMEwuUphn9nQ
	 EJfLzffgxpbdRb43CYfTDmjNKAn9dLdq4RyT8l+6poo9Dk2F5WGu15s/fBUx90mvT6
	 o0aHe7Qa+VN7Q==
Message-ID: <c0effa9f-1262-4bed-a99e-ae5441ac47ea@kernel.org>
Date: Tue, 12 May 2026 08:14:20 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] mm: support zswap-backed anonymous large folio
 swapin
To: Yosry Ahmed <yosry@kernel.org>, fujunjie <fujunjie1@qq.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Ryan Roberts <ryan.roberts@arm.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <bhe@redhat.com>,
 Lorenzo Stoakes <ljs@kernel.org>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <agJT6D5zaUD6FpwQ@google.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <agJT6D5zaUD6FpwQ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/26 00:13, Yosry Ahmed wrote:
> On Fri, May 08, 2026 at 08:18:29PM +0000, fujunjie wrote:
>> Hi,
>>
>> This RFC explores anonymous large folio swapin when a contiguous swap
>> range is backed consistently by zswap.
>>
>> Large folio swapout to zswap is already supported by storing each base
>> page in the folio as a separate zswap entry. The anonymous synchronous
>> swapin path has remained order-0 once zswap has ever been enabled:
>> zswap_load() rejected large folios, and alloc_swap_folio() avoided large
>> folio allocation to protect against mixed backend ranges.
>>
>> This RFC keeps the scope intentionally conservative. It does not try to
>> read one large folio from mixed zswap and disk backends, and it does not
>> change shmem swapin. Shmem still has its existing zswap fallback and is
>> left for later discussion. For anonymous swapin, the backend rule is made
>> explicit:
>>
>> - a range fully absent from zswap can keep using the disk backend
>> - a range fully present in zswap can be decompressed into a large folio
>> - a mixed zswap/non-zswap range falls back to order-0 swapin
>>
>> The series adds a zswap range query helper, teaches zswap_load() to
>> decompress all-zswap large folios one base page at a time, accounts mTHP
>> swpin for zswap-loaded large folios, retries synchronous large-folio
>> insertion races with order-0 swapin, and removes the anonymous
>> zswap-never-enabled restriction once mixed ranges are filtered.
>>
>> I tested the series with a full bzImage build using CONFIG_ZSWAP=y,
>> CONFIG_ZRAM=y, CONFIG_MEMCG=y and CONFIG_THP_SWAP=y.
>>
>> The QEMU/KVM runs covered both the fully-zswap path and the mixed-backend
>> fallback path. In the all-zswap run, a 512MiB anonymous mapping was faulted
>> as 8192 64KiB groups, reclaimed into zswap, and faulted back. Reclaim
>> reported mthp64_zswpout=8192 and zswpout=131072. Refault then reported
>> mthp64_swpin=8192 and zswpin=131072, and pagemap/kpageflags showed 8192
>> order-4 THP groups in the mapping.
>>
>> In the mixed-backend run, the workload used a 64MiB anonymous mapping
>> split into 1024 64KiB groups. After shrinker debugfs wrote back exactly
>> one zswap base-page entry, refault left 1023 order-4 THP groups and one
>> order-0 mixed group. The kernel stats matched that shape:
>> mthp64_swpin=1023, zswpin=16383 and zswpwb=1.
>>
>> CONFIG_SHRINKER_DEBUG is only a test aid for making that one zswap
>> writeback deterministic; it is not required by the implementation.
>>
>> Nhat Pham's active Virtual Swap Space series is adjacent work. It moves
>> swap cache and zswap entry state into a virtual swap descriptor, and lists
>> mixed backing THP swapin as a future use case. This RFC is independent and
>> works with the current swap/zswap infrastructure, but may need rebasing if
>> VSS lands first.
>>
>> Feedback would be especially helpful on:
>>
>> 1. whether it makes sense to support all-zswap large folio swapin first,
>>    while keeping mixed zswap/disk ranges on the order-0 fallback path
> 
> I think so, yes, but based on my read of the code this RFC only affects
> synchornous swapin, which is more-or-less zram+zswap. This is an
> uncommon setup outside of testing.

BLK_FEAT_SYNCHRONOUS is also set for pmem and brd devices I think, but that's
also pretty uncommon I assume. Well, maybe if your hypervisor provides you with
an emulated NVDIMM to use as swap backend ... maybe.

I thought there were other ways to get BLK_FEAT_SYNCHRONOUS set, but I don't see
other usage.

So seeing it for zswap is pretty rare I assume.

-- 
Cheers,

David
