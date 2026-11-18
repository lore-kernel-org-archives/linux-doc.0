Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015527;
	b=5hKgaoXIc6tElrOsK2/QDFPybgcyKW+VnxGYFh/PYZ9alStlAGad42Arob+f5uq/qaPu
	 A+b32dF2OJkcPuK4qNIwsSyLtj37vVNgM7N/P0sS264KeNnXQVAmz0gBNK86+PYYjoUIc
	 A2n/21kUHXHQPtJOTU1tga7bEQ+4vpICsVR7+oL62XsjSz4s6fn2d7k7bphxuVqxeWbjB
	 C9A1znp0K6wrh/+uyjSmuY1+Mq3yQA3jMwFmaYLd0qo7yeU1OebiXmnLqpJe/Yv75feUe
	 kQoFt8zOc1NUirVzmvJhx7BWE6m60lXh2OVZ1KTbd8Th/pVZM0Vcizii3GqMWUDcb2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
	b=1dTLh6N0TpWehwZbngdSxId0P8YQzLiShU78mp0Whi/ZkLKwng4fdv4yGtpGaKEQjlvA
	 9WuLonHOe1bQgQokuU2wDufEGGLFhOLJiasOVvEGainznjEGWiImNVBM+kuwcVjdZPgGm
	 JBdXyjoWnUv4/9GQ/xaZdOmLFgjpPU5S8EnCF0+IsecsVueXcptsUkcGt0/PmLgTyZW98
	 fHxa9jSL7zOUVcmHzukUc8zo4eXFc8pYF7iVkRK/wf7LOwEGyyUD0YYjgQ0uP0PWXasaI
	 F8ygMKsncOvkjSIFQi7SdGRi/LO4fhaiHrcl7KTvisHfM524ZAuVIcbwGIAjajKPJdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="jE7rKGS/";
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA02360A3810
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA02360A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=jE7rKGS/
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91f11161831so7596206d6.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795015526; x=1795620326; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
        b=jE7rKGS/9QG/JJLAYSBebfc7UI+DGt6msbQ8tMKrJyf7dhdvw1qgGgHL2a1Stgs7/u
         7hEJVeGKLeMoYuvyTuRo1TO6ZKsFJ8C19di0LKZM4Tx/bFg8jXksaBHETdQRYWB8bcbf
         vndwuhivOCLprevBEz7PLOmqtubEyBL0BI/+a5nfmLb+NfeRk7KC4JnCSRMrj3CA3q6a
         lyeFMYbO+4PDLy4WMyQWPemjuBZrA8VUm7GUYQ+voCNX6YMciUdYQmYeAoNhF1vj3Wsw
         t8vY3fyWbbf0Pslh6FnM27JWmfcQaEbWnEK8REBZ8c/DIVcHv9pipqnF73U6JtCHWAR5
         ZRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015526; x=1795620326;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
        b=vxeJdb6xQJ6gHYhNDKDd30Q8ANF2OecTAzyF7Da5auDLqKNlAunMwvD4+p9vyUk2sB
         +OqTIqdUHWkfhFGcgxJCzWSPKts5Ia6wBP0EYIkdbySzpCVL8GH3sFnhvSsCCo5DxVqL
         SVb37L0jSoOG1W3ZfrQ895uE0NPKM8Jr2ahqcHRU3N+S7Y7tp3vh1SUYY/n4Sfz7FgRU
         lCBRmxFj77u6SoTlkrT1YtcQIKQxqngrPi8xJFDPFWP16qN+T3ZPjF/O+WrvSaxYHRdZ
         R1+rDJG1Rn1zLiG9+4DXkD0ZjZf0Uiut7T9NmMgsz+3j2UYcS/4pbGFnqhF+wUFpQwk+
         HPIA==
X-Forwarded-Encrypted: i=1; AL+hErFKDhwtS0YjDJKM4kUfHsdw0ngMwZFVeNHHSwNC1pqM2STRxndW6ijbIBTvTjf8xCC+sx0cgqe9dbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uwpJkwYuc7P+EWyc1giCBRGy+uI0j3DMgxJ3roj45mQ0M/2qa
	54/+mB+Iw/pUjw5zihbdgV/WVr1xdpdftF8m++bHj+SF0yUMxsgbPnB05HnsnGnsLEw=
