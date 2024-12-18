Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C249E158536
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 20:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734552071; cv=none; b=kHfAJUl/KRosD3Lr+TThcBbFhx/oAt8V7KViWuUSEtNxpM+FEkgPtzAD+eXUQD2HoCMNtXH396YCoQJT5lRP8V1idhjMhbtfoRfr3fM8Tf/07lcUm+qP7fMEayoZjO3Uj5Bvzzb3LQK1V1Djwefm1TJiCJwUqv7t064hw7voMkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734552071; c=relaxed/simple;
	bh=clm8bVQL1sQfCeKp2AJr6GdSuWV19A4GMSpDtUbjKrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=cWhwbSWaSNLdj+wbTvXAIWYnvjlokiEL1uw9IBm8WoHD8tcc8mp37QWyFlHDn+ruOe8xyGixmPN0XtaFdesoSltiyj4TVM/6bnfTuS98rueFYgxAzXtVZfkdlg5+W7VD5UpbJFy525VmKD8xi4onG8FTBxXFIJrzzsXWUzcytAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VfoCxxb3; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VfoCxxb3"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4679b5c66d0so33821cf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 12:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734552068; x=1735156868; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R2Azbdkaj9TcrRiCPTKBbgal58RMiWaSFnNN0SVUfQ=;
        b=VfoCxxb36Afq67B2HruUBjhCtFvaItJJno4kc66W9thdAUzRmlEn6S30KRgG+iVnFa
         UY4XasLvFO2q8MrgqIo96jeLlYYn3U89jbjfqDGa0nbXntwacdBCa39t/14+tx4AcE+l
         Xtu9u1olxqH66k30eQb9jNrh515E52bQemcrJjXbeB1mhU07Gk60ExLZSIXi+wuxvKsy
         3GZM3EJxXkINFpJXc92MMT7LmAHxSDQoJZW0d29vBwDBEY2YTgr0DTHhdhzU7zWjIGFo
         aHTjdcoDs9fIQDhCaf5EYopLobcmUM7DmYEL40FgBCJDtpKrVr0L4QSqvPxYA6DRZ26p
         Bxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734552068; x=1735156868;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R2Azbdkaj9TcrRiCPTKBbgal58RMiWaSFnNN0SVUfQ=;
        b=iU14fapgdLA47ITvdKqOLWA9QaRhe4v+l14ghLFUMLT8/xKlh9hOWLaZXrdgtlApvT
         /Ea0zPVUdasNkS5CpX7NLN0Ubp6ByW/Hj9v704B09j1wGAx41iiirQEiSx4hIL6NtvxH
         kxRJjbqLivi99jhpW1KIId/OJF2Ydq5L07ya/TqhZC6PoI5mA/dNnGyHkkwOV56o5Mqk
         RAW1TPdRw+XQAY4R2buApLjKhu0mFdxjb3Q5aCxo7oE9LylyyLOC2e6MFwqJyAPOYHmi
         x1X3cfO0B615fEwC1BDY3lJxX3Dk4iweE1BNbyPlcE+2GyPPc5Lg33GwJalkl6YV2OU7
         Gs/g==
X-Forwarded-Encrypted: i=1; AJvYcCWarLncC5hN8LxTt/jnS6Ca5kVw7nBAxPo83uOPcGo01iJeYK7FUOkSwikec4DlLeVOcuvt4LIi/l4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI9FSK6wlxpwhK4Lf0iZdx45bhyiP0dRIwOwAnmLggQtNd2ZyL
	teykHoH4tzYNr1C8ZTorSweRzx2sFSeR9hzdwOj80Wkp8w3QjeYQ660B26O+fIxZkNMEwLfyiP2
	S/b9/l886D92rUSeT6qklNg5If2sfpPR3tP4R
X-Gm-Gg: ASbGncsYKM2rspX4SBCEw/6e7Qr08u+2HwvFNK6GvW+oiERgjfmioice5kyoWA/9JfX
	G2P4LRj62dn6MvZdnfESpq/ZKSdvB2gE60OwtEh6QcoS3nR6PxQFh0OU/CY4xHnq7ftg3
X-Google-Smtp-Source: AGHT+IHGCFsVgJFmpVC4q4ly5hhcScG7IXhIrf2ICPiDSy35AQoMyktvXGdKUL5cv5mHtIQe9QMJ+JYWrsDRBcQgFQo=
X-Received: by 2002:a05:622a:4d4:b0:466:8887:6751 with SMTP id
 d75a77b69052e-46a3bc2ffb2mr252221cf.23.1734552068350; Wed, 18 Dec 2024
 12:01:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net> <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net> <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com> <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
In-Reply-To: <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 12:00:56 -0800
Message-ID: <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
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

