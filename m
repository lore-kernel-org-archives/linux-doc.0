Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1D302CDE
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988320; cv=none; b=a28igV3qFZoKuXeuuCp1FAkV+rl0SAkSDFkFr0mI48wvzwvmJqUyqvoNtQv3Vc0qvkYm3OWb1L7/bxEq+dS2gXtvP6w+rsTmVvLHoGyRn5LFTfuj9kXhQK2LxUqpISYx2AP8k7Y6tYsIylu0LhQz7V/fvILNPffOnQju568n4io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988320; c=relaxed/simple;
	bh=n87DmeWhfv8qMsIDQtBKhIM6R09117S4EXj7SWflnKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7Dx0b5JCObxHVyj8S47a7qTL3bh9bGDjR8fqc1FpnG1J/WbL0UyhdrKICpK9KCZzkwb8Zh5/xMgD+5wNSqlcLP6WGv2EhrUsgyOUw/2OfsMHKg7QEkhLqUWutRIGhJzPHMiWdEU1rxUfDfIloNpq1Yr74yzoT9OVoxae18E3f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SPWYmK5T; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SPWYmK5T"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee243b98caso479631cf.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 04:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763988317; x=1764593117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VWcEmhan/BNwTvurxtnj0t4NznWYHYqF0Rq1JXc1mQ=;
        b=SPWYmK5TH+Lw9qtHGMBR9Ec7hpR6VEijTv8e1PLRqUJSCuNWSLweu7xtbdTxZ2hhvi
         wt4NFUzjArzDJAmh9h8H19fRn00Qs03hi1Kp0a98DfwvF7/kZkh6Xc7D4qeUL09gZjh0
         gt+q0ZRxjRnhXNhhCkidxftNLL9pLKuwEiynJax4o+ZysC/4PZYY3HEeiqFnLpt9OtG/
         a5cpy/rHqJ/i3ZdqnCV/Aw1aRpbgOJ09+T/yvojXP+Zvho+h5C/1PJ4Gi3oFEU2ia0Vs
         VObuQTpPqo3Q0ZZPQhrAfWsSvkVzis3Ody1kiAgCj9WDshY7NUhHZ6chssfYVQUv3WoX
         OUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988318; x=1764593118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VWcEmhan/BNwTvurxtnj0t4NznWYHYqF0Rq1JXc1mQ=;
        b=hc5fVhhw7RJaNjV7Af9x/s2R3XsusXr8QU6P6MJcMG7oT/svwbhoEfKRfnu3QP010R
         mFXDmfgFFWn41vfiouCsNmATACtOR2ZDjRAp5XKtHMdvP/t8HpGeLpH1XXHN5tM/YOe7
         UPtl2sqH/VVaS+4+PPMEXnyNm90M35iFjnDBPSELvyyVwcv3RiebbAHM70HTDY6yx9jA
         rDeT69rJr875RWru3KzJYdTUR9YsMFIz8xZMYNvfZWioBRZiq3KnzZWegQvYazjvVsPp
         lvtkt0x1BctjY+YHc8VBLwxt0hk81eN63ZPOxpLIu+9oXgk7bLdDV8ZdsulhKEvYiAx0
         45gg==
X-Forwarded-Encrypted: i=1; AJvYcCVTWjwyo9o9C9TMiDstXuXdxWz6O8yDEB7Pi1BLI/mrwdBaZxQ45o528fef5xz7Cc2WE9kjZ524mxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAynNmH3aO7Y4Qxn1sJVz8H4XTZ6iMomgW8TKKsD7wjET2HG30
	os3xZqY1/cmNvh9NpI/f76DwZVB7bo8WSDIfCh8JdLhs0DunU+3fMHEaa1Hivpor+3riyPoUv4B
	2h6+xp4TBqJ1k2wNUGHqFyU9afSU3wkc5//W2+Tc5
