Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA012063FB
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736541643; cv=none; b=ZxFss25rkoOluVReovKv7/wmG0DTuModquPNPc5yAxzjSpIVnSnuupDNjI2ilEtW6UE1X40tg2TBidqy2JwypNXZVh1QtrDqJlRJd2iQaNCWzqGD+QtjccKWhUvG1bKRNgw6A1Yx7cUmyH0pEslP5ZEwKD9aVQT7+b2I/E641yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736541643; c=relaxed/simple;
	bh=HzKek7BUBaOmcCcIj56nhsEFR/J001+fplnKbOKtDCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=d0ogfu5J/LzDgVIomW9rK89rm4r8q6S0isV4/xRQUCRXqeNzh9KF+oP3IoYCKdrtCDrD2PxVG1FmkwlWkrIA80QxHJkA4zeWOIPmH4RMRVvxxL8oA3lUYr4PUsFqqdjsHfgD03JHgL13T0MmeJWUYdNd2TZNZQ1VVNg7SLIVP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HbNHJncw; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HbNHJncw"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679b5c66d0so44871cf.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 12:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736541640; x=1737146440; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0j9q3EvSlNOzUk56M/7wY4HxaZ19rkuvixH5fQJVD9c=;
        b=HbNHJncwbOzlYoXf4ougzYZR9Dm5LuqLMJuN1WGTVnTQAShBVd5A+jPtjCcNq8QeVM
         PXSBiNChI+f39R2opnjtGfeIvJNQvH4/jJpYOXqqAMaK5ujy/+zRSS5kDEiJRBNPfZHx
         rmoYW9hSQPArDprDIrnoy8qM+2qlPwKxDz8F5LJjWxozF5BVpQgzHgMUPKmvQYUjwR5E
         RLlZBMYN0jvmRecEC7L784uRrhcozYBaKNnaScfM5Y8EUDvOlO1zhZ0q1aOrqw2Ekenp
         x5V9J3texjSS40Lnm9JpTGPA/ka6T0AV9u1s70eT+kW1sBYpKvV92zDobEstet+jWIqg
         O17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736541640; x=1737146440;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0j9q3EvSlNOzUk56M/7wY4HxaZ19rkuvixH5fQJVD9c=;
        b=G+lG+YljTGkn9fPuauN3TOK53NKDKeBaVofsHNokHwy3uq15m8qCAm/k0fv0dKr6tE
         llBg552WybTSsEOZ76Xkvwk4DANICfpApZtTu4wnFp5ystaVO6OwxOgJhh/trTe1Fnmq
         v9hezN5SjqcExtJYux/WEyXbuyLqOKGAndWanIgNuwBSXKMQ5grU8oGmYd/lj+uQmX1g
         mr+i/cUEbxBSKARywOZaBS0rbLi72JBthmkSKoXju2WE9E8OQKTfiYLrjM5gt9Q1UxcD
         E98rjvMO1qohGWl9LYrq8/knXTlnlTQobWzAMfa8s16TAFmM34wPXuy+B8j0waxZ89WO
         p6pg==
X-Forwarded-Encrypted: i=1; AJvYcCX+TVilYOf5NdIb2mbtFkkoFDvjyTNptBUbMIdj2Ifhw0tmKtukqjbK8oS+rANT5MfppJ6BQN568YI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+BQfPrjc2NSUvSdaAgIremXf54AM5PGEQ6EY/m0mY9GlkwRz
	Rtc0JEvyeJFiUqZlRoHLwNzcQzWcw0b4qbdvEt3iTqQW2Ifw768Ls3torLAQ+h1kb/G7wjMjk4k
	jDBIeYddrZlBBEUtkjy8MaEqstGT8hT/N0T1c
X-Gm-Gg: ASbGnct4rsRFOxLrBvizx//wdw/cW+3GTdQEu2Eiu14L0Uum0UnrDpQPx+ddOylOCZF
	RAv8d1YszxNUIhced0Gj7/Vs9CUiwnwEro1Lixw==
X-Google-Smtp-Source: AGHT+IF1VotsgFTkcaAiLjuJ1NIcP7LQ3ZQW+HyxGse1VwxA+L42yFvK6EoIG27eUCJK7tlj4JMwft3vGkNDe6vbhVI=
X-Received: by 2002:a05:622a:201:b0:466:975f:b219 with SMTP id
 d75a77b69052e-46c87e0cfc5mr4876031cf.8.1736541639926; Fri, 10 Jan 2025
 12:40:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-16-surenb@google.com>
 <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
 <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com> <6vdkyipj4v7kmgra7huvebbkimz2t63tx6rkbjxbavaccmlbmb@udqijfgkbgfv>
In-Reply-To: <6vdkyipj4v7kmgra7huvebbkimz2t63tx6rkbjxbavaccmlbmb@udqijfgkbgfv>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 12:40:28 -0800
X-Gm-Features: AbW1kvYVW7DKRtDDuKyuASICTgxzK5316_TEZ1YUaQPs3g3epPpRyIweLIwDWcE
Message-ID: <CAJuCfpGyraPAFpxoJ-ZRsJf9pWe3jno4_VjcbxHPthwLjc9DZw@mail.gmail.com>
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

