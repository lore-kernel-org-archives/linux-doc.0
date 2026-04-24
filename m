Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941CD41C6A
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 04:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777003436; cv=none; b=i/tAr1JGbBUGIxjDxCQGoNsMoEPdCytSAHXhnBh8Vr+CrdsqtEXAT0CznZEBeL4LlJYlMc8NBX+NsNJK4bebVt5PwWuZbDx2KMU8nFZ1s4Y7kUtzmVog/JlbQwCM2VVn1r+eyOYbfhRWtVe1tWKuDdU7i0uwukGUHIlikGleYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777003436; c=relaxed/simple;
	bh=vFgN2he2wn7NXny2fx3vIJs8kMnvkzqTUSZ0mPgUoMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1NLDBMHLHtngPiE2oTsvmw7XqsQiGVPwgArL2ZCI9WDDppt2vA54GkBbWZ7kwcFDDl/jsASdERHU83x3dpyBdIkgFaN6sfaC4r7xPQumvqKBn8xlMIorH6cEJyHx96HTSP4MJVY0EQLYDF83d0VhQXQBpqJCb3TdZAUVAuieUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LE5Ak+/H; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LE5Ak+/H"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8acb856a674so88634136d6.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 21:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1777003433; x=1777608233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0FSatf25bGDOpWwH0IGYTUNBidZ18cuj6W5qCjaLYU=;
        b=LE5Ak+/Hq4WkxgBgHnsjhWLAGCQZ28AIxOFH5UUuXNJcW9XvsrE1KGN50Ei3W5EyTa
         SCXQHvs/IJC36gZukDdtk3L/nIS9yD4LyRD2IaMGsBO8Unphd4emO2xP+PGUrNC3MPQK
         NtQPdOVFXFH5LAEiSvtf0/tc0s5aWPnEieXa9x25jzrFPIeFLO+bVtw5/EX99eoDVozR
         pHldb4B0SzyA/8lwf5yMQPXg9pwUmO9g/XIAZxDVi50e8Sj5SqF0gG2LIfmGYtSq62ov
         yH9squnmpC553pKeu75AkKkiNaMzRXP+2j7xn2RtYkEPbEOa0+LfSnJo32ETianLvZJl
         WMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777003433; x=1777608233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0FSatf25bGDOpWwH0IGYTUNBidZ18cuj6W5qCjaLYU=;
        b=K+AdYwEUPLcGakDrMeNfiPHeitF0Gc9VmJmGaQTrjvioRWY2gVUAER3al/4jm+HMf7
         keLToA//fu6tY+A1jmrDTH/ThqPL9y6M7CXAhQq7g5lP9+tEv4zqb5bbox6UB3iwAOfW
         HU4uhwAjgCMxB/NJ5M4VnGZxSIfQDI0XrJ1IU5DtzfImmPG5eZplVo8NkaVD3vnGNJ4J
         chV3oWDTf/HkRMamUgRL9wU67/qJ/oDGh0haCeLOBjXaQ+bhcJbMNLtOYKQKX0QIVIL5
         0sjJX8DVlfFFUJ8NMAydFmwodGy5N4MGhU4Rf4arNApTPHeW79smIau/48e7xaPcH1Ne
         7loA==
X-Forwarded-Encrypted: i=1; AFNElJ8H6TbVDcxGHoGPCvgG5tE9A9cP/j9Ef+HY9lJTOB26KvJf++s7uS0GaPQgZ3mnvm3L9llN6L1Fb54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JtaPrhSToinNEqgf5f1wbPNO7I2bt54ozTuIzz8Qy3q7eKGV
	Otb2YuC3tMJlEU7IJ6Cm1HaLLOZK9v70GyDdhpd9K+ZuuFootbPh6HP+ncu1G9jYOsQ=
X-Gm-Gg: AeBDievW2k9ZUl+1XUoEBDYZRbY0oiYk4P2n6wpQ/i481KU0dbU1SgtR50+z9Fah3or
	7zbEB5pX39mpGiXbjbvK56PD+HNmrFinTHRC8AfuRvM+cwOTGmjuzRMDgY036JI4omRURQyT4fz
	H4xH3gwvYK3pezGZ6Z7S84RiKr4j/1AAqnB+kZryRSfTOBmJHuuXdhTuzdsE6TL+gV1AaYykkLf
	4Ogm1lynFYKdUQn7dv31lwyNgVdKJMBMFITvQ7gIgSEl8B0uolBvwkQde/KqJvdbByUQslI6aO7
	Nmd0DPq1Zhfe9ZSaRQncO9mPbFvj6j+9lAkhIqbV8KiybwvIzJC/CBA6BELH01NuBb9cM7s5jSc
	33Y+xHlVOHE2jfl/gaiIbDwcsCN8s5Pqa+MGteGrnuHOWS08Kat5n4jO4pz3E/8+dCMvBphRCGE
	uL4+uK91FG33fmUXF9PixjH7BRjqbQ3+W1vYWAsdW8M2/PbZkzvQQLLxYasZWTCfBQB/RJSwL9f
	wGhb+w/90xyIXNozA==
