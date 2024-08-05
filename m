Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB08A2C684
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 16:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722876890; cv=none; b=VTRbOZP/hRa4BFirx9aS9O3wliWRpwu617t5ej1J03xEqAUoqkbks9UdaM1Xidq6eUQXZMVyPIqlkQEQRyl5ObgBUGwgsE3Xi/xnMlKchk6lN8gtYexZsrnCt9cW4SeuKmbXrNi2PJn7Kk5UGOtTzQBjo8cQRVmJVw7aTpTRBwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722876890; c=relaxed/simple;
	bh=DZR96w7+yR+8QAvUxt2vUtynjYuzg6oCFxeOrTtAAY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZk3IrEh/ICjejlqPgmbHBD8lfZWfPH3nWC58zx1c+L1awmDM6GqnDajnTcdRQ9tNxGy3yQfkQQRKnLtcrnfmPsmq7gZYDJcWPrNXiyENd6gydEAHPvGDeRHdYFIvdrD81Nxcy/qcI7LLineR01YsiQTIyRK/T7tMb+gpUyXGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OL/o+I2O; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OL/o+I2O"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-45029af1408so4121cf.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2024 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722876888; x=1723481688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+EjPosfkeXziba69Qb6GXWNK9P7pF1IIw+Hux9jBR8=;
        b=OL/o+I2OJv5NrNX8P93jLzNgoTeqBFWl+sYc0SkHAXpPCqiJSvuEbRDnG2XE3rC2Tz
         uLe3vTMU/GU6vSY3bmjqUEX/SIcFNIvvUMCPGEL9Cj9n0uRBarkx0+9VK5nAEqHfuxLc
         wzhIoUhRMm/8E+vcetbZGbM4u5QT/KVyywQY4bjNgKgAaIdzcZtEUay+BvX28yZjj1Zs
         1cNhEAVOzM9eJOf222WoEWkZkzBvOKigJfq7r34MbEG4T1RS17SPM6g+5SBid5Aw7X/Y
         kY4hsrpOgdtmVZq17AmZSI/Sp9eRUv49bgjYu9jFvfxaaintaPkmpymNTbAovwat7CNx
         UJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722876888; x=1723481688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+EjPosfkeXziba69Qb6GXWNK9P7pF1IIw+Hux9jBR8=;
        b=Ln0wRGwErf6KW9LA6fDgd4JcgnFBtiuTq9z896ZA5fZUA1+sbj1V0EYoCfrVI6s97D
         yF3OZbzprPKjKPzpV5U+gbHY5MoyddUCdjBZbPDtDSdjNR400M5RNwD6WqX9V4ao+n2S
         XLfxUfLzoOo1owCgG82zm6OIo1J2F0ih8n+H2WcLGlfrDQSFqVDBZQbN2cDDZVXp1eKr
         LcifYOiTBdwGyickkjzEk1vJoMb+mJOSyB2u6pxMNo2IKboU5RVpz2zh6ZNBYJNxfxXc
         ZBhr55xEEUh4scPuxYygylhUWcTdmDxMPZpOVQNolRt5qKgrPD0Zo+EK4boQW9F11CfY
         VcHg==
X-Forwarded-Encrypted: i=1; AJvYcCWtLEnSedPM8IG9o12m//qmkzI3EVDpKpzjTPCWg1wqlyp5kADb2uJvHaCQBkds1TynZpXOgEFAxdIxW/eH0/I+R6t4a+kp9kcO
X-Gm-Message-State: AOJu0YxOMCqiiDK/TZ3ZBI+dK6D9t1qm3sJ+NNKigj9bCuxUtS+MkTWt
	uJXKciz0JcHiTSoq7Ig1Il6Dyiux9LsMh6Mwaxbhw+AzTq8+ZezCzZuENiftj5uw1NkSoupGIQJ
	Y5nowMMfMmwNvU5UatSbfPau90y1MlcQrfVYe
