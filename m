Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA370816
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736953331; cv=none; b=LunblKl6dSyXkh0O0WG+wwBqfAcbAREdWUVSsSk/VItZmkrWPJkNpFyV5xepnJjkrMOju0jRb1ipdp+5Eflih0Tmj0JeC31icryF5bazFfIp46UCwjtSE+15EqsAZD0/N9wCCk64VlVgTD64KWbWLV6TWG9DtmKk+HGGNEFlL4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736953331; c=relaxed/simple;
	bh=R96Ju5DBEQPlo1QDeapo7Aa2TBxKAkWujWErdci6mvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IV6/82YSHN/E8uPdEK2gj2+oc8+EgEnYOQxsOpwQSsI3X7nNRH0/WspB9sdrqaeu5+l81g3uyK/Ehg+KivEEtddI45nCOWubvoMSDzZGvdlxpAYtz7vaXNTzuCh3JffAToulidPqnJzjIjVzd0L8V8/iLeuCY7OInjxz/tP5xB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLDFX2ef; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLDFX2ef"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4678c9310afso516911cf.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 07:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736953328; x=1737558128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKoEDGJC0Ozzd2pOirmcKZ1n7JXZTXwqxIRqLBYepqg=;
        b=SLDFX2efXuFjTWIdqQwfVBveuVtohnRti9Ls/QeRGoq98COj5zM6mhc2e36IwthU0k
         hCVSNLTYE3PADiM0WTlALy5YJUVQk1rFvqFxKuuK8M1mQvAQnuLcShQpWMrUzFD/4i/0
         TL6k4zQ04S4AVaZ5xY4zGaA2pxZZ+YJiHkJ7aqSSRyVZn/KBWew2Hgu9GNjQp0yIaflB
         LWtV2xnfh1FAwu6Iawd+w5rN6UR5tQFIVXWXEbWkB2TN8yUQ5+CGes8u/tV6ogj8p0Am
         ibG1WG3ewLrYDyDhXhSJxOqA2a0CDmKZvLJEnDfU4BrTZcjWDRz7fVSWcbVDnBrs0+S4
         FRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736953328; x=1737558128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKoEDGJC0Ozzd2pOirmcKZ1n7JXZTXwqxIRqLBYepqg=;
        b=GZJpFgd7jlmAoG4JbpjTaNUBwHdq9WXmX905C1i23BLX01+EQp8fUhSS6BDL1cCiCY
         XHyb4T6cf9i2qeLpkuRT1zTb1eEoqoEhFpEqTpg5I9bXxOUVQvF7p5ZKE75f5KeaJbNQ
         DWXpK/JwLhE0KDvqK/3YCpeJEiNvxZg9p28QhaJccJrgGuJQymIDKo0Ri9y691Gs8Yx+
         snL6kNkkrX9tYAttY3MsMeTB4Bq06+wZvB9l/m5SIjrKJIZM58BR4/zeSU933XCpeTSt
         Rs/+PARbqNsie/RRjjASV8aYpMYcTLA9YzCWeqgCLuzJ4etjWZZFTIc+dqveLhlmLUY5
         OBVg==
X-Forwarded-Encrypted: i=1; AJvYcCXWLqxrtQAU9ybu+oc0a1EBpPzb6/nVwit0/07tnP/P02kZ4pNBXGIg9/iRUjVpCVOB1btOb5ks3Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTYY6jICLkIO5RkKuIFFm/0cRocsXKieS2uL58qTCorgHmJ7OC
	RCAGDiuARp0F83J+CntfTSVyMy9uHkN0AULjIQA+JKyMplIIgxd8O6WCDj0OV3NRb8fJk5dHs2S
	ijowZJIcmwVAw1pVzeyzDNW/JVYgtF5rv/tVC
X-Gm-Gg: ASbGnct+d5ERQ9yU/M+H5EYqA2FAfVurv1sq1QiZeSntXaaLdtQoXqUGD3625Arb2vU
	Djd8LYYQd2fbrS8v/BdAnccS6DqlkD5sZv4zimQ==
