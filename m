Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A803B6C15
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169138; cv=none; b=fLWNRF7QsApuMEdNl6MHlR6g/Z+P90ZH2aau4mQjG55w1556qOe31T9DfjJBxjcSPb4SgFOIqT+utg6a5bpuHn+Q65xg7YMJUem9hSNzK+DGWWlgiQ5rCx3zCvIT+fGGON8Fgx5aYsn9IwpgSi/30Yx7E+1cBCGKUsK5nb1T3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169138; c=relaxed/simple;
	bh=8I42KZuP0r68Ezjah/ODaun9sEqE1fJuuPZaH+lxTmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3nU494R3VQ3GQmDIuAiS9MyRT4bnLtLj3iz7C9uNMT7Xp4iY4yV/dEKAaFXkVn7/gwbmy3Dn5pVvkVymEDm8SxNo3j/AbIrDwiqq+LVyWvV0Qp04Qejxi5rwtgvDt66vOSB36tkZDPDZ6rU9fD9bEYWGeNkkDBzl58fRGgfpRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvQuwjVR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvQuwjVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4221F0155B
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785169136;
	bh=91SGC46wteTA8UqskPXqZ2MjsKPL+bnm4sYk32isMto=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PvQuwjVRBb9rJCFkho4AEu6YakJdgcF2n653RTkhlU/Gs8Mq9+4u8oy7kgkCIwJKT
	 oTls3DsPaskQ2YJX9EDJXL1r10fiiKUyVuLoQSPQXPrZFMc/SLObuqWteMM7TJantN
	 3rtgirpjhcmiHA1JIww7Mblx9BPNVoAfNJyot56Xzd22AmhtwxxJ7IyBTZzjBiqi1w
	 WAD5oYmpe/nXaZ2kKtMhWWVxTOQ8mHf1PkWMFvIztRFS38VsSA0+GB0VF8KXZa/rW0
	 2nTL5swgX8dKNUk+ybe2Oni4JdxZakELQZEI5PjZNXDQWK800iTa8HAyPZkuo5vZHD
	 t+1t7pGKoZINA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so4615608a12.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 09:18:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rog4wK/NzzTnmpkYIeo6lT3ZNPuyZQJRq0I13MJX4F33yS+Jw93AMff7mrYu8SsXQwBEhnolv95ylk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKgWU+A1FLx2HY0iZgu5Ggp0PyIIiAtW86jyu/IMx3ihbDhdaT
	F/UskmzBX5H+m3A6gIJSPuBFXYF34WPdSKLPryYcd1clqsFWj8LbC8st9+6WkqIu7pXOc6h5vY4
	1K61Rq80y/3W73T46+gaFHqkum9vWrAY=
X-Received: by 2002:a17:907:a4a:b0:c15:f395:ac31 with SMTP id
 a640c23a62f3a-c1f1f3e5ddfmr414865366b.61.1785169135321; Mon, 27 Jul 2026
 09:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com> <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org> <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com> <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
 <CAKEwX=MG0F1+my1krUiOrHCn-Lypq2gq-g8Rv07Mz7sC=YEKaw@mail.gmail.com>
 <CAO9r8zOH93mfdjHq+Ljm7X+ykZS_rjzAvp9OBCzo+uyTbM1fDQ@mail.gmail.com>
 <amO-hwo8OGV5Goz0@cmpxchg.org> <CAO9r8zMgVmgQET+PUGexAgNqCZavA2YoTTXKSbWWoUv=A=ytSQ@mail.gmail.com>
 <f60fe501-7605-64dd-0572-77f7f3060f35@gmail.com>
In-Reply-To: <f60fe501-7605-64dd-0572-77f7f3060f35@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 27 Jul 2026 09:18:43 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMBWA7nxM24VXQT00CVEZwFpMFNe73FFdPSZw2y=J-0HA@mail.gmail.com>
X-Gm-Features: AUfX_mwTEgxS4l4XImwz7KgQJvkaUx5l8XpYB7q7Jw8ztGF1XlaoG-9HK5W-0bM
Message-ID: <CAO9r8zMBWA7nxM24VXQT00CVEZwFpMFNe73FFdPSZw2y=J-0HA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, 
	tj@kernel.org, shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 7:39=E2=80=AFPM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/7/25 06:22, Yosry Ahmed wrote:
