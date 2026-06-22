Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559BE3546E2
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122654; cv=none; b=sPBdYRRnXYQFJ/+frEKHhga6Afl7LdBlm2r1j+va62t9XKtyATofwJQ/IMiiiBrQ8/6VUyw6AdX9MvO8NyYfO5BUDHJ2zV/rFaPkO/sCZ4pHfof4z0+s8W2M0PaPj/uKPDRAQVnFT3vExN/PxDs7u5qG22k3OLw5cApD39qoDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122654; c=relaxed/simple;
	bh=HAPb6vID5TOnSmQEyGi6lMY9UfOIo9MY4PwkdbXh7mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0q9c+2EnO0YP5mshOq2few4MNXQuIPl2bKDTSHZISBf1TsNc8YEaHGC5pUiU+8p5BY+pHOcUJIp1hdRR+uYejw6JGGoC43NrdkY4HWegKT0EKeNKHcwMj4iDxmteQZOoWsYtpevJzaxJaNhZ5PmAvNQxC/iZ1r0m3pVeiVRsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 22 Jun 2026 19:04:03 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: youngjun.park@lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.154)
	by 156.147.1.127 with ESMTP; 22 Jun 2026 19:04:03 +0900
X-Original-SENDERIP: 10.177.112.154
X-Original-MAILFROM: youngjun.park@lge.com
Date: Mon, 22 Jun 2026 19:04:03 +0900
From: Youngjun Park <youngjun.park@lge.com>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Muchun Song <muchun.song@linux.dev>, yosry@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
	nphamcs@gmail.com, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v4 0/5] mm/zswap: Implement per-cgroup proactive writeback
Message-ID: <ajkIkyajJEW2b7/0@yjaykim-PowerEdge-T330>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <CAAAF57B-7DE9-45EA-8AB6-DE6CFAF60F47@linux.dev>
 <26a034b3-9cfa-e4f5-eea1-e69fbfff02b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26a034b3-9cfa-e4f5-eea1-e69fbfff02b4@gmail.com>

On Mon, Jun 22, 2026 at 02:08:49PM +0800, Hao Jia wrote:
> 
> 
> On 2026/6/21 12:20, Muchun Song wrote:
> > 
> > 
> > > On Jun 18, 2026, at 12:48, Hao Jia <jiahao.kernel@gmail.com> wrote:
> > > 
> > > From: Hao Jia <jiahao1@lixiang.com>
> > > 
> > > Zswap currently writes back pages to backing swap reactively, triggered
> > > either by the shrinker or by the pool reaching its size limit. Although
> > > proactive memory reclaim can automatically write back a portion of zswap
> > > pages via the shrinker, it cannot explicitly control the amount of
> > > writeback for a specific memory cgroup. Moreover, proactive memory reclaim
> > > may not always be triggered during a steady state.
> > > 
> > > In certain scenarios, it is desirable to trigger writeback in advance to
> > > free up memory. For example, users may want to prepare for an upcoming
> > > memory-intensive workload by flushing cold memory to the backing storage
> > > when the system is relatively idle.
> > > 
> > > This patch series introduces a "zswap_writeback_only" key to memory.reclaim
> > > cgroup interface, allowing users to proactively write back cold compressed
> > > data from zswap to the backing swap device. When specified, this key
> > > bypasses standard memory reclaim and exclusively performs proactive zswap
> > > writeback up to the requested budget. If omitted, the default reclaim
> > > behavior remains unchanged.
> > > 
> > > Example usage:
> > >   # Write back 10MB of compressed data from zswap to the backing swap
> > >   echo "10M zswap_writeback_only" > memory.reclaim
> > 
> > I’m not entirely sure if other candidate names were already brought up
> > in previous discussions, so my apologies if I'm repeating something here!
> > I do think expanding memory.reclaim is a great approach. That said, I
> > was wondering if we could make the interface a bit more concise while
> > keeping it flexible for future extensions.
> > 
> > Essentially, what we want is to control the specific targets of the reclaim
> > process—such as file, anon, or zswap. What do you think about using
> > something like "source=zswap"? For instance, if we want to reclaim 10M from
> > zswap, the command would look like this:
> > 
> > 	echo "10M source=zswap" > memory.reclaim
> > 
> 
> Thanks for the suggestion. TBH, I personally think your approach makes more
> sense than "zswap_writeback_only".

> Hi YoungJun and Yosry,
> 
> I am not sure if this suggestion from Muchun could decouple zswap proactive
> writeback from the swap tiers, or make it easier to migrate to swap tiers in
> the future:
> 
>     echo "10M source=zswap" > memory.reclaim
> For now, we only specify the source. Later on, the swap tiers feature could
> extend this to control whether to demote to SSD swap, HDD swap, or other
> tiers.
> 
> Thanks,
> Hao

Hi Hao!

I also preferred sharing the `memory.reclaim` interface in the future swap demotion,
since it already takes `zswap_writeback_only`.
https://lore.kernel.org/all/aieUQUBHI+E3uNPW@yjaykim-PowerEdge-T330/

Alternatively, we could use a separate interface as Yosry suggested
(e.g. 'swap.tiers.demote'?).

But as Nhat pointed out, allowing user-triggered demotion from the swap tier
perspective could lead to issues like LRU inversion. We probably need to
discuss whether this kind of user-triggered tier demotion will actually be
supported at all.
https://lore.kernel.org/linux-mm/CAKEwX=NfSy0XiD_UMsDOHGCwpE7sYmBmhV4Y9vk_cbnnr6J6PQ@mail.gmail.com/

So, IMHO..

1. If swap tier demotion is NOT exposed.

We can simply choose between "source=" and `zswap_writeback_only` based
on preference. (since there is no need to consider "swap_tier" demotion.)

However, "source=" seems to offer better extensibility if it is expanded
to file and anon use cases in the future.

2. If swap tier demotion IS exposed.
We need to consider integration vs decoupling.

(In my view, This is a design consideration. avoiding potentially
redundant interfaces vs adding a new one if it is architecturally correct.)

2.1 Integration
 - Integrating into 'memory.reclaim':
  - "source=": Seems easier to integrate by explicitly specifying the target. (Your suggestion)
  - 'zswap_writeback_only': Harder to integrate than "source=".

 - Integrating into 'memory.swap.tiers.demote'
  - 'memory.swap.tiers.demote' could absorb the memory.reclaim functionality.
  (But since we only want to allow tiering for vswap+zswap cases like
  the zswap writeback feature as we discussed, the reclaim interface behavior might
  still need to stay for zswap only.)

2.2 Decoupling
 - 'memory.swap.tiers.demote' handles other swap devices (excluding zswap),
while "source=" or 'zswap_writeback_only' handles only zswap.

I think future discussions might lean toward "integrating into
'memory.swap.tiers.demote'". Therefore, from this perspective, either
direction seems fine. However, I slightly prefer "source=" due to its
potential for other extensions.

I don't have a strong preference, though!

Thanks
Youngjun
> If we only want to reclaim 10M from file pages, we could easily extend the
> syntax:
> 
> 	echo "10M source=file" > memory.reclaim
> 
> And of course, we could even combine them down the road:
> 
> 	echo "10M source=anon,file" > memory.reclaim
> 
> to only reclaim anon and file but bypass zswap.
> 
> Just some thoughts of mine.
