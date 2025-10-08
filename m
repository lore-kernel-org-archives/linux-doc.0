Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B692F5A22
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759914325; cv=none; b=VpPSukCYATvo2nAG2bs2M8/XmKZZTPItWRfqHEjqkVW4BJgiCdnyLPrjkxh1kW7URAOcbhLksspHbg20HLCvCjIYhLlTxnYr4UOvP5bh8fn9WEIPKma0Xn1TJ6HWiq90BsBrFpdOYWYSRpRswGWu/MwFU63/SESaKG5G/VOO9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759914325; c=relaxed/simple;
	bh=O5jvZp7YSs8BkOVk59YxrtO8UmzmgVwYrqDwI5aX2fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/RB4ZH+Wb5skaR9wycQvKEmP1f8osE3LsLDCahOBRsM+Uaas4pxf4Bux99jlYgW2jHNzaT24zWxlE9P5Zih8qqzKEoQJkK845X6PCkxCD24x3egOFsQhEfrqwXscufDsHcmC0kkVYPOOEZgcZ1ffKi1CA/PIJwlrX4CfqxRNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBa4EzJy; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBa4EzJy"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-78f30dac856so68050816d6.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759914322; x=1760519122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4cYZmadA8mCAkJgxHGzRBrmoQCHtUHFnir9NGk0Mxs=;
        b=aBa4EzJy3HlZhHVePegvhxnRl7flkQOGJ/1AmPgYErrVPZfQvHFkdziSsmQH86SM6a
         iIuVUgsuYKehSCBk3V8Mx45VOBL55/l2fhtlTTLlgrpEWU3SCfitYCAYmbiJvdK5Ss5l
         paReAFa7Lw+75k4kX4+33hjoL8BBc6TOy2xtY9dyo2QlZCZWEEc2qbWbYdb+IHYK2S9L
         tAy/Ue3/7RuHDvUDMLTITnO04UMWQ41X6rlwAixbA8ZAZgZqjD7z0bR0axnFwXt6mIIv
         zInx0EdhWi+2ZILUVyXAI/W9PEiMUjOSlom4V6S4Dh5aGasiqLSr3t58HprtyGmjgW0W
         MfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759914322; x=1760519122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4cYZmadA8mCAkJgxHGzRBrmoQCHtUHFnir9NGk0Mxs=;
        b=VQJQ/qEnaoemiwiAuO91JzSNMPT8dsclRL8A7TkAP5rY+yB8pbjWDI3clYb1NI0Ss7
         HJcoDtUovUylNP21sGcFRBifQ8mdhAbcFE8U92uPtygmH5dbqPmVbk7PGA8bIfYgym6t
         ZifGq2+QcaR6mDsAfysCAiznElzyN+STS15HCScC4nJEP86SsPeGqET/oCssuStqgKAV
         6kPalRiDvnCMRwD2U828aLddEjiMoyg0IB5bk20JbB9VP2U1rGbzDockC9sufsHobJlL
         NekFWUWnoM8vXzB5HKDfOwRC06wiFBMPYDMAA+lE0nbxTC6TCWZThC0kFPI1MuR1CfkX
         Sk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaf+qR9W8vE0oXxBNhUG+34Fu7OjUFqJE5l3YBDOtX2ElGwiiVBLfXA4hAjrwa9i078WYDGtbpitM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjVPGOm5sdTAhr9vMglSfD/LHkh/xkeUK/Rz6KJYz8J6Femfl
	88bousaWD537Hj1JqUQRwxAJdamjAh9qUxjno8MRyeaV6slMQa6aCHWfqrvb8mSsu/aftB1+CW8
	YisW4NFP2AKM4hQWIVabT/nwhwZO3aak=
X-Gm-Gg: ASbGncv/2sZGKNG3gXMj2oqUcDNh9woPmZ4e/wO08x06x5QVehAYycziuFtS7mriYGo
	ERv0zh3pdmUKNlhYe0GyTsuuQX/BZLWOSK0V1a0CDsH547qmM0FEg1d0fO1uUjV9xpF8p0nPmfm
	BtydFFf2U2jWS/+VkbZg0Fr94ilKQFJHSfUbOipcp/XAJwg7ZZ41JWK4sfoe21+1DLEl5uzkkQD
	Hm+FYxCTthX74nwbzdchzWbZWjYzske/wjb60ewbjm1Nv4w5CPi9qNcN3o6OhRS
X-Google-Smtp-Source: AGHT+IFtF/lJgRUwcJ1lVxRX1vX8QykTlCWe2klEiz/B5NPbX3cSQGIv9tHJapmtZwhENtdJSXzQ5eGIRt0iWburmhc=
X-Received: by 2002:a05:6214:2a8a:b0:782:1086:f659 with SMTP id
 6a1803df08f44-87b2107dd72mr31942296d6.26.1759914321370; Wed, 08 Oct 2025
 02:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930055826.9810-1-laoar.shao@gmail.com> <20250930055826.9810-4-laoar.shao@gmail.com>
 <CAADnVQJtrJZOCWZKH498GBA8M0mYVztApk54mOEejs8Wr3nSiw@mail.gmail.com>
 <27e002e3-b39f-40f9-b095-52da0fbd0fc7@redhat.com> <CALOAHbBFNNXHdzp1zNuD530r9ZjpQF__wGWyAdR7oDLvemYSMw@mail.gmail.com>
 <7723a2c7-3750-44f7-9eb5-4ef64b64fbb8@redhat.com>
