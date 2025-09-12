Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0372D3ECE
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663949; cv=none; b=l11E0ml2ZxHosTI1rHdaXyezr2j2xk1rf0csmg/0QbXJJPDojn2I6nbEAbuE2qvSk4weZdL/t/oPGyQow08q6nkhEMlUIfoh8xI7q9BnDgTADTDdxrt776Xzl01+DTSriczM1gfSWIiPM++OZg7SoZYyOzpPe7rNyPQpFfJRiH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663949; c=relaxed/simple;
	bh=axPzTehhJ+RudfRqwcc4KUD2dI5A0xMjQpVhyFNzFQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fhjgg5bqHeZHxATofKJwiuR/oY9O7YodiZfWIXh6bFQkaB144G6ufu/as4WNtu834IWf75DqDUzBv0MLb4tyJio9fNszMmuW4ZOHGp4+463n1knqYaZtbki4xDZ0ZMNO8qh9ob+gcTUGVgDZodiq/uxsyVOermQfkiMWmmxlA+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lz7C4N0H; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lz7C4N0H"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-76485dfbf71so12041456d6.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757663945; x=1758268745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYy2brfv/lGBhEHGS6G90beLGEnMaAiYcYf7uECp+D4=;
        b=lz7C4N0H0v0Zmr8u6SoSrKhyCqFEIAtah48y+Z7X6E9k4e0IRrVapzVH0kN6Ns8584
         SuqA8QIJZ9H05dfT0Zqel0t9Cl66f7rZatRrWoqxa3oAoXyBN1uh9UTKfOPBr1E226+m
         yJS8QATsI54Ti9oJBB98S1ebLAfJadp9lo1HpEL1h4Pk5B/TswJh6EOo63SkwJ8a9qO4
         /kvN/baeTc/Q3C7+nXBnByazxW3ob7PoGld/+WQlTFQd6HgjNHoabvdfm/S28S4t3BPV
         SvlU5LaDi7VV53G3QkwCO0izzuBox/ZADfmAdV5qw0GcsiwUZ/p9epQR1qSE+Irue9dL
         DyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757663945; x=1758268745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYy2brfv/lGBhEHGS6G90beLGEnMaAiYcYf7uECp+D4=;
        b=SKFgZHMXu/uQVHCvje9QScqoN305yHDnemNN8dW6EOpNwSWWR0hZMhdBHeKgBNTULX
         5wgka79Zv+8g7ZwtDVPCJZrkfZMr2zm+h7CPuudxlKmQWcRjeNDfNUPfV42rG8jQjJlS
         rYSbh8hAia2+HRaEcS6gTguEWI3AvwOVkcLK0zUonnleoz6a0pMAr3S1vwAfaE7kg8pp
         7c7eWhJbLLSGS2+5Gded1ZoDbZYZuvQLKxfX8WFDOxDWCUUdlOjM+5hw7PSuzyzUtgjz
         3ohp9MeCjFjM2U0LByCG5M5SmCDS0ITWmz+6+VPM2kr5YsyEyRGxeaCBh/qBV0BFoEvh
         eDbg==
X-Forwarded-Encrypted: i=1; AJvYcCWT1GexCulGN/bcecQKmn2DJ8AtyW3TtfIAW0a2k3dbqXko1Ogi8p4wlBBOLN6OLxb3thxdh+7W+24=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkMrX84ohDs/iseCRyHWh6qas08orLYUT4VfzMNSl74WFmOhh
	g78SjWvZtbWR+WyMiZc6Abnj+0PR9RgXvCz+QUFEFpDuubGUpspJqUWvl4zgnObrmpvHjobWf7O
	TjA9jxEGYGrn4hlMMTTAQ/eq2exwyZL8=
X-Gm-Gg: ASbGncsbUr9DqIHfpj5/tMDD6KHnwv2H4y6i4Op622uso0XjjDjyVNjpCJ41urZhnTG
	jBJqN8TKn4uWPpSlhvbVa8Xl5u4CAHLnD08e+9qq9ojqEM6Pu01KX6IpQ68w+QxfQe2pVFTFrU9
	OZzpgUbAHQeYZ6x4DD1jZtWXhRjNEwghbiGmjq6ZKMf4AM75xVWH1WH1/WB+IXilMWhNf3N70sy
	fR7xeWOyDNGEj9CmlOzyAmGJLXvKsj/uF6X62Vq
X-Google-Smtp-Source: AGHT+IEiaKF9pCkKWh4BbgOuXEKINdPyo/qenFs+0EOn/D/MSNe6hpdAb0zelQRVPMYqozXABSTq8lw3wGvRohll0zs=
X-Received: by 2002:ad4:4eeb:0:b0:71e:bbb8:9dba with SMTP id
 6a1803df08f44-767c5620288mr22748156d6.56.1757663944986; Fri, 12 Sep 2025
 00:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-3-laoar.shao@gmail.com>
 <CABzRoyZm32HT2fDpSy_PRDxeXZVJD35+9YqRpn9XWix8jG6w8g@mail.gmail.com>
 <3b1c6388-812f-4702-bd71-33a6373a381a@lucifer.local> <5a2a4b59-9368-4185-bd08-74324eebacb3@linux.dev>
 <4fba4e8a-a735-4cac-b003-39363583ad19@lucifer.local>
