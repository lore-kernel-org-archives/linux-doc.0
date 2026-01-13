Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4AA389DF0
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301383; cv=pass; b=ZmRyflnZKaYAi7zWkhEYziwm2RE4vTLtf4cWvH45h7rfDim/w85uv/t66hHZMzDQ0fA4pJHVPIc9llgyimI4iKiXgR2BdB2ckZUpW8iJyGlkTsL7gnuWxlTDroSilNQlbVY39E4/GgzeFxRhaEFF47Xg66km/ChjIyd4vBVz7eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301383; c=relaxed/simple;
	bh=L74NiKuMjMcF4/Y790Hz4fzcal8g/bkjcL2hkOksks4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGnZTFParMVIS6X+yi9JxyTjK5Lp6C5RChA9vlKUbzfcMjPl2i3lmAANGxdk0TZhB4p/1p1Tq540SLP7XdKKVhsu2Vk/cQnYe+mB+lxrmAZEAtbTv+bFjgYmX0Qx3wFti3kOqKvYLlc4DWV2gBXBMLbzHUFGSH+t+OUQIGDDycw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mYzmZrRG; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mYzmZrRG"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4edb8d6e98aso339021cf.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 02:49:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768301380; cv=none;
        d=google.com; s=arc-20240605;
        b=PSrgskQelrWBaLlBsqz/E0MfdusJPCwDCIc4Po5VMQqtJRT8jrmD/rrxNZVtO8JD0s
         /A5bl6EQvKyVnjopI9e8FeV6tdzO2Yrkv1H9CFXldIV+ObG7xKA9GOXUsktWhUJUM5Z8
         BiSJI2hCRBoGc2Z/my8HtCGGvL7/WOk3IRpdZCAIBlCOwZmLZcVOa9ZugwoI3TBKo6aq
         yPlglkcGU5XizCfnGbmHqkrFUFA32MERD37OuIPm1j3VAPqT91dlBC0TE9+RdZ+c0SrL
         RyeGp3wrpOtctVCWkM2SZMWdA7Em2265/+08jEnjwCKKSGX8mx0Ya70ez6LG9TFYBphS
         otjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NXG4CU5YmzAtAnNGeTeZPJtWkZL9OvdDelesvzB7oWk=;
        fh=R8FtmqTPXhNFH7q9SvGciLUahtdxh3eLyq8zgeTC/Hc=;
        b=L3mLl3r1LE7nogIXZRbvVQINlym49tUS29f12bmip8TrIfBHAzrm31U6E1Rqg7lXvD
         i71g9vix13fVcW+F9vYXPAOajJXsEP9PvJK+KOsUyZIPJBTz0OZJSzNhvV3omBaISFb6
         DkTNjfXVielor0AD8rT/I4SCYxQH8UsygiK03/AWETqz5oOZDZpa6GJEj7sSYa7tVs0I
         yMIrkyB4lV/WZLNTiVhNa4J0Yegk59Lmzw4to/3mAFB/LpHkE5T7NAjwODD54zG12TkJ
         ZtpyeKG6ovZu7HDn/TvMzSInvFphKV6Y8o4f4xu3S5qjhMEyS/4Jurh4DqLuc5PgCo3E
         1OPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768301380; x=1768906180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXG4CU5YmzAtAnNGeTeZPJtWkZL9OvdDelesvzB7oWk=;
        b=mYzmZrRGfKP/itI2upqneCp4hZ8xHfkIzh4Atwbm0vxEfx2F9nCpHqoCCA+r86Kyjn
         aVQUMId2XNlGk0qX6lBUSrw6NhY151TkWHVB9Z3zuQMP+Iznd5bmfAwAqigR/evGDzY8
         Gm8VkrK+pvGTG0KlMm1cCuz3FpXibmMz5goT2eyQUibmlg53k5JvIvpbEDad9RlERyba
         BhqY1c9KeDAFYe0MKns+gOH0305NwSVyReEBKs+JXJB9mQrVriG1v3Gzr9i3lHwQM9ak
         bIZ24bFrt9jTXzvtDzFKdbviuOOHaaipdNi4kST4QBQRfTbgSPCjQjTH2d19r3ldM7Jp
         Y96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301380; x=1768906180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXG4CU5YmzAtAnNGeTeZPJtWkZL9OvdDelesvzB7oWk=;
        b=G1NLPscnT5aa1HJ8/DX/DrkndcTT4VaKJ5eO4VJIYEd01SsvbrcXwcBp0eCjigx0Q6
         TqLu6zvG9fBATHT6ni6J9+yzu9stKwp5ZpWUlme+ZX0ro/SNzgQhnt4MCq0uj0EX/5dj
         EfWnkFeyzo1vXmMJGEIZBCZBCkkhjIjsEAD7ZKNxudj0WlH2vGUk7t2pUy8FiYl/jm6D
         mJf62jjXEeBfzPnEur5rbTSuvoIq4lUpaKVTax9B7mfW9p8vOrOKCRPJdCd/4cMdvSjj
         e8Zv7w+UkdDoMukNdqFlppV+a8epaT6nxcB7HZb9UiJlg7CD2X6DHoGPSdmKTPZxCK22
         Y0yA==
X-Forwarded-Encrypted: i=1; AJvYcCXQxMYXpAU+XlwLMXF+BM4s2gXneR64ocjSCwSPRipjKo8RsWVrOWO1pZyevUghgopTSn3E5TGIdb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkV75I7frS4TXRxvaRAUMuGPEjk0aEZal5HS7SHVOM+YGkMRU
	nZDpRQHFQc1xWq4RJzAWDNbi8C3SOlFiqLRsG6lfR3eA28a+RMFKE6CIN8SC5+2YVdFr5Tp8nKt
	WneveMbJ3x2ZeFfPxnxx7S9oePCJ+MCwgz1zqMSkl