X-Gm-Gg: ASbGncszAEdV5XGJRUUjbXRsTkTgX9y5rnKU0vy+1hFbn5XGaSZTDEOTAW7nsFX8qQj
	/fcjP6QU4alv85mTUUQym0zyM9AkWPSDLGUwdws1njRcG12Z3qELYS51nRZdhoCLKBB/Jgypkg1
	iBhrApzesRHLfIHwameY8TKpXsLJKtB0Zzb1mMzor55VR2BPpRZ6GghBLcqGdh77+iuNcPWios1
	9g1HkOJL40gu1fzJOe9Se7guXbaU1LpoA6Ogr9J2AGGbKsAeYtN+SbN3biqvjqnoa7rhhkvLRyI
	S7yLpU4VUv14FmiRM6hA20U=
X-Google-Smtp-Source: AGHT+IGPjVCxfR9SKFA3FQOdCOVgD7/O9AanhIhyNvazavihPLZPPKf8lSGLvPhLVXD4pGKivK0LrnCUCoWz3BbimD8=
X-Received: by 2002:ac8:5d14:0:b0:4ed:18ef:4060 with SMTP id
 d75a77b69052e-4ee60ecb032mr9555211cf.8.1763988317334; Mon, 24 Nov 2025
 04:45:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106163953.1971067-1-smostafa@google.com> <20251106163953.1971067-2-smostafa@google.com>
 <aRWtX3n2I7El4Ykv@willie-the-truck> <aSQ9DsR0nAAvc4Pd@google.com>
In-Reply-To: <aSQ9DsR0nAAvc4Pd@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 24 Nov 2025 12:45:06 +0000
X-Gm-Features: AWmQ_blA1bdjlFzoBd-B3IlCTsIeP9e4yZgrlAzqOFd_qVOZm4_QtkdjmvxtkT8
Message-ID: <CAFgf54p1T_Vsx_QLX1XOJJz6v6K337G5T0Gw=V=9LL4h_CWZHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drivers/iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
To: Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, Qinxin Xia <xiaqinxin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 11:10=E2=80=AFAM Mostafa Saleh <smostafa@google.com=
> wrote:
>
> On Thu, Nov 13, 2025 at 10:05:19AM +0000, Will Deacon wrote:
> > Hi Mostafa,
> >
> > On Thu, Nov 06, 2025 at 04:39:50PM +0000, Mostafa Saleh wrote:
> > > Add a new config IOMMU_DEBUG_PAGEALLOC, which registers new data to
> > > page_ext.
> > > This config will be used by the IOMMU API to track pages mapped in
> > > the IOMMU to catch drivers trying to free kernel memory that they
> > > still map in their domains, causing all types of memory corruption.
> > > This behaviour is disabled by default and can be enabled using
> > > kernel cmdline iommu.debug_pagealloc.
> > >
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > Tested-by: Qinxin Xia <xiaqinxin@huawei.com>
> > > ---
> > >  .../admin-guide/kernel-parameters.txt         |  6 ++++
> > >  drivers/iommu/Kconfig                         | 15 +++++++++
> > >  drivers/iommu/Makefile                        |  1 +
> > >  drivers/iommu/iommu-debug-pagealloc.c         | 32 +++++++++++++++++=
++
> > >  include/linux/iommu-debug-pagealloc.h         | 17 ++++++++++
> > >  mm/page_ext.c                                 |  4 +++
> > >  6 files changed, 75 insertions(+)
> > >  create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
> > >  create mode 100644 include/linux/iommu-debug-pagealloc.h
> >
> > This looks like a pretty handy feature to me, but I have some nits belo=
w.
>
> Thanks for taking the time to review the patches!
>
> >
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Docume=
ntation/admin-guide/kernel-parameters.txt
> > > index 6c42061ca20e..9a1c4ac8ba96 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -2557,6 +2557,12 @@
> > >                     1 - Bypass the IOMMU for DMA.
> > >                     unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHR=
OUGH.
> > >
> > > +   iommu.debug_pagealloc=3D
> > > +                   [KNL,EARLY] When CONFIG_IOMMU_DEBUG_PAGEALLOC is =
set, this
> > > +                   parameter enables the feature at boot time. By de=
fault, it
> > > +                   is disabled and the system will work mostly the s=
ame as a
> > > +                   kernel built without CONFIG_IOMMU_DEBUG_PAGEALLOC=
.
> >
> > Can you be more specific about "mostly the same"?
>
> The only difference is that the static key to gate the calls, I was not s=
ure if
> saying =E2=80=9Cexactly the same=E2=80=9D is correct, but I think it=E2=
=80=99s better avoid =E2=80=9Cmostly=E2=80=9D as
> it might be confusing and as the data in the cover letter shows no overhe=
ad,
> I will re-write the whole help anyway.
>

