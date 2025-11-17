Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C8307481
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405069; cv=none; b=GrnjfgrvpbPFLF7qQ1S181jdlnhlYEU1WWsPYbYYNDUeH2/iFWAAtoU40jl7xC6iA9l77twqNqR32zNFKDVAgdoShfmqaw7x/8ZPYKfNbexuM0hplU6OI9GqTlsmii+R5SAvExHfpiS9EQP5VZdFOIgJgdG4iXEGAkjjGvtt0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405069; c=relaxed/simple;
	bh=jMrH/ZmNqpYeJLFgobm11jMJ7I0km6rEckJ6Z9B2Uqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFBLW5uty9zz7fCOe+lvJoVfs6Djy706HwHFYRUu7P0wVLerBviZhaQYtpA/EDDL/kMrz31B16mHJP6OMhoGu9GNp8aFvVcwUji1pze8Hx5kuwfLyrsKiXot8PzkCp5Bc6+fa16yk81vL5XifOzMoUvM9a/kODAM6vTI07NMKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=U1wXuAMv; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="U1wXuAMv"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso7928719a12.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 10:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763405066; x=1764009866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMrH/ZmNqpYeJLFgobm11jMJ7I0km6rEckJ6Z9B2Uqg=;
        b=U1wXuAMvZU7H0GNii+4j0rqaGkT1q8fPJ2VYzWzk5BBRfi3AZb+E75Hh+E3Y7ceJt/
         VWYw53hkjadxriHVmIMTZXBsuOHjieT6j8+rECYPtom1WXUeReurtU+002gtohdNlwbd
         eagID9PSa/ZpAlLJ7QVTUIw+VypfLC4Qwu1yIFv5uJPxi5l9wIzHKDzl3uvVKgzcbwT+
         HW4AQYTBtXFoD6XrXlC/dfzGrc+hjtrOplon40hxVux7N4sE9BXPuMQa2mN8Hb9fSwR+
         qRIF5F3VKifEy3y5SCRyekc7ggqn+lA23DuDEHZ4+XB/YtE/KHeeWh0/O0kDSCVLgSUq
         FIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405066; x=1764009866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jMrH/ZmNqpYeJLFgobm11jMJ7I0km6rEckJ6Z9B2Uqg=;
        b=vtEHwbADdIUdVfbPyxcss84L03rYdwS+3u6vtpALEloOp7inO6yyDMjj6U0nLE1dLt
         s66Cm+xL63aT70jVjibCUPou9LCeiOM9v5yhAmMtAuof1ZRmdd9ZPUm2xmV5JnwLoHiq
         DNsgRt2v09DkZHKRSE9cu2JjSKVm0Bgr+BARIvZbwNfeSRxqrV3s4+VexgC6lZmJO1Sv
         GrC+CwwEyl+MoX4XJstJy1nPVHQuXpHgqOqaRtDpevvSnOWHqPMhlOUFavbDAFBHBwgR
         gwnuLXgmi5KCPRT7qChTLMNuAveaGwMTo+dJ4Q/6cw5F7hFaheXAOXELRE4s4zxxgjqE
         W4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHiv6JpqIZSfzLkJIvfk3Oxgt88aqjv/MpaHavdwVWpDBxHZcWqeiaNjok3OtF6w+7AInO0aRz5kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOru4slQ9iaUtr03WhNTAET51Up3wangk2I/P+eQIvwBXMm2nw
	rTN4xpcSLr/S3XJHhr6mplOksNlSSfrhpE+cL3F+SgSae7Or7AEijHkujuVpAArLFA0fqDBLAgc
	am4V6nJVnMBIRb6j8N0Df8Al3PyvpHRJzG5vjcrH5ug==
X-Gm-Gg: ASbGnctUNCm66fNSqqLz5OIc+IwZOciuKmkT4ekVA3c0mxYiw5Gtwbx/5dA1mvBBvMc
	UmKWqOWkIv+942p3LQPcgMTRPR2NFkiArBGfGrad0ZF8rjRwPCieBi0PvkhFPdUMQrxP9c7/YfT
	REmPeIho12reDmA/f3QGCKDL7aTTaNv+HKMQYSMyRu05JYskeL0l4hqCEJgvFS3Bv3Ul2FhYq1X
	LEDFWt0+ZL2UqwTvyH+swT8s/CVqwXHt7aB2lRxxaseCjRu+uZE2Bmo+ZV0bQ+wSMYoVUw8PEmT
	sGw=
X-Google-Smtp-Source: AGHT+IGuvNw77dXDtTPV0AYardMXM6grq7vkCAHZp53MffW9vtH9Ev6zRMSce2XWGa9IMF6cKfb7xBeYsNCCNwLKBNY=
X-Received: by 2002:a05:6402:5213:b0:641:72a8:c91c with SMTP id
 4fb4d7f45d1cf-64350e9b333mr11717643a12.27.1763405065655; Mon, 17 Nov 2025
 10:44:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-14-pasha.tatashin@soleen.com> <aRr1aw45EYSFTCw9@kernel.org>
In-Reply-To: <aRr1aw45EYSFTCw9@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 13:43:47 -0500
X-Gm-Features: AWmQ_bny7bEklZsVXOjnwEc2I8Kpi65plOcoXCf1e7YrheuK91-BqnEf_WUIt4k
Message-ID: <CA+CK2bDpLfxLZMwNZLmg+K+uU4YaUefJx+xfD+kQchKpkHping@mail.gmail.com>
Subject: Re: [PATCH v6 13/20] mm: shmem: export some functions to internal.h
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
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
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
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 5:14=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Sat, Nov 15, 2025 at 06:33:59PM -0500, Pasha Tatashin wrote:
> > From: Pratyush Yadav <ptyadav@amazon.de>
> >
> > shmem_inode_acct_blocks(), shmem_recalc_inode(), and
> > shmem_add_to_page_cache() are used by shmem_alloc_and_add_folio(). This
> > functionality will also be used in the future by Live Update
> > Orchestrator (LUO) to recreate memfd files after a live update.
>
> I'd rephrase this a bit to say that it will be used by memfd integration
> into LUO to emphasize this stays inside mm.

Done

>
> Other than that


>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thank you.
