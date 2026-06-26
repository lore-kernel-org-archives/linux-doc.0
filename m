Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBFC37F73C
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 17:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493783; cv=none; b=W/jMmFXMPprv1nzXN/5ZTgkRxwfcs2R+z+waTjAcWdJ0pk2MhQPrD8WsU7Qo+X47xhFkMnCnRZZtnAGFdhs/0brhs7BeRDxxySDzDIHHeEcPM22V5itxE1SZh3uoK53SPl8KliSbyvoJxpPejgXPokaSkuGnH0veb6l1tQWDhPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493783; c=relaxed/simple;
	bh=0jwJGjkLrp2Bvgpk7r/tOmfuxcf9NxwgTF/x0DnWReA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXsIndpHcDaXHATtPDDMgOg774VNDhuqw6dCpet6Uq4h48Qez+vGq7OElwo/I3nT6gVcftJm6m3Mk6qy1ifvFxSgjfRV5nt6hbeQD1g/KNIhEvHT9Ev3HKYg/PklO+SUC6GLgqK3nrSexJNHMpAVM89PyPJtvD8/FdutXKfHBQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvtIiIhO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvtIiIhO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E862F1F00AC4
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782493780;
	bh=yHkZooWF8Ur28rAu1FbBgAaf/eWl4Mro8CPDk/C5t70=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UvtIiIhO3QvepwPv+1GoKeUBCwf3S1dzAJF9pRuauPtv9+YewCYoiyfbVNP6BqioN
	 JDBuechUIJ0XXm+kfzVjczBVRaXpb578l2Rxy+BSSjN+/Ua/RalnQ7HTDFH/hTG8wP
	 eR/JuF9C2cRoWVmME1TbLPVH3km1XP93CbQlzdAWPSQayN6NpxBwfObkciuVI0WLwt
	 1sK59DJkG7dQjxxHhCX1REEdxnHb5CtLMUOrx20FnolHyfAsQEQlWBJdj78gcbAEf5
	 aPC1ORFQE9pw5r2sR453fMPeSZb25YNGjfW/2wTi+bB2UJiJbflWNdStnlIq1KrOqK
	 97ONUB5XVc1Lw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c0c15bd6b8fso126118066b.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 10:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RodrNoqubkp60Sgovwhdq/BlMsduop/b+5HYFkWxDxwm1xjGVp80JFjFxhkke/w2s0tYWVhaBlPls4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0El49axDK1BusBG2uOCPY2SMd693StWAO2ma14pbyNXjUJLBO
	HusNiRSRDalLwXk+zjQ6A8CW4FLfSwvDLJDHZFlevj/4Fo7X/JVjl0IKZ4T9074r1fObtCOTXQt
	ZGBKqVS4Omqiuh4s3UpovZGz3tSeqddE=
X-Received: by 2002:a17:907:c48b:b0:c12:34f0:f7c3 with SMTP id
 a640c23a62f3a-c1234f0fa0amr79606766b.54.1782493779839; Fri, 26 Jun 2026
 10:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-3-jiahao.kernel@gmail.com> <ajnGTt8tkbAWX8Oc@google.com>
 <0916e673-861f-b472-7417-afbffbcc98ad@gmail.com> <CAO9r8zPSZLaqLXw87V3q4tZa8WD7xCympKqfLMLB+o-++GksJQ@mail.gmail.com>
 <91297bc0-268c-e9c2-57ae-6066eee5df2f@gmail.com> <CAO9r8zOYgjbuG5i+LrCcMK764nVpOS+muo-5Q45ZFdiVus-dTA@mail.gmail.com>
 <f1cd1ec9-48b0-1b03-0514-6c9958f3c77f@gmail.com>
In-Reply-To: <f1cd1ec9-48b0-1b03-0514-6c9958f3c77f@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 26 Jun 2026 10:09:28 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com>
X-Gm-Features: AVVi8Ce7xUNuZRw0D1P7C4xZVj0W7f5nf0PB5oHQs8hdjJ7b2fS6Xj-vyiTnFw8
Message-ID: <CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mm/zswap: Factor writeback loop out of shrink_worker()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: nphamcs@gmail.com, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"

