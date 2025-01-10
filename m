Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0BC211700
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524623; cv=none; b=mdxTz0xty1IJWUMfQAyhuQiJHJf9phb1KINIv6VFFodjLzpv5aQQn5myZVowhrEdhpUHCv62BNTfxULAuqfGlSswiDSQpp+ZfgvZJ0UHI0gF3D7Gy+9BboFNK2avPDDfFD5IxsTCYKrgkowJhwdoxoUB5L+w1Olmxa3s8wyK3h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524623; c=relaxed/simple;
	bh=ZWQnE4V/sciRvQJHBIiopL/QJII+mb3qds15tD7SyeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzHNP3EAqBwcbVWDWlmyMTRhFJHFlO7ypEjoqOu1XmTDyr7yVW3cbEglcuSbk/gTKSH3TR3VPUmebpfIX8/aZvzZHeMp60l7vk7AelNqqMt4/GuhniFa5boWJTbqrDLfkG6EbgmuYXQfjke+LkHXSUFohlRCefwAc5KlGSFeWS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7iJ6nBE; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7iJ6nBE"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-467896541e1so278811cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 07:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736524620; x=1737129420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgIuWlG0iYUIu/hJwevRd5bkgowBtO2Ectr/9l9FLrM=;
        b=o7iJ6nBEjETWjiqVe+jwMpMDm9IA4bsxlNCU/KCd7Jj/Xowfu4lvK9TZZXEPwSexsQ
         4/jVE/Y/4rtcXIHZJKj9mmIeW7362h2hWIlxUm+NCfvRpyWk4ZIEv4eVJ9NDIY5Yd9AY
         y6BOldkiDaPqleJWzi+AclNJROfY6Om0BEAnCBLkGYl6Q1U9KOPR8vhHTnME5TDVdDvK
         r6xiYmmapkOtilNA0FMocORO+fJryEdhEAcod2n+wQCR1R8a60E5DYwbUjpo3k/jyEZ+
         sqmsWQWvlR5MSaHc/ZiAbnHPPiCeR3Xb1NK76yTOUpu978TmN8pG98f/hylc0fHmTmHJ
         9O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524620; x=1737129420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgIuWlG0iYUIu/hJwevRd5bkgowBtO2Ectr/9l9FLrM=;
        b=Z24uCUIaauG1z8NZbB+J+bS92/ELIA/C277yNkdsRrVdAPCfv0ujfMpTSCyXsy5SLY
         4hCRXCoPRy1+vjCcTYxZyVlGTS+jHZHQfr/h/XuiNlt7XVdFime/zccopc+6k/bhPUaJ
         tR/z4oE6sZFsKBTB/+dVy7HDulKqUG1bKLLWl+LZcYho98oC3hYvcJrN03hvGvAlS/cI
         8ZaVWRIaJG4gYI2+dqIekqpAh/Abo2ht86dArNOUCvnJD+WUdwb8ATGGvk3/sjzTbSUM
         yFGQ/pLCzTdLyO4Iy6PzPz0tBaUO5sxXt9HUFV0Vg8WCJcIHiyrhukxM9iqRNqFK1aoA
         T1pg==
X-Forwarded-Encrypted: i=1; AJvYcCVlWK9Wo6XZFZxSn3RhqFB7r+n67m4j3f6mnu4q/CXLTI4axpbf5v89ja0W9MWRrHwpMm6nUiEa9Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfcFvHpyrJeYBJB9940nQBb7rQDtSg77I95UIMjRu40Qj+u1nz
	8EgnQALakRohE95WOQJL41pAasPsohEijEoNyVmcVZr9nf3BaD9sMMOnnVE1KIdr4Hd61+WKunS
	3kcmQY5PNZtOY5mVmFHubjXyLZFAkgWYBNYd3
X-Gm-Gg: ASbGncu9IZQRNAR5oSypY9xCkfpHk3G/TELLufqvH1rqwsL7LENVzQLodzC9uXdImHZ
	d927ss5V23uU5h8q1jtli3OVPB8F8kzN+pUYmug==
X-Google-Smtp-Source: AGHT+IGLb2CAeqiZD/8GbTG1MnBA0ktLsQb5WmpcoG2ySAzx/iBiB28LB/q5DMRnDRzipnuqZH4XzPnlVHDk4mlp/44=
X-Received: by 2002:ac8:5dcb:0:b0:460:463d:78dd with SMTP id
 d75a77b69052e-46c87e0774bmr3897261cf.4.1736524620163; Fri, 10 Jan 2025
 07:57:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-12-surenb@google.com>
 <95e9d80e-6c19-4a1f-9c21-307006858dff@suse.cz>
