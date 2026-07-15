Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22533B19A3
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132104; cv=none; b=ldewkUZnaN4t9lkIts/WmPZNL9Wk2OWA84KOMDOI6DwW/jqgCpJo0xKBk8NbofbwSrFV8LN4SjjQuDGEgTq0gk4ATydROriD+x0bBNINcS8iQGBFYnUS6BlhhuiRsWG9KzYwHdpoLDtl2b0uwyuhMcRCRo+OAuThrh8WDUFlCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132104; c=relaxed/simple;
	bh=R5f9j3AATL+z7e7A0vPkCbF3rmalAtfzXiT6uxIySqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3Wma1SRo3MSifhee5pE1kSWHTqwarhaMuwSOHFR2g1+6XR/dpW+XQdRZDGACuEgFKI7ULeTXmvyFS8911U8Ew7snj0s5oC+PmlxHviD62LgVBG8nzfpkONYlAHVvznkBri4S68a5kP+L+FL8laDrL+ERPAX1F2ALTxX4ZkP7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpxzo/IO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpxzo/IO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282131F00ACF
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784132093;
	bh=pVMjnd6ptKwYPB8UkY6qqtALdKO+zAj3uPclax6r34I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gpxzo/IOyN6nBAAjNwp0eeIhsQVbbB+pyG3jrWjPDxNprat4lNwb6YhaOYUN7H4le
	 DH+PlzUORIIWRz7zFOGZVIjyaml/nnyzd+I5OiKahwAo4zeGDrE5GPLv3a9LO2v17e
	 Ros/tdazLIaOFRLC/ItN9lQVRHMuCpkaYJEd4cWo01OTFipblcl87meAd1Nxgm/aIP
	 JglqeMG+IBQnMjmW1kmf3l1K2klehtxH1wXEbHmJFIs9cRTud8wnFstp5r6ifDq9CX
	 FGHoTY9iSbVFBM/C5sYxNx7Zk6eiW36eKH2H0fB+DtCBBuqntMjb/btugH0W5dj9Ww
	 owc/BsjqPglqw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c167bda216fso151920766b.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 09:14:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoHHkaqqTMOZy+j8Z13MZbJH6SlCdCZYLYMsIwO3ZHG5ms9dqe1cUb5K1MpQIqGOOPYoRwGOv2z1O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznxDdFfXgRie9qr9hGa1h8M4l3qqv5N7jEcKhoCA/8++/nTYwM
	esKkhNnc2Nc7wVlzL0yoNgIpqjXALwcB4d7vj/+Yuu5UE80Byf6LjIXVhNirCH2sKqIYOjZawVT
	Hx8yW9JqCWooxbbxYuNz31TUhMWpvMaw=
X-Received: by 2002:a17:907:3e8a:b0:c12:a469:c with SMTP id
 a640c23a62f3a-c161e90a00dmr872937266b.9.1784132092086; Wed, 15 Jul 2026
 09:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-3-jiahao.kernel@gmail.com> <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
 <2bc8e4f6-46a0-5b74-6eaa-59e7aef9227e@gmail.com>
In-Reply-To: <2bc8e4f6-46a0-5b74-6eaa-59e7aef9227e@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 15 Jul 2026 09:14:39 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOFg_mnNGbFFd_h8FAwRCbQ9vXk47EF5f1CLg1cDVGB5Q@mail.gmail.com>
X-Gm-Features: AUfX_mxckocOMDNAXcaDIksTHkGKMb-YRMUFBn4leFJP1SyAw0X7_5cXmfzU820
Message-ID: <CAO9r8zOFg_mnNGbFFd_h8FAwRCbQ9vXk47EF5f1CLg1cDVGB5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"

> >> Test Setup:
> >> Total memory: 32 GB.
> >> zswap settings: max_pool_percent=1, accept_threshold_percent=50,
> >> shrinker_enabled=N.
> >> Allocate 512MB of anonymous pages and fill them with random data (to avoid
> >> compression), then use cgroup memory.reclaim to force a large amount of
> >> anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymous
> >> page where the first 4 bytes are random numbers and the rest are zeros, and
> >> then trigger a reclamation of this 4K anonymous page through cgroup
> >> memory.reclaim. When the pool threshold is reached, shrink_memcg() will
> >> be triggered.
> >>
> >> The test data after running for 120s is as follows:
> >>                             Baseline         Patched
> >> shrink_worker wakeups          5363             85
> >> shrink_memcg calls       11,345,012        188,264
> >> written_back                  40214          40275
> >>
> >> Conclusion:
> >> Under the same workload and run duration, the patched kernel shows a
> >> significant reduction in both shrink_worker wakeups and shrink_memcg calls.
> >
> > Please also include data from the case where zswap store failures are
> > observed and pages go to disk, and compare before and after this
> > patch. I think that part is also really important.
>
> I retested and added some collected information. Perhaps
> `pool_limit_hit` and `pswpout` can explain that batch shrinking of zswap
> can reduce the number of pages that fail to be stored due to the pool
> limit, allowing zswap to skip zswap and go directly to disk.

Oh I meant the other test case with high memory pressure where we saw
a lot more writeback with this patch. Do you have similar data from
that test case?

>
>                                Baseline      Patched
> shrink_worker wakeups         5,363            85
> shrink_memcg calls       11,373,201      180,928
> written_back pages            40,212       40,236
> zswap_store calls            161,190      168,741
>    store succeeded (ret=1)    102,743      127,644
>    store rejected (ret=0)      58,447       41,097
>    store reject rate            ~36%         ~24%
> pool_limit_hit delta          55,826       14,062
> pswpout                       98,659       81,333
> pswpin                            2            1
>
>
> Thanks,
> Hao
