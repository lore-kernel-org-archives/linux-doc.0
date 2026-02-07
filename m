Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64149253B73
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 20:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770495388; cv=none; b=Fp7oou0xyfFebfJ8cL5Jvb1TbPzQfARcTW6asQWhH/tZWXBKsIt/dkcKcsdDmMVX1b63dWGqerx6lmdZ3lqwRJl8o95CdwKMiVUK9laMaG13HcuuieRIvaPn1JkMFt/aDzHT1zCS52bb8ybRFLB61nlUo5JIUjzpHl8jfGL9XKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770495388; c=relaxed/simple;
	bh=1f6G4v+4U4f6IIr3zzk56Nlc0wxLZuYQLXFP9N6lfd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcQV42IZOkdSjBxdsK/H2c9JjXk3eTQ1iYlXGHxIVcLFFcnH9ew2uNt/i1yy7CuZa2wNBc0lH18ZVB/se8RmlGLHMGEWQ7whebh6jV0bv9mLSRe6j2sdtGEgvCvCIkF0ZCBvOYRs/hciSFVaD/1U9PzkovSHZlFmcry23h/tDX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TODJM6SA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TODJM6SA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4832701b9b7so8627445e9.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 12:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495387; x=1771100187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tgEE4qPRK7pF2tP48CJlGhSYjJKIgdfs2GqYMm8p6Y=;
        b=TODJM6SA02GlJ6o7sUqQgWh1gDqH0d6tXvFz0m6rPqu3AgMR7ikQJuwf38yDOq28dk
         op2VYlQMT0bzhJRS/mTpYXBvjPQ+27Zx6MlXPZAHvjeNIaZAGkyix02IPnbFL8bFNGLr
         RKV6E/wAQJjbamWGd9j/0zw9/SVkMcYyeA+Ymy8pMnUTs+aRGtl0+3nOTX923v17IkGM
         Ygbpuv0dTR71X0H5Mz6qnPRSidjRNayaZGfQlr0yJbPzbgQcm5XXwSLr2bn3RK2xIP6N
         NbDeRPaod0PkqcAJ4DcOpYR1SGca27OPRNovORPEvPFnCc7YH8HQkmlXijmbqdBoU6oF
         NACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495387; x=1771100187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tgEE4qPRK7pF2tP48CJlGhSYjJKIgdfs2GqYMm8p6Y=;
        b=uiANN4B+FxaIQe66KeMbY/Pmc6nmSIo4WpKC6K2Zf2c87G0LJyVx30Goj8AKnYJEiE
         /42ABTw9ZfI68WlebthY38j10/SxepktxVNN7V3AsEeRPzsbiy6xSm+JbzxgqDmvNcfI
         7HqUwz9mIyakhoITaAe0fisRGq8V6MORTfwKTJfrCiMXiQeDpdw3pPnVFkhfNBqZtOBm
         axbUv1o6FlJubJYNqBA4Jp5o33suEbYdBz0WkSoAT95tLNGLtYCcdEWZhfRq7cn6vdK9
         xoGHQB5w8+K/az2EKTE9IODPpWVC1dsOJfOBmLiM6O4h1YGNh12V/KumY+gYtiKIlqXS
         uygQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkdOx/B66oNVhWEFleW4Y9488SvPSGNhja3uaJFhzrcv0XvwLIUIANni37xBF1jtcO3PvJJQhFR6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1nbyZuZdEUql1p8uamdLOvXoCjjaNjM9Gio8q85adulYWwhs
	hhwYyiNBYv9XAxYC51Q0plq/PK7xwvpRAfWNHrw+Xk4xiKOJFW6IewV2
X-Gm-Gg: AZuq6aL5DDgAYFEFbLCSBsa5vptIUiRYvefs8EiEfTjAGp58fT3NCx6doXNUR6ApYe2
	IQQslO/rHQoFgmSQpPaX43VSvz4N1Mo24qH9cDJwoTcBWfgO3o3dfFVe3jT/PrNcCWLWjwWyf9a
	NmdiIWH6/HDpkVJ3jiuokDhn0dYQm7zM5WoYnfBcBRyRAXCXovb6tAf829TYKIHNTNEFjloJu9s
	eSZWCbiEi52yVIgw3nyh+angfJGfc0+0im2ueBYyw89iTZUHLkMQFgA8BNW0Mz+VWb3TgishLJv
	uryteUATlEhDwHQx6onR4s1s13gio+JM/4ACsNxpjUBYvNXAXQRqk2Wd90T+tkpGdBQqlDPdexJ
	Ks+s8W9y10tW9ZIsnhha1qXuOA0Fe/z9oeFlkZdf/cjczvo6hXMbIoo1rnIsSvklIrpDL2a1TX3
	JdXdRaXRw5fvWdwk0sJqFkjmIFX7cqHneZ9Rv9P+kSlSgfXrsKzKNLayyGiSyfvHX3lNLKIsIrx
	t03N9rMSdn+umY=
X-Received: by 2002:a05:600c:3e12:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-4832021d67dmr86909015e9.29.1770495386585;
        Sat, 07 Feb 2026 12:16:26 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719b8fsm144010445e9.9.2026.02.07.12.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 12:16:25 -0800 (PST)
Message-ID: <907ff793-9b02-4a22-a85e-2873246f6402@gmail.com>
Date: Sat, 7 Feb 2026 20:16:25 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 11/17] mm/hugetlb: Remove fake head pages
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-12-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20260202155634.650837-12-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +
>  int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>  				       int node, unsigned long headsize)
>  {
> +	unsigned long maddr, len, tail_pfn;
> +	unsigned int order;
>  	pte_t *pte;
> -	unsigned long maddr;
> +
> +	len = end - addr;
> +	order = ilog2(len * sizeof(struct page) / PAGE_SIZE);


This doesnt work for ARM. For len = 32 (2MB contiguous-PTE hugetlb on arm64):
ilog2(32 * 64 / 65536) = ilog2(2048 / 65536) = ilog2(0) which is undefined.

Is order = ilog2(len / sizeof(struct page)) better?



> +	tail_pfn = vmemmap_get_tail(order, node);
> +	if (!tail_pfn)
> +		return -ENOMEM;
>  
>  	for (maddr = addr; maddr < addr + headsize; maddr += PAGE_SIZE) {
>  		pte = vmemmap_populate_address(maddr, node, NULL, -1, 0);
> @@ -398,8 +426,7 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>  	/*
>  	 * Reuse the last page struct page mapped above for the rest.
>  	 */
> -	return vmemmap_populate_range(maddr, end, node, NULL,
> -					pte_pfn(ptep_get(pte)), 0);
> +	return vmemmap_populate_range(maddr, end, node, NULL, tail_pfn, 0);
>  }
>  
>  void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,

