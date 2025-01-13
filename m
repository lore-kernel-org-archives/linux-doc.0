Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C6D1B21BC
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736795380; cv=none; b=XLlFFrTInEM0gg/TtWpSATW2ewLJ7tO9dXdh7YedVrYqn3BIPVUPuTpCuxSTYEh3fYHfhmk+z3Sp35koHU64mwWQxC1QHhwfHd+UGyAV3TqC2jqUn7j0Qj+APImX1zlbccXDvMoLrg9ha48egrZrBassP2JSu1X8qf+V+TAGLfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736795380; c=relaxed/simple;
	bh=YM8nQzXmVO3hIGagB5R+0toS6NDgB3PWAcGp3p3Vqbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOJp3e5nrmhB/WAp2IVVpyIVZWXRj4raubdMivUJC3b1zcx9HB7Ss3PY7tJdYAm8MizJb5ABYEBkNTM/Y2Z+gzcs2YF8tYmMoMKnCMhfiyk9VW+251HOhImgDClJDwvObXv/n/yDCox0rdtZIiD3cMJX4gqoVW8cQ0cyie+Hpqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SoOREpjJ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SoOREpjJ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467896541e1so32141cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 11:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736795377; x=1737400177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awAcP1PapTldB001pJ/Irl/POVAt+oNoWSzuce2g7Bo=;
        b=SoOREpjJM9CufqB540pR33z0NyfWDsBFWhytENrF/GIkuRlUtQtBGOE0HmtNBO0PEv
         thp0o9jNfl0M+QrFUBhdnljUb9zgr4xbiF045YHjD60edTwTaJLnB9leFEp7qnJl5sdH
         MceI3WC+IYxHpwBplaUcHbUIsqrjB8vr9W6XfFSO+ZTj0fKA44f8hW95hwqICurLWzbm
         uf7mZCRFPBfqCWdNSgo7ieFR05s64g1ID4WUPB+a3furkHZI/KXbaEoGuHHJ/JPfHxn/
         d9k7UhLdjyJHXMs5B5Iw0MjwXfflhbLz1dWpWo/gNjGBqW1R3RX5ckFBwzTokZiXjMuh
         4HzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795377; x=1737400177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awAcP1PapTldB001pJ/Irl/POVAt+oNoWSzuce2g7Bo=;
        b=Yh5eVvKS8Ejt3GthXjBFAAO4uRr78OVu6fbTNv98aY/S/hhKCpnzbGjeRwRZCwJHyT
         30FdznvD5yVF6cQHTFT+064w8I7fqsI0ZszdQUaM5DEZ6EW6nqAzUBTSGLNTEV7ALwA3
         jlo4cHg5j7VGoV4gkPcUbhLMuz1+rbVE6z+a0vwKoZZlUsWmO5BzUqzjusJ1VjXC5RH3
         X66G4pr79z5CLoFQuB70Ml0O1Br+ZksWrbgH/kDBdHufkznShMNsjhb7fdlMLzzjfVyA
         mwwfiWM5owrOUzXIeK/JJLF7eG1D88OvVj8Yif/LojDBC68NHgPxAVsArwarjDN/6eJ6
         Gx+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsZmQHX/BVw9lOBSQk2OKFjjUH7vU0Ru/fWMez8J7LFMiVPbWSAh8k6REHduKiR6oG35wq9ylq8Mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrnN2niJSm3S3ywW/PgPwAMDj5b6KsgdzMyeQg8zmPOeRP0AM
	ssf9vWI3ctUIa2fLQNUnckcEMFOJ9Y5Ml+qTzCnrTH0nw7SobZvw9A9Bvfn/xiUn4W6TFinc3MJ
	sQBP/AvO2dlgIm/q7qYzcGhK75NSa8Mm2y3jd
X-Gm-Gg: ASbGncsv9Dn2vaOEJF47iUB28M4abZoPh20gtYSt16axQZYprTh+ogFOb6leweEhvg2
	J1GewaT9h5WdzsRuLJIZhPS5jE6gwV9z3GlVraQ==
X-Google-Smtp-Source: AGHT+IHxSCwBZPKwoB9jmpHDH1aufJlnEZ9DADuU3/4fqu4oePhrEHgnJ2HBiqc2XzOGEAHQrgmaEuAHHJ8q9CNZDmA=
X-Received: by 2002:ac8:5e4c:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-46de99be855mr11101cf.9.1736795376763; Mon, 13 Jan 2025 11:09:36
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-5-surenb@google.com>
 <6e9329ba-8dad-423f-9741-e5447f85659f@lucifer.local> <CAJuCfpGa9YSVtT9hapQqd9r5WFTzyAALtaK6kD7CPBKk+cvgmQ@mail.gmail.com>
 <640fee1d-e76b-4aca-8975-f6bd4f3279d9@lucifer.local>