X-Google-Smtp-Source: AGHT+IERTcJm4rkPbTNlyT9gnqUbml15T/ofLmdF8pwA6uk+toNxp/Q8suhTk9UNqpkccFYd/xUh8FjnjyffKMIzh30=
X-Received: by 2002:a05:622a:647:b0:46c:7d66:557f with SMTP id
 d75a77b69052e-46df56789f8mr3823891cf.8.1736953328048; Wed, 15 Jan 2025
 07:02:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <20250115025830.pebmoyerkruqtx5y@master> <CAJuCfpEvbCJeQDnMqJK7F9dCLX+4_kx3THuRq5yuf5U9oYoEKQ@mail.gmail.com>
 <20250115120532.mgvjhcrzvmmjasv7@master>
In-Reply-To: <20250115120532.mgvjhcrzvmmjasv7@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Jan 2025 07:01:56 -0800
X-Gm-Features: AbW1kvZZp8bgBs5oEEIeGQeVkGQIO_Eu82FA1jNG9VpM7HnO5cEmDjSZ1pwItfY
Message-ID: <CAJuCfpEboXys9g2sW4Z7vNkkhW2pS0atJZNU6+JX-Fu7Ntvb6Q@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
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

On Wed, Jan 15, 2025 at 4:05=E2=80=AFAM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Tue, Jan 14, 2025 at 07:12:20PM -0800, Suren Baghdasaryan wrote:
> >On Tue, Jan 14, 2025 at 6:58=E2=80=AFPM Wei Yang <richard.weiyang@gmail.=
com> wrote:
> >>
> >> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> >> >@@ -6354,7 +6422,6 @@ struct vm_area_struct *lock_vma_under_rcu(struc=
t mm_struct *mm,
> >> >       struct vm_area_struct *vma;
> >> >
> >> >       rcu_read_lock();
> >> >-retry:
> >> >       vma =3D mas_walk(&mas);
> >> >       if (!vma)
> >> >               goto inval;
> >> >@@ -6362,13 +6429,6 @@ struct vm_area_struct *lock_vma_under_rcu(stru=
ct mm_struct *mm,
> >> >       if (!vma_start_read(vma))
> >> >               goto inval;
> >> >
> >> >-      /* Check if the VMA got isolated after we found it */
> >> >-      if (is_vma_detached(vma)) {
> >> >-              vma_end_read(vma);
> >> >-              count_vm_vma_lock_event(VMA_LOCK_MISS);
> >> >-              /* The area was replaced with another one */
> >> >-              goto retry;
> >> >-      }
> >>
> >> We have a little behavior change here.
> >>
> >> Originally, if we found an detached vma, we may retry. But now, we wou=
ld go to
> >> the slow path directly.
> >
> >Hmm. Good point. I think the easiest way to keep the same
> >functionality is to make vma_start_read() return vm_area_struct* on
> >success, NULL on locking failure and EAGAIN if vma was detached
> >(vm_refcnt=3D=3D0). Then the same retry with VMA_LOCK_MISS can be done i=
n
> >the case of EAGAIN.
> >
>
> Looks good to me.
>
> >>
> >> Maybe we can compare the event VMA_LOCK_MISS and VMA_LOCK_ABORT
> >> to see the percentage of this case. If it shows this is a too rare
> >> case to impact performance, we can ignore it.
> >>
> >> Also the event VMA_LOCK_MISS recording is removed, but the definition =
is
> >> there. We may record it in the vma_start_read() when oldcnt is 0.
> >>
> >> BTW, the name of VMA_LOCK_SUCCESS confuse me a little. I thought it in=
dicates
> >> lock_vma_under_rcu() successfully get a valid vma. But seems not. Soun=
ds we
> >> don't have an overall success/failure statistic in vmstat.
> >
> >Are you referring to the fact that we do not increment
> >VMA_LOCK_SUCCESS if we successfully locked a vma but have to retry the
>
> Something like this. I thought we would increase VMA_LOCK_SUCCESS on succ=
ess.
>
> >page fault (in which we increment VMA_LOCK_RETRY instead)?
> >
>
> I don't follow this.

Sorry, I meant to say "in which case we increment VMA_LOCK_RETRY
instead". IOW, when we successfully lock the vma but have to retry the
pagefault, we increment VMA_LOCK_RETRY without incrementing
VMA_LOCK_SUCCESS.

>
> >>
> >> >       /*
> >> >        * At this point, we have a stable reference to a VMA: The VMA=
 is
> >> >        * locked and we know it hasn't already been isolated.
> >>
> >> --
> >> Wei Yang
> >> Help you, Help me
>
> --
> Wei Yang
> Help you, Help me
