Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BF81F130E
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734537452; cv=none; b=PC8kw4XJDoOFezqBPp7mIvVLxwlfWIWWLfAIxdNawRsk7ubGixZXhG0vBYsK6JylBlftgCivINqE9d5RpC8bAj1zm5Hxehnmu8u82aFSYvMfyFRK63RwfV86LWHTdcgwwRxjXrRr44Y2XDyYs2yjb7VGZBqch3WBo0ZGL6JKYgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734537452; c=relaxed/simple;
	bh=sybO/bevpalhK7CmbAQ+3rHd/hNtofe152h17o327gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=OAMsqePNW7X4HWa/Uoo2ajzZZiLVML+CZ0jZONPCBALXmGwh8QYW7dMptMQNkPg7PlXs2nQWy1HAio5JizpQSQar9qYqET0PI7YZm8RCibxfcZQVdvwKXGdVsQ4bkXzxUhYSsBNz/FvQHOVZ5gWbkMYdqiwR/6BnFMlFD7aOsd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZGm1ESXn; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZGm1ESXn"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4678c9310afso255121cf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 07:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734537449; x=1735142249; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRWkLlH/0KVuqivr+nZJc3MknxGivPkYfiY4TYmOyLY=;
        b=ZGm1ESXnC0fu+BjVbmrJuKKdZlXGpfB2wgohgoiwnsnrlVGZ1UoIEsMAJrmebbqcWp
         j7UDupxxARpXRVESY1KpHE4XIHCt2DgiQHnhvZGTzRtcHBswxbt6a42T1AQnw96Yf7Pa
         1sOiuzrUi1WtjSMJCIQ7aaq5nolBNU9HRoUFg4cw8cG1XtW0iFtvcG796V5J6+rUX1AK
         b4WtbN97rl8134glLeXAgUdVLbzEmOG2kmjDzoUUMtC5M8vIwI6RXYWzSajs/NSP7be0
         tfIoUoZTH39IVqby/y6MGdbBSG4YCFlzinDNsQVeAJ0HJiPC14QtTU3JBWY6cy162hkg
         X5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734537449; x=1735142249;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRWkLlH/0KVuqivr+nZJc3MknxGivPkYfiY4TYmOyLY=;
        b=jGiYMxgCj0LugkfQbOzg+CsNMDjG5XgoLecLO5w4HdGYcewIiAwGIFj5PMKuy2jP25
         qF5yfZ+usZk4iqT361h9ImHAVnejrqZuBMCMWWigrxHrgS0OdoVii/k1l/2X4l7KILrr
         81oZzwRrgHVJ1l0wHTLJ9AxXICEFphdINE+TQZ2+QsQEKeywFKdfPxPhsJ+BnLcSy29l
         qIq/EXWZ1/cxZGq2/e7toSZ71lMuIx0wfqwkOece8BUwQrsfJW9Wos3jbNOLEASU4zH0
         MV65gYDEPkk3KroxdNv9hfGDzEOtk3S7E7lQh4FmV9zqablJZM7sYIQo42HmIU9jgh09
         GhuA==
X-Forwarded-Encrypted: i=1; AJvYcCU9o0Ii/DDdTPtTaAJF76AizJvsUoHQifwAfegCRIuSjS1S0DJ62fLZF9IVxKYXpAP7eFy/4hV3lRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfcluhefrJtOJN2aYSB1bQD6Z4cXP4birTTYRMZCne4rPoLPJ
	FQPRavwDhLJ/eQtuNxKawxU95Ngdi6dKbTcGpayNeH5ANGxTbjyi8Okz5jCNOI5WLG9mc/j7LWS
	zhJ8qgCy1VS2wTGmEOXG1h6txCCen+PbTWJMy
X-Gm-Gg: ASbGnctjvpXkwbrNetBUbwRml7dPemtESmXJYfk8crKerbEIOR7wsI/yVgUdIO9z2Ku
	/Co5/k0bX70NTSpqSNqvQSscwgNpNorXNo9jI7Q==
