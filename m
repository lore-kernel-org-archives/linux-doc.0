Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958803C08A
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 19:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723059922; cv=none; b=avyYnaMUSAUvA5zuqgAc/nwdvHfXxXqjF7NDyL4E6R3heQblAR2nZ2WmCN7IRcEPCqnYmuSkwQ6EE8x1Z3lf8mF8jS6rFBonpZocaHMSeoxBSf9V5W+SBBRkXy8KemutoenhIjVrFDCNwp0yMPavw2mpum2Hl9X8Vd0kxKnPO54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723059922; c=relaxed/simple;
	bh=U2SSjnCwU5uxHzJ4FKAti46QRVg2gxVgb+l/Prl5Ej0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va1o7oOUnIHsUhR2LpnICIsdPsad3V1S9pL7HuFlSuONt2/8EncV30ku1kyvdZt7FktvZj2JJUqqZtd+cbkbDrs6U91FEo+Y7+fmgkz499/cHqwfVEASCTC+bv/zu8VSyg+sCUBnsaKCIF5Ei9kVAMlOePxGKllqc0s0v4o23X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=KhBoVmRP; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="KhBoVmRP"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44fea44f725so1886081cf.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 12:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1723059918; x=1723664718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YRNP8+j9JNXJhSIfP3j/Nd6wBo1Mo57840nXTuLt/sI=;
        b=KhBoVmRPgt3YBX+hOqU7tZ4SYyPsDvvpstVZYi9fPuxIiEFtPRu65Aj94g7KRDBmfx
         7fK6VjJ59MFxHusKsi61ogbJVFLJEP99c5Ts74ioEEEXYDpm6LCTa+zvqOcxHt06xb4D
         23Ct5G/eBotDRBYz3I/KXqCzqNhevxKp5n6ZLOryK63Mok5Ko6NEvnafftFFLwKZd92N
         NtuSSglR0aQbbi3n8hWxgTd95g4gVNH3dV/3fHswz9JVpgmtBj7cf3s9F0sXfAfjVxGR
         LWsKC1+zM1InLLGYIti06sFS5RQUp5InB7oqK+FY+SADmw4k9r3MAi236VWI7AJShu3X
         NNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723059918; x=1723664718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRNP8+j9JNXJhSIfP3j/Nd6wBo1Mo57840nXTuLt/sI=;
        b=sek8kx/u/+ugBrEeIRKU+cpt1kdXNgCNnv/C/UDcWS5leN5JuR2p2jvfQmh7rrk8ra
         QA7E89ZcY2CwSytqd1Hgxxm0gfXm+GuqG88hlT7jNwgA0Rznq5FTWCMuRCZu62OkKAQK
         LG4v6YlPxy7ZRLLlc2qEdAOmC2S5SF0ZUYT+saSF9sOqEK8Hid0wZNxQyP9Jy34zMvJZ
         ol1oNuedtJFEjYj/Y2xsAg/5LGRDl1rsf5ePYXJ91xavMPn1uvVlU1VACoSCmk/aIjSR
         bZ7QXY/lA87KHMuOTDSmSYZdyt4dl5fJ1NROwbCqAAHjV/rlck0H3ic7axqMge8AAZR3
         fJgA==
X-Forwarded-Encrypted: i=1; AJvYcCViulZ4U6g3QLsu+IP9sJ4C/kKg/YOM2Hi6nN6kkrRbiUDmMmB/nZZO3EAcLUhfwGnuDPXSu0JjD81iY5u3CC9VTwDJK+pOJlT9
X-Gm-Message-State: AOJu0YxMRrnBhSmZnOZeG6nfoWzXXa4HhhFhm0boPAN2BkHWSZqhbZoR
	T+KOh+tYlmeiZDTU/GkSMIkdmSTv3aGOcBKEnonc57xAx1WILZWcPa8HtP9kFfY=
X-Google-Smtp-Source: AGHT+IHxkvIL2FAAY54SivCXgMtmsqj2mnEIMCmKHWRVWpL7/1o640SX7BuEYBZRFoull+Z5qHCSog==
X-Received: by 2002:a05:622a:4086:b0:451:8b27:381c with SMTP id d75a77b69052e-451c7999460mr66238771cf.14.1723059918151;
        Wed, 07 Aug 2024 12:45:18 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c870066csm7215251cf.4.2024.08.07.12.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:45:17 -0700 (PDT)
Date: Wed, 7 Aug 2024 15:45:12 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, riel@surriel.com,
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yuzhao@google.com,
	david@redhat.com, baohua@kernel.org, ryan.roberts@arm.com,
	rppt@kernel.org, willy@infradead.org, cerasuolodomenico@gmail.com,
	corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com,
	Shuang Zhai <zhais@google.com>
Subject: Re: [PATCH v2 1/4] mm: free zapped tail pages when splitting
 isolated thp
Message-ID: <20240807194512.GA1828817@cmpxchg.org>
References: <20240807134732.3292797-1-usamaarif642@gmail.com>
 <20240807134732.3292797-2-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807134732.3292797-2-usamaarif642@gmail.com>

On Wed, Aug 07, 2024 at 02:46:46PM +0100, Usama Arif wrote:
> From: Yu Zhao <yuzhao@google.com>
> 
> If a tail page has only two references left, one inherited from the
> isolation of its head and the other from lru_add_page_tail() which we
> are about to drop, it means this tail page was concurrently zapped.
> Then we can safely free it and save page reclaim or migration the
> trouble of trying it.
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> Tested-by: Shuang Zhai <zhais@google.com>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  mm/huge_memory.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 0167dc27e365..35c1089d8d61 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2923,7 +2923,9 @@ static void __split_huge_page(struct page *page, struct list_head *list,
>  	unsigned int new_nr = 1 << new_order;
>  	int order = folio_order(folio);
>  	unsigned int nr = 1 << order;
> +	struct folio_batch free_folios;
>  
> +	folio_batch_init(&free_folios);
>  	/* complete memcg works before add pages to LRU */
>  	split_page_memcg(head, order, new_order);
>  
> @@ -3007,6 +3009,26 @@ static void __split_huge_page(struct page *page, struct list_head *list,
>  		if (subpage == page)
>  			continue;
>  		folio_unlock(new_folio);
> +		/*
> +		 * If a folio has only two references left, one inherited
> +		 * from the isolation of its head and the other from
> +		 * lru_add_page_tail() which we are about to drop, it means this
> +		 * folio was concurrently zapped. Then we can safely free it
> +		 * and save page reclaim or migration the trouble of trying it.
> +		 */
> +		if (list && page_ref_freeze(subpage, 2)) {

folio_ref_freeze(new_folio, 2)?

Otherwise looks good to me

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
