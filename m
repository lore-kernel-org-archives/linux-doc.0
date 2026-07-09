Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6994378839
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 20:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629893; cv=none; b=U0H0Fm+yVcr7kUP/37x2LSpsZp2h9V33gSa1Upqsx4+6OrlRFC7GpVyjZ3yqUiPu7zIICclX5vYymDjvSpaSl70bGQE1tvlbBHK9LlYigqofD1BzXwaW60iURKuHQQKulkQT/cg0KO/U9ll13HNObLm8OlxVj/XWWPX6ooiOeAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629893; c=relaxed/simple;
	bh=Txnn7KPrEgM47k8YH1UV7Xktr8dd9ZpQSPhkta6NSmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOK7mQotMXeiVhUY5fuV5utnTdCYFu9pRNSRZ0BJSwhaV08OrcA9cSXnItdBUPf3bdP3BH5yQ4vFws1q2PZ1mkP29qI9QBZ4okWKgQOuMuoRiWFf1yfJSNKem//PFp3D4yjZG7DOxa7hys/aVGJcTfNB/rd3KmapNKT1w+2c5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyT7VV3/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyT7VV3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9361B1F00A3A
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783629891;
	bh=OiZ8rpt6mqoSO73Os+2dn5j1AZs9wUnkvtdkw9io0Vg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fyT7VV3/A+8KwWuvMNpxUj0j9WopSfqGw6+R5yBscMMhj6u7M6kHXa2LGKEhFYDUS
	 y8/yKq3IOzjT5PGQ5sBAuENfLB5ShNSlMPHgoGhrj/Q+Lt627MknYoR08jtEel3D3j
	 tHlP0Q5KkfBhex/H3MnjWkPYZRYfai509wqjiLwf2jybiIVFKtdrV1s55yXYh9A1/Q
	 tQgPuhJGClXZC6dORWyGbyuyqIxMTqSZdDGyO2WdWgqb20hu2NQumq9C4D5FBqYSdp
	 sMWx08ER+h6fDD6189n+1zCRZBGxdGSqVIUFoy41ZEFTSYBl5UfX0tiqPSuhTpEIiM
	 /kN5QmWWmvHhA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso438874a12.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 13:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpS1Hh+4vSqC8Fbitd6dtucqKTLE6h0+kjiCfK/TdYp1bcdVxVQsib01WtMtxYogEpw6jQ1yqddv+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0V0EBxbUWoX2APZJVW0+LCLzM0CY5VbNaTkn7xbzMb/zCi9o/
	scn2LtGo/wNHxKCkMMay+uRCWWlaLOch23QHksm0fcRH8tjx8o+d89zX233nVNlDVLfOw4OwNIr
	sykAFa5+wy36YSg0mcvoqaFF7c1wWuSI=
X-Received: by 2002:a17:906:780d:b0:c15:ba72:1bd8 with SMTP id
 a640c23a62f3a-c15ce0fd981mr295387466b.41.1783629890430; Thu, 09 Jul 2026
 13:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com> <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com> <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
 <4ec2bd64-af40-8ebf-b8a8-2dd7421a1100@gmail.com> <5ce4035b-7f56-d1d2-2d2a-668446d870e8@gmail.com>
 <CAO9r8zOLe5eJfNmoszCX3rtD=6YEa_7xrvDV1acVDOtZg4vWYA@mail.gmail.com> <bf14cfe5-e98e-c20a-231e-37b3a2489040@gmail.com>
In-Reply-To: <bf14cfe5-e98e-c20a-231e-37b3a2489040@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 9 Jul 2026 13:44:38 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNzRWxCvUok7FJTZZOp6pS9D-Qdrsbi10rLBn4QRhw81A@mail.gmail.com>
X-Gm-Features: AVVi8CdXGHfFf2rIgIGx86ediSJ-vOnVthpFtsChzBjlOs_0crfEffENQuIWAQE
Message-ID: <CAO9r8zNzRWxCvUok7FJTZZOp6pS9D-Qdrsbi10rLBn4QRhw81A@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 7:15=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> wr=
ote:
>
>
>
> On 2026/7/7 03:33, Yosry Ahmed wrote:
> > On Thu, Jul 2, 2026 at 5:32=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com=
> wrote:
> >>
> >>
> >>
> >> On 2026/7/1 19:45, Hao Jia wrote:
> >>>
> >>>
> >>> On 2026/7/1 00:10, Yosry Ahmed wrote:
> >>>>>> Before going through more versions we need to figure out if this w=
ill
> >>>>>> pivot to be a proactive demotion interfcae for swap tiering.
> >>>>>>
> >>>>>
> >>>>> Yes. Should I drop patches 4-6 in the next version and wait for swa=
p
> >>>>> tiering to be finalized?
> >>>>> We can try to get the non-memcg parts (patches 1-3) merged upstream
> >>>>> first. This would also give them plenty of time to bake and catch a=
ny
> >>>>> potential regressions. Thoughts?
> >>>>
> >>>> Patches 1-2 can be sent and merged separately, yes. For patch 2,
> >>>> please include some numbers for the writeback performance before and
> >>>> after batching.
> >>>
> >>> I'd love to collect some performance data. Do you have any recommende=
d
> >>> benchmarks for this?
> >>>
> >>
> >> Perhaps the following test case could work?
> >>
> >> Test Setup:
> >> - Total memory: 32 GB
> >> - zswap settings: max_pool_percent=3D1, accept_threshold_percent=3D50,
> >> shrinker_enabled=3DN
> >> - cgroup constraint: memory.max=3D1G
> >> - Workload: Run the following stress-ng command inside the cgroup for
> >> 120s to
> >>     continuously force zswap store failures and trigger shrink_worker(=
):
> >>
> >>     bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
> >>     exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set=
 -t
