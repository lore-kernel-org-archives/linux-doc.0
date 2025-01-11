Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2E1917EE
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736626503; cv=none; b=HfTKpDkHFJh5onq0CYUxF1vhwjlRyVyumgUopqdqVXPomFPxFgV/SUA79JzSgXV56g5vxtZwJ9djP2OOxlycFbPosLxdVXK1mBwdjUfoGiZcO3hXFR6g5h+30o+oJx+PG/Y2MB7BpFQGDs2bdu3bnbpjZBuAixDkSV9Gt1wMAbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736626503; c=relaxed/simple;
	bh=x047Dp9XGoq7JB9hEAADA52qGtju+JI5uJRdiMiIlhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bx4xTKrzDt2wR/P4QpH3Th+AWQImqgtzQ0LGNjIWyIljMBmw+fmbu7vzOPlaUI55ZRFBGqDahAljppMXC0n5gjHTWMaclETLMg012JAeSMGfzFFruL5QhFbXcinbKRZ6mZdPbuzDP3Xh24aLWtqZyCCd2W6UJf7tU0CjzyV5zEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N3NzWCcY; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3NzWCcY"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467abce2ef9so181801cf.0
        for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 12:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736626499; x=1737231299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jnz9ncr5hFfetUylxzngbgj19VfI0erfup149Nu0s5s=;
        b=N3NzWCcYaJa/p+rZH79+xJ6tOKbUb+e5nBAypy6f8yKuuVJxYY6cSAlIEyaFsYP9Yd
         mCyWafZjY3z/8bAmBekkJx/W1M1klSem6ToNbpAlkzTlBPdggZvyxEALdo8dKh1sW7GG
         cba4ejj3mFtVD+sGANhV+D4iQ7ALgBw/J1MOka8ZJYnON+8elUzKn4lFlCSp+3lSlFPZ
         wgEi5QpYlUpx3NG5VuaXVE27wMyo9bcQCi5evyTl92L6xUXHc2TMTplMugD7zoimiy+N
         fkw6qv/v8f1wQBKpZEr/jaE6f3X/aJmUMSEwcqJHHvNLG1Vjge5NVWrT1Ur2FQQ/yRwM
         bIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736626499; x=1737231299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jnz9ncr5hFfetUylxzngbgj19VfI0erfup149Nu0s5s=;
        b=eJ7u5O/wOypx2KLMAvdSKfeLfTYaUDrcxD79/sgO/0U0jLA8NqEorNnzRPUp5P8S6P
         fJHA0uuycZBCE4Gl91QWOcmGwSk87GxkpFqWmW2MUA0o92GeAzxgbHqdF3/jXupDmmJm
         U0hknrKehsfx0UIzVfxrn1giyhG39w1oR8bNHnjKDD2HaDSBL8d2Z0hwE6N0JUqrva5I
         McaQdjSSWZwlXE2HwsvwdmfBbfWNHDe+eIIEQlVbJY8oIWTTNDbamxfsXCD/S3wQxSly
         b9nheB6iI+RfFAp4HtTyHYFhdCuQzNWRNUThN7prx7xn/gPzstaHGr8x4EEphvYBZTB9
         5zcA==
X-Forwarded-Encrypted: i=1; AJvYcCXmpb1BpIIJ6W7fSBe9ZvvA/iQK94fxoKHrNQWDHfcAnXXHYKBRcLyI35fCR0zPvAboVtAYku8nnC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypx/cVV72v3WRYhD6eI+tiPR2I48Uv5a43dz32YI1+xO27sYeN
	MUf/+Hhsf9K2yUqq3qz+n039dKf98okbYt1YhvjC9LS/x0a3nuqRELO/vF9UtOopL9LjtIHk54M
	y345bvjFwkOjQa0JlpGaoJ+JRVFpwax7+66/R
X-Gm-Gg: ASbGncsC1fQ3WhOIq3eShrgfJgVXbQXH9QtcgsS0YO+LF5rnafUoomQkK/ta8V2RqyK
	xxzSkb3Lk0e3ukJ/9XsYn48pGs9/e5Ay0aImsfg==
X-Google-Smtp-Source: AGHT+IHdYLrprK280yzWtK34/z0njKXtISm1/ZljVlOFh7P37PL0KLGH0XZKrteej0pcMPJj16AVNg0b7cr99QKotJ4=
X-Received: by 2002:a05:622a:148d:b0:463:6fc7:e7cb with SMTP id
 d75a77b69052e-46c89daa62fmr6117981cf.11.1736626498762; Sat, 11 Jan 2025
 12:14:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
