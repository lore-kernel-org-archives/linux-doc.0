Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B32DB79C
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229943; cv=pass; b=Fov9p8kxp67IXCplskROVwhyS+BgE0CWUV1utg3OB6lwTwD49LTTxwao3hdUvweLSke9bDWvI+FQvjYjnfnq8qWL6Vvs9LjqbiebHHtpxvP2AUobvHhUwjKBi0z5Vb54ID73yjpKs4i+tr90NpxPWByv9ZZgNzg/zmPIdV/COQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229943; c=relaxed/simple;
	bh=88KWv5ElPLkAQWrqvaNP4Jk7gA7Dhl/Dm13Ev3LaTPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+ikAp8B2Wl2gwOjuEDr8tytDZmEJ1GEPc1pv8jcY8VnQl13Z1KFY11T/EWOeE92CLn35vxLSzb67nPXzkxb/iTRALSd3lFiQJ1UKYrD+rFa6eB9l/mBl+nFpTHAgusNHQ7dgDawDO4oiuOqf814rnsg5hQIm6sBgIpzaANWn0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OJxz/U5/; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJxz/U5/"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4edb8d6e98aso945051cf.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 06:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768229940; cv=none;
        d=google.com; s=arc-20240605;
        b=Qh79iwdDKv0mXBYbBvW6XmaaQoOEyYbm75xCO5s0/Rf9lTQDLlg2H4yBwcXRMtT0Sz
         IWTBTjo177w0Rls6VZfS8nftg47Qt+rkykNlgF3M7WJvV2qWSsv0uCcyIEHvoowD7jFO
         jzLRa5tHUGHC8rEsR413SLSsytYUbEJLeMFY++29Xr7fptH2WVjRqz7//ypj6YNuUk0D
         fs4vew4Hr/UZ/HmI+efMBBsfBAaTOenzPHNcLFELnVCWsevhyVNqoOPYf2XaW6VfzbQg
         QC73t/mvtIuLw6GglCSXqFJZN8+uHhGPFy6mhU903sygCK1fwrFtYRi8g9BWq4lcxPi+
         t0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0BwYHjTUF+pt60n8KoAD4GQEYtMlx4yMjCYbWj7SaI=;
        fh=VMe4WtYNYiKTGnki4q0x4wb7FuT3Dstw0shyDxNRf7s=;
        b=bT5xidT1FAe4VLvi+xQ2fjiS5JHhhcGnVCpWlau861Vht5B98TWqplOyX2oFfMdduf
         QIguNMho6QKKValXXakjaeTbDKNhxwjN1kd0PfmJeNXXdXRuNcFpIZNaZZRHwQ95LfQ7
         Bi55jmtuyDaqTapTFB+rYmSVg0IlTGeTxAtLOwBFZgknpB+B3ms2+rr4UNWLOevUSC+3
         7/5zRg6H7AhislZaToUbSYFsETzZW+QbiZy8Z84O91yBM4cKZJdtI/20xaggJp8R8Nmi
         PkSLr+gtYzt6cuh65kftg2JzlBDzKKeguEVxzcHN+Hul/4Vv1B9qh93jqqWIOl7WkVgj
         qK5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768229940; x=1768834740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0BwYHjTUF+pt60n8KoAD4GQEYtMlx4yMjCYbWj7SaI=;
        b=OJxz/U5/Mn9gcmAUeZjFwpyZZBGxH4wp3ahb8eHFe1nWAZ+7Cuum0EuUR9Q0Sm5ugr
         hh44U+iaSz/PEyDumue9qA520+dzkWYAC/sR6ncR4XY5M2lk3Qd41CCyeIYMw8GK0RY+
         p1bGr6lL9u/bZcwMLIi66DOYL4vdiDQpaIkP33K2Vxz1P4viwxqH1cuFo/YIrUulXLbt
         QUGr1UpWzXVaaEs1aY2jlxBnlP3IzUgYy74L8exOPjPYaCT1Sntz7bsRvsmkE0je4Clm
         Tbz0TYlJKE3luLdhYByp8kA7LLTRb3q72a2EgKQIRtNNL3DmKrx5kleFiMJnK6bTecf8
         5NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229940; x=1768834740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0BwYHjTUF+pt60n8KoAD4GQEYtMlx4yMjCYbWj7SaI=;
        b=YPxP1nJzVy9Br5gHWPxmCGky7piHI3E/bTWZ6mnsmChGqoMb1x8Jh8UQyRD0CczZsy
         FsWnhLxZnm315c4M8x2M5kytaoeEyRonBe7zjN3fAuAoCWkYA/BiUK5xrextV1r/fxsT
         seEQN4DBdk3VLTWx3Or1KVYEGx8dLEIoRHKI4vdqGWnbRkxJztQTAEZqi3YYP6GaFZw1
         j4JjjSJK4L2xoYIXNBzK26MgBqdVZD+Bps/7GFo54E/pBryYBbe/mgQFQ5BJS0ZtYW2e
         b1L53YzwSVv49D9ie+nlYdRcwpiLejC1JBfsvFGTYFlnmRJf5F0yYwBecFMOgRbubjB7
         mshA==
