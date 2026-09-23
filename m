Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22811531AF9
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171765; cv=none; b=t4oIuN2ohcUhy+7f/6AcHXIbtUCqhqHHnQHwdMJt92vz5tnfOt5TNogObRt+LHhFrma0kV+Px5lnTbJAE/KwUGEB4L5btAtC3bpth2u98/9BHVf1adF/awFw2ZWJ6x9HOGFBZ7AaeULxkAY5+/XJ0uL2sAYZUNxd8b5HZau4HfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171765; c=relaxed/simple;
	bh=51BxNxE6qUpfl1S4HbyYFu+F0ILsO4eP8vqT4GlKj60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzx3FswQ53flxVvF0ocY7rC0qcbxG/NgBZ/tEibInZmpuYQLhZM/6HBd4DAQeSvlfGUTPnzAmvWA78ZeSb/ww0wruZti89v5isBWmfX9CCa0xioZpG7yVE4LC4DRpGjaYh4TPtxsbMHawPOU09IPgQoY48MCwZw+ZB8rY5+cc7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=uWCboD6L; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="uWCboD6L"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91415b09bf9so2542496d6.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790171761; x=1790776561; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXC2nmOyFn84bCUp7WE6WyZCEN3lbi386wtQ70wZOAo=;
        b=uWCboD6LCoqNfUNRjAbXiGxDjAtAqkKVq6cpWz0auhXfGRKEBn9D00a3xvxpRpe7XD
         GEMCOFoGMcy5Ux/Rg80hHOLVsW2ZWMeza+EWtvJGnbObxgAmn7FOSY3QuBmepQvjy7cf
         bW/G7f/McEWpfr3tB/Cdd3enCDbX58PHLkRLZnpIOPLHwH7vqqPvgdiP2cL1iJUJPfuv
         VZ3vhQ+hGzcYGOTKvO5NL3xyNmr6pbEwtsrEUuTSKfb+3PdKyuWsbbZ3dstaOtMaVd6r
         OczyDR27xBOourn4w2xbNXWNeK+5nOVW+18MypLsgBUpO3w4izDWtu5z2wvQ9TiqDu1H
         qztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171761; x=1790776561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fXC2nmOyFn84bCUp7WE6WyZCEN3lbi386wtQ70wZOAo=;
        b=W1cVv+gIa403OGikmTfj4Y1S0zJcRWxkJ2YcHUEFDokoxpJ3AMftt9BIo66i4tvdUZ
         3Gj4SMNkdi7hpRcoWmLnlyuyEJaZwc/G7vkvVbTd14bcPfCrQID0UqNXBxP43xehROA+
         EDJ91XqKqNdVQ6ARS+cgLoy3pO1/HIsGX0WdHorYAmrPr5T45Ilz0sEA2GVj58LC2I0q
         DRY2BCRDBjHcxE1cXHyIA2+cEpl/kezHAdNfPJEU4/NetraeA709u6uBcmaFwXEOcMMh
         /RkWtJb3cowe6oZn47etG2BSfPpxBUC4nWcAg+Gc7E6TKDY4ziahHhNW5RxXAQIkqHKb
         jQMA==
X-Forwarded-Encrypted: i=1; AKwUvBxLkSTHf36lidQlTYbKBrau8Zn6n5fgB6la97aVJ75XUhC4IR0PBBObMvFUniL8iEqk50PJUP6MX00=@vger.kernel.org
X-Gm-Message-State: AFuF++njSE/c+9zp5c3fCwFhSdwrGUUqqZRa6uwTrstae0saAFt5At+7
	nb+9mbSeWzIacXVA4RVUZa3ZLv2GJhXDafKEU+AVSbMBmXrRbJ/b5/Xh8TGMVzEbt3k=