In-Reply-To: <4fba4e8a-a735-4cac-b003-39363583ad19@lucifer.local>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 12 Sep 2025 15:58:28 +0800
X-Gm-Features: AS18NWBZ0o-Yi5EczDhcsVitmeJ-1xW5LexZHJbJIlEjf9ralk8ClSHWw7rPZas
Message-ID: <CALOAHbCzb=sfCzVvJze4Xth1v5YPxfdeNpWGkGALANciPae95A@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 02/10] mm: thp: add support for BPF based THP
 order selection
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, david@redhat.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org, 
	usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	willy@infradead.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	ameryhung@gmail.com, rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 10:58=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Sep 11, 2025 at 10:42:26PM +0800, Lance Yang wrote:
> >
> >
> > On 2025/9/11 22:02, Lorenzo Stoakes wrote:
> > > On Wed, Sep 10, 2025 at 08:42:37PM +0800, Lance Yang wrote:
> > > > Hey Yafang,
> > > >
> > > > On Wed, Sep 10, 2025 at 10:53=E2=80=AFAM Yafang Shao <laoar.shao@gm=
ail.com> wrote:
> > > > >
> > > > > This patch introduces a new BPF struct_ops called bpf_thp_ops for=
 dynamic
> > > > > THP tuning. It includes a hook bpf_hook_thp_get_order(), allowing=
 BPF
> > > > > programs to influence THP order selection based on factors such a=
s:
> > > > > - Workload identity
> > > > >    For example, workloads running in specific containers or cgrou=
ps.
> > > > > - Allocation context
> > > > >    Whether the allocation occurs during a page fault, khugepaged,=
 swap or
> > > > >    other paths.
> > > > > - VMA's memory advice settings
> > > > >    MADV_HUGEPAGE or MADV_NOHUGEPAGE
> > > > > - Memory pressure
> > > > >    PSI system data or associated cgroup PSI metrics
> > > > >
> > > > > The kernel API of this new BPF hook is as follows,
> > > > >
> > > > > /**
> > > > >   * @thp_order_fn_t: Get the suggested THP orders from a BPF prog=
ram for allocation
> > > > >   * @vma: vm_area_struct associated with the THP allocation
> > > > >   * @vma_type: The VMA type, such as BPF_THP_VM_HUGEPAGE if VM_HU=
GEPAGE is set
> > > > >   *            BPF_THP_VM_NOHUGEPAGE if VM_NOHUGEPAGE is set, or =
BPF_THP_VM_NONE if
> > > > >   *            neither is set.
> > > > >   * @tva_type: TVA type for current @vma
> > > > >   * @orders: Bitmask of requested THP orders for this allocation
> > > > >   *          - PMD-mapped allocation if PMD_ORDER is set
> > > > >   *          - mTHP allocation otherwise
> > > > >   *
> > > > >   * Return: The suggested THP order from the BPF program for allo=
cation. It will
> > > > >   *         not exceed the highest requested order in @orders. Re=
turn -1 to
> > > > >   *         indicate that the original requested @orders should r=
emain unchanged.
> > > > >   */
> > > > > typedef int thp_order_fn_t(struct vm_area_struct *vma,
> > > > >                             enum bpf_thp_vma_type vma_type,
> > > > >                             enum tva_type tva_type,
> > > > >                             unsigned long orders);
> > > > >
> > > > > Only a single BPF program can be attached at any given time, thou=
gh it can
> > > > > be dynamically updated to adjust the policy. The implementation s=
upports
> > > > > anonymous THP, shmem THP, and mTHP, with future extensions planne=
d for
> > > > > file-backed THP.
> > > > >
> > > > > This functionality is only active when system-wide THP is configu=
red to
> > > > > madvise or always mode. It remains disabled in never mode. Additi=
onally,
> > > > > if THP is explicitly disabled for a specific task via prctl(), th=
is BPF
> > > > > functionality will also be unavailable for that task.
> > > > >
> > > > > This feature requires CONFIG_BPF_GET_THP_ORDER (marked EXPERIMENT=
AL) to be
> > > > > enabled. Note that this capability is currently unstable and may =
undergo
> > > > > significant changes=E2=80=94including potential removal=E2=80=94i=
n future kernel versions.
> > > > >
> > > > > Suggested-by: David Hildenbrand <david@redhat.com>
> > > > > Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > > > ---
> > > > [...]
> > > > > diff --git a/mm/huge_memory_bpf.c b/mm/huge_memory_bpf.c
> > > > > new file mode 100644
> > > > > index 000000000000..525ee22ab598
> > > > > --- /dev/null
> > > > > +++ b/mm/huge_memory_bpf.c
> > > > > @@ -0,0 +1,243 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * BPF-based THP policy management
> > > > > + *
> > > > > + * Author: Yafang Shao <laoar.shao@gmail.com>
> > > > > + */
> > > > > +
> > > > > +#include <linux/bpf.h>
> > > > > +#include <linux/btf.h>
> > > > > +#include <linux/huge_mm.h>
> > > > > +#include <linux/khugepaged.h>
> > > > > +
> > > > > +enum bpf_thp_vma_type {
> > > > > +       BPF_THP_VM_NONE =3D 0,
> > > > > +       BPF_THP_VM_HUGEPAGE,    /* VM_HUGEPAGE */
> > > > > +       BPF_THP_VM_NOHUGEPAGE,  /* VM_NOHUGEPAGE */
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * @thp_order_fn_t: Get the suggested THP orders from a BPF prog=
ram for allocation
> > > > > + * @vma: vm_area_struct associated with the THP allocation
> > > > > + * @vma_type: The VMA type, such as BPF_THP_VM_HUGEPAGE if VM_HU=
GEPAGE is set
> > > > > + *            BPF_THP_VM_NOHUGEPAGE if VM_NOHUGEPAGE is set, or =
BPF_THP_VM_NONE if
> > > > > + *            neither is set.
> > > > > + * @tva_type: TVA type for current @vma
> > > > > + * @orders: Bitmask of requested THP orders for this allocation
> > > > > + *          - PMD-mapped allocation if PMD_ORDER is set
> > > > > + *          - mTHP allocation otherwise
> > > > > + *
> > > > > + * Return: The suggested THP order from the BPF program for allo=
cation. It will
> > > > > + *         not exceed the highest requested order in @orders. Re=
turn -1 to
> > > > > + *         indicate that the original requested @orders should r=
emain unchanged.
> > > >
> > > > A minor documentation nit: the comment says "Return -1 to indicate =
that the
> > > > original requested @orders should remain unchanged". It might be sl=
ightly
> > > > clearer to say "Return a negative value to fall back to the origina=
l
> > > > behavior". This would cover all error codes as well ;)
> > > >
> > > > > + */
> > > > > +typedef int thp_order_fn_t(struct vm_area_struct *vma,
> > > > > +                          enum bpf_thp_vma_type vma_type,
> > > > > +                          enum tva_type tva_type,
> > > > > +                          unsigned long orders);
> > > >
> > > > Sorry if I'm missing some context here since I haven't tracked the =
whole
> > > > series closely.
> > > >
> > > > Regarding the return value for thp_order_fn_t: right now it returns=
 a
> > > > single int order. I was thinking, what if we let it return an unsig=
ned
> > > > long bitmask of orders instead? This seems like it would be more fl=
exible
> > > > down the road, especially if we get more mTHP sizes to choose from.=
 It
> > > > would also make the API more consistent, as bpf_hook_thp_get_orders=
()
> > > > itself returns an unsigned long ;)
> > >
> > > I think that adds confusion - as in how an order might be chosen from
> > > those. Also we have _received_ a bitmap of available orders - and the=
 intent
