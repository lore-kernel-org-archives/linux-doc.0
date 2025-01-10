Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139E2135A6
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736527855; cv=none; b=EirC4Ca6sr3ktiGJXWk7g7PKnbHHvpAMOl7c4egxhWol9sVkWJbgGaQqwSRE6ROKUPDdRZ4Fnkv69iYyI2on+m8oX/ywg6OzXnDvxocuBLhuU4ubrJI69QbE2VRZRrIR3z33WcKnac/SAZOsUMHMvx+X9TtWnIyho2ZTpfbMzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736527855; c=relaxed/simple;
	bh=32jDSlcxVmVQ1SuZ1FL1ZdFCZVEPpZLkGbcPedAJ6Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHhDQMCxsB3WlkfpaR0GuDQpEotJgMuSTu56pTL13yjLTDHaXACgvXgW4jU7zZLGWNC18wEQbHXOo16aJhNSfoB218bnbxgmqD4N1MRt4ezSAEZwzQAVUKuzGVCVlnd0lN3zdQbQt+i1T5+sJT36Px+wF4ec0SmanLkno9oZZ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EH6PbA2u; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EH6PbA2u"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-467896541e1so296551cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 08:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736527851; x=1737132651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ3BBM8ln6ISkso43QvSblhvjQJh7nb5EsHUKP5H+LQ=;
        b=EH6PbA2u7MkYzDpOpbUr9heIiHtYKSfMo7qTh/ckBFaePTMFsbdk6b50tPDQVEffAI
         OrejV5JcRGwTBA/sLKPIncXjnndRqDvXHwUu/pZOjoSrxbGqTQsd06nX3taJ3T1IHe2P
         94vVrAoXl6BuVXQs1NG2yJJFrm57na9PMsi44gW819cPo+wI+RYskz4ipxlTbtyNebJT
         CKHPLWEDfRMkY6HK26Jg7MISDWI5IFeApPGtEbXJg6lCOEeiWCVh9wKOnyigViy1Z0EN
         QFsnXd3YHqSMYEwv8unBIUk/AR8tY+3knJZm1sgZRbzxPLjiryfikOhhGduY1iUn/esE
         e80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736527851; x=1737132651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJ3BBM8ln6ISkso43QvSblhvjQJh7nb5EsHUKP5H+LQ=;
        b=A7Fma5Q3Xoo7t71uB9fKMs4sUyyB3eDWaBwwraiOTRAr8kxGRNwPsfDb53O1HgXG19
         +68YPUlPqg9KMzBIPATIjdyRd/eo5O6t4eD0RxFtN/D7pepIGKWTi2KLJkredhoiV7J6
         SeZt+iEDedHzQ4I9Db0bh1CxY16VYrn18a9DuvJybsbqbLgzpPZOuJ09LIN20VJPd3kf
         a2vZIVyRW4TQ6+gI/16RjcStRtUZRY5RvHZ2Xx1xLpKgRZo08gsffJzQsbbw+PBaAdAO
         z1bCvpjIL/T7ZOD71/Xla9BXdFGxJTATqLHvQ1kg1tBh18ffdIZU9GonZBszWB5dXd1z
         hUpw==
X-Forwarded-Encrypted: i=1; AJvYcCU9z+IYG1SpOHCWUMceeWvjFwhCjxjMUXVPVdGwcNF8BuOQkQIAP4AqCUAyrWfpkUySQ4radkApvSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySIMPS/4Uweu1BhXvpPmyxXwRWnAVl7Abmn7tuJ9M4l3ieZFZP
	rvkhcvA4sTWwy2x1Pm7Wo68KFlCPu5VWzMWakZXjObvLMnaPuUVWOGHYjmNSOs2NS7qYZkA+VTr
	eCa4GRrIWsML8R1CA01WM5sklN3JUFHmln87R
X-Gm-Gg: ASbGncvMvFNTOdHsoLo/F2v9YQtp9wSDeMzgfj85Y15R09b9zHDSXROlpLw+cQhuYBp
	QLYDteDHbBIF5SXfoGqEPqzPNk28+pf4rWsvS1g==
X-Google-Smtp-Source: AGHT+IEwVPU7ki8mes1OagoxZWTiyu4JoBUB/ovIA3aC1wGRPF/kCcQxbxtNLQXC4RzXdolyDc8NDx+b2yNJ5KmyAnE=
X-Received: by 2002:ac8:7e8e:0:b0:460:4620:232b with SMTP id
 d75a77b69052e-46c87f4a867mr3811261cf.28.1736527851056; Fri, 10 Jan 2025
 08:50:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-12-surenb@google.com>
 <95e9d80e-6c19-4a1f-9c21-307006858dff@suse.cz> <CAJuCfpH_=JRSXHDsw1QSYxUk6Q=gSH26_Fm0bqCmSKR-NqDj4Q@mail.gmail.com>
 <CAJuCfpE+eza4eZ9Hckvuj2MarLwaXoTFTNtUdw375Ugo=dUfvg@mail.gmail.com>
