Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE3ABA34
	for <linux-doc@vger.kernel.org>; Wed,  6 Aug 2025 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754497950; cv=none; b=mOEuPJd4JDNad8sJlCFbj9QulV/0WT8oCbDGF0MPnJuwzdALvU2GdLytKwmQ9AenHH4EXlGW8aDfrVf7QObta6gbxS793W0cUcIWn2Vsmb9AW/V7NUc/AMgwrSqN+Jcf1XpAZ/6lQS3ONV8zS170Vutrokp+MJJ/BOA6qFbTsiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754497950; c=relaxed/simple;
	bh=8koxwrrrpXRQv68oFmk2nURbB1epOaqVtBKzW9mOwbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2pzfJBv6ZhCj7NTFCjOdrofxgQCTFsKyrz4NebTwoAUtvEVVY5pQcdxDQ6hsJ8DD+P1ArM7IAk4RF8bG1w5o6wHvKVdPC2DMmipKcqDID0FoGxY5n6SbHXC73ZZ17FdC4BtA9WuI0aUGjb85l1dYHAPCb5M3rru+2YCe6GLFRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=N3A6fT7P; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="N3A6fT7P"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b0770954faso1285351cf.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 09:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1754497947; x=1755102747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DczkdOzRVH8sA2mnIf+wryGp+DfW+r4oiu5gHq5d+os=;
        b=N3A6fT7P1jN9vYQPxniMneX3p/pY/qqymWujslq7w9F8zT8TglOmOum8uHWkP2TQUb
         m/UCvvEXHz8YXzBKWpe1z/fRhyxwbg/247WHP+Ui9juZeRwUGaIweYc/YKktTNzQDhF5
         sVdHto0MNVSXpGx1anDigcQgbi0xAs8iQafgGKyGL1gPa/lprSiNPANcVOsSM+EXOzOy
         /9WCL9+QgjI7Vc98DHXXXauVw6uI8wKhlggoOhtU6GMVusujYwEkAzvLXegj8EiHwLbc
         6sJsuKS413TnZTXe+YhZ/OUo3YFTousHYNPiQAP0oIBsRvh2INMHq6s4Xv4rquMfOqdn
         2d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754497947; x=1755102747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DczkdOzRVH8sA2mnIf+wryGp+DfW+r4oiu5gHq5d+os=;
        b=ileXBK2Nx9z1Eyo1ThqtlxKUHoyk/G43kT4miN6BYyxnop1MrL3oto7yesJsBr6Aqi
         fLspzOZ4fTjtdiCKjz4d5E1SKEQ6v2uzljm+fVD6+QojsdbxLk0i5PyUecI4PugfzpdY
         wGJEM2NDaJuLdZsQI9oQIUSOyADehFU4s8teo/jScFxDI9tLl/7Kiqp6DqeaziVN4Lse
         67562yocrPZhHgX2KFd2J/4584XPt4JqA3wOnO4JEQYa96uRVoekKBeMVT/zRsS1S0gV
         9j+i/wLKEcYR4DMerT4SwZzuLOm+DV9vT6OZHKnHcwwY7nTQuguQPEfOLjqWRRKzLcjB
         I6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWs9vW2Clwd1S6aATCxgEchHUSFkuJrdF2EbgwmmrdnGQmymHTwRtrRzBjvBu92/4TbEOw2i0QD+Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTq6yaipLsXoQAAEEIF3FFtVKE0xygqXC33aZ5OiyAREe3xmJw
	F8sTlcLVTvZSkELRcZy30Gnzx9TbQv0BqhrVtO2lSfhjwzP+EAM1eokHpLvYN7udzz0=
X-Gm-Gg: ASbGnctIBt01vq4qAljYEYHJi2XlawpN5ufk4dtl4bJyoghFntNr53Py1dK1idQza5S
	thZ6fz1emXbyhkGmQcV/Zwtx5r4h2mZJd5ec1qrJX9NHBREwauOfLTkYw4pW11rLUgf1fsSuhgL
	L/pwZBRNgTyhEEBJ2HB7ez6TPdWdYG5nKmBgvN/FqS67WvMKPYfw81FFffYNUABpkx+gwPD01Cd
	yiCaOBtcQru8H61jz3s3LUQSlWdTbHkmGPyohqOlP+I+O+pB1Zb0c78ZD0VdCVskNqsLnDmOXzl
	xp8oaVpCXdEwR98KrAnFiGg7w62oL8bqTbHLho/kPcrVQlQat/jGeZmZKQgXxkYkCmxlJ8bZJ/i
	DIHE64tpEvX1YnhBvUA/42s6oYwvsA42Z
