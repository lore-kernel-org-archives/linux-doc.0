Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA03E49C1
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078501; cv=pass; b=XeOsSCaSKx/N0E2IwCKcgpG+0z01HIk9ZtUzb82DyP7Ud3lyHU2qlIsy+FzYQPGtcyNvSJ2fSbNsYiNzg80VT8r0lvD5TihYpd6GhZeHJhJJ223+Zaa2kZllyN+DJ+ZBdrLW68S4qnMTYBVOyhUtq4SDr9t9Dzl2qGnA06DO4X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078501; c=relaxed/simple;
	bh=M+nQKGWiSiXZf9Z0hBM+vKqHXKxgftoOF/UpihBrVDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aB8WNPkfim7QIhWDzaDNnIpEo33d0BiuR20ZTt9SnOc+HpXgwKu7dkYfN4YVI7S2a66v51aE2pNf7Xltj6Lml3xRTooJj8CcfI1jyW6tPUzuyOCkQxCpD9f+inmEyYaaKySvG1Uf/BHnyp1pYG5J7/1n0S4K+QCzKUbs0Lx5iTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXMgK3Oa; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXMgK3Oa"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so102848f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 11:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787078498; cv=none;
        d=google.com; s=arc-20260327;
        b=RajusebJsXMnLK76qW7O1zZcaFNA6OCNC1sEPZ0v+tMwyXL/t2lUKN1GBl8+mq9UXB
         yxJq4J2nV4bMMkljmufttHXcsnvaIYVINPy+nnCse3fN9awaBAeIyxWhjkrqd2tMq7MR
         //cYwnHgBDYLShO7WTCesUk7SC9cz6qgpfBWYc7iDI2og/HaYpJvtf8IJPja/KmQDvJ/
         iMueC+ccY1CcBfUMIR9m6Qq1FHQuvuw5jgj707u2CxnIhSbFYs4G5cjsX08krlAGfahn
         QJB4ACKIUzfEEXtMij5S79qkLF0P056viG9GOMCN6EYJDActuAvjEXP7uxYpTi4gC/VM
         h3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6pyYJI0TNCEOKN/gsnOgTV5eL5yphEPrCvzUhCQngc4=;
        fh=6cnWf0mZA0HrHZORYRvrZ9xR45Cw9j0HxUqrGe2c+KE=;
        b=iJJJE3Uwllg08Xe4U5oTx6pNvFXpvWU7NUn0HDPQNm1o1lDx1TJI6PZLNh/pzGUomW
         q9tpjU2G6/Tn/p2Zgt+7cP9OWvswxj3h92PezpARQ08j5iYlpUTr2el7+cTtaz9WPgFb
         yevTy/VuFUha8A46mStkjE2EUrMeV6a23otaNfdjlCPJgZx9WgjtskvmLLlQI4yRKcgs
         IWYjvGSKfWpdKCSUvTOqJCYplt1zT1OozhSpZ8X3GzwBM1yQHwaOb4g28wSz0pgd98uB
         SudYzoYPKJNiVdh/WBBrwU4diGjPaHK+jEWLaOmI3aiSBy9v0epU9jYYiUS43Zaq7pZF
         SJ4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787078498; x=1787683298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6pyYJI0TNCEOKN/gsnOgTV5eL5yphEPrCvzUhCQngc4=;
        b=XXMgK3OaP5UAN9ZYfGO+hgdvW9zAhzhnzn9/KhGH81a5xHV63t78z/mlRBsbqrAB/8
         NFG6FkqRTKWlkRYkc+g0L4oKCo5GQ/PUG3F6ytvMZJJRONI8qIndSOQHN1lRCpQn3zlB
         YY7zqjPo9iXUkTJr+ioaXUsgXA6H1Ld6o+dWT+Y01MtClPli4Nu3IRsg4cVbSFYV472z
         +wwdhi/Car0d9JcmXsdYRVx9vAN6wXOUKVAaS9OCOOxsN/Ot6Tr1kt/PtGvsMtjNhHCH
         8yf6k9dmZO5GJygDK3uewXsfYWhNJO7wgwN5w2cS1yWV+zyMRRTFb3Iu0E2Fw2+4UiS9
         gQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787078498; x=1787683298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pyYJI0TNCEOKN/gsnOgTV5eL5yphEPrCvzUhCQngc4=;
        b=D9ZMqS8YN1uxtlQ1ujmVixaBP40AJ//RSHRPMeH4QYPA2Ui0OFThhSlG7STvkgEYWY
         tKahhY49zlx9RctjZl6dZZVLtrJf4LGfsCm1XVOakJ2RHr6FRwIBQb/fwbovNYHoG6WE
         N3pzbPYZypJoJZweK1lv66N52Wdv5Y0x7HT4/Tra97bV15Wb0UvXHW7pbMphf/tiRCZh
         VdMEH7zUEQrFb11hqldqx9gVrGn1cFaDFMtUmWZvckeqIiR9Iz3q6WjckChv2Fy61NxT
         KsS/7Dg8PrW1WrnX0auStU3iGDjJfULO9jSEVP/InlDJHZqEYJNUcAe9tsmpMypPxfCz
         +4Ng==
