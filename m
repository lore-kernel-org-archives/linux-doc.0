Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5702D5920
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 20:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762980093; cv=none; b=B/Q/xjVUAFDcaxLcWhcBd4m2lpfyDry82Y/pdJzXI/DP/fMkubb8EZaE4DVELrd4foas9/MMDaeLk4UYn0z8+TeJ1+aoM7dtDMWCjLHReDdoaRKCHIGYhAhni942gd/ra42IPUYWiFuEHzU5i2RAAUe2R7zKhyKJ1WV4bAeXSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762980093; c=relaxed/simple;
	bh=zM4D/2QGSpTpyQNyqeW+YoTyGqfn0xHUyC7FfAc2/YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVyhfpbxVEGo9QLnFpAuAYckER5dsqcSc5TXHz4Ao0DEGJFVfH1OcZO/z+bXIMf2IW5EmjE44Vs4qCcvCIAbbkHJNFtLpEin/rprTYyeXdwX1KQeLI8O48vXhAR2dC4cEorQQo0mWnnRyZZcx3F1kQT0+HKJGSofYsJN92Dgp7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DMVQbG/g; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DMVQbG/g"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso269477a12.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 12:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762980090; x=1763584890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhyXtoYIzmR1qHGhz6TVmqBXuiqas52bqmxrLwkY3s0=;
        b=DMVQbG/gd5oI5/dpbDk9nsCzwzUQ6CrCixF1dKx7BI3nzrKsKlou8SfhttpSHGU8dh
         vh+BrYUl4Y6Ts3Dl08lbK0yzMf/DxDvehzoLqKgUK4v1mgmclh6mAfIbTdfSIdHwhrZG
         dQVYB5UbFk0OPI5pNm7fu0uI/mrWlZ351XAp0ErjaCaH8BGG7LgwykeqXm4wpRwD+QpU
         ibIUpd8s68gZvKxLCdXOxiGCsTtxpeRCDyZtyh8Rf0FjtbWWWd0HxtqgiMdx2GK1EldX
         uc8mrqNaXqKrE9kF53jswoo7YtCle+XI4bKuvth21Wli89xJsNAcQmpwam3QG/P3w14I
         7LVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762980090; x=1763584890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhyXtoYIzmR1qHGhz6TVmqBXuiqas52bqmxrLwkY3s0=;
        b=nMGM7hq8moRN1sLWJ8cU15YRWe7sqHDp7NedKbqiJ0uuNvfbjtA3Zn8FbrdlLQuXHV
         dc39lYTZJYD28pnFNTYrtwX45uMuqO4kZiFM37V7tGYBMnLcKNW7TShv6BjMhuGfAEM7
         NIgh+t+KceVY26pDvQcEYChL7U7O+YIweKuYeYu0x+SzYo4soE51sQx2SGm4amLXPomK
         DVSXTFoIInSwl8EkP1QDQIIAaOZLmm/gIV4mRAoJpVDey7n8kely5/pUuMWV3m0rcO5W
         Ps2IcFMCiNiNErl/hAFvNtt6ubylI6y899wJRtrgcXeD2fIn1t8s2A6NV3CB4CFms5gj
         vWCA==
X-Forwarded-Encrypted: i=1; AJvYcCVSV5PuBSE+CsZYkv0mFS1uv7ZR7hQ8ZEczxGcxCUyDA5SGYIOaMLSjQOfLAtLmXlTGzJXPITle8/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPV01Mb8ruvc33KX2mGAzEYo9p1YjsRSA029wO8dkibjrM6zX
	SVG/PdFfR1tSUF2yqv6jAeUvJFySwQya47xopYtKdwxRjRbzslAM+xjv/KeLiO2UV38i8vYJP4w
	NXx2DR4NqI6KS+PIGonhQwS1URASSIPxsFe/NByE/Pw==
X-Gm-Gg: ASbGncvwTzsEVXTKHy6LAmAFy6ggm8A6T2v7dy2Wa5XS+XtNrQxjAHRmH2h/49RjcGS
	Ug6VeUlNPFIE6y3ieoqF2ztacuKPvWXsHHglEGuJuoQHumJFG1HhfKBZzYmUyT8U52SS7FAPijM
	wW73HdCXYRq/aDAOLOc5LeaudEkalcup7aA8SJfdG57RLOHO8gehSMVfxzzQbO8ugIXSxRLEgNF
	Edzvi/Vx86ah+Topgq8arpWEGcA+1YLtPP8faktGkhlYEL5GyFJ21Hrkw==
X-Google-Smtp-Source: AGHT+IHqo0cWs4d/0+ME7Pp4LbR8c7We/VnufInTVc25I/poQ6OzmFZFO8BkwH4hrLb9dn8NI1Qgpj2DiapmSAwzhV0=
X-Received: by 2002:aa7:c9c4:0:b0:640:e7bc:d3ce with SMTP id
 4fb4d7f45d1cf-64334cf0fa3mr536431a12.11.1762980090000; Wed, 12 Nov 2025
 12:41:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
 <20251107210526.257742-23-pasha.tatashin@soleen.com> <aRTs3ZouoL1CGHst@kernel.org>
In-Reply-To: <aRTs3ZouoL1CGHst@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 12 Nov 2025 15:40:53 -0500
X-Gm-Features: AWmQ_bn7hzYlz1CnwhflDe9tj18uCKgXHbii3rFfCz-B6efDQe-vtqY1VtpWQlg
Message-ID: <CA+CK2bBVRHwBu6a77gkvsbmWkQFDcTvNo+5aOT586mie13zqqA@mail.gmail.com>
Subject: Re: [PATCH v5 22/22] tests/liveupdate: Add in-kernel liveupdate test
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
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 3:24=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Fri, Nov 07, 2025 at 04:03:20PM -0500, Pasha Tatashin wrote:
> > Introduce an in-kernel test module to validate the core logic of the
> > Live Update Orchestrator's File-Lifecycle-Bound feature. This
> > provides a low-level, controlled environment to test FLB registration
> > and callback invocation without requiring userspace interaction or
> > actual kexec reboots.
> >
> > The test is enabled by the CONFIG_LIVEUPDATE_TEST Kconfig option.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  kernel/liveupdate/luo_file.c     |   2 +
> >  kernel/liveupdate/luo_internal.h |   8 ++
> >  lib/Kconfig.debug                |  23 ++++++
> >  lib/tests/Makefile               |   1 +
> >  lib/tests/liveupdate.c           | 130 +++++++++++++++++++++++++++++++
> >  5 files changed, 164 insertions(+)
> >  create mode 100644 lib/tests/liveupdate.c
> >
> > diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.=
c
> > index 713069b96278..4c0a75918f3d 100644
> > --- a/kernel/liveupdate/luo_file.c
> > +++ b/kernel/liveupdate/luo_file.c
> > @@ -829,6 +829,8 @@ int liveupdate_register_file_handler(struct liveupd=
ate_file_handler *fh)
> >       INIT_LIST_HEAD(&fh->flb_list);
> >       list_add_tail(&fh->list, &luo_file_handler_list);
> >
> > +     liveupdate_test_register(fh);
> > +
>
> Do it mean that every flb user will be added here?

No, FLB users will use:

liveupdate_register_flb() from various subsystems. This
liveupdate_test_register() is only to allow kernel test to register
test-FLBs to every single file-handler for in-kernel testing purpose
only.

Pasha
