Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014824;
	b=YCmyyD+m8NdIMSFmL59qMLe4okLSwqwbkMDo7ZRwBi4wyRyBuhsIt8i2kY5iTpEK2ssD
	 xbViZU6eH659+STqd0Aaa0Iu/oMcpkPqMPef5YdtF1YiZv7yVyYKJ8Ptz5KOqFRVpVfA+
	 bUYf7q7LUX4nhHnf5+63lHXkQRZnMzPmOagPWomminDTpPDWpGuL6/m25/n7mfSFRtjod
	 H38ZS90ZVuz9Il8ds8kQyDsLuDA6aJkhwJwD9LfpK7bCeblSp1E3xQa4Ngxa6acQbQzcE
	 PjutHIbhk2N8tvZMDaOBKzp4df/0nbe/NdZ7V+nqB/kd+oMMwjb8XSJDbAN1Tn0ksLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014824;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=g2iLF+agFOr+5qfKvMC8Xc/GyatOwNTMKNF1bh2bdjo=;
	b=c5aLXgvhoSAlg7F8DF3UPnfEdJUFnbwc+T9/AnRlmGe2qBdHL7sevhQnQUL8A5Ek/K3s
	 UoCGFBRtf2JkaNzM2zNYet127a1Jfb6g1qwKf48Q7fNK6HqgZYxB2O8l6oX0M9lvgnNij
	 6onYcnsoUyQUnv4CV2qFdZ2Zs+x7W9mfFeHK16pLY/q6ia893bTdVqa3EWBLLj2lmqu3S
	 IwYZ4qYatn27KlS4sxaUI3vSl7RYbLiASzrHxEVNnOpt6eo/kflOPJqKCf5DDGot1OgEc
	 NIt4rzLoGE+p3njg2VHUnsUhrqyie1/2wX8Lg0cmcIVGsfNwWWHV8MvExYi3pLjv1uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G3jyXppC;
	arc=none smtp.remote-ip=91.218.175.152
Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D6F606A325
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D6F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G3jyXppC
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h45+YJ4kOROsdNUEmNnHaz4GNgM/EKN9DOgOJ5uwQ8Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795014821; v=1; x=1795619621;
 b=G3jyXppCZgoid61RQ8NDedy0MoUyfE4vTHR6888w7r8bSUBza9EEKFv8RQfdXHO/YciNrwFe
 UKcSQAAziDqZkQJb3U/Xwb0Bgw/EeiiBCHsiDFzoXFoV6+cC67khw19Hex6X+FdMwOfETk/oEE+
 zuhEsSRSXtlulGe3othizhGc=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bedab4fb268803f4;
	Wed, 18 Nov 2026 15:13:41 +0000
X-Mizu-Trace-ID: bedab4fb268803f4
X-Migadu-Flow: FLOW_OUT
Message-ID: <7f651049-f0dd-4053-a666-ea1c5d49669e@linux.dev>
Date: Wed, 18 Nov 2026 23:13:29 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
 SPARSEMEM
To: Mike Rapoport <rppt@kernel.org>
Cc: Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Chris Down <chris@chrisdown.name>,
 David Hildenbrand <david@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Joerg Roedel <joerg.roedel@amd.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Sashiko <sashiko-bot@kernel.org>,
 kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-6-songmuchun@bytedance.com>
 <av20jiGZH5uYV6LT@kernel.org>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <av20jiGZH5uYV6LT@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/18 22:22, Mike Rapoport wrote:
> On Tue, Nov 17, 2026 at 08:06:25PM +0800, Muchun Song wrote:
>> KMSAN needs page extensions when kmsan_init_shadow() installs per-page
>> metadata, before memblock_free_all() releases memory to the buddy
>> allocator.  FLATMEM makes page extensions available by this point,
>> whereas SPARSEMEM initializes them later in boot.
>>
>> Allocate boot-time SPARSEMEM page extensions from memblock to match
>> FLATMEM's initialization timing.  This gives early clients the same
>> page_ext availability guarantee across both memory models, while runtime
>> memory hotplug continues to use vmalloc.
>>
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks for reviewing.

>
> with a nit below
>
>> ---
>> v2:
>> - Allocate all boot-time SPARSEMEM page extensions from memblock
>>    (suggested by Mike Rapoport)
>> - Keep memblock allocations above DMA and suppress per-section free
>>    messages (suggested by Chris Down)
>> ---
>>   include/linux/page_ext.h |   9 +--
>>   mm/mm_init.c             |   4 --
>>   mm/page_ext.c            | 119 +++++++++++++++++++--------------------
>>   3 files changed, 60 insertions(+), 72 deletions(-)
>>
>> +static __ref void *alloc_page_ext(size_t size, int nid)
>>   {
>>   	void *addr;
>>   
>> +	if (!slab_is_available()) {
>> +		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
>> +					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
>> +		if (addr)
>> +			memmap_boot_pages_add(size / PAGE_SIZE);
> I think it should be DIV_ROUND_UP().

size is currently page-aligned by init_section_page_ext(), so both forms are
equivalent here. Is the suggestion to avoid relying on this caller-side
invariant and make it more robust? If so, I'll use DIV_ROUND_UP() for both
accounting calls.

Thanks,
Muchun

>
>> +		return addr;
>> +	}
>> +
>>   	addr = vzalloc_node(size, nid);
>>   	if (addr)
>> -		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
>> +		memmap_pages_add(size / PAGE_SIZE);
> And here too.
>
>>   
>>   	return addr;
>>   }
>> @@ -304,7 +300,7 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
>>   	if (section->page_ext)
>>   		return 0;
>>   
>> -	table_size = page_ext_size * PAGES_PER_SECTION;
>> +	table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
>>   	base = alloc_page_ext(table_size, nid);
>>   
>>   	/*

