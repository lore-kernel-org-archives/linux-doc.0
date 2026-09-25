Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9124503EA
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342155; cv=none; b=sUPxoNCFPoO6U8qDlYjZLHRafTFavQGwIbS2eCPujjaLRKueunngI1lwnHjWL7ZB/syJiID1QJLMbMAcBhW06dZDK32sb7E5HdBZAng+IYAzSeYUnQvfhMhgWuR45wAqkKnKY6nE3Mok02NW9VPnzB0oK7urGv+ltIngSkyRK7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342155; c=relaxed/simple;
	bh=xglNrNWtcu6+H7u8QAC0hzG2BK1Tz7ZP2Z2AB4AJpKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0q103xf6ce7eea3sjEgPU62QBnuWLWsT/77po2YsTqNDO2i8sL+Hpn17Tb9UMIiUZuPXT+5wafjMptuvoRHcYuC5UzDzwZHlA+Kvx6OdmKGPTV2LivEvTIRphla7jBF8p6J+8nOrLfYibuRbZLdMAzWHd0b+gYD+GL8OGP8azk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3A1P/Kx; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3A1P/Kx"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0c52f9a45so297294a91.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790342138; x=1790946938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h6UEC69eQqwCWcd1A6+Wn40mq06Knc91URsacVS3+bE=;
        b=F3A1P/KxB2bz6fNSgW8fjmX53MnyhZAPvo38IlwEY2Ie9YSvqyVKN9Avg7JYWg6Ij/
         3rO7iMmNKJN5qncGkvlfqw3sUECx5PlgStkRWHG7IxiQ6OyBwxuTyH02QRRsDn0rS+Io
         kv6Qq/yfkN4cyWcDr0+05AsdbKCXNv/rDE6V6g6MmE9sWFPp4kneBGPL5USFqfNVgZRB
         drolxXofjymIq1r6CfElSTkQTQFW1cnLjBah1ILxXwVoYv4n1R9AXDru9tEfO39+3HLI
         JELYuIX4H5yY+Q9F4rlk3a/qYao/oNZUr8uDFDeo+5J034rLuBfI6ho3e9BcUZa6E1Hy
         gzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342138; x=1790946938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6UEC69eQqwCWcd1A6+Wn40mq06Knc91URsacVS3+bE=;
        b=eQ1dNxaGF++Tqbwwe1u87qjWQYnK2Zk5FQlFsq4+AvCPC4Z7lkivhZAlzBjopuGEA9
         2CUZHdCwv6edOmT5CVnRg9aqHd6Ite9cvZeE3oK7GZM5FnSRZXCwupqZbQfmvDyA6kQP
         asYqvSk+ap3wYfP1Ulh+lh6WayFl0hzv/6RMGKPGFuVisiib4r+SHfxzCn8wiuyg7j7F
         mN8daglG9U6lzPOdURSgjD9Wc9mJNod8qmH0WhAtgOFh+r7nO7P3VHU+QoBYJBVk5B9t
         Gd35/B8CHHC3OE5r5GXuiOVyX1HDui3PsRY7qn3S9tHY5rjFKRai27Flpfv6RnGlAjoX
         NOsw==
X-Forwarded-Encrypted: i=1; AKwUvBwej/NOM2czF8BT62qJ9mgOUb3m5dXhaEUj9u5ITI/J8Zo7eXtWk7wieBkM0R1z3FBu/iH/59NtrqA=@vger.kernel.org
X-Gm-Message-State: AFuF++kn7XPn6twj/rA4CIQzTIMhnTZlXGJ2ikidLxHA0CF/ak8CWFPr
	M72nvRM48fj9zcdJbWT0pw57aazrmrj5CmqwD+Wu3cQFw/+iD8XySFT5
