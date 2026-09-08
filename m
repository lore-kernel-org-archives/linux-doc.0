Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD03E5577
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855608; cv=none; b=W3+PzTK8c9wEGk2tvkp7UNd/v3fckHgX90adXezrgBJKOKcloDxOKFjrKty2Mb6wz7AQIFX00t+cdr8Lv9Mcrfgq5ue3b9G7zTecZycEZ/OEXpJEFhuCqaouSjw1z/F0K7hBCNOpkzRvx6fYn+I7NCKxCNKqwAZ0thpT4KyAcZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855608; c=relaxed/simple;
	bh=QMukAefZfPUgbpBQK+irv5yH2EpRpWK4MHebJsSatzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnCeDvdEqpot9a9kZAYTb3/Gk9tDhnAdthgmTiknbs6GvtKcK2r4XptpPFI3FnCaNli+qhPXXuY09yjKrDduW0EKFrfL8TtIwx05kqgeuGB5t8TUvQdS/7oGgKDKzhy37c8LIv9s76es+NGo8L8TlpVFm3a28IW/5rsby71XtW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xg67lryN; arc=none smtp.client-ip=91.218.175.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xg67lryN"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QMukAefZfPUgbpBQK+irv5yH2EpRpWK4MHebJsSatzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788855601; v=1; x=1789460401;
 b=xg67lryNA+Q2GIQcWChikiwvGDVB5I/S93Sd26sq96BTE/kh8Rzxg/uGEcWxjtJJy7gQuO0Z
 6xh21eSrq0e+k+xIAZ/gtYqzg0+08NwhNoIF5ongyhDH1TtWg4V6NuWZVFPVq4033Ah9vbQj5KF
 1w/5fxtvwaUdKVlmf6c+WHic=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e3be1945dc93c990;
	Tue, 08 Sep 2026 08:20:01 +0000
X-Mizu-Trace-ID: e3be1945dc93c990
X-Migadu-Flow: FLOW_OUT
Message-ID: <99aac41d-a68f-451b-ae10-f7132bb7a291@linux.dev>
Date: Tue, 8 Sep 2026 16:19:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] mm/sparse-vmemmap: move HVO helpers to a public
 header
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908030335.96549-8-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260908030335.96549-8-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 11:03 AM, Muchun Song wrote:
> The vmemmap optimization helpers currently live in mm/sparse.h,
> which is an internal MM header. That works for MM code, but
> prevents powerpc from using the same interfaces without including a
> private header.
> 
> Move the declarations and inline helpers to
> include/linux/vmemmap-optimization.h. This is a preparatory change for
> powerpc, which has its own vmemmap optimization implementation and
> needs to use the HVO interfaces from architecture code.