X-Forwarded-Encrypted: i=1; AHgh+RodsR5xRgaHTwTwzwxFf6Vhro02OUPWtbob/pY0BNr3Ar2Jf0CocbLxGEszKg+B2aoAEPcIATiPqRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyridY09kgtp/lxScMz3tHhMJgF0rDO+JkyJium2Ox0ti6Omwhy
	ZWr7MAuiIQudTzUuyacrVMkmhEV77UVTZYu0XDEr+F+71PUZRB0qzu34ndoqQWaqhHAkIRvBj9P
	Smp69FRAppaBRARNlOdKFzSLZxlvdu0w=
X-Gm-Gg: AR+sD12X70vBmGkzQLqIA0AiA5z9ViFY3rq4d1DrP9ksqSC0XGPjsIjMdZEEgbDUU0o
	HJZiA0Vwq8qfOto+vwFt5TWEYiL37yH4Q1ybljZglKDem1/c1lhSTwsILLLrLeyxsTN0VTiTSz6
	L0KmGyGr6IMRi1nsAzREUZJUmr/SN/DyHpqOasaOClTpR7JQeeBVnLcZvtfpWmTbZfQ9bDhYuE5
	ft1MENACS+57uumXMtUBOOWdDyKjCuiCYzzNifDKChs1MksLDE7+E2xCb/wMCl/lZ1DGIG1EhE5
	a+UgcHUECOStgCmjyWD2IVYtgVTMcfNCfP/lmtlk+052A5Kg8uD3NNjn8Osw/8Siejf8fm1NjLb
	z
X-Received: by 2002:a5d:5d86:0:b0:481:5f3c:39d4 with SMTP id
 ffacd0b85a97d-482b07d03e4mr120191f8f.1.1787078497580; Tue, 18 Aug 2026
 11:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806184254.3790858-1-nphamcs@gmail.com> <20260806184254.3790858-2-nphamcs@gmail.com>
 <anX-ga41DMNWF6-2@cmpxchg.org>
In-Reply-To: <anX-ga41DMNWF6-2@cmpxchg.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 18 Aug 2026 11:41:25 -0700
X-Gm-Features: AcwNN1VHimYofVoIsN8UQymuxDsdfQrRmhj9S6ClyvLCQWRkK5fYio35kYdGPrc
Message-ID: <CAKEwX=MmqyWdqfrp8kxeuucNFhU2e6Hk2TdANUGhNFHhvtSPwg@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] mm, swap: add virtual swap device infrastructure
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 8:49=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org>=
 wrote:

Hi Johannes,

My apologies for the delayed response. I saw and read your email, but
I wanted to stew on it, code things out, and stare at things before
responding.

I think most of our suggestions here make sense. I coded most of them
out already, and I'm stress testing them - will report back if there
are surprises.

>
> Hello Nhat,
>
> This looks pretty clean to me overall. Nice. A few comments inline:
>
> On Thu, Aug 06, 2026 at 11:42:44AM -0700, Nhat Pham wrote:
> > @@ -276,8 +277,21 @@ struct swap_info_struct {
> >       struct list_head discard_clusters; /* discard clusters list */
> >       struct plist_node avail_list;   /* entry in swap_avail_head */
> >       const struct swap_ops *ops;
> > +     struct xarray cluster_info_pool; /* Xarray for vswap dynamic clus=
ter info */
> >  };
> >
> > +#ifdef CONFIG_VSWAP
> > +static inline bool swap_is_vswap(struct swap_info_struct *si)
> > +{
> > +     return si->flags & SWP_VSWAP;
> > +}
> > +#else
>
> I think what could make sense is have
>
> - CONFIG_VSWAP
> - CONFIG_VSWAP_DEFAULT_ENABLED
> - a boot flag that's =3D CONFIG_VSWAP_DEFAULT_ENABLED
>
> Then you can use jump labels to cut runtime overhead to 0 if it isn't
> enabled at boot.
>
> This way distributions can ship it with no overhead out of the box,
> while allowing users to opt in for early testing.
>
> IMO this is more valuable than a runtime toggle.
>
> It should be part of this patch if you add it.

