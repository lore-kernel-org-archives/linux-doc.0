Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5F233472D
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757947547; cv=none; b=OglSOS6jNHwTmmdxhve01It/0N6jYIM2RVlgoLIVT7uUaqvMDUUF5ipz2BFwtRPZKGi4B4o6fYWhRUN9H99M4vwtAdbPEtZwO6TE3LtsUtcmja9HEan+ZkLQuXnmxn3TnM1HZAAegA7yiNBpB6qrPSE+5bXagJem0AnrhXXpSTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757947547; c=relaxed/simple;
	bh=3j6vMIwJeQcve7TptqubRQhXa+2fHqJxceZ6ouOq3oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWq8IJWEhZxKVuGoO/8u8MeoMhSOYT21vYe+C+o8vQIxCsi5d3ltfz+Zc5iXZJUZ5qTbX7U1Qmqn00Mf+OGvE/xtzyOKt+AjP273fFWvt4cgmkQPhnqe5nL8j8aF3cC/XtZQ4zciVaRY1pWxegwJbolkUq+9jeNVWKL04Kd5UWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AMK+jeAz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AMK+jeAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757947545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k9+ng43GZrr5Qkg95oHRInTl4xTsXzKo4GlGm+qBoPA=;
	b=AMK+jeAzDnnF/JTD5rYTQBofrLj1+c/sBF2UcbFKPU9xF0qghYPzMIvrK42Zd8YUmeL5Fu
	rLu/bx8uoeJBMafDE2q5MO8Sf57n8DIds0FHscHYdGHBr4auWiaJ4xSmpF3R84bN2LxhEZ
	ySgJC7tg+NuXsIZ1EpSkAdrUMXVgPSc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-WQGjdPArP2yNvCRzcyFHig-1; Mon, 15 Sep 2025 10:45:38 -0400
X-MC-Unique: WQGjdPArP2yNvCRzcyFHig-1
X-Mimecast-MFC-AGG-ID: WQGjdPArP2yNvCRzcyFHig_1757947538
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ebbbd9a430so402038f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 07:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757947537; x=1758552337;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9+ng43GZrr5Qkg95oHRInTl4xTsXzKo4GlGm+qBoPA=;
        b=aVB9hTXpUO7ej9fjKOWJxC46bfZk6iK7kKxV/pTXkKnN+Qla6LjR3RRSdlJhZmmh0o
         sRdT2MOd9cLmW0p4lZQ2Hgz1m7VkREmcM1LX8nSjGG/mjHhfFCtwR1e1hKfCIuA0+Trm
         cVPOBgKEQVP2+w1zhSPmn7nJBMskrLVKIEz0Ok6FuSPG2BS5GzX48j6mAxZBEv49VlY0
         3HCwpKK/Jy7rFS9MabnAkjyMlXvq1MKuBUNPZxKkh/Mj2nC/v51KOAwqYLtoKNX5Z1Ja
         eQKV258x76pNsVFEGG5p4333jUsVfnBAPfWXgxPn1zYihd4Lu0+kiQMUdeUBPW6iSGir
         9vgA==
X-Forwarded-Encrypted: i=1; AJvYcCWYi8l0YeaPa03T6oy7W5o3H5im2ax9NrjKRQ1w0XimUkMFCUzkrdbdcdff7A3xo6fOboByh0bkw5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF4s/S6v+Oeq28TFPKfRqhIBKaVSqlsDAgVsylIhzm9BU9ln5Z
	Kwx2/tSQPb3eYepSnxCJJzJroE6MQXMuXmOsz1eyucEDKllS3Agvx8QzInID01AuWLzFlkDu2Xt
	C5DLgii2DaP5gQFE2xFP19yo5H1brrUpJDVDtXR8CNrpQeU6An6+V9LnsXBakGj1l8b8EOw==
