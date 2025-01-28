Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867BD5672
	for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 23:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738108281; cv=none; b=iq8c75SiqL5KMactAhGS0ydpkUaPt24Z16005XKH2/yF1sJtsB75hVyIinEtVt2RcJv5vu1B+U6EEsH1AsJ9yN4zpHeCrIx22LEbTi0/1qk4qEDSPNhLFk6/wpbouPr/W8/1qprMQIPwvpdW0R43/X7ybrBWe2mvkoD1bFA0mgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738108281; c=relaxed/simple;
	bh=l9l4Vs1I5nMaMnkwv9OHMD9M9DVTjbve/z4VgTV8ez8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj2o5kcT+Pe7o1YR7BvsjjiL7Aa1VdKzx48yxQ2hKB3EABUJUHQI+RjkyTR9cJSy8rE+tig3Qgt20uUx3mH+XG9jnO1bGBqcsKC4L1MdCSQ64QjVAplsTkck87ezGt/Ai/WGOPrlUXHmqhujHdWRbiHe45Fmm2RMKKsu2yi2xbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UVPItORQ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UVPItORQ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4678c9310afso376811cf.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 15:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738108278; x=1738713078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl4Kh1XmXL6YLYN/cMAp2FCU6rLrvAZ6GRS31Vuy+jM=;
        b=UVPItORQx0inCM8HHYzWhiOMPmbQJ/OWl7hmv5a1uo9BkYrlF4DCiPlfOItjE/43eg
         tVYe3ufB+rNM0xK+vuhXg2GAGCNTjQC6VVFEpeYRJNkvfWTRaRLoxocN6D1axjSR4GIt
         9AfzX5HuSceVhM3YUKfrP7zDRKZSceraD0tMpzgvBYDpVuZR2QDh6xxlXYfkDLhG4k30
         XV0nJPz4wZXlrnQcDlxe+dgKYSr0NU5hapk8L0O6X18boxHxCEAgQlpP31KsdwHQ5ERp
         kkg8J0LX4dqZHzMEP7bYuB9sgaVR+6ZO7mxROii9S+X4IDmTxqyOyHPFQ8R93BD5C8XF
         Bl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738108278; x=1738713078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kl4Kh1XmXL6YLYN/cMAp2FCU6rLrvAZ6GRS31Vuy+jM=;
        b=p597hyHAKVb4G5jqWzwnCHkDcLaXSWs9C4I51Oe+mBMxqaNLxdLFqXPA45LfBfPu5s
         NMYIqUhS8pKLIfIqA4RaGvh09pKe2qEQbPJmSm6bsOMfIUjFrWvkKJBmfjQhp2oFHT4K
         D97LIxywCp6EIewrP58HXGJRNQ8y5tlDJqNCXOPPCx8umLgOPSuklT/lrIf4mqDITpW4
         Q+Mii74JMoqAWNEX7QuXUVnxmMtLGcRg94qJ/XquRcJLKPYcZzIGaHWk98S6xMkaR9oL
         2Umvbo8Q3MKkDhVRusXcz8TwvV5pkekNEQFp6hR5/5EC9xTG8K6bMBQiAhuwk+nOLb9/
         spsA==
X-Forwarded-Encrypted: i=1; AJvYcCXk7LyjIZrxw4lpJ0gADJl7SR13pn0W4+TYicV2OnEAY+WlkwcZjxEH08h17Z56VjC8xSrcEe32Nmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKP/+H80HFZ9KMLX4SqLjXRs8X+99faPsIxXIvEObNR1YbXWpJ
	X9H5hxFIzZkaMq1gx6lJhgmCFZHgPEFMq3PgCLSQ5HZlrUG9MnUOKWfbj9Z+H5y2gITzMIK0ePt
	KZ/KpM4fIoIoye03fiA5hhvix+/3DQZGcn8my
X-Gm-Gg: ASbGncunn0quMS1vPT/n1lYMebk/A1497HajGmYJYgxQKrqoB04gyd0KkgaVc5cmmph
	3dVz1WiZXdxHfn169p8VL6R5eEn84gycpmJ7MclRIdPOWV44+Q4gj8nd2IrrtTSKrHjRZhHBT
X-Google-Smtp-Source: AGHT+IH75aBnT6Rb5gLzj/2/ikYOgCcFQHvEjwTDW/1OZF7lwMWzYt15uQ15SgABltSFxq/hMYcIs8PtixQIGV+891k=
X-Received: by 2002:ac8:5d0a:0:b0:467:82de:d949 with SMTP id
 d75a77b69052e-46fd11dae2fmr1298441cf.12.1738108278050; Tue, 28 Jan 2025
 15:51:18 -0800 (PST)
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
 <20250127140915.GA25672@willie-the-truck> <CAJuCfpFuZt7h3gd5Oih74oC_VsSpt=psSoPoBLJWoSam7TFgPQ@mail.gmail.com>
