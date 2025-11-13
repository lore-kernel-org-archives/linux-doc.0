Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1139F23D290
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763042207; cv=none; b=hfJCjit9GBHqMQswDiyOWB/h5Lqs6v01eN5NuTC7NYycVRhlAvNqlOouML1JFjlup1090vArPXzKEOqwO5B1XJiNlntZUUYoxjOSLLp/HluCKuopY81PK61D5CkOsy5AhScqtPMmGsn96I4wCILGJ7nyEg3qX14hcnICDFU5AiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763042207; c=relaxed/simple;
	bh=AbsS8x7hw4WZr24xg0FQFBeLZr2h7y0e6Brit3vFQBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFxwVnULhPCEg8oCG9vpCV+8R/SLUEORuo0AMGnom6f3LgrNtwGaP3UomfY7MtCAVObeEX/ErI+hlpCFOXsoPqAlwtv928kz8fq2UTFynpEh1+XDbCqz6s2wIZ/Og1HJ73CtknKbd/s9jb4ll+JyJ1yn+LIISxS8nOCAmafTEeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Vm9XbdV4; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Vm9XbdV4"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so1171884a12.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763042204; x=1763647004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6qyNFyNK1thmREVHkgbpHK+c6E8B7TJCRh3ULLZ5C1c=;
        b=Vm9XbdV4vFRDL6BfXDqwCxGBL8FfpOZo7z3xnht2zwnmRJdIO+2upWlqK8SgB6+sxG
         s7RZxMD7cEOodgPsw8TyUbE44Sju8mvVAMCumqCI4t+CrPOAW8jDEp8ygkMSK9HiTk6Q
         1kCEL57VtdPR1mswzee7hDC/bSdx5tqMTL/utyvROh4UdJcN7cr1jWUI2Ki1RhEUxD77
         B5R7wOnEsFCXuj/0fHrKo3fH5QCm7yHd10PSTVEJhLMy6lEbZMyhIi5oPG2FF5IoDtiI
         SmcubaUaheILv007a5U0imDLJrTr/J205+n3pqjVUx8SmcWXz861QW0JQNqkmTEZOahp
         MLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763042204; x=1763647004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qyNFyNK1thmREVHkgbpHK+c6E8B7TJCRh3ULLZ5C1c=;
        b=FwE9iqxtazvAkUpDXALbV2CGbjwqyw/sLR4K3nBkKWjUUOa8lhRI95fYa1mzkz0rGf
         odK4gQywLZWy54/hF5CoiEKkTjvpPv30sj0/q/pLsWr+Fb76tXjlPsxfPe3hYlyZA4bg
         kzxtIDO+FitIWbx95UQDdPwKAJRR3C8nwqP0y5BMRjL4VsdLsZ4yh/E90dvyZIc+pkxh
         c+lQMUAvc7YTDl4BC8kCzWfiALczqXzO5lsqkyi9oiHejrQ52++KCMmuCAkIDsDOanEN
         WLGtYUcq762pTNsTRP7mX7QjhcWMp1CrODQ7xFiqfv3vDkxaaDG9UF7mee3b/F2AIgNK
         Sdew==
X-Forwarded-Encrypted: i=1; AJvYcCV3HXV5up2oK1a8R7wMDuT9iNXzXqQgNjJiFSAVscQtP3bgb7uEIM8dfoHex8b8w52NhXvEV4H5thk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NGw7yGWyg1HcbkheexMGSWtR9sewKX2Um9pyg0cFZxQQmDYU
	l9FfvwhdZIRBSU4d6s9m1Qqtymfx48fbVsZCsaD7ly6mE5IitqGjaXABk4yrM9qVZBMEE4cYVJc
	j8kx4l4zheE5Xy+J+q7ER40X7Hr0t39V4nRfB4oddpg==
X-Gm-Gg: ASbGnctC2QbrWXdhZ/BYvsinBKmxXrOuydI/g0FD3X90/J8SeyYGiM3QODENMHoern6
	CY7a2ivbujvw+0yiRugAnV0ovLzeXhI3UaKY7xcDXA4QSgEJqAFxgoVxxwxzWwHYKPEqgLi6vIJ
	4x2D+PSC0uXjf5c11kzbkGVV0qD7HyOtDZCKHhAbdXA9y9MhgZObsF+OLqoeqBEXBEjo7aKtoQu
	8+Pc422dq2K02NrqBSiDIfBgqLfXy6Pd0nNtHraCjmu4t7iqLJdz4nFUHDb3WDNMok6
