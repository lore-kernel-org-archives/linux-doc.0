Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF75240230
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785919; cv=none; b=fWJ/kZQFyuXvCnb66kEeuHVkJeWItUdachWwfCplFMmTCCLu5zDHkokmYyX43V7OvKf2GgRcU3SqZt2f4TtMnZs41QoTBSK5oo5TQ+Tar9jQy0anWCUuG+pUtDvp7PKQvQdQ547IxohVkqsoESCQ+Chb8xcM+K5RYs7P09+042A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785919; c=relaxed/simple;
	bh=I1Ket/sTRwg89EaeP/EEVOyzGiB2J30949t4bXLOWsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGZ7DX1XpFCZKDRLS2YR6f07PdFExV7a+Y18dwGv9yySrXRSPV3TgQmG/DDFdKPVJdecqrPVTeZsCQLuegmEkO91tzZA+DUT6gTdm268mXA/j+ixXPgrsYgGgzWDyumR0WCW/TjubxfmduF8MfYUqP4IuJCPqKt7u6UKbkaGkc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fyWfF/aF; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fyWfF/aF"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678c9310afso380481cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 08:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736785917; x=1737390717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBPvIovHQiD9n8xzkcacIlBFecfDAv7IoE1iz0kn/Yo=;
        b=fyWfF/aF9VhlV4q9teI5iDF+mjlIBb7WC7Ui6MFSsoSRDhgtUfCbJCAi3Vz8NGsD3F
         Cce6cR49axeDb73QllJgbRsGJMeEx7ZK0oOuMRmaoAma5YfGzEYqmjH7T6AcqQx7YT6V
         iBYzMFqTCARTl43XiShq/yRSz60mYoYWh5zEJnt1OA0nl2zfxx2lB6edLYNkTvBDZaOl
         kFU+Cu0jk+1LC7faFp6Rt+k1ysMP5lxmnJXNNsbIQ15eWVj80CFz3rS2nKIp0TKjcFSO
         neDYdCwpJNt0ipXLucJC2C5nnmo+NpncL+XOQmLWjv6HxhDSKDoa7R1l7VcJhFTC3nVN
         XfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736785917; x=1737390717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBPvIovHQiD9n8xzkcacIlBFecfDAv7IoE1iz0kn/Yo=;
        b=LxJObrLyHOfk8AJ/rRHHiye22tVrgo10HmyPXU3mQyiMbXMKRINg4SenwZu+Y8l02y
         jRr4fn7HGGH5CBXxUciS9BmMc8P0XNeB9ri4UvnO7fSaVStjHAf3BYPwrvZyBlBDvDfm
         2eAPGYD5YlcH6f8aYS6l4BfrGNp1tRfcZjjs0IaovLpPrjd/yBbtFWtiyfA34q/+V34n
         FUg1yDN+z8dmr5+g+eBuEzu0bo/pXL8oliG2aRyt7UkcPjN3ZURnJRA5M7K0+8MQvpdz
         KPTo8Cawk8tCe0cy7ufXQKe3d2HV8sjmILIA0MW1bG4IznocvgFJr3M2U5YLGZqJCju9
         QO1w==
X-Forwarded-Encrypted: i=1; AJvYcCWo8nwX/eJAwbt13DwslvbjkQsJUDjbyTiRzSM6gY53Du1xIZdMFGE6p+Ja/DIljW1wTXu5WwyidVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ9DfUb6rZpM2ykp8dZzsl8NEskAbWh39mzSz/qCp3FcHjWkvf
	hpEW3FCJ3mPXATNDx/OvXMyv0HKqyOV0UtMIg/+II3YOH25OEYF9jYzabwfB9LRX/TTOmEb6zaP
	VayRWt7Tr0Rapo4oMLS1Em+/LRCNDq4uuGGHe
X-Gm-Gg: ASbGncvH6y1AgXYo0GJSKeNRkuxDx+Il9dwVPmrRXK2JirMZtsdTQg1u/qFecMlyxjp
	eJDozwtKWlMt2LBzGX0+Wk0bKOz41x+D/TSNg/A==
X-Google-Smtp-Source: AGHT+IFdQ/9E90a49DORAdfOsNHvSpnAOsbcfqHZKomsT7w6CTF3kENfUIOD+Q/U2yNdDUgYVQkGACVRv9JrAFuL6to=
X-Received: by 2002:ac8:7f54:0:b0:46c:70b1:c5e4 with SMTP id
 d75a77b69052e-46c89d3a757mr12363361cf.3.1736785916740; Mon, 13 Jan 2025
 08:31:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-5-surenb@google.com>
 <6e9329ba-8dad-423f-9741-e5447f85659f@lucifer.local>
In-Reply-To: <6e9329ba-8dad-423f-9741-e5447f85659f@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 08:31:45 -0800
X-Gm-Features: AbW1kvZRZB3TkQoH7dhtoCM6Tu-jcq-DdPD4z7nWFcRSAcC0CvKRy7IYHlibKrk
Message-ID: <CAJuCfpGa9YSVtT9hapQqd9r5WFTzyAALtaK6kD7CPBKk+cvgmQ@mail.gmail.com>
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

On Mon, Jan 13, 2025 at 3:58=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:51PM -0800, Suren Baghdasaryan wrote:
> > vma_iter_store() functions can be used both when adding a new vma and
> > when updating an existing one. However for existing ones we do not need
> > to mark them attached as they are already marked that way. Introduce
> > vma_iter_store_attached() to be used with already attached vmas.
>
> OK I guess the intent of this is to reinstate the previously existing
> asserts, only explicitly checking those places where we attach.

No, the motivation is to prevern re-attaching an already attached vma
or re-detaching an already detached vma for state consistency. I guess
I should amend the description to make that clear.

