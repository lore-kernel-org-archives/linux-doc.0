Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3217D2248BF
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737168; cv=none; b=m/mx7q5OfddQcKY6HwH0Y/0AfRQia3UsJLvTPeRYbpIMVVG9qAk4s45j9fNqQlhwfM4ICoA6AbJEzAEhn7CoKmP7k0WzNNezbY9cXBk8xjKt5+jONTQVbapUODi7gdxg+6UIII6xo4VYRLHH1PDzid0m33j2lVHNvf0e7gz+OK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737168; c=relaxed/simple;
	bh=NOwIEeREB/ym9iFgMkdDeunubZxi6LNAtRLm2rvSy6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adyY5fasTVviMjqsf6DjH3whTwN57v0Wh4YoL5C1XJJ3kvPmE91JQiaWXMtTTV6b29N0YU4nk5B/eWDmxq5DogdZqbmz5VIAwPmvF3guoYUVW3lxeghUTCzBeN0hNJaLXZ0xFUcCGfvdmF3Ga99tidjxnMDTIqEdqgAmrnp5D1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDmoOaBX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDmoOaBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752737166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vo8FQNXlen0UXALTqIXl1cj0LOauGoMS19U6EAESdmQ=;
	b=UDmoOaBX/foiGgtROGBY/HEFAgxAdxwSAhwo7z6fJNg5N0XHLHBlrUrLkXCVtPFKIehzmQ
	rXOfuPkayG2LFHNxF8gz1ClRIuSsyoa4VBfMHHk8KpGhp7xP09H1PsPlCukpVJIvgGn4Fz
	e/vmt6zG7yy7AHlLD9UQ0ei+0O2g5Ug=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-bR1uJIszMjKnTJsQP4TCzA-1; Thu, 17 Jul 2025 03:26:04 -0400
X-MC-Unique: bR1uJIszMjKnTJsQP4TCzA-1
X-Mimecast-MFC-AGG-ID: bR1uJIszMjKnTJsQP4TCzA_1752737164
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70e86a2a1b8so9832177b3.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 00:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737164; x=1753341964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vo8FQNXlen0UXALTqIXl1cj0LOauGoMS19U6EAESdmQ=;
        b=QVaYSp51pKCAQhUIRo35b7OCipRlNzzpFFEWlO6M15ixJAQcMsM/let/W04RpSgR+X
         GpZoN6p43jhh/YOPXyXjnMC2273cLdjvP8Gusp5dNh/95yzHz8aGM5E7TVUgoXSQSN0i
         OQocPSUm9XCdOa4G6Ua1gW262/FsPo95w2nfFNBcS7xzJb9H0Rp/Q636fgQy2zNZm5NQ
         Kw3KliWp1DHlZ6hFBj//6SPA13GYasV91DrlSzB37RAWITlXMFcANxtclC+Tr79ovoj3
         TwY6seB0KxbS1N7FX+XgqmPZdsyb3tpoOJCcSRDIXPjvttrWSbVQ+DLRlQoCKZ2IWuEy
         qPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgiD1bJ12n6A6TodszzkwmGvD41uVOssTCu2AQ4dWQ5WnUvCKDgXTFC10Kto6Ei69/I8EC/SWeoMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMD8/tYbVoPVgw9BHvZ6n36J0rwc88opPgoh80/8DUdNApCb6Y
	F9WMxIw+CqnIMKQJgWWG0vXcrsQgWBi1EShnEcVcebmFUxZGSgu+L8OMfW6y271CPGsP7y9dy7f
	dkeoBUK40s77PrIiWDi9Qv2CHxU8n3lvvvoFRuWexM8RUL0j7uyLFkX+/LdLoplzfMkElZNhrLz
	GhvDYGghPT7EiScxBGlHSBF5wZ3FR1XCZZK94c
X-Gm-Gg: ASbGnctVCmRDJi+EoscHwB3rHhIZdu3z9x4XV+1YMxoyuePa83CfoRcQYPCvnirS4XY
	2YQ1UmBGx0btLpaKotPrRsDhjse13tu27rTgsXP8aSfDhkdAbjhrozoiEvb1PffiL93MVBHh3lx
	ByuKnaNeofmxmp6UIgaoctXFs=
