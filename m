Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6303B27D6
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 07:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408720; cv=none; b=p3kaWLFKdmGyo2o+2BNQTqXJtmGfj+67o94N0MNGtXXaK/sMDaENNZjy8BBj5oEe5/Je2AJ7e+CY17CflsqWlSOgX6UN3B3hXNIsZ/ef5Lu4oPB9r1s1YBXkfkY6go2tkohll8qfBVVFCbF5tJL87UZC9KC7O6EKrcCcshZrCnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408720; c=relaxed/simple;
	bh=H5N/DG2voV/ywBHwsOfisBob5TWzPWC51svTx3r7l1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLUxBK49v9NSoZwZZgzytQRGQso682F6tBgxQqLakHsrcyi4KV/ohIdnEztQAWKi93FQ2HrD0F6Oqf6n4OHDockmjUA8qwbyxeSI4IQfwta2bfAKyBbJBf493NX6+3s8WhDxpVUZt8KTyZA88uvBsaslFY1gfGSRYWIHwCsaJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UXr1i359; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bl2gkibN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UXr1i359";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bl2gkibN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783408712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bx7b9iYZ9vYm18Zu21dfThw3RUT+c2jDNlVCLLvzOVg=;
	b=UXr1i3594QUFlpSV8z+aJpRn2j/fx7YjMfayKa1Uv+j5TQOcC70sECyAdWLhcm5M+V5YMK
	tCteL5f18AKSvwUvlep3sFQnXx0TvWRQLi5dc/UQ4kUVosfboEU8zY058E6uOC2vG4p/lk
	WbHTTOmmenadNTdLszUKpwzSiTiR35E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-hj69FZGJNlOFjwD1FAjRtQ-1; Tue, 07 Jul 2026 03:18:29 -0400
X-MC-Unique: hj69FZGJNlOFjwD1FAjRtQ-1
X-Mimecast-MFC-AGG-ID: hj69FZGJNlOFjwD1FAjRtQ_1783408708
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-476608a9fefso179958f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783408708; x=1784013508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx7b9iYZ9vYm18Zu21dfThw3RUT+c2jDNlVCLLvzOVg=;
        b=Bl2gkibNOC3SeTWoTStaP5RuCT2dPdZM2s1XHQ/3vs359p03FcMmF93FTl9qjE/jPQ
         hQQvmdpQ2eTs6dZILNQtTZx132WXJiFGXpm8/rIAny5pgMtX1+NM7bKMQvFpX7wWMDxx
         uX9LZiobSG7ipZr9V88nzSmCYgzfXsoHavHhnTDqYU8CI1SHpDAZ9wyAT9lRs0dl7rOO
         DLGDScHG/EOpSFnAgTVC/uccjt9CQjTdrYgQENe+WM/7z9frbAHCvjkAYJPn2EYGbhLH
         CpuM0wPcXDNbG7XoS2PjfqNKYmrgZjzxHFsiO25lFRnEKw0yj3HzL00sZWJGQOWPKRJU
         M0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408708; x=1784013508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx7b9iYZ9vYm18Zu21dfThw3RUT+c2jDNlVCLLvzOVg=;
        b=elslXy6ypE3veBuefTbv4QHmC70IH+sFpzQB+EetyAFjjDxwv+epU4kYTd725Gb9YQ
         LFTHYIz+h9HWEk8PXVcr3RkpQ4qgVIrCWLf2u2EquokcmvguNUu+W8CscdKX5u1ZjnCi
         1svn7BIzYDxyWzQjHa8GcGa9Vb2JslEPYMwlrY3mjKNZmYHCrfG/SccBW6/DVI6wFoGN
         qW6NHkHYO9kkiQLlSxaEo5rmU3MNnIMNtj9Ueq4Is5642+uSq2hDuUKopFh4E+AIS3Lc
         1FEioLthp9bS56Ro2bTJecyeIq8V7NLFQeT256D730EOhKxTW1bIzBoI/GOMUoPIsAtO
         tJRg==
