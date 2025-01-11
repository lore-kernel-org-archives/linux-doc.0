Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FAA15C14B
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 20:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736626606; cv=none; b=W9pLPhgcU2vWFRoROsd/DOgWoAg59ReR7uoZqvNqLRKVJeP1UonG1NUmGRhts5ttjIpi/Af1ttSp4D90lTvM5dTE0s9xc6wcGZruiLNamwhSqFbn750V6LanCsSLNdrJ5vB3vd0wGme0ffKOUhX6GvCyhk3yXio5qHCRt4ZQ2c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736626606; c=relaxed/simple;
	bh=h9jow/xWMYYCbUIEVCT2Old2BUNUCOovcjuJHSANp+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rW+ysCnF1yx1JLna5/y+aGB1KyH9/gPv4c8R94pZx8N1AQR1woA655VwS2hbPIHZqB053dzkiE4KtQf6D2OJJJheuj1Lh6BKxhVHvi/JmJkzmOe2/rk1pRu0BdonMQoTuuG609bKdH3648Hox894OplTXc1RxdqnWINOTxGvDVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e9x5+0di; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e9x5+0di"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4679b5c66d0so76481cf.1
        for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 12:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736626603; x=1737231403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPliOu4wmquCrykh16+WHroOJnf657+LJmEsYzkugJQ=;
        b=e9x5+0diNOsf7iyIdvpuKpkq5Zj8pPbRp6Dqa0IuEH4yvBYjsX7fggz6sD8XEaMmRn
         g6/Ea28K8dRbxFZTDDXfIFY6P1dMLv4XqC6ICX1BADsp0hVIRjfR8iasaCcaoo/JfYRM
         mdsuWSYkBwPBpRHMKAeCFFNhBNIZbl4lO44KepOkmgXcCi9GySzeYM29J13yKfJz5i8w
         LLetnVtZUIRjXQCxMqtvlAVW+WXuhvIIkfjdJQQqg5VvS6tJ2Fpbv/DzmPcpmfJW8WcW
         ZWFsgSz1S1YZH997EVYKBpr5lFGfxIv+5gGiPclSdH/HcZ13WZmeVyqcC1s9rRYzNMHv
         kl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736626603; x=1737231403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPliOu4wmquCrykh16+WHroOJnf657+LJmEsYzkugJQ=;
        b=n0pXuljvYb+2H8pkGZVcdzG3ZN4xHi2YmK1800+OFfkfCeeDL5gx0W71fCf36AOCBa
         HTOcl5v0dUbXozpFpBAP6y8f1H410bLP/NYtNJWhT2Dpx5vReXZ8x7JVmPPQO93bVa5+
         nmGd82dNjOJGsGN7aQaKFnycSF3Z8XzELMirwjZJRytE3nkVp2sStRTYu5XYYykGJrQE
         rofWxg/xDCZrYNRwSEJF9ciV13QUJpF+hWAWbFH0AfOf3mUyH2K/lvRJuimfzckwHTbY
         ROXur5aMDQoiwXjJQSxX55OvQnH5/7CD4tqJvI83KyufEbiPqkmh13JHFucORc4nm/i9
         2BmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU180ESdeO1r5jtFlssMPtkJhRa0N/5f1jD4HtvKbMb8/CJNBLTKx688PJBu4NsqY8GIb7fdv54WOM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlovp7IMxOODzBFVsF4JnHEYWIVSxZKAl179HbpPkH9nbD4lvj
	l4BdSs9wyWLi8fYwHr1xDnJQJMr82T/1bSLcYFZkih6WMaI3zpPOAkHDpOW3LG2bdBCjElMg55J
	SWucTbg9JIEME31w5oM+kPZWnLD1AVBJOURRr
X-Gm-Gg: ASbGnct7OfL1G9esSuH0TsCpPc5151fPeCHBcBicvVSA+BT4hI5NuhrFcEORy72aLel
	yeFn4Gkx2WJKki1cwUEPBqK0slRIIiXFNZQVE9Q==
X-Google-Smtp-Source: AGHT+IHOqK4Arf1s1LLHb8+kpeakurQlQs+3i64GvQBcCOBGd2C9GaBwg4+K4xNxlGQm1zZY4Cwu3FvoRVEWtrcbtI4=
X-Received: by 2002:ac8:58c1:0:b0:466:a11c:cad2 with SMTP id
 d75a77b69052e-46c89dad58bmr5934061cf.7.1736626603098; Sat, 11 Jan 2025
 12:16:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft> <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
In-Reply-To: <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 11 Jan 2025 12:16:32 -0800
X-Gm-Features: AbW1kvbdd4oYZGo07AKqf7hBdHNqAiydZPzBGmAoqnh4-jWcEUgpWTdVgKkN6k4
Message-ID: <CAJuCfpFTH0vR2O0TagoVr=XL0AFmh-CmBHdyo=aRuaKt12=CeQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 12:14=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Sat, Jan 11, 2025 at 3:24=E2=80=AFAM Mateusz Guzik <mjguzik@gmail.com>=
 wrote:
