Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA24E3D9043
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168035; cv=none; b=QNJm0S5kNlv+0DJ1ywRlkE7ZH6K/+UJIA++lstFG/upUSuyXFQyQOCP+ed+5fF4Q/byJId/E6GqakkrLim4O3VQhGDcWo1azjnZgBtE3fVOvmu5b/PT+5JAjRSyL8iTB4k+CcDMxcu4+yPsaUnLgAiRnXxeQ57yW659XayEiWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168035; c=relaxed/simple;
	bh=1bkcUrvmztbrpSh/SyIQVxj2aJNk+2CuyucdHJWFNec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dz4XJhWr3bIPoiiN1ZH8fa0HIKZUnCUv8mWZm/mmL2QHa0oB629zK8JY8Ak+JSIqL41BKpY3P4F8XiLnN0XlHM8y4YeU9L7UHQHFE3tJhqs0LNJgM5J+GNFqFEc8oHsaBS3p3h6iRx2yrdhxQlATJJ7TDVr8YAc96zelHPmoByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JELnNjHf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JELnNjHf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e29049adso1314101f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788168032; x=1788772832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmZRJNMYJ5AXrDCDZCrGMnxri4tZm1nVUIzEyZPjscg=;
        b=JELnNjHfORGcUOERWEbzIL7UvVHPPFEK2LBUqz5WF4wEPwJ0Uo80HlfhUy/TrnEYZE
         OjO10twPAjvXUbdR9bEUjjkf4qB8n5mVguCViS2PRp8s/nHRR59zCwyrqimPP5YyWRTL
         QJ9g95iwdsSYm7eibIPmLMjKqQWABLVUeiHN5DqcRrUd/J8t8fp1gtfnWpXHhty3Es2p
         dV+a8FoV6eoWUa48jpQeQ9fNYNzN6KrjnKf4RRKggcbR+qbKqy88QMSNnvnh1oohMz4C
         UobFFHAQRfJMNi5UdwywAgEpYOyHdq09sQPzV843VioFlsgKn2Em1OcxdJ7a444UTcc1
         H9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168032; x=1788772832;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmZRJNMYJ5AXrDCDZCrGMnxri4tZm1nVUIzEyZPjscg=;
        b=tI2krXCKcdlQ+239SLfeAv1HyfTAKWh4cTPiEjE+UXY/MbFn4D1nwUNgg0NW5jieF8
         1Qilu6OIdae6Y3eGiPu/iVz8WfycyYfmfHwTBC6o3f/HMQ6E9TABwo4S5hQA4onutvdt
         EXunjIXkUQ0ovu8k4DBh6te+QjWYMi988VwX2rlcNP8bK3Emg9ZGg2m+DuiM8+Mp1Av9
         TvrtIjABpNGlOFgR8HO9SkpczIE0d8vZ42XKYKFgP6pSbYUGMZm6HZRYaBGgRDUCn5UZ
         Iyszs+rKDzf7BVfTJGkB0W9XH9pcT5bZzNYk/JvB6LeSN3ycIIklKEw/FdJA4JWQAyWB
         5zZg==
X-Forwarded-Encrypted: i=1; AKwUvBzJAFp3o1MetG5mMTumYUz/gBLsY7K5O285ZhqPZYQhpG2jbXD2G+eh5bZ+DG9ckX0CrtMa2AWbF3E=@vger.kernel.org
X-Gm-Message-State: AFuF++nSIlJUAW3Hvsxcv/uNMxl4I+71JL9RWtLrpZvm3OE+45TVrTcY
	d8HnRnpdysGQ333S08KmBtygJmJGlf0tIouQ2YNZesIgTvXUJbfuWNCIlcbtQGSADMY=
X-Gm-Gg: AYBFou0JnkY+um/A3AhW7LjQPiOUzqi37ARp19L5TNEahnMa5o3moJsR5/FzjZPQhL1
	XYpIFilwe3/ljUDQAvcwzwvkyl4cv7j63WeGlvYHgux0aTfuHtJgTUegDEBiwTCeYqKLAcoGUmP
	L6BPnNyGOpd7xiwvEkoSBCs33zC8aKZV/3t6rDrFCgZSqGTlMyDYEdFmmpR56rw94dDQzqHFeV5
	LVIH1X5QJgbd/14s80/K1xjWKUNve8BdgOCjy8P9AOAXe5cFck9rh6KL3sx3P1qRg3omX4IEUMM
	NYbo0VCtPAppDbfOdFLbY89/N98D1s0qZLfjCjqR2qtEBMhorx/SgIWxifYZSjWgGG3iKPL/H0p
	HInFIbftlAz2JsF4Eex00aY+tKqWEGtSiv71+4ZAE5Yg5VT/Gb/FwqsG8HaPVvtrlasus12ZJ6+
	7TqJPYlIf5l7eGRKPwXC2i4D/aUwYuX+Aq62c6DP5Etp2JzSNkYuTmO8pIcMoOEr8Qaj9IH7+ll
	Q==
X-Received: by 2002:a05:6000:4012:b0:484:3310:710f with SMTP id ffacd0b85a97d-4843f00bb60mr2562328f8f.27.1788168032065;
        Mon, 31 Aug 2026 02:20:32 -0700 (PDT)
Received: from localhost (109-81-17-247.rct.o2.cz. [109.81.17.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm10478328f8f.37.2026.08.31.02.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:20:31 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:20:30 +0200
From: Michal Hocko <mhocko@suse.com>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at
 1 GiB
Message-ID: <apVHXmSljK8HrIuA@tiehlicka>
References: <20260831075635.2244437-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831075635.2244437-1-noren@nvidia.com>

On Mon 31-08-26 10:56:35, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
> pageblocks for every eligible populated zone before capping the result
> at 5% of low memory.
> 
> This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
> configurations, but scales poorly with larger base page sizes. With
> the default arm64 pageblock sizes, the contribution per eligible zone
> before the 5% cap is:
> 
>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> 
> Consequently, min_free_kbytes can reach excessive and unwanted levels.
> 
> Add an absolute 1 GiB cap to the recommendation, in addition to the
> existing percentage cap. This bounds the automatic recommendation to a
> sane value on systems with large pageblocks while preserving existing
> behavior for typical systems with 2 MiB pageblocks.

I would argue that the whole model of increasing min_free_kbytes for THP
is wrong. This will trigger memory reclaim sooner and make the THP
availability more likely but this was at times where we didn't have
pro-active compaction and many changes in the compaction. So is this
actually needed in general resp. only large pageblocks systems?

-- 
Michal Hocko
SUSE Labs
