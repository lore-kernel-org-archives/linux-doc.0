Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857C93644CB
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 19:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909059; cv=none; b=QrtyZMhUa5H6Dr62r4M0h/i2qnzOR0nyLhMW5nEtpfF+ZhzjZpWAZuwGL+pJwUOvQWu55A+KEettxjFjQNZB9Es/NQAgr9PVipV2R7gEGdu5321htKamkx0H4MlfJgJVU/C0HUo0af/DudDZKqp0GAsoncHB9kfYD/IhjdBFNaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909059; c=relaxed/simple;
	bh=nAP+UkwFMeiPRtMLEhgLbQeO3ddCP9DTym3xnAPg2B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/4yzBXlvVe71pZyYSjpKxBxOFS+E5T4Xq5IOzTvD5qeSbGF+mr2plzfboZm1l4cmzOrdDuX3RTouyW3VXAf6ov0/4KHjdGp//3HMcicq5SpXeqwq2eZ3Bt3OvX9Zv+99x2ipMsq0PHDgxltV8Xi2FJJmKO0MC5E9h26urbkFgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gdTcNzC+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sfz1h2uT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gdTcNzC+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sfz1h2uT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779909057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fOfRGPugae13jAxurJtrxuSo8jWBso3MtJfxNQrI0Jc=;
	b=gdTcNzC+w7hvYmbIzbpMyMbUKtSskU41Vv0Bi+Sp2wZ5uZHlnOWV+83w4iGJX5SFwrBF7+
	caQlZofSL+DwmGtnRXIp3ynnisHcY1gIpG+tQm1tM6nn2ap9K1iyS7rmjbfbUAtqiBZm/0
	KgleNkWXKy1JGRv3PeXfACEdhsqIQAg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-9VcjMlgtPJuKsRmOpTpigQ-1; Wed, 27 May 2026 15:10:50 -0400
X-MC-Unique: 9VcjMlgtPJuKsRmOpTpigQ-1
X-Mimecast-MFC-AGG-ID: 9VcjMlgtPJuKsRmOpTpigQ_1779909050
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d51ffb59so37121501cf.3
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779909050; x=1780513850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOfRGPugae13jAxurJtrxuSo8jWBso3MtJfxNQrI0Jc=;
        b=sfz1h2uTS5r8ZVhzp3aKesp7EAZAfH3UbsW1sI2NyYs7CIylEt5niUhX2qj/X/xTCK
         Am9PBuwFlJ6txCYqkUXBzaiSDntjA1e3TgirmogUimEf2GNn/C8wTmRCacYylRy1UIUK
         SvMjAZcKBrQLnkj7kMQKcMuRWhNNmMH0+JyijRKiZJV8K2BU/fu5dwXUzS0vdECWT/0x
         LYbtt1TzW7RFmp+lVrrBuNmilhFjK6wb7lsmVo77yur8IufKReR08ygks+j+tx+VjVk6
         WHDl4CDOZKHxsi9a8w1pJW+TrsRiX9L1KOpSz0+PIbwEP3VGCjpohtktgV1driGm8u1Y
         VdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779909050; x=1780513850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOfRGPugae13jAxurJtrxuSo8jWBso3MtJfxNQrI0Jc=;
        b=dkdCEMAmcrfQEOxAV0k6Zw5Bl0eDy6nBOHV9Ph0NLGoquhSINw2FFqedaAuUNBV3Fd
         pAiNmkrsZrCH0/8LXQtY+wEx5Y5fQ0O1TwDe6F4ygH5zhSrtvGUfyKqPAoKggdKuvj+w
         FhRmm3DpyZ3tC27eNCyqDlLtoa2z9KF1HnXINZ4DoOINMDkUhM1KWzhgX395H8fXvXVG
         xUIsO0t4l1atkMs0jfu9IZ0DcKm5amxwZrpsFEAOsQa/GB0W0z3Vh/GZWYkhNn16Y+ea
         Rl0K+EtOyDjeijJkE34GmE9+/zs2+ekE20qudMldDJCW6VVo4M0v+IWGxTQwSfWUhM0K
         7eUA==
X-Forwarded-Encrypted: i=1; AFNElJ//knb+OpszLLy825wtvQnPqnHObiuqK6Oia6QEaMXRT++OMs9yabuDz2PUsHs/zgyYabSmAPYEVkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQe81kavnKe1tpdzi43ytVnC9K0/cUpx/2XIVL4+i0XpckUgQm
	auzTpiRUr6QF2ejuIESLGbsaCQwOHFQ6X2HhZFFs0/OYQOAdnJZ98RkMJ5hOQLK14VsRee0npFd
	KVfamOejx9OqEfhJKw/L2rlDAphlgZ0XqlPPNEcHpXPAvUQy8PH9Mjxma4CGfvw==
