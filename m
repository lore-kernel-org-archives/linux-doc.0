Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1D1C07C4
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790795; cv=none; b=KqCY39jyhPOIHwUBGDsi0716g4j7NRu35YxctvAXY3dPzjgiB2Q20ICBXv39yMzwxcZXPlGOJ7dz0Smo+aaFzQYZPNggx0NVBUrnLipNfMQmzzqBhD5ZHSa3IVNLc19ScM2DE5MO/mUetgkwYYBzfvwQUeuy4i4j0Hjgl76mh1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790795; c=relaxed/simple;
	bh=0T0/VQm99Ieki40ZbshGV0wUb0ra8N64ccH9/B/AoYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTGcXMCbLXQ9NRX6qHi/XObE0+BQHntikXBnPJXy151+zxxkMgEQlsmkWOPgsLztjxv0qyp34FAK4U2sUkeQa+32w2O5HlP/M1y9osSMxzYkCSbzakBofDOpjEa3WqqWtB3sL1pI3ChBQ7F6alKYsVo7nVXmtUmb15P6HpSa76I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3AY8MKsj; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3AY8MKsj"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467896541e1so4321cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 09:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736790792; x=1737395592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nq60D/wtnL7MJ0xSTzLn6BeiNY9D1QgksEuRNAoydAM=;
        b=3AY8MKsjBAnGYw67UOfiH6zYmy5vdXA1RFqALhcUq9csA0nIhjPPza7ZUaHjfc3Xu6
         /TNKu+K5iUzQ8D2fX01M3kNL2FwmpRn9/OCqxli7s88NG35zCclwfCJK5HbH/96jZuLz
         JG1wJ/0Kj375VkQ9n1Dgny9xNbKH2RHF1WgQiY9F2ZQzSDl2a+/aG9fWJt/WfIGo7G7a
         /+YzmAH2SlyqPYRcMIXakBsyg3JGKQn1ASJ07YFJvTNGlAp1XixGcnbuV3Wyx70Gt7QY
         uRz85Pr/mlr/1C1voJxZ8OIsX9dYLQHSUnP2CGZodfkHoa93EfG195GlrY9laPfqLqVM
         tVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790792; x=1737395592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq60D/wtnL7MJ0xSTzLn6BeiNY9D1QgksEuRNAoydAM=;
        b=qOOCWjgNlXK9x3+WhfhFmbdn1staEKyTVYTAPSu7AyBWjEmR4/b/JYixFVcMWwyqnq
         ZQK3Kemeh8diPLLgxgyDXorNILz2Zmy/Knj0VPxszI110tJcw2eDMQHM8TRATP0xuiUq
         zKAbkPrl6OUbr5aeeIR+9E3tKGyh5adw6OtIlDOxeX1OUjhjUW69ubnd3rz4ugU0Vnn0
         USFHq3JBskUoiyx4NwgcSLc9HSSy2Byj7rvKbU8RZDP94m810Nyk78R0tO24ASbOZZIA
         Z1gLeNvzquEvkTZHnHL1lUr8fTAYgobiwrqp6p/0yANb2fwT4ssCTOjbtmiLyaa3/Zsq
         1Uxg==
X-Forwarded-Encrypted: i=1; AJvYcCUuEF0Oc1mBX1JiA4YmNJkJVfzFvQzGNyMUi4hSEP1FOmDoqVCoO5AVfYlwITDX+vcYcIIviDx/Efg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4l2V6Cnj7OKtZG5ybXBJec5ohPLNIOT70wsv75mcsvZiUN+v
	PUIPelvyUNoq0ZkZzJfrju4BkxGOQg4I10eDoUz3YMepsrwUxfaLY/i6bVusEsE31WNRA0Mk0lL
	8iS793VnlQ8fGufKMBpjgaukAOri7w9b5llEs
X-Gm-Gg: ASbGncvPcQkqmqN/caNbscy3NAyjpQjYjNZo1YsbAuolG32RlP9Wpxgkk8VpFNFqQQB
	Cyiaa525es8Wp5qdx9OBE3HJaIIV7tHCXNcOkJg==
X-Google-Smtp-Source: AGHT+IHgp/eBIbrWKg0PPffLbeqwythp95UQ6YWsTKdDGsrGCUmxfCRxP4zOnorjo1pB/TEWA8j0R8ypqJMjCwf9DPs=
X-Received: by 2002:ac8:7dcc:0:b0:466:91fd:74c4 with SMTP id
 d75a77b69052e-46c87d08ee2mr11399381cf.0.1736790792331; Mon, 13 Jan 2025
 09:53:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-8-surenb@google.com>
 <038aaebd-264a-4e64-8777-4c4015401097@lucifer.local>
In-Reply-To: <038aaebd-264a-4e64-8777-4c4015401097@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 09:53:01 -0800
X-Gm-Features: AbW1kvbKYqt4l9pQoD7yxBpJLBveKcxRbQCvIKvr5hst8o5bNAAjPJtV2xqtilM
Message-ID: <CAJuCfpF4kqDfou6=1Vr4Gw0HJDAq_PGay3Jpypa8d2_kDsqwww@mail.gmail.com>
Subject: Re: [PATCH v9 07/17] mm: allow vma_start_read_locked/vma_start_read_locked_nested
 to fail
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

