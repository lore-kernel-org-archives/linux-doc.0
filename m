Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01A32D8DC2
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764972939; cv=none; b=dEO0izMD2amxeVasgAwxQv0adSbW+8og2+vKjMSt7ME4X1Fs0O415wAiEh0kxLcfhW/ulrHyeS7L5ox7rdGGXecwKa5wqvwF/0SkYq0YBm8n5FasSk75fzbu2AXiSZ1XDWmMlHOjioViwCjJ0r8hzvlzoh092pL/jfUxD/pPcqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764972939; c=relaxed/simple;
	bh=7X41fbLYfu+EcYRq36QSEwVo5LR+kjMVbPmtO2P6Jb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjNiP2xfjyqVvJQtTfQ6iFoorUeqgb66VtIVEUtD8fbkMcsTWSbY/YQcUFOmCL/ku3bU3BxdkjNzOj/n1+JFvkgMD2pVHiNY9q9fJXpPRab+AcK72WRdBN74jhbWsCXOk/Q6R6DETqi0niYJBAqbw6yklo0hCJv839kghS3Hi1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz+Ae4nl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz+Ae4nl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so21449555e9.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 14:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764972936; x=1765577736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5v6uADHyrPwoSXxbUmXf8HVGm6kBMdxAZOGM1duysCo=;
        b=Jz+Ae4nlcgmkrs+fx8HudxSMP6t02gI45+nyT9aifnAalIOEStDXvPcgA5Whtfxmdp
         K4XVN420r1A8wYbH8YmQ5ASn7auLnpGWRh5KZmmZc0mLCykbtBLHyR4qMMn8MfgQ/KRx
         2a356+8EXkm9ItGAe69+fgNP2SF3j6i8fapnI3NJF3Z0VNYNKHEtFdrMWSIxPuEwnvfd
         CdgjrKub7fKtm8FOEbnPnCG+hKBZiTNPdBUWGIUVmPGNDoY/ok8I6MJcdpuUM6OmiqIo
         JlwRB0Rnoyw8615E3YPAJHubWEx+QRsz8ZGqA0bI74JQrYwvmqKFfisIpjhmevo3I3Z/
         zhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764972936; x=1765577736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5v6uADHyrPwoSXxbUmXf8HVGm6kBMdxAZOGM1duysCo=;
        b=UBee7A7WL7BH8naVVr0ydG0So8lOEB0CZpPOZCjvZNtOcPw5jVmZiL0lGgKkAgTkzC
         h6cOX/69a6r6JNx6ZVC1omAZv+13+fF4e7JQUN2IInh9uUsHGOE1slnP0a9mRrmIRKWV
         gfP5JNhsav8Fx6AUltWX5+zSTmPk2dg3Ug28lgBNxR93XirbZrt9gWnI6EWO7vZ3ourT
         OeQLfb4b72zAyQHS0KvLrpHPuM2JKzSJgY6ng3hunm1wapRkN188hwOqoZBdoJmsa+cQ
         z0rwdlMN8bTEuavc9DJBtL5PpWrUeXoBOp0rXIckVQONbtY7ytZQibH5rMCZKXRLmitH
         /LYA==
X-Forwarded-Encrypted: i=1; AJvYcCVvQIQ1nJcK+7w1dRUat6uFiJswWBTam/dPPqKleLJuTtSqkRWXoj7W9dfG8Md22ecynjjJ/0xSNrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8x2sVSDR4JsN3fJe5X3PKjFVWxMKGoci8nt3VVsMoEhYEnkU
	KFwss4vdkNv+OiEPdjhlXLqZ9HqqX8cNYQczfZgHU9slZYFYw84ugbgTEtRkSA==
