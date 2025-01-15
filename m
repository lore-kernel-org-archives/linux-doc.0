Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847735474C
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736958147; cv=none; b=Di3JO2HLxuyuuTwdMSyE39G1PutOC5sov3QubWJ8bHhWvlFCBBAmvsLhpfFjbHudl7Zv9NaBOTS7JbPcNb1O1UovKplNq3+MSGF6EFkeyqh0lFa9O54pBv8aiG3fEY/kaHtm+LnfptnlgCeahvCUPoWFchB+RvqvqqKGb/j4H4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736958147; c=relaxed/simple;
	bh=gKN3E12xj3W3cWG0vH6+Br3QWKZvXAkI9/YO3gyedb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGsoXtHs8+7qc6OBdckLuSen/ta+7b4GAuYL+Kjy57oGyEbF0LCEI1GBaPlxC5MQyUIl68bEeDA/+16ehlLaXZMOoPiLqB93dRI02tbrA8iiCK9PT9HqxZGAlxFs8aTC5qou+5dPgdNJ/kcl+s0giJdsriHdzNDu22xnHIDuiuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=29U1nMdq; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="29U1nMdq"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so573391cf.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 08:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736958144; x=1737562944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BctwlgCDNVsutNOZLGvAtMAyo5VbvSvZmv+opDc085A=;
        b=29U1nMdqU1VQvfdboTHzkTkLfZBjj3v+91s6E2g/oaLfOjYzRYDnhrMQB+6gZFW+VI
         +g1D7Png+H0Xar8dAOHQ1WLp8fpz5OPWypT7vg5OyBKSFxJ4DSajkhd3DSUXZZSAUKZu
         TKZCivulRIs7/zlpAMSYv4YIFQ6j4v0BquSVMYxw7+Ai+quT+XHWf7R2eM3mdYRO26nY
         mXag3n1/f+GTQOAwc/LFQQ6dlPLhouQiPhKK5EH2UJ3lWp7tbKWNy0aPZ0AU1INdQF76
         8QiEbE9aF61dfUnWFpTWtjrADa0JAV+6v8bAI+LJaHx9uIU6SN1Y/r0VpC8C2h841V2l
         qtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736958144; x=1737562944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BctwlgCDNVsutNOZLGvAtMAyo5VbvSvZmv+opDc085A=;
        b=LcPtuRU+6GbyLTWWozBqNhJuQIxvQm1m1MzOl6CQLtSpbkzVgcYsyfkrDpx1IB9Gjp
         mmD+9GsWpe8OaFzP12Rgf/ZIbSdaA8YiKq9BjIDZCZCLE03LRZ3vYYPeSJl3bb0UcK7h
         FLvgvLyfTlF7Dgiz7eUiaRxMjvJzgEYuOvwOqWE/aQixD6HpP1skZL+S9FsfkgVmMhNK
         7MstHlta4aJ+/XHkBxyP1vCd0+5GIV41LIh52dYOavsq5tP4h4CAPNcJnZhT1syDLfdj
         N/8+4HW6eXlSMxqPHaMKjcunLdrcJISqynSb4IS0Ehfn+6XZ4EIzljQUFY8ReKfE+e0T
         A0ow==
X-Forwarded-Encrypted: i=1; AJvYcCWdlIb6nmh7vxbRC8UZmVMivjv5HR2NyzX5r4+f6VR9SuCah6MhP0w+nfTdvnfy9SLnm0OH+rrSEtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6WlxM9czjyFsOIkGnygFlLHkCouSpx7eR5YKH1moAhUwgsVl0
	qi++Kwaya3A/ZpqMu9NZ8Z/ybQW/GPaBXdNaQvXI3rl4B0CXajt/gABizvVILfUpYD0TI5M/Lae
	R7+XW3LxiiAfokZeP74+Qe2Mtuu/F0U7morfn
X-Gm-Gg: ASbGncuXKzw8fZRdGu8d2f8qWPWdqlrQMENVJYSxGmOBhrtzR+J4jtrGafTqccrhXzS
	EfEq3tybUPuinUCozE5Wxx32PmCgpXVE/KNczSOeekfWg/AKybOzFRMwx3TW1qRyFgEI=
X-Google-Smtp-Source: AGHT+IG3V1I4ocfbKNz7/uvGk4RGSgmXJAAldz5yqhmLDDnp2RSyh5Gf3R3n0+Y5AlKpZm8rr8WuWhweW6/QwsnG0sU=
X-Received: by 2002:ac8:7d0f:0:b0:466:a3ed:bde7 with SMTP id
 d75a77b69052e-46df567e6camr4757461cf.6.1736958144056; Wed, 15 Jan 2025
 08:22:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net> <20250115111334.GE8385@noisy.programming.kicks-ass.net>
 <CAJuCfpEF14gXsGs9WMiHDqz8irrrzQrxFmbdzS-qT4xihdhWjQ@mail.gmail.com>
 <20250115153507.GF8362@noisy.programming.kicks-ass.net> <20250115153844.GF8385@noisy.programming.kicks-ass.net>
In-Reply-To: <20250115153844.GF8385@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Jan 2025 08:22:12 -0800
X-Gm-Features: AbW1kvb8S7fWIzk_jA8_hNMhgg1l5JAZBvgSU8BimRMfueO2UEVc64SNnIBddiM
Message-ID: <CAJuCfpEE6NTAds-77Y=LVB6Q6CJy_1Ewq5_DsQ1pmXJGVCakEA@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 7:38=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Jan 15, 2025 at 04:35:07PM +0100, Peter Zijlstra wrote:
>
> > Consider:
> >
> >     CPU0                              CPU1
> >
> >     rcu_read_lock();
> >     vma =3D vma_lookup(mm, vaddr);
> >
> >     ... cpu goes sleep for a *long time* ...
> >
> >                                       __vma_exit_locked();
> >                                       vma_area_free()
> >                                       ..
> >                                       vma =3D vma_area_alloc();
> >                                       vma_mark_attached();
> >
> >     ... comes back once vma is re-used ...
> >
> >     vma_start_read()
> >       vm_refcount_inc(); // success!!
> >
> > At which point we need to validate vma is for mm and covers vaddr, whic=
h
> > is what patch 15 does, no?

Correct. Sorry, I thought by "secondary validation" you only meant
vm_lock_seq check in vma_start_read(). Now I understand your point.
Yes, if the vma we found gets reused before we read-lock it then the
checks for mm and address range should catch a possibly incorrect vma.
If these checks fail, we retry. If they succeed we have the correct
vma even if it was recycled since we found it.

>
> Also, critically, we want these reads to happen *after* the refcount
> increment.

Yes, and I think the acquire fence in the
refcount_add_not_zero_limited() replacement should guarantee that
ordering.

>
