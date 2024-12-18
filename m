Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400FE1991AA
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 19:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734550177; cv=none; b=Sxv+mNZtjhpp59FBz/X4/k9qdiEayFMZVfALayw2mqVpCaNQVAafFGsf5V7UbAqKSOzgtiE8jjTdM9AtkWqxycFnRvTIpefBBVb7KwJDylpfcZz+hOjDHlvuVpp+ttRYDSXMe+Rg3V4H87Bq1aoRnED33U0FWZwoC7KK0mDCoRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734550177; c=relaxed/simple;
	bh=/s1JUHeHNmzq3Q1WOwiWX7Qob0lN00XgSPH7KhWCCUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XxTMEW4uYvFkDjqMpkLNsaxmQYk/7JAiS4oKuY/WmHJrXj2+xu+3BeE+pNqn4x0Ez0RrxRMABAErTBtFP3xIMugViiHxTBgvdf/XW1f30ecOjiq2/GUkQOVUGhbi9BRvV+0LYY4jnag0qQAjDcbyBi+LbqEXzKZrYUitzSZ7vAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RsnNfEax; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RsnNfEax"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467896541e1so30011cf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 11:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550175; x=1735154975; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT/oY0PQ596qVWP+3Kuq6q37E95JDYYqyXZaZRZ2Spc=;
        b=RsnNfEaxkb9cPayNQtb98lKGbGqpWe+oMQFnCNCGGD8x8+4BT8QYTb1xazgc4mcTau
         jzw0aJmt8ThiKueGh9Xi3gR0xt1ssCIlZtbQCyBw9qZXRreJHU3hZJ8HsU0v7Bo79n7h
         +IE7qokWfTD9YIEcXrS/1Y8hdHB3csH0GRTbqfpIXSovfW34X4VbUp/dkJhNWxtt15pn
         /7EhTsw1XsiwsjbZaPPto3QYnAYXOsvg5ysn40bxCzWV6YQMVXYIoZrSxMClv2n5LPo8
         LsaYYzrFvnde7cOHAq8+uIAIo9rObJxSu1AlVSWd8tq0ZngdzKJYkMyZTgr6RE7Pysbo
         YANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550175; x=1735154975;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jT/oY0PQ596qVWP+3Kuq6q37E95JDYYqyXZaZRZ2Spc=;
        b=tlsx2oyEsevzFFdHfQQOAUA9ERyP/DZSpBMPCWSpFB9/LfEc1NtWW17ymb9Qwd2ZFh
         ALSQz0jX+hT4XOwGHDSqLoYYiKI3p5kDJ7wfSkKpJBtRN/SR9yjhe5Rf/qpDkaMuulQF
         xEc93fSCB582fN93NFOrUnWYKBK7klQrjDLX/acO4KlQRigO8zXIn1f4Z8HRk1iB/uIc
         vus6kaKosxH4HC2GJeLTby0XlP9yJBq3Wu7Xz+9uw9EMYG5+NNqyTfmk0JbAFueYJUlM
         af2o+446s8Kv6lZeMTVAI0GKWgunfRGjGjti0oWMM74RI8gO6a1iwdjRXJJV1hR+9Es3
         GA2g==
X-Forwarded-Encrypted: i=1; AJvYcCVsza5KR9JQD8ymmAu6m/SSILjps2q4ilef4p+lLRhevxpvlB18PagGG0xObV0mGCKf3ig1hYXyjS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaowdN+XAV/b8MDe3nzJZzAnKnZ1tXd73UTbjGWs/TQL6GVBTF
	iaixVj0AMX4c0O82DwfRsy81wlspKydZnb09Q6hN5YipSaIfNiGef7saxPW7YpGUeAh59g6f4tm
	aN9B/EC9U/buR/tRPk54LpBYtdL95scTlvaBu
X-Gm-Gg: ASbGncsFjB2rPkUc9dtmVdsCEWNvt230/2+TNvMMYoTygnU9wVXPj/Zx9G4K64p4QRa
	oOuztwmlYgd8p+ydsD7EV5tblIPkKPD1NXCTcMLRsupZlO8wThLpIws7oB0MG2qio/j+2
