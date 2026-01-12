Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C834359F80
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 13:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225438; cv=pass; b=kCAAruPYGF1xB1qBPmIyVNbbXrUZEDGUIuC8Qv/RL8YpYaDF9gEwyMUzxHnEvAV3o+BlspIgNASIuCa3riA68SctXWQutl+uLyDu9J7RMljB5flY4hweYc8Zu+AdaUzovdUJBMbkgElPp5cAKjy/VXHnb7Oqs7hsnyDOd4Vbhaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225438; c=relaxed/simple;
	bh=hpKzaf9TKlxvpkxcE6g+8gpOgUrfHofUzL3gwFsCnYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p61JOVIN/IiePRI6HarAEJGtAPTiMkaNCoId8vg67H1s2xmDAE4WeYajpjhGqS2rxKZC9CZCqv0JLlI3nytpT79tYi7bqf39+DRkYIuWlBh7O56Bt9Ubv3AaxQTfH54AQyx4hYvAEWhYhFLeypEuyk7DY6kI+AsqO1/2iHAF8uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rZy5n2Hd; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rZy5n2Hd"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6505d147ce4so11495a12.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 05:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768225435; cv=none;
        d=google.com; s=arc-20240605;
        b=Ce66nnW+VRGyuhLlY7Vqc3SfQ0uLEV9db3wIxc+tuejY60/Euv3/x6rcf7L2w61+ds
         rtRrD+qqSP+TnZVelqQjkUPPKvxtgCm450qWStrAQQFTyVt9CqHGxAn5DqpGkSofCOXZ
         ++usX8DtyeFErcj8o2SbI1SvLZX6wB5nKWIbKNpeVJVplV9tK3U6/JUsKzpGW0fRv9Js
         o+I3qVlJJJsZRXnMOMwocvkOWoek14f4k3QPjflY4hI++SqFR35RBrFA9yFl5yseRhCf
         N8dao+5+JAZU7hvEmCV5GCeYqWukMmzo8t2Z08zSRkXAGE9JcKTy1xygO664ZCoksGPo
         xuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4n5VXKt5uZhwz/osECQnV+32AgtobC/ivtXXVJXaVoI=;
        fh=Krazy4DMcJHLf7d5OI1SQgueDuvFigSMa9sXEpn5vT8=;
        b=FV0N1HfrYgvQDE+vokzNH7Lv1vf0VTULbCjhKIYB/oFbxP+qXkAA5Y1pS6bPC+V6v0
         gKpkSSdmvbEFHPBcKC8IhIkwTAY/EAMcvj65DNBcdx93gGR8dRAwg4D1Gmu0kCjAhHKC
         AeUhbIOm9GSAIByZ1VmAgosQsLshZf7UD7+lounrJainVc7trlteGmGZVIECaON9DdU7
         xPA3KMPhpR7kqk2xZWsDnDp11C/Z8nsCcCIkd+a2eNhGOtY6SBF9P3xSCCSi+Urwka2d
         FppatN59GHNTygTij3VacFG37bvQkz7u0WWaz4FBEBBfyZmTIpDK5jJ5xevTFSaVfUlJ
         eLKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768225435; x=1768830235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n5VXKt5uZhwz/osECQnV+32AgtobC/ivtXXVJXaVoI=;
        b=rZy5n2HdZzd7ghB6XK6MysEEh3QbZ+ce7oC6zJJi8hK1y1peKA+yr8Ob/VkGfM8AJ4
         TDWBp6EzKclHSQ5gXzA6EYOqs3YBJrJsWp2jt5UFX8iIzi/cD3h7vvUlE3wy6qQDl5QZ
         6a5aLYpdSwsMraoRGOM7pd1g/6aTAzsCaxVjrZYSP8Y+xNJKxLtwJfL2ckvTaF70HRHr
         HFYWTlijoe62PfWA8rzUumvPiVeCGh8wLKKioOGjlBOkqSr5oSF2xzKqyXggthvY57Px
         6BFuFbjIn/yS90eTk4cSmXoA5ntWbOaUJSmya3blm9pgdVtbbIrVigM7Jr5KpgMkmlfE
         h5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225435; x=1768830235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4n5VXKt5uZhwz/osECQnV+32AgtobC/ivtXXVJXaVoI=;
        b=CU9LCR7MhKAnafMyGO5qYQ+jo6hrRkAGDFIhDjcE66MTOsadueRB59tMJSipyde2GZ
         L7vb4mLo8wnfwrDR2XougVOFGm88xDccHF0hhmMslsMFXVHBjsoeSixWBshK5GNlRc41
         eU4rz+AYRuqUFibsj1hfJIuUnO8q7dov5W4BxhCp5W6cvdNu+gcofN/S2zcOOyKQ1NuW
         Ei1anzaXoOlwhCunWBd514aEuLJCcUPf4T9GomMzzinStEpPoU8Q+PhwvhhlxEg7oZGq
         ZI39vRhXFsVyKKN1+VTKVAL8ZbKFWDZNgRxvhhKsjQc148rO8pMzL52pbImULCAWyJm0
         7VwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbWz+PdRed2HmXDLaypIrSWur+nFPaU5XckkUnw55zD+vmWpez4vwsFIKkt8nbUE4wM/PZJebV2kk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz89K6KIIS0De6LFGlxSdSijDRmuqkL5tIF/xTH8zJXsSG4nwJd
	XWlvWOMC61Zoys6aynKif36g+YME4P3MFsnEfrgl1jye0vPUQqMXJF11aFjoX2VTHpGsUDcAAn9
	O7fh4GSldDsAJnEpUU/IFdy6Ud7Jzz6bm9jVu3Xbi
