Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D595D502BE
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765043263; cv=none; b=ka41VG9LpBvv0OqE4LxFM5oxwRWQImOzxM8xYJJm7Pdbu7xY4leO5E99NqURu1LlUugrBJuDfNzPLrM7WL2bBjEg8JOXBlTdQ9Ka+rPAsotCrc+I8Rwp2xVQfga9STw92NiA3eW8QEBS0x8Fo08qsg2GsHQlJXfGzlU3CULNdMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765043263; c=relaxed/simple;
	bh=z0S2/yMC6vh88kgObAarezTXpAfRjZlOsDBug19dHE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chlY72d3ehfUbZSyWYfZWO3A6xZFq8n/bYc38KyTm2DE9rg3HBibFHdDj5S6Fau5nTxx+4aUrtYRLvuqAaeHtkkAx5HefHN3ftgDpxfvxqkMFa5g53Ry3ErQNICyV9eDUHR20izOozIb3JZUi74hp/wCvEMkhnSeVco7ykKnUzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMl4zG95; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMl4zG95"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so21743925e9.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765043260; x=1765648060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axnvS5zVZLm16kKZN5PMooBxp95tE4LRRlIvfmIjaJk=;
        b=KMl4zG95bN0zA3Ydi7R3Zx7YVzdObDDFukPTu6ZrPiqqDUAGeqABTbuk7BmSRyl6yK
         c3JlDhciArEbpyopuV32pEjEnfjE5dO8j7/VL+UCSTZqkUpqnu9r1LDXSsxVnefP6DQQ
         jntyl9JGy/dyM7wxEiASwNJIu746ADc7+ab2dsW/hwvxCUdZiUfG9cSNxfk52VkETndC
         uKp1TGHUYaHejP/UlPIEhp9/NZS6WZPAfErK/ZjXTLMcPnTggrYNpWrCO4OwiTlwqcv5
         vACIKFz9YzAS+SXqe2p4S/8iJoWiNFDqjdF+enymjZASwUmdAwWa+teh2ywqaGw7irB9
         NXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765043260; x=1765648060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axnvS5zVZLm16kKZN5PMooBxp95tE4LRRlIvfmIjaJk=;
        b=gMk01giWHdu3aWPpox2mrquwBuK+UUCaOTbnI3K9HvO7EH0CY8KPrhQtTGxYII7oWG
         JpGYYCfRUpNo0rZjn9g7R7x/OiTng5cD0KF6VF7VVlHldkfqLG32SjabPT63F8OzNVJG
         VqjokU5XMXjkcYRBWOCRPnZrS+UFdCnos83RrEn9ElE6ESqgkwTRMA4l8VJtTpGkLQSf
         D/+th3tOvezAHyC2qmEihFKlmqu8qoJZDEcV1AOMWXFxjePidhLadXQkKpw/ZKuYfJjR
         XXw9XQjm9YTNGVXBGD2dQUz+QKOioP01zM9HKD5sj6k2OX4iqD6o2rw1Q6231TwCJnlA
         lEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjWizoixtYujs8rKDFf8ySvmiDxvtzMhTxuyFXeC5SD5kG6DyQjzMSgQN2mxfMFDV5wmFeOUxa+Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRndG2aDtp4kh+uXIiExhy2mwl0LGP1zuxB6lplzHwaigNK7E
	lKdKby+JIx07CyRUvcj5gEQUdvaUxG5VCxg7FliqcPbd7SriycQUBcY1
X-Gm-Gg: ASbGncuXVV6sC+hUYMN+3qbgldAFz7D+XcIIUhc7i6pwT7HaNyme0YX8DNqHvOu40m0
	V/X247xQOj7E7ARL4Nz9+i64OIXAJLGpdY5PcR+foqtc10Utc9cywwgFp3BzIC4fDYdVo5uL6/T
	VBF1YlblkVMlXgyBwzGQNeqJdgxuitje/gjMRQim4JbF+/7SRx1Q/Yg9YBy+vjHElziFi1GtQrF
	W2UgLGeXpbJRTk6dS4o4GX0mBgQ6OVvUaaCxWGvaCzlcGjNz/VRbwzszECeQWykv4sYN/HDjEAU
	F4ayfm3kxvxjpWn5pkN9cHHL2hizPGrCyJuZvAY9Hy1jed0w/gbgojB2TkI5kdR2SJwRXZKdJA8
	kQ+PgaPS8qcM/MouvbApOHqxjeiZQ9OmBA0n8ljVYsdj8uQ32M6Yp4SVdbUMjUV5F62eSc0evQG
	mW92CjOS8I6YfWA+cIWYdBI1N5/Bqsuledehc/2fjIE4N6qiRVHXQOO4/TIesg3EnUMDkDWiKlF
	9/baslmvQXu
X-Google-Smtp-Source: AGHT+IENdlC9ATk+qjyGaFVV0Sr7UOEmj9wx1lqsrnwLpmFCj2H673PTa7tMdOPqBH1ESxPCoGhK4g==
X-Received: by 2002:a05:600c:1393:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47939e4fe6cmr27937955e9.32.1765043260129;
        Sat, 06 Dec 2025 09:47:40 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310c802bsm143938775e9.6.2025.12.06.09.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 09:47:39 -0800 (PST)
Message-ID: <8e59b242-6311-48a7-b9f5-e698c4eccd2e@gmail.com>
Date: Sat, 6 Dec 2025 17:47:38 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251205194351.1646318-1-kas@kernel.org>
 <e1c50f7e-cec4-4676-b5d6-f6446cd64ba5@kernel.org>
 <bdie34dgpltxd5ayvjvqkusx4thdrrebgllvwp333psfuu4vgj@bkfxg2c5sfr2>
 <01e5d0b3-dbf8-4f77-b38a-f48c46f7c31e@kernel.org>
 <ysvhofzg5mdtvxfujdsmffkuqna72pr52ehrpglmlhxnvwstas@xurgptkgtnbe>
 <1b659d59-b1c1-4910-baab-0eef7cda234f@kernel.org>
 <3v5hdubqnil6w54kimvbgapghj7irjp7xuqma6uxtsrpvj22ph@6t47vsevdwyi>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <3v5hdubqnil6w54kimvbgapghj7irjp7xuqma6uxtsrpvj22ph@6t47vsevdwyi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/12/2025 21:41, Kiryl Shutsemau wrote:
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
> 

I made an initial pass at reviewing the series. I think the best thing about this is that
someone looking at compound_head won't need to understand HVO to know how compound_head works,
so its a very nice clean up :)

Would be nice to make the commit messages more verbose, and also maybe add more comments about
why it works a certain way when sizeof struct page is a power of 2.

I don't know what the current memdesc plans are, so cant comment on that part.


