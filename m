Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEEF2EBDDE
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 00:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385619; cv=pass; b=BtI3xEYK/y4EkhF6oTCDMtMeFLFB9lE6+phDkwe8bZhXBpcsr6s4rnR4N2BOpjLWHlGLL7dCoN5a/osiwLMx0aGNUL1ohPgpaDcNYFyoA7Pw/6D3JMcVoEAyTDK1Ez+M3R8sciNxti5JwmRoH8p8yeB8uKcKJxFYZKv/aCJfnU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385619; c=relaxed/simple;
	bh=ykSrQMfXo2dj4X6dHkY+/vazEWuRZoedXQpfdPVtWog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFg0gie0emHZKWRw9iE2Vw98rlHla7/ETImKCTD1Ekah+9AwKUCNUbCJkKM/rlTKFqxvvaylikzBWA7NB6u5WfmC1ltIl4rv2ZKWCUjB9W98feZt1sB/hdum+zhxxw9tX6R+BkeuK1AXEZ79ziWs1rewlq4nfaE+th2r//tMzlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYHObY0Y; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYHObY0Y"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so3459946e87.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 17:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783385616; cv=none;
        d=google.com; s=arc-20260327;
        b=ZwZpBYua+FgnwC60JjJ15XD36+99aZGfDk26jjAua2wlooHZPc13I1+FI0AGorf5Lm
         ARjlL3EO8GbQkf0/90DaAxXnKepg0WRScLTlPU6y/+53frhjg9a4xhm8maWKzE0TbRk9
         xuT6U551A+p89wln3LnGgF4jQ5NBX2mzuE7kkqtj6rS+T36GYr3v51eTnWuaSZwQwVr2
         RPDjg8mCqgIbFuWDKfDcGS2f8MWO9K0BanmEsHLq6+NQVWD1+Qh5LK6T+Jc6SQScaybb
         bCRAHVvUtv4D67nD9mgwzdbvKT4QpFfFtLC7jwaHRi7rndvcIF0aAJr+kJFS2OPVbEGe
         4eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kn8ldbItk8xyKpMbvXRjP6pkMHLBNAC0H9NfPdYGmn8=;
        fh=umtC7GyoOce76ekZ5nAlidJ1nF2s5QjGy02l/75929U=;
        b=MaO5onVKJtqTR61JDO5BZjhG73XQm+m5ILYL9ea1ZU6Y1dbdCaKX+aFY8zmUpJ2Fsa
         EKrg+MyMao1z4CfyJBdhn9EpuLEIqPqVZLU7hMTrPt54U6/r/jjRCjrjLpjF2Pc26SW5
         u0uTTWawcI+yuplPDQmhnTTqP9lzXXGXZoGjIiqPP1N6u0NcYoBDvk/DlIdJqvHwxsIh
         c4NP+67RKh60/6OCvOycpFWKcGYCUzFWuIoQG+BEnR3TXk77u6UH6uHEszMG1ENJ79jV
         EtS/FBvS7heez+EaHluonxDdeRkg+0cigggLKwyGRFrTbDEN0Le7oUMUDCcjQYd0ecvq
         4vDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783385616; x=1783990416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn8ldbItk8xyKpMbvXRjP6pkMHLBNAC0H9NfPdYGmn8=;
        b=QYHObY0YRrU9IOHbEPoLy/F5uwhcvCS4XSqsu1imYoFjd8XWrwE2HvTzM4Pf0PDAmL
         S6JNeE/khWFIPd5O2rl/j6LEi0QHIwmQw83THiU4vFKeGUGqaRvKg9e7wXvj32IfZ0p9
         xFXjgeXsILk+CTlZt8Y0RQRGKfSxndSgE1Tg5QR+yehsbfp5j1SEIEnTM8I4w1kAYCrl
         bwQcnVDyScJ9o0GH089p+4/ol4w5hMMDDoR0dAHMtRROM7lY/lvBSeNRO/E7v+hjwbWi
         ZhvwntXrM2FpsYDszB1cwWqV5Jl60E662tG8ey5rTa4LLC6Imw8ryYwcmMZ0oDI3jo/e
         fIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783385616; x=1783990416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kn8ldbItk8xyKpMbvXRjP6pkMHLBNAC0H9NfPdYGmn8=;
        b=FggClel12cEjB37oRqS+rhIVdV0X8oS+8ye3u3x9nhXLOREJM7ykvsrc8nhYpDnFQL
         /vxypWdMJLPPqNLI5PXXUlIx8yyYkU5qm9QnYfbNhjAeUBr+1I/AQcYVQU8qXdd1yitx
         0Gl/UQHWl4C4lYLaQeogJOkxYLeqAZPSeOy7ZBMLZT3ZmxmHjjT6PSx78hh2MB+aLxEU
         i63x0GS85/4zKDI14J5VU1CHADaS4TvZRPJoz6HMJWAo4U7g9M5U2xYN9eMtDfztA+pG
         B8D+Jw5Ul22XXUu2xOSVaKmksQXlcpuAVdiEwufLZdeSyvnRLi4RddkV9Ihc+ZO74Cme
         xDGw==