In-Reply-To: <95e9d80e-6c19-4a1f-9c21-307006858dff@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 07:56:49 -0800
X-Gm-Features: AbW1kvavpdXYE4--jH1sVL17CixKdlsI4s7MECSReNY6bDKG9VehthZoGzAjGbU
Message-ID: <CAJuCfpH_=JRSXHDsw1QSYxUk6Q=gSH26_Fm0bqCmSKR-NqDj4Q@mail.gmail.com>
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

On Fri, Jan 10, 2025 at 6:33=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
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
> > a writer. When writer takes write lock, it sets the top usable bit to
> > indicate its presence. If there are readers, writer will wait using new=
ly
> > introduced mm->vma_writer_wait. Since all writers take mmap_lock in wri=
te
> > mode first, there can be only one writer at a time. The last reader to
> > release the lock will signal the writer to wake up.
> > refcount might overflow if there are many competing readers, in which c=
ase
> > read-locking will fail. Readers are expected to handle such failures.
> > In summary:
> > 1. all readers increment the vm_refcnt;
> > 2. writer sets top usable (writer) bit of vm_refcnt;
> > 3. readers cannot increment the vm_refcnt if the writer bit is set;
> > 4. in the presence of readers, writer must wait for the vm_refcnt to dr=
op
> > to 1 (ignoring the writer bit), indicating an attached vma with no read=
ers;
> > 5. vm_refcnt overflow is handled by the readers.
> >
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> But think there's a problem that will manifest after patch 15.
> Also I don't feel qualified enough about the lockdep parts though
> (although I think I spotted another issue with those, below) so best if
> PeterZ can review those.
> Some nits below too.
>
> > +
> > +static inline void vma_refcount_put(struct vm_area_struct *vma)
> > +{
> > +     int oldcnt;
> > +
> > +     if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> > +             rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
>
> Shouldn't we rwsem_release always? And also shouldn't it precede the
> refcount operation itself?

Yes. Hillf pointed to the same issue. It will be fixed in the next version.

>
> > +             if (is_vma_writer_only(oldcnt - 1))
> > +                     rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);
>
> Hmm hmm we should maybe read the vm_mm pointer before dropping the
> refcount? In case this races in a way that is_vma_writer_only tests true
> but the writer meanwhile finishes and frees the vma. It's safe now but
> not after making the cache SLAB_TYPESAFE_BY_RCU ?

Hmm. But if is_vma_writer_only() is true that means the writed is
blocked and is waiting for the reader to drop the vm_refcnt. IOW, it
won't proceed and free the vma until the reader calls
rcuwait_wake_up(). Your suggested change is trivial and I can do it
but I want to make sure I'm not missing something. Am I?

>
> > +     }
> > +}
> > +
>
> >  static inline void vma_end_read(struct vm_area_struct *vma)
> >  {
> >       rcu_read_lock(); /* keeps vma alive till the end of up_read */
>
> This should refer to vma_refcount_put(). But after fixing it I think we
> could stop doing this altogether? It will no longer keep vma "alive"
> with SLAB_TYPESAFE_BY_RCU.

Yeah, I think the comment along with rcu_read_lock()/rcu_read_unlock()
here can be safely removed.

>
> > -     up_read(&vma->vm_lock.lock);
> > +     vma_refcount_put(vma);
> >       rcu_read_unlock();
> >  }
> >
>
> <snip>
>
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -6370,9 +6370,41 @@ struct vm_area_struct *lock_mm_and_find_vma(stru=
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
> > +     if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> > +             return false;
> > +
> > +     rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
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
> > +     *detached =3D refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_ref=
cnt);
> > +     rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > +}
> > +
> >  void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_loc=
k_seq)
> >  {
> > -     down_write(&vma->vm_lock.lock);
> > +     bool locked;
> > +
> > +     /*
> > +      * __vma_enter_locked() returns false immediately if the vma is n=
ot
> > +      * attached, otherwise it waits until refcnt is (VMA_LOCK_OFFSET =
+ 1)
> > +      * indicating that vma is attached with no readers.
> > +      */
> > +     locked =3D __vma_enter_locked(vma, VMA_LOCK_OFFSET + 1);
>
> Wonder if it would be slightly better if tgt_refcount was just 1 (or 0
> below in vma_mark_detached()) and the VMA_LOCK_OFFSET added to it in
> __vma_enter_locked() itself as it's the one adding it in the first place.

Well, it won't be called tgt_refcount then. Maybe "bool vma_attached"
and inside __vma_enter_locked() we do:

unsigned int tgt_refcnt =3D VMA_LOCK_OFFSET + vma_attached ? 1 : 0;

Is that better?

>
