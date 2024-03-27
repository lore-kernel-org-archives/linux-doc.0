Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8645227
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 18:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711565987; cv=none; b=PbkcG3Ou6Kqe9y0ah3Sz9XscnPl3mcSj/V7L1ZGOAKzmqlTgXQTa7epB5KIREg2H+e92KpvJ5D1XJ5qgUUREfcSH1FVVdRCmTuDh2Va/bMDLVr40ePUZcnnJxtV7xnXreZWN1/mB5lrpI7AUo7y7D1OTvzmOkgYeKo0jSo0lKMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711565987; c=relaxed/simple;
	bh=8azF4n3xlloF/pn5jVHl9ZV/Oqp4SHxr24aeZEXOldY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjeyTrFOLd2Qxywo+AbQ2EkI0shPvzYFlzW/Edb6rYFTrbm5ceUgqBGRshDIvlEhhsMHOgF+mM6uTuv1+bljVgICbXbFJPbMJTHZdIQfvmjif8WdvZfT1NolrPwM5eBOXlfL1+7gfbwpyubvF1GgJF8wE8oU3cChMTDIEMvGU0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8iaonBF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8iaonBF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dde26f7e1dso1617345ad.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 11:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711565985; x=1712170785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZVffBVXWhCz9qmiNGNujqYZrrrvTpbqG3lC0K8t/00=;
        b=H8iaonBFZDq31QLNLb6LpwSxT7RpiOGm/esaou4Zx+B0t1lHLsU+SHKjD/MQ+fld3B
         fJWu0xF11Scva7JDB9l4i+RhqBOVoMd876MWoOfTnhXhR6qPfxU/FNfun2yVj6+HVoEm
         HYLl+RE+7jsDSCtBZDd4v4KYA7Q5O1ym68pQQy+TOzhn6gLOhFZ/jyEk/fWZif6BJWzk
         0/8bII6PYArP+2pmkek+H+wzIb+ng3oTq0JoLJc2BBCNAhcnBwrLivNv2XWWDOi8KAG4
         GMRP9ey4gIprHIjPDveVPHLyXtaHQ8h1cq8hBRbTxCr8yaBDA+tFCpWAEQ74ic3qUKs3
         7LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711565985; x=1712170785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZVffBVXWhCz9qmiNGNujqYZrrrvTpbqG3lC0K8t/00=;
        b=emsorDZ/2aEgiHCMqKvhdCtQhfU2eBy7JPKQfrweq2g63Cp+/SwcJUt9y3ygUdpmK5
         Vh6xDBasvxTuZ8dK7P6JUwHR24DkSadI4f+cU4ZuBV1sIjExE2l1BoL+OYFRlS0dScp8
         NSFE0hTxuHWLsz1ryvg+xWUQxtvAiRrFVslymptCHPe+dCCDAA69dVuX5hig4afGahGL
         vkAZDwJJo1egA4CrwHRtwkPVA7SKZpXE4895vAwYB2B7761vXIfXkI19DJ8HEstKiMLc
         uOGD3g6mjwouYF8WXOw/jpiD3+8qoTzE63JaXWh1dmcKZUrBP/dmFjmeuEsjYObNqZNs
         gLLg==
X-Forwarded-Encrypted: i=1; AJvYcCXGHZCUWmXaPwVIkDH4BmLUg9Rv+fpgTqJIhp5ijVBdJqhWG9WdMzzcC2+F7Co3NKXvW2hECom1R5gSohg9+oI/vKBoxiZ6QEyi
X-Gm-Message-State: AOJu0YyGfTILyABmxHOd7+Oem2UNf0Fdaran5XJaBHzoDLtUBV7B1ObH
	UIFKXrf6AiFB1yaZu7DKlSUo7vd3ZQ48fBTNhKCR+Y2C0ZO4xcIU
X-Google-Smtp-Source: AGHT+IEu6NRI4665V4QqT6JA1rNlK78B4RLmJGkjGvCHnkxb52MYIdkHZPWroH0KpiziXvS65ZMbWA==
X-Received: by 2002:a17:903:186:b0:1e0:b562:b229 with SMTP id z6-20020a170903018600b001e0b562b229mr634154plg.47.1711565984939;
        Wed, 27 Mar 2024 11:59:44 -0700 (PDT)
Received: from fedora (c-73-170-51-167.hsd1.ca.comcast.net. [73.170.51.167])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902eacc00b001dc3c3be4adsm9357305pld.297.2024.03.27.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:59:44 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:59:42 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, willy@infradead.org,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 1/6] mm: migrate: add isolate_movable_folio()
Message-ID: <ZgRsntOMz0R2LdqJ@fedora>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-2-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327141034.3712697-2-wangkefeng.wang@huawei.com>

