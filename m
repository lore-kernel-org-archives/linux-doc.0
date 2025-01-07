Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77841F4293
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269983; cv=none; b=tEEL8QJgSC+4n8TC1yu+VbztK5Ff0AlECyJ0usycbeDvPGiFkz4w6p9BIcyiqH8uv298h0C+JUz4rsCGHn0w1+PKQARzcbEpluXhjo86JwpJdil5Hd61RHGqmSAfxqMVM4qXHPitWAm0K+9qppvZiJPmwoVTjASEZfZ1EX/wRJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269983; c=relaxed/simple;
	bh=2DHUcUJ9r4vCwBW7BfEoGn4FWSQ2fJe4LrJMY8rW71U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=AUQHUxa4zY3SOSsIjaphLwp1lpSYWzWrKeT8b6wqIx9GhLdJTNNxP2OICxqx6IemMrgZf8Ul0m452RiuQf24VgdUsXwsOE5Rzkb82hWWhZZA0c8pP0cIXcheW25FYwJ2bHi6KtKVxJlS+RY9hi0LOJRCbRJ+wMAPrSkj05qZOzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qq8JDnBq; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qq8JDnBq"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467abce2ef9so293391cf.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736269981; x=1736874781; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chk6NJISFurQMFJvYF6vgkrsHvt/tFpUC1De8cMxuSQ=;
        b=Qq8JDnBqLh0fJI19NEv/sKq/dl1MWbHQKQfcw2RQdE7H3avpMhBii7P3oz5aUeMSZq
         a2jZxeZbQy/NoNqDWPgk+k1x6V/dtztwedl4veFeWBhBnB0zbQxVR2+V6oBKZKcaRw7N
         C41fbpr7sHIvmHh2pWifYAp5KezyZuy+gq0G4hWEtq27USz+zRE4y8ZC+x10mQww7mL7
         E/X3ISzgPK1mDKoYl8UxyVVIPDL6gxAjM5eTsv6GmnIQ6A0kaME3qDaUgmD8nr9HKuQb
         /H03xGN9duhBLgIOKnctRAg54VWOb6et4pUghDX1XhDTB4x7hznF5WbHheOrochsgehe
         xD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269981; x=1736874781;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chk6NJISFurQMFJvYF6vgkrsHvt/tFpUC1De8cMxuSQ=;
        b=TYjphpa/9jFJeuEE+eJ3JcUORLrt2Q7tw4XI/9mWbje7UUZO4VAgkTQpB/FNNUM7Bt
         8s8ci10xtHLWfJSvjWwpBZmWw0Z85iw0GkB/2NFXLErRILBp2oe7gYff79+dPwGpuIdJ
         uhJXL/7sHwtNXZ+K7ZD43tEx20RdJ488PozRQe1DtWY9lz1YlDumAcLqbJzhIw+R71be
         EIRdTNHgJUIYox6daZaeNZY3+0nqaA0GissgWnSNtBZo7DwIzOSbCRHUlQvrSH0glpJ4
         zW/m3kXRdXxmoGLY/Rjjs258XGAh2BDX9ffHAO1+jNJuC4at6pfHPFodziFZmFnGAW9Q
         K+cg==
X-Forwarded-Encrypted: i=1; AJvYcCXjyyNzQLXRldPAjKlxzQegNcqaMUC7AZKGA4ML2MxcJJstkUDGVtS1BHr2gxwgk3Shq42Dd9yIX1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGPDq5F/tXjuaBBDid4Q/lu2Cw7fF3aJY4wIIoFknqKRK7p0NC
	uokN7wAK84I3+xj26Guh3E355ZJ2Wu2THUE57U3VTwKYf3W86D0JygEL5gOOvqRPFX2ukY8od9n
	nO1OQ0R5JPz6sfeWueOWf4GF/aMzMLx1jJ46L
X-Gm-Gg: ASbGncuRxRab0gnr8opMM4FzGUEqEH1L+oPjsLda8Up7meW6HYKMZac0F5lBCGsmfQ/
	V6JC8y7UZKZo6BVoDTSPfqwg4X7/gGmR36F3sLUpb/PUj/0zPb2SfFlDFcaSvgGRwv4CI
X-Google-Smtp-Source: AGHT+IFXDdrNkxz81jJXTEGZAe+XA3xHXzR658pMa6NQwReUFhIVlxxq9kXoAVDHTPY5r9ItR2yLPiNNBl+6vlG8Iic=
X-Received: by 2002:a05:622a:449:b0:466:8906:159a with SMTP id
 d75a77b69052e-46b3c8280dfmr3628191cf.19.1736269980332; Tue, 07 Jan 2025
 09:13:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-5-surenb@google.com>
 <luf6pnwp4gazsoquktjkf2nniscds5g5jeeviyd4pmfqdr5ge2@fv5qimjqf4w2>