X-Forwarded-Encrypted: i=1; AJvYcCXPEPvOJA5rYRB1MQq/vixuU0oHBxXhtPcO3CuEFj+7IR9FAZUjB1U//SCfV9oAOiiPg/y92meOz5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBuCuGleL7aKH1O0Wh17t8lyEiM3BdV/8ZnJaaR9LEYn45BRDy
	bL6XaZoe8flju6raA2/y2z5QO4xNaCm4DK3XyTHic2aNVNpbBcQrnb6g//3tkE8zKJunbei5R4+
	FjlX+j7A2MwNLVIlntBATDiryhDI7CCcWvU2yoUoN
X-Gm-Gg: AY/fxX45JlK1eXOrwezv2qRZR0AlBj94R0BCbirINSu/rfH/TARqLWJ5Ez2CkOq3dzo
	7eob38FTK5jwM9ckxnvWSQrZ1NKzu+jpEOUOD6Hc0oOJdjA/RQ2zNZcq8DmpgTaGqBeBWiXUK+7
	yvxZMY4nIXvhQmRAHZSzYRIa/Vf+qs6/SPIezfxp64qvMqII9gWG1ARh7jY32GVTzPIvjc5kfMX
	pL6SWHZm3nVyD+GAV4pf/Yep/PDCJTlNZaS8myEFc5b7L4N5DliBXbXrUzaNpiLDY+jdtqOEaX/
	s1QyXvJ93jZ/aOp+508jdrWDag==
X-Received: by 2002:a05:622a:116:b0:4f3:7b37:81b with SMTP id
 d75a77b69052e-50118442404mr18246381cf.18.1768229939603; Mon, 12 Jan 2026
 06:58:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109171805.901995-1-smostafa@google.com> <20260109171805.901995-4-smostafa@google.com>
 <20260109195111.GQ545276@ziepe.ca> <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
 <20260112133256.GB745888@ziepe.ca> <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>
 <20260112135208.GD745888@ziepe.ca>
In-Reply-To: <20260112135208.GD745888@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 12 Jan 2026 14:58:47 +0000
X-Gm-Features: AZwV_QiyFZSwbL5cJf8KcRzTIahuLDTegQ5hQUyCMCo1pYEgY2Ev98c53IqKZ28
Message-ID: <CAFgf54q+9Y5TtGJDB=8q_BW-0F=TM7zBbCcMzvtvr_N2WMnd-w@mail.gmail.com>
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

On Mon, Jan 12, 2026 at 1:52=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Jan 12, 2026 at 01:43:41PM +0000, Mostafa Saleh wrote:
> > But I don=E2=80=99t see why not. from the documentation:
> > /**
> >  * pfn_valid - check if there is a valid memory map entry for a PFN
> >  * @pfn: the page frame number to check
> >  *
> >  * Check if there is a valid memory map entry aka struct page for the @=
pfn.
> >  * Note, that availability of the memory map entry does not imply that
> >  * there is actual usable memory at that @pfn. The struct page may
> >  * represent a hole or an unusable page frame.
> > =E2=80=A6
> >
> > That means that struct page exists, which is all what we need here.
>
> A struct page that has never been initialize shouldn't ever be read. I
> don't know how that relates to page_ext, but are you really sure that
> is all you need?
>

AFAIU, if pfn_valid() returns true, it means the struct page is valid,
and lookup_page_ext() will check that a valid page_ext exists for this
entry.
So, what is missing is the NULL check for the page_ext returned, as it
can be NULL even if pfn_valid() was true.

But I can't see why we shouldn't use pfn_valid() at all in that path.
I don't like the approach of using the prot to check that, as the
driver can be buggy which is what the santizer is defending against.
If we find some CONFIGs conflicting with it, we can just express that
in Kconfig and disable the santaizer in that case.

> > I can see many places have the same pattern in the kernel already, for =
example:
> > - vfio_iommu_type1.c, is_invalid_reserved_pfn() which does the same
> > check which can include MMIO and then get the page struct.
>
> This whole flow is nonsensical and wrong though, I wouldn't point to
> it as something reliable.
>
> > - kvm_main.c: in __kvm_vcpu_map(), it distinguishes MMIO from memory
> > and then accesses the page struct.
>
> That's sure looks sketchy to me.. Eg if CONFIG_WANT_PAGE_VIRTUAL is
> set and you try to feed a MMIO through through that kmap() it will
> explode.
>
> KVM can argue that it doesn't work with CONFIG_WANT_PAGE_VIRTUAL but
> iommu cannot.
>

WANT_PAGE_VIRTUAL seems possible in loongarch which supports KVM.

Thanks,
Mostafa

> So, again, IDK, we are trying not to use pfn_valid() in the DMA code.
>
> Jason