On Wed, Mar 27, 2024 at 10:10:29PM +0800, Kefeng Wang wrote:
> Like isolate_lru_page(), make isolate_movable_page() as a wrapper
> around isolate_lru_folio(), since isolate_movable_page() always
> fails on a tail page, add a warn for tail page and return immediately.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  include/linux/migrate.h |  3 +++
>  mm/migrate.c            | 41 +++++++++++++++++++++++------------------
>  2 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index f9d92482d117..a6c38ee7246a 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -70,6 +70,7 @@ int migrate_pages(struct list_head *l, new_folio_t new, free_folio_t free,
>  		  unsigned int *ret_succeeded);
>  struct folio *alloc_migration_target(struct folio *src, unsigned long private);
>  bool isolate_movable_page(struct page *page, isolate_mode_t mode);
> +bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode);
>  
>  int migrate_huge_page_move_mapping(struct address_space *mapping,
>  		struct folio *dst, struct folio *src);
> @@ -91,6 +92,8 @@ static inline struct folio *alloc_migration_target(struct folio *src,
>  	{ return NULL; }
>  static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>  	{ return false; }
> +static inline bool isolate_movable_folio(struct page *page, isolate_mode_t mode)
> +	{ return false; }

Wrong argument here.

>  
>  static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
>  				  struct folio *dst, struct folio *src)
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 2228ca681afb..b2195b6ff32c 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -57,31 +57,29 @@
>  
>  #include "internal.h"
>  
> -bool isolate_movable_page(struct page *page, isolate_mode_t mode)
> +bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode)
>  {
> -	struct folio *folio = folio_get_nontail_page(page);
>  	const struct movable_operations *mops;
>  
>  	/*
> -	 * Avoid burning cycles with pages that are yet under __free_pages(),
> +	 * Avoid burning cycles with folios that are yet under __free_pages(),
>  	 * or just got freed under us.
>  	 *
> -	 * In case we 'win' a race for a movable page being freed under us and
> +	 * In case we 'win' a race for a movable folio being freed under us and
>  	 * raise its refcount preventing __free_pages() from doing its job
> -	 * the put_page() at the end of this block will take care of
> -	 * release this page, thus avoiding a nasty leakage.
> +	 * the folio_put() at the end of this block will take care of
> +	 * release this folio, thus avoiding a nasty leakage.
>  	 */
> -	if (!folio)
> -		goto out;
> +	folio_get(folio);
>  
>  	if (unlikely(folio_test_slab(folio)))
>  		goto out_putfolio;
>  	/* Pairs with smp_wmb() in slab freeing, e.g. SLUB's __free_slab() */
>  	smp_rmb();
>  	/*
> -	 * Check movable flag before taking the page lock because
> -	 * we use non-atomic bitops on newly allocated page flags so
> -	 * unconditionally grabbing the lock ruins page's owner side.
> +	 * Check movable flag before taking the folio lock because
> +	 * we use non-atomic bitops on newly allocated folio flags so
> +	 * unconditionally grabbing the lock ruins folio's owner side.
>  	 */
>  	if (unlikely(!__folio_test_movable(folio)))
>  		goto out_putfolio;
> @@ -91,13 +89,13 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>  		goto out_putfolio;
>  
>  	/*
> -	 * As movable pages are not isolated from LRU lists, concurrent
> -	 * compaction threads can race against page migration functions
> -	 * as well as race against the releasing a page.
> +	 * As movable folios are not isolated from LRU lists, concurrent
> +	 * compaction threads can race against folio migration functions
> +	 * as well as race against the releasing a folio.
>  	 *
> -	 * In order to avoid having an already isolated movable page
> +	 * In order to avoid having an already isolated movable folio
>  	 * being (wrongly) re-isolated while it is under migration,
> -	 * or to avoid attempting to isolate pages being released,
> +	 * or to avoid attempting to isolate folios being released,
>  	 * lets be sure we have the page lock
>  	 * before proceeding with the movable page isolation steps.
>  	 */
> @@ -113,7 +111,7 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>  	if (!mops->isolate_page(&folio->page, mode))
>  		goto out_no_isolated;
>  
> -	/* Driver shouldn't use PG_isolated bit of page->flags */
> +	/* Driver shouldn't use PG_isolated bit of folio->flags */
>  	WARN_ON_ONCE(folio_test_isolated(folio));
>  	folio_set_isolated(folio);
>  	folio_unlock(folio);
> @@ -124,10 +122,17 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>  	folio_unlock(folio);
>  out_putfolio:
>  	folio_put(folio);
> -out:
>  	return false;
>  }
>  
> +bool isolate_movable_page(struct page *page, isolate_mode_t mode)
> +{
> +	if (WARN_RATELIMIT(PageTail(page), "trying to isolate tail page"))
> +		return false;

This warning doesn't make sense. As of now, we still isolate_movable_page()
to be able to take in a tail page, we just don't want to operate on it.

> +	return isolate_movable_folio((struct folio *)page, mode);
> +}
> +
>  static void putback_movable_folio(struct folio *folio)
>  {
>  	const struct movable_operations *mops = folio_movable_ops(folio);
> -- 
> 2.27.0
> 
