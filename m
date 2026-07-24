Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E011320CD3
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784915831; cv=none; b=o3jppMZatkRSokjBE2jfElWXA3h9CcHwIIxD/rx5Eqx1JGTRKtlyCBgdAEwMnnGFzbhtlTJI3cBRMcq7gMfkT8na3AnRWT4EkHBW+3G2ukMEp+FyLCFvWeOm99E8AgEnkA322VObCBrJKfMaRTC89CsT8KJjWDYnwcQ5C5Ipk8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784915831; c=relaxed/simple;
	bh=YlKk9jepKaFGQMRFJ+xbQJGkWKUnkooDX0Yz1LSK7iU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVLCU31n/6uGneY84XCAmmkIhwQKWGfrENP9UeqphV5g4mtpGoM5g6Jt+NwQRbXl5uoTLwXg0ZZns6u3/LfHDvfr7VWBJdC/5KJ4Fy5eBlDAcibzMuU6WqeTGCvrJg9kAU2ZrOyGk5HEnzFART+fOQmkicADqhAX2lgatrCZq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hx4jF8u4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hx4jF8u4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46E11F00A3F
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784915829;
	bh=v4oS0neAM9sBbbD29XIiKBoe/E74msHV+fLImGO41pk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Hx4jF8u4t6IuViP10Ezwlpok+TeJW6mxIZyH05kLVRDSgkQ/iOCj87mmNIm9MeDXN
	 doMM+abtIIChW1lOtU1ylA3AoooaDHPMie99DlacEiUCV3ZRjq5NiMUElgmzXHyfq4
	 gYPJqBegz7M///g4lxW9vNlA1bO/CLlwmxbDtD456+GvFYMU/A+/HQe4y5TBgySfzb
	 jZdTUVxmiqHKJ5cQAlFgGnFZwmYsletLCT32efpx34OTA99LC0Og+odrC0F9M3qKGL
	 OrBc7mU4nB63knUgrY9NYplb9XuBQ55ie04OxTsI3LySfYheBIctaNBfxUGvW3LUHv
	 f+SlMybsNwn5Q==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1740c36c5cso102996166b.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 10:57:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rog8o90o1L7GCy3YYZIB2BL+cVZT7xT0eMAd+Rib5ArtT5JvhIUKrmzHJn58K1BLkcKEcRc8w4Ltac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlOAhknWMFD36juLdby3P4jFWUMXGgqb4NYoFHnDeFQ+fKt7eb
	oMgGpZZTdLIar6Al2Bxh29rezedCYA1k6Do8Q2xN+i2sZd/zzgTsXVOmimt7704xCBkNK3RGlgR
	AqrOjlrHsr1h+pSPiwOwqwbt8p0ctxLE=
