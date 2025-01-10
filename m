Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93797212D6E
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736527652; cv=none; b=M3BTemviluY9PjbWESrjCKSgC2KrF8oW3NPsCFOgpY1GAAL3Dj1umBQw7934tRc0dvCrZ1CLeJwHDOfzXiWNqdya/KmmI5Etc3LWQuOtV/ZD4TEfAI/5Xb3caIMr0It9OuepmQWiqJY8geHMfMVcK/xd1bGRv/gKJy+HCa9Tb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736527652; c=relaxed/simple;
	bh=RvEVtvsnzGj25bVE/98w02oiC+kILmM8uC6uXd/JN3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPS/wSaFfsV8FAAAd6DCeM2MvrsEMj63PV8AiVOtCVbQ/n3latVT1lfjSi+53nN0PsdsSho38njQAkH1SJfMFEf2GZltU+ZojLDUa2HYcC54i7zsWpHU5nUWui+Xb3Eyrr+yncpwTfbaNUoZvxPddeYI5XYkU2Ubp2MqTjZpTCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DshmvCO5; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DshmvCO5"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4678c9310afso241751cf.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 08:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736527649; x=1737132449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb2ZwceU8qY+5YgbZ50Kl/MtDEF3hr48v4JEzpUbSAY=;
        b=DshmvCO5jFGOYRXxZ9Ry2fuAySuoSKgKw9vrRvafGreuRL7BHKeOf8sjSFkEbsx79x
         xR2uI2GPUUoK17BRyLJF7UcNcsLW0Rge9uiaqVI4Sw1T87e4ms0jf5Y/KJpsOEgHY140
         PShZr46fKzzMwLpHWo9tD6JChtXrQ5Feeic3IPbTCUJHhbubWFpbckYsPAKYUAGvXfO5
         roFqV71qBZeoX1ixRuHMfpZiKuGnjTblJNxpXupdqYelWEfGelSJvnB0vnDczie3tASN
         Ok9GcG7KKW1GG9FP8Pp9+35r1bUNh66ZDpfU5DYjnao/d6RtcBoNgmVdFfipq1NIOSyT
         NKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736527649; x=1737132449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb2ZwceU8qY+5YgbZ50Kl/MtDEF3hr48v4JEzpUbSAY=;
        b=cJ6pbLz5/eDk7rKtCe5PcaTGLtIQjBD2Zyb7KAaE8B+BQ4pHHwucoBVvNtHnBjxFjQ
         USmuJk6AFykYR+fWmnEof0I5Zt2jCUfxuIcjCXdzFKffX4D2dx8Q1TsOcwDHPeBWrRlD
         GZhzc0Y79LAIUp8bauXmMDT+Iyn/b0miNyEjz14AsHTlf4QglAjPg2ZO+XvqWW0gNolB
         CY1UZv9cImKnRWs62xPPkNsv+4BB0MglCiNZBjTktmJX59n0Th/FlmEhEA1PovOW8/v0
         XyFBLEDWD3droOqZxvZlUEoGAHQri/tXYlhxfVAjKtjClBWJ/YMBvGuD5x4IO9M616/c
         2gKg==
X-Forwarded-Encrypted: i=1; AJvYcCVokwHldL9xTOXaelw191/0qAyMU9vr3amF+aUbKZKhtEYwCM4ef02MLVHxV8WwjgTJW5oe5ff9fbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdRO69KkejJQMuKmBGsQw/yc1myiGdK8Hb5jquzkoP/HQSLVwG
	VqVoPdN0nXe9SP+X5LBYGMM5455hNkL3RKKDjmk+QRGoRX2VtChphllJf7LeLa5Bu2Zy6VGzMUV
	QeILi1LEzhZLKrW25qi+CyyhLNaIgH4vrpcfq
X-Gm-Gg: ASbGncs6fbNi1P2SWoGOFxNe7dMSOd2GyVedsR3Hamt3jYHkrKdV2XlNyYJ3bHxpbHA
	XfqHxgVxXcp1Ml+jx3gX7bPIIJFdwKn53ugkXnw==
