Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A141F63D5
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734558971; cv=none; b=dT39EJzoHOyd93/7aiJ2IwQBfs6CppXIfA/FZG3oZIXYi1htuxfmzJqhR3xANSd1zZ6hetQLbn06Pddt6rHZeGIrF+B3aAWIp2cyRol9rTVeDiEsR0xluvilUxbnpU6uTQVvPSTj7ylJERBZ9BVYxISpikO84ogYI1iX89HU89E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734558971; c=relaxed/simple;
	bh=dqx1grITuX+1VHE7gmlURst0eBjKmtpquJm932VPpMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=q/7pxWuZRQ7nRmxt6wEmzjmvFxi3EyqBCj1VinGs7NKEgOqhhrbSMTy48ZwjUavUPNaSrXu/k/chJkKEwApiRn308ehJwd62gxmbI/qK0c6+OUMy5N0dAWrwrOahQuj0Q00za2S7JQDzV1auL3EIdwgvNss+sI2LnnO9Q/9fBEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XVt1gTAN; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVt1gTAN"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4679b5c66d0so11001cf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 13:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734558968; x=1735163768; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmtMmyE9unnAeQch+DCGTQFYo43RX5HpvanBLAqIy/g=;
        b=XVt1gTANPHi0GEmRnS/7Y5s/KXGeiNp7T+xxLnN150FDNw/e4fWsl5uUCouRJ3CgBl
         fBfHeQboGvZC7lfMX+pnKg7bSDjWayyi5icvvD+Kt2/MbCozk8f7t06Pesty2Ed44Df9
         PzFyh5e+rxXJtnnseGavc5f/p9cx/dkOH/ifJowHtZmDUgBLI6HcL5hkkAGPufebewmh
         rN1E5c53XhzEf9HRkTdGBR9y4SVMemNJNS7X7FV/THrl0effoZ4lL+k9GdwoYfKSOXaS
         OzMjS6FHlKEKYQ/TzvE3Y5vFc2bdy5tg/ljY5KUyq871vD31GzkhwsJQPTAv4tIishC3
         cvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734558968; x=1735163768;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmtMmyE9unnAeQch+DCGTQFYo43RX5HpvanBLAqIy/g=;
        b=q3jhN9SIvGhYtYIruDBRyPug+mH0Nwtt0S+ffp3i+TnFDR2piHJL0EIpDLtBRMD8Fd
         y6miq9AOA3BVIgdypzvWd2wYcUoBp8PJWMDMusRbXaNtNx6MqGtuaoKcwJvLrksDh0ir
         c9WYBjabdht4tiI1okaanuDKvdYVID4FMYnFXmaM5U+6alMXfwjyoNLWXUUQiiYiiJ9v
         W45ATMWpFPVZDHpCgfUGPjjfk0uuPYOJhNwdJlskshKflerWklVJyRv4xIRMnYjf0Jv4
         k0NPMd1EjM/EUS4kuoCPsXHwEILV0PeIgb09ci3FR/t4LBk089oSECfHdmi7G7EuDJB0
         cLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTc24lZnThDi51T5KtilOFj4eiIfmZOHTqSaPb9/QKwsi7EHUgFgYHaBgiUkBAf78BqczAbky9ehU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEfVwPqnrZ/tCI+1Bih/pDNOVu7Tn94QdiKnIVzhWesLTaTk96
	xtFeKu1hVpEp/5tqjL+AbDVPBGrwfhs113MFKlIcI2tLj6mjsO52NyPcmNVPrIMGKj4GvIYDKdY
	DrXqt1PGj+29a0xy26Wh7ZXKpa676zOvi1iRn
X-Gm-Gg: ASbGncuMrrmJklMLekLY0aN1A4+AfBonLqpmdJb8sDZkJYpQohdziB1iZObWbD8+kPU
	BX3fedqWnQrWKQla8sBmp3Se4zu/ZH5uDNWY4dWimc3+jm1lsDk8MshDODdozaA8DgFTp
X-Google-Smtp-Source: AGHT+IFaSx7VNvYcnc7jt9cgbQhcmvnVPtJBSA7nC/xLQItxx6f1/c4vGsBZpU9i2zMCtpnFOn7hEmDMBWdeAk5VlvY=
X-Received: by 2002:a05:622a:14c7:b0:461:67d8:1f50 with SMTP id
 d75a77b69052e-46a3b9797a9mr862371cf.4.1734558968078; Wed, 18 Dec 2024
 13:56:08 -0800 (PST)
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
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf> <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
In-Reply-To: <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 13:55:56 -0800
Message-ID: <CAJuCfpGghM0B9BJYoy91=zgUxTQRwCsG7ris6AhR2SGhGonANw@mail.gmail.com>
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

