Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614460;
	b=jN477K3MNWzRo56fNRHxqh1G1AMgYKuF0puvp7ajsN5hieHlkpfiqlaOIxc2jG9KOcVf
	 khcEGEfOsz1MFOAzy65/hUy1V9FNKyLe3SBGcwYrKEosZ14USGHqpSO6fr1OEg2AkLFeq
	 glQYFIBD6GldgaWZBVy2eDf8MADNZwk1Exz5UUMm/o66AlFL2JwETIYP4H/JeSR4Bhk3A
	 I/3upZmvc2eZGEg2GQ99bqVmFP1afEiquKfD3NIFJHpkSkTJ43xLGVBSqtOGBM14+V7Jf
	 dtVJT5lvitnRJ8C0BW5Si/Rs0VKC7XP1DcbjvgXJzJGgwjyko8Ik7+sRxLlQMu/DloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tNd0IbaZQFJuxJS+R9ayDKLW68Bcl2zYZx6i5ipU+qg=;
	b=MXoMITlw+t8fyZAFTc7tBxKKxSOYagNghgGsxgn0lMuXeRo8clfeax0Zh2SJQbVlMe3V
	 Z7v5i1YG10Uea6tDDRKsyx35c74ES9uuyryJsOxEjHSjZyqgpO4cCwrHUSRzWn6t3buWC
	 R7K7X3L5NGxgoB2hctg0ay1wxWLey285vNw/fpFrSQxJcRuqCuaP1bvKnbFVUeMPzBE+s
	 g5pt24KBd09Lj1Ykve2aKa00uSbLbg0FVRaUXlzGWdtAuKrJot5w8941rNgXNaMMthVPL
	 woqyoM0MzaNhR3dju3nAstcz9WPIdpMLRl9BfIWhicSHn0sw+fM4he8A9O5Ir83c8mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuYMKNxx;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE2606A323
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AE2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuYMKNxx
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso3162630a91.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 05:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614458; x=1796219258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNd0IbaZQFJuxJS+R9ayDKLW68Bcl2zYZx6i5ipU+qg=;
        b=VuYMKNxxv+Zu001gmt0ClbtMscwdHC0CE2MvHQonG1WroM5WNV3+4ev5P/ikq9yzaN
         /z3DPQvGaBWTyXrWy/2CiALGqaY+6I4sQzGc6sQd4ciwPTy7HSpE88zRhePRLmfB+gFW
         URxUqWndcDH9Lnsq2OS1nW/Bju1TMfKWYwQh8UWOmr5+ZWXXPszX0GwG+fV/XiKM2pgX
         K4zNTgkaAPFBB6NL7Ll5ngyD8IITuEpfDCw3cQvuzjk71Kof+4DP9fciXTONoaiKzwtT
         36JN6x3tbK3xBpujkfjvg3gME9POl7NyxTuQRiDuzVfveQ1jTgXg/r5lFpzw0R1z+9bl
         H6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614458; x=1796219258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNd0IbaZQFJuxJS+R9ayDKLW68Bcl2zYZx6i5ipU+qg=;
        b=fF9sIC3EEwJoimfhgcIVzPnhw5WKG47YjRCYqRKqrcIK2Y/9GDahFhkjZGxuqFs4hk
         sF1RY62lHhYRdvDuOAE73Q+tYov5ZwV4tOZokt2ZaSO6CLLJCQyu92FW1b7ZV2CrITlV
         OUyOLs6PJbiwDOtFjB1iBX1HFi21nhnByFLvwWd1Zk3TkInJuWrg2y4HepM7uXzCbqmS
         Kft7afg63w+COcZUGlI7Pehp9b0vnqtfyuTWfk/LsTapE73fIZ4/3JInnY2rnL6L87jk
         Wrd9/GE5xSog4p1RKOxoIvuiTjKoVU38Ikx6wVwv5YJKlg1Gtf0CSJudz2g1eo5jgV+n
         sDDQ==
X-Forwarded-Encrypted: i=1; AL+hErG4JU8YUa7TRFyhLvqzQ/G8f7wcxt8U9Q/4A5floEAZc64gHPHrG2vNAV3+pMp6MU4YGSb2ySxe9PE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NHi+7o/6Bz9bq7RAyw2UkWOSn4pwaIndh4vqMAHuVhYoCmt9+
	2ch/IpSOg3Hp+I8ivAP6rvND3fwtp55InKI+fh9rfBYZOEppb7N/nHGc
X-Gm-Gg: AZFdTZdkpcUIipTvseFCBkXiqERLXwhVun3wcPYitvCUZCac4oMAiCs9nsB+wrR5dJW
	GWFd+FnJ/GB3hqeMS0xduEWQNhCjiDjD1cdcwonRnnWI/xCSkC2XbGlXvM7353LmTqev3t1BVwm
	7wlU3/R7JyocF5ttM7xaog6Km4/WbCtokvx2920JcaIpQVfXhLhLFRxPAAy6VchRa1hEwyKr35S
	Ean6SnjkPd9i2b5XakEVNlFfDWI3GQi4GldK72S296uOXt3ouLTJ2/TUZTijVR1LkzzM4viaKn+
	Hl18ylM9c3wlAymwJ3B63aob7Tld/v1P4Ee7DzrmHiypH6/FS7bPAgGBSExBX72VF26rGjzaXjX
	d195jhKnei885nCSFsnQvBGJHuHOudr+umQKf2H0qS1dUA94t5LNqaaN2DVt2vjoC9mF5OHsq9j
	var0jBw2w0Cgr1TtXCm1dnGeftyb0wXXTIHYrUQuJct13vgE/LAhZaJ7uMzJdUfUfNasPJfxhiS
	90g7IQGt/XO1hqrMLKxtsxEqt8vSJ8QwOserqU30vpQXkbAKAclgFYElKmQHsy919JqZJGN14Tj
	aV83Ej1Yc7aN6aRGAO8cd6UpNMmMhGDbqKuPxyEepG+j