In-Reply-To: <CAJuCfpFuZt7h3gd5Oih74oC_VsSpt=psSoPoBLJWoSam7TFgPQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 28 Jan 2025 15:51:06 -0800
X-Gm-Features: AWEUYZlCMYHKB8DvzSXtWCnYOPNaQvEW7O7rWbgjDvJcq_SqFe7Mu3LpbjD1Qmw
Message-ID: <CAJuCfpHJedxhZuuoKkKaQXsT-3tPSkhUwHadJRGEdTxSkzRc_w@mail.gmail.com>
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

On Mon, Jan 27, 2025 at 11:21=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Mon, Jan 27, 2025 at 6:09=E2=80=AFAM Will Deacon <will@kernel.org> wro=
te:
> >
> > On Fri, Jan 17, 2025 at 03:41:36PM +0000, Will Deacon wrote:
> > > On Wed, Jan 15, 2025 at 05:00:11PM +0100, Peter Zijlstra wrote:
> > > > On Wed, Jan 15, 2025 at 12:13:34PM +0100, Peter Zijlstra wrote:
> > > >
> > > > > Notably, it means refcount_t is entirely unsuitable for anything
> > > > > SLAB_TYPESAFE_BY_RCU, since they all will need secondary validati=
on
> > > > > conditions after the refcount succeeds.
> > > > >
> > > > > And this is probably fine, but let me ponder this all a little mo=
re.
> > > >
> > > > Even though SLAB_TYPESAFE_BY_RCU is relatively rare, I think we'd b=
etter
> > > > fix this, these things are hard enough as they are.
> > > >
> > > > Will, others, wdyt?
> > >
> > > We should also update the Documentation (atomic_t.txt and
> > > refcount-vs-atomic.rst) if we strengthen this.
> > >
> > > > ---
> > > > Subject: refcount: Strengthen inc_not_zero()
> > > >
> > > > For speculative lookups where a successful inc_not_zero() pins the
> > > > object, but where we still need to double check if the object acqui=
red
> > > > is indeed the one we set out to aquire, needs this validation to ha=
ppen
> > > > *after* the increment.
> > > >
> > > > Notably SLAB_TYPESAFE_BY_RCU is one such an example.
> > > >
> > > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > > ---
> > > >  include/linux/refcount.h | 15 ++++++++-------
> > > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > > > index 35f039ecb272..340e7ffa445e 100644
> > > > --- a/include/linux/refcount.h
> > > > +++ b/include/linux/refcount.h
> > > > @@ -69,9 +69,10 @@
> > > >   * its the lock acquire, for RCU/lockless data structures its the =
dependent
> > > >   * load.
> > > >   *
> > > > - * Do note that inc_not_zero() provides a control dependency which=
 will order
> > > > - * future stores against the inc, this ensures we'll never modify =
the object
> > > > - * if we did not in fact acquire a reference.
> > > > + * Do note that inc_not_zero() does provide acquire order, which w=
ill order
> > > > + * future load and stores against the inc, this ensures all subseq=
uent accesses
> > > > + * are from this object and not anything previously occupying this=
 memory --
