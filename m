Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1B28850D
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043193; cv=none; b=H/KBpWf1amEDHEQ112DhT9xmEOMsTObFnHRWzYlA8upg3bsmB9yD43QEXWkTRn/YPxNnY4bDxJ0cjXQHonGT4miv1ERUbiQx5fmLOMYfpc8LzIPmwrIt+4BFkY8SKJcIWXNKWkEOU3zKMdUi99IXC53dnbRXepeqXghRo/lbgS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043193; c=relaxed/simple;
	bh=lPEfpzwiNnp4Us4njDeq7FVgaVJSVyeUSX/+2EeR9Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwVtB/9Qq8Ea+ybqqlPsQavIYub+LwzpB1dA04UKL2Bt08Cq8aH2fUbIFNXJPHfUXEgcfPHJFqlIfB9EN90mquH1/dtUOHyjkuhFLfBlD7IlLNYtbXcOEFTm0cgjljk3wA/mzkr/1Ha2FzDB6EAs4lr/DzNX3b/ulXyi8IDOtgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GOPxrBkP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GOPxrBkP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8eb5ad01402so645953085a.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1777043191; x=1777647991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=39aR5XRbrEXV24JT5m2euVHnJMBsT6ax8xLhWEkFjFY=;
        b=GOPxrBkPOYadJ71PWBHijiwmG4jt2QTQPo7Ldlm9LvEFlroJxbBPN5NTiTotOsTXgi
         Q3asdwlCzTB8cdjIwWPzSUDM4VZNSi4d0jp5iG8f1tKorNGcqs+Ujeo69f1/P85WmS9A
         qoriXj6lCjE58zRaO+H+1XOJ1FyzBR7u/aGIRhrIIfAmIqyyTs7vKWHAI2M6+jH4gg8u
         fd/tXPdx1Hrzz+hCzqibA8vr0sdBLlyiryyQONtp6gOgQ18SL6PbBD9GfPlZt1S9NUPw
         kiPLzzb84D3k9i6Rj0niYATkYuduDf/TC8JGIl1algwwp+CIJYLEyLn6JN9ziAzD4yWA
         G0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043191; x=1777647991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39aR5XRbrEXV24JT5m2euVHnJMBsT6ax8xLhWEkFjFY=;
        b=RCLeroZLmKQLPnxMox02pockB+pGgum1LD/0omEW8gDM+SyAtYTP19j0CUbvp5xHis
         dkmdAkrXwv6pEecIaYCKS5glCr0R8paDOshABVNAegShCtykBvsD+DJWEIDJAXFmx1Gx
         Ca0SO0PcgID/oUKVSmpZCahPOuTCQaPArtvUqLutakTsr68PSKEr8VPv2zU3EUfgVHlZ
         F6+0HFu8SB365SNabUFoTEEJOZCLZkXamqGVQ2qq6wA1sY7veWhUQqA4jomCOeeU36T+
         el91tVEMe2tqA9sFE4tlWzAtz9cwREdQLVRm5yCtpy9tkzBWujs4hoPGYbf//e7hpxtD
         s5Pg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZkJh+UmdY0XoQUhW5YHLlrfdaMZghDNiSLz/DZkrm4op0kMxjzUF0FdjDDNLLXseqfLtaTI900Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgLhFCnL/t1LdDbw4Z24UM+4PFvQu3FKscdpBfQDAQJ2n60+nV
	pjSS/xp19+IND3ESqiphBGG3XwX9cEAy2XeS8fD30ojab5dmAiE3nK9WeF8kTC3ZeJY=
X-Gm-Gg: AeBDietyXw7JJsnrHq9YU3yP7f2BLQuVbXwN8+l6UUYlJzqbe1zbmE38wJXU7UVWFBP
	VghFGkGo+mj/AWlm+fh4MhGkcx70gvAE1j/c6ynvh5J3+royENh90Ll1G4a2qj48Qg6vBrOWIG/
	YTjCfRLtKfcfk4ckef7kAGTfbqG6pz9bmQkOZNV2tMZkhFVqgvin6w79o5aqWdd6ZedtN/asDB2
	cUnQeqkkyWvSLBzEA8xNUdqXO/+2qlywA5YbK33NxCjjcdlbYP+h7xDPoDeXnFKHEe1Umu55j3J
	QQkbEzT1/hJYOa2KMdfnXKd/dBzZw0TMqZK0gJwJFvcir835knKacA3/Vi7HCNwdrKR/8g9DkOJ
	QhzJpyrQwDjmfuxEYpAG+vs/9VGERT65edlz46YRI/Iq9760LMe/3pI6lwo+/e3a0f+oZeQn1ZW
	sEILjTlje0BGcipaQv3j68dXbd2G95HRV/wqHb9bu1E+ZQ9oqLid2ps+Mrgftsrg==
