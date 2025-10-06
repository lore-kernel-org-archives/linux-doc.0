Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEE4846F
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773814; cv=none; b=qfE2XGZxpavfnTyge4EMA8wcpBRuDuNo5DMwTRQbb38n89Y/oLj34ycpTgnFilLKgP5WbInw2h6IEDvshL8qprf2V7jZ5S7nIpefX9JUozuQMUFc3LAVyjGVWuAumgLFm99TVlj9QDCWq4dfqiLZFmZTOn1ZqjjN945FnmLnk90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773814; c=relaxed/simple;
	bh=nnhISHTj1ZDAWXUArq33P4LkzFAO/KPeWhlsHhQTxlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8Y3Dgb5X2HZxAfPEVM0/VeQgzJH6nI4gDbKYL9v0Fsj8cDSi+2CljTQdGZ3dB/jbw63FXdjqWgLJMYd64Wy7/zq+T1iBr1s7meD8RoUb8fJpPpejvW23RvZ2XwWAOSCHFHNscEWarYgqpotPU1zYDgvSshvZVe60gKYHQlwiC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=W7a5VY6q; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="W7a5VY6q"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4de584653cfso82774181cf.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Oct 2025 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759773810; x=1760378610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvwmvZY5I363zl2hxXSo3p16V2l855H51CmL0I5zxCc=;
        b=W7a5VY6qoAqljL4CU8l1hlSOlRK9RJJjYHlJjVmnrYHkvvtuswCCrv3bCnqOFGSnb1
         Q53ie3k4VeSmeefGBFmkgcX58NJTJkyTLDHyFlYV5mFWM3fsLZzN3arHU8f0wNAhjvf4
         Io22Ukx7zEotqYP73n2Qdj/u4FPQgE+Co8OKdNzlZSNE87eAYS3QN5t4YPonfENfLFpP
         QD3BcvR8zbWllOAtPjjzuFrPGtaG1sOA2hfIC6aFqnjmzs4fxtcjK6j5SuObhtyYd36b
         idhr9wnUvlsRGJV2CDlOw29CfwcgaWxOG8pEheKX/KjZ3Pgts/H7zyjeeGf2sSaAHhYU
         Hv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773810; x=1760378610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvwmvZY5I363zl2hxXSo3p16V2l855H51CmL0I5zxCc=;
        b=MkZZ6EylPHCi6qB2oJ5ahTJIsH1x0TbR2Jw1/ej6N+7Z9NeA8JXglOwn2Ujqc5K3y4
         kgL9a2piIs+MfnOo0mubmb05bc2mlkXwEwAilUhvqWGO2QfWZttkVMc3LbWZbmL6G1LG
         CnqR0eJURRl3kvD4K3DHT+4wNbyKziCJetvbdSlEBsps/ccUZEJtYkWcR+17mrIKUtlM
         XUv7nqBIEy7kqi80AExI8OLeCdtkloT95IZMuQzYWD6NW3/gePZDVOKqRV7v9ygwkG9F
         jAW2FcfBHOlPsg2m2Vhp/ls/GzKOmqgZ4QV26qgorqwCQxHsw79FsGH545wqI3SvzX+P
         Dz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXeK2dJ2HJu9ANWC6vgbgSBRrjF/Jh3k3DjtG2u6amf3+Ru95ccO5cPDAeTS/Lm1cLV8Sr8DPgBhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjgpYE5IR0ckqZsxeE2gG5s4RknzilOTiU2j0bLRXTmMFHlP2R
	83K6grP13FziadHrKAa5YVPJaqkeEkBz6iGJKOocPM955qzhYcutpPcFzKjkPYVzxbf4hOwluDo
	/5XlwHwj8awsDwvYrDjmOSzAlChL2j9Fw80EaLJUzaw==
