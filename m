Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB71B3920
	for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 06:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839457; cv=none; b=D14i/fgwFezhPbiOSNPiEhkv7UP8EW3HV1bMt1Gb7X3i3TqM4kqKNoCBUJY03NPwqWPjlcd6cKpPX81/C+TjbRLPq1PcjGVVuHkX14dPVnPvaan64Z/9v5pN69z10RP5RF5rd7/ki/6ur8/RrVRR2Xkd3x/ll4TdQJxcX9a4z0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839457; c=relaxed/simple;
	bh=N3hO6RuGLcGpKz2OO7Qi0i9vgG5nLurEUPBaxGqGmX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXyeiQ+n9RPYqoKYl72eunbP1LCOuEjKmWTHe2q4KcG8dR43+JPl6LWXRqQxwx1kpVHtIshNUER/FikVmpkgs21uxQtZos/ax+nGOOlmzXHttQwfy3AU/wIaLGfnegGReqyRn8JRa8sMeqGHfU0M0v+4S1mhfmacdpBxoCrotTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JttTjBEn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JttTjBEn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so1130749f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 23:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729839452; x=1730444252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uIGhUUrvEJvBYTpVTQCf7vDRTHIN44D2R4RlMBTCdG4=;
        b=JttTjBEnJc3j3mu5taK/E9ajpFN6lV/QSLhJLn7Ewr54rubjMg0hF5hFHPo0BZcDIg
         QbiUc4gL0p4RX3NtsrahOd+A4wS9haGpdtfwrEhtVlp0bWGr7myv7pHa70z5T4wStZ5f
         kSHJlXabymblrxf0vtKJH7zVzYAehw+TdlsDb8wSEEboybBHLa4gVRP9mmFRRU3pGRWd
         BFKpglqBVAfCA62OvvuNaQnw90ywRGNQ1MTZ3nHx6w4+Fb6774KCgH97lEB4xSy4lWOd
         OtNZ6bAiNkoWTH0SiBJ7KXAYYGAYS25Lmeq771TgIUucmLgCsOo4kiAnC6tK83UWSn9n
         fsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729839452; x=1730444252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIGhUUrvEJvBYTpVTQCf7vDRTHIN44D2R4RlMBTCdG4=;
        b=WHGLa71egjeYGIbqSYZ9rNYJC+yINzgzopjoWZWiliplPiFTVxbOp555ZJpwK1VsAs
         qHkm/EqM3XBriHxEf/O8LSSxVUkZo65n+AMG4GrYnS0Db/9uysh64f1Ki2E0TVBul0Lv
         eLh+HK70ljElDV56DbUpDGQixBw0CV4LZh1xbn2XPt5yorrkI2s13uPPyTvQ0zgzkNKO
         i7bRJp5KhgnhE9KhKkzmi4CwpVUjCPRi5HbI2xeY3xrTmozHu6lmARiukU7ihtJEzQt7
         oMGrIrjuN3ckkcnBsGWpNSChc/w2XgV/7FvKwnH/npjsKGiig0B9///3gyZIBF8KJxxX
         flHg==
X-Forwarded-Encrypted: i=1; AJvYcCUrbaiVXBmnj4htEmQs9iywJyRYmtFSv8ijQdFt7230uW+oOw0La1miLDyodnyG89Lm5lIy+SREjXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwYkRvqePxUlacQPDE/iXjg0cH8T+iUdSPfwvxmpemMHlZEy4s
	t2zQ1PQQ/IvdzfyW/kXa2w9RTzYgkUNyWRH4+dl6hkVuT3zpv6tmO0Stiw7WiinNcgZhX7jZ8i6
	w
X-Google-Smtp-Source: AGHT+IG5jRpCojmvKmj5tkta0HqMtVq7AqWJFDLy+BIjGm7NrH0ck5YQqqlaOo1BUh5vNwWV8SPF5w==
X-Received: by 2002:adf:e808:0:b0:37d:4ebe:164b with SMTP id ffacd0b85a97d-380458ec1camr2763416f8f.44.1729839452483;
        Thu, 24 Oct 2024 23:57:32 -0700 (PDT)
Received: from localhost (109-81-81-105.rct.o2.cz. [109.81.81.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm749911f8f.67.2024.10.24.23.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:57:32 -0700 (PDT)
Date: Fri, 25 Oct 2024 08:57:31 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v1 4/6] memcg-v1: no need for memcg locking for writeback
 tracking
Message-ID: <ZxtBW9d4bkj9C7gY@tiehlicka>
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
 <20241025012304.2473312-5-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025012304.2473312-5-shakeel.butt@linux.dev>

On Thu 24-10-24 18:23:01, Shakeel Butt wrote:
> During the era of memcg charge migration, the kernel has to be make sure
> that the writeback stat updates do not race with the charge migration.
> Otherwise it might update the writeback stats of the wrong memcg. Now
> with the memcg charge migration deprecated, there is no more race for

s@deprecated@gone

> writeback stat updates and the previous locking can be removed.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  mm/page-writeback.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index a76a73529fd9..9c3317c3a615 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -3083,7 +3083,6 @@ bool __folio_end_writeback(struct folio *folio)
>  	struct address_space *mapping = folio_mapping(folio);
>  	bool ret;
>  
> -	folio_memcg_lock(folio);
>  	if (mapping && mapping_use_writeback_tags(mapping)) {
>  		struct inode *inode = mapping->host;
>  		struct backing_dev_info *bdi = inode_to_bdi(inode);
> @@ -3114,7 +3113,6 @@ bool __folio_end_writeback(struct folio *folio)
>  	lruvec_stat_mod_folio(folio, NR_WRITEBACK, -nr);
>  	zone_stat_mod_folio(folio, NR_ZONE_WRITE_PENDING, -nr);
>  	node_stat_mod_folio(folio, NR_WRITTEN, nr);
> -	folio_memcg_unlock(folio);
>  
>  	return ret;
>  }
> @@ -3127,7 +3125,6 @@ void __folio_start_writeback(struct folio *folio, bool keep_write)
>  
>  	VM_BUG_ON_FOLIO(folio_test_writeback(folio), folio);
>  
> -	folio_memcg_lock(folio);
>  	if (mapping && mapping_use_writeback_tags(mapping)) {
>  		XA_STATE(xas, &mapping->i_pages, folio_index(folio));
>  		struct inode *inode = mapping->host;
> @@ -3168,7 +3165,6 @@ void __folio_start_writeback(struct folio *folio, bool keep_write)
>  
>  	lruvec_stat_mod_folio(folio, NR_WRITEBACK, nr);
>  	zone_stat_mod_folio(folio, NR_ZONE_WRITE_PENDING, nr);
> -	folio_memcg_unlock(folio);
>  
>  	access_ret = arch_make_folio_accessible(folio);
>  	/*
> -- 
> 2.43.5

-- 
Michal Hocko
SUSE Labs
