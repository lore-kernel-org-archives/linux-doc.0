Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C61FC102
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 21:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734558812; cv=none; b=IXnp/npOCSpU3kH2mmNvfSP+xosJz83OkVHQvww7NhSGQMTHncrc2n99KJjCmdT89CpitXATVTMVhNP2IcnTTgKW6xWJBpCGUGGIuvqJaHXR4QML1fYj/d6OgkucJe5/6IwCu3lpNnj6rgovliK3QjPJv73Yn6NeHZi4ofriK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734558812; c=relaxed/simple;
	bh=KwTwssGSjYuugGZ2Da8Oyh2h07pURN95f9rYNTjGv48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=LlJ0VJBeOlimbAv/RrhTw4J6lvH1K5W28NUAa7bvC6Gjm/70PFewJKYnMUjwKctCZjzFz7R81W8HfqnbvDItG3Fll7T80u+olDEt2yxrWmy7pH6JqRhDn1eRF5yGG3W5PtClE/7QGCKsybfuce+IPBCE91UZB0OClaNQ15jbmZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1YQbQO96; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1YQbQO96"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467896541e1so69721cf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 13:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734558809; x=1735163609; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/JLu6T0oQIGjWC8Vgw4keUhQ07kt7/iqExEFuVaHgE=;
        b=1YQbQO96UT3l00Ks9TKGXlSsPRrZ5PnPiY6ksxyasg6uJp8usgOXXL7yJSHvt7jRrT
         Eh0AHoz41wU7G32blJHR7FLyN5DCjIdiPHKK4WRVdqkFpLyRPK+rBncd8nJKH4tiVP7h
         CCQKnLe+7d+nIE0xc7B1kIgjC3OFPIu+40R9YbmdlrUdXHirUS80vTfFZ2iAK6dB550S
         7+8gI2eXOEiJATeI2YbrANcmVADuKuWTwUJkz3HEgZoDWp+PoIsL6BpK/Bt9rrOKE1Gq
         wpmvdR5c8OQm+pAfDV17UMKFOyCI1p1/zqMGIR97oRd3u56HQqF1aRs4Rr/vmgWdDbqP
         IkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734558809; x=1735163609;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/JLu6T0oQIGjWC8Vgw4keUhQ07kt7/iqExEFuVaHgE=;
        b=lqIPx1Si7evXfSon0OHKdaNp3HlvK6bEibnPJ6q2zY0yxKuD1mbfE2aI8h5eXnmM9l
         YrIrmnjEldFoxLZb5TYTRkS0r9L8UreknGi7ZJne5kFsS37nvtD4kftaa0eTcVOuPz26
         Pt6zH1Gfy68lbbofYSfxuND+/BpqcP6/rId+jY1OG2dzsH1UV3F6iUTDg6LfLb5NODxg
         27XBdtxjRIqlBU90+0uHGaiF4lWEjyKYN+zh/x/rZ2NzKyQdQoU/HVkZwu4qp/slxlSv
         5AqyeYS1tX+zaMevuRR54CAdqtRU6aKRAzaZasiuDkEdldHLH0+tDm0+QOIKowQlAK9t
         5H1A==
X-Forwarded-Encrypted: i=1; AJvYcCXRc8MKvmFRM9lTfN4ecooltYZcI0aSv4Vy0ssW1/kGTE8kgpNQq42OvXtG7sdPp4yv1qFrnjRuHj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1xa4hKo5i8vOfkfbmdMfiAz84qKp1TPFMw0bHdIssh3W/LVQS
	PA3u3Sw++mOEXgwrI1SJ6XLx3jYlkAui97e6eGpVB+ywps6bPF81zUCqdk3UknzbUijn016Xw5L
	OanYLjHfMlh+wZFF8mjwEaM/jMxdZROrsThs8
X-Gm-Gg: ASbGnct0HaqInauTNmZJSXVbHo/mv22WznijttsSR+yO9dUCTdIJ4zgREAsirnuEpdv
	yTvVUrg03srGVa4GLGsAjSse0uv0CQfskAtbvVcC/jrRao0aSGnE6yDZLaFvBemgA4WwM
