Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCC321B5
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AQyjuLqI"
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C82611B
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:28:51 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9c2a0725825so789729766b.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697732929; x=1698337729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujM1wfP0X1TfyN6UNvLQZYpXjOqlX96jhGMomCpg6WI=;
        b=AQyjuLqISg0ol/mOPtn6SNlLQA+qjuWdrfLrsRK8KDMNU27oQCYaQbuEx/E03Z7r3l
         ixzsh7gathuMmEdmjAqwGN7kDSIYAx3vynocFxmpsmXOaQISiz13D8LxiP0TrpUy4c/s
         2uBZwKIQKf4kAN+XKW8/ekaMnHimQLFExuGMyN5r9OzFpsu5i3U4TlYsxWV05eQc2KqW
         3PD2ooI0VHxGegUb+WErzby4DMX9jrr5E4CPu30C2OkK5cCTCcmaSTOYOoGA8qbXwS1i
         VaoYgLRj7zzBAs27Wo3yEKUI1Y4YvAkZFES/ipnmmVEH4uOKemE9t11M0RXDcLsadpmN
         29fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697732929; x=1698337729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujM1wfP0X1TfyN6UNvLQZYpXjOqlX96jhGMomCpg6WI=;
        b=ZBjSmf8ucU5Dy8/f9LXA2pcWOgUAC0vYC/DzTRdItv2i18SnSM8qg2rXh3wSuAUPvm
         7b1aOMu002qwGV8jeVvUo5J3QM3UzVhoCaZ0+QxWarrMbjELtpvrMkOa7VdlTYdzqPwi
         BiUcwtwjRs3TTVXZYtsAHPsoz46MM8FMlStIC1c6GlZLdc1aNq3oLShgrw7kLtXayrKX
         6DSRnFdZo0y9SzauLLWOTExGHdLruwND63hgCsTCcMPZAB4e+XWONmizd+ehtnUHjaK2
         SpSORGpWPfrFRGaSBLSXopUGhT03KfoGj3qjA/wFmdnKZB5QGblNbx6GGc9zU/mz5YxM
         3Few==
X-Gm-Message-State: AOJu0YwluWf1xIYD+cS1MoyoB1zUO1Z3303tax0pXVJ/GVJQnPbmOuZU
	do2pvPw5jvhgGqTLQjLZbYeOvFV1+TwGCtHmOwxZEA==
X-Google-Smtp-Source: AGHT+IH1mhZ593C522jUwS7zeIu38LLXk4SWolAFCunW7qpDA82KIVoklWuarRvwv+WrfLGsNtAXOyLsixAfdhaKuns=
X-Received: by 2002:a17:906:7308:b0:9c7:5a01:ffe6 with SMTP id
 di8-20020a170906730800b009c75a01ffe6mr2197542ejc.13.1697732929159; Thu, 19
 Oct 2023 09:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231017232152.2605440-3-nphamcs@gmail.com>
 <CAJD7tka2aVKBJj6cYutcVzOGzj_6gop6-ytSmWWML=sEe9qHbA@mail.gmail.com>
 <CAKEwX=N3CnKE+gu-EP98Wr3goQV0Z8fXn_nBPW_H_rupjkBwhA@mail.gmail.com>
 <CAJD7tkbBBTatK7LUHw__0K_8hykoepygfYLJuZx01CD8V+CZvg@mail.gmail.com> <CA+CLi1i9GHxMvMj16WPr7h_SNUhYo1rr9U8VtJDtOxiVhVznbg@mail.gmail.com>
In-Reply-To: <CA+CLi1i9GHxMvMj16WPr7h_SNUhYo1rr9U8VtJDtOxiVhVznbg@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 19 Oct 2023 09:28:09 -0700
Message-ID: <CAJD7tkZqpU6cVD6VGKooOJ2yf4Oodd5QUuHWLh8PYMLtZA-9Lw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] zswap: make shrinking memcg-aware
To: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 5:47=E2=80=AFAM Domenico Cerasuolo
<cerasuolodomenico@gmail.com> wrote:
>
> On Thu, Oct 19, 2023 at 3:12=E2=80=AFAM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Wed, Oct 18, 2023 at 4:47=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > >
> > > On Wed, Oct 18, 2023 at 4:20=E2=80=AFPM Yosry Ahmed <yosryahmed@googl=
e.com> wrote:
> > > >
> > > > On Tue, Oct 17, 2023 at 4:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.co=
m> wrote:
> > > > >
> > > > > From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> > > > >
> > > > > Currently, we only have a single global LRU for zswap. This makes=
 it
> > > > > impossible to perform worload-specific shrinking - an memcg canno=
t
> > > > > determine which pages in the pool it owns, and often ends up writ=
ing
> > > > > pages from other memcgs. This issue has been previously observed =
in
> > > > > practice and mitigated by simply disabling memcg-initiated shrink=
ing:
> > > > >
> > > > > https://lore.kernel.org/all/20230530232435.3097106-1-nphamcs@gmai=
l.com/T/#u
> > > > >
> > > > > This patch fully resolves the issue by replacing the global zswap=
 LRU