X-Gm-Gg: ASbGncv7geTc+mk5OlYkTOAH/R3QmyRZIErcauSv/tQuWRZ86HrWP51vceFrUjjHIB5
	ucBHWL1RuDFo6tQQfV265F9tqNuCPonJvulWq4FwEBj6+F9xiw22OZCTl09vPsTf7Pm5cxB18FF
	ZmAVcF7mrtRJAbY9/X+5wPdeOriEwsSIY5JbW4DodOsysJ33BMOwLVFiZYXhArq7WvHXcWWDZf8
	AO/UgwHSx1KPPIBxtpbtECsHHV2JL2gAGVQX6o=
X-Google-Smtp-Source: AGHT+IEVZfCkL4v+Tnkl5nUWA3GDanDfXIyCKp31DpQy1v3t8oAJmzi9nP3PButZfFc5VJpBDaeo1ldCgKUCHIfwIPE=
X-Received: by 2002:a05:622a:1a87:b0:4df:1196:f570 with SMTP id
 d75a77b69052e-4e576b09389mr190614081cf.53.1759773810132; Mon, 06 Oct 2025
 11:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-3-pasha.tatashin@soleen.com> <mafs07bx8ouva.fsf@kernel.org>
In-Reply-To: <mafs07bx8ouva.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 6 Oct 2025 14:02:53 -0400
X-Gm-Features: AS18NWCL5ohjgHwfiII61tAev4bzSNa8Vs80Sb--F-ZT325ugyMZfqAlQjXZbCY
Message-ID: <CA+CK2bCN-__524n+2wti+m8K6JntCudsR1--cFH6cW9CTXnmiA@mail.gmail.com>
Subject: Re: [PATCH v4 02/30] kho: make debugfs interface optional
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
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
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org, 
	steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 12:31=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Mon, Sep 29 2025, Pasha Tatashin wrote:
>
> > Currently, KHO is controlled via debugfs interface, but once LUO is
> > introduced, it can control KHO, and the debug interface becomes
> > optional.
> >
> > Add a separate config CONFIG_KEXEC_HANDOVER_DEBUG that enables
> > the debugfs interface, and allows to inspect the tree.
> >
> > Move all debugfs related code to a new file to keep the .c files
> > clear of ifdefs.
> >
> > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  MAINTAINERS                      |   3 +-
> >  kernel/Kconfig.kexec             |  10 ++
> >  kernel/Makefile                  |   1 +
> >  kernel/kexec_handover.c          | 255 +++++--------------------------
> >  kernel/kexec_handover_debug.c    | 218 ++++++++++++++++++++++++++
> >  kernel/kexec_handover_internal.h |  44 ++++++
> >  6 files changed, 311 insertions(+), 220 deletions(-)
> >  create mode 100644 kernel/kexec_handover_debug.c
> >  create mode 100644 kernel/kexec_handover_internal.h
> >
> [...]
> > --- a/kernel/Kconfig.kexec
> > +++ b/kernel/Kconfig.kexec
> > @@ -109,6 +109,16 @@ config KEXEC_HANDOVER
> >         to keep data or state alive across the kexec. For this to work,
> >         both source and target kernels need to have this option enabled=
.
> >
> > +config KEXEC_HANDOVER_DEBUG
>
> Nit: can we call it KEXEC_HANDOVER_DEBUGFS instead? I think we would
> like to add a KEXEC_HANDOVER_DEBUG at some point to control debug
> asserts for KHO, and the naming would get confusing. And renaming config
> symbols is kind of a pain.

Done.

>
> > +     bool "kexec handover debug interface"
> > +     depends on KEXEC_HANDOVER
> > +     depends on DEBUG_FS
> > +     help
> > +       Allow to control kexec handover device tree via debugfs
> > +       interface, i.e. finalize the state or aborting the finalization=
.
> > +       Also, enables inspecting the KHO fdt trees with the debugfs bin=
ary
> > +       blobs.
> > +
> [...]
>
> --
> Regards,
> Pratyush Yadav
