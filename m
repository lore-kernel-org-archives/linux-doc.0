Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B630DEDE
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833245; cv=none; b=icYo168d7EMe1M+fR1Ndoa2/242RRCKxgIwcGHzcEY/huOrh5lBT4oZkqlC0XSYHaRDJhpnSiermRiEhPDkOoTAZBQdFs8IvhLhrbttet2bDsgmagJvRsYfC85ja2Igy1wusMpNJnfgNLPkess4X3t1ijebLThPeNvxPN6qsnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833245; c=relaxed/simple;
	bh=TCRIkuIVcSPxZmn5Et7klCCCOJga45LGLAby2VGOqVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYu9mGkpYpL8GdvdP6mnQJitWPmS6o8RtGLXaI2mGf6OS/pwBo/kUYaBw6y6m+R/wcWQzd5USm/jT/ywE+2NjpZsR454YgGuuU95LjZcrm178HWAzSaEYAqT1dk8NvY2TVdVfns8ZTOk97dQ88DA76T/UzxjMCowO9EMdv+UyIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=sy3Oehfr; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="sy3Oehfr"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b25dd7ab33so244135385a.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1765833242; x=1766438042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sprp7N31vRBp7VCcAwUpV7y0XcoygDpCbBqecnhH9uE=;
        b=sy3OehfrbW8Mw+6oIZlkj1cJwoZvmYPChowvraxWDle3GbeQJR/L9bq3Xi/QxfpiAb
         P5bNVO06zTellv8iW8qvxYOhzNsdMYI6TQh9Bp5mesnJapKZc1WGvUs/Qd9LEHJ/HZcf
         M6UrrwFooFmmcZFR7alMdt5gn98VB9dY88F2uYpe6QYCo0RQzRU4G3BWFXoa7Wf6EDFZ
         K7HzBytufC8ZiaH6AcR9u/zmzRIENujUcHiVc1vl4nYxulokSZWIiOREneCeTcE8lX0p
         7rKOwDkS92HFKqeEgDt/PiQ9rG1vz+DqlY0Q1Zgatfb4VzbZ1lb9UX5w9OPbTudiQCnW
         MKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765833242; x=1766438042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sprp7N31vRBp7VCcAwUpV7y0XcoygDpCbBqecnhH9uE=;
        b=F6dUdMjJpvk87KCkiTDmlovomtDC0Un9rW0usLzEsk40LBBnhfej/KrgjCzlFf9TcK
         OU76DYGpE3Xtw8CASOWEitxw+pNB+mXgTLzpTW7fuJUV8gh3IdtIEbcKrfQ3ljOY8F8v
         orxOGXIWyj5gLIBqvVSKcoKLVnW4f8Z9uiupmvB3ghw8cbtp6Jr30pqnZ8CPmTvYTC9s
         IxmwI9LcnF3nueaBoOgQADfgaL7eG6Kbho7YPj6vLPY4DqhtuacjrH8JwCqmQJkV241O
         noSdxjC8Rdz72C6hGHqpmxIrNkVHpf7rn5AwYLVOPUZRDejL3zm3ztKV2wSJd4jDadN1
         7OOw==
X-Forwarded-Encrypted: i=1; AJvYcCVL+NL0xa1G+aVnHM0F+xcSXgBQLfbJ/sE30ulMV1JtsZOTXutuKe7mRU0H6vey4OQSw4kwsMF49Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YywV1qX+5Ct8KpT/ykQa9xv7aA5+4hJwucSMrlRzGNIGZliVkqV
	nBaXa/qMOeIcTXaEx0J5OxuYSN86MRO3/Ai44K2f3+vWxRX+68wIzR6DShb9IVA61p4=
X-Gm-Gg: AY/fxX6XXOajPdunVU49hSGlWgZeqyaXnFy/ce/tVZCYhSUJie2ld8Q22NYjs7g35fz
	ewmy4WvcqTsDvhLeRPqdMKv+Z2JtHv3i3JQXkTgDJbxKQjaZJRnm1sHQ1eiTZudIOW6TajLTmAv
	1DbsnQsi4HZHfb20ZACeF3MUZCeUB5zSUcGRd6RN7AzT/dADkN1mFQDzvAEpB7SGQm2+u/is8jh
	30QYtHPlittKL6b9+gUSsF7ke0tG4wqQDf1SUMVPeSqDhWtXADl4QMS8PPaqk+MHACLoSxMQmEx
	GnYsP96eRIDwhO8+E8ClERI8tvEYuTCqEa141RkcUa2ZE722FYpGGfdDnUsK8OiBLtUcgICCHju
	pYCNz2OvvH7i4mzRKG1S5PmVN4mDxUpotOHfbLaYnxd6D/znkU5EnK7Z8/5EkirEKUC4lcEL4Jp
	S2Y1pDFwhkeA==
