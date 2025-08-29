Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28C1F4C99
	for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756493251; cv=none; b=KIlj1QNHe6Hq0fkrdh7qlDjJPU79m4C+Db0+dkLmfNRKLMm0lT2T2oHmuoDmCHOb0fQZjY8gsuwDE033k68KFVaOnP/alf3x+WW8h1X5YG3RBOybIRKmM3cxDfBRMDBSobPUIiNi2WvmhpkMYZzzcUHsFPrKZrcghDZETxMnYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756493251; c=relaxed/simple;
	bh=EGsrl7rz3n15ufVe4i49SD1EQ18PX9TeDC0B390PTkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIIOsWmSoP/SnJHsGiqkFMjgQ5t0gmZ0OHhLNvDdQ54xmg8cNJbAhYqZVLThSkrJROQEULF72y9Zock8xTE89Thbhs4yJgvq7m53cpoD2jj5tNnd/gL0AiP+eM3giEVq41t17xU0zt9bMtuwM9QrSUOLmvuzU9XItSYW85cA1gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDPvnxOH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDPvnxOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC757C4AF09
	for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756493250;
	bh=EGsrl7rz3n15ufVe4i49SD1EQ18PX9TeDC0B390PTkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QDPvnxOHQiaw+V/AJpBaKUWuUvF9UjbrFHSJHT0znUaYPxTkiRUk9F6oBoo9v+sK7
	 3ll/lYPhb1TAxlpZVrfrWoGILcQ3boZDh+mSRKEb/Jfj8F2lMX2xFd2tHaX0OjamrV
	 ijMlZYzFk5IZBuQkS+cKcjhMRtwjiXQiemN+iPGwuzeAxe9wo3byWcIzXNYvbackEM
	 Ifg0XrMLqzVsDhD8wXRwQivSOLhMmxGuHRmcP3HqYQqo53pYTfidmbtRqDEtlJx7Wk
	 b04sfCVlU38IhAZht/21vwPfoTmqDpdVPI2FG+3AkVnx3tShvYVkmYmH/vfoYLo48/
	 6jTbkXFLFKINg==
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b7cadd676so9005e9.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 11:47:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVvsG8bb1vXaH/djWAH4vzGREdzFGbDCq1swTZJQV1mDtx8BJ82ElBuh3ujLHiIL8l5C/1Nv/fxYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFApakbJyX8azvsqeH5QuFKYNy9Avv5Z0endBgz8SdC6ZvnGt
	/A/M/T8xV2IxexgYhSlnn8sDDvyOrwopijHxWdCQ2zFrJjCvC9xZdOR2kIX7ibDrw0z5rOl73+s
	xkd6wv+ycgUTBnqdtGsD81FTVqfoOXJ7DFMgzIXM2
X-Google-Smtp-Source: AGHT+IG5VqIPsa1pNgB3YpFXWfQW+7in5f1Vpw/ePfgPKB7etQPfYgqx6A7wIUSMvQ3seox/XRRqlLcg0U88oq9rT90=
X-Received: by 2002:a05:600c:4ba3:b0:45a:207a:eb7c with SMTP id
 5b1f17b1804b1-45b84a46376mr105495e9.0.1756493248442; Fri, 29 Aug 2025
 11:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-30-pasha.tatashin@soleen.com> <20250826162019.GD2130239@nvidia.com>
 <aLABxkpPcbxyv6m_@kernel.org>
In-Reply-To: <aLABxkpPcbxyv6m_@kernel.org>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 29 Aug 2025 11:47:17 -0700
X-Gmail-Original-Message-ID: <CAF8kJuN+CsXo2QwrMvcSkn=_WB+zqikgLK9=ydqUDj+8Osmf6Q@mail.gmail.com>
X-Gm-Features: Ac12FXylXHzcyalG6rdr2bLhlKKgB6oI5FD3MKZgay4nA6t-yrJgNr96GL2gOCI
Message-ID: <CAF8kJuN+CsXo2QwrMvcSkn=_WB+zqikgLK9=ydqUDj+8Osmf6Q@mail.gmail.com>
Subject: Re: [PATCH v3 29/30] luo: allow preserving memfd
To: Mike Rapoport <rppt@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, pratyush@kernel.org, 
	jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 12:14=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Tue, Aug 26, 2025 at 01:20:19PM -0300, Jason Gunthorpe wrote:
> > On Thu, Aug 07, 2025 at 01:44:35AM +0000, Pasha Tatashin wrote:
> >
> > > +   err =3D fdt_property_placeholder(fdt, "folios", preserved_size,
> > > +                                  (void **)&preserved_folios);
> > > +   if (err) {
> > > +           pr_err("Failed to reserve folios property in FDT: %s\n",
> > > +                  fdt_strerror(err));
> > > +           err =3D -ENOMEM;
> > > +           goto err_free_fdt;
> > > +   }
> >
> > Yuk.
> >
> > This really wants some luo helper
> >
> > 'luo alloc array'
> > 'luo restore array'
> > 'luo free array'
> >
> > Which would get a linearized list of pages in the vmap to hold the
> > array and then allocate some structure to record the page list and
> > return back the u64 of the phys_addr of the top of the structure to
> > store in whatever.
> >
> > Getting fdt to allocate the array inside the fds is just not going to
> > work for anything of size.
>
> I agree that we need a side-car structure for preserving large (potential=
ly
> sparse) arrays, but I think it should be a part of KHO rather than LUO.

I agree this can be used by components outside of LUO as well. Ideally
as some helper library so every component can use it. I don't have a
strong opinion on KHO or the stand alone library. I am fine with both.

Chris
