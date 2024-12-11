Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FF91A725C
	for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733929407; cv=none; b=sBmKQJ5lT+fM7wTObm1DDFoxS6CscWbLEFJoITIlRcjDDeKx8HFXLIuLgv0s4VbNWR0aCXB1GokyjH4IQvRMogMoFkjUK9dDEC21d38hDjqAk/ZEqry74sbBcyiKDOQiJrt/b2JitTyjoW2ACpg7BD98losYSMz8v2psWYFdamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733929407; c=relaxed/simple;
	bh=JjGp8OMX6eFvWVVNj6NS4d+aBgakqrDd9QJF+i4Dih8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6ml99O6iAQE1ZWCvK8Dcc512PqO9uTi2xIHtzxZJFFdKCz1j/0pG0Ubfn3ilMad5k2QgeqSJGXpXWmP329kPcKs2BDc2MjB4RmFazsSRgej+blO/QmS1AT4lv1IhD9EVMTC+zkBAl1RYQmtl+NxkoXtxAbgNxQKpOh6/43aZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ahTkypJ9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ahTkypJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733929404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9om8yGOmeJ1SJjydmu+vqGoJoyUXZMpNYYISFBNu+8M=;
	b=ahTkypJ95jwjdgoS1I/2TDAy2g5hHXoDRaeWImedpdTfH769cPrk+TBNnAtxp21ZBhM5AI
	k4gRilbsWB0zJZfTejkHxus68EW+iSQ1xrPyv/S3c/47SDovs9OckWO48cpAXP3bjSN7K4
	t3lcp0Cn9Hn2srADQK5GTh22kGwWAGk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-3jWO5YA0MAaYeXQJ1COlIg-1; Wed, 11 Dec 2024 10:03:21 -0500
X-MC-Unique: 3jWO5YA0MAaYeXQJ1COlIg-1
X-Mimecast-MFC-AGG-ID: 3jWO5YA0MAaYeXQJ1COlIg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434f1af9d31so24057165e9.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 07:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733929400; x=1734534200;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9om8yGOmeJ1SJjydmu+vqGoJoyUXZMpNYYISFBNu+8M=;
        b=ju3y8qpLtCil1HkAl2J3Dh/QZ+2QmeSQBE7ESKG+smISfNim3BMfCogRFj+eJhK7i2
         GrD3dtE944j8ZQujizuXLawC18ejMmXPicl7AtijpOQAk9qhSQd27d+e1jzzXpzhmsYd
         z6KMve8gD8q/e6QghdloNsZJrRS5k2M2ecvaqhIae8NOaVXOTCdw8VMSdw4quISwUDze
         Ob7FKEupGnvyvDvGeCB3tt9AaT/3ucOOKCJVbFJTAuu3deBxhlgadyc+QbH1RnVJIjH6
         REtnPef9uO8ywpwcaPGDO3UOHSPmmXEsGkvuQwRBGnA9trhxHD6jw9tgxMtlMw4qrn4X
         UoiA==
X-Forwarded-Encrypted: i=1; AJvYcCW/pStZetSi+JAhPVZhoBoJiPwoiOoSaHVW7DqfBlYRC/jkjQeEkQi3v9SvFe3EyOj5mLjxdgpuV7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PpoC8Hw7mUe/HJwZue+58CfQ38E7ypoXQmubZaB7ABNTwkKE
	d5rcM2D4y/gLzRYmFF5jBZfUiDneLz2sAmPg/wkUWTT/SvdiQWi8lPX7E5m2MKengyXT6hpPVaa
	YPHdLLpxQgg8Iesuf8htfcMo6v8KErPvHEA3TCyCUUTFPidcBgcxSt5bfQA==
X-Gm-Gg: ASbGncuSAB5NLdJ3Bex8hrRgJl9JZIxxgd52aQxxeGQb9Q/3aywldNtBFjbXINGyCRW
	p8mcliZojqVqzEIzj9TVQ5/x5feicAnlVfCWZ+BmPsVqjZq9V6CJ4TvwgaS9Iw7HfeSzvk/AMek
	DLeFbKL7WuMh3lAol5ZnAyUFkIqo6exq8rp8ZG2tk3DV2r8XcESIndxsec5Y4o0WDZ2Umtf8XUG
	5gKXXb1/TwR+Yl5ysjfxK+93+L5Hbw8LvYAJRizHTzIkwFAxfuApmEAY5hZS4fiikqCRDQbaGR3
X-Received: by 2002:a05:600c:c18:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-4361c43a027mr22308845e9.24.1733929400539;
        Wed, 11 Dec 2024 07:03:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa3+FOxW1t8itniaZ4JeKbMe45qTZPhqeUTkUeMSc7V4a8//w+BVtfqU81VE3sdQLj1cvoVA==
