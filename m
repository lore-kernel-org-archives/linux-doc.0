Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9E38C
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 01:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MBmhErMY"
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA26112
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 18:12:22 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53d9b94731aso13034365a12.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 18:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697677941; x=1698282741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhz7SA9P+XJBcY68CPcxHuRXH5ke/B4swdMIdIEkvG8=;
        b=MBmhErMYbMgj5TySQ41JVNBhYlVHOZBtnFLqJwR4aNq9e8AxEcLejpVsD0Dhkt+11N
         py9EvvUyiAJolKhQvj7tZwusHxXsF79EidRSdjVSERJNAtAAlRgLY8YmF0SUmrhoYa04
         7FgaqORJU4Fq82sl+qmpO8cqALV6Hd88K4aCh0La2GkZKtnspLJqCuEPbKl3iV6nQ4bu
         wBaes+lpzyL1yglbbN+kWYWerRkodNAO71ArcZ0S6m7/CzODeuZvyZhkgPUauSb7v4VB
         8xDmfvYGTCkw/TDXToUUXjXpDt1KHOdhHNIeHbsfiq84qXqgZ5Gb8EWJxtG2j9FQlUB1
         soag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697677941; x=1698282741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhz7SA9P+XJBcY68CPcxHuRXH5ke/B4swdMIdIEkvG8=;
        b=lX1bfjIV+C9KcjCuU6oC7yxkWQXcpvaqyGZrctpP7bCroMn8adLHZrYSs93qfehf6J
         BqK4aMy3gVBVgF9wY7P6nz6Xv0fizBKLNgIPGovWMIsVTHkKxFpuRWVWOfVrnEuqjOM3
         Bk7f36qiWhZq78iiDo/WheCCzcZlXgP71Wu+FwpjNiyNoB1x3HI5dKPwghuu6tBYJKpg
         o+QuDlXK+BbKe9GYEvd9ys+6zC6FgF3pdvh1BPsjIjCCHBpaUFJqZueNrNvnetA8oBue
         1R1wmRJMI28ksGU7d4uNjoPy6cioqv1DYGrd59sTII0OsfCLtgvwbhXZR+RK5lih9o29
         mFqA==
X-Gm-Message-State: AOJu0YyCL8VBZKcvPF/f4XjAUxwUeYM0t2Xgchj+Bz2klv58A4Q9Z/EU
	85U9yB5x4aGxXfkZlFiUPPYOke2stCu70zFqsyyukw==
X-Google-Smtp-Source: AGHT+IGHwNm3FxuIImSmxPAbFGp0c1yIKTSGLdrYiFc3epvSZQVMDEXR/8eKkuYyYFUstTct/Rdwn0qkA6qA1qwCpuE=
X-Received: by 2002:a17:907:c16:b0:9ae:59c9:b831 with SMTP id
 ga22-20020a1709070c1600b009ae59c9b831mr625646ejc.49.1697677940697; Wed, 18
 Oct 2023 18:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231017232152.2605440-3-nphamcs@gmail.com>
 <CAJD7tka2aVKBJj6cYutcVzOGzj_6gop6-ytSmWWML=sEe9qHbA@mail.gmail.com> <CAKEwX=N3CnKE+gu-EP98Wr3goQV0Z8fXn_nBPW_H_rupjkBwhA@mail.gmail.com>