X-Gm-Gg: ASbGncsEj8ItmPTOWOjzitxgpRlqByTA/1MaDEsYPCznV+XMDGE1vShHZtGz38YEcfe
	AlN3aRkL5NQI6TyJxwh6VsQt/WK2RfdHIhXokP2UFg/5J5fILTJGo/M74Zk1UXW+9YkdiueuHaT
	d8zYVivzmHVfRwe58tVZhFTahtw7jxaUljH1ECfU+5AhdgVCIG2wcF9afKHQdklkOWZjupXsu8m
	4r4/gxkK4XQnL7u2LUUGuAMJHORJ27s96OfLhkyqY5U+XAw9ChDIPxXqwKKAIReBjk+eXBRK/PX
	FX2OVgbOG0mb1PQK2MISfb7ZTULTmy/S9+bn7hrJbWNZlkgO1Bj4skk2/UxKXtWIDLQ0wUtH7Km
	M263nrT/AjwIUMT2q8HH2l67nMvQrUQMoOv9eUgnS2Jzij2QxYJzYCSgHbffLXasbOiU=
X-Received: by 2002:a5d:64c9:0:b0:3e9:3647:bafa with SMTP id ffacd0b85a97d-3e93647f92emr5719806f8f.50.1757947537372;
        Mon, 15 Sep 2025 07:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhLsrr/RZZtntJiFPX2y+LT0MCpNqUQa46XkZ2QwZosSN4wOsCpUs0G9aaerck781Zkpkdig==