On Mon, Jan 13, 2025 at 7:25=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:54PM -0800, Suren Baghdasaryan wrote:
> > With upcoming replacement of vm_lock with vm_refcnt, we need to handle =
a
> > possibility of vma_start_read_locked/vma_start_read_locked_nested faili=
ng
> > due to refcount overflow. Prepare for such possibility by changing thes=
e
> > APIs and adjusting their users.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > ---
> >  include/linux/mm.h |  6 ++++--
> >  mm/userfaultfd.c   | 18 +++++++++++++-----
> >  2 files changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 2f805f1a0176..cbb4e3dbbaed 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -747,10 +747,11 @@ static inline bool vma_start_read(struct vm_area_=
struct *vma)
> >   * not be used in such cases because it might fail due to mm_lock_seq =
overflow.
> >   * This functionality is used to obtain vma read lock and drop the mma=
p read lock.
> >   */
> > -static inline void vma_start_read_locked_nested(struct vm_area_struct =
*vma, int subclass)
> > +static inline bool vma_start_read_locked_nested(struct vm_area_struct =
*vma, int subclass)
> >  {
> >       mmap_assert_locked(vma->vm_mm);
> >       down_read_nested(&vma->vm_lock.lock, subclass);
> > +     return true;
> >  }
> >
> >  /*
> > @@ -759,10 +760,11 @@ static inline void vma_start_read_locked_nested(s=
truct vm_area_struct *vma, int
> >   * not be used in such cases because it might fail due to mm_lock_seq =
overflow.
> >   * This functionality is used to obtain vma read lock and drop the mma=
p read lock.
> >   */
> > -static inline void vma_start_read_locked(struct vm_area_struct *vma)
> > +static inline bool vma_start_read_locked(struct vm_area_struct *vma)
> >  {
> >       mmap_assert_locked(vma->vm_mm);
> >       down_read(&vma->vm_lock.lock);
> > +     return true;
> >  }
> >
> >  static inline void vma_end_read(struct vm_area_struct *vma)
> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index 4527c385935b..411a663932c4 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -85,7 +85,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm=
_struct *mm,
> >       mmap_read_lock(mm);
> >       vma =3D find_vma_and_prepare_anon(mm, address);
> >       if (!IS_ERR(vma))
> > -             vma_start_read_locked(vma);
> > +             if (!vma_start_read_locked(vma))
> > +                     vma =3D ERR_PTR(-EAGAIN);
>
> Nit but this kind of reads a bit weirdly now:
>
>         if (!IS_ERR(vma))
>                 if (!vma_start_read_locked(vma))
>                         vma =3D ERR_PTR(-EAGAIN);
>
> Wouldn't this be nicer as:
>
>         if (!IS_ERR(vma) && !vma_start_read_locked(vma))
>                 vma =3D ERR_PTR(-EAGAIN);
>
> On the other hand, this embeds an action in an expression, but then it so=
rt of
> still looks weird.
>
>         if (!IS_ERR(vma)) {
>                 bool ok =3D vma_start_read_locked(vma);
>
>                 if (!ok)
>                         vma =3D ERR_PTR(-EAGAIN);
>         }
>
> This makes me wonder, now yes, we are truly bikeshedding, sorry, but mayb=
e we
> could just have vma_start_read_locked return a VMA pointer that could be =
an
> error?
>
> Then this becomes:
>
>         if (!IS_ERR(vma))
>                 vma =3D vma_start_read_locked(vma);

No, I think it would be wrong for vma_start_read_locked() to always
return EAGAIN when it can't lock the vma. The error code here is
context-dependent, so while EAGAIN is the right thing here, it might
not work for other future users.

>
> >
> >       mmap_read_unlock(mm);
> >       return vma;
> > @@ -1483,10 +1484,17 @@ static int uffd_move_lock(struct mm_struct *mm,
> >       mmap_read_lock(mm);
> >       err =3D find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, s=
rc_vmap);
> >       if (!err) {
> > -             vma_start_read_locked(*dst_vmap);
> > -             if (*dst_vmap !=3D *src_vmap)
> > -                     vma_start_read_locked_nested(*src_vmap,
> > -                                             SINGLE_DEPTH_NESTING);
> > +             if (vma_start_read_locked(*dst_vmap)) {
> > +                     if (*dst_vmap !=3D *src_vmap) {
> > +                             if (!vma_start_read_locked_nested(*src_vm=
ap,
> > +                                                     SINGLE_DEPTH_NEST=
ING)) {
> > +                                     vma_end_read(*dst_vmap);
>
> Hmm, why do we end read if the lock failed here but not above?

We have successfully done vma_start_read_locked(dst_vmap) (we locked
dest vma) but we failed to do vma_start_read_locked_nested(src_vmap)
(we could not lock src vma). So we should undo the dest vma locking.
Does that clarify the logic?

>
> > +                                     err =3D -EAGAIN;
> > +                             }
> > +                     }
> > +             } else {
> > +                     err =3D -EAGAIN;
> > +             }
> >       }
>
> This whole block is really ugly now, this really needs refactoring.
>
> How about (on assumption the vma_end_read() is correct):
>
>
>         err =3D find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, s=
rc_vmap);
>         if (err)
>                 goto out;
>
>         if (!vma_start_read_locked(*dst_vmap)) {
>                 err =3D -EAGAIN;
>                 goto out;
>         }
>
>         /* Nothing further to do. */
>         if (*dst_vmap =3D=3D *src_vmap)
>                 goto out;
>
>         if (!vma_start_read_locked_nested(*src_vmap,
>                                 SINGLE_DEPTH_NESTING)) {
>                 vma_end_read(*dst_vmap);
>                 err =3D -EAGAIN;
>         }
>
> out:
>         mmap_read_unlock(mm);
>         return err;
> }

Ok, that looks good to me. Will change this way.
Thanks!

>
> >       mmap_read_unlock(mm);
> >       return err;
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