X-Google-Smtp-Source: AGHT+IGTvjtHfkSnsti1gp6AxGHe6GoyfbxsCNyIl+Zw83NzTtoMzAa2jWNZftX/4UQEDHCkuCHPwDVAFj/JXl9yarI=
X-Received: by 2002:a05:622a:4cf:b0:461:4150:b835 with SMTP id
 d75a77b69052e-46a3b94fdc2mr817961cf.6.1734558808650; Wed, 18 Dec 2024
 13:53:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net> <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net> <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com> <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
In-Reply-To: <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 13:53:17 -0800
Message-ID: <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, akpm@linux-foundation.org, willy@infradead.org, 
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

On Wed, Dec 18, 2024 at 12:38=E2=80=AFPM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [241218 15:01]:
> > On Wed, Dec 18, 2024 at 11:38=E2=80=AFAM 'Liam R. Howlett' via kernel-t=
eam
> > <kernel-team@android.com> wrote:
> > >
> > > * Suren Baghdasaryan <surenb@google.com> [241218 14:29]:
> > > > On Wed, Dec 18, 2024 at 11:07=E2=80=AFAM Suren Baghdasaryan <surenb=
@google.com> wrote:
> > > > >
> > > > > On Wed, Dec 18, 2024 at 11:00=E2=80=AFAM 'Liam R. Howlett' via ke=
rnel-team
> > > > > <kernel-team@android.com> wrote:
> > > > > >
> > > > > > * Suren Baghdasaryan <surenb@google.com> [241218 12:58]:
> > > > > > > On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <peter=
z@infradead.org> wrote:
> > > > > > > >
> > > > > > > > On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasarya=
n wrote:
> > > > > > > >
> > > > > > > > > > You will not. vms_complete_munmap_vmas() will call remo=
ve_vma() to
> > > > > > > > > > remove PTEs IIRC, and if you do start_write() and detac=
h() before
> > > > > > > > > > dropping mmap_lock_write, you should be good.
> > > > > > > > >
> > > > > > > > > Ok, I think we will have to move mmap_write_downgrade() i=
nside
> > > > > > > > > vms_complete_munmap_vmas() to be called after remove_vma(=
).
> > > > > > > > > vms_clear_ptes() is using vmas, so we can't move remove_v=
ma() before
> > > > > > > > > mmap_write_downgrade().
> > > > > > > >
> > > > > > > > Why ?!
> > > > > > > >
> > > > > > > > vms_clear_ptes() and remove_vma() are fine where they are -=
- there is no
> > > > > > > > concurrency left at this point.
> > > > > > > >
> > > > > > > > Note that by doing vma_start_write() inside vms_complete_mu=
nmap_vmas(),
> > > > > > > > which is *after* the vmas have been unhooked from the mm, y=
ou wait for
> > > > > > > > any concurrent user to go away.
> > > > > > > >
> > > > > > > > And since they're unhooked, there can't be any new users.
> > > > > > > >
> > > > > > > > So you're the one and only user left, and code is fine the =
way it is.
> > > > > > >
> > > > > > > Ok, let me make sure I understand this part of your proposal.=
 From