X-Received: by 2002:a05:690c:6993:b0:70a:192d:122 with SMTP id 00721157ae682-71835178d52mr82694337b3.30.1752737164051;
        Thu, 17 Jul 2025 00:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMubBvQQAjL8j5OHlbNU/B1QBy1oxiKdyesMx8UucD2RpbZUXxzqn8VGYgbNvQhuy4s6xzfb4MYtoJBUi03NM=
X-Received: by 2002:a05:690c:6993:b0:70a:192d:122 with SMTP id
 00721157ae682-71835178d52mr82693867b3.30.1752737163491; Thu, 17 Jul 2025
 00:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714003207.113275-1-npache@redhat.com> <20250714003207.113275-11-npache@redhat.com>
 <3b8d32dd-9d40-44b1-a0ab-8185073b9072@redhat.com>
In-Reply-To: <3b8d32dd-9d40-44b1-a0ab-8185073b9072@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 17 Jul 2025 01:25:37 -0600
X-Gm-Features: Ac12FXzO2MpdN8Y0fWlVobBSI1-4HfFow54FOutJLg2yUFGIlRLNPwUMo-JRrD0
Message-ID: <CAA1CXcD2KphY8PEHyjQuYhZJf_oiNz-8UN1m9AtPF7j9O7U2sw@mail.gmail.com>
Subject: Re: [PATCH v9 10/14] khugepaged: allow khugepaged to check all
 anonymous mTHP orders
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 9:28=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 14.07.25 02:32, Nico Pache wrote:
> > From: Baolin Wang <baolin.wang@linux.alibaba.com>
>
> Should the subject better be
>
> "mm/khugepaged: enable collapsing mTHPs even when PMD THPs are disabled"
Thank does read better.
>
> (in general, I assume all subjects should be prefixed by "mm/khugepaged:"=
)
ehhh, seems like there's a mix of "mm/khugepaged", "khugepaged", and
"mm: khugepaged:" being used in other commits. I prefer using
khugepaged as it leaves me more space for the commit title
>
> >
> > We have now allowed mTHP collapse, but thp_vma_allowable_order() still =
only
> > checks if the PMD-sized mTHP is allowed to collapse. This prevents scan=
ning
> > and collapsing of 64K mTHP when only 64K mTHP is enabled. Thus, we shou=
ld
> > modify the checks to allow all large orders of anonymous mTHP.
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 7a9c4edf0e23..3772dc0d78ea 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -491,8 +491,11 @@ void khugepaged_enter_vma(struct vm_area_struct *v=
ma,
> >   {
> >       if (!test_bit(MMF_VM_HUGEPAGE, &vma->vm_mm->flags) &&
> >           hugepage_pmd_enabled()) {
> > -             if (thp_vma_allowable_order(vma, vm_flags, TVA_ENFORCE_SY=
SFS,
> > -                                         PMD_ORDER))
> > +             unsigned long orders =3D vma_is_anonymous(vma) ?
> > +                                     THP_ORDERS_ALL_ANON : BIT(PMD_ORD=
ER);
> > +
> > +             if (thp_vma_allowable_orders(vma, vm_flags, TVA_ENFORCE_S=
YSFS,
> > +                                         orders))
> >                       __khugepaged_enter(vma->vm_mm);
> >       }
> >   }
> > @@ -2624,6 +2627,8 @@ static unsigned int collapse_scan_mm_slot(unsigne=
d int pages, int *result,
> >
> >       vma_iter_init(&vmi, mm, khugepaged_scan.address);
> >       for_each_vma(vmi, vma) {
> > +             unsigned long orders =3D vma_is_anonymous(vma) ?
> > +                                     THP_ORDERS_ALL_ANON : BIT(PMD_ORD=
ER);
> >               unsigned long hstart, hend;
> >
> >               cond_resched();
> > @@ -2631,8 +2636,8 @@ static unsigned int collapse_scan_mm_slot(unsigne=
d int pages, int *result,
> >                       progress++;
> >                       break;
> >               }
> > -             if (!thp_vma_allowable_order(vma, vma->vm_flags,
> > -                                     TVA_ENFORCE_SYSFS, PMD_ORDER)) {
> > +             if (!thp_vma_allowable_orders(vma, vma->vm_flags,
> > +                     TVA_ENFORCE_SYSFS, orders)) {
> >   skip:
> >                       progress++;
> >                       continue;
>
> Acked-by: David Hildenbrand <david@redhat.com>
Thank you for your review :)

>
> --
> Cheers,
>
> David / dhildenb
>

