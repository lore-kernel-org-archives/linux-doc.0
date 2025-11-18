Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7C535BDBF
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482319; cv=none; b=q/lRKs0MYGrTMVNkm974iPq71F34pSgBO+e2Z8Sd2DXrfrqgrCmTLF056zRsw/6ia2JL5HsI22jjWtMAK3iGSYolNSj4OvCZDFYZjj12HzTFpO8uO5Iw/AM5jyPft5SeeiJwFCOTIWR9HpY3ldHcpAmcKqEP+N+YhhsiWm+v5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482319; c=relaxed/simple;
	bh=yIeOJnxlLJq6unMitN9z5K1Cj1/iT1QGU36BvuUqR8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WL4YHGyaUptUalr6WXKLRdWN1uVtGcX0sDz0Pqpm4h5uMVkWY1dHFv2FAY7OpiRi1UWOrmJCPx6tIdPSCd/28XpRftUTniwWvT0SLOFptFlSs5CvMLNAxK4cxD84fuRA6VNFtlRVah7NXOBXos8L39LOXoedXCWrcfF0+tSd+1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=KOdcwp7I; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="KOdcwp7I"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b735b7326e5so830117666b.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763482315; x=1764087115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIeOJnxlLJq6unMitN9z5K1Cj1/iT1QGU36BvuUqR8U=;
        b=KOdcwp7IMctgUjZh9O5fjXmN5/CKP84lUjqfeptvOcA2f/5Kwl32P7WUrtdPfg3b9r
         NTLx0ScOp3NKqtM16WiQuuhIL5VOGxR0tkiJST6/ljn06NZEnwRYqEdNByPLLo5UbN5s
         EdvlGTRykIQl+I5eYAFLcqK46Yx+Mu3atYuTE1rKKkBQJeLRYGoi2onDC7G9F+AiF4kC
         myrViq16IKwX3iQHJz6V+EihHv/OtfA1E9eDLGmVIspB4rLBovj9++3pB9FkwdflYqxS
         +VbvwuXYhZmuzPcEqXq705twcN1r1LS3EpnyhEph5i9DDalvMGccxdwUag8LJYewkbjF
         k7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482315; x=1764087115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIeOJnxlLJq6unMitN9z5K1Cj1/iT1QGU36BvuUqR8U=;
        b=IfvVLjq/L4Y3Y5WHpQr2Y8Rzt/GRfxrzVIOo5u342hv7sxysrD/JW8MEpJL2431NUW
         gL9/GIeQpdgz5cv9Az0gQt7Fqvegi8q/02D0fzNywXj7S/+UFuFSAuAttvyJyC0nep2W
         6KWLxpxGxepKQmU3Q/zlQzg3knc1ohdi7IFhOMeljh+lThkadk5TYLbBvkUWxfiJehzb
         3voHvEiQLGhjql8v1zmpq1WS+qU+QWA2u3avpbgI+Igl2R7H8qVjRT4Qhh5GvwKitmhQ
         iBeY6jWFAGqmT0/VLDtF1aKYxbP/PKMa3FN+n1jLTo2uTavdJAEMsYYZUQ2fXSTH4zn/
         iCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFcOCuHaEvu/8CF7dhsgmQmUm9vAFP9zLs3Szj+l9v9yBc09LhVy+5F4InQOPg7QGcyAsyNy1jOHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4+fCUagnm/QbBykro9QhvOmbaTz6bS2KymkbGkmdymjk00xwQ
	UAewFm0RpVbKwyXLx54AEMCFTARAoc/h6iTZj9i9FMgWQUPgAStiTGwO83OW7Qx66ohDRvb2Zls
	cKk+twKBQAg1KfH0SzxY963WA1fFCM/E7LrbyRIGfsA==
X-Gm-Gg: ASbGncuPbXvlAA5Ku4mbaVYbwX1aBvnmerXQXGP/QI76V9kNEHGLo1j+hN4Tc0zw/Oh
	irXA9cy/JF7z61icHYNa06vmtrp4Lp9aIr+ue+IAFI1hk9AQknIF6beGuPGDY7gqsy0RM3HwARv
	J2UU5aD8si+YvNIVkuN2ZxFovnLMsFK2Ri09l2YsEf2HqzHyC+DPWCB9bRyOG3t+xNCV7yV/AxZ
	uzQHxUy6272+fayu46cPSy/WVIDP6g2+bIvN9KxoVRgebDMMAc5jAYt5zIocqTds47s
X-Google-Smtp-Source: AGHT+IFHXvld5bm2qlzNd0Y2ybfozdwR8s6ttYI14x44odTpSeo2AgXFTy6L97nlTwnrr84Th1Itshlxng9A7gKWAlE=
X-Received: by 2002:a17:907:7e8d:b0:b73:1b97:5ddd with SMTP id
 a640c23a62f3a-b7634736285mr4050866b.8.1763482315319; Tue, 18 Nov 2025
 08:11:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-2-pasha.tatashin@soleen.com> <mafs0ecpv4a4q.fsf@kernel.org>
