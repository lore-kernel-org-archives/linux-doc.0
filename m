Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60031F4E2F
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743006374; cv=none; b=BZUZ3OtYMokhP4Y5R6NPLHpGa90kbaeuBVYNS9UnkpPDNTsTzaqNgelaEWYWC3Lwft9xrlvN0h+E2cbv4IzPzjgTpz8zjeVDCOxUQPcC5Rx24AN1ad3Hs2agxv/soVizIUrARQBXZ/7oPZqo1uxNn4W9P4R7L7SW+ohXdoB8ZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743006374; c=relaxed/simple;
	bh=TP3pQO3RlTwxLWj//K05AHCYcZl/96NtoRgWC1Sg7VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udrQ3g59BpBsLxGp9p6v6TXl75UNRAKAn4lE9Vf8E+5+H3lKMKxJ+B52/FViGqlx7tcvk2QbJidAOGAChT3fD6MzDJflN8pl2B4JZcJGXF621XBtuXQlnX0/6k6wKZLq1FSn+oI7/kmJKh/omW4Ms+46t8fxVx7i/mQlZffu8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RePp/+t/; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RePp/+t/"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4769e30af66so421881cf.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743006371; x=1743611171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP3pQO3RlTwxLWj//K05AHCYcZl/96NtoRgWC1Sg7VM=;
        b=RePp/+t/Kb7BpHZYznSBUEBVTbaC6MgaQcmiD7TY7CAyS2Pkzk8Ms96fF13d0vcM0H
         YXkMQOl9UIAnTlY0cSx17a0IWl85//MBEWxSHYlDScjx9xQ/e/KUw4T3FmcY75R2Srgg
         Q0HiL2o8IgEYh/eIwqNaOghZCkOIe2PMODr4s6MPrX8IBfJj4Q8bsc58jVJQUwP7/W/j
         L5fcT0r/wrcIFdWsI7gDI3UhAoJkDCAYYy3CFdByXdjCd2tRSiEPZti+y3vpyLIcDZFA
         w0OPNtFsH9RuSfSKyN4n3DIqNbbiKMiJNySPZU1BXdZ3+eLqqkMgrdUonSiCX8gnrySW
         0lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006371; x=1743611171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP3pQO3RlTwxLWj//K05AHCYcZl/96NtoRgWC1Sg7VM=;
        b=ewn25/B3Pd5xoVLW9EHTk+mfnyzFRsisDFbZBtj+JZ80Rs6eHfz4OKuaDXqFWdcRNF
         SvqBqi60ANpY1n4uu15sVUJ5GcQvjkd9PJg2CmHcrzwL7f/PkTr9vVdgtinXBCqzCeWq
         b3KvgWn8q44+LwvuwZtmPQEJdHO5HwpRzi8Che8J03dpfz0aMF3d0n66kPoSPbTDdZBn
         6BjpoKRmBJSvHvVMvdqOb5n0P10xqH5GcVXDbwBcKlAFnnzw+aeJj9kYZsqo11KknQ7V
         hsjnHrBg5caIZ4sehnUUNSQC6j1ANKYAAB1OPjAE2wK1BRzYjtO+riueJTp19sEK7hiA
         iWbg==
X-Forwarded-Encrypted: i=1; AJvYcCWmIe84jTIxknIe63TRVXUvtwqmVmcbPYWsXvgCEzWPb5SliaMm4qQpc4oGaUH8OPLcuWjI3eOievI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkpBUvyQDzYh7ga385QL2l4vYogauoTs06QpxBr/qQvp0SzMsS
	FuPuvFtjaJ6MtmIAPBVC4Ys4N5l9GSDhCzoy6fT67EmzXRjjscJaZPbxHwK6uiTXrTWmap5W5WE
	lp1yo1B5S5lJGGzFHXjetTDrEqmkU6aIHalH7
X-Gm-Gg: ASbGncuapxCxPwJuxBq4pCvrhbKZA11wsHn2rriG7Qy7ZqVvDgmVgMP3pan5UXpyl1q
	AZZcyQccC8meYW0we/obzmGfR93xEaViRnmJNp9+/EbTT2xQ8G9qBe7PxdOI+t2deWopcqeEfmp
	EXjWXwqZd441LQ4CmuuhHJQUmBjhpgg1kbyg==
