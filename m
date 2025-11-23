Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C815ECD7
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763924884; cv=none; b=SDPTNfp8yZ9cKA9arrvPTkz8q0b9gLGc90kcBWBwvzGdA9H9Jmlm/osHhboYhW1LP2SD1dAgO/OoiZzhdlI9Vy/eks09mS56QgiMcdy6yFQl1o/5Uw8oRDFRtJB60z24utIAu46LQQfvAmuELRPp76xiC1DKZEy/PjNnFeIpY7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763924884; c=relaxed/simple;
	bh=u1iySgEodnMhA8OEPFf3HwhjyXEF3ojGGdKR+IVaEQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csTa1i0Rm/bpypZ2DAnfCQhr0jHGn3Ai+PN5LDEyJ2jlq1QIUft5ISWWnzjQYwivoqGrwwXhAcIdHcrZ0awKkcofO6ZWat5GrSGg/b/+YSMZ4g8sY5y6JL4Yf4ay4NGm0f9gVmZcUixkt9QipnZ8i471b1FheIz8/jVWUVKnsAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=SvDIeMPe; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SvDIeMPe"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so5876446a12.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763924880; x=1764529680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9klKgJBevyIJ9UZxwySgKudasKfMx5MCjdCZws9FhVo=;
        b=SvDIeMPeQGzyMVjseul3WdIer2+I99GLKw4hqo/TQr+Vyct43RFUOQi+RcfMKMI/Y0
         VbqsTax6R5/IBmjd3SSFWiQ/0WmKnpJzJKgF53c/qxZBpFepYfUr0BRcops2C3HWG7Mo
         kfIfQyME/9EJHZV0rdQRgp1tW61q3H+XJCm9WvARdcr+rz5CjYDiLt4VYfHUxh15twqB
         cJlT/NVpulORdFV/APNN6PCgmvPj2U37YGJbefLb3ZIigEl0D+ykf7D+XG/5hFev/ha3
         TRU9mowxITD+kJ68e75b50IUzbSnPuCFfme7jZdDAAOQoOyH5xFu+lsbWUUqkMgvEHhq
         FgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763924880; x=1764529680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9klKgJBevyIJ9UZxwySgKudasKfMx5MCjdCZws9FhVo=;
        b=GGBK+08GT5Ec5M/cjRIlainJ6BdB/vTN8zyuqN56VfGP3sAOikHKejO0cxB9XFZMYJ
         d7s0We2rFn+g2h7xGysBVM9ZTa3qLIOWzL5AGn258ncT1MTJNsEpBHGbRrGaekS5kYc0
         gaU/Lz5L7afRVeSxmp7Pb4WdcZIBpg9D2GVpH77TuZv13gwBGNZh4ccECXKJAQ1763TL
         WVzIxtx7b0Mdi4m1JaLsdERY3NnX7OA7Uidar6BcvNtfskwvooVM0/ylwk3mm0+Luy3f
         oRwMScxcT1f5A0MWqdJ91jT7XRlTbbgRpFTTg+4kG/VwRa0TnZ4dCeP2bwEp+OlaDoEA
         D4Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXRT+VHLPSEZJ66EU3zEAzownKv8FTkkA0xIjVLZdKCuBBfuSLk0NLtsn3PT8X/iwDF9ZbCogR8WS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMpUxaZOYxG/CRZxbqNQgzdrv47Q8oiYYWqPkklcxXLe60JfG8
	UC6JUHDDgX83dHExcf6yecQHw2gpMl5986vnop0kJ2HlNJKQ79zZBohC0JBU0KkK2NKFl0KpziA
	1+sxJ7f2uIcchs8KbN+BAKnmJSDoZ+sEY980u4cAyUw==
X-Gm-Gg: ASbGncuBISOYOtMavg/gU7UpUY1THAtEo02sfeqWoyaSVPdD+WWOpbURmuvCbjmWIQ/
	0OYVE9WI6R77dFy6PjhEXOLJik6LTTQ+v/+aCBvq0tCA6yxlXVwQYDcdWKQ8kSPibMWSZRDKAf+
	RtxhTnByER+ppmSHs1rUXzJr7ynZe7f/RbuP4keEIVsn4XJAboMZNK9Y6CxIkActNRfsbzBdM3l
	A1BINfsqi0i4gRJ2fkgqdDdluYp+M2k81adc6uNtUBz69sPMkvG1NLmDohS9Vhugjb4
