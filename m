Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361BC38F62A
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511029; cv=pass; b=caAubbUbsU54MawUceZMhkEGDSr8FBlRlWUDG5ID1ePwp5yNBb5AwEjY4uI8rVWAXpQaVqYyWLDIlDa49sxhM1tQbiX4NBOCyA3aki4ViiPZ1eKauaDv8FefyFGPkWB8lDQf8Sii2FN4O+o0rvQYhWoZc5Yhr4X5L4OWGzQFtOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511029; c=relaxed/simple;
	bh=hl2ne1Atd8E66sDkEQB6tbWJE9BHSgX8uQGAzS+dDjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfN+qQO0ydsyzszxBxVvShv5H+Vpf80FP2KnVYC8CBYZQ/auWf2FtZv2TcJRXQS36QALmDE/l31L2mJ7wY5jqvjMn/fX0+6209EifpFwB5NMXrONIPSo/kPkwSfTfSJZ8iPhEDAqqLIVmZQmBOkn3FTYzGxcI0ReV1RTBS5PqL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbuAAVaa; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbuAAVaa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eec22fab7so3727560f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 11:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780511025; cv=none;
        d=google.com; s=arc-20240605;
        b=SBjs/ul55vhvD7P+8rlHLKEMPHTpB5iU/PkWJRicihVPuDvNqhUntmX1aQWO1YFNZv
         xJkOJ1CkVb49xwjllML+9y5eSGw88POr7lexHXJwFyA/HTIunsXaKF21VRwhjpggMc6y
         f+PlKELkR47H6MS0Gwit/SDINMdNeZ4kOf0ekZ21/QJoKHiHydb+7nWazhUDuCBlRaWx
         WofYPgdv7u+F6n/PA2dwWAqYffI116OFvhNsLgs/3/Bw1Fc038MtmLNVDjdTYrQAF/2V
         Iwnwn/oKWtctse2dv8e9X+lj7wnaUYKFAWuM2nOqdYC2wcyA/r3B24u+iekl/IZO2om6
         l9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H5/qixCBVKIn17fieXnZwtlY6rJGJD1uIM6atv0ZcW4=;
        fh=X+8Gl2WWohkzn3w/VMvnlSRZTZOwhfJ3eGTOZpuj4P0=;
        b=hvtE1BfWA1bfPK18xAorvij9Nq295G+8vRFpvStTcWcJUpxZhq6PtTmVGlHeSnH0wH
         PgLhR/R09EaOR6Sl1wCGpIIZX/TPWfDvhsxPPkVU7TT2/Kd6tOhboIeWU3NFfvSLgWuT
         ThAIVnHoZq/I+E1JMNdqZtEyGsc809h6Ir1PlA9i3W7dwXjBOfPF/0IQjBtJCkeBNEly
         kQM4riBxqrA6OFyafulYKkyMLPyakLgGH2HL3sq1FePm/YLVT06URQZHc1eUkJK099eY
         cXDn9EozFYD8KVD6d7oELUmeHnOMZDs0HdnyQMvg4PNkHD5v45XwwQzZ+N4YxALreFh4
         R8mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780511025; x=1781115825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5/qixCBVKIn17fieXnZwtlY6rJGJD1uIM6atv0ZcW4=;
        b=hbuAAVaaJKnlMRv20LTfZjRADSE/eUng9SnVoLQVTkqBZLaAUiRsy1g+qvMcSMlcvI
         VXSsFNHVgzQh/II8IswgT3VR7HRgP9wGEI8WOhys+xVMPH5PHFcTBi6UYXpLpbOqn+sn
         cnppNKGLdposQcUunplxwV1MTJL8FPT4pNWSpKjsgP0L9wZQiCTHdJmyMu+qwzIoi3+n
         zMJ+dwTHXqiijaWD/0rW91MvZIWAxzA/9pZlGZ/jU77Iirr7vl1MGKxMB62djf3bnu3S
         WIIyRYUkQbmU9XICtiHmTRreUbtLfGnWiYIpQApRcf+YLYxjv+Cy3Obs1YEvggbRPR5Y
         5omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780511025; x=1781115825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H5/qixCBVKIn17fieXnZwtlY6rJGJD1uIM6atv0ZcW4=;
        b=dx2m03QijZ+894fXElePRhoe5JOCnOwMvqGBTfbfX71y49Y2nNV67+hjLd/NyQld/S
         ZrBdu9me3YvR3dPCZ2Crz/sAsoBIGZEBoQW/SwSydTvYw5y49YL7i/fzsaE1jKtw35mD
         huweB+KsIGk3+DZsvZQRKHlzQyLhr6E6pj4I7qvnl/2t0qmhvWhlvylvn0Zk7hWJSDBu
         p0HVFPwJleOt4JWGtJJU7b0gSRGbzByS5Kvz0+NDCsJ8mFZPTmtnMi87UGEEauPJEiUl
         4zqAevMSRNcRFdodKw8dtoU+49XLKLJmOFJS1vzzUekWOL8cVjPwZP4meN6NVksMQUfp
         wqeg==