X-Received: by 2002:a17:907:98d:b0:c1c:72b:e65a with SMTP id
 a640c23a62f3a-c1c507d0862mr350331266b.26.1784915828673; Fri, 24 Jul 2026
 10:57:08 -0700 (PDT)
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
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com>
In-Reply-To: <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 24 Jul 2026 10:56:57 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
X-Gm-Features: AUfX_mzrT9xKIy9LdfhWAr5n_0886vraGnegZQOHjwrM4nt45OfxgRt4tKiwdpw
Message-ID: <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org, tj@kernel.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 3:21=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/7/24 00:39, Yosry Ahmed wrote:
> > On Thu, Jul 23, 2026 at 6:55=E2=80=AFAM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> >>
> >> On Wed, Jul 22, 2026 at 09:52:18PM -0700, Yosry Ahmed wrote:
> >>> On Wed, Jul 22, 2026 at 7:27=E2=80=AFPM Johannes Weiner <hannes@cmpxc=
hg.org> wrote:
> >>>>
> >>>> On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
> >>>>> @@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct =
*w)
> >>>>>                        goto resched;
> >>>>>                }
> >>>>>
> >>>>> -             ret =3D shrink_memcg(memcg);
> >>>>> +             ret =3D shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
> >>>>>                /* drop the extra reference */
> >>>>>                mem_cgroup_put(memcg);
> >>>>>
> >>>>> @@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
> >>>>>        objcg =3D get_obj_cgroup_from_folio(folio);
> >>>>>        if (objcg && !obj_cgroup_may_zswap(objcg)) {
> >>>>>                memcg =3D get_mem_cgroup_from_objcg(objcg);
> >>>>> -             if (shrink_memcg(memcg)) {
> >>>>> +             if (shrink_memcg(memcg, 1)) {
> >>>>
> >>>> Why 64 for the global limit but only 1 for the cgroup limit? That
> >>>> seems arbitrary in multiple ways.
> >>>
> >>> I suggested that we keep the writeback here without batching and do
> >>> that change separately, mainly out of abundance of caution as
> >>> writeback is done synchronously here so the extra latency could be
> >>> problematic. I think we probably want to measure the performance
> >>> impact of that separately.
> >>>
> >>> That being said, this path is potentially too expensive anyway due to
> >>> the flush, but I would rather we do some basic measurements before
> >>> batching here.
> >>>
> >>> What do you think?
> >>
> >> It's not an unknown, right? We know this works for direct reclaimers,
> >> cgroup limit reclaim e.g., and what the latency implications are.
> >>
> >> Because of how reclaim works, we also know it'll call zswap_store() in
> >> batches of SWAP_CLUSTER_MAX. If we don't batch here, they're likely to
> >> each call shrink_memcg() once we're at the limit - while still risking
> >> rejections due to compressibility differences.
> >>
> >> My worry is that if we start with an inconsistency, we'll be stuck
> >> with it for a long time.
> >>
> >> I'd rather start with the clean, consistent version. Dial it back only
> >> if we have data to justfiy the complication that we can put into a
> >> comment and the changelog that outlines why exactly it's different.
> >
> > I am fine with doing that and basically always using NR_ZSWAP_WB_BATCH
> > as the batch size in shrink_memcg(), but I would be more comfortable
> > if we did some sanity testing.
> >
> > Hao, would you be able to do some smoke testing with NR_ZSWAP_WB_BATCH
> > used for all paths, and memory.zswap.max set in a way that induces
> > writeback? You can probably set memory.zswap.max to 1% of total memory
> > instead of the global pool limit and rerun the same test.
>
> Building on Test Case 2, I set zswap.max=3D320M (~1% of total system
> memory) and updated both invocation paths of shrink_memcg() to process
> batches of 32 or 64. The resulting benchmark data is shown below.
> (Note: Test Case 2 also sets max_pool_percent=3D1.)
>
>                        baseline-cgroup   batch-all-32-cgroup
> batch-all-64-cgroup
> shrink_worker wakeups        7,238             766               367
> shrink_memcg calls      12,059,142       1,961,194           983,878
> written_back                28,277         301,157           327,997
> zswap_store calls         1,349,572       1,168,190         1,114,549
>    store succeeded            492,861         521,315           459,246
>    store rejected             856,712         646,875           655,303
>    store reject rate            ~63%           ~55%              ~58%
> pool_limit_hit              510,130          50,096            57,715
> pswpout                     884,989         948,032           983,300
> pswpin                    1,251,268       1,638,668         1,878,453

The numbers generally look good, the store rejection rate is
decreasing and we are naturally doing more writeback which makes
sense. The store rejection rate actually increases when the batch size
increases to 64, maybe aggressive writeback is more likely to fail and
cause a store rejection, so that also makes sense.

The only part I can't immediately reason about is pswpin. How are we
reading from physical swap more than we ever wrote to it?

Also why does it significantly increase with batching? I would hope
that it actually decreases (like the commit message), because colder
pages end up on disk. But even if we eventually swapin everything on
disk, I would only expect a slight increase to match the slight
increase in pswpout.