X-Received: by 2002:a05:600c:c18:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-4361c43a027mr22295735e9.24.1733929385603;
        Wed, 11 Dec 2024 07:03:05 -0800 (PST)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361e54ef20sm19907675e9.5.2024.12.11.07.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 07:03:04 -0800 (PST)
Message-ID: <e53b04ad-1827-43a2-a1ab-864c7efecf6e@redhat.com>
Date: Wed, 11 Dec 2024 16:03:02 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] mm: Introduce a pageflag for partially mapped
 folios
To: Usama Arif <usamaarif642@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 roman.gushchin@linux.dev, yuzhao@google.com, npache@redhat.com,
 baohua@kernel.org, ryan.roberts@arm.com, rppt@kernel.org,
 willy@infradead.org, cerasuolodomenico@gmail.com, ryncsn@gmail.com,
 corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com
References: <20240830100438.3623486-1-usamaarif642@gmail.com>
 <20240830100438.3623486-5-usamaarif642@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240830100438.3623486-5-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.08.24 12:03, Usama Arif wrote:
> Currently folio->_deferred_list is used to keep track of
> partially_mapped folios that are going to be split under memory
> pressure. In the next patch, all THPs that are faulted in and collapsed
> by khugepaged are also going to be tracked using _deferred_list.
> 
> This patch introduces a pageflag to be able to distinguish between
> partially mapped folios and others in the deferred_list at split time in
> deferred_split_scan. Its needed as __folio_remove_rmap decrements
> _mapcount, _large_mapcount and _entire_mapcount, hence it won't be
> possible to distinguish between partially mapped folios and others in
> deferred_split_scan.
> 
> Eventhough it introduces an extra flag to track if the folio is
> partially mapped, there is no functional change intended with this
> patch and the flag is not useful in this patch itself, it will
> become useful in the next patch when _deferred_list has non partially
> mapped folios.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>   include/linux/huge_mm.h    |  4 ++--
>   include/linux/page-flags.h | 13 +++++++++++-
>   mm/huge_memory.c           | 41 ++++++++++++++++++++++++++++----------
>   mm/memcontrol.c            |  3 ++-
>   mm/migrate.c               |  3 ++-
>   mm/page_alloc.c            |  5 +++--
>   mm/rmap.c                  |  5 +++--
>   mm/vmscan.c                |  3 ++-
>   8 files changed, 56 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 4da102b74a8c..0b0539f4ee1a 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -333,7 +333,7 @@ static inline int split_huge_page(struct page *page)
>   {
>   	return split_huge_page_to_list_to_order(page, NULL, 0);
>   }
> -void deferred_split_folio(struct folio *folio);
> +void deferred_split_folio(struct folio *folio, bool partially_mapped);
>   
>   void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
>   		unsigned long address, bool freeze, struct folio *folio);
> @@ -502,7 +502,7 @@ static inline int split_huge_page(struct page *page)
>   {
>   	return 0;
>   }
> -static inline void deferred_split_folio(struct folio *folio) {}
> +static inline void deferred_split_folio(struct folio *folio, bool partially_mapped) {}
>   #define split_huge_pmd(__vma, __pmd, __address)	\
>   	do { } while (0)
>   
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 2175ebceb41c..1b3a76710487 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -186,6 +186,7 @@ enum pageflags {
>   	/* At least one page in this folio has the hwpoison flag set */
>   	PG_has_hwpoisoned = PG_active,
>   	PG_large_rmappable = PG_workingset, /* anon or file-backed */
> +	PG_partially_mapped = PG_reclaim, /* was identified to be partially mapped */
>   };
>   
>   #define PAGEFLAGS_MASK		((1UL << NR_PAGEFLAGS) - 1)
> @@ -859,8 +860,18 @@ static inline void ClearPageCompound(struct page *page)
>   	ClearPageHead(page);
>   }
>   FOLIO_FLAG(large_rmappable, FOLIO_SECOND_PAGE)
> +FOLIO_TEST_FLAG(partially_mapped, FOLIO_SECOND_PAGE)
> +/*
> + * PG_partially_mapped is protected by deferred_split split_queue_lock,
> + * so its safe to use non-atomic set/clear.

Just stumbled over that. In my understanding, this assumption is wrong.

I don't think anything prevents other PF_ANY (PG_anon_exclusive, 
PG_PG_hwpoison) / PF_SECOND (PF_has_hwpoisoned) flags from getting 
modified concurrently I'm afraid.

-- 
Cheers,

David / dhildenb