X-Forwarded-Encrypted: i=1; AFNElJ+8BKitM3DM+n0GC0sQHYATn0RUGQBW6J+Ol4aylkM68nGa5Vaak8YSizKcP0Gs751AVNyzKjmcTds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTgPUiG6Akg5p8JAfRd3UZhfPU48P19I2kAzIX1K2wTdNrvSbU
	uEnkkSCC8tl9BEuonfGYcKN6cnmJ/LAxJdhEa54NHQTL7ujPjqsxa1DRg2De24PBSkUr2KYorFR
	7E+6vKD5tLMOAhwoAqz+OrjUMwC93xu0=
X-Gm-Gg: Acq92OHOsiaAMks+OAyBQ0NkkYaCq/Av8IOxAcEq8SUXu73QNn9NJN/Qjt8w0MtCsmw
	JQ8VRAbfRE3d6/A6HTXA88d2WV4SShMs3e9pclQy5MDIy4i6OHKYGH272Ga1epTD+MhhMY+feYD
	j/rx0ZU14jwgBoR+KCgE9k81Fmj8jIgEPymKe6iLUWPFIOBLYyUAhIxpYPAvl+hv7Xz/jfyE0/U
	MY8yxZUgryx8FaMImczIcbXHoY+j4edGsHys7gSq7HPXEtVrwabX3g3vHHDG5b7ljIq6V8JLA/u
	GEtlm7bPyVleEW/syaUrnBwVC5jM4ZBrodGPWC7o+wHJ/uAkuXF+tMiP9Mk3
X-Received: by 2002:a05:600c:4695:b0:490:bd1d:472a with SMTP id
 5b1f17b1804b1-490bd1d4865mr418905e9.15.1780511025470; Wed, 03 Jun 2026
 11:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-3-jiahao.kernel@gmail.com> <aho-Z6wshceTAYd9@google.com>
 <ea2c1323-1440-e927-f14a-0eac54a245bf@gmail.com>