X-Google-Smtp-Source: AGHT+IHC3hrESSBrcMoIOYxPNKtmK7006X0ZFbjOG06E52Szyt/nP4BqvqO0+YzYU4f3W7ZcXwwE4A==
X-Received: by 2002:a05:622a:1cca:b0:4af:1fb2:339c with SMTP id d75a77b69052e-4b091534932mr66831011cf.29.1754497945572;
        Wed, 06 Aug 2025 09:32:25 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4b09a2e6095sm5411891cf.33.2025.08.06.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 09:32:24 -0700 (PDT)
Date: Wed, 6 Aug 2025 12:32:21 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Yosry Ahmed <yosry.ahmed@linux.dev>, kernel-team@meta.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Takero Funaki <flintglass@gmail.com>
Subject: Re: [RFC PATCH v2] mm/zswap: store <PAGE_SIZE compression failed
 page as-is
Message-ID: <20250806163221.GA1795303@cmpxchg.org>
References: <20250805002954.1496-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805002954.1496-1-sj@kernel.org>

Hi SJ,

Overall this looks good to me. On top of the feedback provided by
others, I have a few comments below.

On Mon, Aug 04, 2025 at 05:29:54PM -0700, SeongJae Park wrote:
> @@ -142,6 +142,15 @@ User can enable it as follows::
>  This can be enabled at the boot time if ``CONFIG_ZSWAP_SHRINKER_DEFAULT_ON`` is
>  selected.
>  
> +If a page cannot be compressed into a size smaller than PAGE_SIZE, it can be
> +beneficial to save the content as is without compression, to keep the LRU
> +order.  Users can enable this behavior, as follows::
> +
> +  echo Y > /sys/module/zswap/parameters/save_incompressible_pages
> +
> +This is disabled by default, and doesn't change behavior of zswap writeback
> +disabled case.
> +
>  A debugfs interface is provided for various statistic about pool size, number
>  of pages stored, same-value filled pages and various counters for the reasons
>  pages are rejected.
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 7e02c760955f..6e196c9a4dba 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -129,6 +129,11 @@ static bool zswap_shrinker_enabled = IS_ENABLED(
>  		CONFIG_ZSWAP_SHRINKER_DEFAULT_ON);
>  module_param_named(shrinker_enabled, zswap_shrinker_enabled, bool, 0644);
>  
> +/* Enable/disable incompressible pages storing */
> +static bool zswap_save_incompressible_pages;
> +module_param_named(save_incompressible_pages, zswap_save_incompressible_pages,
> +		bool, 0644);

Please remove the knob and just make it the default behavior.

With writeback enabled, the current behavior is quite weird:
compressible pages to into zswap, then get written to swap in LRU
order. Incompressible pages get sent to swap directly. This is an
obvious age inversion, and the performance problems this has caused
was a motivating factor for the ability to disable writeback.

I don't think there is much point in keeping that as an officially
supported mode.

> @@ -937,6 +942,29 @@ static void acomp_ctx_put_unlock(struct crypto_acomp_ctx *acomp_ctx)
>  	mutex_unlock(&acomp_ctx->mutex);
>  }
>  
> +/*
> + * Determine whether to save given page as-is.
> + *
> + * If a page cannot be compressed into a size smaller than PAGE_SIZE, it can be
> + * beneficial to saving the content as is without compression, to keep the LRU
> + * order.  This can increase memory overhead from metadata, but in common zswap
> + * use cases where there are sufficient amount of compressible pages, the
> + * overhead should be not critical, and can be mitigated by the writeback.
> + * Also, the decompression overhead is optimized.
> + *
> + * When the writeback is disabled, however, the additional overhead could be
> + * problematic.  For the case, just return the failure.  swap_writeout() will
> + * put the page back to the active LRU list in the case.
> + */
> +static bool zswap_save_as_is(int comp_ret, unsigned int dlen,
> +		struct page *page)
> +{
> +	return zswap_save_incompressible_pages &&
> +			(comp_ret || dlen == PAGE_SIZE) &&
> +			mem_cgroup_zswap_writeback_enabled(
> +					folio_memcg(page_folio(page)));
> +}
> +
>  static bool zswap_compress(struct page *page, struct zswap_entry *entry,
>  			   struct zswap_pool *pool)
>  {

> @@ -1001,6 +1034,17 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
>  	return comp_ret == 0 && alloc_ret == 0;
>  }
>  
> +/*
> + * If save_incompressible_pages is set and writeback is enabled, incompressible
> + * pages are saved as is without compression.  For more details, refer to the
> + * comments of zswap_save_as_is().
> + */
> +static bool zswap_saved_as_is(struct zswap_entry *entry, struct folio *folio)
> +{
> +	return entry->length == PAGE_SIZE && zswap_save_incompressible_pages &&
> +		mem_cgroup_zswap_writeback_enabled(folio_memcg(folio));
> +}

I don't think there will be much left of these helpers once you
incorporate Nhat's feedback, but please open-code these in either
case. They're single user, hide what's going on, and the similar names
doesn't do them any favors.