X-Google-Smtp-Source: AGHT+IHJObuMKVfq5IR6Cj6tOI9yODnZO1treWPzCs0UHl4OVIXh5EgRvjmsadV5f2ofVc+ag073+Ch83CgpcvfZnL4=
X-Received: by 2002:a05:622a:14d0:b0:460:f093:f259 with SMTP id
 d75a77b69052e-469091652d0mr3931961cf.22.1734537448820; Wed, 18 Dec 2024
 07:57:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net> <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net> <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net> <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
In-Reply-To: <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 07:57:17 -0800
Message-ID: <CAJuCfpHRtuRdf3YTGFTK7oV0mk4Ck-G22-dARKA+ObVwvfxNkg@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, willy@infradead.org, 
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

On Wed, Dec 18, 2024 at 7:37=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Peter Zijlstra <peterz@infradead.org> [241218 05:06]:
> > On Wed, Dec 18, 2024 at 10:41:04AM +0100, Peter Zijlstra wrote:
> > > On Tue, Dec 17, 2024 at 08:27:46AM -0800, Suren Baghdasaryan wrote:
> > >
> > > > > So I just replied there, and no, I don't think it makes sense. Ju=
st put
> > > > > the kmem_cache_free() in vma_refcount_put(), to be done on 0.
> > > >
> > > > That's very appealing indeed and makes things much simpler. The
> > > > problem I see with that is the case when we detach a vma from the t=
ree
> > > > to isolate it, then do some cleanup and only then free it. That's d=
one
> > > > in vms_gather_munmap_vmas() here:
> > > > https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1240 and =
we
> > > > even might reattach detached vmas back:
> > > > https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1312. IOW=
,
> > > > detached state is not final and we can't destroy the object that
> > > > reached this state.
> > >
> > > Urgh, so that's the munmap() path, but arguably when that fails, the
> > > map stays in place.
> > >
> > > I think this means you're marking detached too soon; you should only
> > > mark detached once you reach the point of no return.
> > >
> > > That said, once you've reached the point of no return; and are about =
to
> > > go remove the page-tables, you very much want to ensure a lack of
> > > concurrency.
> > >
> > > So perhaps waiting for out-standing readers at this point isn't crazy=
.
> > >
> > > Also, I'm having a very hard time reading this maple tree stuff :/
> > > Afaict vms_gather_munmap_vmas() only adds the VMAs to be removed to a
> > > second tree, it does not in fact unlink them from the mm yet.
>
> Yes, that's correct.  I tried to make this clear with a gather/complete
> naming like other areas of the mm.  I hope that helped.
>
> Also, the comments for the function state that's what's going on:
>
>  * vms_gather_munmap_vmas() - Put all VMAs within a range into a maple tr=
ee
>  * for removal at a later date.  Handles splitting first and last if nece=
ssary
>  * and marking the vmas as isolated.
>
> ... might be worth updating with new information.
>
> > >
> > > AFAICT it's vma_iter_clear_gfp() that actually wipes the vmas from th=
e
> > > mm -- and that being able to fail is mind boggling and I suppose is w=
hat
> > > gives rise to much of this insanity :/
>
> This is also correct.  The maple tree is a b-tree variant that has
> internal nodes.  When you write to it, including nulls, they are tracked
> and may need to allocate.  This is a cost for rcu lookups; we will use
> the same or less memory in the end but must maintain a consistent view
> of the ranges.
>
> But to put this into perspective, we get 16 nodes per 4k page, most
> writes will use 1 or 3 of these from a kmem_cache, so we are talking
> about a very unlikely possibility.  Except when syzbot decides to fail
> random allocations.
>
> We could preallocate for the write, but this section of the code is
> GFP_KERNEL, so we don't.  Preallocation is an option to simplify the
> failure path though... which is what you did below.
>
> > >
> > > Anyway, I would expect remove_vma() to be the one that marks it detac=
hed
> > > (it's already unreachable through vma_lookup() at this point) and the=
re
> > > you should wait for concurrent readers to bugger off.
> >
> > Also, I think vma_start_write() in that gather look is too early, you'r=
e
> > not actually going to change the VMA yet -- with obvious exception of
> > the split cases.
>
> The split needs to start the write on the vma to avoid anyone reading it
> while it's being altered.
>
> >
> > That too should probably come after you've passes all the fail/unwind
> > spots.
>
> Do you mean the split?  I'd like to move the split later as well..
> tracking that is a pain and may need an extra vma for when one vma is
> split twice before removing the middle part.
>
> Actually, I think we need to allocate two (or at least one) vmas in this
> case and just pass one through to unmap (written only to the mas_detach
> tree?).  It would be nice to find a way to NOT need to do that even.. I
> had tried to use a vma on the stack years ago, which didn't work out.
>
> >
> > Something like so perhaps? (yeah, I know, I wrecked a bunch)
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index 8e31b7e25aeb..45d43adcbb36 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struct vma_=
munmap_struct *vms,
> >       struct vm_area_struct *vma;
> >       struct mm_struct *mm;
> >
>
> mas_set(mas_detach, 0);
>
> > +     mas_for_each(mas_detach, vma, ULONG_MAX) {
> > +             vma_start_write(next);
> > +             vma_mark_detached(next, true);
> > +     }
> > +
> >       mm =3D current->mm;
> >       mm->map_count -=3D vms->vma_count;
> >       mm->locked_vm -=3D vms->locked_vm;
> > @@ -1219,9 +1224,6 @@ static void reattach_vmas(struct ma_state *mas_de=
tach)
> >       struct vm_area_struct *vma;
> >
>
> >       mas_set(mas_detach, 0);
> Drop the mas_set here.
>
> > -     mas_for_each(mas_detach, vma, ULONG_MAX)
> > -             vma_mark_detached(vma, false);
> > -
> >       __mt_destroy(mas_detach->tree);
> >  }
> >
> > @@ -1289,13 +1291,11 @@ static int vms_gather_munmap_vmas(struct vma_mu=
nmap_struct *vms,
> >                       if (error)
> >                               goto end_split_failed;
> >               }
> > -             vma_start_write(next);
> >               mas_set(mas_detach, vms->vma_count++);
> >               error =3D mas_store_gfp(mas_detach, next, GFP_KERNEL);
> >               if (error)
> >                       goto munmap_gather_failed;
> >
> > -             vma_mark_detached(next, true);
> >               nrpages =3D vma_pages(next);
> >
> >               vms->nr_pages +=3D nrpages;
> > @@ -1431,14 +1431,17 @@ int do_vmi_align_munmap(struct vma_iterator *vm=
i, struct vm_area_struct *vma,
> >       struct vma_munmap_struct vms;
> >       int error;
> >
>
> The preallocation needs to know the range being stored to know what's
> going to happen.
>
> vma_iter_config(vmi, start, end);
>
> > +     error =3D mas_preallocate(vmi->mas);
>
> We haven't had a need to have a vma iterator preallocate for storing a
> null, but we can add one for this.
>
> > +     if (error)
> > +             goto gather_failed;
> > +
> >       init_vma_munmap(&vms, vmi, vma, start, end, uf, unlock);
> >       error =3D vms_gather_munmap_vmas(&vms, &mas_detach);
> >       if (error)
> >               goto gather_failed;
> >
>
> Drop this stuff.
> >       error =3D vma_iter_clear_gfp(vmi, start, end, GFP_KERNEL);
> > -     if (error)
> > -             goto clear_tree_failed;
> > +     VM_WARN_ON(error);
>
> Do this instead
> vma_iter_config(vmi, start, end);
> vma_iter_clear(vmi);

Thanks for the input, Liam. Let me try to make a patch from these
suggestions and see where we end up and what might blow up.

>
> >
> >       /* Point of no return */
> >       vms_complete_munmap_vmas(&vms, &mas_detach);