In-Reply-To: <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 11 Jan 2025 12:14:47 -0800
X-Gm-Features: AbW1kvamZVh2BNeMDT1ok9i_wekAhELF8iiYuS77TpcEBLiR04KbLfJcROKThTM
Message-ID: <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
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

On Sat, Jan 11, 2025 at 3:24=E2=80=AFAM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
>
> So there were quite a few iterations of the patch and I have not been
> reading majority of the feedback, so it may be I missed something,
> apologies upfront. :)
>
> >  /*
> >   * Try to read-lock a vma. The function is allowed to occasionally yie=
ld false
> >   * locked result to avoid performance overhead, in which case we fall =
back to
> > @@ -710,6 +742,8 @@ static inline void vma_lock_init(struct vm_area_str=
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
> > @@ -720,13 +754,19 @@ static inline bool vma_start_read(struct vm_area_=
struct *vma)
> >       if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->mm_l=
ock_seq.sequence))
> >               return false;
> >
> > -     if (unlikely(down_read_trylock(&vma->vm_lock.lock) =3D=3D 0))
> > +     /*
> > +      * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() w=
ill fail
> > +      * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> > +      */
> > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &o=
ldcnt,
> > +                                                   VMA_REF_LIMIT)))
> >               return false;
> >
>
> Replacing down_read_trylock() with the new routine loses an acquire
> fence. That alone is not a problem, but see below.

Hmm. I think this acquire fence is actually necessary. We don't want
the later vm_lock_seq check to be reordered and happen before we take
the refcount. Otherwise this might happen:

reader             writer
if (vm_lock_seq =3D=3D mm_lock_seq) // check got reordered
        return false;
                       vm_refcnt +=3D VMA_LOCK_OFFSET
                       vm_lock_seq =3D=3D mm_lock_seq
                       vm_refcnt -=3D VMA_LOCK_OFFSET
if (!__refcount_inc_not_zero_limited())
        return false;

Both reader's checks will pass and the reader would read-lock a vma
that was write-locked.

>
> > +     rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
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
> > @@ -735,9 +775,10 @@ static inline bool vma_start_read(struct vm_area_s=
truct *vma)
> >        * This pairs with RELEASE semantics in vma_end_write_all().
> >        */
> >       if (unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->vm_m=
m->mm_lock_seq))) {
>
> The previous modification of this spot to raw_read_seqcount loses the
> acquire fence, making the above comment not line up with the code.

Is it? From reading the seqcount code
(https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/seqlock.h#=
L211):

raw_read_seqcount()
    seqprop_sequence()
        __seqprop(s, sequence)
            __seqprop_sequence()
                smp_load_acquire()

smp_load_acquire() still provides the acquire fence. Am I missing something=
?

>
> I don't know if the stock code (with down_read_trylock()) is correct as
> is -- looks fine for cursory reading fwiw. However, if it indeed works,
> the acquire fence stemming from the lock routine is a mandatory part of
> it afaics.
>
> I think the best way forward is to add a new refcount routine which
> ships with an acquire fence.

I plan on replacing refcount_t usage here with an atomic since, as
Hillf noted, refcount is not designed to be used for locking. And will
make sure the down_read_trylock() replacement will provide an acquire
fence.

>
> Otherwise I would suggest:
> 1. a comment above __refcount_inc_not_zero_limited saying there is an
>    acq fence issued later
> 2. smp_rmb() slapped between that and seq accesses
>
> If the now removed fence is somehow not needed, I think a comment
> explaining it is necessary.
>
> > @@ -813,36 +856,33 @@ static inline void vma_assert_write_locked(struct=
 vm_area_struct *vma)
> >
> >  static inline void vma_assert_locked(struct vm_area_struct *vma)
> >  {
> > -     if (!rwsem_is_locked(&vma->vm_lock.lock))
> > +     if (refcount_read(&vma->vm_refcnt) <=3D 1)
> >               vma_assert_write_locked(vma);
> >  }
> >
>
> This now forces the compiler to emit a load from vm_refcnt even if
> vma_assert_write_locked expands to nothing. iow this wants to hide
> behind the same stuff as vma_assert_write_locked.

True. I guess I'll have to avoid using vma_assert_write_locked() like this:

static inline void vma_assert_locked(struct vm_area_struct *vma)
{
        unsigned int mm_lock_seq;

        VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <=3D 1 &&
                                          !__is_vma_write_locked(vma,
&mm_lock_seq), vma);
}

Will make the change.

Thanks for the feedback!