On Wed, Dec 18, 2024 at 11:38=E2=80=AFAM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [241218 14:29]:
> > On Wed, Dec 18, 2024 at 11:07=E2=80=AFAM Suren Baghdasaryan <surenb@goo=
gle.com> wrote:
> > >
> > > On Wed, Dec 18, 2024 at 11:00=E2=80=AFAM 'Liam R. Howlett' via kernel=
-team
> > > <kernel-team@android.com> wrote:
> > > >
> > > > * Suren Baghdasaryan <surenb@google.com> [241218 12:58]:
> > > > > On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <peterz@in=
fradead.org> wrote:
> > > > > >
> > > > > > On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasaryan wr=
ote:
> > > > > >
> > > > > > > > You will not. vms_complete_munmap_vmas() will call remove_v=
ma() to
> > > > > > > > remove PTEs IIRC, and if you do start_write() and detach() =
before
> > > > > > > > dropping mmap_lock_write, you should be good.
> > > > > > >
> > > > > > > Ok, I think we will have to move mmap_write_downgrade() insid=
e
> > > > > > > vms_complete_munmap_vmas() to be called after remove_vma().
> > > > > > > vms_clear_ptes() is using vmas, so we can't move remove_vma()=
 before
> > > > > > > mmap_write_downgrade().
> > > > > >
> > > > > > Why ?!
> > > > > >
> > > > > > vms_clear_ptes() and remove_vma() are fine where they are -- th=
ere is no
> > > > > > concurrency left at this point.
> > > > > >
> > > > > > Note that by doing vma_start_write() inside vms_complete_munmap=
_vmas(),
> > > > > > which is *after* the vmas have been unhooked from the mm, you w=
ait for
> > > > > > any concurrent user to go away.
> > > > > >
> > > > > > And since they're unhooked, there can't be any new users.
> > > > > >
> > > > > > So you're the one and only user left, and code is fine the way =
it is.
> > > > >
> > > > > Ok, let me make sure I understand this part of your proposal. Fro=
m
> > > > > your earlier email:
> > > > >
> > > > > @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struc=
t
> > > > > vma_munmap_struct *vms,
> > > > >         struct vm_area_struct *vma;
> > > > >         struct mm_struct *mm;
> > > > >
> > > > > +       mas_for_each(mas_detach, vma, ULONG_MAX) {
> > > > > +               vma_start_write(next);
> > > > > +               vma_mark_detached(next, true);
> > > > > +       }
> > > > > +
> > > > >         mm =3D current->mm;
> > > > >         mm->map_count -=3D vms->vma_count;
> > > > >         mm->locked_vm -=3D vms->locked_vm;
> > > > >
> > > > > This would mean:
> > > > >
> > > > > vms_complete_munmap_vmas
> > > > >            vma_start_write
> > > > >            vma_mark_detached
> > > > >            mmap_write_downgrade
> > > > >            vms_clear_ptes
> > > > >            remove_vma
> > > > >
> > > > > And remove_vma will be just freeing the vmas. Is that correct?
> > > > > I'm a bit confused because the original thinking was that
> > > > > vma_mark_detached() would drop the last refcnt and if it's 0 we w=
ould
> > > > > free the vma right there. If that's still what we want to do then=
 I
> > > > > think the above sequence should look like this:
> > > > >
> > > > > vms_complete_munmap_vmas
> > > > >            vms_clear_ptes
> > > > >            remove_vma
> > > > >                vma_start_write
> > > > >                vma_mark_detached
> > > > >            mmap_write_downgrade
> > > > >
> > > > > because vma_start_write+vma_mark_detached should be done under  m=
map_write_lock.
> > > > > Please let me know which way you want to move forward.
> > > > >
> > > >
> > > > Are we sure we're not causing issues with the MAP_FIXED path here?
> > > >
> > > > With the above change, we'd be freeing the PTEs before marking the =
vmas
> > > > as detached or vma_start_write().
> > >
> > > IIUC when we call vms_complete_munmap_vmas() all vmas inside
> > > mas_detach have been already write-locked, no?
>
> That's the way it is today - but I thought you were moving the lock to
> the complete stage, not adding a new one? (why add a new one otherwise?)

Is my understanding correct that mas_detach is populated by
vms_gather_munmap_vmas() only with vmas that went through
__split_vma() (and were write-locked there)? I don't see any path that
would add any other vma into mas_detach but maybe I'm missing
something?

>
> >
> > Yeah, I think we can simply do this:
> >
> > vms_complete_munmap_vmas
> >            vms_clear_ptes
> >            remove_vma
> >                vma_mark_detached
> >            mmap_write_downgrade
> >
> > If my assumption is incorrect, assertion inside vma_mark_detached()
> > should trigger. I tried a quick test and so far nothing exploded.
> >
>
> If they are write locked, then the page faults are not a concern.  There
> is also the rmap race that Jann found in mmap_region() [1].  This is
> probably also fine since you are keeping the write lock in place earlier
> on in the gather stage.  Note the ptes will already be cleared by the
> time vms_complete_munmap_vmas() is called in this case.
>
> [1] https://lore.kernel.org/all/CAG48ez0ZpGzxi=3D-5O_uGQ0xKXOmbjeQ0LjZsRJ=
1Qtf2X5eOr1w@mail.gmail.com/
>
> Thanks,
> Liam
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