X-Forwarded-Encrypted: i=1; AHgh+Rruzitxtf3GZoMhOo3lqr7BdyDyqNlLzUpzH+JWZ8IZukDT2dkKhkQn1yNWD+7pq+f3FrO3R4opl9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzkGwPTzWGtJuKHy74eb9fUpMB+GuZ5i4JtkSGrkGW394ByJZo
	KkvBZXMx199b7PhGQwT+Khvw+ubcNh3CQM5ltstSJvrW6nxH9KiUXvfY52aD2o8QqGYRxZYu15j
	ev+n3nODvmIxF0HaufX0X5Od/wzu6cHBAF7HiWTiOGvPjymdGOtYg7LB415bwYg==
X-Gm-Gg: AfdE7ckZiD1z1IY4SA8lsakjfeQD+RlP5o5z93jFzo/Qfp8BGWf5lPwLJtvyHNOM/Wa
	Ffa3uWu6WNMIuUxly2x6tmFziJ3XeOcDFA5H7Ns29cMDSE19UoPYHwsfClCmxW+kq5vgtPzM+3o
	7RNurzddf4JK/bTO5zcMp13Z4z5EPPIY7O//0OLt1CTwSBS+5E4ufOGb3+Vcv3zQt44BB9RWOtK
	cUlgvMcAOOy+MCysvrC5oBGz3UzFwubFqTWoiyj75EVudE5gZAyYsr7ZNB4EKniuWkp7ImvhMST
	xovmqmj3CoWm9xRO1nLZPNfguseTFnS5Bggfg7Ye6o6RClY5LEwacs09dcLZb3G/pVPmBAxUfPG
	F0m4RzU1Xm6hkM78gNXtD7pTeokpQ9yTf
X-Received: by 2002:a05:6000:43c6:20b0:474:4817:8c15 with SMTP id ffacd0b85a97d-47de9a446e0mr1123640f8f.26.1783408707952;
        Tue, 07 Jul 2026 00:18:27 -0700 (PDT)
X-Received: by 2002:a05:6000:43c6:20b0:474:4817:8c15 with SMTP id ffacd0b85a97d-47de9a446e0mr1123596f8f.26.1783408707388;
        Tue, 07 Jul 2026 00:18:27 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm32003544f8f.9.2026.07.07.00.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:18:26 -0700 (PDT)
Date: Tue, 7 Jul 2026 03:18:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sourav Panda <souravpanda@google.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, mhklinux@outlook.com, fvdl@google.com,
	gthelen@google.com, mike.kravetz@oracle.com,
	pasha.tatashin@soleen.com, rientjes@google.com, riel@surriel.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/6] mm/hugetlb: support free page reporting for cached
 hugepages
Message-ID: <20260707031039-mutt-send-email-mst@kernel.org>
References: <20260707064235.1386552-1-souravpanda@google.com>
 <20260707064235.1386552-7-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707064235.1386552-7-souravpanda@google.com>

Thanks for the patch! Yet something to improve:

