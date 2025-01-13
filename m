Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0CB1F8F18
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736802523; cv=none; b=mvPzsvQmwZmgXEtGREkYnfVnu0JMY27nqoit4cZA4uqJnhoaVqTiwyhW9OeRXdUJsXWLdjbJYQLAZAYpgAPI+j9ul6irgL7G7gCiBNThsbR9QH/PVn4MMb3Y6bvNdF6rpTg8EDOkl1F2qBsEXzYRr6pStQ3oUDa2Cm0LWuGkVlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736802523; c=relaxed/simple;
	bh=MBGlhDhnhjPa0tsPVQDHSBXSHkL3LByiEJDAXpwxRco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdqJjidXujwVIzviVTI+sbAMoIZIbaZElX3sGpUdza3opExaHDydksboQPTFbEg59H0KCpvEmzW6CcifkfTGKioyMsj9k2CtsshZwv1Fy6Yuc9ud/Yn+E3BfwkmaWVlNZ/kPmt8TmWjHDZqD1Q5A8iUU6RDIpECajgXTuBIrH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kh1lVA0c; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kh1lVA0c"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4679b5c66d0so5071cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 13:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736802520; x=1737407320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wu/nG6orYg47gQ+AqOtZPPOYCw8QfPvh5WeBFkmFbCc=;
        b=kh1lVA0cQVOAqS5vf9FUALHxtEkTORAwaxerV2Hx05gLjx5EzG+EcEle/S5V0M3KwB
         Q66g3A4tfT5UpMhM/2s77KS9sc7t446MIcBqSUMHZtcFEkJII5JkoQkY7YkZMzYMkrmP
         0+cob8Yqj3mDCoXLNEQI+ajzkr958YXUJMLwzFbX7OkCG4DtemSWQjZE4dVzbpdZ1+R+
         fS21CbW5rK9mdsEVPJ/HHzUR+MdAMDmcl53um9o6l3iWz61kqw1hA0bw17+BwqPbbfDs
         Jr4GeRy0Ic8kegLcuUh458E7zPMdRrzrs2eWBL11O1meACo7FFzll0TQ91RSoJBGrX3V
         phNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736802520; x=1737407320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wu/nG6orYg47gQ+AqOtZPPOYCw8QfPvh5WeBFkmFbCc=;
        b=XLjlKHaNSV/2Hvu3Tee7nKSOl10DaDVbTlRp8UUJbtsA188aljAiyWvFnOjDVMgkZu
         lmuIapFeiqnZuTw2h/lecj8Q8o6hoXK67aAY8KHVtTa+wF1DXqudaVX+TwI7jkfObFsA
         sgVXe0Bac1meVwSzCRHbZk1+XsMNVdZa6CxgC406RlBfAlRYEvWEM5rShspBiFTkdIrE
         6BhMTrRaEJ7Z6/L7rI3Kfiy7d2+oycAfWHco/LdeXSAy8+cdMyD5AOFZuZDeJ8ruGm6r
         Bu0TBzvq3ncXso9/HwIFjXymHB8jUvr4Bdt3gXaqi7IhECTS3j3wAQTEXlSHng9AldGQ
         X9uA==
X-Forwarded-Encrypted: i=1; AJvYcCW9dmt6yOBsIWtf0cjr753It0PqQ7MwHPaBih6+pFve6TIEyHBiZ36A1rxxYFeJBF7+CWMkUWmKxWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPGnHKAKr6NNDJ1jRrsmyzndUj0XtNQXREmGjoueBOnxumwcZF
	osuxsmNFT+ndar0zUSaiSi+OYK/1MLsTcSnDH23RuSeB08R38yD8X5ZSAqWSD+POi95HeatTWuJ
	MmgCiZ/1e0mQH1+ialyFHNhrlWmDJedQyE5rT
X-Gm-Gg: ASbGncuzZ6CoU40VHJczTShRAL0cm6r+xNgMN6jhZF9lqhskyIXZTv9ty2gukd8q1q8
	YSCQqu25r0hBvmamcatWXVOxFlzVVGlg/cWDrfA==
