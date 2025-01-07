Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDDF1F4E33
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 19:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278734; cv=none; b=hzE1tezqGrlwvBXNnRaBtjzE8Esm94eOZCKQ9d774RvUCxg8tK0ZC5hA2dXZ8MgXZ4thExomIW5XVPLhoo/cQ9nLATyhbjOjwvi/uNRwBHZPDfE30O0ODjMv8hqqaiw5BcqaAbFH6Bka9CH6BV/oP6zP3MIqilf5RVFwKIKz03s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278734; c=relaxed/simple;
	bh=npJVTNec66YuLgY3IoAo0HtwwJdUtVXYEAMXL3CMKq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=MSq6HRebtNLmv5SFD8DFkwnse2EDn5zEO3I9kS0tHCi6quPFrlel3KYP7TT2G2RUgofGS0RJfNmuKRSd7LAMQOC2HpxE42BsrkT5QqRiB9YSTX5tM/k6joEmWJM6ShtVlp9YKIYRgdPzhR2Dropku7EdcaUCuFYJ10gRVBPYUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtPM5dCe; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtPM5dCe"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4679b5c66d0so35031cf.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 11:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736278730; x=1736883530; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1j8ZyNrYX+Kh6oikgG1awfiC1iGwawNYxmwJY1fFj8=;
        b=dtPM5dCexYONoqpVLd5jmg82/9cERVwUxkW4DmZJKb//LAETgF8Qrt2JCOJtJQbhee
         T7xMtIzz+nB4roxur8v7IaPbubOyjHwVpVUFML3aCRVvaswycbTAEG/xk6diAcwguw5a
         P16WXy2mJsXVB5XxRZY2qsVDMTOet4SCCJf1l0GlOyDKsqR4KQSxwB2xIZjIDvAxYAI1
         3BhMZvDDoHTHOl59d2g9CgGxW5eicdgQXWK04iiBmdXg1IU01w1HxcSIw3lJ/aZSG5/3
         neUqI/pcXL6FAqWbNu65/MHXN7NlXGz0yyn9ESvXqxtL8d1dWf9MjzpqMwxqW6mvGgv1
         /5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278730; x=1736883530;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1j8ZyNrYX+Kh6oikgG1awfiC1iGwawNYxmwJY1fFj8=;
        b=JflizY0U0XJKH3+tfirnWwBTHrFHwp80yp6sNYpNW6dN5kzomi5WXlEDhELRUwx5jB
         9gpYSROjyAMmn79yCG26qllmRx3mYIaO/Ovnka8iBBe/JYEThciXvWBEQhTDmYILi13l
         vt8NcKBDo06+FtR6VUc2HHeonpOY2T0kvYqXPI0TRgssl0ujEDEiOAMj+Aeo/4HDPjnJ
         vFWG9byrJEjRgfESf7niiRqn5lJDGX1J/9yWUVsaRNy+GRB/ZcLG6v0hnsPNh0RgjSwt
         +b/wuEgDLOwNsWBUDvHUisD74nEFQRfHSB2ucDD81E8i3Lj0oKzSLL4DNBA3ZmcxIKRq
         qb0w==
X-Forwarded-Encrypted: i=1; AJvYcCV/9vSt0lJF35GNPSN6Ne1v8ZCuuM+Nwc6mnQsaiZsYDoHTcNzGTFhFE2QqUGmGyRyFbeo1T3rgUAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHlmrIp3Dwj7p+i2fTl8usSEczUcf0QrjJlegzs4aWj8+loBU
	fY04Pv87rilbxA4o2mBapjy9jLY2+wNRRfAOWL6rIWHgBas0BFgEzR4BiXQH/BSVG2MrjZnYc1i
	WFi44DPIwaGqvcKq0xtp583XF9ViCuvzrmlC4
X-Gm-Gg: ASbGncsEzMsy65qFnsb71V2blesZuT13HnVWi5dd5kh8iLfdmen+urLBcaU4KaS9O6s
	e+IqHOI9Jg6F4VBJW2l7actvy2eSTHjh3+Wrjiz0J9Ud45rQVhYbLakEWGmUzMw2R2Wpb
X-Google-Smtp-Source: AGHT+IEEmqmnx7yXC/8T7uwEYyzH4/6442nwvhB9EZHkkYmiIMHUiMa/qOZSGqJjcurXTAlyAHGlO8HYFzizeyAegEw=
X-Received: by 2002:a05:622a:303:b0:466:a22a:6590 with SMTP id
 d75a77b69052e-46c70e7839amr243841cf.9.1736278729976; Tue, 07 Jan 2025
 11:38:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-13-surenb@google.com>
 <dphnaz6h5kt4aukx5efcu2r3uxxhtyp2iods3275hrraldmny7@xghcoifpwd3l>
