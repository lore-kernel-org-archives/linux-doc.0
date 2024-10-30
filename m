Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97941EBFF7
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730300472; cv=none; b=jtM77KU/vcfST76DKgwe15e8iNLAxGyEcr9Buz3CDcClhKDhlNbM+exK0D4sFIMtBsqA+dL1VXMq0K4jgDGWuDSrjOSa6MwtUM8BJ0F/6v8Oy0ZjHQyHQM42y1SfjRoyzzRPLAoxpnG/aldD5zuZ6Qp6PhaMJgqfXvYNHFAQXl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730300472; c=relaxed/simple;
	bh=lpvecm1f5pu4GtEx3sl9tf4tvgcFxrIcvbcBaG9U6AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhm9gJb7gbHbF+4Fqgr/BcavkUcARFnwkQN4FokCIq85wWFMggohDjuNqgbJTSY9phAYQKLQa+HI5JFoV/bEQo4pUaGdNUoxLJ4XfpIypBljcYxJro1WMevst0X8kCeKHCMIxBxIZijqktcrDq9rKbYq0m0xdaAlg5AOj7f7xf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=yB+Hbw+m; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="yB+Hbw+m"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-718065d6364so3332277a34.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730300467; x=1730905267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9L+h3DakvrHLU0Mvs5EKdTAhMxHYKDitGx80mazmNoE=;
        b=yB+Hbw+mUJJwxRGyQI9O1JD7i5GtH82yKtl5LcpT0NDXw7JjE/kL4/m6r1LPynd1I3
         eol322+tv0n4VvuA7RD0UYsfZhglqKRQfbxM/e4Lwy35OVe9UxdPFvhMglsOXB77Iseh
         xCsjnjS3eOmYQI60kWutYgeFjGwjv5jkITNypieexmfNm842fdqAhQw6Ft3bNqdzX69a
         enp/0PNOswuXu2oNj6kxrfmOBp6ynjblrtdPCMTi7nNuu+J1cVeHGdgdSQQnsXnEoMPL
         9tUxaIfOJnuOOiXb9N7MMKlx/mcVplQyWAfUoFCI486jzZ/zUapRCmyfPvTfZCVxT8We
         JJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730300468; x=1730905268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9L+h3DakvrHLU0Mvs5EKdTAhMxHYKDitGx80mazmNoE=;
        b=WbPzeiQ/5DFQW0HjIGW4UaeLj/BoP194HfG85QxRVzOUYYxmdQCVs1bBiNgN5LK8V9
         lhQtHdhyU+LbEwUmEzheMNAufra9Fx9zpjngp6s/EAr6QoDtwd5PAp4U8NWrfunJIvNZ
         fA1W0f9JgnZGNd9tepB9WMI4AVjA2vTa2uRFBMYIye11zdMWwmYvcvtpy94Sst8AXXBX
         hWeNrTgdINTI3GLYRLyJzAGwzSBpzIHqNM1uAa2t7MpVWPUwFI3VJJAFPVN0arHvlebC
         poUqAPG7aWgMbqnbOUj76z+bbcIjfnb64nvXKJkJG4FCTvLgMjLAldta9DQzLVPP7pEK
         D66g==
X-Forwarded-Encrypted: i=1; AJvYcCV0CWKLD6HB3L5nnNCjgTCy4Uc7l7l5NXCdctqtxuZgGpnYHy5/x6lqzYnCk4kHKf8KirHjojVbW7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5S7/6Gx11zvzWtpI8AEstLMiLgzapD6JDVuDnxWd0aKS70DS/
	NrirqQ+uTzQopRMdc+ELSV45hm6G85Yznm6MiQF6m1uitxVpMnzRtC09o7qkHNM=
X-Google-Smtp-Source: AGHT+IG158ptjqLIj0gjGFfB685gOEBJUFjuG7Y8dRLeCk9VafXrmZFUa5vVNmgGQg2umHSprc+JtQ==
X-Received: by 2002:a05:6358:729c:b0:1c5:e2eb:2fba with SMTP id e5c5f4694b2df-1c5e2eb32admr285161955d.18.1730300467658;
        Wed, 30 Oct 2024 08:01:07 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-461323a1bf3sm55265351cf.81.2024.10.30.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 08:01:06 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:01:02 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, nphamcs@gmail.com,
	shakeel.butt@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev, tj@kernel.org, lizefan.x@bytedance.com,
	mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com,
	akpm@linux-foundation.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
Message-ID: <20241030150102.GA706616@cmpxchg.org>
References: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>
 <ZyIZ_Sq9D_v5v43l@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyIZ_Sq9D_v5v43l@tiehlicka>

On Wed, Oct 30, 2024 at 12:35:25PM +0100, Michal Hocko wrote:
> On Mon 28-10-24 14:05:05, Joshua Hahn wrote:
> [...]
> > Changelog
> > v3:
> >   * Removed check for whether CGRP_ROOT_HUGETLB_ACCOUNTING is on, since
> >     this check is already handled by lruvec_stat_mod (and doing the
> >     check in hugetlb.c actually breaks the build if MEMCG is not
> >     enabled.
> [...]
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 190fa05635f4..fbb10e52d7ea 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1925,6 +1925,7 @@ void free_huge_folio(struct folio *folio)
> >  				     pages_per_huge_page(h), folio);
> >  	hugetlb_cgroup_uncharge_folio_rsvd(hstate_index(h),
> >  					  pages_per_huge_page(h), folio);
> > +	lruvec_stat_mod_folio(folio, NR_HUGETLB, -pages_per_huge_page(h));
> >  	mem_cgroup_uncharge(folio);
> >  	if (restore_reserve)
> >  		h->resv_huge_pages++;
> > @@ -3093,6 +3094,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
> >  
> >  	if (!memcg_charge_ret)
> >  		mem_cgroup_commit_charge(folio, memcg);
> > +	lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
> >  	mem_cgroup_put(memcg);
> >  
> >  	return folio;
> 
> I do not see any specific checks for CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING
> in these paths. I guess you wanted to say that you rely on
> mem_cgroup_commit_charge setting memcg pointer which then __lruvec_stat_mod_folio
> relies on when updating stats.

Yes, this is what Shakeel pointed out here:

https://lore.kernel.org/lkml/il346o3nahawquum3t5rzcuuntkdpyahidpm2ctmdibj3td7pm@2aqirlm5hrdh/

> I suspect this all is done because you want a global counter to be
> updated as well, right? Changelog doesn't say anything about that
> though. Why is this needed when /proc/meminfo already describes the
> global hugetlb usage?

Sigh.

vmstats is the preferred framework for cgroup stats. It makes stat
items consistent between global and cgroup. It provides a per-node
breakdown as well which is useful. It avoids proliferating
cgroup-specific hooks in generic MM code.

It was a ton of work to integrate cgroup stats into vmstats and get
rid of all the memcg special casing everywhere. You were there for all
of it. We're not adding cgroup-specific stats unless unavoidable.

Duplication doesn't matter, either. We have plenty of overlap between
vmstat and meminfo. By all means, send a follow-up patch to have the
meminfo one sourced from global_node_page_state().

But you know all this. I'm having a hard time seeing the way you are,
and have been, engaging with this patch as good-faithed.