X-Received: by 2002:a17:90a:d2cf:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b41c8e0507mr11255737a91.8.1795614458296;
        Wed, 25 Nov 2026 05:47:38 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm11786323a91.3.2026.11.25.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:47:37 -0800 (PST)
Date: Wed, 25 Nov 2026 21:47:18 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 10/18] mm/mglru, gup: mark folios referenced via a
 fast helper
Message-ID: <6c3d32a9-3004-4a17-b854-7088e69f164a@gmail.com>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-10-8ffea39934a6@tencent.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-mglru-fg-v6-10-8ffea39934a6@tencent.com>

On Tue, Nov 24, 2026 at 02:53:02AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
>
> Introduce folio_inc_lru_refs_fast(): raise refs from 0 to
> LRU_REFS_REFERENCED via cmpxchg, or just set PG_referenced for the
> classical LRU as before. No counter update or promotion is needed,
> nonzero MGLRU refs are left unchanged.
>
> The classical path is taken for a folio that is off the gen lists while
> MGLRU is off, not on lru_gen_enabled() alone: while MGLRU is being
> turned off, a folio can still be on a gen list after the static key
> flips, and setting PG_referenced there would bump its refs count.
>
> That check uses lru_get_gen_flags(), so move the helper out of the
> CONFIG_LRU_GEN block, it is now built with the option off, where
> LRU_GEN_WIDTH is 0 and LRU_GEN_MASK is zero. Keep the decoded value in
> an int so the subtraction of the offset-by-one encoding cannot fold to
> ULONG_MAX before it happens to avoid -Woverflow error with CONFIG_WERROR.
>
> This helper only aims to be fast, it exists so the gup fast path can
> stay a fast path. The new helper doesn't account for refs above
> LRU_REFS_REFERENCED but that's fine for now as GUP never used that
> or anything similar for CLRU either.
>
> Convert the gup fast-path sites. No behavior change for classical LRU,
> no regression for MGLRU either. Just prepare for the following changes
> by providing a helper that follows the new convention.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 62 +++++++++++++++++++++++++++++++++++------------
>  mm/gup.c                  |  6 ++---
>  2 files changed, 49 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index b15c3618a1f2..13c8b6bce349 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -105,6 +105,22 @@ static __always_inline enum lru_list folio_lru_list(const struct folio *folio)
>  	return lru;
>  }
>
> +/**
> + * lru_get_gen_flags - Return the LRU generation number from folio flags.
> + * @flags: folio flags
> + *
> + * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. Returns
> + * -1 if the flags indicate the folio is off the list (e.g., isolated).
> + */
> +static inline int lru_get_gen_flags(unsigned long flags)
> +{
> +	int gen = (int)((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF);
> +
> +	/* The gen is stored offset by one, so zero means off-list */
> +	VM_WARN_ON_ONCE(gen > MAX_NR_GENS);
> +	return gen - 1;
> +}
> +
>  #ifdef CONFIG_LRU_GEN
>
>  static inline bool lru_gen_switching(void)
> @@ -168,22 +184,6 @@ static inline void lru_set_gen_flags(unsigned long *flags, int gen)
>  	*flags |= (gen + 1UL) << LRU_GEN_PGOFF;
>  }
>
> -/**
> - * lru_get_gen_flags - Return the LRU generation number from folio flags.
> - * @flags: folio flags
> - *
> - * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. Returns
> - * -1 if the flags indicate the folio is off the list (e.g., isolated).
> - */
> -static inline int lru_get_gen_flags(unsigned long flags)
> -{
> -	int gen = ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> -
> -	/* Exclude the legal -1 from the unsigned MAX_NR_GENS comparison */
> -	VM_WARN_ON_ONCE(gen != -1 && gen >= MAX_NR_GENS);
> -	return gen;
> -}
> -
>  static inline int folio_lru_gen(const struct folio *folio)
>  {
>  	return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio, 0)));
> @@ -483,6 +483,36 @@ static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio,
>  }
>  #endif /* CONFIG_LRU_GEN */
>
> +/**
> + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> + * @folio: the folio
> + *
> + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> + * untouched. For a folio off the gen lists with MGLRU off, a plain
> + * PG_referenced set.
> + */
> +static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
> +{
> +	unsigned long new_flags, old_flags = READ_ONCE(*folio_flags(folio, 0));
> +	unsigned int refs;
> +
> +	do {
> +		refs = lru_get_refs_flags(old_flags);
> +		if (lru_get_gen_flags(old_flags) < 0 && !lru_gen_enabled()) {
> +			/* For CLRU, just do folio_set_referenced() */
> +			if (refs & LRU_REFS_REFERENCED)
> +				break;
> +			refs |= LRU_REFS_REFERENCED;
> +		} else {
> +			if (refs)
> +				break;
> +			refs = LRU_REFS_REFERENCED;
> +		}
> +		new_flags = old_flags;
> +		lru_set_refs_flags(&new_flags, refs);
> +	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
> +}

The implementation code of this function looks a bit convoluted.
Would it be better to simplify it into the following code?

	do {
		bool clru = !lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0;

		refs = lru_get_refs_flags(old_flags);
		if (clru ? (refs & LRU_REFS_REFERENCED) : refs)
			break;
		new_flags = old_flags;
		lru_set_refs_flags(&new_flags, refs | LRU_REFS_REFERENCED);
	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));

--
Cheers,
Vernon
