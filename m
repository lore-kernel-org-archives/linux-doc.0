Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2830AADC
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 21:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763589411; cv=none; b=CLSt8nv8yZDj3+W3V3KgzovH5Lq0zmQ3N24sIuxfxGurtqYf72VsIX6gcyIYrroKNZGKJp/Q2niU1LT+5eW3FRjuKYp8UK+84SV7TnoESWkmgzKJZTbpvykABDY+2nAPXpptswvcqLCubDJwDzsoe79uWf5W6QiEdL3n/lQ1YDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763589411; c=relaxed/simple;
	bh=i0u8LZ3aaYfvsLZbvUV+TzVs9K3+rQ8JzEPutleCOFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZP5ufTW0XgBQEdM8tUemKZQFn1nOoWrRk4Q7P/449zZfBZcIHXglvqvF0HKXUrSFy5ws3UygRcp+zDQwU4d1BJWpFv1apINKRSHtD866B4H6WdDUJhYyfG7wg2t0xfmjS1Um9lNvW3cEsDuV7wYQdLwgLI3ROm+X03pXLgbaiJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=BKkJUaQ9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="BKkJUaQ9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so298228a12.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 13:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763589408; x=1764194208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNCgiEwH4yoLxLSeabt8BIXDk+2v90qbq38QcBVyYpw=;
        b=BKkJUaQ9aOKG62XBaw9bwJZL2qD4ZfgVW/VtrgSokPGG42Bv0szJGCMUMc2Xk/2VGw
         u3/kIo9ZoUwTtAenHUCHWX9q72Y+I2ItqJXP773Las8YZGSmnSyyqG5FLTNHxeY9TvwH
         YdFLtbbODZMr8If0U7MPfz1wpn4Ft2li81G08K8IDKY0UqhNpXiyXBygReUEtJdmyBqG
         taVTGzcPi0ZMMB0gSi/SRgXxkKtkNOcVk6ztrdn7HWig973bIPQ+NraSVtehsZFj0JJS
         u9Qz+OGPt92EbY6sibQebv/ODCNgjYZTfnl+oRFaKNbybV4v3h+QM9hZ1hoW84h/AlxE
         qCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763589408; x=1764194208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNCgiEwH4yoLxLSeabt8BIXDk+2v90qbq38QcBVyYpw=;
        b=ndAISIclatEASTaSCOLd53ElEmfhbHMEzcnwfwdssEF6NihCc4K/4aPSZVbwgf2EvU
         M4tTrtqkVNcI3McrMsZm6e+OsqR+A435cxaRm3saB3m7F/VVGKABoE5CEtpAlFRI8plq
         XWb3VMhus8nNC53NaubWs/W88712P4ANkBhHdBtYSuz1QmEYiCZpnK2mLApjvJg2bom8
         PcvWa7biE8aSbK836dru1TMGRiP7oiN6kqTFIkZNXV3VCKhnc34G3HM1TQMy9+FNNOCZ
         hk+33/KE6g9ZIfOxD9o4RcKtuGNOY7+kqF9YUsg5HXieoSoAv4VjWflwgICCQqWl7Pu8
         igeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvBYGTr+iRGVTca+iVv1+LK1l57O4/QumM2YiVnFTxW7xxrCiWSOUv1Q2egYwlS1arnB23KrllwXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxErNV+Qw4M9xTnguoLA3eArmd/+3Tu3kLGUNW/z/mj0AfYfA9g
	y68h1d/JytKoJEnMSyr901z7HYFNcSAc380e0sv1tT5yx4UHYxhIKHQmq4wXMUHU2Tok3RrxPqE
	NOzho5617Y7poUlnKPzaxszVeBHpO6CM2noC4G/HhMA==
X-Gm-Gg: ASbGncsgEoW8ZWJN2Cv0wXuF3DNtKLHjccWeSbGpXohxniPDEGo/yLyjGqFk9aLf3sV
	E4w8EPGFo3S4FyXBOYD4BGFMFk1XfQpoMzeEBb7hfpuMzaV8moxmIYcqeaqzgNqj+hscbq2yVnf
	o6YCUBjCAP0B3J2MKbsS4dXzGdBMU2Mn7UUS94dOKF5uc2dwMOGnQzK3RFikR8vYmcY/BBFw0cR
	RzZrJO1lnI0806G6U4fDxckKKYDAiEEiHOXCOPNZR9HOe0xyG0TGeffbP9rvtc8A01bHxwyDOKW
	v+0=