> > > > > > > your earlier email:
> > > > > > >
> > > > > > > @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(s=
truct
> > > > > > > vma_munmap_struct *vms,
> > > > > > >         struct vm_area_struct *vma;
> > > > > > >         struct mm_struct *mm;
> > > > > > >
> > > > > > > +       mas_for_each(mas_detach, vma, ULONG_MAX) {
> > > > > > > +               vma_start_write(next);
> > > > > > > +               vma_mark_detached(next, true);
> > > > > > > +       }
> > > > > > > +
> > > > > > >         mm =3D current->mm;
> > > > > > >         mm->map_count -=3D vms->vma_count;
> > > > > > >         mm->locked_vm -=3D vms->locked_vm;
> > > > > > >
> > > > > > > This would mean:
> > > > > > >
> > > > > > > vms_complete_munmap_vmas
> > > > > > >            vma_start_write
> > > > > > >            vma_mark_detached
> > > > > > >            mmap_write_downgrade
> > > > > > >            vms_clear_ptes
> > > > > > >            remove_vma
> > > > > > >
> > > > > > > And remove_vma will be just freeing the vmas. Is that correct=
?
> > > > > > > I'm a bit confused because the original thinking was that
> > > > > > > vma_mark_detached() would drop the last refcnt and if it's 0 =
we would
> > > > > > > free the vma right there. If that's still what we want to do =
then I
> > > > > > > think the above sequence should look like this:
> > > > > > >
> > > > > > > vms_complete_munmap_vmas
> > > > > > >            vms_clear_ptes
> > > > > > >            remove_vma
> > > > > > >                vma_start_write
> > > > > > >                vma_mark_detached
> > > > > > >            mmap_write_downgrade
> > > > > > >
> > > > > > > because vma_start_write+vma_mark_detached should be done unde=
r  mmap_write_lock.
> > > > > > > Please let me know which way you want to move forward.
> > > > > > >
> > > > > >
> > > > > > Are we sure we're not causing issues with the MAP_FIXED path he=
re?
> > > > > >
> > > > > > With the above change, we'd be freeing the PTEs before marking =
the vmas
> > > > > > as detached or vma_start_write().
> > > > >
> > > > > IIUC when we call vms_complete_munmap_vmas() all vmas inside
> > > > > mas_detach have been already write-locked, no?
> > >
> > > That's the way it is today - but I thought you were moving the lock t=
o
> > > the complete stage, not adding a new one? (why add a new one otherwis=
e?)
> >
> > Is my understanding correct that mas_detach is populated by
> > vms_gather_munmap_vmas() only with vmas that went through
> > __split_vma() (and were write-locked there)? I don't see any path that
> > would add any other vma into mas_detach but maybe I'm missing
> > something?
>
> No, that is not correct.
>
> vms_gather_munmap_vmas() calls split on the first vma, then adds all
> vmas that are within the range of the munmap() call.  Potentially
> splitting the last vma and adding that in the
> "if (next->vm_end > vms->end)" block.
>
> Sometimes this is a single vma that gets split twice, sometimes no
> splits happen and entire vmas are unmapped, sometimes it's just one vma
> that isn't split.
>
> My observation is the common case is a single vma, but besides that we
> see 3, and sometimes 7 at a time, but it could be any number of vmas and
> not all of them are split.
>
> There is a loop for_each_vma_range() that does:
>
> vma_start_write(next);
> mas_set(mas_detach, vms->mas_count++);
> mas_store_gfp(mas_detach, next, GFP_KERNEL);

Ah, ok I see now. I completely misunderstood what for_each_vma_range()
was doing.

Then I think vma_start_write() should remain inside
vms_gather_munmap_vmas() and all vmas in mas_detach should be
write-locked, even the ones we are not modifying. Otherwise what would
prevent the race I mentioned before?

__mmap_region
    __mmap_prepare
        vms_gather_munmap_vmas // adds vmas to be unmapped into mas_detach,
                                                      // some locked
by __split_vma(), some not locked

                                     lock_vma_under_rcu()
                                         vma =3D mas_walk // finds
unlocked vma also in mas_detach
                                         vma_start_read(vma) //
succeeds since vma is not locked
                                         // vma->detached, vm_start,
vm_end checks pass
                                     // vma is successfully read-locked

       vms_clean_up_area(mas_detach)
            vms_clear_ptes
                                     // steps on a cleared PTE
    __mmap_new_vma
        vma_set_range // installs new vma in the range
    __mmap_complete
        vms_complete_munmap_vmas // vmas are write-locked and detached
but it's too late



>
>
> >
> > >
> > > >
> > > > Yeah, I think we can simply do this:
> > > >
> > > > vms_complete_munmap_vmas
> > > >            vms_clear_ptes
> > > >            remove_vma
> > > >                vma_mark_detached
> > > >            mmap_write_downgrade
> > > >
> > > > If my assumption is incorrect, assertion inside vma_mark_detached()
> > > > should trigger. I tried a quick test and so far nothing exploded.
> > > >
> > >
> > > If they are write locked, then the page faults are not a concern.  Th=
ere
> > > is also the rmap race that Jann found in mmap_region() [1].  This is
> > > probably also fine since you are keeping the write lock in place earl=
ier
> > > on in the gather stage.  Note the ptes will already be cleared by the
> > > time vms_complete_munmap_vmas() is called in this case.
> > >
> > > [1] https://lore.kernel.org/all/CAG48ez0ZpGzxi=3D-5O_uGQ0xKXOmbjeQ0Lj=
ZsRJ1Qtf2X5eOr1w@mail.gmail.com/
> > >
> > > Thanks,
> > > Liam
> > >
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email to kernel-team+unsubscribe@android.com.
> > >