In-Reply-To: <7723a2c7-3750-44f7-9eb5-4ef64b64fbb8@redhat.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 8 Oct 2025 17:04:44 +0800
X-Gm-Features: AS18NWAJwXG18rE8UjAVYGwSMRoVGqsV4lXBJi6ePSpLgxcjj8cRCthEf3HoP2g
Message-ID: <CALOAHbD_tRSyx1LXKfFrUriH6BcRS6Hw9N1=KddCJpgXH8vZug@mail.gmail.com>
Subject: Re: [PATCH v9 mm-new 03/11] mm: thp: add support for BPF based THP
 order selection
To: David Hildenbrand <david@redhat.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Liam Howlett <Liam.Howlett@oracle.com>, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, Johannes Weiner <hannes@cmpxchg.org>, 
	usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	Matthew Wilcox <willy@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Amery Hung <ameryhung@gmail.com>, David Rientjes <rientjes@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, 21cnbao@gmail.com, Shakeel Butt <shakeel.butt@linux.dev>, 
	Tejun Heo <tj@kernel.org>, lance.yang@linux.dev, Randy Dunlap <rdunlap@infradead.org>, 
	bpf <bpf@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 4:28=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 08.10.25 10:18, Yafang Shao wrote:
> > On Wed, Oct 8, 2025 at 4:08=E2=80=AFPM David Hildenbrand <david@redhat.=
com> wrote:
> >>
> >> On 03.10.25 04:18, Alexei Starovoitov wrote:
> >>> On Mon, Sep 29, 2025 at 10:59=E2=80=AFPM Yafang Shao <laoar.shao@gmai=
l.com> wrote:
> >>>>
> >>>> +unsigned long bpf_hook_thp_get_orders(struct vm_area_struct *vma,
> >>>> +                                     enum tva_type type,
> >>>> +                                     unsigned long orders)
> >>>> +{
> >>>> +       thp_order_fn_t *bpf_hook_thp_get_order;
> >>>> +       int bpf_order;
> >>>> +
> >>>> +       /* No BPF program is attached */
> >>>> +       if (!test_bit(TRANSPARENT_HUGEPAGE_BPF_ATTACHED,
> >>>> +                     &transparent_hugepage_flags))
> >>>> +               return orders;
> >>>> +
> >>>> +       rcu_read_lock();
> >>>> +       bpf_hook_thp_get_order =3D rcu_dereference(bpf_thp.thp_get_o=
rder);
> >>>> +       if (WARN_ON_ONCE(!bpf_hook_thp_get_order))
> >>>> +               goto out;
> >>>> +
> >>>> +       bpf_order =3D bpf_hook_thp_get_order(vma, type, orders);
> >>>> +       orders &=3D BIT(bpf_order);
> >>>> +
> >>>> +out:
> >>>> +       rcu_read_unlock();
> >>>> +       return orders;
> >>>> +}
> >>>
> >>> I thought I explained it earlier.
> >>> Nack to a single global prog approach.
> >>
> >> I agree. We should have the option to either specify a policy globally=
,
> >> or more refined for cgroups/processes.
> >>
> >> It's an interesting question if a program would ever want to ship its
> >> own policy: I can see use cases for that.
> >>
> >> So I agree that we should make it more flexible right from the start.
> >
> > To achieve per-process granularity, the struct-ops must be embedded
> > within the mm_struct as follows:
> >
> > +#ifdef CONFIG_BPF_MM
> > +struct bpf_mm_ops {
> > +#ifdef CONFIG_BPF_THP
> > +       struct bpf_thp_ops bpf_thp;
> > +#endif
> > +};
> > +#endif
> > +
> >   /*
> >    * Opaque type representing current mm_struct flag state. Must be acc=
essed via
> >    * mm_flags_xxx() helper functions.
> > @@ -1268,6 +1281,10 @@ struct mm_struct {
> >   #ifdef CONFIG_MM_ID
> >                  mm_id_t mm_id;
> >   #endif /* CONFIG_MM_ID */
> > +
> > +#ifdef CONFIG_BPF_MM
> > +               struct bpf_mm_ops bpf_mm;
> > +#endif
> >          } __randomize_layout;
> >
> > We should be aware that this will involve extensive changes in mm/.
>
> That's what we do on linux-mm :)
>
> It would be great to use Alexei's feedback/experience to come up with
> something that is flexible for various use cases.

I'm still not entirely convinced that allowing individual processes or
cgroups to run independent progs is a valid use case. However, since
we have a consensus that this is the right direction, I will proceed
with this approach.

>
> So I think this is likely the right direction.
>
> It would be great to evaluate which scenarios we could unlock with this
> (global vs. per-process vs. per-cgroup) approach, and how
> extensive/involved the changes will be.

1. Global Approach
   - Pros:
     Simple;
     Can manage different THP policies for different cgroups or processes.
  - Cons:
     Does not allow individual processes to run their own BPF programs.

2. Per-Process Approach
    - Pros:
      Enables each process to run its own BPF program.
    - Cons:
      Introduces significant complexity, as it requires handling the
BPF program's lifecycle (creation, destruction, inheritance) within
every mm_struct.

3. Per-Cgroup Approach
    - Pros:
       Allows individual cgroups to run their own BPF programs.
       Less complex than the per-process model, as it can leverage the
existing cgroup operations structure.
    - Cons:
       Creates a dependency on the cgroup subsystem.
       might not be easy to control at the per-process level.

>
> If we need a slot in the bi-weekly mm alignment session to brainstorm,
> we can ask Dave R. for one in the upcoming weeks.

I will draft an RFC to outline the required changes in both the mm/
and bpf/ subsystems and solicit feedback.

--
Regards
Yafang
