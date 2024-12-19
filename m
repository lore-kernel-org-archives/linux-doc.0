Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D26D3D3B8
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734625090; cv=none; b=coYeACLvOVOPfyOhBmc9NMnTWJ7rs0xzxAVEdMczQB0pmTFU6ogGM6DHcS8fiBSvzUscts44wcO6jYx5FSCsGymZw8blp10WYxt7OfdLbTYwq+HO6T3T252KTy9oVstWveczeuNXcWTu0Z6IYZdBxKGEfL0QpgIT9JfC1LXzS3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734625090; c=relaxed/simple;
	bh=Ld4+eGzIIND3PLw12ki2wFI3scaPv8OSNBlexML5kbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMGt/4OnucFxdjkZ1ASEUAG+rYXx/J3PeLe6QEY4N547mrL6EMHod9OHL/zH7g8wA9NCmZb4C1LGiAq3/qQV0zABMpDLHzOjs0YmQ3Q2+JgGLNI5oVk874MHA0H/xKr6UxVGffeqIDF7MVK1UWNBzFeTQZ/5cioQ3E8237DGzXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fWAxZ5N2; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fWAxZ5N2"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678c9310afso271961cf.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 08:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734625087; x=1735229887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSvya3sWJCvbqtoa+A5iuOgdl1JL5ydAuCgtK3OjT54=;
        b=fWAxZ5N2GIEmIci0aJ7VGf2s79wQxRE6QAVVn4oOLF38TzmiJaE5fwyxvaIw1Xpae3
         mgiyMmQaPlRXVrhC6noqCzk2bmbwZaDGEdCltCtFA1Y4oAWgN+MLbZ4AvTsJCEUD+TMc
         ASH/bBk+ODjDlS9A7hu0ARn/46gmJo8p0XYnKDBAnbzh6q6Zjr03nVRmeKvpJk+ycLPc
         o9oU+/OLlxwWCgRBL38GkFzUp99AIOYRy/QZqvGkQg1K1FO3t2D60UChCPNrunes5zjG
         Eugcbx9/hVqXnS82C5uUYz/YfEJ7NubN8S2pHNgK6vBE8Yg5FOXTGGrCzLwLYF35fmo6
         5HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734625087; x=1735229887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSvya3sWJCvbqtoa+A5iuOgdl1JL5ydAuCgtK3OjT54=;
        b=WfSlhaeRdI98jndvZfExwNRJAr7snsvDqW8kfk5XxQVpWzq3CBoEU9z+5CIp3i48aU
         CBw8+A2Wytp9CjbnAVYwauIk6k76Qb7r7WBgQxuthTh1lK63okQpP2NuVMvsKan03Ukr
         +yiW0nHjiZYu+KKh83FSN1JYYGg+jK5zUgdY57hUNAsR92yBRM+P/QbRnLTs9PN8jA36
         iiAi8jeWO8zHePrUmxOAFhirM4UrhGi4jfuxwGI9wx++00ArJRkBh62ibQG94fhj6A1P
         GgVqZ0B7jcPSVep7ofk1LHWvjzYNQQGv7jM5claHyb4qpuDn5G0GE2GjaCGlE9I/1ve8
         G6bA==
X-Forwarded-Encrypted: i=1; AJvYcCV0J/wenMXjp/BA+LmmzRVZRyvTfTqsVTuPhsbRaxhvyMHELvIjVbe9upGhumuikW/q8sYBlbhtj1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQM9YDIf0p6ld1a7Y8cl4fjoHOQdE2JtGI8Z4p2xwNsmZ1TnyQ
	mm6euoy2249PsEQANgzvTVQIBrPWJ6R5tvkNHjRSVA/I4XVz6h+/fPQsBI2ZCrtGt4JBUyNezfL
	SjJKYqQgvHuGXIn2O7ufaapm93F8vk5ELSzK1
X-Gm-Gg: ASbGncvRO5/PUyCahf5tLJ4IlZYdVHAf0jjmnLMaaztHYlMzABgZEYscq/n1urGdnYB
	sZ3dFx3oroi7zC3qmovijlctx1mxkGj2xTpBfHg==
X-Google-Smtp-Source: AGHT+IEvlItn5zS1FAvY8luxMDMYWlJ4t4FPeuQh450skgtDjOmO17X4KtY0FJE6Do0bmr0IMBnC9QLPXlIgPZSy4hM=
X-Received: by 2002:ac8:5d15:0:b0:466:8102:636d with SMTP id
 d75a77b69052e-46a3d9833demr3274601cf.27.1734625087138; Thu, 19 Dec 2024
 08:18:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
 <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net> <20241219112011.GA34942@noisy.programming.kicks-ass.net>
In-Reply-To: <20241219112011.GA34942@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Dec 2024 08:17:55 -0800
Message-ID: <CAJuCfpE2KcsWbNJ=GhkXEnLqLTYQp0hSNjSAnDwqhui0N43_RQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org, willy@infradead.org, 
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

On Thu, Dec 19, 2024 at 3:20=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Dec 19, 2024 at 10:13:34AM +0100, Peter Zijlstra wrote:
> > On Wed, Dec 18, 2024 at 01:53:17PM -0800, Suren Baghdasaryan wrote:
> >
> > > Ah, ok I see now. I completely misunderstood what for_each_vma_range(=
)
> > > was doing.
> > >
> > > Then I think vma_start_write() should remain inside
> > > vms_gather_munmap_vmas() and all vmas in mas_detach should be
> >
> > No, it must not. You really are not modifying anything yet (except the
> > split, which we've already noted mark write themselves).
> >
> > > write-locked, even the ones we are not modifying. Otherwise what woul=
d
> > > prevent the race I mentioned before?
> > >
> > > __mmap_region
> > >     __mmap_prepare
> > >         vms_gather_munmap_vmas // adds vmas to be unmapped into mas_d=
etach,
> > >                                                       // some locked
> > > by __split_vma(), some not locked
> > >
> > >                                      lock_vma_under_rcu()
> > >                                          vma =3D mas_walk // finds
> > > unlocked vma also in mas_detach
> > >                                          vma_start_read(vma) //
> > > succeeds since vma is not locked
> > >                                          // vma->detached, vm_start,
> > > vm_end checks pass
> > >                                      // vma is successfully read-lock=
ed
> > >
> > >        vms_clean_up_area(mas_detach)
> > >             vms_clear_ptes
> > >                                      // steps on a cleared PTE
> >
> > So here we have the added complexity that the vma is not unhooked at
> > all. Is there anything that would prevent a concurrent gup_fast() from
> > doing the same -- touch a cleared PTE?
> >
> > AFAICT two threads, one doing overlapping mmap() and the other doing
> > gup_fast() can result in exactly this scenario.
> >
> > If we don't care about the GUP case, when I'm thinking we should not
> > care about the lockless RCU case either.
>
> Also, at this point we'll just fail to find a page, and that is nothing
> special. The problem with accessing an unmapped VMA is that the
> page-table walk will instantiate page-tables.
>
> Given this is an overlapping mmap -- we're going to need to those
> page-tables anyway, so no harm done.
>
> Only after the VMA is unlinked must we ensure we don't accidentally
> re-instantiate page-tables.

Got it. I'll need some time to digest all the input but I think I
understand more or less the overall direction. Thanks, Peter!