Ah, I think I copied the base of this from the documenation of
"debug_pagealloc=3D"
which actually slightly changes system behviour by not using THP on some ar=
chs,
which is not relevant in our case, I will drop it then.

Thanks,
Mostafa

> >
> > > +
> > >     io7=3D            [HW] IO7 for Marvel-based Alpha systems
> > >                     See comment before marvel_specify_io7 in
> > >                     arch/alpha/kernel/core_marvel.c.
> > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > index 70d29b14d851..6b5e9a2d936a 100644
> > > --- a/drivers/iommu/Kconfig
> > > +++ b/drivers/iommu/Kconfig
> > > @@ -383,4 +383,19 @@ config SPRD_IOMMU
> > >
> > >       Say Y here if you want to use the multimedia devices listed abo=
ve.
> > >
> > > +config IOMMU_DEBUG_PAGEALLOC
> > > +   bool "Debug page memory allocations against IOMMU"
> >
> > Perhaps "IOMMU mappings" would make this a little clearer?
>
> Will do.
>
> >
> > > +   depends on DEBUG_PAGEALLOC && IOMMU_API && PAGE_EXTENSION
> > > +   help
> > > +     This config checks that a page is freed(unmapped) or mapped by =
the
> > > +     kernel is not mapped in any IOMMU domain.
> >
> > I can't really parse this sentence :/
>
> I will re-write it.
>
> >
> > > It can help with debugging
> > > +     use-after-free or out-of-bound maps from drivers doing DMA thro=
ugh
> > > +     the IOMMU API.
> > > +     This santaizer can have false-negative cases where some problem=
s
> > > +     won't be detected.
> >
> > Maybe just say "The sanitizer is best-effort and can fail to detect pro=
blems
> > in the case that ...".
>
> Makes sense, will do.
>
> >
> > > +     Expect overhead when enabling this and enabling the kernel comm=
and
> > > +     line iommu.debug_pagealloc.
> >
> > I'd reword this to say something like "Due to the overhead of the sanit=
iser,
> > iommu.debug_pagealloc must also be passed on the kernel command-line to
> > enable this feature".
>
> Will do.
>
> >
> > > +
> > > +     If unsure, say N here.
> > > +
> > >  endif # IOMMU_SUPPORT
> > > diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> > > index 355294fa9033..8f5130b6a671 100644
> > > --- a/drivers/iommu/Makefile
> > > +++ b/drivers/iommu/Makefile
> > > @@ -34,3 +34,4 @@ obj-$(CONFIG_IOMMU_SVA) +=3D iommu-sva.o
> > >  obj-$(CONFIG_IOMMU_IOPF) +=3D io-pgfault.o
> > >  obj-$(CONFIG_SPRD_IOMMU) +=3D sprd-iommu.o
> > >  obj-$(CONFIG_APPLE_DART) +=3D apple-dart.o
> > > +obj-$(CONFIG_IOMMU_DEBUG_PAGEALLOC) +=3D iommu-debug-pagealloc.o
> > > diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/io=
mmu-debug-pagealloc.c
> > > new file mode 100644
> > > index 000000000000..385c8bfae02b
> > > --- /dev/null
> > > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > > @@ -0,0 +1,32 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2025 - Google Inc
> > > + * Author: Mostafa Saleh <smostafa@google.com>
> > > + * IOMMU API debug page alloc sanitizer
> > > + */
> > > +#include <linux/atomic.h>
> > > +#include <linux/iommu-debug-pagealloc.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/page_ext.h>
> > > +
> > > +static bool needed;
> > > +
> > > +struct iommu_debug_metadate {
> > > +   atomic_t ref;
> > > +};
> >
> > s/metadate/metadata/
>
> Ah, that's embarrassing, I will fix it.
>
> Thanks,
> Mostafa
>
> >
> > Will