X-Gm-Gg: AYBFou2yabUyNFpSxGhQto7nLCqXrJS//gNKI7YFb/Sd8rZQI0gu0BvUe9Udj3lhD+E
	Xmaf81SnPYyk9xIyAbUShhckXUveIPY3+nPD9kQGl5WIHd8CHyHo75WG5crJGMtEUSbgb0W9dO7
	qMuE7w+56t8mNnLIP28a7rwSSgEPWmi+7SwW49yFfeizrJKN0EKPDR+dQwsuk0gKJH4gdYbaOEn
	Iv+CS2szeCDmaUn/eaDmmJm0c9hvujK1JJOMEN4Wu9L/1V85eHyAOUIsHdiPwpFyhjOFt+zxv+2
	2NlRKR3MYi5xgVtHqBXUCjRH+DC20/taaChkBRMXpfdW4/4n7a1crEbLDEXagxsAt/IR6Rdf+WG
	N62gb7BgPpMoOszjW7uLaHkARjw2LNOGm61ReNNHxJdD+DHzY88NTxH1wc1USI+JrJfyI4WPtdV
	m57bwJOf1h3fdJTDmD17Uo2nuyQya2FoZuWSSi4Qk0IkIKW/rXO969AQSKpMlFfO8awZTaNC2NC
	tDsoTU3
X-Received: by 2002:a05:6214:4a84:b0:910:63b6:fc60 with SMTP id 6a1803df08f44-9140c2bb7e1mr41090286d6.11.1790171759269;
        Wed, 23 Sep 2026 06:55:59 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c4640c9sm20563416d6.40.2026.09.23.06.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:55:57 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:55:54 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chris Li <chrisl@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>,
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <ryncsn@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arPaalt234UG2qHV@cmpxchg.org>
References: <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
 <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F>
 <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>
 <arEVDBlfsUYKK004@gourry-fedora-PF4VCD3F>
 <CACePvbXG5kjZmRsdd0a4HfbnNa6w5s9b_1OCySbwvY+HuCqOVg@mail.gmail.com>
 <ad1c4de51f1fbbfc7345036af8f39fb450c1f3c7.camel@surriel.com>
 <arK7gLYD0GJwzKFq@cmpxchg.org>
 <CACePvbW9=HTg69J1JTAUROZui4vD00g4=xbFk8QfL5Xdrg6pAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACePvbW9=HTg69J1JTAUROZui4vD00g4=xbFk8QfL5Xdrg6pAQ@mail.gmail.com>

On Tue, Sep 22, 2026 at 09:32:17PM -1000, Chris Li wrote:
> On Tue, Sep 22, 2026 at 7:31 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Tue, Sep 22, 2026 at 01:14:31PM -0400, Rik van Riel wrote:
> > > On Mon, 2026-09-21 at 06:11 -1000, Chris Li wrote:
> > > > On Mon, Sep 21, 2026 at 2:53 AM Gregory Price <gourry@gourry.net>
> > > > > That should tell you that your model of reasoning about this issue
> > > > > is
> > > > > ill-suited to address the problem.
> > > >
> > > > That is what I'm suspecting. Nobody in a sane mind would want to
> > > > zswap
> > > > 100% of the RAM and maintain reasonable SLO.
> > > >
> > > It could make a lot of sense to have some default
> > > limit upstream, that says the zswap pool is not
> > > allowed to take more than half of memory, because
> > > at that point the compressed content will be
> > > crowding other things out of memory.
> > >
> > > That seems like the kind of limit that is large
> > > enough that very few people will run into it,
> > > while also being small enough to prevent actual
> > > corner case trouble.
> >
> > Just to be sure we're all on the same page:
> >
> > Zswap *backing memory*, the space needed for compressed data, is not
> > the problem. It actually has a limit that defaults to 20% of
> > memory. And there is memory.zswap.max for users to define everybody's
> > fair share of that limited backing storage.
> 
> Just curious, how is the 20% determined?

If you look at the git tree, you'll find it came in with the original
commit that introduced zswap. There was no explanation.

