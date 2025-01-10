Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6224B241
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736536079; cv=none; b=TXQOZE5V0c+HjRbl3bu/P55DQOhIoLGNBJOnhHn9IEjqBAdxlKb1F/JZhHG4jJEXHpTXNc4DaVuwr9+ceFrdIWcXctAq2n/MmN7s/kjjBW64mMQPid7CQY4y7pgs1rV+EuNFzWHVueBHIlDHb70UddL1xzUU7SCw29Qz91zqDxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736536079; c=relaxed/simple;
	bh=ZkrO2xwfolRDPaqbhvZRbSl0EuWqf5r+JED3WBi3ok0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=HX7+Oat3V4aFMTcZe22mEyzBLr0mgoCNkSDNkc/tyu5SSRozfKULvUS8O7V8NRHbmJEbpmou9gMrpsGGW40Ep6Q/idHG3SVMOf3SobLZ5epYj7O9nCvKTYj0/Ms7RnVZE+iMj/uLIq8+HJrsOZ+jsTwrZsV+bEu3ttFuQZ8vF5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZmhnN5Fu; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZmhnN5Fu"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678c9310afso22821cf.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736536076; x=1737140876; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTi2nvSv0ABbvAbGtBJHojiB4NNIn2oSG/eUDgHwzqw=;
        b=ZmhnN5FuqracjViwBn5PnKFvLxrXfn+W2aotuesUrk9xYjFhN5XCJk40U41XYujO17
         JrQz0wBxw1WOBcrCrbVRR54EFaK16PAEZWD7P1uYtNCguq9sJwPj77pqH1Ryu0ur/Za7
         Hklnws9MXVxfbiNaQQPKLFuOyrXf2sR3Ks/KjXr94xcaWLv6gOm56nwKgQWMB1d4LUy/
         D2ERb1SGbe+7p3hFehmq1E/rP6C+DItZ82Yp/IKgk7IOYsyFx/5iUgff8XsobeJzdPsp
         /n+dtabAb4R7p6eCJWmiyp5zt+qb4+aExQ+XHSGfcq8chu9IB4Bk/5OXPPv4vB5fI7a5
         /dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736536076; x=1737140876;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTi2nvSv0ABbvAbGtBJHojiB4NNIn2oSG/eUDgHwzqw=;
        b=gr5EdZYMnI7/XLEQMfeuhpzrYZgat5d1+IBTJghS8hsKFpNLEbBo90s4CxtdtCdbBX
         sq5eJQEX5P0p5TKfCt4YjUQPZoHJzP2juqQAQ/tejhHeQgM9jg502FiRkotzkuM3l/3Q
         2LnvdfP1+zvQ1XnWIK+PODUb+NhoZ/YHjqebagCnSh19g8T/s8f+1O2BJYzySL/wWZop
         9Gq3AE4ec8w7KaJknUJQ0YiHnrLITOKXE1ZMzl3bOBxNYKJTHHUuYhCGYEAMoHSYg25g
         ySvMcH/W9pftetXm7NpGauj62DRXIJhs69GPmemmq7FK5Wj4/6P2pVzi8uSeimgw6isw
         WYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfH06mQTFuGVs1GWzfNb191CUv7Bz6Ps+EyvTib65HDq2a38Wb1GgUroHaUiEoQSBF7Zev0b8Nf2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6qMcU0ObYN8tM5CeIMqquKUSzXOI+DvSQjNfgXtoCqfaUtLh
	UYFqgBzLt+ShvDZ4wu7zDQkPD89vHzSwEBTedO8pXGNH03Vecg2JJkl/D9CdCWjD9btgmHDNNYm
	HH08gQGwtROuQFENO3hpftFg9ER6mUfNH8vab
X-Gm-Gg: ASbGncvmi0fgCWW/i0TNv82s3V3hI4q7x9rZ98NW5h3j0pCP3QQa0+FBq0z+v6f6pVQ
	5rqxp0OFRKsN4HfotKb3syCuIdT1Nav89IOu5gQ==