X-Google-Smtp-Source: AGHT+IGY+tZRbaslLz2kOHg+aNV3t0hpe7oMeZfcGmL5vq41YDW/o61wTpChY/KiKQIFV5hvmww+CFYOhBuLb1d6YYI=
X-Received: by 2002:a05:6402:2106:b0:640:f481:984 with SMTP id
 4fb4d7f45d1cf-6431a395d5cmr5583802a12.2.1763042203396; Thu, 13 Nov 2025
 05:56:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
 <20251107210526.257742-2-pasha.tatashin@soleen.com> <aRXfKPfoi96B68Ef@kernel.org>
In-Reply-To: <aRXfKPfoi96B68Ef@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 13 Nov 2025 08:56:06 -0500
X-Gm-Features: AWmQ_bmd0HSccxoETOjnPXP7LM0Avf6TAjDFvEucAEYN_rSyfWXxN426kJbKdTA
Message-ID: <CA+CK2bA9DtFd5sCfWg11TGdRj9JCgevO_mrjBsBvY1ebgUD4dQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/22] liveupdate: luo_core: luo_ioctl: Live Update Orchestrator
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

> > +/**
> > + * DOC: General ioctl format
> > + *
>
> It seems it's not linked from Documentation/.../liveupdate.rst

It is linked:
Here is uAPI: https://docs.kernel.org/next/userspace-api/liveupdate.html

And also from the main Doc:
https://docs.kernel.org/next/core-api/liveupdate.html
There is a link in "Sea Also" section: Live Update uAPI

> > + * The ioctl interface follows a general format to allow for extensibility. Each
> > + * ioctl is passed in a structure pointer as the argument providing the size of
> > + * the structure in the first u32. The kernel checks that any structure space
> > + * beyond what it understands is 0. This allows userspace to use the backward
> > + * compatible portion while consistently using the newer, larger, structures.
> > + *
> > + * ioctls use a standard meaning for common errnos:
> > + *
> > + *  - ENOTTY: The IOCTL number itself is not supported at all
> > + *  - E2BIG: The IOCTL number is supported, but the provided structure has
> > + *    non-zero in a part the kernel does not understand.
> > + *  - EOPNOTSUPP: The IOCTL number is supported, and the structure is
> > + *    understood, however a known field has a value the kernel does not
> > + *    understand or support.
> > + *  - EINVAL: Everything about the IOCTL was understood, but a field is not
> > + *    correct.
> > + *  - ENOENT: A provided token does not exist.
> > + *  - ENOMEM: Out of memory.
> > + *  - EOVERFLOW: Mathematics overflowed.
> > + *
> > + * As well as additional errnos, within specific ioctls.
>
> ...
>
> > --- a/kernel/liveupdate/Kconfig
> > +++ b/kernel/liveupdate/Kconfig
> > @@ -1,7 +1,34 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Copyright (c) 2025, Google LLC.
> > +# Pasha Tatashin <pasha.tatashin@soleen.com>
> > +#
> > +# Live Update Orchestrator
> > +#
> >
> >  menu "Live Update and Kexec HandOver"
> >
> > +config LIVEUPDATE
> > +     bool "Live Update Orchestrator"
> > +     depends on KEXEC_HANDOVER
> > +     help
> > +       Enable the Live Update Orchestrator. Live Update is a mechanism,
> > +       typically based on kexec, that allows the kernel to be updated
> > +       while keeping selected devices operational across the transition.
> > +       These devices are intended to be reclaimed by the new kernel and
> > +       re-attached to their original workload without requiring a device
> > +       reset.
> > +
> > +       Ability to handover a device from current to the next kernel depends
> > +       on specific support within device drivers and related kernel
> > +       subsystems.
> > +
> > +       This feature primarily targets virtual machine hosts to quickly update
> > +       the kernel hypervisor with minimal disruption to the running virtual
> > +       machines.
> > +
> > +       If unsure, say N.
> > +
>
> Not a big deal, but since LIVEUPDATE depends on KEXEC_HANDOVER, shouldn't
> it go after KEXEC_HANDOVER?

Sure, I'll move them to the end of the file.

Thanks,
Pasha