>
> I'm a little concerned that by doing this, somebody might simply invoke
> this function without realising the implications.

Well, in that case somebody should get an assertion. If
vma_iter_store() is called against already attached vma, we get this
assertion:

vma_iter_store()
  vma_mark_attached()
    vma_assert_detached()

If vma_iter_store_attached() is called against a detached vma, we get this =
one:

vma_iter_store_attached()
  vma_assert_attached()

Does that address your concern?

>
> Can we have something functional like
>
> vma_iter_store_new() and vma_iter_store_overwrite()

Ok. A bit more churn but should not be too bad.

>
> ?
>
> I don't like us just leaving vma_iter_store() quietly making an assumptio=
n
> that a caller doesn't necessarily realise.
>
> Also it's more greppable this way.
>
> I had a look through callers and it does seem you've snagged them all
> correctly.
>
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
> >  include/linux/mm.h | 12 ++++++++++++
> >  mm/vma.c           |  8 ++++----
> >  mm/vma.h           | 11 +++++++++--
> >  3 files changed, 25 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 2b322871da87..2f805f1a0176 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_are=
a_struct *vma)
> >               vma_assert_write_locked(vma);
> >  }
> >
> > +static inline void vma_assert_attached(struct vm_area_struct *vma)
> > +{
> > +     VM_BUG_ON_VMA(vma->detached, vma);
> > +}
> > +
> > +static inline void vma_assert_detached(struct vm_area_struct *vma)
> > +{
> > +     VM_BUG_ON_VMA(!vma->detached, vma);
> > +}
> > +
> >  static inline void vma_mark_attached(struct vm_area_struct *vma)
> >  {
> >       vma->detached =3D false;
> > @@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_stru=
ct *vma) {}
> >  static inline void vma_start_write(struct vm_area_struct *vma) {}
> >  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> >               { mmap_assert_write_locked(vma->vm_mm); }
> > +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> > +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> >  static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> >  static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index d603494e69d7..b9cf552e120c 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *=
vmg,
> >       vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
> >
> >       if (expanded)
> > -             vma_iter_store(vmg->vmi, vmg->vma);
> > +             vma_iter_store_attached(vmg->vmi, vmg->vma);
> >
> >       if (adj_start) {
> >               adjust->vm_start +=3D adj_start;
> >               adjust->vm_pgoff +=3D PHYS_PFN(adj_start);
> >               if (adj_start < 0) {
> >                       WARN_ON(expanded);
> > -                     vma_iter_store(vmg->vmi, adjust);
> > +                     vma_iter_store_attached(vmg->vmi, adjust);
> >               }
> >       }
>
> I kind of feel this whole function (that yes, I added :>) though derived
> from existing logic) needs rework, as it's necessarily rather confusing.
>
> But hey, that's on me :)
>
> But this does look right... OK see this as a note-to-self...
>
> >
> > @@ -2845,7 +2845,7 @@ int expand_upwards(struct vm_area_struct *vma, un=
signed long address)
> >                               anon_vma_interval_tree_pre_update_vma(vma=
);
> >                               vma->vm_end =3D address;
> >                               /* Overwrite old entry in mtree. */
> > -                             vma_iter_store(&vmi, vma);
> > +                             vma_iter_store_attached(&vmi, vma);
> >                               anon_vma_interval_tree_post_update_vma(vm=
a);
> >
> >                               perf_event_mmap(vma);
> > @@ -2925,7 +2925,7 @@ int expand_downwards(struct vm_area_struct *vma, =
unsigned long address)
> >                               vma->vm_start =3D address;
> >                               vma->vm_pgoff -=3D grow;
> >                               /* Overwrite old entry in mtree. */
> > -                             vma_iter_store(&vmi, vma);
> > +                             vma_iter_store_attached(&vmi, vma);
> >                               anon_vma_interval_tree_post_update_vma(vm=
a);
> >
> >                               perf_event_mmap(vma);
> > diff --git a/mm/vma.h b/mm/vma.h
> > index 2a2668de8d2c..63dd38d5230c 100644
> > --- a/mm/vma.h
> > +++ b/mm/vma.h
> > @@ -365,9 +365,10 @@ static inline struct vm_area_struct *vma_iter_load=
(struct vma_iterator *vmi)
> >  }
> >
> >  /* Store a VMA with preallocated memory */
> > -static inline void vma_iter_store(struct vma_iterator *vmi,
> > -                               struct vm_area_struct *vma)
> > +static inline void vma_iter_store_attached(struct vma_iterator *vmi,
> > +                                        struct vm_area_struct *vma)
> >  {
> > +     vma_assert_attached(vma);
> >
> >  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
> >       if (MAS_WARN_ON(&vmi->mas, vmi->mas.status !=3D ma_start &&
> > @@ -390,7 +391,13 @@ static inline void vma_iter_store(struct vma_itera=
tor *vmi,
> >
> >       __mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
> >       mas_store_prealloc(&vmi->mas, vma);
> > +}
> > +
> > +static inline void vma_iter_store(struct vma_iterator *vmi,
> > +                               struct vm_area_struct *vma)
> > +{
> >       vma_mark_attached(vma);
> > +     vma_iter_store_attached(vmi, vma);
> >  }
> >
>
> See comment at top, and we need some comments here to explain why we're
> going to pains to do this.

Ack. I'll amend the patch description to make that clear.

>
> What about mm/nommu.c? I guess these cases are always new VMAs.

CONFIG_PER_VMA_LOCK depends on !CONFIG_NOMMU, so for nommu case all
these attach/detach functions become NOPs.

>
> We probably definitely need to check this series in a nommu setup, have y=
ou
> done this? As I can see this breaking things. Then again I suppose you'd
> have expected bots to moan by now...
>
> >  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