> >> /*
> >>    * Take one step of a memcg-tree writeback walk driven by the caller's
> >>    * iterator, and fold the result into @s, the retry bookkeeping shared
> >>    * across steps. @memcg is the iterator's current memcg, or NULL once
> >>    * it has wrapped around after a full pass over the tree.
> >>    *
> >>    * The function returns -EAGAIN to signal the caller to abort the walk
> >>    * after encountering the following conditions MAX_RECLAIM_RETRIES times:
> >>    * - No writeback-candidate memcgs were found in a memcg tree walk.
> >>    * - Shrinking a writeback-candidate memcg failed.
> >
> > Orthogonal to this patch, but I wonder if this can be simplified. I
> > wonder if these two conditions can be replaced with "shrinking a memcg
> > that has zswap entries failed". The "no writeback-candidate memcgs in
> > the tree" case seems like we should abort right away instead of
> > retrying?
> >
> > Nhat, WDYT?
> >
>
> Perhaps something like the following is what you had in mind? I've
> drafted the implementation below to make it easier for Nhat to compare
> with the previous behavior.

Hmm I think if we pursue this it should be in a separate patch or even
outside of this series, ideally with numbers/proof that it's not
introducing regressions to the scenario that lead to its introduction.

>
>
> >>    *
> >>    * Return: The number of compressed bytes written back (>= 0), or -EAGAIN
> >>    * once the retry budget is exhausted and the caller should abort the walk.
> >>    */
> >> static long zswap_shrink_one(struct mem_cgroup *memcg,
> >
> > Nit: zswap_shrink_one_memcg()
> >
> > BTW, the existing writeback logic has been broken for a while now when
> > memcg is disabled. I think we constantly hit the !memcg case and run
> > out of retries. Not sure if your patch changes this in any way, or if
> > you want to fix that while you're at it :)
>
> Yes, I'd be happy to do that. However, would it be better to submit a
> separate fix patch or combine it with this one?

A separate patch. Feel free to send it with this series to avoid
conflicts, but probably as patch 1 as we'll want to CC stable on it.

[..]

> /* Track progress of a memcg-tree writeback walk. */
> struct zswap_shrink_state {
>      int scans;
>      int failures;
> };
>
> /*
>   * Take one step of a memcg-tree writeback walk driven by the caller's
>   * iterator, and fold the result into @s, the retry bookkeeping shared
>   * across steps. @memcg is the iterator's current memcg, or NULL once
>   * it has wrapped around after a full pass over the tree.
>   *
>   * The function returns -EBUSY to signal the caller to abort the walk when
>   * either of the following occurs:
>   * - A full pass over the tree found no writeback-candidate memcg.
>   * - Shrinking a writeback-candidate memcg failed MAX_RECLAIM_RETRIES
> times.
>   *
>   * When memory cgroup is disabled, the iterator always yields NULL. All
>   * zswap entries then live on the root list_lru, so NULL is treated as the
>   * root memcg and shrunk directly rather than as a completed tree pass.

I think this chunk should be moved above the code returning -EBUSY
when mem_cgroup_disabled() is true, and probably made more succinct as
it should be obvious.

>   *
>   * Return: The number of compressed bytes written back (>= 0), or -EBUSY
>   * when the caller should abort the walk.
>   */
> static long zswap_shrink_one_memcg(struct mem_cgroup *memcg,
>                     struct zswap_shrink_state *s)
> {
>      bool disabled = mem_cgroup_disabled();

No need to store this in a variable AFAICT, it's a static branch and
it's clearer to just call it directly in both call sites imo.

>      long shrunk;
>
>      /*
>       * If the iterator has completed a full pass, update the shrink state
>       * and check whether we should keep going.
>       * With memcg disabled the iterator always yields NULL, so fall through
>       * and shrink the root memcg directly instead.
>       */
>      if (!memcg && !disabled) {
>          /*
>           * Abort if no writeback-candidate memcgs in the last tree walk.
>           * Otherwise reset the scans count and continue.
>           */
>          if (!s->scans)
>              return -EBUSY;
>          s->scans = 0;
>          return 0;
>      }
>
>      shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>
>      /*
>       * There are no writeback-candidate pages in the memcg. With memcg
>       * enabled this is not an issue as long as we can find another memcg
>       * with pages in zswap, so skip without counting it as a candidate.
>       * With memcg disabled the root LRU is the only target, so we should
>       * abort if it has no writeback-candidate pages.
>       */
>      if (shrunk == -ENOENT)
>          return disabled ? -EBUSY : 0;
>      s->scans++;
>
>      if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
>          return -EBUSY;
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
>      /*
>       * Global reclaim will select cgroup in a round-robin fashion from all
>       * online memcgs, but memcgs that have no pages in zswap and
>       * writeback-disabled memcgs (memory.zswap.writeback=0) are not
>       * candidates for shrinking.
>       *
>       * We save iteration cursor memcg into zswap_next_shrink,
>       * which can be modified by the offline memcg cleaner
>       * zswap_memcg_offline_cleanup().
>       *
>       * Since the offline cleaner is called only once, we cannot leave an
>       * offline memcg reference in zswap_next_shrink.
>       * We can rely on the cleaner only if we get online memcg under lock.
>       *
>       * If we get an offline memcg, we cannot determine if the cleaner has
>       * already been called or will be called later. We must put back the
>       * reference before returning from this function. Otherwise, the
>       * offline memcg left in zswap_next_shrink will hold the reference
>       * until the next run of shrink_worker().
>       */
>      while (zswap_total_pages() > thr) {
>          struct mem_cgroup *memcg;
>          long ret;
>
>          cond_resched();
>          /*
>           * Start shrinking from the next memcg after zswap_next_shrink.
>           * When the offline cleaner has already advanced the cursor,
>           * advancing the cursor here overlooks one memcg, but this
>           * should be negligibly rare.
>           *
>           * If we get an online memcg, keep the extra reference in case
>           * the original one obtained by mem_cgroup_iter() is dropped by
>           * zswap_memcg_offline_cleanup() while we are shrinking the
>           * memcg.
>           */
>          spin_lock(&zswap_shrink_lock);
>          do {
>              memcg = mem_cgroup_iter(NULL, zswap_next_shrink, NULL);
>              zswap_next_shrink = memcg;
>          } while (memcg && !mem_cgroup_tryget_online(memcg));
>          spin_unlock(&zswap_shrink_lock);
>
>          ret = zswap_shrink_one_memcg(memcg, &s);
>          /* drop the extra reference taken above */
>          mem_cgroup_put(memcg);
>          if (ret == -EBUSY)
>              break;
>      }
> }
>
>
> Thanks,
> Hao
