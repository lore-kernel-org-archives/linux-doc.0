Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6E1D63C3
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 21:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734385499; cv=none; b=Yw4/U7PMOLgYOSEHoKwM9sncgeY34VGsWvofcOrrT0LYJDyMYnBFLbs9o34UMEdt/6YU4C9Y7gf5VQ252CW7PvAhUVY1a+XvdBL/MI+/KCSivYSsFQgezxdPMBv0kNL6bdgiQahvgurDU/9EsZ+gv1fGNIBX0ON1HxQYQV77MGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734385499; c=relaxed/simple;
	bh=JmGwLUs6UDHze2TMl1AzsDLGz9MSdoqdIKapmGtJOrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qejxec9aw03KOTgcEh/waM7sRxiWkpA2QCasdzU+54LKGdY/7w/F1Wr7nWsr49L3taVORCFI/4dZ/SHYSeB0MgsNRdA1mYpEsRkEAkwesKK0nE1TAGjueWxP5+JFZtA6yQul7d/1qu0bBsHUVFS+yrpqQEUJ3WXnwkYBt+j6v1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KH/h+aLX; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KH/h+aLX"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467abce2ef9so74451cf.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 13:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734385497; x=1734990297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuJwz+yRVvIlEgf04EbTYieZU4XF4v2uk6gzXtst0Jc=;
        b=KH/h+aLXgPJ7xYRMZn5jINd3uePVZ1JLT7oVBihSRTkvIRfMzDSCbfFtDaHwzUr2RB
         bYFIYtyehMOBx2Gf4/P2LECKjjrhglshXh3xtWLMJCXYjtrspl2RO4ReDr38xzhRAwXT
         5qXKtfLNKsHHZ27WkHNyRsYx8d2utlr2jqHxWSDenGaLKTaDx1L1/uZ1el3gKKqXoTyN
         8aA1jiKA3d4o5yfe8+WjvOAkAP9dXPT8wUY+0CQdI0T2prGtX70FXMUQMMCYukch/MzI
         EJKbABZcUIU5nAhcYxFPPUM54tscUCK9lQml0pCJPOfiqVGZgj1b6p0rcZvrDOH1Ahhx
         nVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734385497; x=1734990297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuJwz+yRVvIlEgf04EbTYieZU4XF4v2uk6gzXtst0Jc=;
        b=vIVT+Z1T8pyh3mZw/JWqylpBxrPzs04PtYIe1O1tMarqMRYTMeupZwPsMnoxeFvrz7
         37n9vz//6eceCEFKIrabKFZTQP+OwYqp5D7kvUSI1oJxZQxcioMIrbxM2I7llCU/gskb
         9XKZDAuNLGmvJ+C4haqpMlSoh3lHNUKvWWbNpEnU7+Bx2n/5yr/YkPPZ/gtqvTzEbltJ
         nhFbjC0agB+2lb/XKq75JFmOA/fcpu+d7RSIX9y8ZK0zs/kbWYRDmgLR27g5yjaxlKZS
         9p7cWpK2J9cIU1I5olpu/Hb3O76256RwciuD1wSqcVVLHSIRhGb2tmlehzf+N/7Z4IuM
         AuGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi6U7DD0R9dF2cehLr2aejKXrVylkYJihEbjYQkCqLvPsvYbIMB2TJ8eBu7Bz0DEtuOKG7rfDG05I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvXsDRQSfA3Ogiy04Ja+GinSfCJF2V5Xp/MBLze4QGBJ4ECjLU
	VVsRgxIejmAQ0GbsKw5xSxf/RLpsBtkaaKWidwJie6zl1GCENlbyzrQGuCWQxsYjXGbroz/0/pa
	tmXBVNKWJninP89HUs0aUIaw43ORmcAfKeaQV
X-Gm-Gg: ASbGncvSvkF9movqy46TcLpiLDns0N7tuuxTICNG8PkePtIqUOV9UCNkgGiYdS2aIaF
	7P69n5BVQC0c2CJgA/xNGsymovuKb6jKKKTW/KQ==
