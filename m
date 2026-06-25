Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484D223BD1B
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782410396; cv=none; b=VhT/Tw59J9Qz2x86MLAzbjHgCfVyC53z7m0TKA6z/fOv1J1xJQTQ7SQ2O0eajOtiHvkD/I2Qt9Ta6C6xYwTwrjKKIGupm2NG6+ukNdkEPKLCN/tSIj82xXXAiW/2ly6PPCggW1//MWV9oAKcCaLV5OfHu6U7T0rgejrFYYlcCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782410396; c=relaxed/simple;
	bh=6/GkAt4Z2eOprLX2S1JrmKmbZBR8kj0rRY9a/umRdYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLxBs8CsBiN1MVcozX2lHe0oBjPc6949sYu7cWWtMM+HGgMECPE9QKDaGVQB9XrjCpPQWAOD3tPe+DSZOC4+M+dzmgJB1a7KCy8DhNu0P3p9nTEwsAeFFQ/Or7QHeOFEO2Hte4CRb/7H+N1ofTxM+dp8sGmJANvmePf9w/fJr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTMDYN1M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTMDYN1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1407A1F00ADE
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782410395;
	bh=maBD18wndqrXXyxBBamm4qyhPlaRjOfTNx99c6xaonU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TTMDYN1MkkiCADF5OAf4cZrCoUDfwifR422d8+QUrPyQw0rVIiKYDRPTUtFo018mb
	 3AgXhKV2s6rgWMQTwbqzwm1SKkhgZji7SC/ToLKqDy8v3jiRibw6XpZ/HRqmGaN3Rz
	 MquNL3HIL6/1yTI9U9CPYfqGwVH8b3oQo3TJVe3pn6Ek4zLT/Ix8JwcqyyHiFcVWQH
	 NtPtIfYsPr/hS+G8Y5CjOfOfFYn6cGHBFhWgPEqBNcDkELDYtorFIcPksmvq2u1+se
	 QAWrRCB/agz+NJZ1RnpUMEGyYo0mCyeM+oPt+tGg7PHqGzLOQZ0QR+bjOzq/sLuw8Q
	 QUVKkL1QDZ5rQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso11828066b.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 10:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RobT8mUcM0PTmcbODa9yHYUry2z2H6VyPkuqD2LW36jaz7r5KncxXlt07E3NbOOQDHpVYSiq4kGPAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1tjM3GWQ4nlxt7p/oruIJ09ZJMvw1f4hOTEkPHOi4isLlyWd
	8ZqRjMGSivXPtCUsWBd2tqFd8dChBCKKu8yM+3VNImkG1mWxbi4sC0ev7Ht/lZhghlHGMnEsphW
	WU8Bxczu/ixonGvSD/unz/CzXSj2s6h4=
X-Received: by 2002:a17:907:9722:b0:c0c:c98b:c379 with SMTP id
 a640c23a62f3a-c1205e6d95cmr237202266b.14.1782410393872; Thu, 25 Jun 2026
 10:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-3-jiahao.kernel@gmail.com> <ajnGTt8tkbAWX8Oc@google.com>
 <0916e673-861f-b472-7417-afbffbcc98ad@gmail.com> <CAO9r8zPSZLaqLXw87V3q4tZa8WD7xCympKqfLMLB+o-++GksJQ@mail.gmail.com>
 <91297bc0-268c-e9c2-57ae-6066eee5df2f@gmail.com>
In-Reply-To: <91297bc0-268c-e9c2-57ae-6066eee5df2f@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 25 Jun 2026 10:59:42 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOYgjbuG5i+LrCcMK764nVpOS+muo-5Q45ZFdiVus-dTA@mail.gmail.com>
X-Gm-Features: AVVi8CdO4P-Ec9VD50shnHTdmKHFyCt4FDu6VKnLqYJ_-pw3WTO4T2Njs4-xTgc
Message-ID: <CAO9r8zOYgjbuG5i+LrCcMK764nVpOS+muo-5Q45ZFdiVus-dTA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mm/zswap: Factor writeback loop out of shrink_worker()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"

