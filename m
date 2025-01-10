Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129920A5D6
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 22:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736548666; cv=none; b=UiE1MjDC2RVGl2PC4DXfuus/RMS6d55PokrWqxexwOEc9TwkoJzBBXjrCvs/i4xCh9Rq1IS6lJQGWwXS2BWF6J2txSH7wWzitNKC6Ig4hGRZx1a99yNjMI8Nt6UAM6SyAtwgQ/Gin2FQC1CJgAJdAr+cR/OebISB+wQOitisYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736548666; c=relaxed/simple;
	bh=Qlkz+NMFAHjmEc2ll7GptKsrzxNSDtdAOMTa2MFA3+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFF24HRdV5sH9/8J0PbNfi9SJtw7pYKvDaNDmiFrPFLz92luUa/nN0mIS9MN8n36utxb5V8gnxKGoJtTLHYHqUt4RooX5fVGwolJnSE5HQUWBL7muHRTbGdTdBKFxb2X9xyZ0wpqjo9FMlAcPJP9QWilGnYVHT1wR8ldlVD+rVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k6Y1wt0N; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k6Y1wt0N"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so70631cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 14:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736548663; x=1737153463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCsCbt/F7o+7bUFtMHgt+4W8wSxsiag28o1iJ0lUURU=;
        b=k6Y1wt0NG6CWvhAyeWj/4g33ydcbHFa25MTyhms3p19oFqdM4nZTUdRPxbolOtsaie
         NZm1dkW+YJo5J4N8Q/YX9IJinEjP8NpE3EwjdNzLLD+TCHFmwYiO8uGnnbZgdwKs6WzS
         WlRh7gG/Cwy2iCBbayfZNuEFOlyoR5Jlqs0GXao7hT2hJlC1QhXnaVnVQQP3xEDennsT
         MMV6OTHx6BIlRhm+/pmdBIrajIZJiSai9RUhNTQ/0gfaaFe2fwQ/wY1uQrYHMGRHZeFW
         FHzINHXVzm4a2ceDkFbA4ld7/9YvW8Pz1z04/LRQT3TSClTpdmyPKYkdyCTanRnPtI48
         MV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736548663; x=1737153463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCsCbt/F7o+7bUFtMHgt+4W8wSxsiag28o1iJ0lUURU=;
        b=rYoqCbkw7fEREqSNWYoYZ94FZjfUV33r878YaMsz0NIl8l3a2aFlpDCOOBbWT0g/r1
         hRvlpUTYfiJ+9EacdL1l0OsFaCax+1mjejtRqOQ9D1f9S0G/sX3hsl7WFpZ7c0gFKtY7
         kc0i4DOXjaukXlAIwe5pwb+lqoyJoEF7yIN7HQNh7An8mieUsk8lmGCmfk/uFcqVym8P
         iXwYf7yUn99bSYo08W9blq72Jk0pJxemmvlkKgEPJrDeWRZIY/mCF5DuU5/9Ct0fBhSk
         Xk/r9pNDkxfdT1AErQ5B8WEObRvBEoy/cu8WVXWcqZPurxcMYGpiehDKFFu8fPam7SFV
         R6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWu5DD9Eqf3nWQWPtevPv7gh6hE3B4+z83QAMWG3VXQc8LVX6eUXiyBkoQ9rnnNUG5/wkoFgfddl7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJSwpLBGlOgZRDsep3IJJB6Cl7fRCuhSKEcuSkzhvNOq9cZ0Zr
	dMN54uf1PwgSzIdaS5Kc1/T6RaCeXovlmPbGbuxpAFr18demo/xbXIrfPWCeK1u1ZGg71ZdS6Cx
	AFsge6OMMVOFKm+5zLXzOvpOqve6b9W6KEMTG
X-Gm-Gg: ASbGncvDZ/7tUIPBcJfaTA+fYb29TpxzOLAJWz4NH/fHHqZT/rsx62gVa9lYKHN1zyr
	fAzogBgpR6PHEuFWe8r16GS07AHafgvy2fbWQdg==