In-Reply-To: <ea2c1323-1440-e927-f14a-0eac54a245bf@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 3 Jun 2026 11:23:33 -0700
X-Gm-Features: AVHnY4JV9IZeIUq7QxB_DLa_b3AR5iHZZp6MXPsHjOzMK24TtH3slZqwmfSKyPA
Message-ID: <CAKEwX=PoBZ4ci30tKHQXs1o9=NDpPrtbe7RxxZTbnzVJf74ZYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 4:27=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> wr=
ote:
>
>
>
> On 2026/5/30 09:37, Yosry Ahmed wrote:
> > On Tue, May 26, 2026 at 07:45:59PM +0800, Hao Jia wrote:
> >> From: Hao Jia <jiahao1@lixiang.com>
> >>
> >> Zswap currently writes back pages to backing swap reactively, triggere=
d
> >> either by the shrinker or when the pool reaches its size limit. There =
is
> >> no mechanism to control the amount of writeback for a specific memory
> >> cgroup. However, users may want to proactively write back zswap pages,
> >> e.g., to free up memory for other applications or to prepare for
> >> memory-intensive workloads.
> >>
> >> Introduce a "zswap_writeback_only" key to the memory.reclaim cgroup
> >> interface. When specified, this key bypasses standard memory reclaim
> >> and exclusively performs proactive zswap writeback up to the requested
> >> budget. If omitted, the default reclaim behavior remains unchanged.
> >>
> >> Example usage:
> >>    # Write back 100MB of pages from zswap to the backing swap
> >>    echo "100M zswap_writeback_only" > memory.reclaim
> >>
> >> Note that the actual amount written back may be less than requested du=
e
> >> to the zswap second-chance algorithm: referenced entries are rotated o=
n
> >> the LRU on the first encounter and only written back on a second pass.
> >> If fewer bytes are written back than requested, -EAGAIN is returned,
> >> matching the existing memory.reclaim semantics.
> >>
> >> Internally, extend user_proactive_reclaim() to parse the new
> >> "zswap_writeback_only" token and invoke the dedicated handler. Add
> >> zswap_proactive_writeback() to walk the target memcg subtree via the
> >> per-memcg writeback cursor, draining per-node zswap LRUs through
> >> list_lru_walk_one() with the shrink_memcg_cb() callback.
> >>
> >> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> >> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> >> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> >> ---
> >>   Documentation/admin-guide/cgroup-v2.rst |  18 +++-
> >>   Documentation/admin-guide/mm/zswap.rst  |  11 +-
> >>   include/linux/zswap.h                   |   7 ++
> >>   mm/vmscan.c                             |  14 +++
> >>   mm/zswap.c                              | 138 ++++++++++++++++++++++=
++
> >>   5 files changed, 185 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/a=
dmin-guide/cgroup-v2.rst
> >> index 6efd0095ed99..6564abf0dec5 100644
> >> --- a/Documentation/admin-guide/cgroup-v2.rst
> >> +++ b/Documentation/admin-guide/cgroup-v2.rst
> >> @@ -1425,9 +1425,10 @@ PAGE_SIZE multiple when read back.
> >>
> >>   The following nested keys are defined.
> >>
> >> -      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>        swappiness            Swappiness value to reclaim with
> >> -      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +      zswap_writeback_only  Only perform proactive zswap writeback
> >> +      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >>      Specifying a swappiness value instructs the kernel to perform
> >>      the reclaim with that swappiness value. Note that this has the
> >> @@ -1437,6 +1438,19 @@ The following nested keys are defined.
> >>      The valid range for swappiness is [0-200, max], setting
> >>      swappiness=3Dmax exclusively reclaims anonymous memory.
> >>
> >> +    The zswap_writeback_only key skips ordinary memory reclaim and
> >> +    writes back pages from zswap to the backing swap device until
> >> +    the requested amount has been written or no further candidates
> >> +    are found. This is useful to proactively offload cold pages from
> >> +    the zswap pool to the swap device. It is only available if
> >> +    zswap writeback is enabled. zswap_writeback_only cannot be combin=
ed
> >> +    with swappiness; specifying both returns -EINVAL.
> >> +
> >> +    Example::
> >> +
> >> +      # Write back up to 100MB of pages from zswap to the backing swa=
p
> >> +      echo "100M zswap_writeback_only" > memory.reclaim
> >
> >
> > memcg folks need to chime in about the interface here. An alternative
> > would be a separate interface (e.g. memory.zswap.do_writeback or
> > memory.zswap.writeback.reclaim or sth).
> >
> >> diff --git a/mm/zswap.c b/mm/zswap.c
> >> index 73e64a635690..7bcbf788f634 100644
> >> --- a/mm/zswap.c
> >> +++ b/mm/zswap.c
> >> @@ -1679,6 +1679,144 @@ int zswap_load(struct folio *folio)
> >>      return 0;
> >>   }
> >>
> >> +/*
> >> + * Maximum LRU scan limit:
> >> + * number of entries to scan per page of remaining budget.
> >> + */
> >> +#define ZSWAP_PROACTIVE_WB_SCAN_RATIO       16UL
> >> +/*
> >> + * Batch size for proactive writeback:
> >> + * - As the per-memcg writeback target in the outer memcg loop.
> >> + * - As the per-walk budget passed to list_lru_walk_one().
> >> + */
> >> +#define ZSWAP_PROACTIVE_WB_BATCH    128UL
> >> +
> >> +/*
> >> + * Walk the per-node LRUs of @memcg to write back up to @nr_to_write =
pages.
> >> + * Returns the number of pages written back, or -ENOENT if @memcg is =
a
> >> + * zombie or has writeback disabled.
> >> + */
> >> +static long zswap_proactive_shrink_memcg(struct mem_cgroup *memcg,
> >> +                                     unsigned long nr_to_write)
> >> +{
> >> +    unsigned long nr_written =3D 0;
> >> +    int nid;
> >> +
> >> +    if (!mem_cgroup_zswap_writeback_enabled(memcg))
> >> +            return -ENOENT;
> >> +
> >> +    if (!mem_cgroup_online(memcg))
> >> +            return -ENOENT;
> >> +
> >> +    for_each_node_state(nid, N_NORMAL_MEMORY) {
> >> +            bool encountered_page_in_swapcache =3D false;
> >> +            unsigned long nr_to_scan, nr_scanned =3D 0;
> >> +
> >> +            /*
> >> +             * Cap by LRU length: bounds rewalks when referenced
> >> +             * entries keep rotating to the tail.
> >> +             */
> >> +            nr_to_scan =3D list_lru_count_one(&zswap_list_lru, nid, m=
emcg);
> >> +            if (!nr_to_scan)
> >> +                    continue;
> >> +
> >> +            /*
> >> +             * Cap by SCAN_RATIO * remaining budget: bounds scan cost
> >> +             * to the remaining writeback budget.
> >> +             */
> >> +            nr_to_scan =3D min(nr_to_scan,
> >> +                             (nr_to_write - nr_written) * ZSWAP_PROAC=
TIVE_WB_SCAN_RATIO);
> >> +
> >> +            while (nr_scanned < nr_to_scan) {
> >> +                    unsigned long nr_to_walk =3D min(ZSWAP_PROACTIVE_=
WB_BATCH,
> >> +                                                   nr_to_scan - nr_sc=
anned);
> >> +
> >> +                    if (signal_pending(current))
> >> +                            return nr_written;
> >> +
> >> +                    /*
> >> +                     * Account for the committed budget rather than t=
he walker's
> >> +                     * actual delta. If the list is emptied concurren=
tly, the
> >> +                     * walker visits nothing and nr_scanned would nev=
er advance.
> >> +                     */
> >> +                    nr_scanned +=3D nr_to_walk;
> >> +
> >> +                    nr_written +=3D list_lru_walk_one(&zswap_list_lru=
, nid, memcg,
> >> +                                                    &shrink_memcg_cb,
> >> +                                                    &encountered_page=
_in_swapcache,
> >> +                                                    &nr_to_walk);
> >> +
> >> +                    if (nr_written >=3D nr_to_write)
> >> +                            return nr_written;
> >> +                    if (encountered_page_in_swapcache)
> >> +                            break;
> >> +
> >> +                    cond_resched();
> >> +            }
> >> +    }
> >> +
> >> +    return nr_written;
> >> +}
> >> +
> >> +int zswap_proactive_writeback(struct mem_cgroup *memcg,
> >> +                          unsigned long nr_to_writeback)
> >> +{
> >> +    struct mem_cgroup *iter_memcg;
> >> +    unsigned long nr_written =3D 0;
> >> +    int failures =3D 0, attempts =3D 0;
> >> +
> >> +    if (!memcg)
> >> +            return -EINVAL;
> >> +    if (!nr_to_writeback)
> >> +            return 0;
> >> +
> >> +    /*
> >> +     * Writeback will be aborted with -EAGAIN if we encounter
> >> +     * the following MAX_RECLAIM_RETRIES times:
> >> +     * - No writeback-candidate memcgs found in a subtree walk.
> >> +     * - A writeback-candidate memcg wrote back zero pages.
> >> +     */
> >> +    while (nr_written < nr_to_writeback) {
> >> +            unsigned long batch_size;
> >> +            long shrunk;
> >> +
> >> +            if (signal_pending(current))
> >> +                    return -EINTR;
> >> +
> >> +            iter_memcg =3D zswap_mem_cgroup_iter(memcg);
> >> +
> >> +            if (!iter_memcg) {
> >> +                    /*
> >> +                     * Continue without incrementing failures if we f=
ound
> >> +                     * candidate memcgs in the last subtree walk.
> >> +                     */
> >> +                    if (!attempts && ++failures =3D=3D MAX_RECLAIM_RE=
TRIES)
> >> +                            return -EAGAIN;
> >> +                    attempts =3D 0;
> >> +                    continue;
> >> +            }
> >> +
> >> +            batch_size =3D min(nr_to_writeback - nr_written,
> >> +                             ZSWAP_PROACTIVE_WB_BATCH);
> >> +            shrunk =3D zswap_proactive_shrink_memcg(iter_memcg, batch=
_size);
> >> +            mem_cgroup_put(iter_memcg);
> >> +
> >> +            /* Writeback-disabled or offline: skip without counting. =
*/
> >> +            if (shrunk =3D=3D -ENOENT)
> >> +                    continue;
> >> +
> >> +            ++attempts;
> >> +            if (shrunk > 0)
> >> +                    nr_written +=3D shrunk;
> >> +            else if (++failures =3D=3D MAX_RECLAIM_RETRIES)
> >> +                    return -EAGAIN;
> >> +
> >> +            cond_resched();
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >
> > There is a lot of copy+paste from shrink_worker() and shrink_memcg()
> > here. We really should be able to reuse shrink_memcg().
> >
>
> I will do some consolidation and code reuse in the next version.
>
> > Is the main difference that we are scanning in batches here? I think we
> > can have shrink_memcg() do that too. If anything, it might make the
> > shrinker more efficient. Over-reclaim is ofc a concern, and especially
> > in the zswap_store() path as the overhead can be noticeable. Maybe we
> > can parameterize the batch size based on the code path.
> >
> > Nhat, what do you think?
>
> Nhat, since we now have the referenced-based second chance algorithm,
> should we consider doing batch writeback for shrink_memcg() as well?

I just take a look at shrink_memcg() and realized it's reclaiming one
page at a time. Thanks for the reminder - I hated it.

Please batchify it if it makes your life easier :) We don't reclaim
"just one page/object" anywhere else in the reclaim path, Sure, it
adds a bit of latency to zswap_store() if we reached cgroup limit, but
IMHO if we hit zswap.max limit at zswap_store() time, that is already
the slowest of slow path that you should have avoided with proactive
reclaim/zswap shrinker in the first place. And, setting zswap.max does
not make sense to me in the first place (I can write a whole essay
about it).
