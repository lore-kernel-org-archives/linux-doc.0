Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85082192D6B
	for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 19:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005680; cv=none; b=p0Eoyak3SWLhexnJO4cIXdBG+rQIbe8R7zcWgw9MsMVeEa1E0H2mpJ8NlWH9lJpbeVUgrEjwjKIMB7+4EaWd3GPachr7p6BeGuCFqhE2Y06LoiGlgVNYb3XiAxbUNpbf8glZmnK7MTf3bdJIO+JPgRv+YradYcu+E4JFcLL7/7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005680; c=relaxed/simple;
	bh=yqrppdmoYZlgfmU/H/Ybx5EGYmV/mx6a6uHn3J6Btuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShxuRz1qYw82GiqZC4XPQwH0G3eS5+rKZtdjeBhGd4w+crkOSP3SPVztWZvG+RurDOp7TVIJXCTAHHsNuGPx89/g42gj6F6Xi1n9wK5+gWAzRQYgMuMdKFAPNpC6jGVDhNamBnIfg9xmzrrEiSZUiFN0JUCRhWb8lJJ9g9f/ss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZlGzhFlP; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZlGzhFlP"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467896541e1so26971cf.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 11:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738005677; x=1738610477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPtpmhTd13u2F/CmIuromPk6kNHtYBvvGPZ16oBWfeg=;
        b=ZlGzhFlP8Uz7sVWXD4UCoAc35vNVmqPK0dAjc64uVQI6AGj7pWNodLd4CiDy3HPnfD
         slXFfZxD/tFCpZRU1xeuQgj+huHVoNlcrMaih6mhopXgg8ybX3lEgGDq+evrvnxx0f3i
         iUSNHQt0ZDSzc9zK6llrzc3CR//19lhXisUy8GeEAaKy1M/tKhrdPbALbPCkbkh9lO/0
         mV9hhqtAzQf0ThOlWUjPp8RbT4bGxjqOu/hxqx9gKSqX9mfVGzvb86Rj1RG5vjpV/hsa
         LOwNLni4On917xZTk/xQ4prT+gQYnaFLlTF1koNnF5yVgfYnDneE5uPvY9R6aHjSeYIy
         dULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738005677; x=1738610477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPtpmhTd13u2F/CmIuromPk6kNHtYBvvGPZ16oBWfeg=;
        b=Fw0MErdH9vDbLY8dPdLUWFYfv+pdfcfIZIEywdwEGt0cToRIm6rqv6Bib/W35teGQj
         HDlHt4ZC3kctGo1IlS8qnnJoRCcJXL4AN2g+mv+TYyNSnSCucBmx9qQvYMOv08Ya1OBy
         GzA7u2A1Iqnw9L78YAXU9jMOLT4FnS+5new8+6g5vAmSBofY20hr1FEj6m6gkuBD61IA
         tbUET+UuPUILsyO7lGopowPdnp7HRBqA/5nLjrLOhKIja1PuYfkedYgdgw+ne3MqGqbu
         xXOYiy7+/4U85+YhswrWDhWU5+doDA3h0l+qOJh9iy09S+xU1ItiznwzCKzFxOlcG7l4
         Es/w==
X-Forwarded-Encrypted: i=1; AJvYcCWsgDvKfkadb7no8QbAe0hShzrTLgjMTEdCgU0m2abnN/UcL8/5EqlpMwYjzO0oBM5vKCXRXTuwXVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0JYODA27YgHJQdKXjKsLChKYrw8BlxqOHW02xe6nHwV1GC+0Z
	TrRKMn6QBj/TjdSrqVsJQHBeTqTWE12jgHHu+2hooSBqTJwCH4taOpuU4kkCnATBfpOHboS9Z51
	QUdNvqI3KYkig5xFr0H1DM+jUTl0FvNXg3w5k
X-Gm-Gg: ASbGnctLlZofQ4JPRRd1wojVXfhJ/RuFTlS8zYofGRUfusY1+xAX3m8WnrBb05fwXcl
	G/T5LbX8PYxttATMOlPc5L5KddSZTmu9bxhqyQCKWy51RnaPjU8/BzsgWW4UCSQ==