In-Reply-To: <CAJuCfpE+eza4eZ9Hckvuj2MarLwaXoTFTNtUdw375Ugo=dUfvg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 08:50:40 -0800
X-Gm-Features: AbW1kvawcsM6ilvgNUS6_fgR9__YcADp-x515-vZeNXJSxpO5E4zadNzEofPNUU
Message-ID: <CAJuCfpEq5BpE6wb+cNi=UOZGKMr8ozxAtA0T1Eq49opnEWjvFw@mail.gmail.com>
Subject: Re: [PATCH v8 11/16] mm: replace vm_lock and detached flag with a
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
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 8:47=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Fri, Jan 10, 2025 at 7:56=E2=80=AFAM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Fri, Jan 10, 2025 at 6:33=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> > >
> > > On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> > > > rw_semaphore is a sizable structure of 40 bytes and consumes
> > > > considerable space for each vm_area_struct. However vma_lock has
> > > > two important specifics which can be used to replace rw_semaphore
> > > > with a simpler structure:
> > > > 1. Readers never wait. They try to take the vma_lock and fall back =
to
> > > > mmap_lock if that fails.
> > > > 2. Only one writer at a time will ever try to write-lock a vma_lock
> > > > because writers first take mmap_lock in write mode.
> > > > Because of these requirements, full rw_semaphore functionality is n=
ot
> > > > needed and we can replace rw_semaphore and the vma->detached flag w=
ith
> > > > a refcount (vm_refcnt).
> > > > When vma is in detached state, vm_refcnt is 0 and only a call to
> > > > vma_mark_attached() can take it out of this state. Note that unlike
> > > > before, now we enforce both vma_mark_attached() and vma_mark_detach=
ed()
> > > > to be done only after vma has been write-locked. vma_mark_attached(=
)
> > > > changes vm_refcnt to 1 to indicate that it has been attached to the=
 vma
> > > > tree. When a reader takes read lock, it increments vm_refcnt, unles=
s the
> > > > top usable bit of vm_refcnt (0x40000000) is set, indicating presenc=
e of
> > > > a writer. When writer takes write lock, it sets the top usable bit =
to
> > > > indicate its presence. If there are readers, writer will wait using=
 newly
> > > > introduced mm->vma_writer_wait. Since all writers take mmap_lock in=
 write
> > > > mode first, there can be only one writer at a time. The last reader=
 to
> > > > release the lock will signal the writer to wake up.
> > > > refcount might overflow if there are many competing readers, in whi=
ch case
> > > > read-locking will fail. Readers are expected to handle such failure=
s.
> > > > In summary:
> > > > 1. all readers increment the vm_refcnt;
> > > > 2. writer sets top usable (writer) bit of vm_refcnt;
> > > > 3. readers cannot increment the vm_refcnt if the writer bit is set;
> > > > 4. in the presence of readers, writer must wait for the vm_refcnt t=
o drop
> > > > to 1 (ignoring the writer bit), indicating an attached vma with no =
readers;
> > > > 5. vm_refcnt overflow is handled by the readers.
> > > >
> > > > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > > > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > >
> > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > >
> > > But think there's a problem that will manifest after patch 15.
> > > Also I don't feel qualified enough about the lockdep parts though
> > > (although I think I spotted another issue with those, below) so best =
if
> > > PeterZ can review those.
> > > Some nits below too.
> > >
> > > > +
> > > > +static inline void vma_refcount_put(struct vm_area_struct *vma)
> > > > +{
> > > > +     int oldcnt;
> > > > +
> > > > +     if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> > > > +             rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > >
> > > Shouldn't we rwsem_release always? And also shouldn't it precede the
> > > refcount operation itself?
> >
> > Yes. Hillf pointed to the same issue. It will be fixed in the next vers=
ion.
> >
> > >
> > > > +             if (is_vma_writer_only(oldcnt - 1))
> > > > +                     rcuwait_wake_up(&vma->vm_mm->vma_writer_wait)=
;
> > >
> > > Hmm hmm we should maybe read the vm_mm pointer before dropping the
> > > refcount? In case this races in a way that is_vma_writer_only tests t=
rue
> > > but the writer meanwhile finishes and frees the vma. It's safe now bu=
t
> > > not after making the cache SLAB_TYPESAFE_BY_RCU ?
> >
> > Hmm. But if is_vma_writer_only() is true that means the writed is
> > blocked and is waiting for the reader to drop the vm_refcnt. IOW, it
> > won't proceed and free the vma until the reader calls
> > rcuwait_wake_up(). Your suggested change is trivial and I can do it
> > but I want to make sure I'm not missing something. Am I?
>
> Ok, after thinking some more, I think the race you might be referring
> to is this:
>
> writer                                           reader
>
>     __vma_enter_locked
>         refcount_add_not_zero(VMA_LOCK_OFFSET, ...)
>                                                     vma_refcount_put
>                                                        __refcount_dec_and=
_test()
>                                                            if
> (is_vma_writer_only())
>         rcuwait_wait_event(&vma->vm_mm->vma_writer_wait, ...)
>     __vma_exit_locked
>         refcount_sub_and_test(VMA_LOCK_OFFSET, ...)
>     free the vma
>
> rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);

