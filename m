Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D961C5CD5
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734537049; cv=none; b=LFh+efTCpm8FOyxifmiPjgU9ubEmV5XfMuxIihprKIfD8qZ9UCfxZP5MJcf4tOaUU206vib5pVTV2NvT3pyITzXxJeS/PSnjYbVR09Vaj1buZ1CuDC1GyfHb49Y11PtfgsCH6NtGVinXyhtXDE3jmaOv4JQLVudr0aFdu8zovzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734537049; c=relaxed/simple;
	bh=+tBj375Lh0xZWMgCP+Z3BCSiCKL0u8xKqEohFM55iTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Kum0stxFPdsZXv4FPWigLHlwc4v49vuNPvgpLr+zuO9vHar0zYRnM+h9Hmo4wKMcA4sdV6YvmuK+KCx0KzvSzJXOHHXH4Hb8ylGOIyJw1G0gxeqaQ7igy/9GmMyu/BgqDamNQkPhyzlx/FfM1eK7zNbnP8UhaH2jGJdG42XshTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=phXaCq5O; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="phXaCq5O"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so309271cf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 07:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734537046; x=1735141846; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K34TMKXepcjf4T0QsGUjvfCGqdKHia7AmTftSourduQ=;
        b=phXaCq5O1P08vxUehZyZVJU9KJwFxiTKnHSHQUuDHNZklh9U1/0UuRuVsrrgKL5cGd
         49T5wuzz61+dOsAWIdhr/7e+MHI5OXNfPECCMp/bJJgPTBxsxBqfFYv3pcJC0ZxYElxJ
         loYw4DFgv/6B3m3fGxu2lDE3REtumXqUFjC47C7X5WnBIhWXaVjJ3JhYcgocjm3AabyL
         oyY90zzMBMQCXZGLYZBx8VUYFteVW2+pOFeGq7sfuplkZrH4doJb2H7TAgtCfmuR+dHy
         IFODzCfqW/J3Ahxato/uamiA+KhgvYoMxTdG1zTWCbV+ZAXBf5cw4guKlUKTQ7qO2+NP
         8u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734537046; x=1735141846;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K34TMKXepcjf4T0QsGUjvfCGqdKHia7AmTftSourduQ=;
        b=MRBp+OuZEzKuEFoHrc4GNOs1vJf8rtiHMGW2Oyw4JeyMBaijpnXSebgxtMccAf8dHb
         NqJF27pZqzEN6sNnvOS0oO61vkw/8xZKbePuLm18JoD8OrqeNqtVLNbdRorgVmSOpXB2
         1eJoINoeycEISodNJcMZBcPsSpFK0I+XiMxufdOOg9yqqVPy8GJBUJhncWbO3sHVLgel
         vdLlEkYzIbyeTckM0F3fBD76l1vCe7+pLUhdnsqCrupCKu+SMcMY1sXCFXUWzaSz3Haq
         uxAPiiUhUJ5b+TejTfIrqgeaWYBTHlLQDuaDncWeAeXaYp3uSqku93RW4G26CJbMCVgo
         WagA==
X-Forwarded-Encrypted: i=1; AJvYcCXAfxVvUDWvTP0RuS2eIgFiJGXSlhj+ysM3zHlAwXbUGFVOiqutns2SZk6pzOql5XK59sw0WraR3QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEa6W+cH/eBx0fFd3jqk1btqXKBryckSiYafxckYhUHjsjlWIO
	NDSPkSD7b8d08Ursvt5Eyt2iB/SZ9OLPSJLdCjAyRDBo4iulH5xbNvI9JWnGqvyg1bAuJcnu/gF
	GnwIukv/bAfbMalCcLULf1k++DDHNdKd1Bk1/
X-Gm-Gg: ASbGncvfsAzQRgy4ftmdZPALtD779l3DOVxvfn/7SUL74zq0pHKurLcLpxpBe1pZB65
	0eOnaUVjsrSyba3tx/Y3bUvm6GW8qF9zFAwyIfA==
X-Google-Smtp-Source: AGHT+IF9bvtdeVbXYNcj4WUKuNA1W1UsTchoCsMgUFXrZYQwJlH3Dyx1XbAac6JvaKxNQoGXbevnPte6ewyt6JYlXKk=
X-Received: by 2002:ac8:5dc7:0:b0:466:8c23:823a with SMTP id
 d75a77b69052e-46935529712mr2812431cf.17.1734537046012; Wed, 18 Dec 2024
 07:50:46 -0800 (PST)
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
Date: Wed, 18 Dec 2024 07:50:34 -0800
Message-ID: <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
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

I think vma_start_write() should be done inside
vms_gather_munmap_vmas() for __mmap_prepare() to work correctly:

__mmap_prepare
    vms_gather_munmap_vmas
    vms_clean_up_area // clears PTEs
...
__mmap_complete
    vms_complete_munmap_vmas

If we do not write-lock the vmas inside vms_gather_munmap_vmas(), we
will be clearing PTEs from under a discoverable vma.
There might be other places like this too but I think we can move
vma_mark_detach() like you suggested without moving vma_start_write()
and that should be enough.

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
>
> >
> >       /* Point of no return */
> >       vms_complete_munmap_vmas(&vms, &mas_detach);