X-Gm-Gg: AY/fxX7+rhTz4H/AmMZmTshjA6N7q+KKmPVwbPyIZSBNL5RthinbBa2ljeeaijGyGjW
	JrsiEhmgow+d8INOMYR3F3lzxyVSVKgnH1Ain1yInd/0IAiGDrrpqpZmMvj+vuY1tbUC7d07H56
	CYTaZhZUgwXYJnmGr7lawLYs5zGZalrVY/E9bJ6Z2W6aqwSoPPsS0ZZNX/t/Wd7JLOsLqFswZOR
	X0ivTakZX4BfTjw0Fluv1IM3CGNj58gRsj668or91G2Du1KyPT1IzuWHOYm125hTFKsEm21VeSH
	oEEFsUeyUXsh7MJqUDHB02d3wQ==
X-Received: by 2002:a05:6402:342:b0:645:21c1:97e1 with SMTP id
 4fb4d7f45d1cf-650dfe8ada6mr56290a12.18.1768225435357; Mon, 12 Jan 2026
 05:43:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109171805.901995-1-smostafa@google.com> <20260109171805.901995-4-smostafa@google.com>
 <20260109195111.GQ545276@ziepe.ca> <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
 <20260112133256.GB745888@ziepe.ca>
In-Reply-To: <20260112133256.GB745888@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 12 Jan 2026 13:43:41 +0000
X-Gm-Features: AZwV_Qg7mYkIwH8ZCCMUvPyADXUnpvnCnTrzZaJFMI4DtUTEE1VoDRcqZ-qy__w
Message-ID: <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com, 
	baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 1:32=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Jan 12, 2026 at 10:20:14AM +0000, Mostafa Saleh wrote:
> > On Fri, Jan 9, 2026 at 7:51=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> w=
rote:
> > >
> > > On Fri, Jan 09, 2026 at 05:18:04PM +0000, Mostafa Saleh wrote:
> > > > +static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
> > > > +{
> > > > +     struct page *page =3D phys_to_page(phys);
> > > > +     struct page_ext *page_ext =3D page_ext_get(page);
> > > > +
> > > > +     return page_ext;
> > > > +}
> > > > +
> > > > +static struct iommu_debug_metadata *get_iommu_data(struct page_ext=
 *page_ext)
> > > > +{
> > > > +     return page_ext_data(page_ext, &page_iommu_debug_ops);
> > > > +}
> > > > +
> > > > +static void iommu_debug_inc_page(phys_addr_t phys)
> > > > +{
> > > > +     struct page_ext *page_ext =3D get_iommu_page_ext(phys);
> > > > +     struct iommu_debug_metadata *d =3D get_iommu_data(page_ext);
> > >
> > > You cannot do this - phys_to_page() can only be called if we already
> > > know that phys is a struct page backed item and by the time you get
> > > here that information is lost.
> > >
> > > Probably the only way to resolve this is to somehow pass in an iommu
> > > prot flag that can tell the difference between struct page and
> > > non-struct page addresses.
> > >
> > > But I have to NAK this approach of blindly calling phys_to_page().
> >
> > The callers to this, first will check "pfn_valid", which is the right
> > check AFAICT (looking at similar patterns in page_owner for example).
>
> I'm not sure pfn_valid really works in all cases, it has a number of
> exclusions that can be relevant when phys_addr_t can be a MMIO
> address..
>
> So far we haven't been using it in the DMA paths at all, I'm not so
> keen to see that start..
>

But I don=E2=80=99t see why not. from the documentation:
/**
 * pfn_valid - check if there is a valid memory map entry for a PFN
 * @pfn: the page frame number to check
 *
 * Check if there is a valid memory map entry aka struct page for the @pfn.
 * Note, that availability of the memory map entry does not imply that
 * there is actual usable memory at that @pfn. The struct page may
 * represent a hole or an unusable page frame.
=E2=80=A6

That means that struct page exists, which is all what we need here.

I can see many places have the same pattern in the kernel already, for exam=
ple:
- vfio_iommu_type1.c, is_invalid_reserved_pfn() which does the same
check which can include MMIO and then get the page struct.
- kvm_main.c: in __kvm_vcpu_map(), it distinguishes MMIO from memory
and then accesses the page struct.

Thanks,
Mostafa

> Jason