X-Gm-Gg: ASbGnctwo7C0mZ9mC8HUEnhJWpC1duj/36eUmNGlaUexPHKBGjQsqW9oSkx1D1c1Uik
	2+Ls3wABFCLHlr/8N6R/lFRo2InYZRAMb8WAvKmBSFmM4/KODD2Vj4qko9KddP5S/TViEvTkkHM
	jU/MMcTSCdapTu4rVrJ3vWXgyBBDhFzPETFrB711MqM8ckoTRd2P4+XiWtc8U3RAHx9wPEhoXLr
	46Mgfz6ECf3Cr1sM1RGN5K4bBH4lq1EmruMaz8FzsPsr2GnH6A1iaR/gZzqmGxAaxll0T5u1dre
	u/z44YnkDHuQp1cdvdMHUPZGv5yCVlg5FgwinqOd8vB+Oz8TsoqPbDRaLZjOYVis6ZhwwH+VaIg
	jE9X+maW2IeyX1zAMjcow3XsmwspWmVEv82t1caS5vyjEPDCr4/leyu//OvQya3Yd/r/Ksy8Eeo
	v7wmVIBeChUhTdLYYa5B7k+R9CdkA1SzO8llwKt5c02s4Sziro02tquXoGPh69h4DW91Gmk1LIl
	9NTH0XsLnNy
X-Google-Smtp-Source: AGHT+IGr0mJ0TQEJhtTmxbJJqr1Gb9Tqe8as+0pV6SSOhQvHyMjjnnr6lXkpXvUuRzvQDw1saw/9CA==
X-Received: by 2002:a05:600c:4fd6:b0:471:1765:839c with SMTP id 5b1f17b1804b1-47939e1e42fmr5286815e9.20.1764972935942;
        Fri, 05 Dec 2025 14:15:35 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222491sm11419404f8f.22.2025.12.05.14.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 14:15:35 -0800 (PST)
Message-ID: <af9cf69f-c66b-48ea-8617-f4fcd1bc797a@gmail.com>
Date: Fri, 5 Dec 2025 22:15:34 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] mm: Change the interface of prep_compound_tail()
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-2-kas@kernel.org>
 <77d1911d-7b67-41c0-933e-b2a0810cf3b4@gmail.com>
 <gdkhm6ckcrwy6ezetpb6u2m4sfdeqsf4ftg2vb557zipvdepyh@u4f6pyrompd7>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <gdkhm6ckcrwy6ezetpb6u2m4sfdeqsf4ftg2vb557zipvdepyh@u4f6pyrompd7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/12/2025 22:10, Kiryl Shutsemau wrote:
> On Fri, Dec 05, 2025 at 09:49:36PM +0000, Usama Arif wrote:
>>
>>
>> On 05/12/2025 19:43, Kiryl Shutsemau wrote:
>>> Instead of passing down the head page and tail page index, pass the tail
>>> and head pages directly, as well as the order of the compound page.
>>>
>>> This is a preparation for changing how the head position is encoded in
>>> the tail page.
>>>
>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
>>> ---
>>>  include/linux/page-flags.h |  4 +++-
>>>  mm/hugetlb.c               |  8 +++++---
>>>  mm/internal.h              | 11 +++++------
>>>  mm/mm_init.c               |  2 +-
>>>  mm/page_alloc.c            |  2 +-
>>>  5 files changed, 15 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>>> index 0091ad1986bf..2c1153dd7e0e 100644
>>> --- a/include/linux/page-flags.h
>>> +++ b/include/linux/page-flags.h
>>> @@ -865,7 +865,9 @@ static inline bool folio_test_large(const struct folio *folio)
>>>  	return folio_test_head(folio);
>>>  }
>>>  
>>> -static __always_inline void set_compound_head(struct page *page, struct page *head)
>>> +static __always_inline void set_compound_head(struct page *page,
>>> +					      struct page *head,
>>> +					      unsigned int order)
>>
>> I can see that order is used later, I think patch 4, but probably this patch might cause a
>> build warning as order is unused? Might be good to integrate that into the later patch?
> 
> Is there warning for unused function parameters?

ah I havent tried actually building, but I thought unused args would complain. If it doesnt,
should be ok.
> 
> I think it will blow up whole kernel, no?
> 
>> Other nit is, do we want const for head here? (Its not there before, but might be good to add).
> 
> Sure, can do.
> 