X-Google-Smtp-Source: AGHT+IGe7S1/aB4dFspMIFJVlQNEFLRUC7b1lRSOyvwJKhMCo1+Ol6kucHZ6LetMmLESzC/RseERgXBBIFgeH+0xsh4=
X-Received: by 2002:ac8:5acd:0:b0:466:9660:18a2 with SMTP id
 d75a77b69052e-46de96eac52mr598091cf.16.1736802519806; Mon, 13 Jan 2025
 13:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com> <20250113014729.ms5sdfnhynlamgrk@master>
In-Reply-To: <20250113014729.ms5sdfnhynlamgrk@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 13:08:28 -0800
X-Gm-Features: AbW1kvZoBMx33p2ZfPu8c19JCyuLeA_eoFBFTur6_G3RyvhowsY0pclQkJ14OQs
Message-ID: <CAJuCfpEHEYKhpf7n6nQuB=s_okV=uQZ37OhWfki+iHgwxUmUHw@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 5:47=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Sat, Jan 11, 2025 at 12:14:47PM -0800, Suren Baghdasaryan wrote:
> >On Sat, Jan 11, 2025 at 3:24=E2=80=AFAM Mateusz Guzik <mjguzik@gmail.com=
> wrote:
> >>
> >> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> >>
> >> So there were quite a few iterations of the patch and I have not been
> >> reading majority of the feedback, so it may be I missed something,
> >> apologies upfront. :)
> >>
>
> Hi, I am new to memory barriers. Hope not bothering.
>
> >> >  /*
> >> >   * Try to read-lock a vma. The function is allowed to occasionally =
yield false
> >> >   * locked result to avoid performance overhead, in which case we fa=
ll back to
> >> > @@ -710,6 +742,8 @@ static inline void vma_lock_init(struct vm_area_=
struct *vma)
> >> >   */
> >> >  static inline bool vma_start_read(struct vm_area_struct *vma)
> >> >  {
> >> > +     int oldcnt;
> >> > +
> >> >       /*
> >> >        * Check before locking. A race might cause false locked resul=
t.
> >> >        * We can use READ_ONCE() for the mm_lock_seq here, and don't =
need
> >> > @@ -720,13 +754,19 @@ static inline bool vma_start_read(struct vm_ar=
ea_struct *vma)
> >> >       if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->m=
m_lock_seq.sequence))
> >> >               return false;
> >> >
> >> > -     if (unlikely(down_read_trylock(&vma->vm_lock.lock) =3D=3D 0))
> >> > +     /*
> >> > +      * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited(=
) will fail
> >> > +      * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> >> > +      */
> >> > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt,=
 &oldcnt,
> >> > +                                                   VMA_REF_LIMIT)))
> >> >               return false;
> >> >
> >>
> >> Replacing down_read_trylock() with the new routine loses an acquire
> >> fence. That alone is not a problem, but see below.
> >
> >Hmm. I think this acquire fence is actually necessary. We don't want
> >the later vm_lock_seq check to be reordered and happen before we take
> >the refcount. Otherwise this might happen:
> >
> >reader             writer
> >if (vm_lock_seq =3D=3D mm_lock_seq) // check got reordered
> >        return false;
> >                       vm_refcnt +=3D VMA_LOCK_OFFSET
> >                       vm_lock_seq =3D=3D mm_lock_seq
> >                       vm_refcnt -=3D VMA_LOCK_OFFSET
> >if (!__refcount_inc_not_zero_limited())
> >        return false;
> >
> >Both reader's checks will pass and the reader would read-lock a vma
> >that was write-locked.
> >
>
> Here what we plan to do is define __refcount_inc_not_zero_limited() with
> acquire fence, e.g. with atomic_try_cmpxchg_acquire(), right?

Correct. __refcount_inc_not_zero_limited() does not do that in this
version but I'll fix that.

