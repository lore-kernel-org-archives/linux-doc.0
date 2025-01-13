Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6907C1CBEAC
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 20:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736800987; cv=none; b=X/f8oPylQcoTRqZfAo0eee4a9z2gFmVo1/dud5ssR0q1PX8g+4NX1V79bnDWgnNYzWEgktOqAnRwD6k/6DqveWzdMKN6uBpuT1ERTxa2nGyPCeaw+DRV9Jcazq9STG9nhzEqQafWFjC/HHdMvcEHfwlx37grhkJtqdr8LlK7KYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736800987; c=relaxed/simple;
	bh=vuY9Z9W1RxsRQb/hlXHKWUQMI4dGevMG7B5H3kN6cgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clgv6Fs29YcXTO/3u5GKifWTfDsILYXIO4Zfe8jC7Jh8lw1C0yFOpoCbGowRmhZU/Wmi0bZIgFdVCV+iQBMR7eqD4GkxuWV/ZALBdPcWjX+whwpPIVIUuulgeqmiOK+F/n1IaXRXVePy1IqZU3iM94DfjnlbnykfB6grwI7PNz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ANXuo2Vg; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ANXuo2Vg"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4679b5c66d0so52251cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736800984; x=1737405784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuY9Z9W1RxsRQb/hlXHKWUQMI4dGevMG7B5H3kN6cgU=;
        b=ANXuo2VgiGXQ4zWPyoDOK0jdRfCMZdrJphQ6ZhwPy67IfQLg1l+Va3DnFAxcZzI1j4
         pMbMDsmm08X3+0jL82e8nTF6YKUe2BlIiuyQCaM2AWJDs42KUx+AVfNZxsZcvLNtssYe
         /pspLWQuEWq2YYkWwZCqU/ngrx7mJckbXgIilqNUcNA86PZK0/nzpkzy3a9db5MbrCzE
         CmGmdaWR9tHUDnW2dQnaljQw4CNaVf7DLv/kKA0IibIL+XPaVExtXVZJ/DgWGE4ZUNAr
         wKknp1jgbW4Y4ZxZyEpNgFzbFyNs6p0p+wpb0el9TRhgDfvVC1Un8wnSbjxNdM7pbNy7
         OJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800984; x=1737405784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuY9Z9W1RxsRQb/hlXHKWUQMI4dGevMG7B5H3kN6cgU=;
        b=q1Ft+8JelZVJ+IfRT2hV5GhJ2aWCsKDpi+DjJQygBFnxwwbivrTXQ96EtilQRA6kjd
         fnRkRZ5S/P8F3m99J9lZRy96rgYPGxGrZcsh7FFgmKdYGA/zcCceyiuIjNpSsg5yIZr3
         wNAVsPgmRHOh5xFLbWo42tKiQJ0JFD1me7QFd2E4gy5WLaPy4tpsCZzUjQipBSthxNbw
         L2Wcm/4mnqhVj8zaZGp/5LQXVk0mgjXRENBWDf11Sq5HeAEQKj+34hYDiXZl8zzzSbPe
         +aoakBIjZnUPSRVtm7KHwgqWnqjRVRkivLmkUoYGvqbFQJZDpnBXGMUDlID3aB0PT/3d
         VFAw==
X-Forwarded-Encrypted: i=1; AJvYcCXjv1T7ZR9xQIjMuxs//JechNQkSOAJ6PaNSCqTZ1YK0zFScD6p7jShpRiQMKONJWTMHPOO6zKKT6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQzQZ7OWm6gj9BQLxSoNHcSDv6+NPGBbjZuffLCgE5JB6gUMF
	BfDA/o7ks79XGpdN4kEeyH5NXMt73V6nkp6WKTrfPHaVv4AvtmWbyVFwWKrytPx3g/meS8V9kUF
	l9R/OKf24I2HKyXPMBINVq9YztPiSK0JCVZaQ
X-Gm-Gg: ASbGncvFQH/zOHPp6PERSRsJYoZlc6kz7vpXcyZ/Wpb0Mn/E6Gg0B0/md8qW3izdI/x
	fxynRSO33iTftWzK7VyBq9zDvhYb3U6d4MSkTbQ==