X-Google-Smtp-Source: AGHT+IFkOerVfN+EW7UZy7TtsC5G5bm2kupymicsUD0On/kxIkbwfv+Pnl3ZElM0AJwwf1hx/25YqszqNlVleP/udK8=
X-Received: by 2002:ac8:66d7:0:b0:467:8f1e:7304 with SMTP id
 d75a77b69052e-46a3bba9d31mr251161cf.13.1734550174621; Wed, 18 Dec 2024
 11:29:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net> <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net> <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net> <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae> <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
In-Reply-To: <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 11:29:23 -0800
Message-ID: <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
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

On Wed, Dec 18, 2024 at 11:07=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Wed, Dec 18, 2024 at 11:00=E2=80=AFAM 'Liam R. Howlett' via kernel-tea=
m
> <kernel-team@android.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [241218 12:58]:
> > > On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <peterz@infrad=
ead.org> wrote:
> > > >
> > > > On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasaryan wrote:
> > > >
> > > > > > You will not. vms_complete_munmap_vmas() will call remove_vma()=
 to
> > > > > > remove PTEs IIRC, and if you do start_write() and detach() befo=
re
> > > > > > dropping mmap_lock_write, you should be good.
> > > > >
> > > > > Ok, I think we will have to move mmap_write_downgrade() inside
> > > > > vms_complete_munmap_vmas() to be called after remove_vma().
> > > > > vms_clear_ptes() is using vmas, so we can't move remove_vma() bef=
ore
> > > > > mmap_write_downgrade().
> > > >
> > > > Why ?!
> > > >
> > > > vms_clear_ptes() and remove_vma() are fine where they are -- there =
is no
> > > > concurrency left at this point.
> > > >
> > > > Note that by doing vma_start_write() inside vms_complete_munmap_vma=
s(),
> > > > which is *after* the vmas have been unhooked from the mm, you wait =
for
> > > > any concurrent user to go away.
> > > >
> > > > And since they're unhooked, there can't be any new users.
> > > >
> > > > So you're the one and only user left, and code is fine the way it i=
s.
> > >
> > > Ok, let me make sure I understand this part of your proposal. From
> > > your earlier email:
> > >
> > > @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struct
> > > vma_munmap_struct *vms,
> > >         struct vm_area_struct *vma;
> > >         struct mm_struct *mm;
> > >
> > > +       mas_for_each(mas_detach, vma, ULONG_MAX) {
> > > +               vma_start_write(next);
> > > +               vma_mark_detached(next, true);
> > > +       }
> > > +
> > >         mm =3D current->mm;
> > >         mm->map_count -=3D vms->vma_count;
> > >         mm->locked_vm -=3D vms->locked_vm;
> > >
> > > This would mean:
> > >
> > > vms_complete_munmap_vmas
> > >            vma_start_write
> > >            vma_mark_detached
> > >            mmap_write_downgrade
> > >            vms_clear_ptes
> > >            remove_vma
> > >
> > > And remove_vma will be just freeing the vmas. Is that correct?
> > > I'm a bit confused because the original thinking was that
> > > vma_mark_detached() would drop the last refcnt and if it's 0 we would
> > > free the vma right there. If that's still what we want to do then I
> > > think the above sequence should look like this:
> > >
> > > vms_complete_munmap_vmas
> > >            vms_clear_ptes
> > >            remove_vma
> > >                vma_start_write
> > >                vma_mark_detached
> > >            mmap_write_downgrade
> > >
> > > because vma_start_write+vma_mark_detached should be done under  mmap_=
write_lock.
> > > Please let me know which way you want to move forward.
> > >
> >
> > Are we sure we're not causing issues with the MAP_FIXED path here?
> >
> > With the above change, we'd be freeing the PTEs before marking the vmas
> > as detached or vma_start_write().
>
> IIUC when we call vms_complete_munmap_vmas() all vmas inside
> mas_detach have been already write-locked, no?

Yeah, I think we can simply do this:

vms_complete_munmap_vmas
           vms_clear_ptes
           remove_vma
               vma_mark_detached
           mmap_write_downgrade

If my assumption is incorrect, assertion inside vma_mark_detached()
should trigger. I tried a quick test and so far nothing exploded.

>
> >
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to kernel-team+unsubscribe@android.com.
> >