> > > > > with memcg- and NUMA-specific LRUs, and modify the reclaim logic:
> > > > >
> > > > > a) When a store attempt hits an memcg limit, it now triggers a
> > > > >    synchronous reclaim attempt that, if successful, allows the ne=
w
> > > > >    hotter page to be accepted by zswap.
> > > > > b) If the store attempt instead hits the global zswap limit, it w=
ill
> > > > >    trigger an asynchronous reclaim attempt, in which an memcg is
> > > > >    selected for reclaim in a round-robin-like fashion.
> > > >
> > > > Could you explain the rationale behind the difference in behavior h=
ere
> > > > between the global limit and the memcg limit?
> > >
> > > The global limit hit reclaim behavior was previously asynchronous too=
.
> > > We just added the round-robin part because now the zswap LRU is
> > > cgroup-aware :)
> > >
> > > For the cgroup limit hit, however, we cannot make it asynchronous,
> > > as it is a bit hairy to add a per-cgroup shrink_work. So, we just
> > > perform the reclaim synchronously.
> > >
> > > The question is whether it makes sense to make the global limit
> > > reclaim synchronous too. That is a task of its own IMO.
> >
> > Let's add such context to the commit log, and perhaps an XXX comment
> > in the code asking whether we should consider doing the reclaim
> > synchronously for the global limit too.
>
> Makes sense, I wonder if the original reason for switching from a synchro=
nous
> to asynchronous reclaim will still be valid with the shrinker in place.
>

Seems like it was done as part of the hysteresis that stops accepting
pages into zswap once full until it reaches a certain threshold,
commit 45190f01dd40 ("mm/zswap.c: add allocation hysteresis if pool
limit is hit"). I guess the point is that zswap will stop accepting
pages when the limit is hit anyway, so no need to synchronously shrink
it since we can't store soon anyway. More useful context for the
commit log.

> >
> > >
> > > (FWIW, this somewhat mirrors the direct reclaimer v.s kswapd
> > > story to me, but don't quote me too hard on this).
> > >
> > [..]
> > >
> > > >
> > > > >         /* Hold a reference to prevent a free during writeback */
> > > > >         zswap_entry_get(entry);
> > > > >         spin_unlock(&tree->lock);
> > > > >
> > > > > -       ret =3D zswap_writeback_entry(entry, tree);
> > > > > +       writeback_result =3D zswap_writeback_entry(entry, tree);
> > > > >
> > > > >         spin_lock(&tree->lock);
> > > > > -       if (ret) {
> > > > > -               /* Writeback failed, put entry back on LRU */
> > > > > -               spin_lock(&pool->lru_lock);
> > > > > -               list_move(&entry->lru, &pool->lru);
> > > > > -               spin_unlock(&pool->lru_lock);
> > > > > +       if (writeback_result) {
> > > > > +               zswap_reject_reclaim_fail++;
> > > > > +               memcg =3D get_mem_cgroup_from_entry(entry);
> > > > > +               spin_lock(lock);
> > > > > +               /* we cannot use zswap_lru_add here, because it i=
ncrements node's lru count */
> > > > > +               list_lru_putback(&entry->pool->list_lru, item, en=
try_to_nid(entry), memcg);
> > > > > +               spin_unlock(lock);
> > > > > +               mem_cgroup_put(memcg);
> > > > > +               ret =3D LRU_RETRY;
> > > > >                 goto put_unlock;
> > > > >         }
> > > > > +       zswap_written_back_pages++;
> > > >
> > > > Why is this moved here from zswap_writeback_entry()? Also why is
> > > > zswap_reject_reclaim_fail incremented here instead of inside
> > > > zswap_writeback_entry()?
> > >
> > > Domenico should know this better than me, but my understanding
> > > is that moving it here protects concurrent modifications of
> > > zswap_written_back_pages with the tree lock.
> > >
> > > Is writeback single-threaded in the past? This counter is non-atomic,
> > > and doesn't seem to be protected by any locks...
> > >
> > > There definitely can be concurrent stores now though - with
> > > a synchronous reclaim from cgroup-limit hit and another
> > > from the old shrink worker.
> > >
> > > (and with the new zswap shrinker, concurrent reclaim is
> > > the expectation!)
> >
> > The comment above the stats definition stats that they are left
> > unprotected purposefully. If we want to fix that let's do it
> > separately. If this patch makes it significantly worse such that it
> > would cause a regression, let's at least do it in a separate patch.
> > The diff here is too large already.
> >
> > >
> > > zswap_reject_reclaim_fail was previously incremented in
> > > shrink_worker I think. We need it to be incremented
> > > for the shrinker as well, so might as well move it here.
> >
> > Wouldn't moving it inside zswap_writeback_entry() near incrementing
> > zswap_written_back_pages make it easier to follow?
>
> As Nhat said, zswap_reject_reclaim_fail++ had to be moved, I naturally mo=
ved it
> here because it's where we act upon the result of the writeback. I then n=
oticed
> that zswap_written_back_pages++ was elsewhere and decided to move that as=
 well
> so that they're in the same place and at least they're under the tree loc=
k.
>
> It's not meant to fix the unprotected counters, it's just a mitigation si=
nce we
> are forced to move at least one of them.

I see. Just for my own understanding, it would be correct to update
them in zswap_writeback_entry(), but we choose to do it here as we
happen to hold the lock so we get the free synchronization? I think it
could be beneficial as we may see increased concurrent writeback with
this series. Probably something to call out in the commit log as well.