X-Google-Smtp-Source: AGHT+IFOa5U4EkoXfdO0+LtQUSzYhAnBQIC8ww9fg/mAwgTBmcE9rzJd63FTHpnj7/g5eVnvx4SFKaBHLQRjG62h4KA=
X-Received: by 2002:a05:622a:2515:b0:477:2c1e:d252 with SMTP id
 d75a77b69052e-47762eb2ac5mr4836571cf.20.1743006371331; Wed, 26 Mar 2025
 09:26:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-8-changyuanl@google.com> <CAPTztWbFXajArSN8yKu32eSoR=xsk1CHM_4V7MJ0eQxydFqPUQ@mail.gmail.com>
 <Z-MB0Cj4tM6QgOAg@kernel.org> <CAPTztWbDtDhKZS89-aEBaZoPW2jZM2CAWW1Y_m3OnNE26=d9UQ@mail.gmail.com>
 <Z-PsLDv-DkxitRv1@kernel.org>
In-Reply-To: <Z-PsLDv-DkxitRv1@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Wed, 26 Mar 2025 09:25:59 -0700
X-Gm-Features: AQ5f1JqROvSmDfkTDrNCkDrxnAL_58GWFP96LlXcUaVtPVLlGbzUuTMgIm7BDUs
Message-ID: <CAPTztWazH=bJHTvpLfqHK3cYRnO=TXcLWEUJKYsxW1WV8XifrA@mail.gmail.com>
Subject: Re: [PATCH v5 07/16] kexec: add Kexec HandOver (KHO) generation helpers
To: Mike Rapoport <rppt@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 4:59=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
[...]
> > There has, for example, been some talk about making hugetlbfs
> > persistent. You could have hugetlb_cma active. The hugetlb CMA areas
> > are set up quite early, quite some time before KHO restores memory. So
> > that would have to be changed somehow if the location of the KHO init
> > call would remain as close as possible to buddy init as possible. I
> > suspect there may be other uses.
>
> I think we can address this when/if implementing preservation for hugetlb=
fs
> and it will be tricky.
> If hugetlb in the first kernel uses a lot of memory, we just won't have
> enough scratch space for early hugetlb reservations in the second kernel
> regardless of hugetlb_cma. On the other hand, we already have the preserv=
ed
> hugetlbfs memory, so we'd probably need to reserve less memory in the
> second kernel.
>
> But anyway, it's completely different discussion about how to preserve
> hugetlbfs.

Right, there would have to be a KHO interface way to carry over the
early reserved memory and reinit it early too.

>
> > > > current requirement in the patch set seems to be "after sparse/page
> > > > init", but I'm not sure why it needs to be as close as possibly to
> > > > buddy init.
> > >
> > > Why would you say that sparse/page init would be a requirement here?
> >
> > At least in its current form, the KHO code expects vmemmap to be
> > initialized, as it does its restore base on page structures, as
> > deserialize_bitmap expects them. I think the use of the page->private
> > field was discussed in a separate thread, I think. If that is done
> > differently, it wouldn't rely on vmemmap being initialized.
>
> In the current form KHO does relies on vmemmap being allocated, but it do=
es
> not rely on it being initialized. Marking memblock ranges NOINT ensures
> nothing touches the corresponding struct pages and KHO can use their fiel=
ds
> up to the point the memory is returned to KHO callers.
>
> > A few more things I've noticed (not sure if these were discussed before=
):
> >
> > * Should KHO depend on CONFIG_DEFERRED_STRUCT_PAGE_INIT? Essentially,
> > marking memblock ranges as NOINIT doesn't work without
> > DEFERRED_STRUCT_PAGE_INIT. Although, if the page->private use
> > disappears, this wouldn't be an issue anymore.
>
> It does.
> memmap_init_reserved_pages() is called always, no matter of
> CONFIG_DEFERRED_STRUCT_PAGE_INIT is set or not and it skips initializatio=
n
> of NOINIT regions.

Yeah, I see - the ordering makes this work out.

MEMBLOCK_RSRV_NOINIT is a bit confusing in the sense that if you do a
memblock allocation in the !CONFIG_DEFERRED_STRUCT_PAGE_INIT case, and
that allocation is done before free_area_init(), the pages will always
get initialized regardless, since memmap_init_range() will do it. But
this is done before the KHO deserialize, so it works out.

>
> > * As a future extension, it could be nice to store vmemmap init
> > information in the KHO FDT. Then you can use that to init ranges in an
> > optimized way (HVO hugetlb or DAX-style persisted ranges) straight
> > away.
>
> These days memmap contents is unstable because of the folio/memdesc
> project, but in general carrying memory map data from kernel to kernel is
> indeed something to consider.

Yes, I think we might have a need for that, but we'll see.

Thanks,

- Frank