In-Reply-To: <640fee1d-e76b-4aca-8975-f6bd4f3279d9@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 11:09:25 -0800
X-Gm-Features: AbW1kvb1k5p6OBd-FXsvft9mNCJV5mkViZk3XuQzBbtTuPaqGsMjh14nn6oWGkM
Message-ID: <CAJuCfpFXwX+g0rCXAB_8s61VheOJZCBTSk1hyqrSWxqMPrE7MQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/17] mm: introduce vma_iter_store_attached() to use
 with attached vmas
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
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

On Mon, Jan 13, 2025 at 8:48=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Jan 13, 2025 at 08:31:45AM -0800, Suren Baghdasaryan wrote:
> > On Mon, Jan 13, 2025 at 3:58=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > On Fri, Jan 10, 2025 at 08:25:51PM -0800, Suren Baghdasaryan wrote:
> > > > vma_iter_store() functions can be used both when adding a new vma a=
nd
> > > > when updating an existing one. However for existing ones we do not =
need
> > > > to mark them attached as they are already marked that way. Introduc=
e
> > > > vma_iter_store_attached() to be used with already attached vmas.
> > >
> > > OK I guess the intent of this is to reinstate the previously existing
> > > asserts, only explicitly checking those places where we attach.
> >
> > No, the motivation is to prevern re-attaching an already attached vma
> > or re-detaching an already detached vma for state consistency. I guess
> > I should amend the description to make that clear.
>
> Sorry for noise, missed this reply.
>
> What I mean by this is, in a past iteration of this series I reviewed cod=
e
> where you did this but did _not_ differentiate between cases of new VMAs
> vs. existing, which caused an assert in your series which I reported.
>
> So I"m saying - now you _are_ differentiating between the two cases.
>
> It's certainly worth belabouring the point of exactly what it is you are
> trying to catch here, however! :) So yes please do add a little more to
> commit msg that'd be great, thanks!

Sure. How about:

With vma->detached being a separate flag, double-marking a vmas as
attached or detached is not an issue because the flag will simply be
overwritten with the same value. However once we fold this flag into
the refcount later in this series, re-attaching or re-detaching a vma
becomes an issue since these operations will be
incrementing/decrementing a refcount. Fix the places where we
currently re-attaching a vma during vma update and add assertions in
vma_mark_attached()/vma_mark_detached() to catch invalid usage.

>
> >
> > >
> > > I'm a little concerned that by doing this, somebody might simply invo=
ke
> > > this function without realising the implications.
> >
> > Well, in that case somebody should get an assertion. If
> > vma_iter_store() is called against already attached vma, we get this
> > assertion:
> >
> > vma_iter_store()
> >   vma_mark_attached()
> >     vma_assert_detached()
> >
> > If vma_iter_store_attached() is called against a detached vma, we get t=
his one:
> >
> > vma_iter_store_attached()
> >   vma_assert_attached()
> >
> > Does that address your concern?
> >
> > >
> > > Can we have something functional like
> > >
> > > vma_iter_store_new() and vma_iter_store_overwrite()
> >
> > Ok. A bit more churn but should not be too bad.
> >
> > >
> > > ?
> > >
> > > I don't like us just leaving vma_iter_store() quietly making an assum=
ption
> > > that a caller doesn't necessarily realise.
> > >
> > > Also it's more greppable this way.
> > >
> > > I had a look through callers and it does seem you've snagged them all
> > > correctly.
> > >
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > > > ---
> > > >  include/linux/mm.h | 12 ++++++++++++
> > > >  mm/vma.c           |  8 ++++----
> > > >  mm/vma.h           | 11 +++++++++--
> > > >  3 files changed, 25 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > > index 2b322871da87..2f805f1a0176 100644
> > > > --- a/include/linux/mm.h
> > > > +++ b/include/linux/mm.h
> > > > @@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm=
_area_struct *vma)
> > > >               vma_assert_write_locked(vma);
> > > >  }
> > > >
> > > > +static inline void vma_assert_attached(struct vm_area_struct *vma)
> > > > +{
> > > > +     VM_BUG_ON_VMA(vma->detached, vma);
> > > > +}
> > > > +
> > > > +static inline void vma_assert_detached(struct vm_area_struct *vma)
> > > > +{
> > > > +     VM_BUG_ON_VMA(!vma->detached, vma);
> > > > +}
> > > > +
> > > >  static inline void vma_mark_attached(struct vm_area_struct *vma)
> > > >  {
> > > >       vma->detached =3D false;
> > > > @@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_=
struct *vma) {}
> > > >  static inline void vma_start_write(struct vm_area_struct *vma) {}
> > > >  static inline void vma_assert_write_locked(struct vm_area_struct *=
vma)
> > > >               { mmap_assert_write_locked(vma->vm_mm); }
> > > > +static inline void vma_assert_attached(struct vm_area_struct *vma)=
 {}
> > > > +static inline void vma_assert_detached(struct vm_area_struct *vma)=
 {}