On Wed, Dec 18, 2024 at 1:53=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Wed, Dec 18, 2024 at 12:38=E2=80=AFPM Liam R. Howlett
> <Liam.Howlett@oracle.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [241218 15:01]:
> > > On Wed, Dec 18, 2024 at 11:38=E2=80=AFAM 'Liam R. Howlett' via kernel=
-team
> > > <kernel-team@android.com> wrote:
> > > >
> > > > * Suren Baghdasaryan <surenb@google.com> [241218 14:29]:
> > > > > On Wed, Dec 18, 2024 at 11:07=E2=80=AFAM Suren Baghdasaryan <sure=
nb@google.com> wrote:
> > > > > >
> > > > > > On Wed, Dec 18, 2024 at 11:00=E2=80=AFAM 'Liam R. Howlett' via =
kernel-team
> > > > > > <kernel-team@android.com> wrote:
> > > > > > >
> > > > > > > * Suren Baghdasaryan <surenb@google.com> [241218 12:58]:
> > > > > > > > On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <pet=
erz@infradead.org> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasar=
yan wrote:
> > > > > > > > >
> > > > > > > > > > > You will not. vms_complete_munmap_vmas() will call re=
move_vma() to
> > > > > > > > > > > remove PTEs IIRC, and if you do start_write() and det=
ach() before
> > > > > > > > > > > dropping mmap_lock_write, you should be good.
> > > > > > > > > >
> > > > > > > > > > Ok, I think we will have to move mmap_write_downgrade()=
 inside
> > > > > > > > > > vms_complete_munmap_vmas() to be called after remove_vm=
a().
> > > > > > > > > > vms_clear_ptes() is using vmas, so we can't move remove=
_vma() before
> > > > > > > > > > mmap_write_downgrade().
> > > > > > > > >
> > > > > > > > > Why ?!
> > > > > > > > >
> > > > > > > > > vms_clear_ptes() and remove_vma() are fine where they are=
 -- there is no
> > > > > > > > > concurrency left at this point.
> > > > > > > > >
> > > > > > > > > Note that by doing vma_start_write() inside vms_complete_=
munmap_vmas(),
> > > > > > > > > which is *after* the vmas have been unhooked from the mm,=
 you wait for