X-Received: by 2002:a05:620a:4623:b0:8cb:62c3:3690 with SMTP id af79cd13be357-8e78f443268mr4562871085a.13.1777043190723;
        Fri, 24 Apr 2026 08:06:30 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d9abce59sm2293120385a.46.2026.04.24.08.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:06:30 -0700 (PDT)
Date: Fri, 24 Apr 2026 15:06:28 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Sasha Levin <sashal@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	akpm@linux-foundation.org, corbet@lwn.net, ljs@kernel.org, Liam.Howlett@oracle.com, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	skhan@linuxfoundation.org, jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sasha Levin <sashal@nvidia.com>, Sanif Veeras <sveeras@nvidia.com>, 
	"Claude:claude-opus-4-7" <noreply@anthropic.com>
Subject: Re: [RFC 4/7] mm: add page consistency checker implementation
Message-ID: <aeuFnuiYDBjttEKt@plex>
References: <20260424140056.2094777-1-sashal@kernel.org>
 <20260424140056.2094777-5-sashal@kernel.org>
 <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org>
 <aeuC6TJ4XowazVZj@laps>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeuC6TJ4XowazVZj@laps>

On 04-24 10:49, Sasha Levin wrote:
> On Fri, Apr 24, 2026 at 04:25:41PM +0200, David Hildenbrand (Arm) wrote:
> > > +	/*
> > > +	 * Size bitmaps to cover the full PFN range including any holes.
> > > +	 * Holes waste a few bits but a flat bitmap keeps the indexing
> > > +	 * trivial (pfn - min_pfn) and avoids additional data structures
> > > +	 * that would themselves be subject to corruption.  This matches
> > > +	 * the approach used by pageblock_flags.
> > > +	 */
> > > +	pc_state.min_pfn = PHYS_PFN(memblock_start_of_DRAM());
> > > +	pc_state.max_pfn = PHYS_PFN(memblock_end_of_DRAM());
> > > +	spanned_pfns = pc_state.max_pfn - pc_state.min_pfn;
> > > +	if (!spanned_pfns || spanned_pfns > UINT_MAX) {
> > > +		pr_err("PFN span %lu cannot be represented by bitmap APIs, feature disabled\n",
> > > +		       spanned_pfns);
> > > +		return;
> > > +	}
> > > +
> > > +	pc_state.db.nbits = spanned_pfns;
> > > +
> > > +	bitmap_bytes = BITS_TO_LONGS(pc_state.db.nbits) * sizeof(unsigned long);
> > > +
> > > +	pr_info("Initializing: PFN range [%lu-%lu), %u bits (%zu KB per bitmap)\n",
> > > +		pc_state.min_pfn, pc_state.max_pfn, pc_state.db.nbits,
> > > +		bitmap_bytes / 1024);
> > > +
> > > +	/* Allocate primary bitmap (zeroed by memblock_alloc) */
> > > +	pc_state.db.bitmap[DUAL_BITMAP_PRIMARY] =
> > > +		memblock_alloc(bitmap_bytes, SMP_CACHE_BYTES);
> > > +	if (!pc_state.db.bitmap[DUAL_BITMAP_PRIMARY]) {
> > > +		pr_err("Failed to allocate primary bitmap, feature disabled\n");
> > > +		return;
> > > +	}
> > > 
> > 
> > One bitmap that covers all sparse memory available at boot.
> > 
> > Conclusion: Just horrible.
> 
> Depends on who's looking at the code :)
> 
> I picked it for auditability: covering the whole range with two
> memblock_alloc'd arrays means the only thing on the lookup path is the bitmap
> words themselves, which is what the dual-bitmap invariant already checks.

The issue is that we are going back in time to a flat memory,
without NUMA or hotplug support. We need an abstraction that avoids
allocating this memory in enormous contiguous chunks, as thit approach
will not work on modern hardware.

> 
> We could go with per-section bitmaps which will fix the waste but pull
> mem_section[] into the trust boundary, so we'd have to start validating it too.

Page-ext provides all of these capabilities, but as you described in the
cover letter, it does not meet your requirements. Therefore, I believe
a new abstraction layer is needed.

Pasha