In-Reply-To: <dphnaz6h5kt4aukx5efcu2r3uxxhtyp2iods3275hrraldmny7@xghcoifpwd3l>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 11:38:38 -0800
X-Gm-Features: AbW1kvaAOGAl_d1vX5VPzXTfsBvfS-gSnFs2D2PLJoEmjkSKxnXFho4F4b25csw
Message-ID: <CAJuCfpE_odESLmQ5j2318JNu6XfvJJX=7jsy5CEJy02M2U2aqw@mail.gmail.com>
Subject: Re: [PATCH v7 12/17] mm: replace vm_lock and detached flag with a
 reference count
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

On Tue, Jan 7, 2025 at 10:44=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [241226 12:07]:
> > rw_semaphore is a sizable structure of 40 bytes and consumes
> > considerable space for each vm_area_struct. However vma_lock has
> > two important specifics which can be used to replace rw_semaphore
> > with a simpler structure:
> > 1. Readers never wait. They try to take the vma_lock and fall back to
> > mmap_lock if that fails.
> > 2. Only one writer at a time will ever try to write-lock a vma_lock
> > because writers first take mmap_lock in write mode.
> > Because of these requirements, full rw_semaphore functionality is not
> > needed and we can replace rw_semaphore and the vma->detached flag with
> > a refcount (vm_refcnt).
> > When vma is in detached state, vm_refcnt is 0 and only a call to
> > vma_mark_attached() can take it out of this state. Note that unlike
> > before, now we enforce both vma_mark_attached() and vma_mark_detached()
> > to be done only after vma has been write-locked. vma_mark_attached()
> > changes vm_refcnt to 1 to indicate that it has been attached to the vma
> > tree. When a reader takes read lock, it increments vm_refcnt, unless th=
e
> > top usable bit of vm_refcnt (0x40000000) is set, indicating presence of
> > a writer. When writer takes write lock, it both increments vm_refcnt an=
d
> > sets the top usable bit to indicate its presence. If there are readers,
> > writer will wait using newly introduced mm->vma_writer_wait. Since all
> > writers take mmap_lock in write mode first, there can be only one write=
r
> > at a time. The last reader to release the lock will signal the writer
> > to wake up.
> > refcount might overflow if there are many competing readers, in which c=
ase
> > read-locking will fail. Readers are expected to handle such failures.
>
> I find the above a bit hard to parse.
>
> What I understand is:
> 1. all accesses increment the ref count.
> 2. readers cannot increment the ref count unless the writer bit is 0 (no
> write present)
> 3. writers must wait for the ref count to reach 2 (the tree + writer
> reference) before proceeding.
> 4. increment overflow must be handled by the readers.

Your understanding is correct. I will add this summary to the
description to make it more understandable.