X-Google-Smtp-Source: AGHT+IG31g4nMZEmaEsC2vKAhXoQldOkeBXIX4J+6WUl23p5m6fuaHLtgqA/xBuVVJnDvm2z3aIjIRpLRSMUoCgFPuE=
X-Received: by 2002:ac8:5946:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-46fc57a4079mr53491cf.9.1738005677028; Mon, 27 Jan 2025 11:21:17
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net> <20250115111334.GE8385@noisy.programming.kicks-ass.net>
 <20250115160011.GG8385@noisy.programming.kicks-ass.net> <20250117154135.GA17569@willie-the-truck>
 <20250127140915.GA25672@willie-the-truck>
In-Reply-To: <20250127140915.GA25672@willie-the-truck>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 27 Jan 2025 11:21:06 -0800
X-Gm-Features: AWEUYZnY9D4uQUJ9yQfaVSTdhD2W1HrOehkqc9RLmPRj2cdFEFGW0SrjXOFP0u8
Message-ID: <CAJuCfpFuZt7h3gd5Oih74oC_VsSpt=psSoPoBLJWoSam7TFgPQ@mail.gmail.com>
Subject: Re: [PATCH] refcount: Strengthen inc_not_zero()
To: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, boqun.feng@gmail.com, mark.rutland@arm.com, 
	Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, willy@infradead.org, 
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

On Mon, Jan 27, 2025 at 6:09=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Jan 17, 2025 at 03:41:36PM +0000, Will Deacon wrote:
> > On Wed, Jan 15, 2025 at 05:00:11PM +0100, Peter Zijlstra wrote:
> > > On Wed, Jan 15, 2025 at 12:13:34PM +0100, Peter Zijlstra wrote:
> > >
> > > > Notably, it means refcount_t is entirely unsuitable for anything
> > > > SLAB_TYPESAFE_BY_RCU, since they all will need secondary validation
> > > > conditions after the refcount succeeds.
> > > >
> > > > And this is probably fine, but let me ponder this all a little more=
.
> > >
> > > Even though SLAB_TYPESAFE_BY_RCU is relatively rare, I think we'd bet=
ter
> > > fix this, these things are hard enough as they are.
> > >
> > > Will, others, wdyt?
> >
> > We should also update the Documentation (atomic_t.txt and
> > refcount-vs-atomic.rst) if we strengthen this.
> >
> > > ---
> > > Subject: refcount: Strengthen inc_not_zero()
> > >
> > > For speculative lookups where a successful inc_not_zero() pins the
> > > object, but where we still need to double check if the object acquire=
d
> > > is indeed the one we set out to aquire, needs this validation to happ=
en
> > > *after* the increment.
> > >
> > > Notably SLAB_TYPESAFE_BY_RCU is one such an example.
> > >
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > ---
> > >  include/linux/refcount.h | 15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > > index 35f039ecb272..340e7ffa445e 100644
> > > --- a/include/linux/refcount.h
> > > +++ b/include/linux/refcount.h
> > > @@ -69,9 +69,10 @@
> > >   * its the lock acquire, for RCU/lockless data structures its the de=
pendent
> > >   * load.
> > >   *
> > > - * Do note that inc_not_zero() provides a control dependency which w=
ill order
> > > - * future stores against the inc, this ensures we'll never modify th=
e object
> > > - * if we did not in fact acquire a reference.
> > > + * Do note that inc_not_zero() does provide acquire order, which wil=
l order
> > > + * future load and stores against the inc, this ensures all subseque=
nt accesses
> > > + * are from this object and not anything previously occupying this m=
emory --
> > > + * consider SLAB_TYPESAFE_BY_RCU.
> > >   *
> > >   * The decrements will provide release order, such that all the prio=
r loads and
> > >   * stores will be issued before, it also provides a control dependen=
cy, which
> > > @@ -144,7 +145,7 @@ bool __refcount_add_not_zero(int i, refcount_t *r=
, int *oldp)
> > >     do {
> > >             if (!old)
> > >                     break;
> > > -   } while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> > > +   } while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i));
> >
> > Hmm, do the later memory accesses need to be ordered against the store
> > part of the increment or just the read? If it's the former, then I don'=
t
> > think that _acquire is sufficient -- accesses can still get in-between
> > the read and write parts of the RmW.
>
> I dug some more into this at the end of last week. For the
> SLAB_TYPESAFE_BY_RCU where we're racing inc_not_zero() with
> dec_and_test(), then I think using _acquire() above is correct as the
> later references can only move up into the critical section in the case
> that we successfully obtained a reference.
>
> However, if we're going to make the barriers implicit in the refcount
> operations here then I think we also need to do something on the producer
> side for when the object is re-initialised after being destroyed and
> allocated again. I think that would necessitate release ordering for
> refcount_set() so that whatever allows the consumer to validate the
> object (e.g. sequence number) is published *before* the refcount.