X-Gm-Gg: AYBFou0gVU56br1ymwGPHvT5mSjNrbVENdFoJBoaB8PwbSwa7axnOLpbDgR84fdNXIH
	wxVvqnvHBiWyCm2T36yHepfZ5Ao9j/8O+rgE6ysUxEwIuNBNLB2imdVPLhw7TqP44yQD5QHN6Z/
	LRSRq5ldb5smGbPxFkmpyvBFZeu6swb+HROFD+rb0V8gCFsV9wy5wstJZ3dQBgGUYPv+dLG0gUx
	DgDQeTFnpYWitxnwXG0G0NaE7/+7nfD3HsgfSXPB97sGmNtrknm1P9Nqs3okISlHL/8DFHRusgC
	bY6hbp9En2DIEpHapnHyTw6tHpoPIHfK2lrI/AQanI8ArlopTiPxJQtysRs11p/v6XNPsUpDcmU
	ptWO7vs8+N0gQAUopQ/nmjhIzp2L3sNYMWtc3mrpA7muWbXDXXE3QdbZXz0HoZMyII2rTVjStTt
	MpMzYUPcFfvk0VK8d3sMJ2D3cbGfnfkqXqUvkh2lnhHMtS0qrFSXG06S9HrEgn3k4ymToHgLsgW
	dTLR9Q4oedxhAcsWo0LPIWOzLm45ZcbL21RpdsfR0RG3/siQg==
X-Received: by 2002:a17:90a:d603:b0:39e:6c68:1550 with SMTP id 98e67ed59e1d1-3a098969ba9mr4326406a91.24.1790342133557;
        Fri, 25 Sep 2026 06:15:33 -0700 (PDT)