X-Gm-Gg: Acq92OGA+0k15j/vGIUL5vi18ZGa8rP2NMM5TMipTlDfHmfY5PDIR39BhXd+Kwg8vAe
	Xf4fEXIslhZ6lmofWt22Re54aYR2RNMZVyt4KNaqa3jkMoL6Sj/29KN3FuqpDhxVAGmNDSINh5u
	Jycw0m0N1VXiN79otYsuCoD1YrtuJ2hIjn6ai3/XZBNWcpUlNAE63P86RGNf8X4Bw2mkCOWquUx
	m1y75E1SE7977YjFb4Aib4VyCNRVjLMJdMTB5W19z51IXbGMAZB8tSGJSwEaFi9a1mC5OGPJcmr
	bpCtmLAx6QJVBX/1cuJqrtOPWjrrmlvEHcPbmv/2PG12TZjjqT0gSdIAnS56r9wJK3M49+JuzdI
	AB6SKAMLKh2ANt8zXA0kt9s2LzKiBbBNlYviqM6d2u8MKmynbGPo0J6pak46JAlVwGHhdxeAwbe
	Hb
X-Received: by 2002:a05:622a:2d5:b0:516:4fc0:27ac with SMTP id d75a77b69052e-516d43e4561mr348875321cf.50.1779909049449;
        Wed, 27 May 2026 12:10:49 -0700 (PDT)
X-Received: by 2002:a05:622a:2d5:b0:516:4fc0:27ac with SMTP id d75a77b69052e-516d43e4561mr348874431cf.50.1779909048607;
        Wed, 27 May 2026 12:10:48 -0700 (PDT)
Received: from localhost (pool-100-17-21-205.bstnma.fios.verizon.net. [100.17.21.205])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706adc8f3sm51751971cf.18.2026.05.27.12.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:10:47 -0700 (PDT)
Date: Wed, 27 May 2026 15:10:47 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Maarten Lankhorst <dev@lankhorst.se>, 
	Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
	Dave Airlie <airlied@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/memcontrol: add dmem charge/uncharge functions
Message-ID: <ahWfypvuTVsB-pHQ@x1nano>
References: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
 <20260519-cgroup-dmem-memcg-double-charge-v2-1-db4d1407062b@redhat.com>
 <ahB7pCu_G4vuswc0@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahB7pCu_G4vuswc0@linux.dev>

On Fri, May 22, 2026 at 08:53:10AM -0700, Shakeel Butt wrote:
> On Tue, May 19, 2026 at 11:59:01AM -0400, Eric Chanudet wrote:
> > Add mem_cgroup_dmem_charge() and mem_cgroup_dmem_uncharge() to allow
> > dmem pool allocations to optionally be double-charged against the memory
> > controller. Take the struct cgroup from the dmem pool's css as there is
> > no convenient object exported to represent these allocations. These will
> > resolve the effective memory css from that cgroup and perform the
> > charge.
> > 
> > Introduce a MEMCG_DMEM stat counter to memory.stat to make the cgroup's
> > dmem charge visible.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  include/linux/memcontrol.h | 16 ++++++++++++
> >  mm/memcontrol.c            | 65 ++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 81 insertions(+)
> > 
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index dc3fa687759b45748b2acee6d7f43da325eb50c1..8e1d49b87fb64e6114f3eb920293e14920290fe7 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -39,6 +39,7 @@ enum memcg_stat_item {
> >  	MEMCG_ZSWAP_B,
> >  	MEMCG_ZSWAPPED,
> >  	MEMCG_ZSWAP_INCOMP,
> > +	MEMCG_DMEM,
> >  	MEMCG_NR_STAT,
> >  };
> >  
> > @@ -1872,6 +1873,21 @@ static inline bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg)
> >  }
> >  #endif
> >  
> > +#if defined(CONFIG_MEMCG) && defined(CONFIG_CGROUP_DMEM)
> > +bool mem_cgroup_dmem_charge(struct cgroup *cgrp, unsigned int nr_pages,
> > +			    gfp_t gfp_mask);
> > +void mem_cgroup_dmem_uncharge(struct cgroup *cgrp, unsigned int nr_pages);
> > +#else
> > +static inline bool mem_cgroup_dmem_charge(struct cgroup *cgrp,
> > +					  unsigned int nr_pages, gfp_t gfp_mask)
> 
> Please follow Johannes's request to pass the actually memory object instead of
> naked numbers.

Sorry, I misunderstood Johannes' comment. I am not sure what to use
here. Since these are called from dmem.c, they don't have access to what
was allocated.

Looking at zswap, it uses obj_cgroup. I thought of resolving the
obj_cgroup from dmem_cgroup_try_charge and keep it in the
dmem_cgroup_pool_state, but that made me realize there is a catch with
this patch set, with something like:
A: +memory{max:32M}/+dmem
A/B: +memory{max:16M}

It gets the CSS from the dmem's cgroup with
  cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
  mem_cgroup_from_css(mem_css);

Which would resolve to A's memcg and not enforce the memory.max limit
set in B when dmem.memcg is set for that region.

-- 
Eric Chanudet

