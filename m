Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FCB1B983F
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764795746; cv=none; b=FYl7rISs3NVctZmdJXoU18rvqwVr7riKI+jE4ZvqtV7QEgGW6+ieo6N3EqSvap4cuMnzzgEFDIPx6b4DKHboAxqZOTg6FqZQ7rSn7dXytkGQIwJ9VTknWjp2DOUAFg17jPosda8VpdHUg09goClQ233zYzQwKDnfH6onxLTCBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764795746; c=relaxed/simple;
	bh=46+pHSDGECTFXKdBSlAPQ2BuXKO8kPmZ4EnH4tXtE7o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hCE6WyU017ykFRZmuGNAji4V/AB5FxvWMJeG/wHjyvY3xaGAv7S7g2ufaFvc2AqSQFd+iHUPSg6jS9mq9aV/wx8BZ34BGD7miVvU3yaKve5sIvPc+PbR+TokbVjJiDhZWe3Um4h2ghc/zDAd+F8tFsqMUPi5RDqGP2AipjaQRdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KEtlbCLW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zl6Bt/Cd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KEtlbCLW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zl6Bt/Cd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764795743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wh68DuFmuCTpixNQpqPfNYRlyM5f+TpOLFbygDNv8C0=;
	b=KEtlbCLWOhw+HzhyxCW63azQ4Z/VuOoyqWumm2iWnmptYElmiFVT7mCFt/WwJs2HowFfuc
	AWJIAljDd29HoupDxF6WEKlOkRzQEB0u4FpLDD6wdiwk5Wp2I2Vt8zzgmmGVe508XCHdVV
	xwCZ88mzL2KS9M2V51Y/wj/GjjWr/ZA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-8Fi9K4OlNtel_cGZCsY_aA-1; Wed, 03 Dec 2025 16:02:21 -0500
X-MC-Unique: 8Fi9K4OlNtel_cGZCsY_aA-1
X-Mimecast-MFC-AGG-ID: 8Fi9K4OlNtel_cGZCsY_aA_1764795740
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6466f2baso5312731cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 13:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764795740; x=1765400540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wh68DuFmuCTpixNQpqPfNYRlyM5f+TpOLFbygDNv8C0=;
        b=Zl6Bt/CdVZhzr1+3yT1YMgvOeXR1QuuEDQ9NiB7xnYxYRaIXK4UyIUZeQy96lX8gEj
         96tBBUngVzeRbX4adg/3z3IulFe/Y8k8awwFpJFENXkWAM6/oZ7W7gV7xGlnFTQs1peD
         f5xqFM7TdH+ihbelruewirlhHU946Bs3H0OPQQDASo9sUXqjOc+OMTnGz9HQCbc7j8aB
         2lvIPyuRL2OINGtJ3OmcvxmoZK+ag9yizPaLVRiS4zSrRhTEzwosbSrnursdeDCgzbgg
         IYMlikVtiiVCR5ZYAH42X0WqCdEI9qCOUtC2YKiZjX/uCnukSrWBj9fWbxokSpX7KNfJ
         z40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764795740; x=1765400540;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wh68DuFmuCTpixNQpqPfNYRlyM5f+TpOLFbygDNv8C0=;
        b=K3K3xHOnneT4amgUqXdhHBZdmRXxl/6wuDzuDr8EMx7iWqXgIyh/LQjU3h+FylgGYx
         VM1ej1QKmkiifScVNhIGw7J7TDObPyk+Xwt+VwHcULZARaZ0+61uf5+XjaU3oV1N0Q98
         o85UJN5M0/Ta80c8EUy53eSAd41fnmbA02G83zBAy6TPP7Y0Ajyo8+DQjdhfgGu/OTi7
         lMznB5UTj2nZ/+M1vvN6e4d0yhoV6cKl+AkX9k+DC8SnyfCA2UHkK+NGlzekGYnQrGMb
         6CnG5oM8y3OVRj5JZNtG1IS+6z9Jpe6MeCgAxsq3he2iH6OCy33GhyCtMROyb9jMueQG
         12Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV71j8Z0pv8g5dB1918a5kQoG5wr7t/MAoBRx2UJrzWq1LNO01UVY6bNM32D7XEaB4A7NNgBTsCMnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7mM1Ixv4/47OuGixjZ2krp0PoLZsoet/Lg5uD+60qNEWMdJA
	v3byZ/8yxeadcRue8jAEjfLvUtGAqTpBID6PQb/5D6h79J+jHS6cyTZhgFkDRH3huGRgoCuesd2
	MG5tjlIplpJjd0sT9XxBVuAhi0Wj1s7nViVj4YlbklDt+bipOg0iT0tFYFRsMvQ==