X-Google-Smtp-Source: AGHT+IE4h8N8nyH42dcqZqf2Kp1iF38NCfkejCflIfBW1jYTmtVWjUdbmgf5lEHFuiPEmks86blqx1+e/ZvFT0wAOkg=
X-Received: by 2002:ac8:7d91:0:b0:46d:d8be:d2bb with SMTP id
 d75a77b69052e-46de98bc79bmr373761cf.11.1736800983984; Mon, 13 Jan 2025
 12:43:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-6-surenb@google.com>
 <5d46531b-570b-4f81-90f3-2fb157664f87@lucifer.local> <CAJuCfpGJu88XgJUJ45aSPQNfUw4UuBRtGzB4HSybiP8xzyUTPQ@mail.gmail.com>
 <15720844-b970-4b37-b475-bf6e7c72113e@lucifer.local> <CAJuCfpEYOJayU7xcpw2VgSYRwB4sNSdxFE28j9GKu_5OvPL6VQ@mail.gmail.com>
 <ead9d96f-6cc0-46bb-9f08-585bd1b152e3@suse.cz>
In-Reply-To: <ead9d96f-6cc0-46bb-9f08-585bd1b152e3@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 12:42:53 -0800
X-Gm-Features: AbW1kvZd9mnGBLrKX7mvqEVECiRPRxTtZQbwIhOl-2xZxAZ2qDUn1UlM5rtCC7Y
Message-ID: <CAJuCfpG8Tm767ptEAcr-9i38M9B0BQm5SV8VBJJVWHhWF3spgw@mail.gmail.com>
Subject: Re: [PATCH v9 05/17] mm: mark vmas detached upon exit
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, 
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, hannes@cmpxchg.org, 
	mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 12:32=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 1/13/25 20:11, Suren Baghdasaryan wrote:
> > On Mon, Jan 13, 2025 at 9:13=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> >>
> >> On Mon, Jan 13, 2025 at 09:02:50AM -0800, Suren Baghdasaryan wrote:
> >> > On Mon, Jan 13, 2025 at 4:05=E2=80=AFAM Lorenzo Stoakes
> >> > <lorenzo.stoakes@oracle.com> wrote:
> >> > >
> >> > > On Fri, Jan 10, 2025 at 08:25:52PM -0800, Suren Baghdasaryan wrote=
:
> >> > > > When exit_mmap() removes vmas belonging to an exiting task, it d=
oes not
> >> > > > mark them as detached since they can't be reached by other tasks=
 and they
> >> > > > will be freed shortly. Once we introduce vma reuse, all vmas wil=
l have to
> >> > > > be in detached state before they are freed to ensure vma when re=
used is
> >> > > > in a consistent state. Add missing vma_mark_detached() before fr=
eeing the
> >> > > > vma.
> >> > >
> >> > > Hmm this really makes me worry that we'll see bugs from this detac=
hed
> >> > > stuff, do we make this assumption anywhere else I wonder?
> >> >
> >> > This is the only place which does not currently detach the vma befor=
e
> >> > freeing it. If someone tries adding a case like that in the future,
> >> > they will be met with vma_assert_detached() inside vm_area_free().
> >>
> >> OK good to know!
> >>
> >> Again, I wonder if we should make these assertions stronger as comment=
ed
> >> elsewhere, because if we see them in production isn't that worth an ac=
tual
> >> non-debug WARN_ON_ONCE()?
> >
> > Sure. I'll change vma_assert_attached()/vma_assert_detached() to use
> > WARN_ON_ONCE() and to return a bool (see also my reply in the patch
> > [0/17]).
>
> So is this a case of "someone might introduce code later that will violat=
e
> them" as alluded to above? Unconditional WARN_ON_ONCE seems too much then=
.

Yes, I wanted to make sure refcounting will not be broken by someone
doing re-attach/re-detach.

>
> In general it's not easy to determine how paranoid we should be in non-de=
bug
> code, but I'm not sure what's the need here specifically.

I'm not sure how strict we should be but we definitely should try to
catch refcounting mistakes and that's my goal here.

>
