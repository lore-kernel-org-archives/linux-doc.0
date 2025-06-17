Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2AE22FE11
	for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750182778; cv=none; b=Hx2O78M9h4qLmJwL83NJaHt9/wW+A6hRGHcIQGlaglWG2xcpo9ZEnHjYt+idY/Lu4eadbfbIx/RnbfRNzA6xZ5Kl0Xf66yZwozUvLA18uQoBmB3yZmfYaCw3d3KUZcI2AeeYhxZgzFmpPdIFBULr2UWdwIQwjU/h6cpT1xRydok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750182778; c=relaxed/simple;
	bh=t+06naoVmVF2AOSXqBSYrJu3yXVIfw+vx5pfjOIVMmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBYP5uJs+nI4DnxSZCDOMTkzLNbT1dlQQzFTJBhrDDTiDRARwhDE87fAq8tAJSkJ7F8i5gY3fv1oHaVFqAp4i2Tv1zhyHj5sHL7UkKDMj8BdlyA9QtD5YbYC/HK4CwjcvBxE2UJSlamslVpOoSgvomLuV2cndXVD4Q2/Do8ctzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWY51kPc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWY51kPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750182775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VHVlghtOwl1iYTRYeyXrEKqXKy+rGsdhH54hG2oPsxQ=;
	b=VWY51kPcMLewrs0lCjf8YUK7r8bvORhnPRsKcyMqDt8BRhcvzFnEDUxeyx+DqLs+6h6ngM
	y1KmdD0GNUnwsFN+bVUVxsOt+6i6NtyxRL4QbKgzPhEi42znYMdogu8IP7KB/v3v5TX/4l
	7PlAPc8EW/Pl+TiRgclw++mzlXcNpjc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-0rf3DvusMraw3EndKPYYcA-1; Tue, 17 Jun 2025 13:52:54 -0400
X-MC-Unique: 0rf3DvusMraw3EndKPYYcA-1
X-Mimecast-MFC-AGG-ID: 0rf3DvusMraw3EndKPYYcA_1750182774
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e43123ec6so74188857b3.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 10:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750182774; x=1750787574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHVlghtOwl1iYTRYeyXrEKqXKy+rGsdhH54hG2oPsxQ=;
        b=lMNPrt94WJD1MCsPMDlA+CwqnX5qXRqqXEezMm/0hlwE2DRh9VZVO1gBRcjWkEqyfD
         yuuVKcrmklBJpAWcomO/cHG3NyiBEUOpEBHbxIXUTmsHxa7/pyaZdiU+YanBlCKxoxph
         hx0cYpp2gCd4UjPPoLjRXuXWxA0GPyhU2KLkAyxAISR8UfOd5Aufu08ISMhOyOH/6cda
         W8vXqQJnTpFwXjI4KaHfUZ2+N6pwXe63qgut7VVBLLGZWffrC4OSQBYRUPE3MGMBakSr
         td9sbu2cRz7pD7NRDmVJ4Allpg2GUGsdtQy9OUXxfXTsKI1YHS7bxMjBlGj873Cgtne8
         f+2w==
X-Forwarded-Encrypted: i=1; AJvYcCVQfzeGxQU4XQeeooQZrJLTKF2U7nmnU3A3gt+UzZny9ExB6Q7r3h8WjJ5b8KwBmKm/7QrJ2l0zpLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrUR8cdttHi73UgdoeQsxL42mNPt5A0B+lFpjlIVBOsLz2Tghm
	FtTeumB2zCP/f4V3YNk3EMbgs+X2nEvf2Ixy76IfxOJ8OKDTSrf7DRnCATxfz4GRltNYTy5bxdz
	Visa0iNR/96Rp7hw5pJ21YFYc6DhEoNx/gpwfIvefN6s4O00gPGEmI7wK3Hb0P//8Rd0a9g6s7O
	Y7p7BgWbeIqE6SMQr/2tlrzNS25dX+Cfh7oQo5
X-Gm-Gg: ASbGnctgT2Mr+AjXv7TBG+A2lDz5yGkLxtMStPQhPI49960x58MKZJnyNAPQQlpwwrp
	+xNEKkc4mVqdZmj/BJ/Y6WKO+y5hlj9Ppk6mkiH2jKZKK2lPRWujOGdZMaZCOqpb59OZq7ewUUO
	3NVEBqkQ==
X-Received: by 2002:a05:690c:9a07:b0:703:b3b8:1ca1 with SMTP id 00721157ae682-7117536e5f3mr174054057b3.5.1750182773968;
        Tue, 17 Jun 2025 10:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsuDUpqbT4Zm+fDNYLZyRvnIomvlXs1lgyYMEYTlPSDFNwpQpbOwB39H6AdaylUKoeEGHtBp3S/5ilov+jo+Q=
X-Received: by 2002:a05:690c:9a07:b0:703:b3b8:1ca1 with SMTP id
 00721157ae682-7117536e5f3mr174053697b3.5.1750182773635; Tue, 17 Jun 2025
 10:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515033857.132535-1-npache@redhat.com> <20250515033857.132535-2-npache@redhat.com>
 <fcd3phzewpgzghrzse3stxi7jz7b6l5uwnhqtswcfnqvuvktip@apqh2achkutn>