X-Google-Smtp-Source: AGHT+IEoXAcMVmHCXCyc8rjGNXE1ti4IyklXI+uMV2SwUHXGaGWMs4W9yqmVxDUBR+OVWVJ548l1xVR/OQhXEz92QFM=
X-Received: by 2002:a05:622a:2c1:b0:460:491e:d2a2 with SMTP id
 d75a77b69052e-46c89dad5a8mr3557021cf.17.1736536076139; Fri, 10 Jan 2025
 11:07:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-16-surenb@google.com>
 <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
In-Reply-To: <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 11:07:44 -0800
X-Gm-Features: AbW1kvYAAyQ3QGj7QebBVjDM6a0dnRe16Ld1SPpTzou8WRN4-K0wMA_sYKPRcJg
Message-ID: <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com>
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 9:48=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [250108 21:31]:
> > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> > object reuse before RCU grace period is over will be detected by
> > lock_vma_under_rcu().
> > Current checks are sufficient as long as vma is detached before it is
> > freed. The only place this is not currently happening is in exit_mmap()=
.
> > Add the missing vma_mark_detached() in exit_mmap().
> > Another issue which might trick lock_vma_under_rcu() during vma reuse
> > is vm_area_dup(), which copies the entire content of the vma into a new
> > one, overriding new vma's vm_refcnt and temporarily making it appear as
> > attached. This might trick a racing lock_vma_under_rcu() to operate on
> > a reused vma if it found the vma before it got reused. To prevent this
> > situation, we should ensure that vm_refcnt stays at detached state (0)
> > when it is copied and advances to attached state only after it is added
> > into the vma tree. Introduce vma_copy() which preserves new vma's
> > vm_refcnt and use it in vm_area_dup(). Since all vmas are in detached
> > state with no current readers when they are freed, lock_vma_under_rcu()
> > will not be able to take vm_refcnt after vma got detached even if vma
> > is reused.
> > Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facilitate
> > vm_area_struct reuse and will minimize the number of call_rcu() calls.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h               |  2 -
> >  include/linux/mm_types.h         | 10 +++--
> >  include/linux/slab.h             |  6 ---
> >  kernel/fork.c                    | 72 ++++++++++++++++++++------------
> >  mm/mmap.c                        |  3 +-
> >  mm/vma.c                         | 11 ++---
> >  mm/vma.h                         |  2 +-
> >  tools/testing/vma/vma_internal.h |  7 +---
> >  8 files changed, 59 insertions(+), 54 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 1d6b1563b956..a674558e4c05 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, void *=
end_code,
> >  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
> >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
> >  void vm_area_free(struct vm_area_struct *);
> > -/* Use only if VMA has no other users */
> > -void __vm_area_free(struct vm_area_struct *vma);
> >
> >  #ifndef CONFIG_MMU
> >  extern struct rb_root nommu_region_tree;
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 2d83d79d1899..93bfcd0c1fde 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -582,6 +582,12 @@ static inline void *folio_get_private(struct folio=
 *folio)