X-Google-Smtp-Source: AGHT+IE9TbOBUXKwhFL7KHGpiY4kYROhhORMvC39gdiYzTQrJx+eCn1R1EPTlvn2VmTqsz9si8WbaeNOdnU1/fWc6Dg=
X-Received: by 2002:a05:622a:4006:b0:467:86b4:4e92 with SMTP id
 d75a77b69052e-46c89deb0camr4751741cf.29.1736548662891; Fri, 10 Jan 2025
 14:37:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-12-surenb@google.com>
 <95e9d80e-6c19-4a1f-9c21-307006858dff@suse.cz> <CAJuCfpH_=JRSXHDsw1QSYxUk6Q=gSH26_Fm0bqCmSKR-NqDj4Q@mail.gmail.com>
 <bf7fd920-4c51-44f3-bf3e-8cfe2bb5f8a6@suse.cz>
In-Reply-To: <bf7fd920-4c51-44f3-bf3e-8cfe2bb5f8a6@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 14:37:31 -0800
X-Gm-Features: AbW1kvbCOp8K3P864gUWqlw7OPO8CAY5GJyIaJJ198lrylsF9s56o0p40lcVHsk
Message-ID: <CAJuCfpH8eTU3OaWAPh+ndr9MCRxb7OYeYqbyPxWqXw+HxFpgZg@mail.gmail.com>
Subject: Re: [PATCH v8 11/16] mm: replace vm_lock and detached flag with a
 reference count
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
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

On Fri, Jan 10, 2025 at 2:26=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 1/10/25 16:56, Suren Baghdasaryan wrote:
> >> > --- a/mm/memory.c
> >> > +++ b/mm/memory.c
> >> > @@ -6370,9 +6370,41 @@ struct vm_area_struct *lock_mm_and_find_vma(s=
truct mm_struct *mm,
> >> >  #endif
> >> >
> >> >  #ifdef CONFIG_PER_VMA_LOCK
> >> > +static inline bool __vma_enter_locked(struct vm_area_struct *vma, u=
nsigned int tgt_refcnt)
> >> > +{
> >> > +     /*
> >> > +      * If vma is detached then only vma_mark_attached() can raise =
the
> >> > +      * vm_refcnt. mmap_write_lock prevents racing with vma_mark_at=
tached().
> >> > +      */
> >> > +     if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> >> > +             return false;
> >> > +
> >> > +     rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> >> > +     rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> >> > +                refcount_read(&vma->vm_refcnt) =3D=3D tgt_refcnt,
> >> > +                TASK_UNINTERRUPTIBLE);
> >> > +     lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> >> > +
> >> > +     return true;
> >> > +}
> >> > +
> >> > +static inline void __vma_exit_locked(struct vm_area_struct *vma, bo=
ol *detached)
> >> > +{
> >> > +     *detached =3D refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_=
refcnt);
> >> > +     rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> >> > +}
> >> > +
> >> >  void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_=
lock_seq)
> >> >  {
> >> > -     down_write(&vma->vm_lock.lock);
> >> > +     bool locked;
> >> > +
> >> > +     /*
> >> > +      * __vma_enter_locked() returns false immediately if the vma i=
s not
> >> > +      * attached, otherwise it waits until refcnt is (VMA_LOCK_OFFS=
ET + 1)
> >> > +      * indicating that vma is attached with no readers.
> >> > +      */
> >> > +     locked =3D __vma_enter_locked(vma, VMA_LOCK_OFFSET + 1);
> >>
> >> Wonder if it would be slightly better if tgt_refcount was just 1 (or 0
> >> below in vma_mark_detached()) and the VMA_LOCK_OFFSET added to it in
> >> __vma_enter_locked() itself as it's the one adding it in the first pla=
ce.
> >
> > Well, it won't be called tgt_refcount then. Maybe "bool vma_attached"
> > and inside __vma_enter_locked() we do:
> >
> > unsigned int tgt_refcnt =3D VMA_LOCK_OFFSET + vma_attached ? 1 : 0;
> >
> > Is that better?
>
> Yeah I think so as it centralizes the target refcount logic into a single
> place __vma_enter_locked().
> Hm but then it's weird that __vma_start_write() would set vma_attached to
> true and yet it handles also a case where it's not attached.

Ah, good point.

> Maybe call the parameter "detaching" and switch the 0 and 1?

Yes, that would be less confusing. Thanks for the suggestion, I'll use it.