X-Google-Smtp-Source: AGHT+IFOPKZqtlSeAujqMHhI3nlxfVlasLRItw5Gn5lA8EUX2qTjBZTvohylQJZ+Rg9P0N2YJ5gu38vULtGu6oqEXEk=
X-Received: by 2002:a05:6402:27d0:b0:640:ea4b:6a87 with SMTP id
 4fb4d7f45d1cf-645546a47bfmr9166511a12.30.1763924879937; Sun, 23 Nov 2025
 11:07:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
 <20251122222351.1059049-5-pasha.tatashin@soleen.com> <aSMXM8ayzV2kx6Ws@kernel.org>
In-Reply-To: <aSMXM8ayzV2kx6Ws@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 23 Nov 2025 14:07:24 -0500
X-Gm-Features: AWmQ_bmHjB6aEBO9sova9XMvan8ygXuOf4QeVdvSaQktHxLRV6AQzJ8ITGz3YWc
Message-ID: <CA+CK2bDJhdTA_3hqqZtFS2hN59YfVYrG5S2WRNKNAJws-f9-gg@mail.gmail.com>
Subject: Re: [PATCH v7 04/22] liveupdate: luo_session: add sessions support
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

> > +     outgoing_buffer = kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
> > +     if (IS_ERR(outgoing_buffer))
> > +             return PTR_ERR(header_ser);
>
> Should be
>                 return PTR_ERR(outgoing_buffer);

Thanks, fixed!

>
> Or, preferably, just drop outgoing_buffer and use header_ser everywhere.
>
> > +     header_ser = outgoing_buffer;
> > +     header_ser_pa = virt_to_phys(header_ser);
> > +
> > +     err = fdt_begin_node(fdt_out, LUO_FDT_SESSION_NODE_NAME);
> > +     err |= fdt_property_string(fdt_out, "compatible",
> > +                                LUO_FDT_SESSION_COMPATIBLE);
> > +     err |= fdt_property(fdt_out, LUO_FDT_SESSION_HEADER, &header_ser_pa,
> > +                         sizeof(header_ser_pa));
> > +     err |= fdt_end_node(fdt_out);
> > +
> > +     if (err)
> > +             goto err_unpreserve;
> > +
> > +     luo_session_global.outgoing.header_ser = header_ser;
> > +     luo_session_global.outgoing.ser = (void *)(header_ser + 1);
> > +     luo_session_global.outgoing.active = true;
> > +
> > +     return 0;
> > +
> > +err_unpreserve:
> > +     kho_unpreserve_free(header_ser);
> > +     return err;
> > +}
>
> ...
>
> > +int luo_session_deserialize(void)
> > +{
> > +     struct luo_session_header *sh = &luo_session_global.incoming;
> > +     static bool is_deserialized;
> > +     static int err;
> > +
> > +     /* If has been deserialized, always return the same error code */
> > +     if (is_deserialized)
> > +             return err;
>
> is_deserialized and err are uninitialized here.

These are global local variables. They are automatically initialized
to zero, and it is preferred in Linux source code to not set them to
zero.

> > +
> > +     is_deserialized = true;
> > +     if (!sh->active)
> > +             return 0;
> > +
>
> ...
>
> > +/**
> > + * luo_session_quiesce - Ensure no active sessions exist and lock session lists.
> > + *
> > + * Acquires exclusive write locks on both incoming and outgoing session lists.
> > + * It then validates no sessions exist in either list.
> > + *
> > + * This mechanism is used during file handler un/registration to ensure that no
> > + * sessions are currently using the handler, and no new sessions can be created
> > + * while un/registration is in progress.
>
> It makes sense to add something like this comment from luo_file.c here as well:
>
>          * This prevents registering new handlers while sessions are active or
>          * while deserialization is in progress.

Done

>
> > + *
> > + * Return:
> > + * true  - System is quiescent (0 sessions) and locked.
> > + * false - Active sessions exist. The locks are released internally.
> > + */
>
> With those addressed:
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>
>
> --
> Sincerely yours,
> Mike.