Received: from KASONG-MC4 ([1.203.116.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99dcd78sm4675782a91.15.2026.09.25.06.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:15:32 -0700 (PDT)
Date: Fri, 25 Sep 2026 21:15:17 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Rik van Riel <riel@surriel.com>, Baoquan He <baoquan.he@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>, Rik van Riel <riel@surriel.com>, 
	Baoquan He <baoquan.he@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Gregory Price <gourry@gourry.net>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arUcil9kxUPiymXI@KASONG-MC4>
References: <aqQrPLPXHXiuKup0@linux.dev>
 <aqjcFb6MFNiA6n4V@fedora>
 <aqjpYHbZ14A8xRtK@fedora>
 <CACePvbUwTxcMPVK_1GAz5gPDdh0BV9JZSnKXaUFLqDHBzBmPQg@mail.gmail.com>
 <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com>
 <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
 <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
 <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com>

On Tue, Sep 22, 2026 at 09:44:37PM +0100, Chris Li wrote:
> It seems you are talking about a different topic: the vswap charging issue.
> There is a golden rule that we should follow: don't break existing
> users. At least with the same persistence, this rule should apply
> universally.
> In the swap tiers discussion, the UAPI was such a big deal that we
> couldn't implement new UAPI. On the other hand here we argue for
> liberally changing user-space visible behavior.
> 
> BTW, I already shared that changing swap counter charging will break
> our and others' existing deployments.

Hi all

As I read the threads and try to clean up the requirement, just
realized that I forgot and ignored something previously. I think I can
share a few things here.

I also see that Rik mentioning that:

> It adds up anonymous, file, accounted slab, and
> (after compression) zswap memory use for a cgroup,
> and can be limited with all the usual cgroup
> limits.

That's very true, and that's also the one reason we can't
migrate some workload to zswap easily (at least yet) :D
See below.

The discussion on this can be saw two years before (I know
things are different for V2, so see below):
https://lore.kernel.org/linux-mm/CAMgjq7AYA91f4g-bknUZOMg6hApTD-X5LqjcTBN2u-Lu8pjs+w@mail.gmail.com/

An minor update for that, memsw in V1 serves pretty well (we also
modded that part and would try push to upstream if doable), and as
memsw is missing in V2, we can still workaround that using
memory.current and memory.swap.current. BUt missing the offloaded
part in memory.swap seems a problem.

First a little bit off topic, I'll be really happy if we can make
both compressed memory and swap as separate counters (I even once
tried to implement a zpool accounting to account compressed memory
in some unified way, but, well, zpool got killed before I post
that :P), or at least a way to do that, e.g. something like nokmem.
Due to our real usage:

With compressed memory staying in a separate counter (which
we manged to do that with ZRAM) the memory.current + memory.swap
(or, memsw for cgv1) could be the exactly planned or sold size of a
container, the scheduler (e.g. from k8s level) is fully aware of
the packing rate of a host based on this reading. and can make
scheduling decisions based on that. And can control it by
adjusting the limit two combined.

But with compression as a fixed part in memory.current, first the
compression rate is totally uncontrollable, both the user and us
will be fully *unaware* of how much memory they can *actually* use,
that makes the planning really awkward. memory.max stops being the
bound of what we planned or sold, anything compressed lets the raw
footprint go past it by however much the compression ratio happens
to give, so what we oversold is bounded by the workload's data and
not by anything we configure. We can substract the zswap reading
though with adaption, however it's hard to change the performance,
OOM behavior or reclaim behavior:

As you may considering compression is trading CPU time with memory,
then two things here: the user could use more memory than we expected
by burning the CPU. And, some users has a leaking application, the
application could goes super slow or experiencing high CPU usage due
to memory being compressed. They really just want to get OOM killed
in time when ever the application leaks beyound a threshold (and
yes that is a real and actually practical model for many applications).
And, we can't simply disable memory compression for them.

In many cases we just want a best effort compression to make space
for low priority tasks, and do not want ordinary containers to use
compression at the cost of lose of performance. While still has
a fixed limit as usual. So simply disable memory compression is also
not the plan, we do need compression to make place for other
applications, we just don't want their real raw usage to exceed
memory.max, and we can dynamically adjust memory.swap.max to
control the oversold part, compression or physical.

And this is not about residency, so memory.min/low don't help here:
it's about overselling, and about not leaving a container thrashing in
compress/decompress loops instead of being killed.

And if the memory compression is really fully transparent (not
doable by software), yeah, that's great as there is nothing to do
with reclaim.  But, for now, we have to go through page fault / folio
allocation / map it again. So For example, if we already have
memory.max == memory.current or under high pressure, then now
doing any read from the compressed part would need to some
require further eviction first to make place for the decompressed
new data, this is not like any kind of "real" memory, something
feels not right here.

Another thing is that I think we has been assuming that physical
swap is slower than compressed memory, which is not always true either.
They all need to be read through page fault, the page fault could
be the real blocker here rather than IO or de-compression.

I also want to separate two things that I think got bundled together
here: not requiring a physical slot behind a compressed entry, and not
charging the raw size to the swap counter. The first one is great, yeah,
and it's exactly the part we want, it's what makes compression usable
without provisioning disk. The second one is a policy change, maybe it's
not needed for the first stage, charging a cgroup for the
memories it has offloaded doesn't require any slot to exist behind them.
If someone wants to run memory compression with no disk at all,
memory.swap.max defaults to max, so that still works fine, right?

And I'm not saying "keep everything as it is forever": it is that the
raw offloaded size (the entries, whatever the backing ends up being)
should stays accounted and enforceable, and that anything which wants
to describe physical storage gets its own counter.

And I'm not asking the compression layer to have an opinion on how
much compression or ratio is too much, just think we need a sane limit
for container schedulers to sets on top of it.

And "it's opt-in so nobody breaks" doesn't really hold for us: we do
want generic compression solution, that's the whole point, so we would
be turning the knob on and losing the counter at the same time. If we
want one generic solution for memory compression, this is not opt-in.

And if we check again, currently, with upstream kernel,
using ZRAM, we have:

memory.max: control the raw usage of application.
memory.swap.current/max: controls the offloaded size/limit of a application.
With (memory.max + memory.swap.max) <= planned usage (and this is memsw).

We can keep the compressed part in memory.current of course, as already
did in upstream with ZSWAP, and things can be further adapted, we
still have:

memory.max: control the real usage of application.
memory.swap.current/max: controls the offloaded size/limit of a application.
With (memory.max - <compress memory> + memory.swap.max) <= planned usage.

Things are not too crazy, but if we lose the compressed raw size in
memory.swap, things seem to be out of control: the raw footprint can go
past memory.max by whatever the compression ratio happens to give, and
nothing bounds it in raw terms, memory.zswap.max is in compressed bytes
and zero-filled entries are not covered by anything. I can't see a very
clean offloading model for us here.  And we note, use use both kind
of deployments, pure compression and hybrid writeback.

Just for reference. Maybe a seperate counter, tiering, is a better idea
than changing the swap counter?
