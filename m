Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34395402BA1;
	Wed, 12 Aug 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526369; cv=none; b=RduLctJjVomWph1g/wYqMSeQzlmdpqyiqw0XMlk4zUE8YTpq4LMIbsRaKpRlGQyvxvW3c617YTLHprmuEO3DbmNaGbmMrvP3xK5gYF5EPOemN9wbU+fe5YI3kw84oh0ZGCpwWPhOinBfwlPCB/H3vDLOIRXQjqBXs9J2NWq3zb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526369; c=relaxed/simple;
	bh=VbIJIKq7AzqThcNa5HjGzFNl9Gu1Y7TNjnYBhmZ8zc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggHcxCNm8w9yLB+7I6AXyZDTD8QV/Td5bUbFZYJScXVH85FBzPI9387Oehk0KaMB7y5VEBu+Z5MH3KGUUGO4jlPe9DFQW/cb5Os2RjRavw3enlbbRJcB3xj6I8ZW5zyA9SQbXGxl/Q+kqy2kWj5RSmBXXLwpY9U8erXqd1nPnnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Ez5poWQF; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Ez5poWQF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786526362; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=CaCusDgVv2l8Ud0TpqaYcXSMcsXjIAmjWTTMpzz/8oc=;
	b=Ez5poWQFsiVlIWZNRch50Y9b1MjNjI1z/xJiAj1tFHwbC9bY1M0C6gUGItC3Q28DFXXNbZ1MWWEKJKGM4Nb3wx8Iw3vWDBmQ/qVkcIL3WooRtx9p6h1fagRwd+YvDH7oVm8cOqBHno15ss0GYdTJ4sRiK4/EmH9oNYrZRzgkB7c=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X8rG8n8_1786526359;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8rG8n8_1786526359 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Aug 2026 17:19:20 +0800
Message-ID: <f78bdc98-545f-46a7-9c99-a62807bbd2ac@linux.alibaba.com>
Date: Wed, 12 Aug 2026 17:19:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mm/khugepaged: extract reference check into
 folio_pte_referenced() helper
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/11/26 8:48 PM, Nico Pache (Red Hat) wrote:
> This change deduplicates the "is this PTE/folio referenced enough to be
> considered for a collapse" condition that was repeated in both
> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
> a single inline helper function.
> 
> Also move the comment and use it as the function header. While we are at
> it, updated the comment to clarify that a young pte is a recently accessed
> one.
> 
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> ---
>   mm/khugepaged.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 1e26ea97381a..8babd4c97db6 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -672,6 +672,22 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
>   	}
>   }
>   
> +/*
> + * folio_pte_referenced() - Check if a folio or its PTE mapping was recently used
> + *
> + * Return: true if recent access was observed through either the folio state
> + * or the current PTE mapping.
> + */
> +static inline bool folio_pte_referenced(struct folio *folio,
> +		struct vm_area_struct *vma, unsigned long addr, pte_t pteval)
> +{
> +	/* The folio was referenced previously ... */
> +	if (folio_test_young(folio) || folio_test_referenced(folio))
> +		return true;
> +	/* ... or the PTE mapping was recently used */
> +	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);
> +}

Thanks David for asking again to move the 'cc->is_khugepaged' out of 
this helper. I also suggested this before[1]. So

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

[1] 
https://lore.kernel.org/all/62b2bd29-28d2-4440-a970-526dd5d5bbe0@linux.alibaba.com/