In-Reply-To: <fcd3phzewpgzghrzse3stxi7jz7b6l5uwnhqtswcfnqvuvktip@apqh2achkutn>
From: Nico Pache <npache@redhat.com>
Date: Tue, 17 Jun 2025 11:52:26 -0600
X-Gm-Features: AX0GCFswQblbC-fUl4LgnBDpA9J_EkZ2hl0iyVshZHwGMIbdVVRH-b1apF1auqA
Message-ID: <CAA1CXcDgu3bT-aUEXoFrVVYaTy_rAbdNmwMhzrkwb0+VxQM47w@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] mm: defer THP insertion to khugepaged
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rientjes@google.com, hannes@cmpxchg.org, lorenzo.stoakes@oracle.com, 
	rdunlap@infradead.org, mhocko@suse.com, Liam.Howlett@oracle.com, 
	zokeefe@google.com, surenb@google.com, jglisse@google.com, cl@gentwo.org, 
	jack@suse.cz, dave.hansen@linux.intel.com, will@kernel.org, tiwai@suse.de, 
	catalin.marinas@arm.com, anshuman.khandual@arm.com, dev.jain@arm.com, 
	raquini@redhat.com, aarcange@redhat.com, kirill.shutemov@linux.intel.com, 
	yang@os.amperecomputing.com, thomas.hellstrom@linux.intel.com, 
	vishal.moola@gmail.com, sunnanyong@huawei.com, usamaarif642@gmail.com, 
	wangkefeng.wang@huawei.com, ziy@nvidia.com, shuah@kernel.org, 
	peterx@redhat.com, willy@infradead.org, ryan.roberts@arm.com, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, david@redhat.com, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, rostedt@goodmis.org, 
	corbet@lwn.net, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 5:25=E2=80=AFAM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2025-05-14 21:38:54 -0600, Nico Pache wrote:
> > setting /transparent_hugepages/enabled=3Dalways allows applications
> > to benefit from THPs without having to madvise. However, the page fault
> > handler takes very few considerations to decide weather or not to actua=
lly
> > use a THP. This can lead to a lot of wasted memory. khugepaged only
> > operates on memory that was either allocated with enabled=3Dalways or
> > MADV_HUGEPAGE.
> >
> > Introduce the ability to set enabled=3Ddefer, which will prevent THPs f=
rom
> > being allocated by the page fault handler unless madvise is set,
> > leaving it up to khugepaged to decide which allocations will collapse t=
o a
> > THP. This should allow applications to benefits from THPs, while curbin=
g
> > some of the memory waste.
> >
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > Co-developed-by: Rafael Aquini <raquini@redhat.com>
> > Signed-off-by: Rafael Aquini <raquini@redhat.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> ...
>
> > @@ -315,13 +318,20 @@ static ssize_t enabled_store(struct kobject *kobj=
,
> >
> >       if (sysfs_streq(buf, "always")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparen=
t_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG, &transparen=
t_hugepage_flags);
> >               set_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_=
flags);
> > +     } else if (sysfs_streq(buf, "defer")) {
> > +             clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepag=
e_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparen=
t_hugepage_flags);
> > +             set_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG, &transparent_=
hugepage_flags);
> >       } else if (sysfs_streq(buf, "madvise")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepag=
e_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG, &transparen=
t_hugepage_flags);
> >               set_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_=
hugepage_flags);
> >       } else if (sysfs_streq(buf, "never")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepag=
e_flags);
> >               clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparen=
t_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG, &transparen=
t_hugepage_flags);
> >       } else
> >               ret =3D -EINVAL;
> >
> > @@ -954,18 +964,31 @@ static int __init setup_transparent_hugepage(char=
 *str)
> >                       &transparent_hugepage_flags);
> >               clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> >                         &transparent_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG,
> > +                       &transparent_hugepage_flags);
> >               ret =3D 1;
> > +     } else if (!strcmp(str, "defer")) {
> > +             clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
> > +                       &transparent_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> > +                       &transparent_hugepage_flags);
> > +             set_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG,
> > +                       &transparent_hugepage_flags);
>
> There should probably be a corresponding
>                 ret =3D 1;
> here. Otherwise the cannot parse message will displayed even if defer
> was set.
Thanks Klara-- I will make sure to add it on the next version!
>
> >       } else if (!strcmp(str, "madvise")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
> >                         &transparent_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG,
> > +                       &transparent_hugepage_flags);
> >               set_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> > -                     &transparent_hugepage_flags);
> > +                       &transparent_hugepage_flags);
> >               ret =3D 1;
> >       } else if (!strcmp(str, "never")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
> >                         &transparent_hugepage_flags);
> >               clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> >                         &transparent_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG,
> > +                       &transparent_hugepage_flags);
> >               ret =3D 1;
> >       }
> >  out:
> > --
> > 2.49.0
> >
>
> Regards,
> Klara Modin
>