In-Reply-To: <mafs0ecpv4a4q.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 18 Nov 2025 11:11:18 -0500
X-Gm-Features: AWmQ_bnCG4YfqGfoAbQTxY2D5ZCM-y47-VoI150hvneRrqrf0ng4Jg42xOKdVlg
Message-ID: <CA+CK2bDfxMhNQKjZD1uRSrg+wJYcFamji_oBvGBn+bnsb4Bbog@mail.gmail.com>
Subject: Re: [PATCH v6 01/20] liveupdate: luo_core: luo_ioctl: Live Update Orchestrator
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 10:46=E2=80=AFAM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>
> On Sat, Nov 15 2025, Pasha Tatashin wrote:
>
> > Introduce LUO, a mechanism intended to facilitate kernel updates while
> > keeping designated devices operational across the transition (e.g., via
> > kexec). The primary use case is updating hypervisors with minimal
> > disruption to running virtual machines. For userspace side of hyperviso=
r
> > update we have copyless migration. LUO is for updating the kernel.
> >
> > This initial patch lays the groundwork for the LUO subsystem.
> >
> > Further functionality, including the implementation of state transition
> > logic, integration with KHO, and hooks for subsystems and file
> > descriptors, will be added in subsequent patches.
> >
> > Create a character device at /dev/liveupdate.
> >
> > A new uAPI header, <uapi/linux/liveupdate.h>, will define the necessary
> > structures. The magic number for IOCTL is registered in
> > Documentation/userspace-api/ioctl/ioctl-number.rst.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> [...]
> > diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.=
c
> > new file mode 100644
> > index 000000000000..0e1ab19fa1cd
> > --- /dev/null
> > +++ b/kernel/liveupdate/luo_core.c
> > @@ -0,0 +1,86 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Copyright (c) 2025, Google LLC.
> > + * Pasha Tatashin <pasha.tatashin@soleen.com>
> > + */
> > +
> > +/**
> > + * DOC: Live Update Orchestrator (LUO)
> > + *
> > + * Live Update is a specialized, kexec-based reboot process that allow=
s a
> > + * running kernel to be updated from one version to another while pres=
erving
> > + * the state of selected resources and keeping designated hardware dev=
ices
> > + * operational. For these devices, DMA activity may continue throughou=
t the
> > + * kernel transition.
> > + *
> > + * While the primary use case driving this work is supporting live upd=
ates of
> > + * the Linux kernel when it is used as a hypervisor in cloud environme=
nts, the
> > + * LUO framework itself is designed to be workload-agnostic. Much like=
 Kernel
> > + * Live Patching, which applies security fixes regardless of the workl=
oad,
> > + * Live Update facilitates a full kernel version upgrade for any type =
of system.
>
> Nit: I think live update is very different from live patching. It has
> very different limitations and advantages. In fact, I view live patching
> and live update on two opposite ends of the "applying security patches"
> spectrum. I think this line is going to mislead or confuse people.
>
> I think it would better to either spend more lines explaining the
> difference between the two, or just drop it from here.

I removed mentioning live-patching.

>
> > + *
> > + * For example, a non-hypervisor system running an in-memory cache lik=
e
> > + * memcached with many gigabytes of data can use LUO. The userspace se=
rvice
> > + * can place its cache into a memfd, have its state preserved by LUO, =
and
> > + * restore it immediately after the kernel kexec.
> > + *
> > + * Whether the system is running virtual machines, containers, a
> > + * high-performance database, or networking services, LUO's primary go=
al is to
> > + * enable a full kernel update by preserving critical userspace state =
and
> > + * keeping essential devices operational.
> > + *
> > + * The core of LUO is a mechanism that tracks the progress of a live u=
pdate,
> > + * along with a callback API that allows other kernel subsystems to pa=
rticipate
> > + * in the process. Example subsystems that can hook into LUO include: =
kvm,
> > + * iommu, interrupts, vfio, participating filesystems, and memory mana=
gement.
> > + *
> > + * LUO uses Kexec Handover to transfer memory state from the current k=
ernel to
> > + * the next kernel. For more details see
> > + * Documentation/core-api/kho/concepts.rst.
> > + */
> > +
> [...]
> > diff --git a/kernel/liveupdate/luo_ioctl.c b/kernel/liveupdate/luo_ioct=
l.c
> > new file mode 100644
> > index 000000000000..44d365185f7c
> > --- /dev/null
> > +++ b/kernel/liveupdate/luo_ioctl.c
> [...]
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Pasha Tatashin");
> > +MODULE_DESCRIPTION("Live Update Orchestrator");
> > +MODULE_VERSION("0.1");
>
> Nit: do we really need the module version? I don't think LUO can even be
> used as a module. What does this number mean then?

Removed the above and also removed liveupdate_exit(). Also changed:
module_init(liveupdate_ioctl_init); to late_initcall(liveupdate_ioctl_init)=
;

> Other than these two nitpicks,
>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Thank you!

Pasha