> > On Fri, Jul 24, 2026 at 12:35=E2=80=AFPM Johannes Weiner <hannes@cmpxch=
g.org> wrote:
> >>
> >> On Fri, Jul 24, 2026 at 11:39:41AM -0700, Yosry Ahmed wrote:
> >>> On Fri, Jul 24, 2026 at 11:37=E2=80=AFAM Nhat Pham <nphamcs@gmail.com=
> wrote:
> >>>>
> >>>> On Fri, Jul 24, 2026 at 10:57=E2=80=AFAM Yosry Ahmed <yosry@kernel.o=
rg> wrote:
> >>>>>
> >>>>> The numbers generally look good, the store rejection rate is
> >>>>> decreasing and we are naturally doing more writeback which makes
> >>>>> sense. The store rejection rate actually increases when the batch s=
ize
> >>>>> increases to 64, maybe aggressive writeback is more likely to fail =
and
> >>>>> cause a store rejection, so that also makes sense.
> >>>>>
> >>>>> The only part I can't immediately reason about is pswpin. How are w=
e
> >>>>> reading from physical swap more than we ever wrote to it?
> >>>>
> >>>> The same page can be swapped out once, and swap in multiple times :)
> >>>>
> >>>> Unlike zswap, physical swap in is not necessarily exclusive. You loa=
d
> >>>> the page in memory, but if the swapfile is not full, etc. etc. you
> >>>> don't invalidate the copy of the data on the swapfile. At reclaim
> >>>> time, we notice the page is not dirty, so we just skip (z)swapout.
> >>>
> >>> Oh right, I forgot about that, thanks.
> >>>
> >>> I still don't fully understand why pswpin is significantly increased
> >>> with batching here. I would hope that with less LRU inversion we end
> >>> up with less disk swapin. Probably the test access patterns are just
> >>> too random compared to real workloads?
> >>
> >> Maybe more time in zswap for those tail entries left behind with the
> >> smaller batch?
> >>
> >> That's a 32 entry window that could zswpin with the smaller batch but
> >> pswpin with the larger one.
> >
> > Oh I was talking about going from no batching to batch=3D32. pspwin
> > increased by 387,400 (~30%). We are writing back 272,880 more pages
> > but we also have 209,837 less store rejections. So overall ~ 63,043
> > more pages should end up on disk, which doesn't explain the increase
> > in pspwin.
> >
>
> In my previous runs, I also collected zswpin. could the following
> explanation help account for what we are seeing?
>
> Assuming stress-ng maintains a roughly similar memory access rate,
> batching flushes significantly more pages back to disk (meaning pages in
> the zswap pool are evicted faster, keeping zswap pool residency lower).
> As a result, when stress-ng accesses swapped memory, it is more likely
> to fault pages in from disk (pswpin) rather than hit zswap (zswpin).

We are not just writing back more pages to disk, we are also accepting
more pages into zswap. The whole point of writeback here is to evict
colder pages to disk and accept (relatively) hotter pages into zswap,
as they are more likely to be swapped in again.

>
> In fact, zswpin in batch-32 dropped by 143,425 compared to
> baseline=E2=80=94which aligns with batching having a lower zswpin and a h=
igher
> pswpin.
>
> To be frank, under the Test Case 2 workload, we cannot strictly
> guarantee that the total volume of page reads and writes remains
> consistent across all three runs within the same time window.
>
>                       baseline-cgroup   batch-all-32-cgroup
> batch-all-64-cgroup
> shrink_worker wakeups       7,238             766                 367
> shrink_memcg calls     12,059,142       1,961,194             983,878
> written_back               28,277         301,157             327,997
> zswap_store calls        1,349,572       1,168,190          1,114,549
>     store succeeded           492,861       521,315           459,246
>     store rejected            856,712       646,875           655,303
>     store reject rate           ~63%           ~55%               ~58%
> pool_limit_hit             510,130          50,096             57,715
> pswpout                    884,989         948,032            983,300
> pswpin                   1,251,268       1,638,668          1,878,453
> zswpout                    492,861         521,314            459,245
> zswpin                     309,631         166,206            84,977 <-

One possible explanation is that we are shrinking too aggressively due
to concurrent shrinkers. That's one difference between hitting the
global limit and the memcg limit. There's a single global shrinker
that all store failures will just wake up, while all concurrent stores
hitting the memcg limit will start shrinking.

The other explanation is that, as I mentioned earlier, the access
pattern is just too random and we are consistently refaulting cold
memory. I am honestly a bit concerned about these results.

Hao, would you be able to try re-running the test with a single
stressor? It would help us figure out if concurrent shrinking is a
problem. It would also be useful to increase the global limit, to
isolate writeback from hitting the memcg limit. I don't think both
limits will often be used in conjunction, at least not in a way where
both limits are hit simultaneously.

It may also be useful to run an actual workload if you are able to,
like a kernel build or something, to see if the access patterns change
how much we end up swapping in from zswap vs. disk.
