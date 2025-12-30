Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F46280CC1
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767112680; cv=none; b=JynLBvPlSrds40WL8oYCmZNuFOnA9akdSa3WNFmR1oxmgabqgT8AxGFaOeQZiE0HbbH/Ie5MYGj5oA8z1ymAAbaYchBvg9SgnC5Oeki8J7UChnH8uvOrV8iEM42oM8cZuylanJT/6eTHS2xoZ0gyg5+bpfZ6s3Z1NLM6/64FH1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767112680; c=relaxed/simple;
	bh=aXMnm/9Yve89kNtGunDJ4Fm6HCjw2ZptcQM6D0PJJaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1fix/D21atkhOuypB6msXpwnach3G2hvfKAV/YGgHvYFuA4mESEQUyEwOw7ebMra9hDaykBgDC1fw7yzPbPhMNz9y0IaJFuNRdakP3rSlUlWmadw/HY3RXrgyvdhbNmkbjHvB08ygrw0Jhnuea6BwwndQYedIK4jFaYyem9HwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=EMoq/ziu; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EMoq/ziu"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so12444707a12.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1767112677; x=1767717477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRg6CrcJkBXZs3BQb5XRdbXuKq3vmzU1zmho9EhETiQ=;
        b=EMoq/ziuMF3Pg1dLkcOQjP3xB+e2BZMjYjgBJTcpe+jKl8E2EQMhpAzqp9cevARCJM
         9LUNFLjMVLGg7hx3JL1D9FhMMdjzov27dMsurfjyS8N8yoITYm34qdyP5GcwVtYlZPc7
         cb7ae+xvv07BWpmg6aFOW3pprzV+yB+RSTkoMKhSmHLqqvc7AtKDXHROwmM+bV5WcM2v
         RGl7s1MJUzm/Nd06KRiZ8d2jLa/j2eYA4AtpWS1P62F+lDcWS8OPwU2XNzBZmVC1kl4+
         Bj6guPavCQm2n8/CfXUKIZsUTUrPnpY7AGIVhkZRqBFGoBajU3Gcqy8hRZ2i44EGWKzW
         A4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767112677; x=1767717477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRg6CrcJkBXZs3BQb5XRdbXuKq3vmzU1zmho9EhETiQ=;
        b=aayeDHh4jP2M3t7334chXM9oj0qAq2Jq5omqbLopccl8Rom61Q6jexX6HNIBQ3WtTs
         ccpAVke36M8mgCNVBWKTFkco8R0vUSv/2Agx2wg7ZQIXjlYO/c14ite+ww1zwumXz6oe
         PXi5w0onCqbSpcmmt2efReUbkj7EWfvmzF/RiR3B3I6L15Nj3kQxPV25U6vTbvZVVAil
         f875zEa9IepPTecVhh1AKP0caFDD6OufJQUMRuCopQeZ3mpJ8pVuZRkuIgjwduaQ2jz7
         aCltYA5bD34T4pa9Dc+gRydiaOo87JybVc04YOOJ60PIeWED024bGAIYKH2GEoWBacQ2
         iugg==
X-Forwarded-Encrypted: i=1; AJvYcCUopOTUy1L99+QYMqca88TefpWjCLyryTrweqlXn1RpWLS76clu0N3q8qiCm5iP3FjKvGv91LXS8vA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyka3xh/DqYcRM35lGxiMKp1rCl/l6Gun6uhrocIOI9pEailwWM
	7pR+jUTfH1Ar8XBbbw2wA45aonSf2agcuUrdu5/4xdI/0R3P34WwfrWh6wTfke+g2aUpPq8473s
	BPx/Tk+iqYJL7PqM2+N9pCKNCghF7hPT7mkf6cnxvBw==
X-Gm-Gg: AY/fxX61fhn2Od8meJlpNlt0GMyTyS18g1CTY8cQY5rr11iWqrvAXhEKKTD2N2A9D5F
	n6j3Xor6ClZDbKM6HW5knWVb27QhFBLZsEWwy4kXlykaNAKsrPbhI5sy7oybX3J5JWU37fnjC+6
	b0/tRi1APPwiWx8UIHpzj5b5Hx6vzcsVzNFGiN9Jy4XULRRqkzbRZIBdS724F6cYyK/Nle/nDt8
	NcqzXenFCVFa0HF3QUVOcQ5+QABRMxvsAHuat2/GHg3Dv3+1/jqV7vUlyhLLlgIhsL1C/wxKS6H
	Nm0UR1NkPiYJkIbQWTXX27qYnw==
X-Google-Smtp-Source: AGHT+IGt84JqyxLT4FVa1NK9x43gWi2TvpGddBi/ddcId92JOTd0e+vB9z2i06mYaiwFTk4rPI2jpbCaXF0BnPuhN5Q=
X-Received: by 2002:a05:6402:2713:b0:637:dfb1:33a8 with SMTP id
 4fb4d7f45d1cf-64b8e944eddmr31901439a12.3.1767112676868; Tue, 30 Dec 2025
 08:37:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251206230222.853493-1-pratyush@kernel.org> <20251206230222.853493-7-pratyush@kernel.org>
 <CA+CK2bAVuHG1cVPQz8Wafe8o2TtitrqJjqfHOT7Xun=zWMoo2Q@mail.gmail.com> <86qzsd7zmu.fsf@kernel.org>