Sorry, this should be more readable:

writer             reader

__vma_enter_locked
    refcount_add_not_zero(VMA_LOCK_OFFSET, ...)
                   vma_refcount_put
                       __refcount_dec_and_test()
                           if (is_vma_writer_only())

    rcuwait_wait_event()
__vma_exit_locked
    refcount_sub_and_test(VMA_LOCK_OFFSET, ...)
free the vma

                               rcuwait_wake_up(); <-- access to vma->vm_mm

>
> I think it's possible and your suggestion of storing the mm before
> doing __refcount_dec_and_test() should work. Thanks for pointing this
> out! I'll fix it in the next version.
>
> >
> > >
> > > > +     }
> > > > +}
> > > > +
> > >
> > > >  static inline void vma_end_read(struct vm_area_struct *vma)
> > > >  {
> > > >       rcu_read_lock(); /* keeps vma alive till the end of up_read *=
/
> > >
> > > This should refer to vma_refcount_put(). But after fixing it I think =
we
> > > could stop doing this altogether? It will no longer keep vma "alive"
> > > with SLAB_TYPESAFE_BY_RCU.
> >
> > Yeah, I think the comment along with rcu_read_lock()/rcu_read_unlock()
> > here can be safely removed.
> >
> > >
> > > > -     up_read(&vma->vm_lock.lock);
> > > > +     vma_refcount_put(vma);
> > > >       rcu_read_unlock();
> > > >  }
> > > >
> > >
> > > <snip>
> > >
> > > > --- a/mm/memory.c
> > > > +++ b/mm/memory.c
> > > > @@ -6370,9 +6370,41 @@ struct vm_area_struct *lock_mm_and_find_vma(=
struct mm_struct *mm,
> > > >  #endif
> > > >
> > > >  #ifdef CONFIG_PER_VMA_LOCK
> > > > +static inline bool __vma_enter_locked(struct vm_area_struct *vma, =
unsigned int tgt_refcnt)
> > > > +{
> > > > +     /*
> > > > +      * If vma is detached then only vma_mark_attached() can raise=
 the
> > > > +      * vm_refcnt. mmap_write_lock prevents racing with vma_mark_a=
ttached().
> > > > +      */
> > > > +     if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> > > > +             return false;
> > > > +
> > > > +     rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> > > > +     rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> > > > +                refcount_read(&vma->vm_refcnt) =3D=3D tgt_refcnt,
> > > > +                TASK_UNINTERRUPTIBLE);
> > > > +     lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > > +static inline void __vma_exit_locked(struct vm_area_struct *vma, b=
ool *detached)
> > > > +{
> > > > +     *detached =3D refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm=
_refcnt);
> > > > +     rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > > > +}
> > > > +
> > > >  void __vma_start_write(struct vm_area_struct *vma, unsigned int mm=
_lock_seq)
> > > >  {
> > > > -     down_write(&vma->vm_lock.lock);
> > > > +     bool locked;
> > > > +
> > > > +     /*
> > > > +      * __vma_enter_locked() returns false immediately if the vma =
is not
> > > > +      * attached, otherwise it waits until refcnt is (VMA_LOCK_OFF=
SET + 1)
> > > > +      * indicating that vma is attached with no readers.
> > > > +      */
> > > > +     locked =3D __vma_enter_locked(vma, VMA_LOCK_OFFSET + 1);
> > >
> > > Wonder if it would be slightly better if tgt_refcount was just 1 (or =
0
> > > below in vma_mark_detached()) and the VMA_LOCK_OFFSET added to it in
> > > __vma_enter_locked() itself as it's the one adding it in the first pl=
ace.
> >
> > Well, it won't be called tgt_refcount then. Maybe "bool vma_attached"
> > and inside __vma_enter_locked() we do:
> >
> > unsigned int tgt_refcnt =3D VMA_LOCK_OFFSET + vma_attached ? 1 : 0;
> >
> > Is that better?
> >
> > >