> >> static long zswap_shrink_one(struct mem_cgroup *memcg,
> >>                    struct zswap_shrink_state *s)
> >> {
> >>       long shrunk;
> >>
> >>       shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
> >>       if (shrunk == -ENOENT)
> >>           return 0;
> >>
> >>       s->attempts++;
> >>       if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
> >>           s->stop = true;
> >
> > Do we need 'stop' or can we just return a value here to indicate that
> > we should stop (e.g. -EBUSY)?
> >
>
> Perhaps we could return -EAGAIN instead of -EBUSY? This would align with
> the semantics of the memory.reclaim interface, which returns -EAGAIN
> when it reclaims fewer bytes than requested.

Hmm but -EAGAIN tells the caller to try again, while here -EAGAIN
tells the caller *not* to try again because we exhausted all retries?

> >
> > I think splitting the shrink/retry logic over 2 functions makes it
> > more difficult to follow, so yeah I think fold
> > zswap_shrink_no_candidate() into zswap_shrink_one(). Then the callers
> > only need to iterate memcgs (depending on the context) and call
> > zswap_shrink_one() for each of them.
>
> So, something like this?

Yeah, something like this :)

> /* Track progress of a memcg-tree writeback walk. */
> struct zswap_shrink_state {
>      int attempts;

While at it, I think "attempts" is really the number of scans, right?
Should we rename it? Maybe "scans" or similar?

>      int failures;
> };
>
> /*
>   * Take one step of a memcg-tree writeback walk driven by the caller's
>   * iterator, and fold the result into @s, the retry bookkeeping shared
>   * across steps. @memcg is the iterator's current memcg, or NULL once
>   * it has wrapped around after a full pass over the tree.
>   *
>   * The function returns -EAGAIN to signal the caller to abort the walk
>   * after encountering the following conditions MAX_RECLAIM_RETRIES times:
>   * - No writeback-candidate memcgs were found in a memcg tree walk.
>   * - Shrinking a writeback-candidate memcg failed.

Orthogonal to this patch, but I wonder if this can be simplified. I
wonder if these two conditions can be replaced with "shrinking a memcg
that has zswap entries failed". The "no writeback-candidate memcgs in
the tree" case seems like we should abort right away instead of
retrying?

Nhat, WDYT?

>   *
>   * Return: The number of compressed bytes written back (>= 0), or -EAGAIN
>   * once the retry budget is exhausted and the caller should abort the walk.
>   */
> static long zswap_shrink_one(struct mem_cgroup *memcg,

Nit: zswap_shrink_one_memcg()

BTW, the existing writeback logic has been broken for a while now when
memcg is disabled. I think we constantly hit the !memcg case and run
out of retries. Not sure if your patch changes this in any way, or if
you want to fix that while you're at it :)

>                   struct zswap_shrink_state *s)
> {
>      long shrunk;
>
>      /*
>       * If the iterator has completed a full pass, update the shrink state
>       * and check whether we should keep going.
>       */
>      if (!memcg) {
>          /*
>           * Continue shrinking without incrementing failures if we found
>           * candidate memcgs in the last tree walk.
>           */
>          if (!s->attempts && ++s->failures == MAX_RECLAIM_RETRIES)
>              return -EAGAIN;
>          s->attempts = 0;
>          return 0;
>      }
>
>      shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>
>      /*
>       * There are no writeback-candidate pages in the memcg. This is not an
>       * issue as long as we can find another memcg with pages in zswap. Skip
>       * this without incrementing attempts and failures.
>       */
>      if (shrunk == -ENOENT)
>          return 0;
>      s->attempts++;
>
>      if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
>          return -EAGAIN;
>
>      return shrunk;
> }
>
> static void shrink_worker(struct work_struct *w)
> {
>      struct zswap_shrink_state s = {};
>      unsigned long thr;
>
>      /* Reclaim down to the accept threshold */
>      thr = zswap_accept_thr_pages();
>
>      while (zswap_total_pages() > thr) {
>          struct mem_cgroup *memcg;
>          long ret;
>
>          cond_resched();
>
>          memcg = zswap_iter_global();

Do we still need this helper? Or should we just keep the memcg
iteration open-coded?

>          ret = zswap_shrink_one(memcg, &s);
>          /* drop the extra reference taken by zswap_iter_global() */
>          mem_cgroup_put(memcg);
>          if (ret == -EAGAIN)
>              break;
>      }
> }
