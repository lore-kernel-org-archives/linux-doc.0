Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285E32F76D
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756743349; cv=none; b=LgE5NWdiwecLe8byVD/qcXOe/paYQJfGNaEGoeoz9NOrh6w9Cy2C3yz3egbPITBLYDZPkMj4DKXNUZqAVIVgdVmLN7kWckKml77BVTZPxRzJZs7m4hqsa8kNZAI3PllYf+9bpXKF8yXDezz2HSMzYReQUU1qA4GCXJythNM3Tgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756743349; c=relaxed/simple;
	bh=Ch3ChIDZ/x4r51eneaXX6gqB8lahQHd+ZSzbTm9Uy1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+Dvaz10jsIUk5swQ3h5+rayqbnaakGGHbDgatGzxRiOJzry28IblfVkfXiZwVIJuW+Tkl3XDayZRtMSD6wno55wzoeyJmt/G84ARWXwhmJCyld51sfARt2fcUAFFcQz8skuQ6Ghx0QmGJdjy96zg77brbNScwCXqt3/+Vh03no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gbQInPKP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gbQInPKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756743346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WzCHhi4hjG4XUTM3m5FXF23YIR33PFzU4tTzZn5EUNE=;
	b=gbQInPKPTObrnM3UqluFPFi7uTRntDIn9O8G1Y2yYNLeRCG4MvVZ/pgoW7w2jnpmmXXJ0O
	CFCaJIOUqx2pwC/TuLGVqmsP66+TRqzpl1ihfllmxAquX0tA7/ij3DJpxBcXD4kfPhkb4c
	j4CXYxzpUFRXVWc+RjKY2JL3xIpn/VY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-tMF4iCRSOGS6Ja53wJ1erA-1; Mon, 01 Sep 2025 12:15:45 -0400
X-MC-Unique: tMF4iCRSOGS6Ja53wJ1erA-1
X-Mimecast-MFC-AGG-ID: tMF4iCRSOGS6Ja53wJ1erA_1756743344
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b89ef1c05so12065705e9.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 09:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756743344; x=1757348144;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzCHhi4hjG4XUTM3m5FXF23YIR33PFzU4tTzZn5EUNE=;
        b=HhgJnacex7DvKZ1L8+PGls40g/nHnFl/62Z9IXQZoQKFdQ03qT0aM4rzMlxOshSpy2
         MsV4g7bHvohGJ5E7KFzqGHsbXUxLUiqq6MVNOBo1vLvLOAogBkz+wRpwgpDPfzQlwhUc
         wpsRw9m8lyYV2xNM9gqzv/gV4lrA1QVbYlW4naBV3vyzBmbBXB/YhipbaArSenjCAUvU
         piMDQWqZTa/ULII81L7H0FaiX2+xcmmc2Rx08NhfyFGzlgO/0ZjNW/JLo2wMrw+W4nzv
         kIpi8lZVQF98cpJSLfRgcScO3ly7osrnt/yASBtvKGJnVYrwh+8JdAPIxgG1OkfRJxa4
         OOTg==
X-Forwarded-Encrypted: i=1; AJvYcCWZOzX1xDMCHTIxtiHvgd9mEAfbywPYDzWO3lggTI7V5v2ZAJJJeoC9OGN+i63GHHLf8ASUCvaY790=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGGH4EFscwm9LKQW7bKmfJHOvfdijqFzNz1VRpYdH233OIC/IA
	rQWBJZKSnZOQRKyjO0oU1yiQBWSL+m6XnIXUMzdNYLlAHcDROB3S1td6vo+/QJoK2EDhf+olJbF
	MPuci07xqHOK1o3fUPGSBc3MbNG+hUTSGch/CSJ1IL6cMa7eXeuK6GZW2gjLdlQ==
X-Gm-Gg: ASbGnctGGUATwO0eOS7kei/gEm72G1pX6vNcC2MHj9Rkvl2GYrGGCiFXvOiY3C5hFxj
	+XlJi6ysWYGXl66SgC8oZ+F3QSkmcIdeU61eLGpNi1BMuhwc5tFAL5z60vqXqYx2KSe25aJQ4Od
	KIg0OHC0laDz8iAbSe0gWgPoC/L32DbhVq38FZl87PhH+UwywSS8r/xYVhTBi3Dno+dbubkJrJC
	V9QryK/6yIuWE0fkMOGe8GXg0H8cFaDVu5DujEpgx/azNUDUTX+koVIIWnkq/yNCqhHe9LHhe6i
	SNKJ0hQnKNV1YUeON7yLfFNA31RvDFqoJEGZ2dinopBeKp3Xu5Hn0EykdtcsstZnUrZxA6rJzkI
	gJAKQSmMNGPeph1gfJg9CzpZe5TYkiON7hXVvt9n236CtjxKg58EEz4yNcRa94UFy7aE=
