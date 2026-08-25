Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EACA3C8724
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685566; cv=none; b=bMr+uLulALTl6PdMbPd+sFrOrmdqnmivaHRZUOru7hA1mTTkykiZLJLecCaMwEk45++jwbw1LgaWR30SWr/kKbOkdWP5sWhWe4opIvDoAROGg6tiUw6zO2FtuJ9g9SWCZxv+IdM+PnKtUISS+WYRa7HKDQaKnilX8Wa4rTT2Wqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685566; c=relaxed/simple;
	bh=GsOPJZcTVc+ME89TiaOK2VXf2Zq9McrDvazzmKcG8ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVEQZGhfZb355zx17U1ol4O5DKXnpPSw5XCRGk9DRAE69USDPwiKUAt284bIu3+U4ksIeuHZrmcxcEeduhS0eDZKfzhZ89XUohjiU7qobCl/GuUcZQRACn+74lCiIpEiZGIYIQ+pd3Zwrf4WUEyYfYRGjjixxZb0ZV7SrasLacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YgVFskEO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YgVFskEO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so256158a12.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 12:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787685563; x=1788290363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vh4FcSFvMp+s/1TmS+CMXh1e8vfSlZ803gr4X3HQDps=;
        b=YgVFskEOfxr1dfBtZVP8/3z4x9+rclphba1ZrDtgUEc43UM4+NAb3bp/1SrVaHcMbr
         LeQcp+9JqbtKWZKxCE2JxIx69bvmPNSd3UGfbGuk5v4Hh3hfF83c/9NuyFvdkLF0Pd6y
         AMN8hjCm9E6MaS4ZykttshFWKBbNPzK4DhbihppGUdXRBdRdln5q00LbKfUjCOdbG5pl
         An194eJjMQNyLBycRWBhMrRQMaTPgmpZfGjne6S/NrtUoub5c0CpcyzbxbgrsNm/EV5u
         rSawWEX53n0HB3ZQHxudaWCVtVBqEFcaRGzWWtIUL9ST0YF5SfZYbw5oP70xxNSQ/AV8
         gRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685563; x=1788290363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vh4FcSFvMp+s/1TmS+CMXh1e8vfSlZ803gr4X3HQDps=;
        b=iV4EB7fp1VlvPrLpgHI3o1GNnAMQ7z7TJ4V6TXVAhJFacG5OZwW90LuhGjSMQXqr+H
         C6V6aoqWgCAhlLz+cUeBf4knEG40I7RsatqAzPxpq656h+ohxsSVnrCev8zCcxx6sF7+
         GxTV7oj5rxIsm19tmjM6I9lnUw0kgwsWwB+SbrsNkJLYMXwITkkq38W57FP+LpTKHKz1
         pr+eCa4JKENQelYU+uRz6E7WOhp27gWIkQiCC5HDm/9UAx28VchjGTB+9Kr3aav5y0nl
         /Sbk1N94F5DXTDQEkEpI1HPDTWxEAF93l/J8RTVSxaXs0aHqimHmFJWeI48/mNSAVYpg
         7vNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXxqWyZBrF41mE/EckcG+Wu74dD2G5exgGj96ZL3WTArIn63/FBD4qNuWpMEN6RKL8BfQ2LwUjEQI=@vger.kernel.org
X-Gm-Message-State: AFuF++lHhYt/1hD1KPQ4ytm89dt7fXmCRDegSPm5/pfIsHSSkzB5EaGG
	+XiQO2WjYeyR4eLFys2zEKQEzk49XEy/VmMDbeMgMbiDKEp6eLqn3B3YVjEvQUsDwiU=
X-Gm-Gg: AR+sD1182ZC3y/jnrKQwwn+hzffsxvDELrcKp+HdnoWqQA4aNHeAxT7YJdLosh3doWG
	699Duqx+n0DKryfYDoq+CTK93vnknWSaymeLvs12sFp84/Jt2j7WaizNdzG7yfAxqLFWgQpfo84
	3yDE0Jr5/rDDYHwuyuETWnnga7UjzkRvcw31cKCM3Uat5LAd10OiPX1vdtlzZC9AOdsUEz46vcf
	IGjgU9+15PI/NNVqRe8AT39zMA16MSwWTyC3K0aLqaiv3YFZp+uw5BwmeC8bb1l3YQaqB0uLFJa
	HlACLsYsYlo6hniHEHGpI+h5zLaCYZdMcudwiuSx3HroiDCd+pV0GiMnVnTvraWtgePKXojWhsB
	CK3dGohG0rci4LqMFYk/Pnq4BHaQHtz3FKEEhf+kNLAA57KijBFtJDn7VBAkelFz8YZ/D0AVDWZ
	8fyIuoBi+o8OMeyY0G3Mlm7gpjyhl+5UyGzjTiS+HkaZcVSgYpIY7p40uPVWZG3YPW9mZL33Gpq
	c8l