> > > here is to select _which one we should use_.
> >
> > Yep. Makes sense to me ;)
>
> Thanks :)
>
> >
> > >
> > > And this is an experimental feature, behind a flag explicitly labelle=
d as
> > > experimental (and thus subject to change) so if we found we needed to=
 change
> > > things in the future we can.
> >
> > You're right, I didn't pay enough attention to the fact that this is
> > an experimental feature. So my suggestions were based on a lack of
> > context ...
>
> It's fine, don't worry :) these are sensible suggestions - it to me highl=
ights
> that we haven't been clear enough perhaps.
>
> >
> > >
> > > >
> > > > Also, for future extensions, it might be a good idea to add a reser=
ved
> > > > flags argument to the thp_order_fn_t signature.
> > >
> > > We don't need to do anything like this, as we are behind an experimen=
tal flag
> > > and in no way guarantee that this will be used this way going forward=
s.
> > > >
> > > > For example thp_order_fn_t(..., unsigned long flags).
> > > >
> > > > This would give us aforward-compatible way to add new semantics lat=
er
> > > > without breaking the ABI and needing a v2. We could just require it=
 to be
> > > > 0 for now.
> > >
> > > There is no ABI.
> > >
> > > I mean again to emphasise, this is an _experimental_ feature not to b=
e relied
> > > upon in production.
> > >
> > > >
> > > > Thanks for the great work!
> > > > Lance
> > >
> > > Perhaps we need to put a 'EXPERIMENTAL_' prefix on the config flag to=
o to really
> > > bring this home, as it's perhaps not all that clear :)
> >
> > No need for a 'EXPERIMENTAL_' prefix, it was just me missing
> > the background. Appreciate you clarifying this!
>
> Don't worry about it, but also it suggests that we probably need to be
> ultra-super clear to users in general. So I think an _EXPERIMENTAL suffix=
 is
> probably pretty valid here just to _hammer home_ that - hey - we might br=
eak
> you! :)

I will add it. Thanks for the reminder.

--=20
Regards
Yafang
