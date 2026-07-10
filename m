Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E233B0AF7;
	Fri, 10 Jul 2026 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669271; cv=none; b=IwX59IUNWIstVa2Akx3o+zYbu8b7mkzKeXQMwi4hFhR4ehkbpONoON5dlsddsCO5f0JisFYd05uI/3zh5PSdF5echbpCTM+i+Gaheouf39QOkD2tKzYDZHoDemafEKThxeWxCl9kkb8+TL+/u5nEocya8brqgbhbK/tgZEL41Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669271; c=relaxed/simple;
	bh=7dN0xAiW/Xi0NCTyYphfoIdDMtCKX6DEVzSlId1Zqxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+o2NnnCI5guuOmCJvYBC0cVFfVENwNGVtgeVxhhABgh5BqhPy3Uhp8ZRJHVbZau94JNvPJjxgiN4ddnfb31g/pcEkWSQtD6bREvEDc9mvFcFfxBWZHCT8GXpsmdLdNp5SY+4mM4zm0sVnlLYEcHkklALeY5trr+FInunpN6L5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=IN5u/QlO; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="IN5u/QlO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783669265; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=K4f52g3k8n6R01YhWkm7BaroZo2smbRn1rvCWyLLPxs=;
	b=IN5u/QlOcoit2ggnJzSvotR3uZcIJ1AuVzKUTQsm4qNa7hIPskBtAdm/8Rtc6xEGSLY63VMl9dJkSek9tiYPyAscf3oTzpK+QwG2KZl89LiKQLsFjfiuuViusjcz+G2x9qyvsmJ1UqwmvisUbVFvr2FEaBq1eaSFJVmLVcd1ziI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R521e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X6n07c2_1783669262;
Received: from 30.74.144.121(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X6n07c2_1783669262 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Jul 2026 15:41:03 +0800
Message-ID: <62b2bd29-28d2-4440-a970-526dd5d5bbe0@linux.alibaba.com>
Date: Fri, 10 Jul 2026 15:41:00 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] mm/khugepaged: extract young page check into
 collapse_is_young() helper
To: Nico Pache <npache@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260706154500.39178-1-npache@redhat.com>
 <20260706154500.39178-3-npache@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260706154500.39178-3-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/6/26 11:44 PM, Nico Pache wrote:
> The change deduplicates the "is this PTE young enough to count as
> referenced" condition that was repeated in both
> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
> a single inline helper function.
> 
> Also move the comment and use it as the function header. While we are at
> it, updated the comment to clarify that a young pte is a recently accessed
> one.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>   mm/khugepaged.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index b3985b854e77..48b008a3c891 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -675,6 +675,23 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
>   	}
>   }
>   
> +/*
> + * collapse_is_young() - Check for enough young pte to justify collapsing
> + *
> + * If collapse was initiated by khugepaged, check that the page has been
> + * recently accessed (young pte) to justify collapsing the page.
> + *
> + * Return: true if the page has been recently accessed (young pte).
> + */
> +static inline bool collapse_is_young(struct collapse_control *cc, pte_t pteval,
> +	struct folio *folio, struct vm_area_struct *vma, unsigned long addr)
> +{
> +	return cc->is_khugepaged &&
> +	       (pte_young(pteval) || folio_test_young(folio) ||
> +		folio_test_referenced(folio) ||
> +		mmu_notifier_test_young(vma->vm_mm, addr));
> +}

collapse_is_young() is somewhat confusing to me. Would using 
'referenced' be a more appropriate name? collapse_folio_is_referenced()?

Also, it feels odd to put 'cc->is_khugepaged' in a helper whose purpose 
is to check whether a folio has been accessed. I think this helper 
should be more self-contained and focused solely on checking whether the 
folio was accessed.

Just my 2 cents.