X-Received: by 2002:a17:906:f049:b0:c24:7cb5:d617 with SMTP id a640c23a62f3a-c250bb7e76cmr111451066b.1.1787685562796;
        Tue, 25 Aug 2026 12:19:22 -0700 (PDT)
Received: from localhost (109-81-80-32.rct.o2.cz. [109.81.80.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fda44sm132189066b.14.2026.08.25.12.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:19:22 -0700 (PDT)
Date: Tue, 25 Aug 2026 21:19:21 +0200
From: Michal Hocko <mhocko@suse.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>,
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao3quaSze8YjPjxZ@tiehlicka>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao2t6HP-Zt5KDg30@tiehlicka>
 <ao3UKM5SbxBmxuR0@echanude-thinkpadx1carbongen13.rmtusma.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao3UKM5SbxBmxuR0@echanude-thinkpadx1carbongen13.rmtusma.csb>

On Tue 25-08-26 14:33:48, Eric Chanudet wrote:
> On Tue, Aug 25, 2026 at 04:59:52PM +0200, Michal Hocko wrote:
> > On Tue 25-08-26 10:47:53, Eric Chanudet wrote:
> > > On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> > > > On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> > > > > CMA allocations are currently unaccounted for by cgroup memory
> > > > > controllers. As system resources, they should fall under memcg, but CMA
> > > > > areas partition the available space for different purposes and memcg
> > > > > doesn't have a good representation for that.
> > > > 
> > > > Which CMA usecases are covered by this work? It would be also great to
> > > > spend more time describing usecases.
> > > 
> > > We would like to offer some usage guaranties to userspace processes
> > > ending up doing allocations in CMA.
> > > 
> > > For example, a shared CMA area is described in device-tree for an ARM64
> > > platforms. Userspace components could then, for example, allocate from
> > > it through the dmabuf heap, or a device or framework-specific ioctl for
> > > that matter, to use the buffer with sensors. The dtb may have other CMA
> > > areas described additionally that may or may not be used by that
> > > component. In this context, we would like the ability to limit one of
> > > the userspace component to over-allocate and choke the other(s).
> > 
> > How exactly is this supposed to work? How is the CMA access controled
> > and opted in for accounting. What happens when memcg limits are hit. And
> > many more details, please.
> > 
> 
> The administrator opts in by mounting cgroupfs with
> memory_cma_accounting. At which point the cma allocator will charge CMA
> allocations against memcg and manages a per area counter depending on
> what area the allocation was made into.

So each CMA area will have its own counter and limits?
 
> Assuming memory_cma_accounting is set, if a non-root cgroup makes a CMA
> allocation over either memcg's max limit or the per-area limit set by
> the admin, the allocation fails with ENOMEM.

No memory reclaim is triggered?
 
> If memory_cma_accounting is dynamically unset, no the CMA allocator no
> longer issues charges. Whatever was already charged can be uncharged
> when it gets released.

I do not follow

> It looked consistent to use memcg since movable pages from regular
> allocations may end up in available CMA regions until a CMA allocation
> needs the space and has them moved. So in an extreme case, hogging the
> CMA space of a large enough area could trigger system memory pressure.

I really do not understand what you mean here. 

> > > memcg
> > > looked like a good fit to achieve this, albeit handling the areas, so a
> > > cgroup has a quota in a given CMA resource.
> > 
> > Please expand more on why do you think this fits into the memcg model.
> > AFAIU we are talking about a unreclaimable memory and reservations of
> > CMA areas.
> 
> Since memcg already accounts for some unreclaimable memory (kmem,
> hugetlb),

hugetlb pages have their own controller

> or induces failure if no reclamation is possible, I did not
> see CMA allocations being unreclaimable to be a blocker to track what is
> otherwise system memory.

yes, we can have unreclaimable memory charged to memcg, that is not a
real problem. We have all sorts of memory consumers that need to be
capped charged to the memcg. If dmabufs are another ones then fine, just
charge allocated pages from the cma area. It is the "make all cma users
memcg aware and have per cma limits" that I am really struggling with.
You cannot really assume usecase, requirements, lifetime etc. for an
arbitrary cma area. I do not think this is a viable way forward. Focus
on your real usecase, which seems to be dmabufs.

Explain what do you want to achieve and then we can think whether memcg
is the right model for that usecase.
-- 
Michal Hocko
SUSE Labs
