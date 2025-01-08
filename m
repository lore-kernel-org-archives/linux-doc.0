Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C86B200B95
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736358831; cv=none; b=gJfEfMD7A7VadRWPpXnWBpb/suhsfooy2wfb0NUm6HjkxXrY9gGzERyVPkN0xOtJj27MC8iwWwkgOVVxeKCSmpuoexM+7S1MavFC8bRp0pS5pcPNqYOC+N5RbTYgKCl3+cg5yzWmP+jH0towosLbomlq+C0lI+Dfz9m1NgbdGPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736358831; c=relaxed/simple;
	bh=CEINr0XI5ImMC+SyJ/wX9pveaFaf7NBlb8Wcxsug8D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGyBtXaJ3dtO6FTos4FlY9r1mUsEC9TaXxGeuuqjr4wFeoe9qb5DRKKklnwBBm9iPzIlfAOb2fNdeXkt6uwnpFVYLlaQLUG+AnidHyLThYCcKa86IRotl3GiK9zc9EWoo/5nrZgFSKWxW71obHjyE/I+/LhD7aKzP9jQFEc7CHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xEO1iCSC; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xEO1iCSC"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4679b5c66d0so2711cf.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736358828; x=1736963628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EoM3QLEADWKdisZlB73KCViB6HUGAhzb6FiYcO4P+w=;
        b=xEO1iCSCEgBNUqqkOAhPE7CA6biltjr29fmTWp3/nIugHDRYNjAbBqi45+eFh5v+l4
         ukADoDpnDZfrPLkW8DPlpm9y4jCsilKJID7JYwcevVckFe/TRzbC+sBZBwR1Z6N55y+K
         zRc8EwgwqMNpNorSGQ6KAy2KAmQUrcLT8o9LIy3z5Ng1dn5u5wZ+V5wGg33qsHj8pODL
         GSAIM6Wvs06orWyesoHQ4yUdm/sc0h8tNQInQb1t8JcM+VpdAzZ5TN5E+cG0+G6j0n0H
         EJfFx9XOWC2MXa/8KhU9m6opZ1GdQQLqBXaykS8coDhkUjNtzW3u7asEaMP1ewUCz5Ab
         Srdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736358828; x=1736963628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EoM3QLEADWKdisZlB73KCViB6HUGAhzb6FiYcO4P+w=;
        b=lxlCUZ7hFUxcoFUWGW2Ra56NE60bn0GWP0gTeCpus6CNIsgBycBeo20PhokqCx+hfS
         gYVWADVI+PcNwzMHLBD+U6J23ZTlRk+jXNd5VNsWqeq2rDOzOBjDVfIct3Y18dlRdh0G
         91AOuUAhpZgh9o1FfvNRbgsUZPYGtylow9yxoTRcs24Hunbsb/MPRDQY2G3HAxF2FwKR
         CLiUbeVmbSTKVKSrnm69yXBXJzXjjsNGAN1Vwlm01pe7ZsZfAqFECMXaVOOvZMDOxGQW
         SrhOvrYOdx2pU7p8iN7T67nUD2mcekqQLoJE/DiMe6L6DngtF0KGoL2TvlZ6yWtVxs23
         fY5g==
X-Forwarded-Encrypted: i=1; AJvYcCVjsO8frJDQr3IPS7UHrzPZL5zI4w81vHd0u89WsponkdxH0misF/tTv/i6gqCl0eL65UyqBxjWSvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZF5neLnYu2udUzAj6NCkfkjCqB/5EB3VFVFxBrY2IFvmzwg4
	rBsoQUK3+GLArPFqMbGpIPN224gXeBEELmn0AkesjV6SfExhMhClekhI54jaRhSWZ8IFLmVzEiT
	q4mQKCEmeaf3HzHNNM/Xz6SWm5EloI5H11F1P
X-Gm-Gg: ASbGncshpl8RkCJFwt1E4SJK88XUfbhqmo9Bg4CM2t8CAOzs1ZZpdD3ZfzDpDpjfoQD
	z5YGE19Vf0GKPreRY0paZ4Wv/k8XflTLHESCMTpNz7R5LCT41KAiuBpFJHAvJ6bUuF2yB
X-Google-Smtp-Source: AGHT+IF3onN1dSxPeEH4rOHY3xCaJmWbin0sIkVhLw2wPpH9Ldpr9m3xKR8GbjCV0NjyNax+7aY2kg58Y2EpHSV7lT8=
X-Received: by 2002:ac8:5702:0:b0:463:95e2:71f8 with SMTP id
 d75a77b69052e-46c71fcc5cbmr3060671cf.15.1736358828108; Wed, 08 Jan 2025
 09:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-13-surenb@google.com>
 <ec71eaa7-a5e5-4d83-a405-782d63cf5c53@suse.cz>
In-Reply-To: <ec71eaa7-a5e5-4d83-a405-782d63cf5c53@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 8 Jan 2025 09:53:37 -0800
X-Gm-Features: AbW1kvYkb7SBofGVioBAJ4Dim5wk2UnfLEOoRN87bgU15ULOmiC1cK-0_FEvh7k
Message-ID: <CAJuCfpF6YO43H4fxZOFE1WksBwYzM3iMmo0k=TgovQ63vQ3S=Q@mail.gmail.com>
Subject: Re: [PATCH v7 12/17] mm: replace vm_lock and detached flag with a
 reference count
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
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

On Wed, Jan 8, 2025 at 3:52=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 12/26/24 18:07, Suren Baghdasaryan wrote:
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
> >
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
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
>
> I don't know much about lockdep, but I see that down_read() does
>
> rwsem_acquire_read(&sem->dep_map, 0, 0, _RET_IP_);
>
> down_read_trylock() does
>
> rwsem_acquire_read(&sem->dep_map, 0, 1, _RET_IP_);
>
> This is passing the down_read()-like variant but it behaves like a tryloc=
k, no?

Yes, you are correct, this should behave like a trylock. I'll fix it.

>
> > +     /* Limit at VMA_REF_LIMIT to leave one count for a writer */
>
> It's mainly to not increase as much as VMA_LOCK_OFFSET bit could become
> false positively set set by readers, right?

Correct.

> The "leave one count" sounds
> like an implementation detail of VMA_REF_LIMIT and will change if Liam's
> suggestion is proven feasible?

Yes. I already tested Liam's suggestion and it seems to be working
fine. This comment will be gone in the next revision.

>
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
>
> Same as above?

Ack.

>
> > +     /* Limit at VMA_REF_LIMIT to leave one count for a writer */
>
> Also

Ack.

>
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