X-Google-Smtp-Source: AGHT+IEew9O40a1eagPinVnKq66XRqxq93dCPlTyT+sju/BWCkpRZjCn//Ri9HlnLHZeIehCzQD5j6qeXg1tqDmASbI=
X-Received: by 2002:a05:622a:301:b0:44f:cb30:8b71 with SMTP id
 d75a77b69052e-4519b663469mr5193091cf.25.1722876887583; Mon, 05 Aug 2024
 09:54:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-6-jthoughton@google.com> <37ae59f2-777a-4a58-ae58-4a20066364dd@redhat.com>
 <CADrL8HUmQWDc-75p=Z2KZzHkyWCCh8xnX=+ZXm5MZ-drALjKTA@mail.gmail.com> <1ea7a0d2-e640-4549-ac0e-8ae0df8d8e6a@redhat.com>
In-Reply-To: <1ea7a0d2-e640-4549-ac0e-8ae0df8d8e6a@redhat.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 5 Aug 2024 09:54:10 -0700
Message-ID: <CADrL8HVfnA2OmqqUWSsiPkCXhCX7RXdqUDvzwF-m3uccBa6ndA@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] mm: Add fast_only bool to test_young and
 clear_young MMU notifiers
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Morse <james.morse@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 8:57=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 02.08.24 01:13, James Houghton wrote:
> > On Thu, Aug 1, 2024 at 2:36=E2=80=AFAM David Hildenbrand <david@redhat.=
com> wrote:
> >>
> >> On 24.07.24 03:10, James Houghton wrote:
> >>> For implementers, the fast_only bool indicates that the age informati=
on
> >>> needs to be harvested such that we do not slow down other MMU operati=
ons,
> >>> and ideally that we are not ourselves slowed down by other MMU
> >>> operations.  Usually this means that the implementation should be
> >>> lockless.
> >>
> >> But what are the semantics if "fast_only" cannot be achieved by the
> >> implementer?
> >>
> >> Can we add some documentation to the new functions that explain what
> >> this mysterious "fast_only" is and what the expected semantics are?
> >> Please? :)
> >
> > Thanks for pointing out the missing documentation. How's this?
> >
> > diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.=
h
> > index 45c5995ebd84..c21992036dd3 100644
> > --- a/include/linux/mmu_notifier.h
> > +++ b/include/linux/mmu_notifier.h
> > @@ -106,6 +106,18 @@ struct mmu_notifier_ops {
> >           * clear_young is a lightweight version of clear_flush_young. =
Like the
> >           * latter, it is supposed to test-and-clear the young/accessed=
 bitflag
> >           * in the secondary pte, but it may omit flushing the secondar=
y tlb.
> > +        *
>
> Probably makes sense to highlight the parameters like @fast_only

Will do.

>
> > +        * The fast_only parameter indicates that this call should not =
block,
> > +        * and this function should not cause other MMU notifier calls =
to
> > +        * block. Usually this means that the implementation should be
> > +        * lockless.
> > +        *
> > +        * When called with fast_only, this notifier will be a no-op un=
less
> > +        * has_fast_aging is set on the struct mmu_notifier.
>
> "... and will return 0 (NOT young)." ?

Thanks, I'll add this.

>
> > +        *
> > +        * When fast_only is true, if the implementer cannot determine =
that a
> > +        * range is young without blocking, it should return 0 (i.e.,
> > +        * that the range is NOT young).
> >           */
> >          int (*clear_young)(struct mmu_notifier *subscription,
> >                             struct mm_struct *mm,
> > @@ -118,6 +130,8 @@ struct mmu_notifier_ops {
> >           * the secondary pte. This is used to know if the page is
> >           * frequently used without actually clearing the flag or teari=
ng
> >           * down the secondary mapping on the page.
> > +        *
> > +        * The fast_only parameter has the same meaning as with clear_y=
oung.
> >           */
> >          int (*test_young)(struct mmu_notifier *subscription,
> >                            struct mm_struct *mm,
> >
> > I've also moved the commit that follows this one (the one that adds
> > has_fast_aging) to be before this one so that the comment makes sense.
>
>
> Makes sense, thanks!

Thanks David!