X-Google-Smtp-Source: AGHT+IFLyS+wG0rWTlTQxvo48mFxi5vli+cxPH15GpPZdhy+X8F56gfcnoxRYXFwUVFltbkM5G+J1V5jBE1mGtvRoNo=
X-Received: by 2002:a05:6402:27cc:b0:643:8301:d107 with SMTP id
 4fb4d7f45d1cf-645364828ddmr742149a12.30.1763589407434; Wed, 19 Nov 2025
 13:56:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-16-pasha.tatashin@soleen.com> <aRsBHy5aQ_Ypyy9r@kernel.org>
In-Reply-To: <aRsBHy5aQ_Ypyy9r@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 19 Nov 2025 16:56:10 -0500
X-Gm-Features: AWmQ_bkST9g5qeVKeHrDii74Rowe2_O-kbr5Wx0FA7LJaDDxeXF38UaoBxVWMYo
Message-ID: <CA+CK2bADcVsRnovkwWftPCbubXoaFrPzSavMU+G9f3XAz3YMLQ@mail.gmail.com>
Subject: Re: [PATCH v6 15/20] mm: memfd_luo: allow preserving memfd
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 6:04=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Sat, Nov 15, 2025 at 06:34:01PM -0500, Pasha Tatashin wrote:
> > From: Pratyush Yadav <ptyadav@amazon.de>
> >
> > The ability to preserve a memfd allows userspace to use KHO and LUO to
> > transfer its memory contents to the next kernel. This is useful in many
> > ways. For one, it can be used with IOMMUFD as the backing store for
> > IOMMU page tables. Preserving IOMMUFD is essential for performing a
> > hypervisor live update with passthrough devices. memfd support provides
> > the first building block for making that possible.
> >
> > For another, applications with a large amount of memory that takes time
> > to reconstruct, reboots to consume kernel upgrades can be very
> > expensive. memfd with LUO gives those applications reboot-persistent
> > memory that they can use to quickly save and reconstruct that state.
> >
> > While memfd is backed by either hugetlbfs or shmem, currently only
> > support on shmem is added. To be more precise, support for anonymous
> > shmem files is added.
> >
> > The handover to the next kernel is not transparent. All the properties
> > of the file are not preserved; only its memory contents, position, and
> > size. The recreated file gets the UID and GID of the task doing the
> > restore, and the task's cgroup gets charged with the memory.
> >
> > Once preserved, the file cannot grow or shrink, and all its pages are
> > pinned to avoid migrations and swapping. The file can still be read fro=
m
> > or written to.
> >
> > Use vmalloc to get the buffer to hold the folios, and preserve
> > it using kho_preserve_vmalloc(). This doesn't have the size limit.
> >
> > Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
>
> The order of signed-offs seems wrong, Pasha's should be the last one.

Updated.


> > + * This interface is a contract. Any modification to the FDT structure=
,
> > + * node properties, compatible string, or the layout of the serializat=
ion
> > + * structures defined here constitutes a breaking change. Such changes=
 require