X-Google-Smtp-Source: AGHT+IHZwGOmPvX/ipW2v8YF+vbttYdToKCmV+QF3O0fIsJWdhQfh5G0IVQ6AYKNvskI6a+jEMbH0g==
X-Received: by 2002:a05:620a:2a01:b0:8b2:1568:82e8 with SMTP id af79cd13be357-8bb39fb6365mr1568864485a.35.1765833241963;
        Mon, 15 Dec 2025 13:14:01 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:929a:4aff:fe16:c778])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be303e7e51sm37195385a.7.2025.12.15.13.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 13:14:01 -0800 (PST)
Date: Mon, 15 Dec 2025 16:13:57 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, zhengqi.arch@bytedance.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	lujialin4@huawei.com, zhongjinji@honor.com
Subject: Re: [PATCH -next 3/5] mm/mglru: extend shrink_one for both lrugen
 and non-lrugen
Message-ID: <20251215211357.GF905277@cmpxchg.org>
References: <20251209012557.1949239-1-chenridong@huaweicloud.com>
 <20251209012557.1949239-4-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209012557.1949239-4-chenridong@huaweicloud.com>

On Tue, Dec 09, 2025 at 01:25:55AM +0000, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> Currently, flush_reclaim_state is placed differently between
> shrink_node_memcgs and shrink_many. shrink_many (only used for gen-LRU)
> calls it after each lruvec is shrunk, while shrink_node_memcgs calls it
> only after all lruvecs have been shrunk.
> 
> This patch moves flush_reclaim_state into shrink_node_memcgs and calls it
> after each lruvec. This unifies the behavior and is reasonable because:
> 
> 1. flush_reclaim_state adds current->reclaim_state->reclaimed to
>    sc->nr_reclaimed.
> 2. For non-MGLRU root reclaim, this can help stop the iteration earlier
>    when nr_to_reclaim is reached.
> 3. For non-root reclaim, the effect is negligible since flush_reclaim_state
>    does nothing in that case.
> 
> After moving flush_reclaim_state into shrink_node_memcgs, shrink_one can be
> extended to support both lrugen and non-lrugen paths. It will call
> try_to_shrink_lruvec for lrugen root reclaim and shrink_lruvec otherwise.
> 
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>  mm/vmscan.c | 57 +++++++++++++++++++++--------------------------------
>  1 file changed, 23 insertions(+), 34 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 584f41eb4c14..795f5ebd9341 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4758,23 +4758,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>  	return nr_to_scan < 0;
>  }
>  
> -static void shrink_one(struct lruvec *lruvec, struct scan_control *sc)
> -{
> -	unsigned long scanned = sc->nr_scanned;
> -	unsigned long reclaimed = sc->nr_reclaimed;
> -	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
> -	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
> -
> -	try_to_shrink_lruvec(lruvec, sc);
> -
> -	shrink_slab(sc->gfp_mask, pgdat->node_id, memcg, sc->priority);
> -
> -	if (!sc->proactive)
> -		vmpressure(sc->gfp_mask, memcg, false, sc->nr_scanned - scanned,
> -			   sc->nr_reclaimed - reclaimed);
> -
> -	flush_reclaim_state(sc);
> -}
> +static void shrink_one(struct lruvec *lruvec, struct scan_control *sc);
>  
>  static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
>  {
> @@ -5760,6 +5744,27 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
>  	return inactive_lru_pages > pages_for_compaction;
>  }
>  
> +static void shrink_one(struct lruvec *lruvec, struct scan_control *sc)
> +{
> +	unsigned long scanned = sc->nr_scanned;
> +	unsigned long reclaimed = sc->nr_reclaimed;
> +	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
> +	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
> +
> +	if (lru_gen_enabled() && root_reclaim(sc))
> +		try_to_shrink_lruvec(lruvec, sc);
> +	else
> +		shrink_lruvec(lruvec, sc);

Yikes. So we end up with:

shrink_node_memcgs()
  shrink_one()
    if lru_gen_enabled && root_reclaim(sc)
      try_to_shrink_lruvec(lruvec, sc)
    else
      shrink_lruvec()
        if lru_gen_enabled && !root_reclaim(sc)
          lru_gen_shrink_lruvec(lruvec, sc)
            try_to_shrink_lruvec()

I think it's doing too much at once. Can you get it into the following
shape:

shrink_node_memcgs()
  for each memcg:
    if lru_gen_enabled:
      lru_gen_shrink_lruvec()
    else
      shrink_lruvec()

and handle the differences in those two functions? Then look for
overlap one level down, and so forth.