X-Gm-Gg: ASbGncu7w8gENKr9RI1uOgXh+0ZOnDW75+3V0BRFHQ/ucsJoYTl3Umdjb9ity0sJYj7
	1130bGeT9DGalhEyFzTNvbjmW7WoW0HO5tXl9qErDNIzUGkeDNCO56qCf/lK2UgPQvlC/01AVDE
	cGtgdEKdBhs1oI+MSMEHqJOb5th1vLzcVZ0fiyWKdOur2VK9LJr/iwF8qAEedcMDOpDGz5a5pBU
	DMbxdqaCLasEJobaC0g5cO4ITwqEdJSEQ6QfMBsDQJ4UHb2HxIImsryve8HlehY3tX3Ti8rDlau
	dwnT9Yh0Anle+8A2CDJZ4e6Jkmf4Nn6SkK/73tAEJtEQGAGa8w2QYXwCaWvvi91A1qZA/KNTPc8
	+C5FIaSJBl7maU3nlRg==
X-Received: by 2002:ac8:5916:0:b0:4ee:49b8:fb7f with SMTP id d75a77b69052e-4f01767ea57mr52094761cf.58.1764795740290;
        Wed, 03 Dec 2025 13:02:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTpqaTiqS+C1vNo/L4t/xM/bulVqn8SjD+/i4c5bpbIFGDFtHnpdO6/T7V6iwwIIk5Hbfq+Q==
X-Received: by 2002:ac8:5916:0:b0:4ee:49b8:fb7f with SMTP id d75a77b69052e-4f01767ea57mr52093951cf.58.1764795739759;
        Wed, 03 Dec 2025 13:02:19 -0800 (PST)