In-Reply-To: <luf6pnwp4gazsoquktjkf2nniscds5g5jeeviyd4pmfqdr5ge2@fv5qimjqf4w2>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 09:12:49 -0800
X-Gm-Features: AbW1kvbRLMdMEJMnFl6e19LgaABppU1UudlyyjOt6xw2vKr_iMO3vN3ig_loVss
Message-ID: <CAJuCfpExUkxgBUiBnH6OjuNBknnwCUH-EhTtmYP_RUamPRBn8w@mail.gmail.com>
Subject: Re: [PATCH v7 04/17] mm: modify vma_iter_store{_gfp} to indicate if
 it's storing a new vma
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 8:50=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> > vma_iter_store() functions can be used both when adding a new vma and
> > when updating an existing one. However for existing ones we do not need
> > to mark them attached as they are already marked that way. Add a parame=
ter
> > to distinguish the usage and skip vma_mark_attached() when not needed.
>
> I really don't like boolean flags - especially to such a small function.
>
> The passing of flags complicates things and is not self documenting. Can
> we make a new vma_iter_store_detach() that just calls vma_iter_store()
> then does the detach?

Sure, I'll do that. Thanks for the feedback!

>
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h | 12 ++++++++++++
> >  mm/nommu.c         |  4 ++--
> >  mm/vma.c           | 16 ++++++++--------
> >  mm/vma.h           | 13 +++++++++----
> >  4 files changed, 31 insertions(+), 14 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 081178b0eec4..c50edfedd99d 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_are=
a_struct *vma)
> >               vma_assert_write_locked(vma);
> >  }
> >
> > +static inline void vma_assert_attached(struct vm_area_struct *vma)
> > +{
> > +     VM_BUG_ON_VMA(vma->detached, vma);
> > +}
> > +
> > +static inline void vma_assert_detached(struct vm_area_struct *vma)
> > +{
> > +     VM_BUG_ON_VMA(!vma->detached, vma);
> > +}
> > +
> >  static inline void vma_mark_attached(struct vm_area_struct *vma)
> >  {
> >       vma->detached =3D false;
> > @@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_stru=
ct *vma) {}
> >  static inline void vma_start_write(struct vm_area_struct *vma) {}
> >  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> >               { mmap_assert_write_locked(vma->vm_mm); }
> > +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> > +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> >  static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> >  static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> >
> > diff --git a/mm/nommu.c b/mm/nommu.c
> > index 9cb6e99215e2..72c8c505836c 100644
> > --- a/mm/nommu.c
> > +++ b/mm/nommu.c
> > @@ -1191,7 +1191,7 @@ unsigned long do_mmap(struct file *file,
> >       setup_vma_to_mm(vma, current->mm);
> >       current->mm->map_count++;
> >       /* add the VMA to the tree */
> > -     vma_iter_store(&vmi, vma);
> > +     vma_iter_store(&vmi, vma, true);
> >
> >       /* we flush the region from the icache only when the first execut=
able
> >        * mapping of it is made  */
> > @@ -1356,7 +1356,7 @@ static int split_vma(struct vma_iterator *vmi, st=
ruct vm_area_struct *vma,
> >
> >       setup_vma_to_mm(vma, mm);
> >       setup_vma_to_mm(new, mm);
> > -     vma_iter_store(vmi, new);
> > +     vma_iter_store(vmi, new, true);
> >       mm->map_count++;
> >       return 0;
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index 476146c25283..ce113dd8c471 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -306,7 +306,7 @@ static void vma_complete(struct vma_prepare *vp, st=
ruct vma_iterator *vmi,
> >                * us to insert it before dropping the locks
> >                * (it may either follow vma or precede it).
> >                */
> > -             vma_iter_store(vmi, vp->insert);
> > +             vma_iter_store(vmi, vp->insert, true);
> >               mm->map_count++;
> >       }
> >
> > @@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *=
vmg,
> >       vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
> >
> >       if (expanded)
> > -             vma_iter_store(vmg->vmi, vmg->vma);
> > +             vma_iter_store(vmg->vmi, vmg->vma, false);
> >
> >       if (adj_start) {
> >               adjust->vm_start +=3D adj_start;
> >               adjust->vm_pgoff +=3D PHYS_PFN(adj_start);
> >               if (adj_start < 0) {
> >                       WARN_ON(expanded);
> > -                     vma_iter_store(vmg->vmi, adjust);
> > +                     vma_iter_store(vmg->vmi, adjust, false);
> >               }
> >       }
> >
> > @@ -1689,7 +1689,7 @@ int vma_link(struct mm_struct *mm, struct vm_area=
_struct *vma)
> >               return -ENOMEM;
> >
> >       vma_start_write(vma);
> > -     vma_iter_store(&vmi, vma);
> > +     vma_iter_store(&vmi, vma, true);
> >       vma_link_file(vma);
> >       mm->map_count++;
> >       validate_mm(mm);
> > @@ -2368,7 +2368,7 @@ static int __mmap_new_vma(struct mmap_state *map,=
 struct vm_area_struct **vmap)
> >
> >       /* Lock the VMA since it is modified after insertion into VMA tre=
e */
> >       vma_start_write(vma);
> > -     vma_iter_store(vmi, vma);
> > +     vma_iter_store(vmi, vma, true);
> >       map->mm->map_count++;
> >       vma_link_file(vma);
> >
> > @@ -2542,7 +2542,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct=
 vm_area_struct *vma,
> >       vm_flags_init(vma, flags);
> >       vma->vm_page_prot =3D vm_get_page_prot(flags);
> >       vma_start_write(vma);
> > -     if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL))
> > +     if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL, true))
> >               goto mas_store_fail;
> >
> >       mm->map_count++;
> > @@ -2785,7 +2785,7 @@ int expand_upwards(struct vm_area_struct *vma, un=
signed long address)
> >                               anon_vma_interval_tree_pre_update_vma(vma=
);
> >                               vma->vm_end =3D address;
> >                               /* Overwrite old entry in mtree. */
> > -                             vma_iter_store(&vmi, vma);
> > +                             vma_iter_store(&vmi, vma, false);
> >                               anon_vma_interval_tree_post_update_vma(vm=
a);
> >
> >                               perf_event_mmap(vma);
> > @@ -2865,7 +2865,7 @@ int expand_downwards(struct vm_area_struct *vma, =
unsigned long address)
> >                               vma->vm_start =3D address;
> >                               vma->vm_pgoff -=3D grow;
> >                               /* Overwrite old entry in mtree. */
> > -                             vma_iter_store(&vmi, vma);
> > +                             vma_iter_store(&vmi, vma, false);
> >                               anon_vma_interval_tree_post_update_vma(vm=
a);
> >
> >                               perf_event_mmap(vma);
> > diff --git a/mm/vma.h b/mm/vma.h
> > index 24636a2b0acf..18c9e49b1eae 100644
> > --- a/mm/vma.h
> > +++ b/mm/vma.h
> > @@ -145,7 +145,7 @@ __must_check int vma_shrink(struct vma_iterator *vm=
i,
> >               unsigned long start, unsigned long end, pgoff_t pgoff);
> >
> >  static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
> > -                     struct vm_area_struct *vma, gfp_t gfp)
> > +                     struct vm_area_struct *vma, gfp_t gfp, bool new_v=
ma)
> >
> >  {
> >       if (vmi->mas.status !=3D ma_start &&
> > @@ -157,7 +157,10 @@ static inline int vma_iter_store_gfp(struct vma_it=
erator *vmi,
> >       if (unlikely(mas_is_err(&vmi->mas)))
> >               return -ENOMEM;
> >
> > -     vma_mark_attached(vma);
> > +     if (new_vma)
> > +             vma_mark_attached(vma);
> > +     vma_assert_attached(vma);
> > +
> >       return 0;
> >  }
> >
> > @@ -366,7 +369,7 @@ static inline struct vm_area_struct *vma_iter_load(=
struct vma_iterator *vmi)
> >
> >  /* Store a VMA with preallocated memory */
> >  static inline void vma_iter_store(struct vma_iterator *vmi,
> > -                               struct vm_area_struct *vma)
> > +                               struct vm_area_struct *vma, bool new_vm=
a)
> >  {
> >
> >  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
> > @@ -390,7 +393,9 @@ static inline void vma_iter_store(struct vma_iterat=
or *vmi,
> >
> >       __mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
> >       mas_store_prealloc(&vmi->mas, vma);
> > -     vma_mark_attached(vma);
> > +     if (new_vma)
> > +             vma_mark_attached(vma);
> > +     vma_assert_attached(vma);
> >  }
> >
> >  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