>
> >
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h               | 100 +++++++++++++++++++++----------
> >  include/linux/mm_types.h         |  22 ++++---
> >  kernel/fork.c                    |  13 ++--
> >  mm/init-mm.c                     |   1 +
> >  mm/memory.c                      |  68 +++++++++++++++++----
> >  tools/testing/vma/linux/atomic.h |   5 ++
> >  tools/testing/vma/vma_internal.h |  66 +++++++++++---------
> >  7 files changed, 185 insertions(+), 90 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index ea4c4228b125..99f4720d7e51 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -32,6 +32,7 @@
> >  #include <linux/memremap.h>
> >  #include <linux/slab.h>
> >  #include <linux/cacheinfo.h>
> > +#include <linux/rcuwait.h>
> >
> >  struct mempolicy;
> >  struct anon_vma;
> > @@ -697,12 +698,34 @@ static inline void vma_numab_state_free(struct vm=
_area_struct *vma) {}
> >  #endif /* CONFIG_NUMA_BALANCING */
> >
> >  #ifdef CONFIG_PER_VMA_LOCK
> > -static inline void vma_lock_init(struct vm_area_struct *vma)
> > +static inline void vma_lockdep_init(struct vm_area_struct *vma)
> >  {
> > -     init_rwsem(&vma->vm_lock.lock);
> > +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > +     static struct lock_class_key lockdep_key;
> > +
> > +     lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0=
);
> > +#endif
> > +}
> > +
> > +static inline void vma_init_lock(struct vm_area_struct *vma, bool rese=
t_refcnt)
> > +{
> > +     if (reset_refcnt)
> > +             refcount_set(&vma->vm_refcnt, 0);
> >       vma->vm_lock_seq =3D UINT_MAX;
> >  }
> >
> > +static inline void vma_refcount_put(struct vm_area_struct *vma)
> > +{
> > +     int refcnt;
> > +
> > +     if (!__refcount_dec_and_test(&vma->vm_refcnt, &refcnt)) {
> > +             rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > +
> > +             if (refcnt & VMA_LOCK_OFFSET)
>
> Couldn't we only wake on refcnt =3D=3D VMA_LOCK_OFFSET + 2?
> Right now you will wake on every departed reader, I think?  We know
> refcnt is only going down if VMA_LOCK_OFFSET is set.

I think we can, except vma_mark_detached() can be waiting for readers
after detaching the vma, so the refcount value it's waiting for is
VMA_LOCK_OFFSET + 1 (detached vma with no readers).
I think if we change the condition to (refcnt & VMA_LOCK_OFFSET) &&
(refcnt <=3D VMA_LOCK_OFFSET + 2) that would work. We might occasionally
wake a writer unnecessarily if it's waiting inside vma_mark_detached()
for VMA_LOCK_OFFSET + 1 but this situation is rare (see my later
comment).

>
> Also, maybe a #define for VMA_LOCK_WRITER_ONLY or some better name?

Perhaps a function would be better?

static inline bool is_vma_writer_only(refcnt)
{
    return (refcnt & VMA_LOCK_OFFSET) && (refcnt <=3D VMA_LOCK_OFFSET + 2);
}

>
>
> > +                     rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);
> > +     }
> > +}
> > +
> >  /*
> >   * Try to read-lock a vma. The function is allowed to occasionally yie=
ld false
> >   * locked result to avoid performance overhead, in which case we fall =
back to
> > @@ -710,6 +733,8 @@ static inline void vma_lock_init(struct vm_area_str=
uct *vma)
> >   */
> >  static inline bool vma_start_read(struct vm_area_struct *vma)
> >  {
> > +     int oldcnt;
> > +
> >       /*
> >        * Check before locking. A race might cause false locked result.
> >        * We can use READ_ONCE() for the mm_lock_seq here, and don't nee=
d
> > @@ -720,13 +745,20 @@ static inline bool vma_start_read(struct vm_area_=
struct *vma)
> >       if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->mm_l=
ock_seq.sequence))
> >               return false;
> >
> > -     if (unlikely(down_read_trylock(&vma->vm_lock.lock) =3D=3D 0))
> > +
> > +     rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> > +     /* Limit at VMA_REF_LIMIT to leave one count for a writer */
> > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &o=
ldcnt,
> > +                                                   VMA_REF_LIMIT))) {
> > +             rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> >               return false;
> > +     }
> > +     lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> >
> >       /*
> > -      * Overflow might produce false locked result.
> > +      * Overflow of vm_lock_seq/mm_lock_seq might produce false locked=
 result.
> >        * False unlocked result is impossible because we modify and chec=
k
> > -      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock=
_seq
> > +      * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lo=
ck_seq
> >        * modification invalidates all existing locks.
> >        *
> >        * We must use ACQUIRE semantics for the mm_lock_seq so that if w=
e are
> > @@ -734,10 +766,12 @@ static inline bool vma_start_read(struct vm_area_=
struct *vma)
> >        * after it has been unlocked.
> >        * This pairs with RELEASE semantics in vma_end_write_all().
> >        */
> > -     if (unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->vm_m=
m->mm_lock_seq))) {
> > -             up_read(&vma->vm_lock.lock);
> > +     if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
> > +                  vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->vm_m=
m->mm_lock_seq))) {
> > +             vma_refcount_put(vma);
> >               return false;
> >       }
> > +
> >       return true;
> >  }
> >
> > @@ -749,8 +783,17 @@ static inline bool vma_start_read(struct vm_area_s=
truct *vma)
> >   */
> >  static inline bool vma_start_read_locked_nested(struct vm_area_struct =
*vma, int subclass)
> >  {
> > +     int oldcnt;
> > +
> >       mmap_assert_locked(vma->vm_mm);
> > -     down_read_nested(&vma->vm_lock.lock, subclass);
> > +     rwsem_acquire_read(&vma->vmlock_dep_map, subclass, 0, _RET_IP_);
> > +     /* Limit at VMA_REF_LIMIT to leave one count for a writer */
> > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &o=
ldcnt,
> > +                                                   VMA_REF_LIMIT))) {
> > +             rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > +             return false;
> > +     }
> > +     lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> >       return true;
> >  }
> >
> > @@ -762,15 +805,13 @@ static inline bool vma_start_read_locked_nested(s=
truct vm_area_struct *vma, int
> >   */
> >  static inline bool vma_start_read_locked(struct vm_area_struct *vma)
> >  {
> > -     mmap_assert_locked(vma->vm_mm);
> > -     down_read(&vma->vm_lock.lock);
> > -     return true;
> > +     return vma_start_read_locked_nested(vma, 0);
> >  }
> >
> >  static inline void vma_end_read(struct vm_area_struct *vma)
> >  {
> >       rcu_read_lock(); /* keeps vma alive till the end of up_read */
> > -     up_read(&vma->vm_lock.lock);
> > +     vma_refcount_put(vma);
> >       rcu_read_unlock();
> >  }
> >
> > @@ -813,36 +854,33 @@ static inline void vma_assert_write_locked(struct=
 vm_area_struct *vma)
> >
> >  static inline void vma_assert_locked(struct vm_area_struct *vma)
> >  {
> > -     if (!rwsem_is_locked(&vma->vm_lock.lock))
> > +     if (refcount_read(&vma->vm_refcnt) <=3D 1)
> >               vma_assert_write_locked(vma);
> >  }
> >
> > +/*
> > + * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached=
(), these
> > + * assertions should be made either under mmap_write_lock or when the =
object
> > + * has been isolated under mmap_write_lock, ensuring no competing writ=
ers.
> > + */
> >  static inline void vma_assert_attached(struct vm_area_struct *vma)
> >  {
> > -     VM_BUG_ON_VMA(vma->detached, vma);
> > +     VM_BUG_ON_VMA(!refcount_read(&vma->vm_refcnt), vma);
> >  }
> >
> >  static inline void vma_assert_detached(struct vm_area_struct *vma)
> >  {
> > -     VM_BUG_ON_VMA(!vma->detached, vma);
> > +     VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt), vma);
> >  }
> >
> >  static inline void vma_mark_attached(struct vm_area_struct *vma)
> >  {
> > -     vma->detached =3D false;
> > -}
> > -
> > -static inline void vma_mark_detached(struct vm_area_struct *vma)
> > -{
> > -     /* When detaching vma should be write-locked */
> >       vma_assert_write_locked(vma);
> > -     vma->detached =3D true;
> > +     vma_assert_detached(vma);
> > +     refcount_set(&vma->vm_refcnt, 1);
> >  }
> >
> > -static inline bool is_vma_detached(struct vm_area_struct *vma)
> > -{
> > -     return vma->detached;
> > -}
> > +void vma_mark_detached(struct vm_area_struct *vma);
> >
> >  static inline void release_fault_lock(struct vm_fault *vmf)
> >  {
> > @@ -865,7 +903,8 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm=
_struct *mm,
> >
> >  #else /* CONFIG_PER_VMA_LOCK */
> >
> > -static inline void vma_lock_init(struct vm_area_struct *vma) {}
> > +static inline void vma_lockdep_init(struct vm_area_struct *vma) {}
> > +static inline void vma_init_lock(struct vm_area_struct *vma, bool rese=
t_refcnt) {}
> >  static inline bool vma_start_read(struct vm_area_struct *vma)
> >               { return false; }
> >  static inline void vma_end_read(struct vm_area_struct *vma) {}
> > @@ -908,12 +947,9 @@ static inline void vma_init(struct vm_area_struct =
*vma, struct mm_struct *mm)
> >       vma->vm_mm =3D mm;
> >       vma->vm_ops =3D &vma_dummy_vm_ops;
> >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> > -#ifdef CONFIG_PER_VMA_LOCK
> > -     /* vma is not locked, can't use vma_mark_detached() */
> > -     vma->detached =3D true;
> > -#endif
> >       vma_numab_state_init(vma);
> > -     vma_lock_init(vma);
> > +     vma_lockdep_init(vma);
> > +     vma_init_lock(vma, false);
> >  }
> >
> >  /* Use when VMA is not part of the VMA tree and needs no locking */
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 6573d95f1d1e..b5312421dec6 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -19,6 +19,7 @@
> >  #include <linux/workqueue.h>
> >  #include <linux/seqlock.h>
> >  #include <linux/percpu_counter.h>
> > +#include <linux/types.h>
> >
> >  #include <asm/mmu.h>
> >
> > @@ -629,9 +630,8 @@ static inline struct anon_vma_name *anon_vma_name_a=
lloc(const char *name)
> >  }
> >  #endif
> >
> > -struct vma_lock {
> > -     struct rw_semaphore lock;
> > -};
> > +#define VMA_LOCK_OFFSET      0x40000000
> > +#define VMA_REF_LIMIT        (VMA_LOCK_OFFSET - 2)
> >
> >  struct vma_numab_state {
> >       /*
> > @@ -709,19 +709,13 @@ struct vm_area_struct {
> >       };
> >
> >  #ifdef CONFIG_PER_VMA_LOCK
> > -     /*
> > -      * Flag to indicate areas detached from the mm->mm_mt tree.
> > -      * Unstable RCU readers are allowed to read this.
> > -      */
> > -     bool detached;
> > -
> >       /*
> >        * Can only be written (using WRITE_ONCE()) while holding both:
> >        *  - mmap_lock (in write mode)
> > -      *  - vm_lock->lock (in write mode)
> > +      *  - vm_refcnt bit at VMA_LOCK_OFFSET is set
> >        * Can be read reliably while holding one of:
> >        *  - mmap_lock (in read or write mode)
> > -      *  - vm_lock->lock (in read or write mode)
> > +      *  - vm_refcnt bit at VMA_LOCK_OFFSET is set or vm_refcnt > 1
> >        * Can be read unreliably (using READ_ONCE()) for pessimistic bai=
lout
> >        * while holding nothing (except RCU to keep the VMA struct alloc=
ated).
> >        *
> > @@ -784,7 +778,10 @@ struct vm_area_struct {
> >       struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> >  #ifdef CONFIG_PER_VMA_LOCK
> >       /* Unstable RCU readers are allowed to read this. */
> > -     struct vma_lock vm_lock ____cacheline_aligned_in_smp;
> > +     refcount_t vm_refcnt ____cacheline_aligned_in_smp;
> > +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > +     struct lockdep_map vmlock_dep_map;
> > +#endif
> >  #endif
> >  } __randomize_layout;
> >
> > @@ -919,6 +916,7 @@ struct mm_struct {
> >                                         * by mmlist_lock
> >                                         */
> >  #ifdef CONFIG_PER_VMA_LOCK
> > +             struct rcuwait vma_writer_wait;
> >               /*
> >                * This field has lock-like semantics, meaning it is some=
times
> >                * accessed with ACQUIRE/RELEASE semantics.
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index d4c75428ccaf..7a0800d48112 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -463,12 +463,8 @@ struct vm_area_struct *vm_area_dup(struct vm_area_=
struct *orig)
> >        * will be reinitialized.
> >        */
> >       data_race(memcpy(new, orig, sizeof(*new)));
> > -     vma_lock_init(new);
> > +     vma_init_lock(new, true);
> >       INIT_LIST_HEAD(&new->anon_vma_chain);
> > -#ifdef CONFIG_PER_VMA_LOCK
> > -     /* vma is not locked, can't use vma_mark_detached() */
> > -     new->detached =3D true;
> > -#endif
> >       vma_numab_state_init(new);
> >       dup_anon_vma_name(orig, new);
> >
> > @@ -477,6 +473,8 @@ struct vm_area_struct *vm_area_dup(struct vm_area_s=
truct *orig)
> >
> >  void __vm_area_free(struct vm_area_struct *vma)
> >  {
> > +     /* The vma should be detached while being destroyed. */
> > +     vma_assert_detached(vma);
> >       vma_numab_state_free(vma);
> >       free_anon_vma_name(vma);
> >       kmem_cache_free(vm_area_cachep, vma);
> > @@ -488,8 +486,6 @@ static void vm_area_free_rcu_cb(struct rcu_head *he=
ad)
> >       struct vm_area_struct *vma =3D container_of(head, struct vm_area_=
struct,
> >                                                 vm_rcu);
> >
> > -     /* The vma should not be locked while being destroyed. */
> > -     VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock.lock), vma);
> >       __vm_area_free(vma);
> >  }
> >  #endif
> > @@ -1223,6 +1219,9 @@ static inline void mmap_init_lock(struct mm_struc=
t *mm)
> >  {
> >       init_rwsem(&mm->mmap_lock);
> >       mm_lock_seqcount_init(mm);
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     rcuwait_init(&mm->vma_writer_wait);
> > +#endif
> >  }
> >
> >  static struct mm_struct *mm_init(struct mm_struct *mm, struct task_str=
uct *p,
> > diff --git a/mm/init-mm.c b/mm/init-mm.c
> > index 6af3ad675930..4600e7605cab 100644
> > --- a/mm/init-mm.c
> > +++ b/mm/init-mm.c
> > @@ -40,6 +40,7 @@ struct mm_struct init_mm =3D {
> >       .arg_lock       =3D  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
> >       .mmlist         =3D LIST_HEAD_INIT(init_mm.mmlist),
> >  #ifdef CONFIG_PER_VMA_LOCK
> > +     .vma_writer_wait =3D __RCUWAIT_INITIALIZER(init_mm.vma_writer_wai=
t),
> >       .mm_lock_seq    =3D SEQCNT_ZERO(init_mm.mm_lock_seq),
> >  #endif
> >       .user_ns        =3D &init_user_ns,
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 236fdecd44d6..2def47b5dff0 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -6328,9 +6328,39 @@ struct vm_area_struct *lock_mm_and_find_vma(stru=
ct mm_struct *mm,
> >  #endif
> >
> >  #ifdef CONFIG_PER_VMA_LOCK
> > +static inline bool __vma_enter_locked(struct vm_area_struct *vma, unsi=
gned int tgt_refcnt)
> > +{
> > +     /*
> > +      * If vma is detached then only vma_mark_attached() can raise the
> > +      * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attac=
hed().
> > +      */
> > +     if (!refcount_inc_not_zero(&vma->vm_refcnt))
> > +             return false;
>
> Can't the write lock overflow the ref count too?

No. VMA_REF_LIMIT is VMA_LOCK_OFFSET - 2 with one count reserved for a
possible writer (see the comment in vma_start_read()) and there can be
only one writer at a time. So, readers can raise the ref count up to
VMA_LOCK_OFFSET - 2 and a writer can raise it one more to
VMA_LOCK_OFFSET - 1 but not higher.

>
> > +
> > +     rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> > +     /* vma is attached, set the writer present bit */
> > +     refcount_add(VMA_LOCK_OFFSET, &vma->vm_refcnt);
> > +     rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> > +                refcount_read(&vma->vm_refcnt) =3D=3D tgt_refcnt,
> > +                TASK_UNINTERRUPTIBLE);
> > +     lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> > +
> > +     return true;
> > +}
> > +
> > +static inline void __vma_exit_locked(struct vm_area_struct *vma, bool =
*detached)
> > +{
> > +     *detached =3D refcount_sub_and_test(VMA_LOCK_OFFSET + 1, &vma->vm=
_refcnt);
> > +     rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > +}
> > +
> >  void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_loc=
k_seq)
> >  {
> > -     down_write(&vma->vm_lock.lock);
> > +     bool locked;
> > +
> > +     /* Wait until refcnt is (VMA_LOCK_OFFSET + 2) =3D> attached with =
no readers */
> > +     locked =3D __vma_enter_locked(vma, VMA_LOCK_OFFSET + 2);
>
> Does it need to take a ref count at all?  Could we just set the write
> bit and wait for it to become 1 instead?  That is, 1 would represent
> detached or writer is about to attach/detach it.

Yeah, I think you are right. We can use VMA_LOCK_OFFSET alone without
taking the ref count for the writer. Something like this:

static inline bool __vma_enter_locked(struct vm_area_struct *vma,
unsigned int tgt_refcnt)
{
        /*
         * If vma is detached then only vma_mark_attached() can raise the
         * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attache=
d().
         */
        if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
                return false;

        rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
        rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
                                refcount_read(&vma->vm_refcnt) =3D=3D tgt_r=
efcnt,
                                TASK_UNINTERRUPTIBLE);
        lock_acquired(&vma->vmlock_dep_map, _RET_IP_);

        return true;
}

static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *deta=
ched)
{
        *detached =3D refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcn=
t);
        rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
}

