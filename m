Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EFD33F5BC
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 02:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772818; cv=none; b=SUx6dEvLrmwYHJnuwchs9jLK2zk32ga/Hq4badeR1O77yBmrrLdY4xNOC7pZqpwFtdC9+V1ebjVqGTzSgJltVHydrbaoErYDp1AWnxBXB6OgL8s8deAufwSrZZJzZGl+cPxn1O/XU7I1Mp2dOqcN+ipOwhg8wo0DRnemL/Nk5W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772818; c=relaxed/simple;
	bh=Pb3YkLqv5VAJEZhN7Iy5XU//vgxrVXvJTwFLEhbQAjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGIWuqQ0W0aNJRqR/yyHa0z3r2USc2raRGrqxluPD6GTv6TT/Vj+bogoJFB5k8GfblhGNHi0Q1duSk1u8bLfmOS8HxGW3j/ODBePP0ODqTrs02p7K06Md3zpfj/2+OMK8FKNhKTBB+Qfcg6sM7pTU0iL65YCHLjHY+qQn+2oPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=LmPFJl85; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="LmPFJl85"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e5d6f35c1so17262285a.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 19:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784772814; x=1785377614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63wl+OLSuyt8DrGkM/Vj7SgGoUiR2AzArICs+kt8mlg=;
        b=LmPFJl85NOZyZkDAtdb5wzRXiTTLyaCxPHIbFmu/TeET00oYZ38w11hDRcOyCzsD2e
         tCF2Dra3xZfV81mdckJa1l7zt5QlYk7/IggxXpeS9CVwiw4SFOkKpm2BxZy8Ngpwpnnw
         MtB74ja5MZwXIwMdBuBaVBYqHrSmy59qoRUoZE7/TnleNM9qlQry9ulVApCDN+peU5MD
         TPGoOPiSHnuvkxoLEWN2BwOhLaT0h40EE1T8QH7OE6btach5aMDAPmi2JkyV1E8OxZ4U
         +4m4gZ2HPsolj4OrAr3VFSUs9SuAZqFotEKdpj4bpTYNTxOdkzu0VmQ2gt7O7mofNyl2
         qHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772814; x=1785377614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63wl+OLSuyt8DrGkM/Vj7SgGoUiR2AzArICs+kt8mlg=;
        b=d08FTEKm4846TrsfHxzB0CFoADDaWv5qNcPcjqfmlIrtjyFFc/z3U9S+dkvJ4Xlm/+
         ktMONDshm8DfuppJFYZ6eG/8I5FfxWX6mhT7WuKbC+r3/JI7uShSGaJcRBAtu2zddMTl
         y52Y/Bcijzfl0bCL3jGEGO7aATjVPVSsPbhV4KBL5kkgNgBNU5IxcAXobTbs1aj4IUnz
         PiLyan5P7Iy+QwuVmpn3uumPqZDq818C11BtarnteRTHrfodFnyanFMkh7Z2c88fE9O/
         SkFlrulKiJwll06nMNVKCg8xxEzcbEVMONOuhzIUdu6hjfBOR9QF3HkIkJeYmRKigyA5
         /hVg==
X-Forwarded-Encrypted: i=1; AHgh+RojsKdmOJJC+QVlbxAprVel7q+kLYrk/FsTXARlL+CExwWm+ujVX6RF8D938D9O+lu+Ot3lZF6aUh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrivxvzgGY7NZ9ujvwlySchki4/mX2rtSiO9mumJXq52UUD114
	1fj7Ibv/QI8XadhPb5asnj/5CE/bkCCXtDH1Qijq70F4JxrEBtF41ea2gz4HIdeALOz3acH/BJz
	qVQT1
X-Gm-Gg: AR+sD13Pa5vLUdA2mwVpX5HT8YxdAUGhNdtvEltJXj2bVFekNiMAz7QbVULUzSxSrHU
	q/Gms7Op2/EQWnyUm1NS3+mSBp9yvsKZaavwaUXDqb0JPyudTlgKkek9JkhCG2CXXUECFNLAMq2
	qfDZQyAmP0TLNXfr7q17mIEZFbbvO4aaMw7nGnGagt08TVX+hFZQsp5kBzrzlYVP5QCGn/r0Ivf
	8sIf8knPXpZF5YX9E7VzYbZpJLKdaDhOVsYLqG5PB6ktJZQFf5p21MlEdvsuSX+s2eFajJ5zMGK
	3Vc/ZgwVsTVU4Hqn/WruCb4W697kRz0uSMKDYFskmsgnYuHuK+HKCDm+x9dMis4mTxcxj3Qh6qO
	ydYVTemgvEdUikgOg3qP6AyHoBZQz1RSBcClGcEER4qtd1mjVswZwqlkfrhQj7sO4e1DM2fgAPr
	C9
X-Received: by 2002:a05:620a:1726:b0:930:9a5e:bbc3 with SMTP id af79cd13be357-93103aee31bmr115743585a.49.1784772813954;
        Wed, 22 Jul 2026 19:13:33 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-931062c4ea8sm22128285a.28.2026.07.22.19.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:13:33 -0700 (PDT)
Date: Wed, 22 Jul 2026 22:13:29 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev,
	mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com,
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
	roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
Message-ID: <amF4yRobGT9x67y3@cmpxchg.org>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-2-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717085151.22822-2-jiahao.kernel@gmail.com>

On Fri, Jul 17, 2026 at 04:51:50PM +0800, Hao Jia wrote:
> From: Hao Jia <jiahao1@lixiang.com>
> 
> Zswap writeback on hitting the pool limit is broken when memory cgroup
> is disabled, because mem_cgroup_iter() always returns NULL. Therefore,
> the global shrinker shrink_worker() always takes the !memcg branch.
> After MAX_RECLAIM_RETRIES empty walks, the worker simply gives up, so it
> fails to write back anything.
> 
> Therefore, when memory cgroup is disabled, fall through with the !memcg
> branch and shrink the root memcg directly.
> 
> With memcg disabled, shrink_memcg() only returns -ENOENT when the root
> LRU is empty, which means the total pages are already below thr. In the
> absence of heavy concurrent zswap stores, the loop then safely bails out
> via the zswap_total_pages() <= thr check; otherwise, it will resume
> shrinking the memcg after processing the reschedule check. For any other
> return value from shrink_memcg(), the loop is guaranteed to terminate,
> either after MAX_RECLAIM_RETRIES failures or once the threshold is met.
> 
> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
> Cc: stable@vger.kernel.org
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> Acked-by: Yosry Ahmed <yosry@kernel.org>
> Reported-by: Yosry Ahmed <yosry@kernel.org>
> Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
