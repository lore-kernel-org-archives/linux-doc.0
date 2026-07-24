Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D923176EF
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918464; cv=none; b=FpTrBmgQ3rf85qaM+k1cujdKZ0Ksprv+933ApdQYTGYG4VXKKfPiv3RxTbJfmOpstQV4kcWZypcQg+sTSfdPFmF2WeFTBogjUlEv3X1wxzscu+BGcZaaIcRNiHaaFUfIPT2nCh7KBNyXbAX4lq48FjtPeYjgXBYu1J6BH7svrvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918464; c=relaxed/simple;
	bh=AbqBLWv6eHA19RKDwn823OvccLgVBlxq+9onD+gI5t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVheymu3AQ2+eb2LixrYUT3UgoErSZBbcEXNWDAt+kEBoi+2ifA2POrkT8+gg4nS/61GTYEJFy5RffQ3TDUaefrkTZ5O7F7c83FBNrLn9tPcqIu+NyCCrjvyFCfAT/xOGJgPu2igLZLJBMEiF8cOW219Eryn1XCPw58qJodKgag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=EzExRZDW; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="EzExRZDW"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c2cce930cso7074061cf.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 11:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784918460; x=1785523260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1qXGBunFwcH0vasyDsq+hrXxoqTsrx29FgrXHzj3JQ=;
        b=EzExRZDWB9dyOjG821yV9ATGV2Q1A3TOQNmcGt3rbDkB6BLMjIR9u6EUn2rgOdDAQd
         4AlAhnheHEilgZj3oP1ArM4SJrt3yvwLJ+bFE+dMmFJ3+qLThHKAsbEEynyNM6H3p4qL
         VgHjRBFPyYaSK/4xcMKLcJtX4/jiB566P/6WWmnL6oY+/ckaqY+UM4X9WTFvaSA+/Gbf
         0mrFj3/bFuxZ6dCEpKd+ISNtkMYSuaEkeYtFl7+vEfiJt34ZEy/sd8AdqSCw9m6dGaOU
         iQdzX129mTc20mq/g1H2wVP81nvU+uuf6M5ZL/tEC6NoJ1oWoq8sTyq0tFDB0x2MLY5p
         B8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918460; x=1785523260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t1qXGBunFwcH0vasyDsq+hrXxoqTsrx29FgrXHzj3JQ=;
        b=mzKuZJjUUP+SXGJOqWSv4NIYrO+6lOgiGuJdSSd8FQZjioaemJXi2023nLC88lb6Pb
         HE6glTa/Q7/wsyeuZM+bpB+oJq0zjyLUcHeIEAx5B6IZ/Gdiodg9LE00YCxq3z57Wvhg
         GC/dXYN93GGaJ1HhT6CEgTl1jJQlJfsRxeNJ9hirky51tbXXs1xHSLBT1HjYU6hoB5S0
         imY8sLY4eA6iTXqqP80RvmbnyxSrHro/PXgK3+lGsA19GwcsfaYNjTH4cuEBkUdjHKC1
         GdGFFhK4yo6eGOOhcLKCE+9hqg8+SySMvVWN5DYMD2PmMSxXuJkfifaCt8A+h74YuGWR
         OUTg==
X-Forwarded-Encrypted: i=1; AHgh+Rr028DnN/8YDNVs/myTZpJqNElW+VTpMan5DHtjL/93rNIBySHUZk550rhQBJv/I/Ow21p7P3gdGYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUnb6waz5YoYqY7DydfD80gTelstM6QCUQzovFCILapMEhMxg
	gSS8FWmTUVH02niRfpOyN3lxFfHeRaJfiXdHBc5TrkCHJ0QkuJBI6CwHMhvmmNmqsDM=
X-Gm-Gg: AR+sD11pwLkfYAgEv6cpu03YqsAz28iCERuMrCfStNazsK2zfBWa5k1Zpf5oZSAHqKU
	6a5xqBfa2STA3jYvg4lxwR8VReMOtWoT2J6UXYuvNWJ9tPaTkosCc38Omy1523ECo2ikzMVRqNI
	gHZebi2ahhRI5zvngjBjvBTX2pHtQXlfkh/KUH7aBY6y63fs3hobdq9bcNyRPPYdehCfRVlQosb
	5Nis8I1gvlw3gDqwr1/iMSO8UKkdx88wZOtFdPos4X1WQdDa3uuo6rNojQ/Zalxd7l9qvRjfcVI
	m9bYkq1UIhJLmnAhsgkYleq6wr3I1PXJv1POUqvVkGIjQDzO6e3ZnS9LKGl4HaAbhTKJ8fCJ0YL
	rMqMBST74Fgx3bPlUKSqYALVREAk9p4DTyyHGEtcHVtvChRoo3c94F/d5Os7Z3CfVKicqlKOuvL
	C+
X-Received: by 2002:a05:622a:c08:b0:51b:f40b:2fac with SMTP id d75a77b69052e-5283df4fea9mr83122981cf.50.1784918460467;
        Fri, 24 Jul 2026 11:41:00 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e854e497sm4176346d6.11.2026.07.24.11.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:40:59 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:40:59 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org,
	tj@kernel.org, shakeel.butt@linux.dev, mhocko@kernel.org,
	mkoutny@suse.com, nphamcs@gmail.com, chengming.zhou@linux.dev,
	muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in
 shrink_memcg()
Message-ID: <amOxu56ibbhKP8qJ@cmpxchg.org>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com>
 <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org>
 <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com>

On Fri, Jul 24, 2026 at 06:20:50PM +0800, Hao Jia wrote:
> 
> 
> On 2026/7/24 00:39, Yosry Ahmed wrote:
> > On Thu, Jul 23, 2026 at 6:55 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >>
> >> On Wed, Jul 22, 2026 at 09:52:18PM -0700, Yosry Ahmed wrote:
> >>> On Wed, Jul 22, 2026 at 7:27 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >>>>
> >>>> On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
> >>>>> @@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct *w)
> >>>>>                        goto resched;
> >>>>>                }
> >>>>>
> >>>>> -             ret = shrink_memcg(memcg);
> >>>>> +             ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
> >>>>>                /* drop the extra reference */
> >>>>>                mem_cgroup_put(memcg);
> >>>>>
> >>>>> @@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
> >>>>>        objcg = get_obj_cgroup_from_folio(folio);
> >>>>>        if (objcg && !obj_cgroup_may_zswap(objcg)) {
> >>>>>                memcg = get_mem_cgroup_from_objcg(objcg);
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
> Building on Test Case 2, I set zswap.max=320M (~1% of total system 
> memory) and updated both invocation paths of shrink_memcg() to process 
> batches of 32 or 64. The resulting benchmark data is shown below.
> (Note: Test Case 2 also sets max_pool_percent=1.)
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

Thanks for testing both!

Looks like 32 shows the better matching with the reclaim batches than
64: it writes back less and swaps in less, while still having the
improved rejection rate. It even rejects slightly less than 64, but
that might be noise? Absolute stores win handily in any case - not
sure if that's meaningful in your test design.