I've been thinking about this and your other suggestions regarding
removing CONFIG_VSWAP. I've coded them out - it does indeed look
cleaner :)

Let me test things first to make sure I did not introduce some weird
bugs, but to recap:

1. CONFIG_VSWAP gone (along with most of the !CONFIG_VSWAP stubs,
saving 100 LoCs or so).

2. Runtime param gone, replaced by a boot param.

3. CONFIG_VSWAP_DEFAULT_ENABLED only decides the default value of the
boot param (still gated by 64bit config).

4. If we detect that the system is 32 bit, we ignore bootparam
selection by users (with a small warn).

If the boot param is false (either because of user selection, the
build config, or because the system is 32 bit), we don't allocate the
vswap device, and bypass all vswap code paths. There should be
negligible overhead here.

>
> > +static inline bool swap_is_vswap(struct swap_info_struct *si)
> > +{
> > +     return false;
> > +}
> > +#endif
> > +
> >  static inline swp_entry_t page_swap_entry(struct page *page)
> >  {
> >       struct folio *folio =3D page_folio(page);
> > @@ -402,6 +416,8 @@ void swap_free_hibernation_slot(swp_entry_t entry);
> >
> >  static inline void put_swap_device(struct swap_info_struct *si)
> >  {
> > +     if (swap_is_vswap(si))
> > +             return;
> >       percpu_ref_put(&si->users);
> >  }
> >
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 331daf7fcfab..32d38b552845 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -19,6 +19,16 @@ menuconfig SWAP
> >         used to provide more virtual memory than the actual RAM present
> >         in your computer.  If unsure say Y.
> >
> > +config VSWAP
> > +     bool "Virtual swap device"
> > +     depends on SWAP && 64BIT
> > +     help
> > +       Adds a virtual swap layer that decouples swap entries in page
> > +       tables from physical backing storage. Swap entries are allocate=
d
> > +       from a virtual swap device and can be backed by zswap, a physic=
al
> > +       swapfile, or kept in memory - with the backing changeable at
> > +       runtime without invalidating page table entries.
>
> IMO this is difficult for a user to decide.
>
> If we want to make this as a config, then IMO the help text should be
> about not requiring a swapfile to use zswap, zerofill pages etc.
>
> From where I'm standing, though, this code is no longer a separate
> vswap.c feature like it used to be. It's pretty integrated into the
> swapcode, and it looks like a good chunk of the core datastructures
> aren't conditional either.
>
> At that point, the usefulness of the config option is limited. If you
> go with the jump label and there is no runtime overhead, it might make
> sense to just keep the option on what the JL should default to.
>
> > @@ -143,9 +150,19 @@ static inline struct swap_info_struct *__swap_entr=
y_to_info(swp_entry_t entry)
> >  static inline struct swap_cluster_info *__swap_offset_to_cluster(
> >               struct swap_info_struct *si, pgoff_t offset)
> >  {
> > +     unsigned int cluster_idx =3D offset / SWAPFILE_CLUSTER;
> > +
> >       VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swa=
poff */
> >       VM_WARN_ON_ONCE(offset >=3D roundup(si->max, SWAPFILE_CLUSTER));
> > -     return &si->cluster_info[offset / SWAPFILE_CLUSTER];
> > +
> > +     if (swap_is_vswap(si)) {
> > +             struct swap_cluster_info_dynamic *ci_dyn;
> > +
> > +             ci_dyn =3D xa_load(&si->cluster_info_pool, cluster_idx);
> > +             return ci_dyn ? &ci_dyn->ci : NULL;
> > +     }
> > +
> > +     return &si->cluster_info[cluster_idx];
> >  }
>
> This now requires rcu. IMO a kdoc explaining that would be good.

Good point yeah.

>
> > @@ -733,6 +765,11 @@ static void free_cluster(struct swap_info_struct *=
si, struct swap_cluster_info *
> >               return;
> >       }
> >
> > +     if (swap_is_vswap(si)) {
> > +             vswap_free_cluster(si, ci);
> > +             return;
> > +     }
> > +
> >       __free_cluster(si, ci);
>
> Should this be part of __free_cluster() instead?
>
> - swap_cluster_assert_empty() seems useful.
> - move_cluster() handles the list linkage and could do the list_del().
> - swap_cluster_free_table() is the same.
>
> The other caller is the discard path. That one isn't relevant, but it
> shouldn't hurt. The layering would still be a bit cleaner this way.

I think this should work.

>
> > @@ -835,14 +872,21 @@ static int swap_cluster_setup_bad_slot(struct swa=
p_info_struct *si,
> >   * stolen by a lower order). @usable will be set to false if that happ=
ens.
> >   */
> >  static bool cluster_reclaim_range(struct swap_info_struct *si,
> > -                               struct swap_cluster_info *ci,
> > +                               struct swap_cluster_info **pcip,
> >                                 unsigned long start, unsigned int order=
,
> >                                 bool *usable)
> >  {
> > +     struct swap_cluster_info *ci =3D *pcip;
> >       unsigned int nr_pages =3D 1 << order;
> >       unsigned long offset =3D start, end =3D start + nr_pages;
> >       unsigned long swp_tb;
> >
> > +     /*
> > +      * Take RCU read lock before releasing the cluster lock to keep c=
i
> > +      * alive - for vswap dynamic clusters, ci is freed via kfree_rcu
> > +      * and the grace period could otherwise elapse in the window.
> > +      */
> > +     rcu_read_lock();
> >       spin_unlock(&ci->lock);
>
> Since you replace the naked spin_lock() below with
> swap_cluster_lock(), change this to swap_cluster_unlock() as well?

Good point in the renaming, yeah.

On a related note, I'm thinking of just removing this piece of code in
cluster_reclaim_range(). We have no signal to trigger
cluster_reclaim_range() (i.e swap-cache-only reclamation) for vswap
clusters, and vswap (similar to swap-sync-io devices such as zram)
already try to free swap slots (and swap cache) when the last PTE
reference of the swap entry is dropped. I don't think this code path
is triggered at all in my benchmarks.

Let's keep cluster_reclaim_range() for phys swap device only.


>
> >       do {
> >               swp_tb =3D swap_table_get(ci, offset % SWAPFILE_CLUSTER);
> > @@ -852,7 +896,15 @@ static bool cluster_reclaim_range(struct swap_info=
_struct *si,
> >                       if (__try_to_reclaim_swap(si, offset, TTRS_ANYWAY=
) < 0)
> >                               break;
> >       } while (++offset < end);
> > -     spin_lock(&ci->lock);
> > +     rcu_read_unlock();
> > +
> > +     /* Re-lookup: dynamic cluster may have been freed while lock was =
dropped */
> > +     ci =3D swap_cluster_lock(si, start);
> > +     *pcip =3D ci;
> > +     if (!ci) {
> > +             *usable =3D false;
> > +             return false;
> > +     }
> >
> >       /*
> >        * We just dropped ci->lock so cluster could be used by another
>
> > @@ -1146,6 +1239,12 @@ static unsigned long cluster_alloc_swap_entry(st=
ruct swap_info_struct *si,
> >                       goto done;
> >       }
> >
> > +     if (swap_is_vswap(si)) {
> > +             found =3D alloc_swap_scan_dynamic(si, folio);
> > +             if (found)
> > +                     goto done;
> > +     }
>
> The name and the composability look off to me.
>
> Can you make this a pure allocation function - vswap_alloc_cluster()
> or something - that links it to &si->free_clusters, then jump back and
> use the existing alloc_swap_scan_list() sites?

That name was vestigial from Kairui's RFC, but yeah I agree
vswap_alloc_cluster sounds better.

Regarding the linkage of the newly allocated cluster to the free list
- I'm a bit hesitant to introduce new surface for these clusters,
mostly because I'm afraid I might mess up the handling of these
clusters (when I unlink them from the free list), but I can give it a
shot.

>
> There is a new_cluster: label upstream you could use for the retry.
>
> > +
> >       if (!(si->flags & SWP_PAGE_DISCARD)) {
> >               found =3D alloc_swap_scan_list(si, &si->free_clusters, fo=
lio, false);
> >               if (found)
> > @@ -1264,6 +1363,13 @@ static void add_to_avail_list(struct swap_info_s=
truct *si, bool swapon)
> >                       goto skip;
> >       }
> >
> > +     /*
> > +      * Keep vswap off the avail list - it is not allocated from by
> > +      * the physical swap allocator (swap_alloc_fast/slow).
> > +      */
> > +     if (swap_is_vswap(si))
> > +             goto skip;
>
> This is describing what the code does, followed by a why not.
>
> Describe the why: Vswap space is only allocated through [...], not [...]
>
> > @@ -3528,10 +3668,43 @@ static int setup_swap_clusters_info(struct swap=
_info_struct *si,
> >                                   unsigned long maxpages)
> >  {
> >       unsigned long nr_clusters =3D DIV_ROUND_UP(maxpages, SWAPFILE_CLU=
STER);
> > -     struct swap_cluster_info *cluster_info;
> > +     struct swap_cluster_info *cluster_info =3D NULL;
> > +     struct swap_cluster_info_dynamic *ci_dyn;
> >       int err =3D -ENOMEM;
> >       unsigned long i;
> >
> > +     /* For SWP_VSWAP files, initialize Xarray pool instead of static =
array */
> > +     if (swap_is_vswap(si)) {
> > +             /*
> > +              * Pre-allocate cluster 0 and mark slot 0 (header page)
> > +              * as bad so the allocator never hands out page offset 0.
> > +              */
> > +             ci_dyn =3D kzalloc_obj(*ci_dyn, GFP_KERNEL);
> > +             if (!ci_dyn)
> > +                     goto err;
> > +             spin_lock_init(&ci_dyn->ci.lock);
> > +             INIT_LIST_HEAD(&ci_dyn->ci.list);
> > +
> > +             nr_clusters =3D 0;
>
> But it's one, not zero. And only the first slot is bad. Why is the
> rest not usable and the cluster on the nonfull_clusters list?
>
> I think you can make the integration a bit more organic in general:
>
> Don't do the DIV_ROUND_UP per default only to overwrite it here again
> e.g.
>
> If you come out of this branch with cluster_info =3D=3D &ci_dyn->ci, you
> should be able to reuse the existing swap_cluster_setup_bad_slot(0).
>
> swap_header && i < swap_header->info.nr_badpages should skip that loop
> as well.
>
> Your maxpages is SWAPFILE_CLUSTER aligned, so that
>
>         for (i =3D maxpages; i < round_up(maxpages, SWAPFILE_CLUSTER); i+=
+) {
>
> loop is skipped as well.
>
> > +             xa_init_flags(&si->cluster_info_pool, XA_FLAGS_ALLOC);
> > +             err =3D xa_insert(&si->cluster_info_pool, 0, ci_dyn, GFP_=
KERNEL);
> > +             if (err) {
> > +                     kfree(ci_dyn);
> > +                     goto err;
> > +             }
> > +
> > +             err =3D swap_cluster_setup_bad_slot(si, &ci_dyn->ci, 0, f=
alse);
> > +             if (err) {
> > +                     xa_erase(&si->cluster_info_pool, 0);
> > +                     swap_cluster_free_table(&ci_dyn->ci);
> > +                     kfree(ci_dyn);
>
> IMO it would be nicer to make this part of free_swap_cluster_info()
> instead of duplicating it.
>
> > +                     xa_destroy(&si->cluster_info_pool);
>
> That one probably doesn't matter. If these allocations fail at boot,
> the system is in trouble.
>
> > +                     goto err;
> > +             }
> > +
> > +             goto setup_cluster_info;
> > +     }
> > +
> >       cluster_info =3D kvzalloc_objs(*cluster_info, nr_clusters);
> >       if (!cluster_info)
> >               goto err;
> > @@ -3556,6 +3729,10 @@ static int setup_swap_clusters_info(struct swap_=
info_struct *si,
> >       err =3D swap_cluster_setup_bad_slot(si, cluster_info, 0, false);
> >       if (err)
> >               goto err;
> > +
> > +     if (!swap_header)
> > +             goto setup_cluster_info;
>
> Is this reachable?
>
> > @@ -3949,3 +4127,51 @@ static int __init swapfile_init(void)
> >       return 0;
> >  }
> >  subsys_initcall(swapfile_init);
> > +
> > +#ifdef CONFIG_VSWAP
> > +struct swap_info_struct *vswap_si;
> > +
> > +/* vswap does no IO on its own. */
> > +static const struct swap_ops vswap_ops =3D { };
> > +
> > +static int __init vswap_init(void)
> > +{
> > +     struct swap_info_struct *si;
> > +     unsigned long maxpages;
> > +     int err;
> > +
> > +     si =3D alloc_swap_info();
> > +     if (IS_ERR(si))
> > +             return PTR_ERR(si);
> > +
> > +     maxpages =3D min(swapfile_maximum_size,
> > +                    ALIGN_DOWN((unsigned long)UINT_MAX, SWAPFILE_CLUST=
ER));
> > +     si->flags |=3D SWP_VSWAP | SWP_SOLIDSTATE | SWP_WRITEOK;
>
> Please add a comment on the flag choices besides SWP_VSWAP.

Will do yeah. I tend to forget them myself too :) SWP_SOLIDSTATE is
mostly to opt-in to the cluster-based allocaiton algo. SWP_WRITEOK is
checked in a couple of places to allow allocation.