> > > >  static inline void vma_mark_attached(struct vm_area_struct *vma) {=
}
> > > >  static inline void vma_mark_detached(struct vm_area_struct *vma) {=
}
> > > >
> > > > diff --git a/mm/vma.c b/mm/vma.c
> > > > index d603494e69d7..b9cf552e120c 100644
> > > > --- a/mm/vma.c
> > > > +++ b/mm/vma.c
> > > > @@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_stru=
ct *vmg,
> > > >       vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
> > > >
> > > >       if (expanded)
> > > > -             vma_iter_store(vmg->vmi, vmg->vma);
> > > > +             vma_iter_store_attached(vmg->vmi, vmg->vma);
> > > >
> > > >       if (adj_start) {
> > > >               adjust->vm_start +=3D adj_start;
> > > >               adjust->vm_pgoff +=3D PHYS_PFN(adj_start);
> > > >               if (adj_start < 0) {
> > > >                       WARN_ON(expanded);
> > > > -                     vma_iter_store(vmg->vmi, adjust);
> > > > +                     vma_iter_store_attached(vmg->vmi, adjust);
> > > >               }
> > > >       }
> > >
> > > I kind of feel this whole function (that yes, I added :>) though deri=
ved
> > > from existing logic) needs rework, as it's necessarily rather confusi=
ng.
> > >
> > > But hey, that's on me :)
> > >
> > > But this does look right... OK see this as a note-to-self...
> > >
> > > >
> > > > @@ -2845,7 +2845,7 @@ int expand_upwards(struct vm_area_struct *vma=
, unsigned long address)
> > > >                               anon_vma_interval_tree_pre_update_vma=
(vma);
> > > >                               vma->vm_end =3D address;
> > > >                               /* Overwrite old entry in mtree. */
> > > > -                             vma_iter_store(&vmi, vma);
> > > > +                             vma_iter_store_attached(&vmi, vma);
> > > >                               anon_vma_interval_tree_post_update_vm=
a(vma);
> > > >
> > > >                               perf_event_mmap(vma);
> > > > @@ -2925,7 +2925,7 @@ int expand_downwards(struct vm_area_struct *v=
ma, unsigned long address)
> > > >                               vma->vm_start =3D address;
> > > >                               vma->vm_pgoff -=3D grow;
> > > >                               /* Overwrite old entry in mtree. */
> > > > -                             vma_iter_store(&vmi, vma);
> > > > +                             vma_iter_store_attached(&vmi, vma);
> > > >                               anon_vma_interval_tree_post_update_vm=
a(vma);
> > > >
> > > >                               perf_event_mmap(vma);
> > > > diff --git a/mm/vma.h b/mm/vma.h
> > > > index 2a2668de8d2c..63dd38d5230c 100644
> > > > --- a/mm/vma.h
> > > > +++ b/mm/vma.h
> > > > @@ -365,9 +365,10 @@ static inline struct vm_area_struct *vma_iter_=
load(struct vma_iterator *vmi)
> > > >  }
> > > >
> > > >  /* Store a VMA with preallocated memory */
> > > > -static inline void vma_iter_store(struct vma_iterator *vmi,
> > > > -                               struct vm_area_struct *vma)
> > > > +static inline void vma_iter_store_attached(struct vma_iterator *vm=
i,
> > > > +                                        struct vm_area_struct *vma=
)
> > > >  {
> > > > +     vma_assert_attached(vma);
> > > >
> > > >  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
> > > >       if (MAS_WARN_ON(&vmi->mas, vmi->mas.status !=3D ma_start &&
> > > > @@ -390,7 +391,13 @@ static inline void vma_iter_store(struct vma_i=
terator *vmi,
> > > >
> > > >       __mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
> > > >       mas_store_prealloc(&vmi->mas, vma);
> > > > +}
> > > > +
> > > > +static inline void vma_iter_store(struct vma_iterator *vmi,
> > > > +                               struct vm_area_struct *vma)
> > > > +{
> > > >       vma_mark_attached(vma);
> > > > +     vma_iter_store_attached(vmi, vma);
> > > >  }
> > > >
> > >
> > > See comment at top, and we need some comments here to explain why we'=
re
> > > going to pains to do this.
> >
> > Ack. I'll amend the patch description to make that clear.
> >
> > >
> > > What about mm/nommu.c? I guess these cases are always new VMAs.
> >
> > CONFIG_PER_VMA_LOCK depends on !CONFIG_NOMMU, so for nommu case all
> > these attach/detach functions become NOPs.
> >
> > >
> > > We probably definitely need to check this series in a nommu setup, ha=
ve you
> > > done this? As I can see this breaking things. Then again I suppose yo=
u'd
> > > have expected bots to moan by now...
> > >
> > > >  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi=
)
> > > > --
> > > > 2.47.1.613.gc27f4b7a9f-goog
> > > >