X-Google-Smtp-Source: AGHT+IHher0vZel2teo02WsSUy/q+0DY41PXskS0+txa/PN6LvQOK6Mqo8vPtOhryqbWiWco5Oil1uSaT1O7M52efMs=
X-Received: by 2002:a05:622a:341:b0:460:f093:f259 with SMTP id
 d75a77b69052e-46c87f4a88bmr4035381cf.22.1736527649226; Fri, 10 Jan 2025
 08:47:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-12-surenb@google.com>
 <95e9d80e-6c19-4a1f-9c21-307006858dff@suse.cz> <CAJuCfpH_=JRSXHDsw1QSYxUk6Q=gSH26_Fm0bqCmSKR-NqDj4Q@mail.gmail.com>
In-Reply-To: <CAJuCfpH_=JRSXHDsw1QSYxUk6Q=gSH26_Fm0bqCmSKR-NqDj4Q@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 08:47:18 -0800
X-Gm-Features: AbW1kvbZvb-s1cwLhjyGPaNnnNpYbYM_Y167BHbDR1jueVGdwHp6FdQOANHfwRc
Message-ID: <CAJuCfpE+eza4eZ9Hckvuj2MarLwaXoTFTNtUdw375Ugo=dUfvg@mail.gmail.com>
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

On Fri, Jan 10, 2025 at 7:56=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Fri, Jan 10, 2025 at 6:33=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> =
wrote:
> >
> > On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> > > rw_semaphore is a sizable structure of 40 bytes and consumes
> > > considerable space for each vm_area_struct. However vma_lock has
> > > two important specifics which can be used to replace rw_semaphore
> > > with a simpler structure:
> > > 1. Readers never wait. They try to take the vma_lock and fall back to
> > > mmap_lock if that fails.
> > > 2. Only one writer at a time will ever try to write-lock a vma_lock
> > > because writers first take mmap_lock in write mode.
> > > Because of these requirements, full rw_semaphore functionality is not
> > > needed and we can replace rw_semaphore and the vma->detached flag wit=
h
> > > a refcount (vm_refcnt).
> > > When vma is in detached state, vm_refcnt is 0 and only a call to
> > > vma_mark_attached() can take it out of this state. Note that unlike
> > > before, now we enforce both vma_mark_attached() and vma_mark_detached=
()
> > > to be done only after vma has been write-locked. vma_mark_attached()
> > > changes vm_refcnt to 1 to indicate that it has been attached to the v=
ma
> > > tree. When a reader takes read lock, it increments vm_refcnt, unless =
the
> > > top usable bit of vm_refcnt (0x40000000) is set, indicating presence =
of
> > > a writer. When writer takes write lock, it sets the top usable bit to
> > > indicate its presence. If there are readers, writer will wait using n=
ewly
> > > introduced mm->vma_writer_wait. Since all writers take mmap_lock in w=
rite
> > > mode first, there can be only one writer at a time. The last reader t=
o
> > > release the lock will signal the writer to wake up.
> > > refcount might overflow if there are many competing readers, in which=
 case
> > > read-locking will fail. Readers are expected to handle such failures.
> > > In summary:
> > > 1. all readers increment the vm_refcnt;
> > > 2. writer sets top usable (writer) bit of vm_refcnt;
> > > 3. readers cannot increment the vm_refcnt if the writer bit is set;
> > > 4. in the presence of readers, writer must wait for the vm_refcnt to =
drop
> > > to 1 (ignoring the writer bit), indicating an attached vma with no re=
aders;
> > > 5. vm_refcnt overflow is handled by the readers.
> > >
> > > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> >
> > But think there's a problem that will manifest after patch 15.
> > Also I don't feel qualified enough about the lockdep parts though
> > (although I think I spotted another issue with those, below) so best if
> > PeterZ can review those.
> > Some nits below too.
> >
> > > +
> > > +static inline void vma_refcount_put(struct vm_area_struct *vma)
> > > +{
> > > +     int oldcnt;
> > > +
> > > +     if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> > > +             rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> >
> > Shouldn't we rwsem_release always? And also shouldn't it precede the
> > refcount operation itself?
>
> Yes. Hillf pointed to the same issue. It will be fixed in the next versio=
n.
>
> >
> > > +             if (is_vma_writer_only(oldcnt - 1))
> > > +                     rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);
> >
> > Hmm hmm we should maybe read the vm_mm pointer before dropping the
> > refcount? In case this races in a way that is_vma_writer_only tests tru=
e
> > but the writer meanwhile finishes and frees the vma. It's safe now but
> > not after making the cache SLAB_TYPESAFE_BY_RCU ?
>
> Hmm. But if is_vma_writer_only() is true that means the writed is
> blocked and is waiting for the reader to drop the vm_refcnt. IOW, it
> won't proceed and free the vma until the reader calls
> rcuwait_wake_up(). Your suggested change is trivial and I can do it
> but I want to make sure I'm not missing something. Am I?