> >
> > On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> >
> > So there were quite a few iterations of the patch and I have not been
> > reading majority of the feedback, so it may be I missed something,
> > apologies upfront. :)
> >
> > >  /*
> > >   * Try to read-lock a vma. The function is allowed to occasionally y=
ield false
> > >   * locked result to avoid performance overhead, in which case we fal=
l back to
> > > @@ -710,6 +742,8 @@ static inline void vma_lock_init(struct vm_area_s=
truct *vma)
> > >   */
> > >  static inline bool vma_start_read(struct vm_area_struct *vma)
> > >  {
> > > +     int oldcnt;
> > > +
> > >       /*
> > >        * Check before locking. A race might cause false locked result=
.
> > >        * We can use READ_ONCE() for the mm_lock_seq here, and don't n=
eed
> > > @@ -720,13 +754,19 @@ static inline bool vma_start_read(struct vm_are=
a_struct *vma)
> > >       if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->mm=
_lock_seq.sequence))
> > >               return false;
> > >
> > > -     if (unlikely(down_read_trylock(&vma->vm_lock.lock) =3D=3D 0))
> > > +     /*
> > > +      * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited()=
 will fail
> > > +      * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> > > +      */
> > > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, =
&oldcnt,
> > > +                                                   VMA_REF_LIMIT)))
> > >               return false;
> > >
> >
> > Replacing down_read_trylock() with the new routine loses an acquire
> > fence. That alone is not a problem, but see below.
>
> Hmm. I think this acquire fence is actually necessary. We don't want
> the later vm_lock_seq check to be reordered and happen before we take
> the refcount. Otherwise this might happen:
>
> reader             writer
> if (vm_lock_seq =3D=3D mm_lock_seq) // check got reordered
>         return false;
>                        vm_refcnt +=3D VMA_LOCK_OFFSET
>                        vm_lock_seq =3D=3D mm_lock_seq

s/vm_lock_seq =3D=3D mm_lock_seq/vm_lock_seq =3D mm_lock_seq

>                        vm_refcnt -=3D VMA_LOCK_OFFSET
> if (!__refcount_inc_not_zero_limited())
>         return false;
>
> Both reader's checks will pass and the reader would read-lock a vma
> that was write-locked.
>
> >
> > > +     rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> > >       /*
> > > -      * Overflow might produce false locked result.
> > > +      * Overflow of vm_lock_seq/mm_lock_seq might produce false lock=
ed result.
> > >        * False unlocked result is impossible because we modify and ch=
eck
> > > -      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lo=
ck_seq
> > > +      * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_=
lock_seq
> > >        * modification invalidates all existing locks.
> > >        *
> > >        * We must use ACQUIRE semantics for the mm_lock_seq so that if=
 we are
> > > @@ -735,9 +775,10 @@ static inline bool vma_start_read(struct vm_area=
_struct *vma)
> > >        * This pairs with RELEASE semantics in vma_end_write_all().
> > >        */
> > >       if (unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->vm=
_mm->mm_lock_seq))) {
> >
> > The previous modification of this spot to raw_read_seqcount loses the
> > acquire fence, making the above comment not line up with the code.
>
> Is it? From reading the seqcount code
> (https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/seqlock.=
h#L211):
>
> raw_read_seqcount()
>     seqprop_sequence()
>         __seqprop(s, sequence)
>             __seqprop_sequence()
>                 smp_load_acquire()
>
> smp_load_acquire() still provides the acquire fence. Am I missing somethi=
ng?
>
> >
> > I don't know if the stock code (with down_read_trylock()) is correct as
> > is -- looks fine for cursory reading fwiw. However, if it indeed works,
> > the acquire fence stemming from the lock routine is a mandatory part of
> > it afaics.
> >
> > I think the best way forward is to add a new refcount routine which
> > ships with an acquire fence.
>
> I plan on replacing refcount_t usage here with an atomic since, as
> Hillf noted, refcount is not designed to be used for locking. And will
> make sure the down_read_trylock() replacement will provide an acquire
> fence.
>
> >
> > Otherwise I would suggest:
> > 1. a comment above __refcount_inc_not_zero_limited saying there is an
> >    acq fence issued later
> > 2. smp_rmb() slapped between that and seq accesses
> >
> > If the now removed fence is somehow not needed, I think a comment
> > explaining it is necessary.
> >
> > > @@ -813,36 +856,33 @@ static inline void vma_assert_write_locked(stru=
ct vm_area_struct *vma)
> > >
> > >  static inline void vma_assert_locked(struct vm_area_struct *vma)
> > >  {
> > > -     if (!rwsem_is_locked(&vma->vm_lock.lock))
> > > +     if (refcount_read(&vma->vm_refcnt) <=3D 1)
> > >               vma_assert_write_locked(vma);
> > >  }
> > >
> >
> > This now forces the compiler to emit a load from vm_refcnt even if
> > vma_assert_write_locked expands to nothing. iow this wants to hide
> > behind the same stuff as vma_assert_write_locked.
>
> True. I guess I'll have to avoid using vma_assert_write_locked() like thi=
s:
>
> static inline void vma_assert_locked(struct vm_area_struct *vma)
> {
>         unsigned int mm_lock_seq;
>
>         VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <=3D 1 &&
>                                           !__is_vma_write_locked(vma,
> &mm_lock_seq), vma);
> }
>
> Will make the change.
>
> Thanks for the feedback!