Received: from ?IPV6:2601:282:1c83:9aa0::72b3? ([2601:282:1c83:9aa0::72b3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b4aed6sm139789696d6.37.2025.12.03.13.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:02:18 -0800 (PST)
Message-ID: <b9f49744-932e-45ed-abd3-a9dcf6458b17@redhat.com>
Date: Wed, 3 Dec 2025 14:02:14 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 mm-new 07/16] khugepaged: introduce
 collapse_max_ptes_none helper function
From: Nico Pache <npache@redhat.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
Cc: david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com,
 dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, baohua@kernel.org, willy@infradead.org,
 peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
 sunnanyong@huawei.com, vishal.moola@gmail.com,
 thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
 kas@kernel.org, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com, richard.weiyang@gmail.com,
 lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org, jannh@google.com,
 pfalcato@suse.de
References: <20251201174627.23295-1-npache@redhat.com>
 <20251201174627.23295-8-npache@redhat.com>
Content-Language: en-US, en-ZM
In-Reply-To: <20251201174627.23295-8-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

The bot has reported a potential uninitialized use of a variable.

Can you please squash the following fixup to this commit.

Thank you,
Nico

----8<----

From 846f79d91a25ebad76cbab3690ae315cfe3cf278 Mon Sep 17 00:00:00 2001
From: Nico Pache <npache@redhat.com>
Date: Wed, 3 Dec 2025 13:42:18 -0700
Subject: [PATCH] khugepaged: fixup unintialized _pte variable

There is a potential use of an uninitialized variable after
`khugepaged: introduce collapse_max_ptes_none helper function`

Andrew can you please append this to Patch 7 of my series

as reported by the kernel test robot
>> mm/khugepaged.c:593:6: warning: variable '_pte' is used uninitialized
whenever 'if' condition is true [-Wsometimes-uninitialized]
593 | if (max_ptes_none == -EINVAL)
| ^~~~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:724:25: note: uninitialized use occurs here
724 | release_pte_pages(pte, _pte, compound_pagelist);
| ^~~~
mm/khugepaged.c:593:2: note: remove the 'if' if its condition is always false
593 | if (max_ptes_none == -EINVAL)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
594 | goto out;
| ~~~~~~~~
mm/khugepaged.c:588:13: note: initialize the variable '_pte' to silence this warning
588 | pte_t *_pte;
| ^
| = NULL
1 warning generated.

Signed-off-by: Nico Pache <npache@redhat.com>
---
mm/khugepaged.c | 5 ++---
1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f425238d5d4f..7c7d04d6737e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -585,7 +585,7 @@ static int __collapse_huge_page_isolate(struct
vm_area_struct *vma,
struct page *page = NULL;
struct folio *folio = NULL;
unsigned long addr = start_addr;
- pte_t *_pte;
+ pte_t *_pte = pte;
int none_or_zero = 0, shared = 0, result = SCAN_FAIL, referenced = 0;
const unsigned long nr_pages = 1UL << order;
int max_ptes_none = collapse_max_ptes_none(order, !cc->is_khugepaged);
@@ -593,8 +593,7 @@ static int __collapse_huge_page_isolate(struct
vm_area_struct *vma,
if (max_ptes_none == -EINVAL)
goto out;
- for (_pte = pte; _pte < pte + nr_pages;
- _pte++, addr += PAGE_SIZE) {
+ for (; _pte < pte + nr_pages; _pte++, addr += PAGE_SIZE) {
pte_t pteval = ptep_get(_pte);
if (pte_none_or_zero(pteval)) {
++none_or_zero;

--
2.52.0

On 12/1/25 10:46 AM, Nico Pache wrote:
> The current mechanism for determining mTHP collapse scales the
> khugepaged_max_ptes_none value based on the target order. This
> introduces an undesirable feedback loop, or "creep", when max_ptes_none
> is set to a value greater than HPAGE_PMD_NR / 2.
> 
> With this configuration, a successful collapse to order N will populate
> enough pages to satisfy the collapse condition on order N+1 on the next
> scan. This leads to unnecessary work and memory churn.
> 
> To fix this issue introduce a helper function that will limit mTHP
> collapse support to two max_ptes_none values, 0 and HPAGE_PMD_NR - 1.
> This effectively supports two modes:
> 
> - max_ptes_none=0: never introduce new none-pages for mTHP collapse.
> - max_ptes_none=511 (on 4k pagesz): Always collapse to the highest
>   available mTHP order.
> 
> This removes the possiblilty of "creep", while not modifying any uAPI
> expectations. A warning will be emitted if any non-supported
> max_ptes_none value is configured with mTHP enabled.
> 
> The limits can be ignored by passing full_scan=true, this is useful for
> madvise_collapse (which ignores limits), or in the case of
> collapse_scan_pmd(), allows the full PMD to be scanned when mTHP
> collapse is available.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 8dab49c53128..f425238d5d4f 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -463,6 +463,44 @@ void __khugepaged_enter(struct mm_struct *mm)
>  		wake_up_interruptible(&khugepaged_wait);
>  }
>  
> +/**
> + * collapse_max_ptes_none - Calculate maximum allowed empty PTEs for collapse
> + * @order: The folio order being collapsed to
> + * @full_scan: Whether this is a full scan (ignore limits)
> + *
> + * For madvise-triggered collapses (full_scan=true), all limits are bypassed
> + * and allow up to HPAGE_PMD_NR - 1 empty PTEs.
> + *
> + * For PMD-sized collapses (order == HPAGE_PMD_ORDER), use the configured
> + * khugepaged_max_ptes_none value.
> + *
> + * For mTHP collapses, we currently only support khugepaged_max_pte_none values
> + * of 0 or (HPAGE_PMD_NR - 1). Any other value will emit a warning and no mTHP
> + * collapse will be attempted
> + *
> + * Return: Maximum number of empty PTEs allowed for the collapse operation
> + */
> +static unsigned int collapse_max_ptes_none(unsigned int order, bool full_scan)
> +{
> +	/* ignore max_ptes_none limits */
> +	if (full_scan)
> +		return HPAGE_PMD_NR - 1;
> +
> +	if (!is_mthp_order(order))
> +		return khugepaged_max_ptes_none;
> +
> +	/* Zero/non-present collapse disabled. */
> +	if (!khugepaged_max_ptes_none)
> +		return 0;
> +
> +	if (khugepaged_max_ptes_none == HPAGE_PMD_NR - 1)
> +		return (1 << order) - 1;
> +
> +	pr_warn_once("mTHP collapse only supports max_ptes_none values of 0 or %d\n",
> +		      HPAGE_PMD_NR - 1);
> +	return -EINVAL;
> +}
> +
>  void khugepaged_enter_vma(struct vm_area_struct *vma,
>  			  vm_flags_t vm_flags)
>  {
> @@ -550,7 +588,10 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  	pte_t *_pte;
>  	int none_or_zero = 0, shared = 0, result = SCAN_FAIL, referenced = 0;
>  	const unsigned long nr_pages = 1UL << order;
> -	int max_ptes_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
> +	int max_ptes_none = collapse_max_ptes_none(order, !cc->is_khugepaged);
> +
> +	if (max_ptes_none == -EINVAL)
> +		goto out;
>  
>  	for (_pte = pte; _pte < pte + nr_pages;
>  	     _pte++, addr += PAGE_SIZE) {