X-Received: by 2002:a05:6214:5b86:b0:89c:cfa9:f1fe with SMTP id 6a1803df08f44-8b028324ee8mr410764656d6.2.1777003433560;
        Thu, 23 Apr 2026 21:03:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-70-94.washdc.fios.verizon.net. [173.79.70.94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae97d89sm178440226d6.42.2026.04.23.21.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 21:03:53 -0700 (PDT)
Date: Fri, 24 Apr 2026 00:03:50 -0400
From: Gregory Price <gourry@gourry.net>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Kairui Song <ryncsn@gmail.com>, Nhat Pham <nphamcs@gmail.com>,
	Liam.Howlett@oracle.com, akpm@linux-foundation.org,
	apopple@nvidia.com, axelrasmussen@google.com, baohua@kernel.org,
	baolin.wang@linux.alibaba.com, bhe@redhat.com, byungchul@sk.com,
	cgroups@vger.kernel.org, chengming.zhou@linux.dev,
	chrisl@kernel.org, corbet@lwn.net, david@kernel.org,
	dev.jain@arm.com, hannes@cmpxchg.org, hughd@google.com,
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev,
	lenb@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev,
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com,
	peterz@infradead.org, pfalcato@suse.de, rafael@kernel.org,
	rakie.kim@sk.com, roman.gushchin@linux.dev, rppt@kernel.org,
	ryan.roberts@arm.com, shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com, surenb@google.com, tglx@kernel.org,
	vbabka@suse.cz, weixugc@google.com, ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev, yuanchu@google.com,
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com,
	riel@surriel.com
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
Message-ID: <aerrps94j70MkgdW@gourry-fedora-PF4VCD3F>
References: <20260320192735.748051-1-nphamcs@gmail.com>
 <aegUoOiUbjUAH5aT@google.com>
 <CAMgjq7C53WRS5oYxO157mX7JxhfoPoi34k+taiKLrMah-b-iRg@mail.gmail.com>
 <aektdlD4npMVThu3@google.com>
 <CAMgjq7DRrz4Hdy-s4y-C=3BmPt50LKOfdWjjf2mWmCybdRaJ4w@mail.gmail.com>
 <CAO9r8zPvApgxKiVy5NhiWup_m57huF3MTuPvo=iq5kAxjRZC8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9r8zPvApgxKiVy5NhiWup_m57huF3MTuPvo=iq5kAxjRZC8Q@mail.gmail.com>

On Thu, Apr 23, 2026 at 01:47:50PM -0700, Yosry Ahmed wrote:
> 
> IOW, I think the whole reason we want a virtual layer is to separate
> the backends, which would facilitate tiering. If the virtual layer is
> itself a swapfile, wouldn't it become one of the tiers?
> 

Sorry to add to the fun, but i do think this is mildly relevant.

I've been testing hardware-compressed RAM as a swap tier (CRAM) w/ vswap.

Will hopefully be publishing soon - but was waiting to see how vswap
would go first.  But I think this is a good insertion point.

With vswap - this integration was so absurdly clean.  We just add
VSWAP_CRAM and being able to writeback the folio to zswap or regular
swap was surprisingly straightforward.

The alternative was to inherit an absurd amount of boilerplate from
zswap, and then the complexity explodes if you have to decide whether to
go to backend X or backend Y.

So I just wanted to say, in support of this series, there is functional
value in the virtualization here that isn't fully represented by just
zswap/zram/swap interactions.

> I think this was discussed before but I still wonder if we really need
> a reverse mapping, if it's only to optimize swapoff then I don't think
> it's a requirement. We can still scan the virtual swap layer to look
> for slots to swapin. It would still be better than scanning the page
> tables as we do today. But I think there were other use cases for the
> reverse mapping, I just forgot what they were.

For the sake of discussion - there may be value in the reverse map for
CRAM, since it can soft-fault its folios into page tables read-only.  In
this case, you can have multiple mappers in various states (softleaf vs
read-only).

In the case that you want to writeback a multi-state cram folio, the
reverse mapping may be useful.  Right now I'm using rmap, but maybe
there's an optimization here.

Maybe not worth it "until something actually uses it" though.

~Gregory