> > > > > > > > > any concurrent user to go away.
> > > > > > > > >
> > > > > > > > > And since they're unhooked, there can't be any new users.
> > > > > > > > >
> > > > > > > > > So you're the one and only user left, and code is fine th=
e way it is.
> > > > > > > >
> > > > > > > > Ok, let me make sure I understand this part of your proposa=
l. From
> > > > > > > > your earlier email:
> > > > > > > >
> > > > > > > > @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas=
(struct
> > > > > > > > vma_munmap_struct *vms,
> > > > > > > >         struct vm_area_struct *vma;
> > > > > > > >         struct mm_struct *mm;
> > > > > > > >
> > > > > > > > +       mas_for_each(mas_detach, vma, ULONG_MAX) {
> > > > > > > > +               vma_start_write(next);
> > > > > > > > +               vma_mark_detached(next, true);
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > >         mm =3D current->mm;
> > > > > > > >         mm->map_count -=3D vms->vma_count;
> > > > > > > >         mm->locked_vm -=3D vms->locked_vm;
> > > > > > > >
> > > > > > > > This would mean:
> > > > > > > >
> > > > > > > > vms_complete_munmap_vmas
> > > > > > > >            vma_start_write
> > > > > > > >            vma_mark_detached
> > > > > > > >            mmap_write_downgrade
> > > > > > > >            vms_clear_ptes
> > > > > > > >            remove_vma
> > > > > > > >
> > > > > > > > And remove_vma will be just freeing the vmas. Is that corre=
ct?
> > > > > > > > I'm a bit confused because the original thinking was that
> > > > > > > > vma_mark_detached() would drop the last refcnt and if it's =
0 we would
> > > > > > > > free the vma right there. If that's still what we want to d=
o then I
> > > > > > > > think the above sequence should look like this:
> > > > > > > >
> > > > > > > > vms_complete_munmap_vmas
> > > > > > > >            vms_clear_ptes
> > > > > > > >            remove_vma
> > > > > > > >                vma_start_write
> > > > > > > >                vma_mark_detached
> > > > > > > >            mmap_write_downgrade
> > > > > > > >
> > > > > > > > because vma_start_write+vma_mark_detached should be done un=
der  mmap_write_lock.
> > > > > > > > Please let me know which way you want to move forward.
> > > > > > > >
> > > > > > >
> > > > > > > Are we sure we're not causing issues with the MAP_FIXED path =
here?
> > > > > > >
> > > > > > > With the above change, we'd be freeing the PTEs before markin=
g the vmas
> > > > > > > as detached or vma_start_write().
> > > > > >
> > > > > > IIUC when we call vms_complete_munmap_vmas() all vmas inside
> > > > > > mas_detach have been already write-locked, no?
> > > >
> > > > That's the way it is today - but I thought you were moving the lock=
 to
> > > > the complete stage, not adding a new one? (why add a new one otherw=
ise?)
> > >
> > > Is my understanding correct that mas_detach is populated by
> > > vms_gather_munmap_vmas() only with vmas that went through
> > > __split_vma() (and were write-locked there)? I don't see any path tha=
t
> > > would add any other vma into mas_detach but maybe I'm missing
> > > something?
> >
> > No, that is not correct.
> >
> > vms_gather_munmap_vmas() calls split on the first vma, then adds all
> > vmas that are within the range of the munmap() call.  Potentially
> > splitting the last vma and adding that in the
> > "if (next->vm_end > vms->end)" block.
> >
> > Sometimes this is a single vma that gets split twice, sometimes no
> > splits happen and entire vmas are unmapped, sometimes it's just one vma
> > that isn't split.
> >
> > My observation is the common case is a single vma, but besides that we
> > see 3, and sometimes 7 at a time, but it could be any number of vmas an=
d
> > not all of them are split.
> >
> > There is a loop for_each_vma_range() that does:
> >
> > vma_start_write(next);
> > mas_set(mas_detach, vms->mas_count++);
> > mas_store_gfp(mas_detach, next, GFP_KERNEL);
>
> Ah, ok I see now. I completely misunderstood what for_each_vma_range()
> was doing.
>
> Then I think vma_start_write() should remain inside
> vms_gather_munmap_vmas() and all vmas in mas_detach should be
> write-locked, even the ones we are not modifying. Otherwise what would
> prevent the race I mentioned before?
>
> __mmap_region
>     __mmap_prepare
>         vms_gather_munmap_vmas // adds vmas to be unmapped into mas_detac=
h,
>                                                       // some locked
> by __split_vma(), some not locked
>
>                                      lock_vma_under_rcu()
>                                          vma =3D mas_walk // finds
> unlocked vma also in mas_detach
>                                          vma_start_read(vma) //
> succeeds since vma is not locked
>                                          // vma->detached, vm_start,
> vm_end checks pass
>                                      // vma is successfully read-locked
>
>        vms_clean_up_area(mas_detach)
>             vms_clear_ptes
>                                      // steps on a cleared PTE
>     __mmap_new_vma
>         vma_set_range // installs new vma in the range
>     __mmap_complete
>         vms_complete_munmap_vmas // vmas are write-locked and detached
> but it's too late

Sorry about the formatting. Without comments should look better:

__mmap_region
    __mmap_prepare
        vms_gather_munmap_vmas

                                     lock_vma_under_rcu()
                                         vma =3D mas_walk
                                         vma_start_read(vma)
                                         // vma is still valid and attached

       vms_clean_up_area(mas_detach)
            vms_clear_ptes
                                     // steps on a cleared PTE
    __mmap_new_vma
        vma_set_range
    __mmap_complete
        vms_complete_munmap_vmas

>
>
>
> >
> >
> > >
> > > >
> > > > >
> > > > > Yeah, I think we can simply do this:
> > > > >
> > > > > vms_complete_munmap_vmas
> > > > >            vms_clear_ptes
> > > > >            remove_vma
> > > > >                vma_mark_detached
> > > > >            mmap_write_downgrade
> > > > >
> > > > > If my assumption is incorrect, assertion inside vma_mark_detached=
()
> > > > > should trigger. I tried a quick test and so far nothing exploded.
> > > > >
> > > >
> > > > If they are write locked, then the page faults are not a concern.  =
There
> > > > is also the rmap race that Jann found in mmap_region() [1].  This i=
s
> > > > probably also fine since you are keeping the write lock in place ea=
rlier
> > > > on in the gather stage.  Note the ptes will already be cleared by t=
he
> > > > time vms_complete_munmap_vmas() is called in this case.
> > > >
> > > > [1] https://lore.kernel.org/all/CAG48ez0ZpGzxi=3D-5O_uGQ0xKXOmbjeQ0=
LjZsRJ1Qtf2X5eOr1w@mail.gmail.com/
> > > >
> > > > Thanks,
> > > > Liam
> > > >
> > > > To unsubscribe from this group and stop receiving emails from it, s=
end an email to kernel-team+unsubscribe@android.com.
> > > >