X-Google-Smtp-Source: AGHT+IHSCAO9iQHEYLNXIJAxK4wdh8jBKfn7bro1hAD4EjBpHJqaMGL174tkiD5onRcXrrU1sVKTBcw8Q4f33gkb36w=
X-Received: by 2002:ac8:5d93:0:b0:465:18f3:79c8 with SMTP id
 d75a77b69052e-468fb10f5f3mr134651cf.13.1734385496878; Mon, 16 Dec 2024
 13:44:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net>
In-Reply-To: <20241216213753.GD9803@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Dec 2024 13:44:45 -0800
Message-ID: <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
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

On Mon, Dec 16, 2024 at 1:38=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Dec 16, 2024 at 11:24:13AM -0800, Suren Baghdasaryan wrote:
> > +static inline void vma_refcount_put(struct vm_area_struct *vma)
> > +{
> > +     int refcnt;
> > +
> > +     if (!__refcount_dec_and_test(&vma->vm_refcnt, &refcnt)) {
> > +             rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > +
> > +             if (refcnt & VMA_STATE_LOCKED)
> > +                     rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);
> > +     }
> > +}
> > +
> >  /*
> >   * Try to read-lock a vma. The function is allowed to occasionally yie=
ld false
> >   * locked result to avoid performance overhead, in which case we fall =
back to
> > @@ -710,6 +728,8 @@ static inline void vma_lock_init(struct vm_area_str=
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
> > @@ -720,13 +740,20 @@ static inline bool vma_start_read(struct vm_area_=
struct *vma)
> >       if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->mm_l=
ock_seq.sequence))
> >               return false;
> >
> > +
> > +     rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> > +     /* Limit at VMA_STATE_LOCKED - 2 to leave one count for a writer =
*/
> > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &o=
ldcnt,
> > +                                                   VMA_STATE_LOCKED - =
2))) {
> > +             rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> >               return false;
> > +     }
> > +     lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> >
> >       /*
> > +      * Overflow of vm_lock_seq/mm_lock_seq might produce false locked=
 result.
> >        * False unlocked result is impossible because we modify and chec=
k
> > +      * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lo=
ck_seq
> >        * modification invalidates all existing locks.
> >        *
> >        * We must use ACQUIRE semantics for the mm_lock_seq so that if w=
e are
> > @@ -734,10 +761,12 @@ static inline bool vma_start_read(struct vm_area_=
struct *vma)
> >        * after it has been unlocked.
> >        * This pairs with RELEASE semantics in vma_end_write_all().
> >        */
> > +     if (oldcnt & VMA_STATE_LOCKED ||
> > +         unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->vm_m=
m->mm_lock_seq))) {
> > +             vma_refcount_put(vma);
>
> Suppose we have detach race with a concurrent RCU lookup like:
>
>                                         vma =3D mas_lookup();
>
>         vma_start_write();
>         mas_detach();
>                                         vma_start_read()
>                                         rwsem_acquire_read()
>                                         inc // success
>         vma_mark_detach();
>         dec_and_test // assumes 1->0
>                      // is actually 2->1
>
>                                         if (vm_lock_seq =3D=3D vma->vm_mm=
_mm_lock_seq) // true
>                                           vma_refcount_put
>                                             dec_and_test() // 1->0
>                                               *NO* rwsem_release()
>

Yes, this is possible. I think that's not a problem until we start
reusing the vmas and I deal with this race later in this patchset.
I think what you described here is the same race I mention in the
description of this patch:
https://lore.kernel.org/all/20241216192419.2970941-14-surenb@google.com/
I introduce vma_ensure_detached() in that patch to handle this case
and ensure that vmas are detached before they are returned into the
slab cache for reuse. Does that make sense?


>
>
> >               return false;
> >       }
> > +
> >       return true;
> >  }