> >> 120s -q'
> >>
> >> The following comparison results were collected over multiple runs via
> >> bpftrace
> >> and the 'written_back_pages' sysfs interface:
> >>
> >>                            Baseline         Patched
> >> ---------------------------------------------------
> >> shrink_worker wakeups       5,587             878
> >> shrink_memcg calls      7,823,853       2,347,320
> >> written_back                  257         781,214
> >>
> >> Conclusion:
> >> Under the same workload and duration, the patched kernel shows a
> >> significant reduction
> >> in both shrink_worker wakeups and shrink_memcg calls, while successful=
ly
> >> executing a
> >> much higher volume of page writebacks.
> >
> > Hmm this is actually a bit concerning. Yes, we are invoking the
> > shrinker less, but we're writing back *a lot* more memory, orders of
> > magnitude more. We are using a batch size of 64, and making ~1/3 of
> > the calls to shrink_memcg(), so the number of written back pages
> > should be ~20x more, not 3000x more? I think I am missing something.
> >
> > Also, ideally, the batching wouldn't result in significantly more
> > writeback, but a similar amount of writeback over less shrinker
> > invocations. If we are writing back significantly more pages then the
> > batching logic is probably too aggressive?
>
> Apologies, I think the test I constructed has a bit of a problem. This
> test has very, very heavy memory pressure and is already a very abnormal
> case.
>
> The zswap entry returns the first time because of "second chance" after
> setting referenced to false. For the baseline, it scans 1 page per node
> each time for 16 loops. During the test, shrink_worker() basically exits
> at about 16 pages each time.
>
> Since stress-ng periodically and randomly writes to this 4G memory, it
> keeps triggering zswapin and then waiting to zswapout new zswap entries
> after falling below the pool threshold. When the speed of zswapin/out is
> far greater than the scanning speed of shrink_worker(), a large number
> of zswap entries cannot wait until the second scan for writeback. New
> entries are stored on the zswap LRU list again, and the referenced of
> the new zswap entries is set to true again. During the test, it was
> found that 99.21% of the return values of shrink_memcg_cb() in the
> baseline kernel were LRU_ROTATE.

Hmm if I understand correctly, you are saying that the current
upstream code is actually failing to writeback when it should in the
previous test case with very high memory pressure, but it is with
batching? If that's the case, I think it's actually really good data
to include. However, we should make sure that's what's actually
happening. If the current shrinker is not keeping up and failing to
writeback, we should observe:
1. shrink_worker() hitting MAX_RECLAIM_RETRIES continuously and bailing.
2. zswap usage consistently remains at/near the limit, and not going
down to the acceptance threshold.
3. zswap_store() failing to accept pages and the pages going directly
to disk, causing an LRU inversion (hotter pages on disk, colder pages
in zswap).

Can you confirm that this is what's observed with the high pressure test ca=
se?

>
> For the patched kernel, shrink_worker() scans at least 64 * 16 entries
> in a single pass, so it can trigger writeback during the second scan.
>
>
> I have re-tested using a more common, reproducible scenario:
>
> Test Setup:
> - Total memory: 32 GB
> - zswap settings: max_pool_percent=3D1, accept_threshold_percent=3D50,
> shrinker_enabled=3DN
>
> Test Procedure:
> Allocate 512MB anonymous pages and fill the data with random numbers (to
> avoid compression), then use cgroup memory.reclaim to force 512M
> anonymous pages into zswap.
> Allocate a 4K anonymous page at an interval of 2ms, and then trigger a
> reclamation of a 4K anonymous page through cgroup memory.reclaim. When
> the pool threshold is reached, shrink_memcg() will be triggered.
>
> The test data after running for 300s is as follows: (it will eventually
> stop writing back because the pool threshold is reached)
>
>                            Baseline         Patched
> ---------------------------------------------------
> shrink_worker wakeups          5126            85
> shrink_memcg calls      11,003,734       173,420
> written_back                40200          40233

This data looks good and makes sense, but I would also want to
understand the high pressure test case as well.
