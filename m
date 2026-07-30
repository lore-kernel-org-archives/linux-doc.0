Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E3A3403E1
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 00:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785371472; cv=none; b=EIXEALo474KT/PeHmASNpA9N0oNNxR4+tGsuMMR0QrPfTnaRLdEzv4sdMfxpt3KD1nB5YkLAWzuUPv54uq9LTZs25No8iijrcvAH+JTpWwPBhb0P0zI+z6pdWCbvjUCR96KLtBx0A4M4QP+qwrLgJsD2JIoH/QiN8nt7744Nhf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785371472; c=relaxed/simple;
	bh=eboSJiDqdxycaQh/AH3jCJGtp71rw/wx0MCI8uJRKvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnJYhis889XgXT0HMmU7rusWrlSlAPp6+fBxrqZTfKAZpHKo6efUV9C97z32gdK+UN+alvUBil967oGGON4hWJYZ+hG+1aT7DfDZj0db+8DPtNHbmpXNSpGVqEa05c8BaAUoB43H5i1k9JFiugnqz2ayqnV2doKQTfYNufgu+7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfdKRFkl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfdKRFkl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F408B1F01559
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 00:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785371469;
	bh=223Lw9K3r/YKNgDc8O3HO2tfWjMepfaOnuVJWOvxOI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nfdKRFklDNUurArltP8U4rxO7Qro6nf3tlY/PIbjjmp7aC5NIx/FB38kvWdwAxj2P
	 +WI7XndHSPbOuXAik5bgfIpKgS4cheU9njAMaP+kUQ+etMUHBY/5t9Z4YETlBdwZ5O
	 PFU0b0s7Yh2fN+2lS0j052EkpYHn18uTne9ws1qC0KcTRjmwfWytiS6lkhlC41vtgm
	 0UpbbKSvoOEQVwGIxW41J+slwmhS07zFfm05WS6eyFI4UHX9NHgOvVJ9jrmBO4pTj1
	 8Ryi/urIRG1ktSHTQDijgfXUUV8t2lFLuQXdktjHZ3ILKb3fA5GS74yPO0VGGIM4F7
	 +odj1+z/YMblg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so2519969a12.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 17:31:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro+72fhE3tCREXIn4WMUMTGCJhV0Xd6hjsB6E7N2gaBbBxRYE+dV8Ttt2FOB5RaVxE3HSMxpR1mQWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMF3dD23iNkn90tkU0Ss2mMZxp020/r8r5GmUigfj5RZlr1/q
	GtrNPFxetNvDxm+3DeBO1bTz9fDNsViw8map9/XVd6teTC6ZznyiVrN43mqchY4TJelnKpvqUOf
	m2lVuZzWdEeirY21L7p4rs5DMEnQj1og=
X-Received: by 2002:a17:907:d08:b0:c1b:1315:163e with SMTP id
 a640c23a62f3a-c1fa54c4b5bmr24929866b.29.1785371467863; Wed, 29 Jul 2026
 17:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729084206.77793-1-jiahao.kernel@gmail.com>
 <20260729084206.77793-2-jiahao.kernel@gmail.com> <20260729155858.c7aabff48166a9bca4d68ac3@linux-foundation.org>
In-Reply-To: <20260729155858.c7aabff48166a9bca4d68ac3@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 29 Jul 2026 17:30:56 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNhBCghP8T_98z2p==Cfs_=kamcRN_3ROxaj3R8PN2Qvw@mail.gmail.com>
X-Gm-Features: AUfX_mzEIitLB3kH8Hiawz-YUBT-nt1v9BFc8j6q1ERagl2zhHIwEwDmanOLo5A
Message-ID: <CAO9r8zNhBCghP8T_98z2p==Cfs_=kamcRN_3ROxaj3R8PN2Qvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:58=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 29 Jul 2026 16:42:05 +0800 Hao Jia <jiahao.kernel@gmail.com> wrot=
e:
>
> > Zswap writeback when the global pool limit is hit fails when memory
> > cgroup is disabled. The pool remains full until it is organically
> > drained by swapins or memory freeing, leading to zswap store failures
> > and pages bypassing getting written directly to the backing swap device=
,
> > causing LRU inversion (hotter pages with higher fault latency).
> >
> > This happens because mem_cgroup_iter() always returns NULL when
> > memory cgroups are disabled. As a result, the global shrinker
> > shrink_worker() repeatedly takes empty walks. After MAX_RECLAIM_RETRIES
> > failed attempts, the worker gives up without writing back any pages.
> >
> > Therefore, when memory cgroup is disabled, fall through with the !memcg
> > branch and shrink the root memcg directly.
> >
> > With memcg disabled, shrink_memcg() only returns -ENOENT when the root
> > LRU is empty, which means the total pages are already below thr. In the
> > absence of heavy concurrent zswap stores, the loop then safely bails ou=
t
> > via the zswap_total_pages() <=3D thr check; otherwise, it will resume
> > shrinking the memcg after processing the reschedule check. For any othe=
r
> > return value from shrink_memcg(), the loop is guaranteed to terminate,
> > either after MAX_RECLAIM_RETRIES failures or once the threshold is met.
> >
> > Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
> > Cc: stable@vger.kernel.org
>
> How does this affect users?  What behavior do they observe when it
> occurs?

I think the first paragraph sums it up pretty well, especially the
last sentence "hotter pages with higher fault latency".

>
> > Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZ=
eLc=3DeyTPKPVQgX4g@mail.gmail.com
>
> hm, that isn't really a bug report and doesn't answer the above
> question.

Yeah, it isn't. Probably we should drop "Closes". I assume Hao added
it because checkpatch annoyingly complains if you add "Reported-by"
without "Closes", so Hao just linked to the thread where I pointed out
the bug.

>
> AI review asked a couple of questions:
>         https://sashiko.dev/#/patchset/20260729084206.77793-1-jiahao.kern=
el@gmail.com

The review on patch #1 is something theoretical, we discussed it at
length in previous versions.

For patch #2:

> Does this batching logic break NUMA fairness?
>
> Because for_each_node_state() always starts from the lowest node
> ID and breaks when the scan budget is exhausted, subsequent
> calls to shrink_memcg() will restart at the lowest node ID again.
>
> If the lowest node (typically Node 0) consistently has enough
> items to exhaust the scan budget, wouldn't we exclusively evict
> pages from it while ignoring older pages on other nodes? Could
> this cause LRU inversion across nodes, keeping older pages in
> memory on Node 1 while hot pages on Node 0 are evicted?

Yes, unfairness is possible.

For global shrinking, it's probably not an issue. We reclaim until we
hit the acceptance threshold and it's very unlikely this will happen
before iterating all nodes (given that the batch size is 32 pages).
However, with the shrink_memcg() path, we only reclaim one batch, so
there's a chance we'll always reclaim it from node 0.

Maybe we should just drop the early bailout and accept potentially
doing more writeback than needed. Hao, WDYT?

If you respin, please also drop the batch size argument to
shrink_memcg() as it's now always SWAP_CLUSTER_MAX.