On Tue, Jul 07, 2026 at 06:42:35AM +0000, Sourav Panda wrote:
> Implement free page reporting for the HugeTLB dynamic cache.
> 
> Register HugeTLB hstates with the page reporting framework if they
> support caching.
> 
> When pages are added to the cache (either via recycling in
> free_huge_folio or direct population via sysfs nr_cached_hugepages),
> trigger a page reporting cycle.
> 
> Page reporting isolates pages from the cache list, reports them to the
> hypervisor via virtio-balloon, and then drains them back to the cache
> list, marking them as reported (HPG_reported).
> 
> If a page is allocated from the cache, or reclaimed, clear the reported
> flag.
> 
> Signed-off-by: Sourav Panda <souravpanda@google.com>
> ---
>  include/linux/hugetlb.h        |  27 +++++++
>  include/linux/page_reporting.h |   1 +
>  mm/hugetlb.c                   | 125 +++++++++++++++++++++++++++++++++
>  mm/page_reporting.c            |  10 ++-
>  mm/page_reporting.h            |   6 ++
>  5 files changed, 163 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index e882c99780b6..bde23edcb803 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -587,6 +587,7 @@ enum hugetlb_page_flags {
>  	HPG_cma,
>  #ifdef CONFIG_HUGETLB_CACHE
>  	HPG_cached,
> +	HPG_reported,
>  #endif
>  	__NR_HPAGEFLAGS,
>  };
> @@ -650,10 +651,14 @@ HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
>  HPAGEFLAG(Cma, cma)
>  #ifdef CONFIG_HUGETLB_CACHE
>  HPAGEFLAG(Cached, cached)
> +HPAGEFLAG(Reported, reported)
>  #else
>  static inline bool folio_test_hugetlb_cached(const struct folio *folio) { return false; }
>  static inline void folio_clear_hugetlb_cached(struct folio *folio) { }
>  static inline void folio_set_hugetlb_cached(struct folio *folio) { }
> +static inline bool folio_test_hugetlb_reported(const struct folio *folio) { return false; }
> +static inline void folio_clear_hugetlb_reported(struct folio *folio) { }
> +static inline void folio_set_hugetlb_reported(struct folio *folio) { }
>  #endif
>  
>  #ifdef CONFIG_HUGETLB_PAGE
> @@ -1093,6 +1098,20 @@ void hugetlb_unregister_node(struct node *node);
>   */
>  bool is_raw_hwpoison_page_in_hugepage(struct page *page);
>  
> +#ifdef CONFIG_HUGETLB_CACHE
> +struct page_reporting_dev_info;
> +int hugetlb_page_reporting(struct page_reporting_dev_info *prdev,
> +			   struct scatterlist *sgl);
> +#else /* !CONFIG_HUGETLB_CACHE */
> +struct page_reporting_dev_info;
> +struct scatterlist;
> +static inline int hugetlb_page_reporting(struct page_reporting_dev_info *prdev,
> +					 struct scatterlist *sgl)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_HUGETLB_CACHE */
> +
>  static inline unsigned long huge_page_mask_align(struct file *file)
>  {
>  	return PAGE_MASK & ~huge_page_mask(hstate_file(file));
> @@ -1311,6 +1330,14 @@ static inline bool hugetlbfs_pagecache_present(
>  static inline void hugetlb_bootmem_alloc(void)
>  {
>  }
> +
> +struct page_reporting_dev_info;
> +struct scatterlist;
> +static inline int hugetlb_page_reporting(struct page_reporting_dev_info *prdev,
> +					 struct scatterlist *sgl)
> +{
> +	return 0;
> +}
>  #endif	/* CONFIG_HUGETLB_PAGE */
>  

why are there twice the stubs? And should this not depend on CONFIG_PAGE_REPORTING too?


>  static inline spinlock_t *huge_pte_lock(struct hstate *h,
> diff --git a/include/linux/page_reporting.h b/include/linux/page_reporting.h
> index 9d4ca5c218a0..bd5a5a293dc3 100644
> --- a/include/linux/page_reporting.h
> +++ b/include/linux/page_reporting.h
> @@ -27,4 +27,5 @@ struct page_reporting_dev_info {
>  /* Tear-down and bring-up for page reporting devices */
>  void page_reporting_unregister(struct page_reporting_dev_info *prdev);
>  int page_reporting_register(struct page_reporting_dev_info *prdev);
> +extern unsigned int page_reporting_order;

again why twice.


>  #endif /*_LINUX_PAGE_REPORTING_H */
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1bc0198a695c..110c566efc3b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -46,7 +46,9 @@
>  #include <linux/io.h>
>  #include <linux/node.h>
>  #include <linux/page_owner.h>
> +#include <linux/page_reporting.h>
>  #include "internal.h"
> +#include "page_reporting.h"
>  #include "hugetlb_vmemmap.h"
>  #include "hugetlb_cma.h"
>  #include "hugetlb_internal.h"
> @@ -1414,6 +1416,7 @@ static void hugetlb_cache_remove(struct hstate *h, struct folio *folio, bool to_
>  	list_del_init(&folio->lru);
>  	folio_clear_hugetlb_freed(folio);
>  	folio_clear_hugetlb_cached(folio);
> +	folio_clear_hugetlb_reported(folio);
>  	h->nr_cached_hugepages--;
>  	h->nr_cached_hugepages_node[nid]--;
>  	if (to_surplus) {
> @@ -1806,6 +1809,7 @@ void free_huge_folio(struct folio *folio)
>  		    !folio_test_hwpoison(folio)) {
>  			arch_clear_hugetlb_flags(folio);
>  			hugetlb_cache_add(h, folio, true);
> +			page_reporting_notify_free(h->order);
>  			spin_unlock_irqrestore(&hugetlb_lock, flags);
>  			return;
>  		}
> @@ -4231,6 +4235,7 @@ static int adjust_cached_huge_pages(struct hstate *h, long count, bool is_delta,
>  			account_new_hugetlb_folio(h, folio);
>  
>  			hugetlb_cache_add(h, folio, false);
> +			page_reporting_notify_free(h->order);
>  			spin_unlock_irq(&hugetlb_lock);
>  			cond_resched();
>  		}
> @@ -4310,6 +4315,7 @@ static int adjust_cached_huge_pages(struct hstate *h, long count, bool is_delta,
>  			account_new_hugetlb_folio(h, folio);
>  
>  			hugetlb_cache_add(h, folio, false);
> +			page_reporting_notify_free(h->order);
>  			spin_unlock_irq(&hugetlb_lock);
>  			cond_resched();
>  		}
> @@ -7763,3 +7769,122 @@ void fixup_hugetlb_reservations(struct vm_area_struct *vma)
>  	if (is_vm_hugetlb_page(vma))
>  		clear_vma_resv_huge_pages(vma);
>  }
> +
> +#ifdef CONFIG_HUGETLB_CACHE
> +static void page_reporting_drain_hugetlb(struct hstate *h,
> +					 struct scatterlist *sgl, unsigned int nents, bool reported)
> +{
> +	struct scatterlist *sg = sgl;
> +	unsigned int left = nents;
> +
> +	spin_lock_irq(&hugetlb_lock);
> +	do {
> +		struct page *page = sg_page(sg);
> +		struct folio *folio = page_folio(page);
> +
> +		hugetlb_cache_add(h, folio, false);
> +
> +		if (reported)
> +			folio_set_hugetlb_reported(folio);
> +	} while (--left && (sg = sg_next(sg)));
> +	spin_unlock_irq(&hugetlb_lock);
> +
> +	sg_init_table(sgl, nents);
> +}
> +
> +static int hugetlb_page_reporting_cycle(struct page_reporting_dev_info *prdev,
> +					struct hstate *h, int nid,
> +					struct scatterlist *sgl, unsigned int *offset)
> +{
> +	struct list_head *list = &h->hugepage_cache_lists[nid];
> +	unsigned int page_len = huge_page_size(h);
> +	struct folio *folio, *next;
> +	long budget = 100; /* Limit */

why 100? and "Limit"? What kind of comment is this?


> +	int err = 0;
> +
> +	if (list_empty(list))
> +		return err;
> +
> +	spin_lock_irq(&hugetlb_lock);
> +
> +	list_for_each_entry_safe(folio, next, list, lru) {
> +		if (folio_test_hugetlb_reported(folio))
> +			continue;
> +
> +		if (budget < 0) {
> +			atomic_set(&prdev->state, PAGE_REPORTING_REQUESTED);
> +			break;
> +		}
> +
> +		if (*offset) {
> +			/* Isolate */
> +			hugetlb_cache_remove(h, folio, false);

are you sure this is right? in patch 2 it is:
       if (folio_test_hugetlb_cached(folio) && list_empty(&folio->lru))
           return -EBUSY;
and hugetlb_cache_remove clears HPG_cached.


> +
> +			--(*offset);
> +			sg_set_page(&sgl[*offset], &folio->page, page_len, 0);
> +			continue;
> +		}
> +
> +		spin_unlock_irq(&hugetlb_lock);
> +
> +		err = prdev->report(prdev, sgl, PAGE_REPORTING_CAPACITY);
> +		if (!err) {
> +			pr_info("HugeTLB page reporting: reported %u pages of size %luKB\n",
> +				PAGE_REPORTING_CAPACITY, huge_page_size(h) / 1024);

seriously?

> +		}
> +
> +		*offset = PAGE_REPORTING_CAPACITY;
> +		budget--;
> +
> +		page_reporting_drain_hugetlb(h, sgl, PAGE_REPORTING_CAPACITY, !err);
> +
> +		spin_lock_irq(&hugetlb_lock);
> +
> +		if (list_empty(list))
> +			break;
> +		next = list_first_entry(list, struct folio, lru);
> +
> +		if (err)
> +			break;
> +	}
> +
> +	spin_unlock_irq(&hugetlb_lock);
> +	return err;
> +}
> +
> +int hugetlb_page_reporting(struct page_reporting_dev_info *prdev,
> +			   struct scatterlist *sgl)
> +{
> +	struct hstate *h;
> +	int err = 0;
> +	int nid;
> +
> +	for_each_hstate(h) {
> +		if (h->order < page_reporting_order)
> +			continue;
> +
> +		for_each_online_node(nid) {
> +			unsigned int offset = PAGE_REPORTING_CAPACITY;
> +
> +			err = hugetlb_page_reporting_cycle(prdev, h, nid, sgl, &offset);
> +			if (err)
> +				return err;
> +
> +			/* Report leftovers */
> +			unsigned int leftover = PAGE_REPORTING_CAPACITY - offset;
> +
> +			if (leftover) {
> +				struct scatterlist *sg = &sgl[offset];
> +
> +				err = prdev->report(prdev, sg, leftover);
> +				page_reporting_drain_hugetlb(h, sg, leftover, !err);
> +				if (err)
> +					return err;
> +				pr_info("HugeTLB page reporting: reported %u pages of size %luKB\n",
> +					leftover, huge_page_size(h) / 1024);

again

> +			}
> +		}
> +	}
> +	return 0;
> +}
> +#endif
> diff --git a/mm/page_reporting.c b/mm/page_reporting.c
> index 7418f2e500bb..882496b8b2c9 100644
> --- a/mm/page_reporting.c
> +++ b/mm/page_reporting.c
> @@ -2,6 +2,7 @@
>  #include <linux/mm.h>
>  #include <linux/mmzone.h>
>  #include <linux/page_reporting.h>
> +#include <linux/hugetlb.h>
>  #include <linux/gfp.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
> @@ -50,12 +51,6 @@ EXPORT_SYMBOL_GPL(page_reporting_order);
>  #define PAGE_REPORTING_DELAY	(2 * HZ)
>  static struct page_reporting_dev_info __rcu *pr_dev_info __read_mostly;
>  
> -enum {
> -	PAGE_REPORTING_IDLE = 0,
> -	PAGE_REPORTING_REQUESTED,
> -	PAGE_REPORTING_ACTIVE
> -};
> -
>  /* request page reporting */
>  static void
>  __page_reporting_request(struct page_reporting_dev_info *prdev)
> @@ -334,6 +329,9 @@ static void page_reporting_process(struct work_struct *work)
>  			break;
>  	}
>  
> +	if (!err)
> +		err = hugetlb_page_reporting(prdev, sgl);
> +
>  	kfree(sgl);
>  err_out:
>  	/*
> diff --git a/mm/page_reporting.h b/mm/page_reporting.h
> index c51dbc228b94..74e05af4bac1 100644
> --- a/mm/page_reporting.h
> +++ b/mm/page_reporting.h
> @@ -11,6 +11,12 @@
>  #include <linux/scatterlist.h>
>  
>  #ifdef CONFIG_PAGE_REPORTING
> +enum {
> +	PAGE_REPORTING_IDLE = 0,
> +	PAGE_REPORTING_REQUESTED,
> +	PAGE_REPORTING_ACTIVE
> +};
> +
>  DECLARE_STATIC_KEY_FALSE(page_reporting_enabled);
>  extern unsigned int page_reporting_order;
>  void __page_reporting_notify(void);
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog

