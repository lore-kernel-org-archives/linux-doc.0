Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CA932862D
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299778; cv=pass; b=Zh4gnPNZnVr4voHBFtrvONjI5iScw3c+YKoQfsigM7FqU4GjZsyBl2VlhpcuSJl+vFxvcE88Pd5GQ47KBUFkT1cg958yLyEke5ex8lO2+kpeTuyEqSMYA4SO84G95nyfCjvs56YtDMQ5OU0ssZp4+bTNaaCiyxJd0mbbCjX4hC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299778; c=relaxed/simple;
	bh=j3OwXXEAmSxRLTGPF30uCuH9V/84AQ8BpwM0oX197Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZ0IHzwgCzOYCZn9JxNToHqat4DTWe9BrepANwa7r17AGqARCgoRuZ6FYGTG5AS4ZhgMvO6uf6BKj7TR3OBGziL2WZ+8Cwj9czNUQSGA1Gk6xTNJkmSYhBbZHkGCIvQ6xMCO6ApzARqLkQhO3Cykraaqx+cdp0c6nwH61llyn7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aCZ9Tm41; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aCZ9Tm41"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4edb8d6e98aso330791cf.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 02:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768299776; cv=none;
        d=google.com; s=arc-20240605;
        b=O9XAO+mgkaa0g+OLHGuCb2sGFGFDsD4SKl4lq8ow+7hov8g5ngszrzfDs408gatuge
         zOn+gvk8kMOxOB4QJNoYTnpfEK41P0Rbq/6pZYyQdIn8UyI7QKOSBRiWGIY9sbfCgfsR
         2rJHo6zGlpOHnVadx1bYSdDBjwvMuADxbQrkX7hpihMPavXv7KLVaEFvPQGazHMhkkqS
         ep/+yT9h85hrpjYNylhAE/3NwMrxwztSmJjzrIQUCfd+zhH1TxBVjE7pSOKxHByLE8XE
         o9eqyNTdSY1a9WcQuL+4DSwhllHlTPnU4fGIx/k/61cbQ4wOBPCuxX1MPPU3iUqA6y/q
         S5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+f//pvo+PKe+VeeiEDq3PkoxP0zliahBI3UIRJy+vU=;
        fh=+GzD3R4zBKFy3OSw02T7iUi+KZ28kQW0OZ+AWKnWUqA=;
        b=BPjDPzFwGmevtUIACPDJqbmj5jvlt/IgRvPS40n+ZMelsN559bZN+vNZYVT3HeCXb6
         W+c1OclpaXgQIkFCzqQqi+kgFhHfY/Bh70g/+hpFj7Ol0sOXnQydURnjUnGTNrw5nP/Y
         cjqjKeILuoRfKqSkKgPqevjohsQJ2X9e9cjVLoO5zqnMuoez1mq/0YygRZrFCYjZHCDm
         NebAozJp8S9HhodjAvoR/u90GWenBbPsxajoaphIE4YQZP+UE+Z6QONruoHC+41uM9AU
         9dVeBu7RHA6AbKHG4IX5GHTntJZmctOAZ5kKTt8vnaE6PuGB1mQjWoRMJOwsKibnajoU
         rKOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768299776; x=1768904576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+f//pvo+PKe+VeeiEDq3PkoxP0zliahBI3UIRJy+vU=;
        b=aCZ9Tm4131uXydwm2nMmNLeRhPs4M7XteXIuWCzQo3fzpzHDY0I9PeUi4BD3FzB8LW
         xuJO26HhG7h7VvMaq5P9ohVa4OApJNhE98C2X55SXIhpSFE0i5WGya+FjdqIbIzwkUc6
         PT0Nsy2oNVcKSzHtvdQOuSZQ0RRKngsz1drI5mRWp+hGHtXZs6/SmRM9JXmQmc8flR9b
         gru9xz1qkndanqvWEl7dnqgL1KwWZcwxVKdQRzQKHBlVpgqAeeXNFZIv4C7cwsg8omwD
         NdMHJI8CtooKo+bUjgUkOZdYMntQvIJCaILe2tg0tH8QBjHgiF5frXfo3DYcrwFttQvY
         9E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299776; x=1768904576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+f//pvo+PKe+VeeiEDq3PkoxP0zliahBI3UIRJy+vU=;
        b=aF7lVyt7drLXqGBSXmJBpwBPuu7+W6B7pQkiUNM1rXah9UUNHnyCnibMOGeldqqS1g
         k9VIY1CiHWQCpNIeGZC3L/X3UbJinlr4qrhfVKmUhL1Y25GfcpaFn7JNPbzhgiJ56Vec
         4FMJb00je2sWg7ZntjB17+tv/PCnorEizQI4e5WxBvtPjGn7ZZr0/IwWm2NXGJCbzWgZ
         nu7MZq5WUPokjvlogrkFv52TO8ZYQv3Oq+nz5HvjagUdBkT21KOZRMLttRBkAzfx5hcn
         8xMG4ITIeZUeWtcUWHDQVEmUvrbLRfBWPwXffzeEL/XN5Oj5E5626Or5qIauPhmpFkpj
         nSUg==
X-Forwarded-Encrypted: i=1; AJvYcCUcNPQ08XTLFDb2y038uGch+45uW2VKpsb8kNyFD9YWAU2aDka/ML9rdd0NmgLRuBLNS/yPpEvKAbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJtcG6zbARAldejRxPWFXfa6ra93q/lddCMOBpyPR/SybUv9f
	lMD6yIpWfkDNeStiIbIQh5YMiMsuw+DKdyUSuBzA6+mPDtegvPpmsh9xnfiPY/nqfJOZhrYSTZ7
	OyWlxpi4py9MvVbsBOEXG1cRqXDsp20eBO7NlE6oP
X-Gm-Gg: AY/fxX5zD1h3pusUP5M0hyehYAR9VdTuUWGZDsiv5Yx+mdFl9ZysBW+03KBX2gf+hXz
	BDur6b2V7gPgku4IBoW3So5N8fwbFToaLpvX0P/73bX/cMvJAJQkhnOfSHgjztHRo7jWkOaKTIc
	UcuvxDJn4eaKnb67z1eAvP2Ofi67T+eDQymqyRFIW6tR2VRQycN1zaJu502ofEHPpDWzfG/1VCv
	H0OnF3uFQIMv1MJmFZNJlmz2l9OB0bNxTmzl2rYs9PuYgHw/WAGl2/IGbzmx+2kDAE1DkTi0MoY
	TwGRqGK6ryZ3//WmaA/+srkEBg==
X-Received: by 2002:a05:622a:2cb:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5013af668a5mr7179931cf.1.1768299775379; Tue, 13 Jan 2026
 02:22:55 -0800 (PST)
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
 <746f5adb-1d91-4ca2-8ae0-a2d171203b66@kernel.org>
In-Reply-To: <746f5adb-1d91-4ca2-8ae0-a2d171203b66@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 13 Jan 2026 10:22:43 +0000
X-Gm-Features: AZwV_QgLu7sBxIPXL9VWKxHh4_TpVGZL_EvYu3l8xKSz8ElTbsqiQ8JNqP1h6nI
Message-ID: <CAFgf54pbkfdFr6biE8BiNKBnTBFWxXGmvxsZ0E+C1C44c9AW_g@mail.gmail.com>
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

On Mon, Jan 12, 2026 at 7:12=E2=80=AFPM David Hildenbrand (Red Hat)
<david@kernel.org> wrote:
>
> On 1/12/26 15:58, Mostafa Saleh wrote:
> > On Mon, Jan 12, 2026 at 1:52=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> =
wrote:
> >>
> >> On Mon, Jan 12, 2026 at 01:43:41PM +0000, Mostafa Saleh wrote:
> >>> But I don=E2=80=99t see why not. from the documentation:
> >>> /**
> >>>   * pfn_valid - check if there is a valid memory map entry for a PFN
> >>>   * @pfn: the page frame number to check
> >>>   *
> >>>   * Check if there is a valid memory map entry aka struct page for th=
e @pfn.
> >>>   * Note, that availability of the memory map entry does not imply th=
at
> >>>   * there is actual usable memory at that @pfn. The struct page may
> >>>   * represent a hole or an unusable page frame.
> >>> =E2=80=A6
> >>>
> >>> That means that struct page exists, which is all what we need here.
> >>
> >> A struct page that has never been initialize shouldn't ever be read. I
> >> don't know how that relates to page_ext, but are you really sure that
> >> is all you need?
> >>
> >
> > AFAIU, if pfn_valid() returns true, it means the struct page is valid,
> > and lookup_page_ext() will check that a valid page_ext exists for this
> > entry.
>
> Not always. Offline memory blocks have a memory map but no page ext. We
> allocate the page ext at memory onlining time.
>
> Also, I'm not sure about ZONE_DEVICE memory, very likely we never
> allocate a page_ext for them?
>
> I'd assume both cases are not relevant for your use case, though.
>

From my understanding, in that case, page_ext_get() will return NULL.

So, as long as struct page exists, page_ext_get won't misbehave.

I am not sure about offline memory, but MMIO can be used. We use
pfn_valid() before getting the struct page that we pass to page_ext.
Would that be OK?

Thanks,
Mostafa


> --
> Cheers
>
> David
