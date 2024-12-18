Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786801FAC40
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734548868; cv=none; b=hQehZObW2RNLUKb45zaU+UMd78SBn/bQcQixWfbpMM4evcfp+cPclgLZSGsBkah986j+Oh1RPeM2d3BfErSrmMSWPIZOdfYXJrpa+WRbSYWvDDodp/oMHuAPmF96Uc6uIRGq2mPkBCX6enM+Xv1lSkpAAa4vMOuUSMgyzlA25KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734548868; c=relaxed/simple;
	bh=Dlnc1evl0a2MZkILjtEUXlKttfD46cphr2GKLZLrDLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ZTxvOvmwbNxQGQ7CQ8IIwmnzAdL0sWl1ikDqxqh5eOYMddOEhsMZKsGyyqnXeLC/rlhf0GTZztJ87oYu6hxQzY0NbcGqJerlokZPQzCuztAVSCIQMmF6eUzTKSlwc5iCQ8vvFdFJL0IRUSVizMcwRw+/pmZcFtw6RBjkpE4X/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VDDTT3+X; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VDDTT3+X"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467abce2ef9so26471cf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 11:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734548865; x=1735153665; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXfGP1pWT/jQIZ61YS1DLkDzzBep0ydxP9xYrXLk2aA=;
        b=VDDTT3+XD0/FG6FlcTcxrZMfL0V9LynqakOWQ8z99T4ToFdREB5l5bdjT+V/FgDiLw
         gzh87kdQqknhSz1fSLPIYk3OreGBDZnYCwzPq7YvOfoll8GH+ax2FaUE0G8Yv3ZwRysE
         HsLe+mEZqADMQDfEi351lfqr/GOC4hWQ6iTo5P6m/qnyHcRcxYb5np/zN3BRzFa5zP2c
         R/19Ccs7wRun/BArrP15hVL4jaFnTG7R3c8qAF+T1VChhdb31ywg4Uln0GbwGQAV8VFN
         EXjJdiI6R6wYBtxlP6NEcknh6xJe7JJm1kLshOp0qWJKwJL/xoay1zH5cWpCNqOhdO9i
         rGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734548865; x=1735153665;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXfGP1pWT/jQIZ61YS1DLkDzzBep0ydxP9xYrXLk2aA=;
        b=t9YSqCkAQIGxh4T+b+5eB56JWswhrv4iFIF1+WOs/1gPfZeW4adM1MFGWcpd/DJsQW
         h+la4Y/jSf6yFWV7UHLT+0/nWb+/367Ebm8NWdDJOxE3KsQmgiP8CspophCB84D7+RMx
         QKyYSM8b/5V6+x9MHOFHCEOMTiNhOyNyBAAVA2Ve0jsmlrikGWsbWjI352FuzzIau1wQ
         r7O5PakwBMXOHNIG/W05wiYwKgTXmke8ZHrRohs4FkPBDGRZqyEP3prBKDy2Yjekc6LA
         Y2V17GGQgdMvZLnol2oA0hfi5l20u9ibX3grNdSthdFQ/edcpqi6WRZzGaWeRu+Xn6PY
         8qiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWgbw6qBpcCgJYsbOYizbqyTE7wLVziU/OL8rOLLctSfveE/ZKevlRLe7De0uYUMs/AS396ag9XbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHNE1sspAZ/CMKrDvODOXsQxd/cM5H0R5+qGKR2NR7pA+Vn+El
	YVCiQBdTyND/ZPewm+fhAGe2mO7nH105frRwpUTF/ZAg10zyIhzq5xZrPlCoym1c6TlJIXnCBtA
	nFbc2IOgW1SBqdnvffMZBJpzah9AxAxvGaLtT
X-Gm-Gg: ASbGncsBLwZAAeTu1IVFdW4LXdQzlkMUU118dPlHbS8Wth/H+upXTHLpEDSYfCnxhlg
	3MSdRrNcES2RPkFhE+v02HMVEY9QRMXMKKZEyhud21TYOGw/i/nK6/+LRFLdtTcwavOZX
X-Google-Smtp-Source: AGHT+IF5qzAUc76ucHvGqktFpDXtl1Nh+TfzWzL3j2xiMwfuBw+izHSw+QT9QOWz7HQSTrAS8hYB7j2Lq2/q1M3kdXE=
X-Received: by 2002:ac8:5f87:0:b0:466:97d6:b245 with SMTP id
 d75a77b69052e-46a3ba6786dmr137821cf.22.1734548865057; Wed, 18 Dec 2024
 11:07:45 -0800 (PST)
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
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
In-Reply-To: <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 11:07:33 -0800
Message-ID: <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
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

On Wed, Dec 18, 2024 at 11:00=E2=80=AFAM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [241218 12:58]:
> > On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasaryan wrote:
> > >
> > > > > You will not. vms_complete_munmap_vmas() will call remove_vma() t=
o
> > > > > remove PTEs IIRC, and if you do start_write() and detach() before
> > > > > dropping mmap_lock_write, you should be good.
> > > >
> > > > Ok, I think we will have to move mmap_write_downgrade() inside
> > > > vms_complete_munmap_vmas() to be called after remove_vma().
> > > > vms_clear_ptes() is using vmas, so we can't move remove_vma() befor=
e
> > > > mmap_write_downgrade().
> > >
> > > Why ?!
> > >
> > > vms_clear_ptes() and remove_vma() are fine where they are -- there is=
 no
> > > concurrency left at this point.
> > >
> > > Note that by doing vma_start_write() inside vms_complete_munmap_vmas(=
),
> > > which is *after* the vmas have been unhooked from the mm, you wait fo=
r
> > > any concurrent user to go away.
> > >
> > > And since they're unhooked, there can't be any new users.
> > >
> > > So you're the one and only user left, and code is fine the way it is.
> >
> > Ok, let me make sure I understand this part of your proposal. From
> > your earlier email:
> >
> > @@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struct
> > vma_munmap_struct *vms,
> >         struct vm_area_struct *vma;
> >         struct mm_struct *mm;
> >
> > +       mas_for_each(mas_detach, vma, ULONG_MAX) {
> > +               vma_start_write(next);
> > +               vma_mark_detached(next, true);
> > +       }
> > +
> >         mm =3D current->mm;
> >         mm->map_count -=3D vms->vma_count;
> >         mm->locked_vm -=3D vms->locked_vm;
> >
> > This would mean:
> >
> > vms_complete_munmap_vmas
> >            vma_start_write
> >            vma_mark_detached
> >            mmap_write_downgrade
> >            vms_clear_ptes
> >            remove_vma
> >
> > And remove_vma will be just freeing the vmas. Is that correct?
> > I'm a bit confused because the original thinking was that
> > vma_mark_detached() would drop the last refcnt and if it's 0 we would
> > free the vma right there. If that's still what we want to do then I
> > think the above sequence should look like this:
> >
> > vms_complete_munmap_vmas
> >            vms_clear_ptes
> >            remove_vma
> >                vma_start_write
> >                vma_mark_detached
> >            mmap_write_downgrade
> >
> > because vma_start_write+vma_mark_detached should be done under  mmap_wr=
ite_lock.
> > Please let me know which way you want to move forward.
> >
>
> Are we sure we're not causing issues with the MAP_FIXED path here?
>
> With the above change, we'd be freeing the PTEs before marking the vmas
> as detached or vma_start_write().

IIUC when we call vms_complete_munmap_vmas() all vmas inside
mas_detach have been already write-locked, no?

>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