X-Received: by 2002:a05:600c:3ba8:b0:45b:6705:4fca with SMTP id 5b1f17b1804b1-45b8558b82amr80213485e9.31.1756743343866;
        Mon, 01 Sep 2025 09:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBz1k7vAtdK4ipj+F4kTUm7DgeCfwB5I9v5S+ZFupzLSKLX3A+8B7qS4i4w56nZH+z+JGhtA==
X-Received: by 2002:a05:600c:3ba8:b0:45b:6705:4fca with SMTP id 5b1f17b1804b1-45b8558b82amr80213195e9.31.1756743343343;
        Mon, 01 Sep 2025 09:15:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d12c90a01bsm13377439f8f.31.2025.09.01.09.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 09:15:42 -0700 (PDT)
Message-ID: <07007d31-1601-4b95-b646-687295487cfe@redhat.com>
Date: Mon, 1 Sep 2025 18:15:40 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/13] khugepaged: generalize __collapse_huge_page_*
 for mTHP support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Nico Pache <npache@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org,
 peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
 sunnanyong@huawei.com, vishal.moola@gmail.com,
 thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
 kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com
References: <20250819134205.622806-1-npache@redhat.com>
 <20250819134205.622806-6-npache@redhat.com>
 <2ddd1403-1bda-4875-91fb-7060804a50c6@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <2ddd1403-1bda-4875-91fb-7060804a50c6@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.08.25 16:22, Lorenzo Stoakes wrote:
> On Tue, Aug 19, 2025 at 07:41:57AM -0600, Nico Pache wrote:
>> generalize the order of the __collapse_huge_page_* functions
>> to support future mTHP collapse.
>>
>> mTHP collapse can suffer from incosistant behavior, and memory waste
>> "creep". disable swapin and shared support for mTHP collapse.

I'd just note that mTHP collapse will initially not honor these two 
parameters (spell them out), failing if anything is swapped out or shared.

>>
>> No functional changes in this patch.
>>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Co-developed-by: Dev Jain <dev.jain@arm.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>>   mm/khugepaged.c | 62 ++++++++++++++++++++++++++++++++++---------------
>>   1 file changed, 43 insertions(+), 19 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 77e0d8ee59a0..074101d03c9d 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -551,15 +551,17 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
>>   					unsigned long address,
>>   					pte_t *pte,
>>   					struct collapse_control *cc,
>> -					struct list_head *compound_pagelist)
>> +					struct list_head *compound_pagelist,
>> +					unsigned int order)
> 
> I think it's better if we keep the output var as the last in the order. It's a
> bit weird to have the order specified here.

Also, while at it, just double-tab indent.

> 
>>   {
>>   	struct page *page = NULL;
>>   	struct folio *folio = NULL;
>>   	pte_t *_pte;
>>   	int none_or_zero = 0, shared = 0, result = SCAN_FAIL, referenced = 0;
>>   	bool writable = false;
>> +	int scaled_max_ptes_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
> 
> This is a weird formulation, I guess we have to go with it to keep things
> consistent-ish, but it's like we have a value for this that is reliant on the
> order always being PMD and then sort of awkwardly adjusting for MTHP.
> 
> I guess we're stuck with it though since we have:
> 
> /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none
> 
> I guess a more sane version of this would be a ratio or something...

Yeah, ratios would have made much more sense ... but people didn't plan 
for having something that is not a PMD size.

> 
> Anyway probably out of scope here.
> 
>>
>> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
>> +	for (_pte = pte; _pte < pte + (1 << order);
> 
> Hmm is this correct? I think shifting an int is probably a bad idea even if we
> can get away with it for even PUD order atm (though... 64KB ARM hm), wouldn't
> _BITUL(order) be better?

Just for completeness: we discussed that recently in other context. It 
would better be BIT() instead of _BITUL().

But I am not a fan of using BIT() when not working with bitmaps etc.

"1ul << order" etc is used throughout the code base.

What makes this easier to read is:

	const unsigned long nr_pages = 1ul << order;

Maybe in the future we want an ORDER_PAGES(), maybe not. Have not made 
up my mind yet :)

-- 
Cheers

David / dhildenb