> > > > + * consider SLAB_TYPESAFE_BY_RCU.
> > > >   *
> > > >   * The decrements will provide release order, such that all the pr=
ior loads and
> > > >   * stores will be issued before, it also provides a control depend=
ency, which
> > > > @@ -144,7 +145,7 @@ bool __refcount_add_not_zero(int i, refcount_t =
*r, int *oldp)
> > > >     do {
> > > >             if (!old)
> > > >                     break;
> > > > -   } while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> > > > +   } while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i));
> > >
> > > Hmm, do the later memory accesses need to be ordered against the stor=
e
> > > part of the increment or just the read? If it's the former, then I do=
n't
> > > think that _acquire is sufficient -- accesses can still get in-betwee=
n
> > > the read and write parts of the RmW.
> >
> > I dug some more into this at the end of last week. For the
> > SLAB_TYPESAFE_BY_RCU where we're racing inc_not_zero() with
> > dec_and_test(), then I think using _acquire() above is correct as the
> > later references can only move up into the critical section in the case
> > that we successfully obtained a reference.
> >
> > However, if we're going to make the barriers implicit in the refcount
> > operations here then I think we also need to do something on the produc=
er
> > side for when the object is re-initialised after being destroyed and
> > allocated again. I think that would necessitate release ordering for
> > refcount_set() so that whatever allows the consumer to validate the
> > object (e.g. sequence number) is published *before* the refcount.
>
> Thanks Will!
> I would like to expand on your answer to provide an example of the
> race that would happen without release ordering in the producer. To
> save reader's time I provide a simplified flow and reasoning first.
> More detailed code of what I'm considering a typical
> SLAB_TYPESAFE_BY_RCU refcounting example is added at the end of my
> reply (Addendum).
> Simplified flow looks like this:
>
> consumer:
>     obj =3D lookup(collection, key);
>     if (!refcount_inc_not_zero(&obj->ref))
>         return;
>     smp_rmb(); /* Peter's new acquire fence */
>     if (READ_ONCE(obj->key) !=3D key) {
>         put_ref(obj);
>         return;
>     }
>     use(obj->value);
>
> producer:
>     old_key =3D obj->key;
>     remove(collection, old_key);
>     if (!refcount_dec_and_test(&obj->ref))
>         return;
>     obj->key =3D KEY_INVALID;
>     free(objj);
>     ...
>     obj =3D malloc(); /* obj is reused */
>     obj->key =3D new_key;
>     obj->value =3D new_value;
>     smp_wmb(); /* Will's proposed release fence */
>     refcount_set(obj->ref, 1);
>     insert(collection, key, obj);
>
> Let's consider a case when new_key =3D=3D old_key. Will call both of them
> "key". Without WIll's proposed fence the following reordering is
> possible:
>
> consumer:
>     obj =3D lookup(collection, key);
>
>                  producer:
>                      key =3D obj->key
>                      remove(collection, key);
>                      if (!refcount_dec_and_test(&obj->ref))
>                          return;
>                      obj->key =3D KEY_INVALID;
>                      free(objj);
>                      obj =3D malloc(); /* obj is reused */
>                      refcount_set(obj->ref, 1);
>                      obj->key =3D key; /* same key */
>
>     if (!refcount_inc_not_zero(&obj->ref))
>         return;
>     smp_rmb();
>     if (READ_ONCE(obj->key) !=3D key) {
>         put_ref(obj);
>         return;
>     }
>     use(obj->value);
>
>                      obj->value =3D new_value; /* reordered store */
>                      add(collection, key, obj);
>
> So, the consumer finds the old object, successfully takes a refcount
> and validates the key. It succeeds because the object is allocated and
> has the same key, which is fine. However it proceeds to use stale
> obj->value. Will's proposed release ordering would prevent that.
>
> The example in https://elixir.bootlin.com/linux/v6.12.6/source/include/li=
nux/slab.h#L102
> omits all these ordering issues for SLAB_TYPESAFE_BY_RCU.
> I think it would be better to introduce two new functions:
> refcount_add_not_zero_acquire() and refcount_set_release(), clearly
> document that they should be used when a freed object can be recycled
> and reused, like in SLAB_TYPESAFE_BY_RCU case. refcount_set_release()
> should also clarify that once it's called, the object can be accessed
> by consumers even if it was not added yet into the collection used for
> object lookup (like in the example above). SLAB_TYPESAFE_BY_RCU
> comment at https://elixir.bootlin.com/linux/v6.12.6/source/include/linux/=
slab.h#L102
> then can explicitly use these new functions in the example code,
> further clarifying their purpose and proper use.
> WDYT?

Hi Peter,
Should I take a stab at preparing a patch to add the two new
refcounting functions suggested above with updates to the
documentation and comments?
If you disagree with that or need more time to decide then I'll wait.
Please let me know.
Thanks,
Suren.


>
> ADDENDUM.
> Detailed code for typical use of refcounting with SLAB_TYPESAFE_BY_RCU:
>
> struct object {
>     refcount_t ref;
>     u64 key;
>     u64 value;
> };
>
> void init(struct object *obj, u64 key, u64 value)
> {
>     obj->key =3D key;
>     obj->value =3D value;
>     smp_wmb(); /* Will's proposed release fence */
>     refcount_set(obj->ref, 1);
> }
>
> bool get_ref(struct object *obj, u64 key)
> {
>     if (!refcount_inc_not_zero(&obj->ref))
>         return false;
>     smp_rmb(); /* Peter's new acquire fence */
>     if (READ_ONCE(obj->key) !=3D key) {
>         put_ref(obj);
>         return false;
>     }
>     return true;
> }
>
> void put_ref(struct object *obj)
> {
>     if (!refcount_dec_and_test(&obj->ref))
>         return;
>     obj->key =3D KEY_INVALID;
>     free(obj);
> }
>
> consumer:
>     obj =3D lookup(collection, key);
>     if (!get_ref(obj, key)
>         return;
>     use(obj->value);
>
> producer:
>     remove(collection, old_obj->key);
>     put_ref(old_obj);
>     new_obj =3D malloc();
>     init(new_obj, new_key, new_value);
>     insert(collection, new_key, new_obj);
>
> With SLAB_TYPESAFE_BY_RCU old_obj in the producer can be reused and be
> equal to new_obj.
>
>
> >
> > Will