X-Received: by 2002:a5d:64c9:0:b0:3e9:3647:bafa with SMTP id ffacd0b85a97d-3e93647f92emr5719778f8f.50.1757947536808;
        Mon, 15 Sep 2025 07:45:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd? (p200300d82f18f900e0ae65d58bf88cfd.dip0.t-ipconnect.de. [2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372aea2sm187201655e9.7.2025.09.15.07.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 07:45:36 -0700 (PDT)
Message-ID: <83f256b6-60cf-40b7-813b-302968eeb234@redhat.com>
Date: Mon, 15 Sep 2025 16:45:32 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/15] khugepaged: mTHP support
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Nico Pache <npache@redhat.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com,
 corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, akpm@linux-foundation.org,
 baohua@kernel.org, willy@infradead.org, peterx@redhat.com,
 wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com,
 vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com,
 yang@os.amperecomputing.com, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org,
 hughd@google.com, richard.weiyang@gmail.com, lance.yang@linux.dev,
 vbabka@suse.cz, rppt@kernel.org, jannh@google.com, pfalcato@suse.de
References: <20250912032810.197475-1-npache@redhat.com>
 <ppzgohmkll7dbf2aiwhw7f4spf6kxjtwwe3djkx26pwy4ekrnd@mgeantq5sn2z>
 <d0e81c75-ad63-4e37-9948-3ae89bc94334@redhat.com>
 <20250912133701.GA802874@cmpxchg.org>
 <da251159-b39f-467b-a4e3-676aa761c0e8@redhat.com>
 <20250915134359.GA827803@cmpxchg.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250915134359.GA827803@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.09.25 15:43, Johannes Weiner wrote:
> On Fri, Sep 12, 2025 at 03:46:36PM +0200, David Hildenbrand wrote:
>> On 12.09.25 15:37, Johannes Weiner wrote:
>>> On Fri, Sep 12, 2025 at 02:25:31PM +0200, David Hildenbrand wrote:
>>>> On 12.09.25 14:19, Kiryl Shutsemau wrote:
>>>>> On Thu, Sep 11, 2025 at 09:27:55PM -0600, Nico Pache wrote:
>>>>>> The following series provides khugepaged with the capability to collapse
>>>>>> anonymous memory regions to mTHPs.
>>>>>>
>>>>>> To achieve this we generalize the khugepaged functions to no longer depend
>>>>>> on PMD_ORDER. Then during the PMD scan, we use a bitmap to track individual
>>>>>> pages that are occupied (!none/zero). After the PMD scan is done, we do
>>>>>> binary recursion on the bitmap to find the optimal mTHP sizes for the PMD
>>>>>> range. The restriction on max_ptes_none is removed during the scan, to make
>>>>>> sure we account for the whole PMD range. When no mTHP size is enabled, the
>>>>>> legacy behavior of khugepaged is maintained. max_ptes_none will be scaled
>>>>>> by the attempted collapse order to determine how full a mTHP must be to be
>>>>>> eligible for the collapse to occur. If a mTHP collapse is attempted, but
>>>>>> contains swapped out, or shared pages, we don't perform the collapse. It is
>>>>>> now also possible to collapse to mTHPs without requiring the PMD THP size
>>>>>> to be enabled.
>>>>>>
>>>>>> When enabling (m)THP sizes, if max_ptes_none >= HPAGE_PMD_NR/2 (255 on
>>>>>> 4K page size), it will be automatically capped to HPAGE_PMD_NR/2 - 1 for
>>>>>> mTHP collapses to prevent collapse "creep" behavior. This prevents
>>>>>> constantly promoting mTHPs to the next available size, which would occur
>>>>>> because a collapse introduces more non-zero pages that would satisfy the
>>>>>> promotion condition on subsequent scans.
>>>>>
>>>>> Hm. Maybe instead of capping at HPAGE_PMD_NR/2 - 1 we can count
>>>>> all-zeros 4k as none_or_zero? It mirrors the logic of shrinker.
>>>>>
>>>>
>>>> I am all for not adding any more ugliness on top of all the ugliness we
>>>> added in the past.
>>>>
>>>> I will soon propose deprecating that parameter in favor of something
>>>> that makes a bit more sense.
>>>>
>>>> In essence, we'll likely have an "eagerness" parameter that ranges from
>>>> 0 to 10. 10 is essentially "always collapse" and 0 "never collapse if
>>>> not all is populated".
>>>>
>>>> In between we will have more flexibility on how to set these values.
>>>>
>>>> Likely 9 will be around 50% to not even motivate the user to set
>>>> something that does not make sense (creep).
>>>
>>> One observation we've had from production experiments is that the
>>> optimal number here isn't static. If you have plenty of memory, then
>>> even very sparse THPs are beneficial.
>>
>> Exactly.
>>
>> And willy suggested something like "eagerness" similar to "swapinness"
>> that gives us more flexibility when implementing it, including
>> dynamically adjusting the values in the future.
> 
> I think we talked past each other a bit here. The point I was trying
> to make is that the optimal behavior depends on the pressure situation
> inside the kernel; it's fundamentally not something userspace can make
> informed choices about.

I don't think the "no tunable at all" approach solely based on pressure 
will be workable in the foreseeable future.

Collapsing 2 pages to 2 MiB THP all over the system just to split it 
immediately again is not something particularly helpful.

So long term I assume the eagerness will work together with memory 
pressure and probably some other inputs.

> 
> So for max_ptes_none, the approach is basically: try a few settings
> and see which one performs best. Okay, not great. But wouldn't that be
> the same for an eagerness setting? What would be the mental model for
> the user when configuring this? If it's the same empirical approach,
> then the new knob would seem like a lateral move.

Consider it a replacement for something that is oddly PMD specific and 
requires you to punch in magical values (e.g., 511 on x86, 2047 on arm64 
64k).

Initially I thought about just using a percentage/scale of (m)THP but 
Willy argued that something more abstract gives us more wiggle room.

Yes, for some workloads you will likely still have to fine tune 
parameters (honestly, I don't think many companies besides Meta are 
doing that), but the idea is to evolve it over time to something that is 
smarter than punching in magic values into an obscure interface.

> 
> It would also be difficult to change the implementation without
> risking regressions once production systems are tuned to the old
> behavior.

Companies like Meta that do such a level of fine-tuning probably use the 
old nasty interface because they know exactly what they are doing.

That is a corner case, though.

-- 
Cheers

David / dhildenb

