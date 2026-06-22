Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5626623D7F0
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782163776; cv=none; b=VROg50OEdlW/+NvYZsWz3BcQyCtUVRH6AZqlSFEmLafp/BGwySFz28Q7j1hMKdEgD1ML7yfcEJfQdoScBKknEoUyrtdphnRlr312huOSnOOL9hJkpKChmrnxOYE+tv8VRJs7kHr+hIyLhfjYCFLMaeZTgT8RoBUlF4GCuYOlJNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782163776; c=relaxed/simple;
	bh=+L3MmmVxkutwrGSzKYzXjBjXrb4M8oGuSvZpEuPqSPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/vcmvzB/5ukq2xThzfmxJ68mXGhxwfBh8HJ9BVuc4eCv1cOD179PAvTFxS5yP33S33xECXoDagPIUO2IkxQzIADsfWb1oGHRi4oyjfdmHdZc1xP+jXWgj6hq2r3519rqM75QAnQIcDc6BC866IVxcE6EdQ6Pk+uFjAwrcj2kmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4KtN8W8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4KtN8W8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E743E1F00A3E
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782163774;
	bh=SXLoZ1hGoYCAtFF7te+jkqyRbBNr2vwPY2VH1Mi/VeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J4KtN8W8Fc25LPHVZJvbipnoTiPBAiQbCX5C1D9yr6G+yK3XWiPNDm/CVEUYjwF7d
	 YgeSMj7AvTnipAVxICqyud+oozJAoDg9cG46nBjADp9oNzhofZecaBlWTssP8Rtm5T
	 46mPBXq16hhytu1NHS65vWSeQcHfFePCXAIuKiqds8T5Atkd2fhxN5Om4ps+MOZrZ2
	 KcrlYsXvIZ976AVSUfrP1KUS1g39F6d7TTlBMqvpYenIvDg6XZbQ94YmsT1hK9TiYk
	 jZHlxDaHtG50xPBOrC3sAKFd63nfMCx9VIgQoJmJcyt3XmQ7EfmDov0tK8N9n8CTrp
	 PTpIUUJHP1zqg==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso653813a12.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 14:29:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Vz2Mujghpi2veYT1z3r4kUbsggdeB8e27WXTiNAmH//MsQjyd78FX0ZYlTKq4HAk1b7hedQ/ZMKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6+7PwXEoJItKwCaBH4UxzXbvX7eYxM7mt6BsuwoF1Dgcp/p8
	szMJKNdlvYTU3ZLftEvWei1K6f97I7aGt0x3U4+lYBGFdqd/La3GY7zhE12e79ZESYPcX/bQeTq
	YXE4ivWAowZggDEGwvQJWtOw2Jz6qmuc=
X-Received: by 2002:a17:907:74d:b0:bed:19af:f89a with SMTP id
 a640c23a62f3a-c097ae2d9f9mr826269466b.7.1782163773890; Mon, 22 Jun 2026
 14:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <CAAAF57B-7DE9-45EA-8AB6-DE6CFAF60F47@linux.dev> <26a034b3-9cfa-e4f5-eea1-e69fbfff02b4@gmail.com>
 <ajkIkyajJEW2b7/0@yjaykim-PowerEdge-T330>
In-Reply-To: <ajkIkyajJEW2b7/0@yjaykim-PowerEdge-T330>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 22 Jun 2026 14:29:22 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOe8i3QXeg639aJbMEXAiHjbZvt0w7v6tn8MQyvysXP9Q@mail.gmail.com>
X-Gm-Features: AVVi8CdKnjEoAO3uPfDnZIRPxM_R9nTnVOUDlsdn8mjO-TtdAPtrEC9LrsVK0Ck
Message-ID: <CAO9r8zOe8i3QXeg639aJbMEXAiHjbZvt0w7v6tn8MQyvysXP9Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] mm/zswap: Implement per-cgroup proactive writeback
To: Youngjun Park <youngjun.park@lge.com>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Muchun Song <muchun.song@linux.dev>, 
	akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 3:04=E2=80=AFAM Youngjun Park <youngjun.park@lge.co=
