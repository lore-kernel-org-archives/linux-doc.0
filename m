Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C39E36403B;
	Mon, 22 Jun 2026 23:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171728; cv=none; b=LoCxvRHiQ1CmuR01Fhy3lFMFYUrBUY6gX5W8A+/LtnTCdRqInzk8z7mR7pPRTJ8XP+0f+/9PwEo3D+58gWdJMUIEN1/xCaDRF11/O5eHv3nIx+ecJMZToObp8jyKZ5IpxExw1852dQSZeVLi57jc0jaBkQfacQJZdlo4KFCwgdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171728; c=relaxed/simple;
	bh=qA6/cdY//6MmO6GWz01XO0QbpttUxHWdB1zeOoxnBNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFU36Z1jtLkMchUmvgxHOnVh9fpNvXonUQRfxjKF378xql+efVB5Hk7J+lCrWo3Vr5jJHXLiiGfdR9W6gaP0zrKGVDSbcEylsbRQmVFpoIACkeNvE/d3b4p2GCOA6t2XM4GJqWJ+wI8nmH5ru58Htj+cMtyV+wnXCt5Zpwqrwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2n4DGO2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2n4DGO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8281F000E9;
	Mon, 22 Jun 2026 23:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782171727;
	bh=zYgQzRWkWxLUnGWAoYxurtQBuGAOfxttp+K+/45YvTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l2n4DGO2w+knegYqXIXC3R4qWmsAIF47NbNgAmYwSeSwSk1Z/Pa0FYBuKsqUYcxRV
	 fsLjEOQ+i8YLPSuntJem/r5qr3w8aMXczCY6HhxfMGBI3bSinU6lEOMUcH0+T1gnxM
	 Vz+ctxaPh0+6Jkx3YrLmTRRp/hN7oKjjdpSiwldr75WoSNFFmmw8AKmhhXHYeDljzQ
	 xggeN3xL+LpikVft5upWTiHd1KBfaqTgsQixPyBZQhCd2s2mgO0QxEZrwaWnx8UARr
	 izbR+mbPdRU3V+XaF93ByPUtrqjbo03sZx2DRy1l9fNYhiM9yexlhk7RGv1M4OoOag
	 83B0bg8Rx6ACQ==
Date: Mon, 22 Jun 2026 23:42:05 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v4 4/5] mm/zswap: Add per-memcg stat for proactive
 writeback
Message-ID: <ajnIC0My51MW4sc_@google.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-5-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618044857.69439-5-jiahao.kernel@gmail.com>

[..]
>  static int zswap_writeback_entry(struct zswap_entry *entry,
> -				 swp_entry_t swpentry)
> +				 swp_entry_t swpentry,
> +				 bool proactive)

IIUC, if we refactor the code as I suggested in previous changes, we
don't really need to add an argument here..

>  {
>  	struct xarray *tree;
>  	pgoff_t offset = swp_offset(swpentry);
> @@ -1045,6 +1047,15 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
>  	if (entry->objcg)
>  		count_objcg_events(entry->objcg, ZSWPWB, 1);
>  
> +	if (proactive && entry->objcg) {
> +		struct mem_cgroup *memcg;
> +
> +		rcu_read_lock();
> +		memcg = obj_cgroup_memcg(entry->objcg);
> +		mod_memcg_state(memcg, MEMCG_ZSWPWB_PROACTIVE_B, entry->length);
> +		rcu_read_unlock();
> +	}

..and this chunk of code would end up in zswap_proactive_writeback().