I'll try that and see if we missed anything.

>
> If we do need it to be ref counted for the writer, we could set the
> write bit and the wait for the ref to be 1 before incrementing it to 2?
> I think this would be safer as we know there is only one writer and the
> readers can only decrease after setting the write bit.
>
> > +
> >       /*
> >        * We should use WRITE_ONCE() here because we can have concurrent=
 reads
> >        * from the early lockless pessimistic check in vma_start_read().
> > @@ -6338,10 +6368,36 @@ void __vma_start_write(struct vm_area_struct *v=
ma, unsigned int mm_lock_seq)
> >        * we should use WRITE_ONCE() for cleanliness and to keep KCSAN h=
appy.
> >        */
> >       WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> > -     up_write(&vma->vm_lock.lock);
> > +
> > +     if (locked) {
> > +             bool detached;
> > +
> > +             __vma_exit_locked(vma, &detached);
> > +             VM_BUG_ON_VMA(detached, vma); /* vma should remain attach=
ed */
> > +     }
> >  }
> >  EXPORT_SYMBOL_GPL(__vma_start_write);
> >
> > +void vma_mark_detached(struct vm_area_struct *vma)
> > +{
> > +     vma_assert_write_locked(vma);
> > +     vma_assert_attached(vma);
> > +
> > +     /* We are the only writer, so no need to use vma_refcount_put(). =
*/

I should probably add a comment explaining why the below condition is
very unlikely (readers can increment vm_refcnt only temporarily before
they realize the vma is locked and drop the vm_refcnt back. That is a
very narrow window).


> > +     if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
> > +             /*
> > +              * Wait until refcnt is (VMA_LOCK_OFFSET + 1) =3D> detach=
ed with
> > +              * no readers
> > +              */
> > +             if (__vma_enter_locked(vma, VMA_LOCK_OFFSET + 1)) {
> > +                     bool detached;
> > +
> > +                     __vma_exit_locked(vma, &detached);
> > +                     VM_BUG_ON_VMA(!detached, vma);
> > +             }
> > +     }
> > +}
> > +
> >  /*
> >   * Lookup and lock a VMA under RCU protection. Returned VMA is guarant=
eed to be
> >   * stable and not isolated. If the VMA is not found or is being modifi=
ed the
> > @@ -6354,7 +6410,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct =
mm_struct *mm,
> >       struct vm_area_struct *vma;
> >
> >       rcu_read_lock();
> > -retry:
> >       vma =3D mas_walk(&mas);
> >       if (!vma)
> >               goto inval;
> > @@ -6362,13 +6417,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct=
 mm_struct *mm,
> >       if (!vma_start_read(vma))
> >               goto inval;
> >
> > -     /* Check if the VMA got isolated after we found it */
> > -     if (is_vma_detached(vma)) {
> > -             vma_end_read(vma);
> > -             count_vm_vma_lock_event(VMA_LOCK_MISS);
> > -             /* The area was replaced with another one */
> > -             goto retry;
> > -     }
> >       /*
> >        * At this point, we have a stable reference to a VMA: The VMA is
> >        * locked and we know it hasn't already been isolated.
> > diff --git a/tools/testing/vma/linux/atomic.h b/tools/testing/vma/linux=
/atomic.h
> > index e01f66f98982..2e2021553196 100644
> > --- a/tools/testing/vma/linux/atomic.h
> > +++ b/tools/testing/vma/linux/atomic.h
> > @@ -9,4 +9,9 @@
> >  #define atomic_set(x, y) do {} while (0)
> >  #define U8_MAX UCHAR_MAX
> >
> > +#ifndef atomic_cmpxchg_relaxed
> > +#define  atomic_cmpxchg_relaxed              uatomic_cmpxchg
> > +#define  atomic_cmpxchg_release         uatomic_cmpxchg
> > +#endif /* atomic_cmpxchg_relaxed */
> > +
> >  #endif       /* _LINUX_ATOMIC_H */
> > diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_i=
nternal.h
> > index 2a624f9304da..1e8cd2f013fa 100644
> > --- a/tools/testing/vma/vma_internal.h
> > +++ b/tools/testing/vma/vma_internal.h
> > @@ -25,7 +25,7 @@
> >  #include <linux/maple_tree.h>
> >  #include <linux/mm.h>
> >  #include <linux/rbtree.h>
> > -#include <linux/rwsem.h>
> > +#include <linux/refcount.h>
> >
> >  extern unsigned long stack_guard_gap;
> >  #ifdef CONFIG_MMU
> > @@ -132,10 +132,6 @@ typedef __bitwise unsigned int vm_fault_t;
> >   */
> >  #define pr_warn_once pr_err
> >
> > -typedef struct refcount_struct {
> > -     atomic_t refs;
> > -} refcount_t;
> > -
> >  struct kref {
> >       refcount_t refcount;
> >  };
> > @@ -228,15 +224,12 @@ struct mm_struct {
> >       unsigned long def_flags;
> >  };
> >
> > -struct vma_lock {
> > -     struct rw_semaphore lock;
> > -};
> > -
> > -
> >  struct file {
> >       struct address_space    *f_mapping;
> >  };
> >
> > +#define VMA_LOCK_OFFSET      0x40000000
> > +
> >  struct vm_area_struct {
> >       /* The first cache line has the info for VMA tree walking. */
> >
> > @@ -264,16 +257,13 @@ struct vm_area_struct {
> >       };
> >
> >  #ifdef CONFIG_PER_VMA_LOCK
> > -     /* Flag to indicate areas detached from the mm->mm_mt tree */
> > -     bool detached;
> > -
> >       /*
> >        * Can only be written (using WRITE_ONCE()) while holding both:
> >        *  - mmap_lock (in write mode)
> > -      *  - vm_lock.lock (in write mode)
> > +      *  - vm_refcnt bit at VMA_LOCK_OFFSET is set
> >        * Can be read reliably while holding one of:
> >        *  - mmap_lock (in read or write mode)
> > -      *  - vm_lock.lock (in read or write mode)
> > +      *  - vm_refcnt bit at VMA_LOCK_OFFSET is set or vm_refcnt > 1
> >        * Can be read unreliably (using READ_ONCE()) for pessimistic bai=
lout
> >        * while holding nothing (except RCU to keep the VMA struct alloc=
ated).
> >        *
> > @@ -282,7 +272,6 @@ struct vm_area_struct {
> >        * slowpath.
> >        */
> >       unsigned int vm_lock_seq;
> > -     struct vma_lock vm_lock;
> >  #endif
> >
> >       /*
> > @@ -335,6 +324,10 @@ struct vm_area_struct {
> >       struct vma_numab_state *numab_state;    /* NUMA Balancing state *=
/
> >  #endif
> >       struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     /* Unstable RCU readers are allowed to read this. */
> > +     refcount_t vm_refcnt;
> > +#endif
> >  } __randomize_layout;
> >
> >  struct vm_fault {};
> > @@ -459,23 +452,41 @@ static inline struct vm_area_struct *vma_next(str=
uct vma_iterator *vmi)
> >       return mas_find(&vmi->mas, ULONG_MAX);
> >  }
> >
> > -static inline void vma_lock_init(struct vm_area_struct *vma)
> > +/*
> > + * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached=
(), these
> > + * assertions should be made either under mmap_write_lock or when the =
object
> > + * has been isolated under mmap_write_lock, ensuring no competing writ=
ers.
> > + */
> > +static inline void vma_assert_attached(struct vm_area_struct *vma)
> >  {
> > -     init_rwsem(&vma->vm_lock.lock);
> > -     vma->vm_lock_seq =3D UINT_MAX;
> > +     VM_BUG_ON_VMA(!refcount_read(&vma->vm_refcnt), vma);
> >  }
> >
> > -static inline void vma_mark_attached(struct vm_area_struct *vma)
> > +static inline void vma_assert_detached(struct vm_area_struct *vma)
> >  {
> > -     vma->detached =3D false;
> > +     VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt), vma);
> >  }
> >
> >  static inline void vma_assert_write_locked(struct vm_area_struct *);
> > +static inline void vma_mark_attached(struct vm_area_struct *vma)
> > +{
> > +     vma_assert_write_locked(vma);
> > +     vma_assert_detached(vma);
> > +     refcount_set(&vma->vm_refcnt, 1);
> > +}
> > +
> >  static inline void vma_mark_detached(struct vm_area_struct *vma)
> >  {
> > -     /* When detaching vma should be write-locked */
> >       vma_assert_write_locked(vma);
> > -     vma->detached =3D true;
> > +     vma_assert_attached(vma);
> > +
> > +     /* We are the only writer, so no need to use vma_refcount_put(). =
*/
> > +     if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
> > +             /*
> > +              * Reader must have temporarily raised vm_refcnt but it w=
ill
> > +              * drop it without using the vma since vma is write-locke=
d.
> > +              */
> > +     }
> >  }
> >
> >  extern const struct vm_operations_struct vma_dummy_vm_ops;
> > @@ -488,9 +499,7 @@ static inline void vma_init(struct vm_area_struct *=
vma, struct mm_struct *mm)
> >       vma->vm_mm =3D mm;
> >       vma->vm_ops =3D &vma_dummy_vm_ops;
> >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> > -     /* vma is not locked, can't use vma_mark_detached() */
> > -     vma->detached =3D true;
> > -     vma_lock_init(vma);
> > +     vma->vm_lock_seq =3D UINT_MAX;
> >  }
> >
> >  static inline struct vm_area_struct *vm_area_alloc(struct mm_struct *m=
m)
> > @@ -513,10 +522,9 @@ static inline struct vm_area_struct *vm_area_dup(s=
truct vm_area_struct *orig)
> >               return NULL;
> >
> >       memcpy(new, orig, sizeof(*new));
> > -     vma_lock_init(new);
> > +     refcount_set(&new->vm_refcnt, 0);
> > +     new->vm_lock_seq =3D UINT_MAX;
> >       INIT_LIST_HEAD(&new->anon_vma_chain);
> > -     /* vma is not locked, can't use vma_mark_detached() */
> > -     new->detached =3D true;
> >
> >       return new;
> >  }
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