Ok, after thinking some more, I think the race you might be referring
to is this:

writer                                           reader

    __vma_enter_locked
        refcount_add_not_zero(VMA_LOCK_OFFSET, ...)
                                                    vma_refcount_put
                                                       __refcount_dec_and_t=
est()
                                                           if
(is_vma_writer_only())
        rcuwait_wait_event(&vma->vm_mm->vma_writer_wait, ...)
    __vma_exit_locked
        refcount_sub_and_test(VMA_LOCK_OFFSET, ...)
    free the vma

rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);

I think it's possible and your suggestion of storing the mm before
doing __refcount_dec_and_test() should work. Thanks for pointing this
out! I'll fix it in the next version.

>
> >
> > > +     }
> > > +}
> > > +
> >
> > >  static inline void vma_end_read(struct vm_area_struct *vma)
> > >  {
> > >       rcu_read_lock(); /* keeps vma alive till the end of up_read */
> >
> > This should refer to vma_refcount_put(). But after fixing it I think we
> > could stop doing this altogether? It will no longer keep vma "alive"
> > with SLAB_TYPESAFE_BY_RCU.
>
> Yeah, I think the comment along with rcu_read_lock()/rcu_read_unlock()
> here can be safely removed.
>
> >
> > > -     up_read(&vma->vm_lock.lock);
> > > +     vma_refcount_put(vma);
> > >       rcu_read_unlock();
> > >  }
> > >
> >
> > <snip>
> >
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -6370,9 +6370,41 @@ struct vm_area_struct *lock_mm_and_find_vma(st=
ruct mm_struct *mm,
> > >  #endif
> > >
> > >  #ifdef CONFIG_PER_VMA_LOCK
> > > +static inline bool __vma_enter_locked(struct vm_area_struct *vma, un=
signed int tgt_refcnt)
> > > +{
> > > +     /*
> > > +      * If vma is detached then only vma_mark_attached() can raise t=
he
> > > +      * vm_refcnt. mmap_write_lock prevents racing with vma_mark_att=
ached().
> > > +      */
> > > +     if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> > > +             return false;
> > > +
> > > +     rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> > > +     rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> > > +                refcount_read(&vma->vm_refcnt) =3D=3D tgt_refcnt,
> > > +                TASK_UNINTERRUPTIBLE);
> > > +     lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> > > +
> > > +     return true;
> > > +}
> > > +
> > > +static inline void __vma_exit_locked(struct vm_area_struct *vma, boo=
l *detached)
> > > +{
> > > +     *detached =3D refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_r=
efcnt);
> > > +     rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > > +}
> > > +
> > >  void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_l=
ock_seq)
> > >  {
> > > -     down_write(&vma->vm_lock.lock);
> > > +     bool locked;
> > > +
> > > +     /*
> > > +      * __vma_enter_locked() returns false immediately if the vma is=
 not
> > > +      * attached, otherwise it waits until refcnt is (VMA_LOCK_OFFSE=
T + 1)
> > > +      * indicating that vma is attached with no readers.
> > > +      */
> > > +     locked =3D __vma_enter_locked(vma, VMA_LOCK_OFFSET + 1);
> >
> > Wonder if it would be slightly better if tgt_refcount was just 1 (or 0
> > below in vma_mark_detached()) and the VMA_LOCK_OFFSET added to it in
> > __vma_enter_locked() itself as it's the one adding it in the first plac=
e.
>
> Well, it won't be called tgt_refcount then. Maybe "bool vma_attached"
> and inside __vma_enter_locked() we do:
>
> unsigned int tgt_refcnt =3D VMA_LOCK_OFFSET + vma_attached ? 1 : 0;
>
> Is that better?
>
> >