Make sense.

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Fix missing header dependencies.
> ---
>   MAINTAINERS                          |  1 +
>   include/linux/vmemmap-optimization.h | 91 ++++++++++++++++++++++++++++
>   mm/hugetlb.c                         |  2 +-
>   mm/hugetlb_vmemmap.c                 |  2 +-
>   mm/memory_hotplug.c                  |  1 +
>   mm/sparse.h                          | 73 +---------------------
>   6 files changed, 96 insertions(+), 74 deletions(-)
>   create mode 100644 include/linux/vmemmap-optimization.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c7aaa2e4790e..2985286cbbbf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12096,6 +12096,7 @@ F:	Documentation/mm/hugetlbfs_reserv.rst
>   F:	Documentation/mm/vmemmap_dedup.rst
>   F:	fs/hugetlbfs/
>   F:	include/linux/hugetlb.h
> +F:	include/linux/vmemmap-optimization.h
>   F:	include/trace/events/hugetlbfs.h
>   F:	mm/hugetlb.c
>   F:	mm/hugetlb_cgroup.c
> diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
> new file mode 100644
> index 000000000000..492dc662aae7
> --- /dev/null
> +++ b/include/linux/vmemmap-optimization.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * vmemmap-optimization.h
> + *
> + * Generic vmemmap optimization declarations.
> + *
> + * Author: Muchun Song <songmuchun@bytedance.com>
> + */
> +#ifndef _LINUX_VMEMMAP_OPTIMIZATION_H
> +#define _LINUX_VMEMMAP_OPTIMIZATION_H
> +
> +#include <linux/align.h>
> +#include <linux/log2.h>
> +#include <linux/mmdebug.h>
> +#include <linux/mmzone.h>
> +
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
> +static inline unsigned int section_order(const struct mem_section *section)
> +{
> +	return section->order;
> +}
> +
> +static inline void section_set_order(struct mem_section *section, unsigned int order)
> +{
> +	VM_WARN_ON(section_order(section) && order && section_order(section) != order);
> +	section->order = order;
> +}
> +
> +static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
> +					   unsigned int order)
> +{
> +	unsigned long section_nr = pfn_to_section_nr(pfn);
> +
> +	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
> +		return;
> +
> +	for (unsigned long i = 0; i < nr_pages / PAGES_PER_SECTION; i++)
> +		section_set_order(__nr_to_section(section_nr + i), order);
> +}
> +
> +static inline unsigned int pfn_to_section_order(unsigned long pfn)
> +{
> +	return section_order(__pfn_to_section(pfn));
> +}
> +#else
> +static inline unsigned int section_order(const struct mem_section *section)
> +{
> +	return 0;
> +}
> +
> +static inline void section_set_order(struct mem_section *section, unsigned int order)
> +{
> +}
> +
> +static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
> +					   unsigned int order)
> +{
> +}
> +
> +static inline unsigned int pfn_to_section_order(unsigned long pfn)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION */
> +
> +static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
> +{
> +	const unsigned int order = pfn_to_section_order(pfn);
> +	const unsigned long nr_pages = 1UL << order;
> +
> +	if (!is_power_of_2(sizeof(struct page)))
> +		return false;
> +
> +	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
> +}
> +
> +static inline bool vmemmap_optimizable_order(unsigned int order)
> +{
> +	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
> +		return false;
> +
> +	if (!is_power_of_2(sizeof(struct page)))
> +		return false;
> +
> +	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
> +}
> +
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
> +#endif /* CONFIG_SPARSEMEM_VMEMMAP */
> +#endif /* _LINUX_VMEMMAP_OPTIMIZATION_H */
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index fda525bccf50..dff915e6c48b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -38,6 +38,7 @@
>   #include <linux/mm_inline.h>
>   #include <linux/padata.h>
>   #include <linux/pgalloc.h>
> +#include <linux/vmemmap-optimization.h>
>   
>   #include <asm/page.h>
>   #include <asm/tlb.h>
> @@ -52,7 +53,6 @@
>   #include "hugetlb_cma.h"
>   #include "hugetlb_internal.h"
>   #include "mm_init.h"
> -#include "sparse.h"
>   #include <linux/page-isolation.h>
>   
>   #define HUGE_BOOTMEM_ZONES_VALID	BIT(0)
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 4a57e6c3352c..25c4e7d2664c 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -15,10 +15,10 @@
>   #include <linux/mmdebug.h>
>   #include <linux/pagewalk.h>
>   #include <linux/pgalloc.h>
> +#include <linux/vmemmap-optimization.h>
>   
>   #include <asm/tlbflush.h>
>   #include "hugetlb_vmemmap.h"
> -#include "sparse.h"
>   #include "internal.h"
>   
>   /**
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 0db0379826df..d7a59167bec4 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -43,6 +43,7 @@
>   #include "mm_init.h"
>   #include "page_alloc.h"
>   #include "shuffle.h"
> +#include "sparse.h"
>   
>   enum {
>   	MEMMAP_ON_MEMORY_DISABLE = 0,
> diff --git a/mm/sparse.h b/mm/sparse.h
> index 59b825df83b9..e511d99fc26b 100644
> --- a/mm/sparse.h
> +++ b/mm/sparse.h
> @@ -9,77 +9,7 @@
>   #define __MM_SPARSE_H
>   
>   #include <linux/mmzone.h>
> -
> -#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
> -static inline unsigned int section_order(const struct mem_section *section)
> -{
> -	return section->order;
> -}
> -
> -static inline void section_set_order(struct mem_section *section, unsigned int order)
> -{
> -	VM_WARN_ON(section_order(section) && order && section_order(section) != order);
> -	section->order = order;
> -}
> -
> -static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
> -					   unsigned int order)
> -{
> -	unsigned long section_nr = pfn_to_section_nr(pfn);
> -
> -	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
> -		return;
> -
> -	for (unsigned long i = 0; i < nr_pages / PAGES_PER_SECTION; i++)
> -		section_set_order(__nr_to_section(section_nr + i), order);
> -}
> -
> -static inline unsigned int pfn_to_section_order(unsigned long pfn)
> -{
> -	return section_order(__pfn_to_section(pfn));
> -}
> -#else
> -static inline unsigned int section_order(const struct mem_section *section)
> -{
> -	return 0;
> -}
> -
> -static inline void section_set_order(struct mem_section *section, unsigned int order)
> -{
> -}
> -
> -static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
> -					   unsigned int order)
> -{
> -}
> -
> -static inline unsigned int pfn_to_section_order(unsigned long pfn)
> -{
> -	return 0;
> -}
> -#endif
> -
> -static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
> -{
> -	const unsigned int order = pfn_to_section_order(pfn);
> -	const unsigned long nr_pages = 1UL << order;
> -
> -	if (!is_power_of_2(sizeof(struct page)))
> -		return false;
> -
> -	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
> -}
> -
> -static inline bool vmemmap_optimizable_order(unsigned int order)
> -{
> -	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
> -		return false;
> -
> -	if (!is_power_of_2(sizeof(struct page)))
> -		return false;
> -
> -	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
> -}
> +#include <linux/vmemmap-optimization.h>
>   
>   /*
>    * mm/sparse.c
> @@ -139,7 +69,6 @@ static inline void sparse_sections_init(void) {}
>    * mm/sparse-vmemmap.c
>    */
>   #ifdef CONFIG_SPARSEMEM_VMEMMAP
> -struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
>   void sparse_init_subsection_map(void);
>   int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
>   		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);