X-Forwarded-Encrypted: i=1; AHgh+RopwUZJZph7FRBPUNwlfA/hQNj46DGAR3FtHM2rWwrCnTH19XLGP889DMwYmqnGWB2lURYi/Yanl9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2qq81ZzHNrGs6jy7estG6GN3t3EqHXymO66UYjdrCXq1nznA
	1dGkpAxz2MoMDlCshcnsjDGtdnLduJy3pylVzKQt0TVdOn2ugffyraOMQdrKi2VGO/H+HIFBckf
	LeMgLT4/St/Qam3kzqgGTiIg9fF23D1I=
X-Gm-Gg: AfdE7cmt69eB5NoDKx8XoYq2uFGkMY5g6TOrYjwefZwn+qZ4BY18a5X+cD4OliQVoU5
	lDbMH7j2x5550lK4SOGl+d/iaEncV1cPJpN5bb8KwX/Pn0ZvCCQ76mIzrqJ1nm35mB6rcPuk597
	HogRUHi5L8VJxXinIL3bYtZxfJwuq/k2HpMXqRwe+UC5an+fsBfqdKipF9gfN7+p+PyCoQsr1CC
	paouWqIPAXQBzEZs6o7Z1d3GNgCPhwIeQxeQXBldEDJJQlRRpzOZKJB8upxpYUWrf94D/zGtA3o
	VVaia5yJMRY+ba4f+FQSPrjBmQ==
X-Received: by 2002:ac2:4946:0:b0:5ae:b6b4:f20f with SMTP id
 2adb3069b0e04-5b007bb0853mr433464e87.53.1783385615562; Mon, 06 Jul 2026
 17:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
 <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-1-a028e8b5fc3d@gmail.com> <CAMgjq7DeWvBszNt0sHcCOft3A48LVJTxLu70F_Ka7=sjii2M8A@mail.gmail.com>