> May I apply the same argument used in this thread: since you haven't
> surveyed all users in the world so you can't determine that 20% is a
> good value. Let's make that 200% for safety.

Yes, thank you:

" the practical usecase for limiting zswap memory to begin with is
  quite unclear to me. Zswap is not a limited resource. It's just
  memory. And you already had the memory for the uncompressed copy. So
  it's a bit strange to me to say "you have compressed your memory
  enough, so now you get sent to disk (or we declare OOM)". What would
  be a reason to limit it? "

- https://lore.kernel.org/linux-mm/20240925192006.GB876370@cmpxchg.org/

This is my whole point. Swap/compression is a low level layer in the
reclaim stack. You're asking it to make a page smaller and it does it.

- It's *reclaim* that determines who and how much gets swapped.

- Cgroups provide configurable memory.low and memory.min residency
  enforcement based on volume.

- MGLRU has the min_ttl setting to configure residency based on
  hotness.

- Many real world environments use some form of pressure-based OOM
  killing to determine when too many pages have become non-resident
  and the workload meets some subjective threshold of "suffering".

There is a whole stack of clever algorithms and configurable QoL
policies that make judgements about residency.

The compression layer has one job: compress the pages I feed you. It's
purely mechanical. It does not need an opinion on which pages are hot,
how much compression is "too much". It's a glaring layering violation.

The reason we keep talking past each other is that you think I'm
arguing for a larger limit. I am not. I'm saying the mechanical
compression layer has no business editorializing what the policy
layers above it have determined.

> > The point of conflict is the pre-compressed side. How many swap
> > entries can vswap hand out. Hard limiting this is the point of
> > conflict. Any given swap entry can refer to several things: a page
> > full of zeroes that has no backing space; a compressed page in zswap
> > that consumes some amount of backing space; a page that was written
> > back from zswap and now consumes physical swapfile space.
> >
> > All mapped by the same address space.
> >
> > I don't see why you would limit this at all. I don't see how you would
> > pick a sane default. And if you limit it and workloads run into it,
> > there are no cgroup controls to manage fair access.
> 
> I am not using a limit to enforce the workload. I am just using the
> limit with a safe margin to set the vmalloc max size for xswap.

And this would carry a lot of weight if we HAD to go with vmalloc.

But there is an alternative proposal based on xarray that does not
have that limitation at all. Neither Nhat nor Boaquan seem to have
been able to find any performance issues with it.

It's YOUR claim that we need to go the vmalloc route. That means it's
YOUR burden to (1) propse an implementation limit that everybody
agrees is safe and (2) why the usability risk of having a limited
implementation is even justified (e.g. performance numbers).

You clearly haven't done either.

> This is similar to the 20% for the compressed pool. I do believe the
> app will suffer if too much of its memory is swapped out. e.g. 100%
> of system RAM.
> 
> > (Despite what has been said in this thread, memory.swap.max is for
> > those entries that compete over physical swapfile space. It must not
> > and can not control vswap space used for all sorts of backends.)
> 
> Doesn't memory.swap.max limit existing zswap? Then that is a
> user-visible behavior change to make zswap don't go through the swap
> counter. That is a change we need to avoid.

No. This has been explained to you repeatedly.

It's for managing fair access to a physical swapfile space because
that's a constrained resource.

After vswap, zswap does not use physical swapfile space anymore. But
other things will, and it's important it keeps working for them.

This "user-visible behavior change" is the whole dang point.

And it's opt-in, so nobody "breaks" through kernel upgrades.

I'm sorry if your setup is abusing this knob for enforcing some sort
of residency. This isn't what it was designed for, and it is clearly
not a generalizable model - most workloads have page cache.

You're in fact asking for it to STOP being usable for managing
physical swapfile space. You're asking to break the broader container
and memory management model as designed so you can continue supporting
what is essentially a case of creative abuse.

This is unreasonable.