X-Gm-Gg: AZFdTZdinqcmwhZUKmEAfbjVKOhynr5uxvR1Ve6e7Wxf2bZZ7+9UfK3SL7EiiP7Vq7n
	RhS9sNbBH/v/yszJfSTSfzPZekixO7FtZAywYSf+Egw3xJ0H5Ba0DA81BTwzYZI9ZReFfKdOLXV
	BrjVssT3nkLV4ODRkthi8YhREzuFVhSZxkP5qX7qIy53BdAH2jEwXwejnwTdsTU/NaaQOYGx9cE
	wMP/AVWQlT378KwdekpVwJptO5lJ+5WkwwRp611b8m9e02QUmM9oLuscJT+sCISwjmyH6jbi6cc
	y0eHFo6WRt3q+dXvQ3sCPJjCSrkWIPlyfN8a+D04IOfGAD7SfYyj9+w6tWfnX4NndqFF9cxG7r5
	z3XtC2T0rSH7lF+4U8Pw5kik0FfFpLJYODPSDxthRcYm3uOZ0pAfU7qRjyuxmIJccn+lV3qpR73
	CVu/gYaHl/hpB8ULKUDKB4Bu7MGzdhedbBH1uj+5I4GJyZUugxyzYVkami4olSsm2ZKQIrWMB90
	aZX2wH0AHGoTnZWRqTIEmjNcoaClKxOvU9bciNXlC16TNWDFLwB21bVPiCHBQck0HPTrfmGPIz5
	e6sa6MIa1uPxX9aORK/d5LgP3q/WfiglhM94DIOaz8MSjMs0uGyRz7ihU7Pq536VzWyzErt91BD
	EBkVyW3s=
X-Received: by 2002:a05:6214:240d:b0:91f:12a4:27f2 with SMTP id 6a1803df08f44-92114c4e8f8mr45557396d6.6.1795015525386;
        Wed, 18 Nov 2026 07:25:25 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f9c36sm24415306d6.5.2026.11.18.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:25:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/22] mm/hugetlb: restrict pool growth to common
 memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, 
 damon@lists.linux.dev, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <av1PyBvUVJcy_Psd@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-14-gourry@gourry.net>
 <av1PyBvUVJcy_Psd@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:25:22 -0500
Message-Id: <179501552287.1206716.17381960047395782233.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 15:32 +0800, Richard Cheng wrote:
> > @@ -3802,23 +3801,21 @@ static int set_max_huge_pages(struct hstate *h, unsigned long count, int nid,
> >  	unsigned long allocated;
> >  	struct folio *folio;
> >  	LIST_HEAD(page_list);
> > -	NODEMASK_ALLOC(nodemask_t, node_alloc_noretry, GFP_KERNEL);
> > +	NODEMASK_ALLOC(struct nodemask_scratch, scratch, GFP_KERNEL);
> >  
> > -	/*
> > -	 * Bit mask controlling how hard we retry per-node allocations.
> > -	 * If we can not allocate the bit mask, do not attempt to allocate
> > -	 * the requested huge pages.
> > -	 */
> > -	if (node_alloc_noretry)
> > -		nodes_clear(*node_alloc_noretry);
> > -	else
> > +	/* Scratch masks for allocation eligibility and per-node retries. */
> > +	if (!scratch)
> >  		return -ENOMEM;
> > +	nodes_clear(scratch->mask2);
> >  
> >  	/*
> >  	 * resize_lock mutex prevents concurrent adjustments to number of
> >  	 * pages in hstate via the proc/sysfs interfaces.
> >  	 */
> >  	mutex_lock(&h->resize_lock);
> > +
> > +	/* Fresh pool pages come from the ordinary allocation domain. */
> > +	nodes_and(scratch->mask1, *nodes_allowed, node_states[N_MEMORY_COMMON]);
> 
> For a global request the caller passes &node_states[N_MEMORY], so before this patch
> the grow loop read the live mask on every alloc_pool_huge_folio().
> Now the mask is sampled once, before the loop.
> 
> The loop drops hugetlb_lock and can run for a long time. If a node gets its first
> memoroy in that window, the old code would start using it. The new code won't, until
> the next write to nr_hugepages.
> 
> So the pool can end up uneven, or smaller than requested if the other nodes are full.
> 
> I think the nodes_and() should be placed inside the loop to keep the old behavior ?

I can make the adjustment, but the concern is that previously we'd
start spreading the distribution of hugepages differently when there's a
race between hugetlb allocation and memory hotplug?

That seems like a pretty innocuous corner case to be worried about.

I can see about retaining the old behavior, but i'm not sure what you're
describing is reliable behavior already.

-- 
~Gregory

