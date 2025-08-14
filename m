Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9218199E94
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755183947; cv=none; b=ceTIHP9f+T4TOHVb0DeRXcJ9WK6h0N/bI1dbEmB4/bfM32tYynkj4dJWnDjcCVcINBcIX6OhptNhYbHqLbZzqnYq7Q12+YTN4Rmhp2wtq0hrVMvJzTUOFI6K5yirx5sHmnx/+CaMHnBct3zPBoqrXSA1FaFm/nQ9XJfxgTcDukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755183947; c=relaxed/simple;
	bh=MYtHCpNH7rm/Grf+WS5Mwx7BfujxUdXEAVIXm4oRgeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ar5iLDJtb6NBd9KFtGchGuEbW7fLPgYaIfT5IAmU7UDDPocsAz0e3Ovcxnusgf+G8dN+5uHelAlzyXHtz4xk5+fzRe6F0JnzJ4lg2CFrtx9LvPogdvR7eHaohWbSqMybDcO8O5hJjemKhfVS5qeav7PkbxZZ5/rMRJ8M2A7L0I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bZk5HtTP; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bZk5HtTP"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e864a60b26so235919185a.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1755183943; x=1755788743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zaTlP5pzo/qg9qINxtiKx2DfK943m3JT2OR6iyYMuY=;
        b=bZk5HtTP3xdifzseYfqy3JsWZKqx2xgMaoYvXb9szp4i5kpLke+Yt8ifotwtltcyd0
         /PJzV27vjC6pOU/v5rHOF66UH8gE3fpwZSCUBkQFRQBKHfZMRlOvsGHFlOPd1TUYKovu
         1bzkN8JisNI8cral03BJDzCDUP65OiViBh/1cWd6Yk3X2thq6v68kq1Zp7kwdBjV8tqq
         QlhqqKTC0VAWAksy3QLMqid6llYtFGrnZVJbh7NXhb2Ra0BgBPehaDzOx3UcsBi5SaJk
         KLBr6VIShk0tjB9KXAW8M+80j+n9AgzHchRfxxmxL93fG3CKYgwX6hErgyyQf2LBSXLw
         QRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183943; x=1755788743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zaTlP5pzo/qg9qINxtiKx2DfK943m3JT2OR6iyYMuY=;
        b=l6klrcAywyizjEs6+r2qd70RSKul+YCPpSa1Ys6gm6IBFIq0V21eQK5qm+oj62VqDh
         eZwpCFmqnivbp1ILK1LTOdgmbvGG5wPjMtGor28i68QYhw8S56hZD4uFdjRKDYv4EmRY
         2S5uVNkbmoIQBVJvpfhgaxU+mtnSyFwWLzkOE5icLRfg6M9nr00/pxHp6yoExcYjBY9h
         sOM7+Qly/5d8Rc6Pv3yp5oCY0IQTSnFg8Q3yL64F1za9zqPwwt2n3zvYotSZUEnuRWgN
         vem/W5xiRp4GprHrPNbiQ+k2VpwaziYD52Uf0IuiX0Q1n7fO9298hSFVyqG4rvdvuT6B
         moUA==
X-Forwarded-Encrypted: i=1; AJvYcCWyH0nDtDZiQS1Ox9MZM7AVmVWPvzwqOI3AqXLItOfpoR9hlUmK4u5coqQVSc6R2KsYzDGWduTzSp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWAkrUCtEBLo+pvgiuiLtMwJaSXZKKJzyohKLR5+/ITfq8Sh4R
	bgTsdzLCJxE205jXjazFyOqSl8vn7q88p9zEAoZdsNaiMlRvYgdINyN8wLrZr5m72Et3FTstTfi
	F8hVENlvhBZRanwaf6cdTgr2DAwBc4J857IjNAO0SQA==
X-Gm-Gg: ASbGncsJonFzUMqFiTv4hFWR1fkEwAhCjAwDz7klfYrRjfw+jUr/uyC/XNh7kEy81gP
	FlGMy+bKNqjqhh4hBvvlic3ruXPqy+Qd88ln8YyaDvTb3iciZwJGrUYBmDakIVB7S1BT9HLXdN0
	G/bTrtZEIXh2a9AvVyPG6SNKhvLXlK3U73qpaJ55W8gvqqbkJ9lAC5bYIcd6wdcL8DDn1PkbvU8
	MGwjevOYTvLbUg=
X-Google-Smtp-Source: AGHT+IGd/DJ84Imu5KYRHkgnpNm4NZ636lX1WUQFrgSI87aMZKq+0zSxGBg+110FdN/squBIYOywjRpAp8ettpbigko=
X-Received: by 2002:a05:622a:5e09:b0:4b1:1109:6090 with SMTP id
 d75a77b69052e-4b1110964camr21827551cf.4.1755183943358; Thu, 14 Aug 2025
 08:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-8-pasha.tatashin@soleen.com> <20250814132233.GB802098@nvidia.com>
In-Reply-To: <20250814132233.GB802098@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 14 Aug 2025 15:05:04 +0000
X-Gm-Features: Ac12FXy7hDZjxYMY4c9rpouOJZeOk5g8OwQ5wREtab5YlBDjZqQf27ADm8vAB8Y
Message-ID: <CA+CK2bCbjmRKtVVAok7GH8xvh8JWrga5Oj-iK-p=1M79AqvhRA@mail.gmail.com>
Subject: Re: [PATCH v3 07/30] kho: add interfaces to unpreserve folios and
 physical memory ranges
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
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
	saeedm@nvidia.com, ajayachandra@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 1:22=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Aug 07, 2025 at 01:44:13AM +0000, Pasha Tatashin wrote:
> > +int kho_unpreserve_phys(phys_addr_t phys, size_t size)
> > +{
>
> Why are we adding phys apis? Didn't we talk about this before and
> agree not to expose these?

It is already there, this patch simply completes a lacking unpreserve part.

We can talk about removing it in the future, but the phys interface
provides a benefit of not having to preserve  power of two in length
objects.

>
> The places using it are goofy:
>
> +static int luo_fdt_setup(void)
> +{
> +       fdt_out =3D (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
> +                                          get_order(LUO_FDT_SIZE));
>
> +       ret =3D kho_preserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
>
> +       WARN_ON_ONCE(kho_unpreserve_phys(__pa(fdt_out), LUO_FDT_SIZE));
>
> It literally allocated a page and then for some reason switches to
> phys with an open coded __pa??
>
> This is ugly, if you want a helper to match __get_free_pages() then
> make one that works on void * directly. You can get the order of the
> void * directly from the struct page IIRC when using GFP_COMP.

I will make this changes.

>
> Which is perhaps another comment, if this __get_free_pages() is going
> to be a common pattern (and I guess it will be) then the API should be
> streamlined alot more:
>
>  void *kho_alloc_preserved_memory(gfp, size);
>  void kho_free_preserved_memory(void *);

Hm, not all GFP flags are compatible with KHO preserve, but we could
add this or similar API, but first let's make KHO completely
stateless: remove, finalize and abort parts from it.

>
> Which can wrapper the get_free_pages and the preserve logic and gives
> a nice path to possibly someday supporting non-PAGE_SIZE allocations.
>
> Jason