Thanks Will!
I would like to expand on your answer to provide an example of the
race that would happen without release ordering in the producer. To
save reader's time I provide a simplified flow and reasoning first.
More detailed code of what I'm considering a typical
SLAB_TYPESAFE_BY_RCU refcounting example is added at the end of my
reply (Addendum).
Simplified flow looks like this:

consumer:
    obj =3D lookup(collection, key);
    if (!refcount_inc_not_zero(&obj->ref))
        return;
    smp_rmb(); /* Peter's new acquire fence */
    if (READ_ONCE(obj->key) !=3D key) {
        put_ref(obj);
        return;
    }
    use(obj->value);

producer:
    old_key =3D obj->key;
    remove(collection, old_key);
    if (!refcount_dec_and_test(&obj->ref))
        return;
    obj->key =3D KEY_INVALID;
    free(objj);
    ...
    obj =3D malloc(); /* obj is reused */
    obj->key =3D new_key;
    obj->value =3D new_value;
    smp_wmb(); /* Will's proposed release fence */
    refcount_set(obj->ref, 1);
    insert(collection, key, obj);

Let's consider a case when new_key =3D=3D old_key. Will call both of them
"key". Without WIll's proposed fence the following reordering is
possible:

consumer:
    obj =3D lookup(collection, key);

                 producer:
                     key =3D obj->key
                     remove(collection, key);
                     if (!refcount_dec_and_test(&obj->ref))
                         return;
                     obj->key =3D KEY_INVALID;
                     free(objj);
                     obj =3D malloc(); /* obj is reused */
                     refcount_set(obj->ref, 1);
                     obj->key =3D key; /* same key */

    if (!refcount_inc_not_zero(&obj->ref))
        return;
    smp_rmb();
    if (READ_ONCE(obj->key) !=3D key) {
        put_ref(obj);
        return;
    }
    use(obj->value);

                     obj->value =3D new_value; /* reordered store */
                     add(collection, key, obj);

So, the consumer finds the old object, successfully takes a refcount
and validates the key. It succeeds because the object is allocated and
has the same key, which is fine. However it proceeds to use stale
obj->value. Will's proposed release ordering would prevent that.

The example in https://elixir.bootlin.com/linux/v6.12.6/source/include/linu=
x/slab.h#L102
omits all these ordering issues for SLAB_TYPESAFE_BY_RCU.
I think it would be better to introduce two new functions:
refcount_add_not_zero_acquire() and refcount_set_release(), clearly
document that they should be used when a freed object can be recycled
and reused, like in SLAB_TYPESAFE_BY_RCU case. refcount_set_release()
should also clarify that once it's called, the object can be accessed
by consumers even if it was not added yet into the collection used for
object lookup (like in the example above). SLAB_TYPESAFE_BY_RCU
comment at https://elixir.bootlin.com/linux/v6.12.6/source/include/linux/sl=
ab.h#L102
then can explicitly use these new functions in the example code,
further clarifying their purpose and proper use.
WDYT?

ADDENDUM.
Detailed code for typical use of refcounting with SLAB_TYPESAFE_BY_RCU:

struct object {
    refcount_t ref;
    u64 key;
    u64 value;
};

void init(struct object *obj, u64 key, u64 value)
{
    obj->key =3D key;
    obj->value =3D value;
    smp_wmb(); /* Will's proposed release fence */
    refcount_set(obj->ref, 1);
}

bool get_ref(struct object *obj, u64 key)
{
    if (!refcount_inc_not_zero(&obj->ref))
        return false;
    smp_rmb(); /* Peter's new acquire fence */
    if (READ_ONCE(obj->key) !=3D key) {
        put_ref(obj);
        return false;
    }
    return true;
}

void put_ref(struct object *obj)
{
    if (!refcount_dec_and_test(&obj->ref))
        return;
    obj->key =3D KEY_INVALID;
    free(obj);
}

consumer:
    obj =3D lookup(collection, key);
    if (!get_ref(obj, key)
        return;
    use(obj->value);

producer:
    remove(collection, old_obj->key);
    put_ref(old_obj);
    new_obj =3D malloc();
    init(new_obj, new_key, new_value);
    insert(collection, new_key, new_obj);

With SLAB_TYPESAFE_BY_RCU old_obj in the producer can be reused and be
equal to new_obj.


>
> Will