X-Gm-Gg: AY/fxX7xiiqygwHXl5P4PKSEH7XQMhrHPUwk7O0C74b07vRzZuPfuuwHI0VG92eY9KB
	3RvcnFaeCuz3WwgE6aGsuSi0qvCbo+hFnpXDyDBrr6ZgIoPpaj+q47RMMx9UN2qzLwprA8HW+cK
	euAnctO3rCtuXwzPNvPHxK7WGGYlurw5mWsiewlL9VDk6uNU8ffJURJbSYpNMqMF73Hn74yvYEk
	EnAEnrG7fd9M1siVjh34OVOFU+XCWL8RBI9QgOv03KE+pHwQjWHwTyJzBJBi5m3ktBYJe1C+vUx
	ptnwD1fA1d5G8hQQTAO//Wzrqw==
X-Received: by 2002:a05:622a:3cd:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-5013af6d173mr7683061cf.3.1768301379920; Tue, 13 Jan 2026
 02:49:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109171805.901995-1-smostafa@google.com> <20260109171805.901995-4-smostafa@google.com>
 <20260109195111.GQ545276@ziepe.ca> <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
 <20260112133256.GB745888@ziepe.ca> <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>
 <20260112135208.GD745888@ziepe.ca> <CAFgf54q+9Y5TtGJDB=8q_BW-0F=TM7zBbCcMzvtvr_N2WMnd-w@mail.gmail.com>
 <746f5adb-1d91-4ca2-8ae0-a2d171203b66@kernel.org> <CAFgf54pbkfdFr6biE8BiNKBnTBFWxXGmvxsZ0E+C1C44c9AW_g@mail.gmail.com>
 <482f2f36-e906-492a-a80c-987bf7359d83@kernel.org>
In-Reply-To: <482f2f36-e906-492a-a80c-987bf7359d83@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 13 Jan 2026 10:49:28 +0000
X-Gm-Features: AZwV_QgAlplyLPfi6S3PJ1zgKNxfE-mAUtCQBPaWTfjdB1wsPcBjVXKJ3tx22Ws
Message-ID: <CAFgf54ovfnTHmMuZGk73SEEKsP3k-_exR1wqUE4W9tLYKv_iDw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 10:31=E2=80=AFAM David Hildenbrand (Red Hat)
<david@kernel.org> wrote:
>
> On 1/13/26 11:22, Mostafa Saleh wrote:
> > On Mon, Jan 12, 2026 at 7:12=E2=80=AFPM David Hildenbrand (Red Hat)
> > <david@kernel.org> wrote:
> >>
> >> On 1/12/26 15:58, Mostafa Saleh wrote:
> >>> On Mon, Jan 12, 2026 at 1:52=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca=
> wrote:
> >>>>
> >>>> On Mon, Jan 12, 2026 at 01:43:41PM +0000, Mostafa Saleh wrote:
> >>>>> But I don=E2=80=99t see why not. from the documentation:
> >>>>> /**
> >>>>>    * pfn_valid - check if there is a valid memory map entry for a P=
FN
> >>>>>    * @pfn: the page frame number to check
> >>>>>    *
> >>>>>    * Check if there is a valid memory map entry aka struct page for=
 the @pfn.
> >>>>>    * Note, that availability of the memory map entry does not imply=
 that
> >>>>>    * there is actual usable memory at that @pfn. The struct page ma=
y
> >>>>>    * represent a hole or an unusable page frame.
> >>>>> =E2=80=A6
> >>>>>
> >>>>> That means that struct page exists, which is all what we need here.
> >>>>
> >>>> A struct page that has never been initialize shouldn't ever be read.=
 I
> >>>> don't know how that relates to page_ext, but are you really sure tha=
t
> >>>> is all you need?
> >>>>
> >>>
> >>> AFAIU, if pfn_valid() returns true, it means the struct page is valid=
,
> >>> and lookup_page_ext() will check that a valid page_ext exists for thi=
s
> >>> entry.
> >>
> >> Not always. Offline memory blocks have a memory map but no page ext. W=
e
> >> allocate the page ext at memory onlining time.
> >>
> >> Also, I'm not sure about ZONE_DEVICE memory, very likely we never
> >> allocate a page_ext for them?
> >>
> >> I'd assume both cases are not relevant for your use case, though.
> >>
> >
> >  From my understanding, in that case, page_ext_get() will return NULL.
> >
> > So, as long as struct page exists, page_ext_get won't misbehave.
> >
> > I am not sure about offline memory, but MMIO can be used. We use
> > pfn_valid() before getting the struct page that we pass to page_ext.
> > Would that be OK?
> It's tricky. If you look at lookup_page_ext(), it relies on extracting
> the pfn+nid from the "struct page".
>
> If the "struct page" is uninitialized (e.g., offline memory) that cannot
> possibly work, as it could just give you random garbage.
>
> (note that there are two implementations of lookup_page_ext(), both
> extracting the PFN but only one extracting the NID).
>

I see, thanks for the clarification.

I see that pfn_to_online_page() exits, which seems to handle online
memory and ZONE_DEVICE. Would that be a suitable alternative?

Would you have a problem if we added a new function in page_ext
"page_ext_from_phys()" as Jason suggested?

Thanks,
Mostafa


Thanks,
Mostafa

> --
> Cheers
>
> David
>