In-Reply-To: <CAKEwX=N3CnKE+gu-EP98Wr3goQV0Z8fXn_nBPW_H_rupjkBwhA@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 18 Oct 2023 18:11:41 -0700
Message-ID: <CAJD7tkbBBTatK7LUHw__0K_8hykoepygfYLJuZx01CD8V+CZvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] zswap: make shrinking memcg-aware
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 4:47=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, Oct 18, 2023 at 4:20=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Tue, Oct 17, 2023 at 4:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > >
> > > From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> > >
> > > Currently, we only have a single global LRU for zswap. This makes it
> > > impossible to perform worload-specific shrinking - an memcg cannot
> > > determine which pages in the pool it owns, and often ends up writing
> > > pages from other memcgs. This issue has been previously observed in
> > > practice and mitigated by simply disabling memcg-initiated shrinking:
> > >
> > > https://lore.kernel.org/all/20230530232435.3097106-1-nphamcs@gmail.co=
m/T/#u
> > >
> > > This patch fully resolves the issue by replacing the global zswap LRU
> > > with memcg- and NUMA-specific LRUs, and modify the reclaim logic:
> > >
> > > a) When a store attempt hits an memcg limit, it now triggers a
> > >    synchronous reclaim attempt that, if successful, allows the new
> > >    hotter page to be accepted by zswap.
> > > b) If the store attempt instead hits the global zswap limit, it will
> > >    trigger an asynchronous reclaim attempt, in which an memcg is
> > >    selected for reclaim in a round-robin-like fashion.
> >
> > Could you explain the rationale behind the difference in behavior here
> > between the global limit and the memcg limit?
>
> The global limit hit reclaim behavior was previously asynchronous too.
> We just added the round-robin part because now the zswap LRU is
> cgroup-aware :)
>
> For the cgroup limit hit, however, we cannot make it asynchronous,
> as it is a bit hairy to add a per-cgroup shrink_work. So, we just
> perform the reclaim synchronously.
>
> The question is whether it makes sense to make the global limit
> reclaim synchronous too. That is a task of its own IMO.

Let's add such context to the commit log, and perhaps an XXX comment
in the code asking whether we should consider doing the reclaim
synchronously for the global limit too.

>
> (FWIW, this somewhat mirrors the direct reclaimer v.s kswapd
> story to me, but don't quote me too hard on this).
>
[..]
>
> >
> > >         /* Hold a reference to prevent a free during writeback */
> > >         zswap_entry_get(entry);
> > >         spin_unlock(&tree->lock);
> > >
> > > -       ret =3D zswap_writeback_entry(entry, tree);
> > > +       writeback_result =3D zswap_writeback_entry(entry, tree);
> > >
> > >         spin_lock(&tree->lock);
> > > -       if (ret) {
> > > -               /* Writeback failed, put entry back on LRU */
> > > -               spin_lock(&pool->lru_lock);
> > > -               list_move(&entry->lru, &pool->lru);
> > > -               spin_unlock(&pool->lru_lock);
> > > +       if (writeback_result) {
> > > +               zswap_reject_reclaim_fail++;
> > > +               memcg =3D get_mem_cgroup_from_entry(entry);
> > > +               spin_lock(lock);
> > > +               /* we cannot use zswap_lru_add here, because it incre=
ments node's lru count */
> > > +               list_lru_putback(&entry->pool->list_lru, item, entry_=
to_nid(entry), memcg);
> > > +               spin_unlock(lock);
> > > +               mem_cgroup_put(memcg);
> > > +               ret =3D LRU_RETRY;
> > >                 goto put_unlock;
> > >         }
> > > +       zswap_written_back_pages++;
> >
> > Why is this moved here from zswap_writeback_entry()? Also why is
> > zswap_reject_reclaim_fail incremented here instead of inside
> > zswap_writeback_entry()?
>
> Domenico should know this better than me, but my understanding
> is that moving it here protects concurrent modifications of
> zswap_written_back_pages with the tree lock.
>
> Is writeback single-threaded in the past? This counter is non-atomic,
> and doesn't seem to be protected by any locks...
>
> There definitely can be concurrent stores now though - with
> a synchronous reclaim from cgroup-limit hit and another
> from the old shrink worker.
>
> (and with the new zswap shrinker, concurrent reclaim is
> the expectation!)

The comment above the stats definition stats that they are left
unprotected purposefully. If we want to fix that let's do it
separately. If this patch makes it significantly worse such that it
would cause a regression, let's at least do it in a separate patch.
The diff here is too large already.

>
> zswap_reject_reclaim_fail was previously incremented in
> shrink_worker I think. We need it to be incremented
> for the shrinker as well, so might as well move it here.

Wouldn't moving it inside zswap_writeback_entry() near incrementing
zswap_written_back_pages make it easier to follow?
