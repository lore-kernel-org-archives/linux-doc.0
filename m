Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB90350298
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 02:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773637; cv=none; b=pdOwzJ0l0QAw/wDiAv21lEtuBn/TNSZoUqs5Z2kOrxnUmMpi9uEMl7alBTzavpaNBnLVi7srvP2iDuMkp+IJXpxgGIuDblt1SoDiK+umYtbLT+H6fFE+UqtbcEnV4Ww5a9cys5PI7AnJ4CTB1M9XE2MDn6UKkPy10CB9MlYfaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773637; c=relaxed/simple;
	bh=1Zc+csD27sMljIPDEVrcZuKVZFqkreAOnt8H294xZbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQvzrTPV/HJf31+V+29VJSJA9VXZiBRc2miMBV/WlWSt0agFWucrETjtumHBUvTVgSpJULVB+qpWf80WKjQcZWCnaPU08KPEPb3DsfLyXHzZR99faZuiBw0ju2uiYe7ndhYwdrsdM2sgDsrtPiez3AmcgerAsp+OnmrkPglKWVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=hCtkZ+95; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="hCtkZ+95"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92f03daaa97so13267485a.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 19:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784773633; x=1785378433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkcumUgk1ANWHXgVO66BrCeyROSAiTypIfEMcbMxo1s=;
        b=hCtkZ+95rsEOcrIAqdvfFiHIIdTxGxGk1KyoqBmiJNWV4O3LdA57hwqSuliNTsVBiK
         dIO1N6uQGaMqjW1Y2c5Q6L6H+icBCKH7y/RQGAtU2DuiOkMRkP0aoNHOk8xSHgm6okVv
         8+3qJDWue+VfIadG359GE4hDzC1yBg5TpMx5hCK+ssgvpIXP8PVlf1l/40jCnqRGuw4E
         qylEhZDxVYs0COp5OoujYkfhOnXohuDxV48XRdL2wsDLvDcTO6TfVv0S68inlOXkyu6R
         kKdiFVKSkV4j8L5yKTxd9zgCo27kNV50nBNTnPu6rdFRcgkvAs74Ck8gWqbflpm6UhOx
         NaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773633; x=1785378433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkcumUgk1ANWHXgVO66BrCeyROSAiTypIfEMcbMxo1s=;
        b=Fz+k1Tf9Hfyk7l09RbuJo+TAXmtGiqtlR1FGH+0IbO+BTCAzOawh+B0ZTyIdMFtIsb
         PuUaYqPOKWB0btou6FcXyntfFY6uxPrswBJZ5Ev8GXFE7WgssKIlFhhrvhUKNUz76mdF
         /huVVp5gjfKqP7DV1VBlFZfTQ+JZjO1QNvdBttFWHAUv7GvnGY//8RhtM4u3k7yIWa1Z
         FYg6UWGnPhiJFJsKHxxqluH1KYlSW7kxzgJwPaDSkqTIUbrBp7qAaJu8uGa4IW+RUhZi
         swDTvkbPEaxU77Z3EZmb+ZfFcedz8/snxq1piXesqoIidIeo8Eu+Jt+V7cwTK17ggWvi
         zr1g==
X-Forwarded-Encrypted: i=1; AHgh+RoeIZctljXbKBU9x+EVfkF7d1zvoAD5z3/b0rRGte8qWLMzMVOOhQIhtmsjm4UMRIPLN1TCeCo2Sc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFhv2f5J1bUTdf5L3t515Cv+lRSW5gMSIRNzyu8EVTZo9Afaur
	U29jdJose8HUGp3v9aWjSiRizFJGbgaE4ZludMKjYCnHinyeCGuVWN3kChdG5vhY6Bs=
X-Gm-Gg: AR+sD13sAl8obPEL5MteWmue0VEZVWQYhqUNk/eKeQ0F4FbVLqDIgfrVcE8eiwszLpi
	G0Wc+vfO/TydDpoNIjKqzqLtkdZf2g2C8RDI9incdmNbJkExTtE+/EEitslIC3x3Wlmf1KSZXCl
	Z95tWFcvbj3FoIsw8o3yJxbHkSsSR/ZvaQMh+Et8vPLNp/lt2iPkF/aWQNCESXtvwUxQcF8fkd5
	YgqKOoYMLtC9i445SDBx8NCeGZFuNdZgwQHhzWDC7t2YvL7W0N7fYn+C1lQct2Qxm3IROITmCRc
	I+rPJIvdj1HLXVlE/kHF+ASCXhOCz8qpH2I9IEw3EJcdDq2tBg7FaX2RUlLmrKCY+ambiBZXOTT
	zI93Xn/Ul+3K8Jc21ndUY1juFDYEGebQiziYyRcOgLI+Eb6D+o9pT0r2dktjc8DFsEimY6xyzMv
	3n5u7dAIm/Zi8=
X-Received: by 2002:a05:620a:44d3:b0:931:1d6:8a98 with SMTP id af79cd13be357-931038c7f92mr142596385a.41.1784773633581;
        Wed, 22 Jul 2026 19:27:13 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a03834sm304453585a.30.2026.07.22.19.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:27:12 -0700 (PDT)
Date: Wed, 22 Jul 2026 22:27:08 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev,
	mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com,
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
	roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in
 shrink_memcg()
Message-ID: <amF7_GB5Rl6OJmt4@cmpxchg.org>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717085151.22822-3-jiahao.kernel@gmail.com>

On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
> @@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct *w)
>  			goto resched;
>  		}
>  
> -		ret = shrink_memcg(memcg);
> +		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>  		/* drop the extra reference */
>  		mem_cgroup_put(memcg);
>  
> @@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
>  	objcg = get_obj_cgroup_from_folio(folio);
>  	if (objcg && !obj_cgroup_may_zswap(objcg)) {
>  		memcg = get_mem_cgroup_from_objcg(objcg);
> -		if (shrink_memcg(memcg)) {
> +		if (shrink_memcg(memcg, 1)) {

Why 64 for the global limit but only 1 for the cgroup limit? That
seems arbitrary in multiple ways.

Direct reclaim, kswapd, proactive reclaim, cgroup limit reclaim use
SWAP_CLUSTER_MAX for the batch size near-universally. It's magic too
to be sure, but at least you wouldn't have to make up new magic?

Otherwise, the patch looks good to me.
