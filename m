Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737C324B24
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384456; cv=none; b=jy9fhxPyoFYdcKuI8jO6A52kkLwbI6MB5R5JRRwXYcpKR3AjS1PU30He7vmBHBGrjmvaF1kGgzEP8/2L33x5/zbPUJghtTp0c0iu5N1/uOiyv8/57h979eV4pIYVktws0iDj/GotSRzda/iRBHLuTLLHyxIs5Sw+u4XZDy/xhIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384456; c=relaxed/simple;
	bh=6F90Z/B4+XHJYNbHnnCtERYWPc7sBfMaOwh9bNDx2y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icfopGLcb+ia5x5bQdISQ2G2YnCFuTTT7JKI2wBjzBxTfKIBwnKxAD5DhTO9UYnBG1kQlOAKC6XhHmRt6ynhYnLj/9afP26pq4DmMnZYv42uaY5gwmm/kjlgVk3y0CEjJOdhWX+Tyyv98EkSZz99FdhR7t59wWhiO9oVN0/bs+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a6I57w+F; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a6I57w+F"
Message-ID: <98887861-b9d4-40a1-8c8a-6a417ba475f7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766384441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bBPeX7Ar3KjJmWOrZ53sv9OHVYJGt7MLMRb+n3qIAxw=;
	b=a6I57w+FpP1LTOnUo2hCbyON/oVPN47hQcGpaxVB2QMqNiv/wBM/t3XB9JGsvt3woOsSO0
	lCPQqEVfBvX2io1cpp8BxAwI68EZXLYCf5FNenyHhw2XuZIXrJ2god8unCv56ZNQlXwIdX
	6bbT6YxxsILb3rx4thOEq1vwxVEVfo0=
Date: Mon, 22 Dec 2025 14:20:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCHv2 14/14] hugetlb: Update vmemmap_dedup.rst
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-15-kas@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-15-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/12/18 23:09, Kiryl Shutsemau wrote:
> Update the documentation regarding vmemmap optimization for hugetlb to
> reflect the changes in how the kernel maps the tail pages.
>
> Fake heads no longer exist. Remove their description.
>
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>   Documentation/mm/vmemmap_dedup.rst | 60 +++++++++++++-----------------
>   1 file changed, 26 insertions(+), 34 deletions(-)
>
> diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
> index 1863d88d2dcb..a0c4c79d6922 100644
> --- a/Documentation/mm/vmemmap_dedup.rst
> +++ b/Documentation/mm/vmemmap_dedup.rst
> @@ -124,33 +124,35 @@ Here is how things look before optimization::
>    |           |
>    +-----------+
>   
> -The value of page->compound_info is the same for all tail pages. The first
> -page of ``struct page`` (page 0) associated with the HugeTLB page contains the 4
> -``struct page`` necessary to describe the HugeTLB. The only use of the remaining
> -pages of ``struct page`` (page 1 to page 7) is to point to page->compound_info.
> -Therefore, we can remap pages 1 to 7 to page 0. Only 1 page of ``struct page``
> -will be used for each HugeTLB page. This will allow us to free the remaining
> -7 pages to the buddy allocator.
> +The first page of ``struct page`` (page 0) associated with the HugeTLB page
> +contains the 4 ``struct page`` necessary to describe the HugeTLB. The remaining
> +pages of ``struct page`` (page 1 to page 7) are tail pages.
> +
> +The optimization is only applied when the size of the struct page is a power-of-2
> +In this case, all tail pages of the same order are identical. See
> +compound_head(). This allows us to remap the tail pages of the vmemmap to a
> +shared, read-only page. The head page is also remapped to a new page. This
> +allows the original vmemmap pages to be freed.

Replacing the head page is nice-to-have, so I think the details of
it should not mentioned here.

>   
>   Here is how things look after remapping::
>   
> -    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
> - +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
> - |           |                     |     0     | -------------> |     0     |
> - |           |                     +-----------+                +-----------+
> - |           |                     |     1     | ---------------^ ^ ^ ^ ^ ^ ^
> - |           |                     +-----------+                  | | | | | |
> - |           |                     |     2     | -----------------+ | | | | |
> - |           |                     +-----------+                    | | | | |
> - |           |                     |     3     | -------------------+ | | | |
> - |           |                     +-----------+                      | | | |
> - |           |                     |     4     | ---------------------+ | | |
> - |    PMD    |                     +-----------+                        | | |
> - |   level   |                     |     5     | -----------------------+ | |
> - |  mapping  |                     +-----------+                          | |
> - |           |                     |     6     | -------------------------+ |
> - |           |                     +-----------+                            |
> - |           |                     |     7     | ---------------------------+
> +    HugeTLB                  struct pages(8 pages)                 page frame
> + +-----------+ ---virt_to_page---> +-----------+   mapping to   +----------------+
> + |           |                     |     0     | -------------> |       0        |
> + |           |                     +-----------+                +----------------+
> + |           |                     |     1     | ------┐
> + |           |                     +-----------+       |
> + |           |                     |     2     | ------┼        +----------------+
> + |           |                     +-----------+       |        | vmemmap_tail   |
> + |           |                     |     3     | ------┼------> | shared for the |
> + |           |                     +-----------+       |        | struct hstate  |

I suggest using the following wording (since struct hstate and vmemmap_tail
are somewhat code-level implementation details).

     A single, per-node page frame shared among all hugepages of the 
same size

Thanks.
> + |           |                     |     4     | ------┼        +----------------+
> + |           |                     +-----------+       |
> + |           |                     |     5     | ------┼
> + |    PMD    |                     +-----------+       |
> + |   level   |                     |     6     | ------┼
> + |  mapping  |                     +-----------+       |
> + |           |                     |     7     | ------┘
>    |           |                     +-----------+
>    |           |
>    |           |
> @@ -172,16 +174,6 @@ The contiguous bit is used to increase the mapping size at the pmd and pte
>   (last) level. So this type of HugeTLB page can be optimized only when its
>   size of the ``struct page`` structs is greater than **1** page.
>   
> -Notice: The head vmemmap page is not freed to the buddy allocator and all
> -tail vmemmap pages are mapped to the head vmemmap page frame. So we can see
> -more than one ``struct page`` struct with ``PG_head`` (e.g. 8 per 2 MB HugeTLB
> -page) associated with each HugeTLB page. The ``compound_head()`` can handle
> -this correctly. There is only **one** head ``struct page``, the tail
> -``struct page`` with ``PG_head`` are fake head ``struct page``.  We need an
> -approach to distinguish between those two different types of ``struct page`` so
> -that ``compound_head()`` can return the real head ``struct page`` when the
> -parameter is the tail ``struct page`` but with ``PG_head``.
> -
>   Device DAX
>   ==========
>   

