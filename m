Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC11328619
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761658646; cv=none; b=OithvWOakNwIR8QQIb6AUP7j6XTm5krH92X4//3mJCWbn5Yos0rdu7f5Ww4DM8637FYXbAfvAqf5AoomI9ISvin4oURtTs8I7ylO19J8C5duKkwqU51XqJdYZ2zT6Em0b59NRLOeIkv0MEVPOPs4UVHtEEeJWRNM2dNjPWO8vfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761658646; c=relaxed/simple;
	bh=iI1dQYUcLDLsvExCrEZOOSIuT6HyPYHdpTI6JcB9SLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lE6M7Ehmu7xI3Y6JX8ziaA5r2dtpKKXmLzcoYBo+8oJpd82PS3Z8Ad2wj8SbOM6eEdeqZzmVVtLKFH9jgf2Qw3nr0PdKBOV7xD7AewsCNF1zQCao39rfrpexucm5IFL1QCmJ6D1X5j0J/n+9c/Cjo39Xxh5bRihZiRDAs0AyXSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dL68huA/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dL68huA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761658643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=391BPTjMq7U4Si7/L0Y5C310VmT6EKvmZL7j8j+OpFA=;
	b=dL68huA/RFYr78P8x9CXo46/ByTQoUUvKCi5RMkfJUgZda0Ybo694piEaFuY3j0W2eF592
	r2AuMWMqSTYnDdWci2fGXRFMqpcirmct2nwQyIxujNKMzbpurvS0/Wja8LGn/SvzV1yK2P
	9HmH8hKkyp7HUZSQ4bETZuqNLat8e7Y=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-UGoObFarNr-Zvoga6_iHyw-1; Tue, 28 Oct 2025 09:37:22 -0400
X-MC-Unique: UGoObFarNr-Zvoga6_iHyw-1
X-Mimecast-MFC-AGG-ID: UGoObFarNr-Zvoga6_iHyw_1761658642
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78417f6306dso58585647b3.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 06:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761658642; x=1762263442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=391BPTjMq7U4Si7/L0Y5C310VmT6EKvmZL7j8j+OpFA=;
        b=FglR3B3yG4fTP2KTWYwUq/HJKiT528WJyLgMiccM/lEgWAgCTFOjCGphBNHOOpT/u7
         OucjRypYwohNRg9W8jL6QJDXVF1IP3LGM3uWXF79nzJUYaRW3b2bjEzL/HNND6U9xuEX
         i6yxbnh3HL1JnU5pIcPINb3jdNZpMC2kNpvV9BVGCxlXHekuwIUxSFhHzwAH2hbun6/5
         YzYwSaZZAshPlNXzF2hZnBVYhxPSRf3zb+Dua6YdAzV3QVet1xhgfUqVhBAt0FR8S24S
         fS7z1XJTrRML46Rie5llr0aD5LqT05wK7iO2R4Qu5kztzcvgQZUtXqoacIvYWf13Udii
         wzpw==
X-Forwarded-Encrypted: i=1; AJvYcCWbCtE3GGv+/rtap4Th4PyvHmoVTmQX7ot60WrAvRV06tM5Xh/Gr7+TAJX3e5xX4qvNdZzsdo2Ceng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/IVF/3z1+uUQPeiwHj9/se/x8DMIn3X5RpX2kYmOo2/lywnG8
	flKaFPDxik6M5A9lXOVNpI/iT1qdABwfh58q2XSfy3FTLhX/sKHnJnj2tEYfOgbQoG1hduKJPxx
	8xhYT0piUHG7wG/ScuoINOsuKDTrqfWzBIQaekqFl7GwLJP1Zp2UlQkxTRaXwNSQiS+xuUQV60d
	IKjcVXB1n3uWzON9ecsS7kOMwcznQr89XA6b6J
X-Gm-Gg: ASbGncuadAxK1wHmGK94v534uIXv93o6rffz2hLFhjDz1KSmy5+ZAb+6VIwaXoIhDsd
	JF6L/+GUqQg0Iq50uwTUMa2f8IzTEBXYOT+jmWdBK38qIn4ieHln+BVHa+atiU23WCUChOkHbTg
	fnGpfCCkpXjIsLKZorvr8HkYCBgSJXWrbPeDEjDq88VhUA7bDv1W8jQMgtDZQ6uQwOUK5dHQ==
X-Received: by 2002:a53:cd41:0:b0:63c:f5a6:f2ef with SMTP id 956f58d0204a3-63f6bab5662mr2132948d50.65.1761658641296;
        Tue, 28 Oct 2025 06:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI5+9/fHp4gwqVR+X5FCEMvrHe+GcwlBX4w2Wql+/7C/fl5yLGrv62o9V5yeHttxzVZEf22GwHT7NBFpcz7XM=
X-Received: by 2002:a53:cd41:0:b0:63c:f5a6:f2ef with SMTP id
 956f58d0204a3-63f6bab5662mr2132906d50.65.1761658640837; Tue, 28 Oct 2025
 06:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022183717.70829-1-npache@redhat.com> <20251022183717.70829-7-npache@redhat.com>
 <5f8c69c1-d07b-4957-b671-b37fccf729f1@lucifer.local>
In-Reply-To: <5f8c69c1-d07b-4957-b671-b37fccf729f1@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Tue, 28 Oct 2025 07:36:55 -0600
X-Gm-Features: AWmQ_bmW8XylmR-fGz7b8D2DLOax1IHPOfKa83653zAJ0iAfVZ2XGu7NC_3nK0A
Message-ID: <CAA1CXcA4AcHrw18JfAoVygRgUZW3EzsN6RPZVrC=OJwSNu_9HA@mail.gmail.com>
Subject: Re: [PATCH v12 mm-new 06/15] khugepaged: introduce
 collapse_max_ptes_none helper function
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, david@redhat.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org, 
	peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com, 
	sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, kas@kernel.org, 
	aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com, 
	catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org, 
	dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, jglisse@google.com, 
	surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com, 
	richard.weiyang@gmail.com, lance.yang@linux.dev, vbabka@suse.cz, 
	rppt@kernel.org, jannh@google.com, pfalcato@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 11:54=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Oct 22, 2025 at 12:37:08PM -0600, Nico Pache wrote:
> > The current mechanism for determining mTHP collapse scales the
> > khugepaged_max_ptes_none value based on the target order. This
> > introduces an undesirable feedback loop, or "creep", when max_ptes_none
> > is set to a value greater than HPAGE_PMD_NR / 2.
> >
> > With this configuration, a successful collapse to order N will populate
> > enough pages to satisfy the collapse condition on order N+1 on the next
> > scan. This leads to unnecessary work and memory churn.
> >
> > To fix this issue introduce a helper function that caps the max_ptes_no=
ne
> > to HPAGE_PMD_NR / 2 - 1 (255 on 4k page size). The function also scales
> > the max_ptes_none number by the (PMD_ORDER - target collapse order).
> >
> > The limits can be ignored by passing full_scan=3Dtrue, this is useful f=
or
> > madvise_collapse (which ignores limits), or in the case of
> > collapse_scan_pmd(), allows the full PMD to be scanned when mTHP
> > collapse is available.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 4ccebf5dda97..286c3a7afdee 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -459,6 +459,39 @@ void __khugepaged_enter(struct mm_struct *mm)
> >               wake_up_interruptible(&khugepaged_wait);
> >  }
> >
> > +/**
> > + * collapse_max_ptes_none - Calculate maximum allowed empty PTEs for c=
ollapse
> > + * @order: The folio order being collapsed to
> > + * @full_scan: Whether this is a full scan (ignore limits)
> > + *
> > + * For madvise-triggered collapses (full_scan=3Dtrue), all limits are =
bypassed
> > + * and allow up to HPAGE_PMD_NR - 1 empty PTEs.
> > + *
> > + * For PMD-sized collapses (order =3D=3D HPAGE_PMD_ORDER), use the con=
figured
> > + * khugepaged_max_ptes_none value.
> > + *
> > + * For mTHP collapses, scale down the max_ptes_none proportionally to =
the folio
> > + * order, but caps it at HPAGE_PMD_NR/2-1 to prevent a collapse feedba=
ck loop.
> > + *
> > + * Return: Maximum number of empty PTEs allowed for the collapse opera=
tion
> > + */
> > +static unsigned int collapse_max_ptes_none(unsigned int order, bool fu=
ll_scan)
> > +{
> > +     unsigned int max_ptes_none;
> > +
> > +     /* ignore max_ptes_none limits */
> > +     if (full_scan)
> > +             return HPAGE_PMD_NR - 1;
> > +
> > +     if (order =3D=3D HPAGE_PMD_ORDER)
> > +             return khugepaged_max_ptes_none;
> > +
> > +     max_ptes_none =3D min(khugepaged_max_ptes_none, HPAGE_PMD_NR/2 - =
1);
>

Hey Lorenzo,

> I mean not to beat a dead horse re: v11 commentary, but I thought we were=
 going
> to implement David's idea re: the new 'eagerness' tunable, and again we'r=
e now just
> implementing the capping at HPAGE_PMD_NR/2 - 1 thing again?

I spoke to David and he said to continue forward with this series; the
"eagerness" tunable will take some time, and may require further
considerations/discussion.

>
> I'm still really quite uncomfortable with us silently capping this value.
>
> If we're putting forward theoretical ideas that are to be later built upo=
n, this
> series should be an RFC.
>
> But if we really intend to silently ignore user input the problem is that=
 then
> becomes established uAPI.
>
> I think it's _sensible_ to avoid this mTHP escalation problem, but the is=
sue is
> visibility I think.
>
> I think people are going to find it odd that you set it to something, but=
 then
> get something else.

The alternative solution is to not support max_ptes_none for mTHP
collapse and not allow none/zero pages. This is essentially "capping"
the value too.

>
> As an alternative we could have a new sysfs field:
>
> /sys/kernel/mm/transparent_hugepage/khugepaged/max_mthp_ptes_none
>
> That shows the cap clearly.
>
> In fact, it could be read-only... and just expose it to the user. That re=
duces
> complexity.

I agree with Baolin here; adding another tunable will only increase
the complexity for our future goals, and also provides needless
insight into the internals when they can not be customized.

Cheers,
-- Nico

>
> We can then bring in eagerness later and have the same situation of
> max_ptes_none being a parameter that exists (plus this additional read-on=
ly
> parameter).
>
> > +
> > +     return max_ptes_none >> (HPAGE_PMD_ORDER - order);
> > +
> > +}
> > +
> >  void khugepaged_enter_vma(struct vm_area_struct *vma,
> >                         vm_flags_t vm_flags)
> >  {
> > @@ -546,7 +579,7 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
> >       pte_t *_pte;
> >       int none_or_zero =3D 0, shared =3D 0, result =3D SCAN_FAIL, refer=
enced =3D 0;
> >       const unsigned long nr_pages =3D 1UL << order;
> > -     int max_ptes_none =3D khugepaged_max_ptes_none >> (HPAGE_PMD_ORDE=
R - order);
> > +     int max_ptes_none =3D collapse_max_ptes_none(order, !cc->is_khuge=
paged);
> >
> >       for (_pte =3D pte; _pte < pte + nr_pages;
> >            _pte++, addr +=3D PAGE_SIZE) {
> > --
> > 2.51.0
> >
>