m> wrote:
>
> On Mon, Jun 22, 2026 at 02:08:49PM +0800, Hao Jia wrote:
> >
> >
> > On 2026/6/21 12:20, Muchun Song wrote:
> > >
> > >
> > > > On Jun 18, 2026, at 12:48, Hao Jia <jiahao.kernel@gmail.com> wrote:
> > > >
> > > > From: Hao Jia <jiahao1@lixiang.com>
> > > >
> > > > Zswap currently writes back pages to backing swap reactively, trigg=
ered
> > > > either by the shrinker or by the pool reaching its size limit. Alth=
ough
> > > > proactive memory reclaim can automatically write back a portion of =
zswap
> > > > pages via the shrinker, it cannot explicitly control the amount of
> > > > writeback for a specific memory cgroup. Moreover, proactive memory =
reclaim
> > > > may not always be triggered during a steady state.
> > > >
> > > > In certain scenarios, it is desirable to trigger writeback in advan=
ce to
> > > > free up memory. For example, users may want to prepare for an upcom=
ing
> > > > memory-intensive workload by flushing cold memory to the backing st=
orage
> > > > when the system is relatively idle.
> > > >
> > > > This patch series introduces a "zswap_writeback_only" key to memory=
.reclaim
> > > > cgroup interface, allowing users to proactively write back cold com=
pressed
> > > > data from zswap to the backing swap device. When specified, this ke=
y
> > > > bypasses standard memory reclaim and exclusively performs proactive=
 zswap
> > > > writeback up to the requested budget. If omitted, the default recla=
im
> > > > behavior remains unchanged.
> > > >
> > > > Example usage:
> > > >   # Write back 10MB of compressed data from zswap to the backing sw=
ap
> > > >   echo "10M zswap_writeback_only" > memory.reclaim
> > >
> > > I=E2=80=99m not entirely sure if other candidate names were already b=
rought up
> > > in previous discussions, so my apologies if I'm repeating something h=
ere!
> > > I do think expanding memory.reclaim is a great approach. That said, I
> > > was wondering if we could make the interface a bit more concise while
> > > keeping it flexible for future extensions.
> > >
> > > Essentially, what we want is to control the specific targets of the r=
eclaim
> > > process=E2=80=94such as file, anon, or zswap. What do you think about=
 using
> > > something like "source=3Dzswap"? For instance, if we want to reclaim =
10M from
> > > zswap, the command would look like this:
> > >
> > >     echo "10M source=3Dzswap" > memory.reclaim

I like this suggestion, but I think ultimately we want proactive zswap
writeback to be part of a more general proactive swap demotion, and
zswap is just a swap tier.

> > >
[..]

>
> I also preferred sharing the `memory.reclaim` interface in the future swa=
p demotion,
> since it already takes `zswap_writeback_only`.
> https://lore.kernel.org/all/aieUQUBHI+E3uNPW@yjaykim-PowerEdge-T330/
>
> Alternatively, we could use a separate interface as Yosry suggested
> (e.g. 'swap.tiers.demote'?).
>
> But as Nhat pointed out, allowing user-triggered demotion from the swap t=
ier
> perspective could lead to issues like LRU inversion. We probably need to
> discuss whether this kind of user-triggered tier demotion will actually b=
e
> supported at all.
> https://lore.kernel.org/linux-mm/CAKEwX=3DNfSy0XiD_UMsDOHGCwpE7sYmBmhV4Y9=
vk_cbnnr6J6PQ@mail.gmail.com/

I believe what Nhat said is that swap demotion may be used to
prevent/alleviate LRU inversion, not cause it. I don't see how
demotion can cause LRU inversion.

>
> So, IMHO..
>
> 1. If swap tier demotion is NOT exposed.
>
> We can simply choose between "source=3D" and `zswap_writeback_only` based
> on preference. (since there is no need to consider "swap_tier" demotion.)
>
> However, "source=3D" seems to offer better extensibility if it is expande=
d
> to file and anon use cases in the future.
>
> 2. If swap tier demotion IS exposed.
> We need to consider integration vs decoupling.
>
> (In my view, This is a design consideration. avoiding potentially
> redundant interfaces vs adding a new one if it is architecturally correct=
.)
>
> 2.1 Integration
>  - Integrating into 'memory.reclaim':
>   - "source=3D": Seems easier to integrate by explicitly specifying the t=
arget. (Your suggestion)
>   - 'zswap_writeback_only': Harder to integrate than "source=3D".
>
>  - Integrating into 'memory.swap.tiers.demote'
>   - 'memory.swap.tiers.demote' could absorb the memory.reclaim functional=
ity.
>   (But since we only want to allow tiering for vswap+zswap cases like
>   the zswap writeback feature as we discussed, the reclaim interface beha=
vior might
>   still need to stay for zswap only.)
>
> 2.2 Decoupling
>  - 'memory.swap.tiers.demote' handles other swap devices (excluding zswap=
),
> while "source=3D" or 'zswap_writeback_only' handles only zswap.

I personally think making proactive zswap writeback one use case of
proactive swap demotion makes sense. I think swap demotion in general
makes sense.