In-Reply-To: <CAMgjq7DeWvBszNt0sHcCOft3A48LVJTxLu70F_Ka7=sjii2M8A@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 7 Jul 2026 08:53:22 +0800
X-Gm-Features: AVVi8Ccjg0Brjkiol6TCwlQC-QFzVy2rNdaaijBQxdxg-4n2Dgi1RvNR2sGYUp0
Message-ID: <CAJxJ_jhL=kdbrqFmZdosXqjgF6Wp4DQRPVj33BOpVWt5=9Qn0w@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm/swap: colocate page-cluster sysctl with swap readahead
To: Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 1:24=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrote=
:
>
> On Sun, Jul 5, 2026 at 10:14=E2=80=AFPM Jianyue Wu <wujianyue000@gmail.co=
m> wrote:
> >
> > page_cluster and the vm.page-cluster sysctl are only used by swap-in
> > readahead in swap_state.c. Move them out of swap.c together with
> > swap_readahead_setup(), and make page_cluster static to that file.
> >
> > Rename swap_setup() while moving it as well. The helper is internal to
> > MM and now only sets up swap readahead defaults and its sysctl hook, so
> > the more specific name matches its reduced scope.
> >
> > swap_setup() previously lived in mm/swap.c, which is built
> > unconditionally, so the vm.page-cluster sysctl was registered also on
> > CONFIG_SWAP=3Dn kernels. swap_readahead_setup() is now a no-op stub whe=
n
> > CONFIG_SWAP is disabled, so vm.page-cluster is no longer registered
> > there. The knob only tunes swap-in readahead and had no effect without
> > swap.
> >
> > Suggested-by: Baoquan He <bhe@redhat.com>
> > Suggested-by: Barry Song <baohua@kernel.org>
> > Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> > Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> > ---
> >  include/linux/swap.h |  1 -
> >  mm/swap.c            | 36 ------------------------------------
> >  mm/swap.h            |  9 +++++++--
> >  mm/swap_state.c      | 37 +++++++++++++++++++++++++++++++++++++
> >  mm/vmscan.c          |  2 +-
> >  5 files changed, 45 insertions(+), 40 deletions(-)
> >
> > diff --git a/include/linux/swap.h b/include/linux/swap.h
> > index 3f31b6a56788..45656ca9792d 100644
> > --- a/include/linux/swap.h
> > +++ b/include/linux/swap.h
> > @@ -340,7 +340,6 @@ extern void lru_add_drain_cpu_zone(struct zone *zon=
e);
> >  extern void lru_add_drain_all(void);
> >  void folio_deactivate(struct folio *folio);
> >  void folio_mark_lazyfree(struct folio *folio);
> > -extern void swap_setup(void);
> >
> >  /* linux/mm/vmscan.c */
> >  extern unsigned long zone_reclaimable_pages(struct zone *zone);
> > diff --git a/mm/swap.c b/mm/swap.c
> > index 58e4eff698cc..b3ea30edbaad 100644
> > --- a/mm/swap.c
> > +++ b/mm/swap.c
> > @@ -43,10 +43,6 @@
> >  #define CREATE_TRACE_POINTS
> >  #include <trace/events/pagemap.h>
> >
> > -/* How many pages do we try to swap or page in/out together? As a powe=
r of 2 */
> > -int page_cluster;
> > -static const int page_cluster_max =3D 31;
> > -
> >  struct cpu_fbatches {
> >         /*
> >          * The following folio batches are grouped together because the=
y are protected
> > @@ -1176,35 +1172,3 @@ void lru_reparent_memcg(struct mem_cgroup *memcg=
, struct mem_cgroup *parent, int
> >                 lruvec_reparent_lru(child_lruvec, parent_lruvec, lru, n=
id);
> >  }
> >  #endif
> > -
> > -static const struct ctl_table swap_sysctl_table[] =3D {
> > -       {
> > -               .procname       =3D "page-cluster",
> > -               .data           =3D &page_cluster,
> > -               .maxlen         =3D sizeof(int),
> > -               .mode           =3D 0644,
> > -               .proc_handler   =3D proc_dointvec_minmax,
> > -               .extra1         =3D SYSCTL_ZERO,
> > -               .extra2         =3D (void *)&page_cluster_max,
> > -       }
> > -};
> > -
> > -/*
> > - * Perform any setup for the swap system
> > - */
> > -void __init swap_setup(void)
> > -{
> > -       unsigned long megs =3D PAGES_TO_MB(totalram_pages());
> > -
> > -       /* Use a smaller cluster for small-memory machines */
> > -       if (megs < 16)
> > -               page_cluster =3D 2;
> > -       else
> > -               page_cluster =3D 3;
> > -       /*
> > -        * Right now other parts of the system means that we
> > -        * _really_ don't want to cluster much more
> > -        */
> > -
> > -       register_sysctl_init("vm", swap_sysctl_table);
> > -}
> > diff --git a/mm/swap.h b/mm/swap.h
> > index 44ab8e1e595b..624ea8ff3d0d 100644
> > --- a/mm/swap.h
> > +++ b/mm/swap.h
> > @@ -8,8 +8,6 @@ struct mempolicy;
> >  struct swap_iocb;
> >  struct swap_memcg_table;
> >
> > -extern int page_cluster;
> > -
> >  #if defined(MAX_POSSIBLE_PHYSMEM_BITS)
> >  #define SWAP_CACHE_PFN_BITS (MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT)
> >  #elif defined(MAX_PHYSMEM_BITS)
> > @@ -79,6 +77,8 @@ enum swap_cluster_flags {
> >  };
> >
> >  #ifdef CONFIG_SWAP
> > +void swap_readahead_setup(void);
> > +
> >  #include <linux/swapops.h> /* for swp_offset */
> >  #include <linux/blk_types.h> /* for bio_end_io_t */
> >
> > @@ -336,6 +336,11 @@ static inline unsigned int folio_swap_flags(struct=
 folio *folio)
> >
> >  #else /* CONFIG_SWAP */
> >  struct swap_iocb;
> > +
> > +static inline void swap_readahead_setup(void)
> > +{
> > +}
> > +
> >  static inline struct swap_cluster_info *swap_cluster_lock(
> >         struct swap_info_struct *si, pgoff_t offset, bool irq)
> >  {
> > diff --git a/mm/swap_state.c b/mm/swap_state.c
> > index 6fd6e3415b71..a9f5b944172b 100644
> > --- a/mm/swap_state.c
> > +++ b/mm/swap_state.c
> > @@ -22,10 +22,15 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/huge_mm.h>
> >  #include <linux/shmem_fs.h>
> > +#include <linux/sysctl.h>
> >  #include "internal.h"
> >  #include "swap_table.h"
> >  #include "swap.h"
> >
> > +/* Swap readahead cluster size, as a power of 2 pages. */
> > +static int page_cluster;
> > +static const int page_cluster_max =3D 31;
> > +
> >  /*
> >   * swapper_space is a fiction, retained to simplify the path through
> >   * vmscan's shrink_folio_list.
> > @@ -985,6 +990,38 @@ struct folio *swapin_readahead(swp_entry_t entry, =
gfp_t gfp_mask,
> >         return folio;
> >  }
> >
> > +static const struct ctl_table swap_readahead_sysctl_table[] =3D {
> > +       {
> > +               .procname       =3D "page-cluster",
> > +               .data           =3D &page_cluster,
> > +               .maxlen         =3D sizeof(int),
> > +               .mode           =3D 0644,
> > +               .proc_handler   =3D proc_dointvec_minmax,
> > +               .extra1         =3D SYSCTL_ZERO,
> > +               .extra2         =3D (void *)&page_cluster_max,
> > +       }
> > +};
> > +
> > +/**
> > + * swap_readahead_setup - defaults and sysctl for swap cache readahead=
 clustering
> > + */
> > +void __init swap_readahead_setup(void)
> > +{
> > +       unsigned long megs =3D PAGES_TO_MB(totalram_pages());
> > +
> > +       /* Use a smaller cluster for small-memory machines */
> > +       if (megs < 16)
> > +               page_cluster =3D 2;
> > +       else
> > +               page_cluster =3D 3;
> > +       /*
> > +        * Right now other parts of the system means that we
> > +        * _really_ don't want to cluster much more
> > +        */
> > +
> > +       register_sysctl_init("vm", swap_readahead_sysctl_table);
> > +}
> > +
>
> Thanks, I also think they belong here.
>
> >  #ifdef CONFIG_SYSFS
> >  static ssize_t vma_ra_enabled_show(struct kobject *kobj,
> >                                      struct kobj_attribute *attr, char =
*buf)
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index f40cfe9d703b..ae710027d546 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -7646,7 +7646,7 @@ static int __init kswapd_init(void)
> >  {
> >         int nid;
> >
> > -       swap_setup();
> > +       swap_readahead_setup();
>
> There is already a subsys_initcall(swap_init); in swap_state.c so
> perhaps calling this in that init function is even cleaner. And that
> init hook runs earlier than kswapd init so totally fine I think.
>
> Reviewed-by: Kairui Song <kasong@tencent.com>

Hi Kairui,

Thanks for the review. That sounds cleaner to me as well: the readahead
default and sysctl setup should stay with swap_state.c initialization.

I'll move swap_readahead_setup() into swap_init() and send an updated
version after testing.

Best regards,
Jianyue