>
> >>
> >> > +     rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> >> >       /*
> >> > -      * Overflow might produce false locked result.
> >> > +      * Overflow of vm_lock_seq/mm_lock_seq might produce false loc=
ked result.
> >> >        * False unlocked result is impossible because we modify and c=
heck
> >> > -      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_l=
ock_seq
> >> > +      * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm=
_lock_seq
> >> >        * modification invalidates all existing locks.
> >> >        *
> >> >        * We must use ACQUIRE semantics for the mm_lock_seq so that i=
f we are
> >> > @@ -735,9 +775,10 @@ static inline bool vma_start_read(struct vm_are=
a_struct *vma)
> >> >        * This pairs with RELEASE semantics in vma_end_write_all().
> >> >        */
> >> >       if (unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->v=
m_mm->mm_lock_seq))) {
>
> One question here is would compiler optimize the read of vm_lock_seq here=
,
> since we have read it at the beginning?
>
> Or with the acquire fence added above, compiler won't optimize it.

Correct. See "ACQUIRE operations" section in
https://www.kernel.org/doc/Documentation/memory-barriers.txt,
specifically this: "It guarantees that all memory operations after the
ACQUIRE operation will appear to happen after the ACQUIRE operation
with respect to the other components of the system.".

> Or we should use REACE_ONCE(vma->vm_lock_seq) here?
>
> >>
> >> The previous modification of this spot to raw_read_seqcount loses the
> >> acquire fence, making the above comment not line up with the code.
> >
> >Is it? From reading the seqcount code
> >(https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/seqlock=
.h#L211):
> >
> >raw_read_seqcount()
> >    seqprop_sequence()
> >        __seqprop(s, sequence)
> >            __seqprop_sequence()
> >                smp_load_acquire()
> >
> >smp_load_acquire() still provides the acquire fence. Am I missing someth=
ing?
> >
> >>
> >> I don't know if the stock code (with down_read_trylock()) is correct a=
s
> >> is -- looks fine for cursory reading fwiw. However, if it indeed works=
,
> >> the acquire fence stemming from the lock routine is a mandatory part o=
f
> >> it afaics.
> >>
> >> I think the best way forward is to add a new refcount routine which
> >> ships with an acquire fence.
> >
> >I plan on replacing refcount_t usage here with an atomic since, as
> >Hillf noted, refcount is not designed to be used for locking. And will
> >make sure the down_read_trylock() replacement will provide an acquire
> >fence.
> >
>
> Hmm.. refcount_t is defined with atomic_t. I am lost why replacing refcou=
nt_t
> with atomic_t would help.

My point is that refcount_t is not designed for locking, so changing
refcount-related functions and adding fences there would be wrong. So,
I'll move to using more generic atomic_t and will implement the
functionality I need without affecting refcounting functions.

>
> >>
> >> Otherwise I would suggest:
> >> 1. a comment above __refcount_inc_not_zero_limited saying there is an
> >>    acq fence issued later
> >> 2. smp_rmb() slapped between that and seq accesses
> >>
> >> If the now removed fence is somehow not needed, I think a comment
> >> explaining it is necessary.
> >>
> >> > @@ -813,36 +856,33 @@ static inline void vma_assert_write_locked(str=
uct vm_area_struct *vma)
> >> >
> >> >  static inline void vma_assert_locked(struct vm_area_struct *vma)
> >> >  {
> >> > -     if (!rwsem_is_locked(&vma->vm_lock.lock))
> >> > +     if (refcount_read(&vma->vm_refcnt) <=3D 1)
> >> >               vma_assert_write_locked(vma);
> >> >  }
> >> >
> >>
> >> This now forces the compiler to emit a load from vm_refcnt even if
> >> vma_assert_write_locked expands to nothing. iow this wants to hide
> >> behind the same stuff as vma_assert_write_locked.
> >
> >True. I guess I'll have to avoid using vma_assert_write_locked() like th=
is:
> >
> >static inline void vma_assert_locked(struct vm_area_struct *vma)
> >{
> >        unsigned int mm_lock_seq;
> >
> >        VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <=3D 1 &&
> >                                          !__is_vma_write_locked(vma,
> >&mm_lock_seq), vma);
> >}
> >
> >Will make the change.
> >
> >Thanks for the feedback!
>
> --
> Wei Yang
> Help you, Help me