On Fri, Jan 10, 2025 at 11:51=E2=80=AFAM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [250110 14:08]:
> > On Fri, Jan 10, 2025 at 9:48=E2=80=AFAM Liam R. Howlett <Liam.Howlett@o=
racle.com> wrote:
> > >
> > > * Suren Baghdasaryan <surenb@google.com> [250108 21:31]:
> > > > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> > > > object reuse before RCU grace period is over will be detected by
> > > > lock_vma_under_rcu().
> > > > Current checks are sufficient as long as vma is detached before it =
is
> > > > freed. The only place this is not currently happening is in exit_mm=
ap().
> > > > Add the missing vma_mark_detached() in exit_mmap().
> > > > Another issue which might trick lock_vma_under_rcu() during vma reu=
se
> > > > is vm_area_dup(), which copies the entire content of the vma into a=
 new
> > > > one, overriding new vma's vm_refcnt and temporarily making it appea=
r as
> > > > attached. This might trick a racing lock_vma_under_rcu() to operate=
 on
> > > > a reused vma if it found the vma before it got reused. To prevent t=
his
> > > > situation, we should ensure that vm_refcnt stays at detached state =
(0)
> > > > when it is copied and advances to attached state only after it is a=
dded
> > > > into the vma tree. Introduce vma_copy() which preserves new vma's
> > > > vm_refcnt and use it in vm_area_dup(). Since all vmas are in detach=
ed
> > > > state with no current readers when they are freed, lock_vma_under_r=
cu()
> > > > will not be able to take vm_refcnt after vma got detached even if v=
ma
> > > > is reused.
> > > > Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facili=
tate
> > > > vm_area_struct reuse and will minimize the number of call_rcu() cal=
ls.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  include/linux/mm.h               |  2 -
> > > >  include/linux/mm_types.h         | 10 +++--
> > > >  include/linux/slab.h             |  6 ---
> > > >  kernel/fork.c                    | 72 ++++++++++++++++++++--------=
----
> > > >  mm/mmap.c                        |  3 +-
> > > >  mm/vma.c                         | 11 ++---
> > > >  mm/vma.h                         |  2 +-
> > > >  tools/testing/vma/vma_internal.h |  7 +---
> > > >  8 files changed, 59 insertions(+), 54 deletions(-)
> > > >
> > > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > > index 1d6b1563b956..a674558e4c05 100644
> > > > --- a/include/linux/mm.h
> > > > +++ b/include/linux/mm.h
> > > > @@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, vo=
id *end_code,
> > > >  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
> > > >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
> > > >  void vm_area_free(struct vm_area_struct *);
> > > > -/* Use only if VMA has no other users */
> > > > -void __vm_area_free(struct vm_area_struct *vma);
> > > >
> > > >  #ifndef CONFIG_MMU
> > > >  extern struct rb_root nommu_region_tree;
> > > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > > index 2d83d79d1899..93bfcd0c1fde 100644
> > > > --- a/include/linux/mm_types.h
> > > > +++ b/include/linux/mm_types.h
> > > > @@ -582,6 +582,12 @@ static inline void *folio_get_private(struct f=
olio *folio)
> > > >
> > > >  typedef unsigned long vm_flags_t;
> > > >
> > > > +/*
> > > > + * freeptr_t represents a SLUB freelist pointer, which might be en=
coded
> > > > + * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is ena=
bled.
> > > > + */
> > > > +typedef struct { unsigned long v; } freeptr_t;
> > > > +
> > > >  /*
> > > >   * A region containing a mapping of a non-memory backed file under=
 NOMMU
> > > >   * conditions.  These are held in a global tree and are pinned by =
the VMAs that
> > > > @@ -695,9 +701,7 @@ struct vm_area_struct {
> > > >                       unsigned long vm_start;
> > > >                       unsigned long vm_end;
> > > >               };
> > > > -#ifdef CONFIG_PER_VMA_LOCK
> > > > -             struct rcu_head vm_rcu; /* Used for deferred freeing.=
 */
> > > > -#endif
> > > > +             freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPESAF=
E_BY_RCU */
> > > >       };
> > > >
> > > >       /*
> > > > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > > index 10a971c2bde3..681b685b6c4e 100644
> > > > --- a/include/linux/slab.h
> > > > +++ b/include/linux/slab.h
> > > > @@ -234,12 +234,6 @@ enum _slab_flag_bits {
> > > >  #define SLAB_NO_OBJ_EXT              __SLAB_FLAG_UNUSED
> > > >  #endif
> > > >
> > > > -/*
> > > > - * freeptr_t represents a SLUB freelist pointer, which might be en=
coded
> > > > - * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is ena=
bled.
> > > > - */
> > > > -typedef struct { unsigned long v; } freeptr_t;
> > > > -
> > > >  /*
> > > >   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> > > >   *
> > > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > > index 9d9275783cf8..770b973a099c 100644
> > > > --- a/kernel/fork.c
> > > > +++ b/kernel/fork.c
> > > > @@ -449,6 +449,41 @@ struct vm_area_struct *vm_area_alloc(struct mm=
_struct *mm)
> > > >       return vma;
> > > >  }
> > > >
> > >
> > > There exists a copy_vma() which copies the vma to a new area in the m=
m
> > > in rmap.  Naming this vma_copy() is confusing :)
> > >
> > > It might be better to just put this code in the vm_area_dup() or call=
 it
> > > __vm_area_dup(), or __vma_dup() ?
> >
> > Hmm. It's not really duplicating a vma but copying its content (no
> > allocation). How about __vm_area_copy() to indicate it is copying
> > vm_area_struct content?
>
>
> Sorry, I missed this.  it's not copying all the content either.
>
> vm_area_init_dup() maybe?

Ah, how about vm_area_init_from(src, dest)?

>
> Considering the scope of the series, I'm not sure I want to have a
> bike shed conversation.. But I also don't want copy_<foo> <foo>_copy
> confusion in the future.
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