In-Reply-To: <86qzsd7zmu.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 30 Dec 2025 11:37:19 -0500
X-Gm-Features: AQt7F2pvBnnd5fD8grNsYPQ7hitVBz_yujsMM_6ymMYxKOIzOHac-8gxUv2SYKE
Message-ID: <CA+CK2bDQDsjBkYabH5DVzSr_kuut-XHKb+JFTA=PLa+8gcCVLw@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] liveupdate: hugetlb subsystem FLB state preservation
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Alexander Graf <graf@amazon.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 4:21=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Tue, Dec 23 2025, Pasha Tatashin wrote:
>
> > On Sat, Dec 6, 2025 at 6:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.=
org> wrote:
> >>
> >> HugeTLB manages its own pages. It allocates them on boot and uses thos=
e
> >> to fulfill hugepage requests.
> >>
> >> To support live update for a hugetlb-backed memfd, it is necessary to
> >> track how many pages of each hstate are coming from live update. This =
is
> >> needed to ensure the boot time allocations don't over-allocate huge
> >> pages, causing the rest of the system unexpected memory pressure.
> >>
> >> For example, say the system has 100G memory and it uses 90 1G huge
> >> pages, with 10G put aside for other processes. Now say 5 of those page=
s
> >> are preserved via KHO for live updating a huge memfd.
> >>
> >> But during boot, the system will still see that it needs 90 huge pages=
,
> >> so it will attempt to allocate those. When the file is later retrieved=
,
> >> those 5 pages also get added to the huge page pool, resulting in 95
> >> total huge pages. This exceeds the original expectation of 90 pages, a=
nd
> >> ends up wasting memory.
> >>
> >> LUO has file-lifecycle-bound (FLB) data to keep track of global state =
of
> >> a subsystem. Use it to track how many huge pages are used up for each
> >> hstate. When a file is preserved, it will increment to the counter, an=
d
> >> when it is unpreserved, it will decrement it. During boot time
> >> allocations, this data can be used to calculate how many hugepages
> >> actually need to be allocated.
> >>
> >> Design note: another way of doing this would be to preserve the entire
> >> set of hugepages using the FLB, skip boot time allocation, and restore
> >> them all on FLB retrieve. The pain problem with that approach is that =
it
> >> would need to freeze all hstates after serializing them. This will nee=
d
> >> a lot more invasive changes in hugetlb since there are many ways folio=
s
> >> can be added to or removed from a hstate. Doing it this way is simpler
> >> and less invasive.
> >>
> >> Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
> >> ---
> >>  Documentation/mm/memfd_preservation.rst |   9 ++
> >>  MAINTAINERS                             |   1 +
> >>  include/linux/kho/abi/hugetlb.h         |  66 +++++++++
> >>  kernel/liveupdate/Kconfig               |  12 ++
> >>  mm/Makefile                             |   1 +
> >>  mm/hugetlb.c                            |   1 +
> >>  mm/hugetlb_internal.h                   |  15 ++
> >>  mm/hugetlb_luo.c                        | 179 +++++++++++++++++++++++=
+
> >>  8 files changed, 284 insertions(+)
> >>  create mode 100644 include/linux/kho/abi/hugetlb.h
> >>  create mode 100644 mm/hugetlb_luo.c
> >>
> [...]
> >> +static int hugetlb_flb_retrieve(struct liveupdate_flb_op_args *args)
> >> +{
> >> +       /*
> >> +        * The FLB is only needed for boot-time calculation of how man=
y
> >> +        * hugepages are needed. This is done by early boot handlers a=
lready.
> >> +        * Free the serialized state now.
> >> +        */
> >
> > It should be done in this function.
>
> The calculations can't be done in retrieve. Retrieve happens only once
> and for the whole FLB. They will need to come from
> hugetlb_hstate_alloc_pages().
>
> Maybe you mean getting rid of liveupdate_flb_incoming_early()? Yeah,
> that I can do. It will make this function a no-op once we move the
> kho_restore_free() to finish().

Yeah, this is what I meant.

Thanks,
Pasha

>
> >
> >> +       kho_restore_free(phys_to_virt(args->data));
> >
> > This should be moved to finish() after blackout.
>
> Sure.
>
> >
> >> +
> >> +       /*
> >> +        * HACK: But since LUO FLB still needs an obj, use ZERO_SIZE_P=
TR to
> >> +        * satisfy it.
> >> +        */
> >> +       args->obj =3D ZERO_SIZE_PTR;
> >
> > Hopefully this is not needed any more with the updated FLB, please chec=
k :-)
>
> Yep. IIRC when I sent this series the older version of FLB was in
> mm-nonmm-unstable.
>
> >
> >> +       return 0;
> >> +}
> >> +
> [...]
>
> --
> Regards,
> Pratyush Yadav