> >
> >  typedef unsigned long vm_flags_t;
> >
> > +/*
> > + * freeptr_t represents a SLUB freelist pointer, which might be encode=
d
> > + * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabled=
.
> > + */
> > +typedef struct { unsigned long v; } freeptr_t;
> > +
> >  /*
> >   * A region containing a mapping of a non-memory backed file under NOM=
MU
> >   * conditions.  These are held in a global tree and are pinned by the =
VMAs that
> > @@ -695,9 +701,7 @@ struct vm_area_struct {
> >                       unsigned long vm_start;
> >                       unsigned long vm_end;
> >               };
> > -#ifdef CONFIG_PER_VMA_LOCK
> > -             struct rcu_head vm_rcu; /* Used for deferred freeing. */
> > -#endif
> > +             freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPESAFE_BY=
_RCU */
> >       };
> >
> >       /*
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 10a971c2bde3..681b685b6c4e 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -234,12 +234,6 @@ enum _slab_flag_bits {
> >  #define SLAB_NO_OBJ_EXT              __SLAB_FLAG_UNUSED
> >  #endif
> >
> > -/*
> > - * freeptr_t represents a SLUB freelist pointer, which might be encode=
d
> > - * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabled=
.
> > - */
> > -typedef struct { unsigned long v; } freeptr_t;
> > -
> >  /*
> >   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> >   *
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 9d9275783cf8..770b973a099c 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -449,6 +449,41 @@ struct vm_area_struct *vm_area_alloc(struct mm_str=
uct *mm)
> >       return vma;
> >  }
> >
>
> There exists a copy_vma() which copies the vma to a new area in the mm
> in rmap.  Naming this vma_copy() is confusing :)
>
> It might be better to just put this code in the vm_area_dup() or call it
> __vm_area_dup(), or __vma_dup() ?

Hmm. It's not really duplicating a vma but copying its content (no
allocation). How about __vm_area_copy() to indicate it is copying
vm_area_struct content?

>
> > +static void vma_copy(const struct vm_area_struct *src, struct vm_area_=
struct *dest)
> > +{
> > +     dest->vm_mm =3D src->vm_mm;
> > +     dest->vm_ops =3D src->vm_ops;
> > +     dest->vm_start =3D src->vm_start;
> > +     dest->vm_end =3D src->vm_end;
> > +     dest->anon_vma =3D src->anon_vma;
> > +     dest->vm_pgoff =3D src->vm_pgoff;
> > +     dest->vm_file =3D src->vm_file;
> > +     dest->vm_private_data =3D src->vm_private_data;
> > +     vm_flags_init(dest, src->vm_flags);
> > +     memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> > +            sizeof(dest->vm_page_prot));
> > +     /*
> > +      * src->shared.rb may be modified concurrently, but the clone
> > +      * will be reinitialized.
> > +      */
> > +     data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared=
)));
> > +     memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> > +            sizeof(dest->vm_userfaultfd_ctx));
> > +#ifdef CONFIG_ANON_VMA_NAME
> > +     dest->anon_name =3D src->anon_name;
> > +#endif
> > +#ifdef CONFIG_SWAP
> > +     memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> > +            sizeof(dest->swap_readahead_info));
> > +#endif
> > +#ifndef CONFIG_MMU
> > +     dest->vm_region =3D src->vm_region;
> > +#endif
> > +#ifdef CONFIG_NUMA
> > +     dest->vm_policy =3D src->vm_policy;
> > +#endif
> > +}
> > +
> >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> >  {
> >       struct vm_area_struct *new =3D kmem_cache_alloc(vm_area_cachep, G=
FP_KERNEL);
> > @@ -458,11 +493,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_=
struct *orig)
> >
> >       ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
> >       ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
> > -     /*
> > -      * orig->shared.rb may be modified concurrently, but the clone
> > -      * will be reinitialized.
> > -      */
> > -     data_race(memcpy(new, orig, sizeof(*new)));
> > +     vma_copy(orig, new);
> >       vma_lock_init(new, true);
>
> I think this suffers from a race still?
>
> That is, we can still race between vm_lock_seq =3D=3D mm_lock_seq and the
> lock acquire, where a free and reuse happens.  In the even that the
> reader is caught between the sequence and lock taking, the
> vma->vmlock_dep_map may not be replaced and it could see the old lock
> (or zero?) and things go bad:
>
> It could try to take vmlock_dep_map =3D=3D 0 in read mode.
>
> It can take the old lock, detect the refcnt is wrong and release the new
> lock.

I don't think this race can happen. Notice a call to
vma_assert_detached() inside vm_area_free(), so before vma is freed
and possibly reused, it has to be detached. vma_mark_detached()
ensures that there are no current or future readers by executing the
__vma_enter_locked() + __vma_exit_locked() sequence if vm_refcnt is
not already at 0. Once __vma_exit_locked() is done, vm_refcnt is at 0
and any new reader will be rejected on
__refcount_inc_not_zero_limited(), before even checking vm_lock_seq =3D=3D
mm_lock_seq. Even if a reader tries to sneak in between
__vma_enter_locked() and __vma_exit_locked() calls,
__refcount_inc_not_zero_limited() will reject it because
VMA_LOCK_OFFSET is set and VMA_REF_LIMIT will be violated.
IOW, when VMA is freed, it's guaranteed to be detached with no current
or future readers, therefore "race between vm_lock_seq =3D=3D mm_lock_seq
and the lock acquire, where a free and reuse happens" should not be
possible.

Did I understand your concern correctly and does my explanation make
sense to you?

>
> Thanks,
> Liam