> > + * incrementing the version number in the MEMFD_LUO_FH_COMPATIBLE stri=
ng.
>
> The same comment about contract as for the generic LUO documentation
> applies here (https://lore.kernel.org/all/aRnG8wDSSAtkEI_z@kernel.org/)

Added.

>
> > + *
> > + * FDT Structure Overview:
> > + *   The memfd state is contained within a single FDT with the followi=
ng layout:
>
> ...
>
> > +static struct memfd_luo_folio_ser *memfd_luo_preserve_folios(struct fi=
le *file, void *fdt,
> > +                                                          u64 *nr_foli=
osp)
> > +{
>
> If we are already returning nr_folios by reference, we might do it for
> memfd_luo_folio_ser as well and make the function return int.

Done

>
> > +     struct inode *inode =3D file_inode(file);
> > +     struct memfd_luo_folio_ser *pfolios;
> > +     struct kho_vmalloc *kho_vmalloc;
> > +     unsigned int max_folios;
> > +     long i, size, nr_pinned;
> > +     struct folio **folios;
>
> pfolios and folios read like the former is a pointer to latter.
> I'd s/pfolios/folios_ser/

Done

> > +     int err =3D -EINVAL;
> > +     pgoff_t offset;
> > +     u64 nr_folios;
>
> ...
>
> > +     kvfree(folios);
> > +     *nr_foliosp =3D nr_folios;
> > +     return pfolios;
> > +
> > +err_unpreserve:
> > +     i--;
> > +     for (; i >=3D 0; i--)
>
> Maybe a single line
>
>         for (--i; i >=3D 0; --i)

Done, but wrote it as:
for (i =3D i - 1; i >=3D 0; i--)
Which looks a little cleaner to me.

>
> > +             kho_unpreserve_folio(folios[i]);
> > +     vfree(pfolios);
> > +err_unpin:
> > +     unpin_folios(folios, nr_folios);
> > +err_free_folios:
> > +     kvfree(folios);
> > +     return ERR_PTR(err);
> > +}
> > +
> > +static void memfd_luo_unpreserve_folios(void *fdt, struct memfd_luo_fo=
lio_ser *pfolios,
> > +                                     u64 nr_folios)
> > +{
> > +     struct kho_vmalloc *kho_vmalloc;
> > +     long i;
> > +
> > +     if (!nr_folios)
> > +             return;
> > +
> > +     kho_vmalloc =3D (struct kho_vmalloc *)fdt_getprop(fdt, 0, MEMFD_F=
DT_FOLIOS, NULL);
> > +     /* The FDT was created by this kernel so expect it to be sane. */
> > +     WARN_ON_ONCE(!kho_vmalloc);
>
> The FDT won't have FOLIOS property if size was zero, will it?
> I think that if we add kho_vmalloc handle to struct memfd_luo_private and
> pass that around it will make things easier and simpler.

I am actually thinking of removing FDTs and using versioned struct directly=
.

>
> > +     kho_unpreserve_vmalloc(kho_vmalloc);
> > +
> > +     for (i =3D 0; i < nr_folios; i++) {
> > +             const struct memfd_luo_folio_ser *pfolio =3D &pfolios[i];
> > +             struct folio *folio;
> > +
> > +             if (!pfolio->foliodesc)
> > +                     continue;
>
> How can this happen? Can pfolios be a sparse array?

With the current implementation of memfd_pin_folios, which populates
holes, this array will be dense. This check is defensive coding in
case we switch to a sparse preservation mechanism in the future. I
will add a comment, and add a warn_on_once.

>
> > +             folio =3D pfn_folio(PRESERVED_FOLIO_PFN(pfolio->foliodesc=
));
> > +
> > +             kho_unpreserve_folio(folio);
> > +             unpin_folio(folio);
> > +     }
> > +
> > +     vfree(pfolios);
> > +}
>
> ...
>
> > +static void memfd_luo_finish(struct liveupdate_file_op_args *args)
> > +{
> > +     const struct memfd_luo_folio_ser *pfolios;
> > +     struct folio *fdt_folio;
> > +     const void *fdt;
> > +     u64 nr_folios;
> > +
> > +     if (args->retrieved)
> > +             return;
> > +
> > +     fdt_folio =3D memfd_luo_get_fdt(args->serialized_data);
> > +     if (!fdt_folio) {
> > +             pr_err("failed to restore memfd FDT\n");
> > +             return;
> > +     }
> > +
> > +     fdt =3D folio_address(fdt_folio);
> > +
> > +     pfolios =3D memfd_luo_fdt_folios(fdt, &nr_folios);
> > +     if (!pfolios)
> > +             goto out;
> > +
> > +     memfd_luo_discard_folios(pfolios, nr_folios);
>
> Does not this free the actual folios that were supposed to be preserved?

It does, when memfd was not reclaimed.

>
> > +     vfree(pfolios);
> > +
> > +out:
> > +     folio_put(fdt_folio);
> > +}
>
> ...
>
> > +static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
> > +{
> > +     struct folio *fdt_folio;
> > +     const u64 *pos, *size;
> > +     struct file *file;
> > +     int len, ret =3D 0;
> > +     const void *fdt;
> > +
> > +     fdt_folio =3D memfd_luo_get_fdt(args->serialized_data);
>
> Why do we need to kho_restore_folio() twice? Here and in
> memfd_luo_finish()?

Here we retrieve memfd and give it to userspace. In finish, discard
whatever was not reclaimed.

>
> > +     if (!fdt_folio)
> > +             return -ENOENT;
> > +
> > +     fdt =3D page_to_virt(folio_page(fdt_folio, 0));
>
> folio_address()

Done

>

>
> --
> Sincerely yours,
> Mike.
