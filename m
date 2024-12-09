Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3245E1F63F4
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 23:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733788309; cv=none; b=dciVSR40RqULJirV+gIs1BpELZRnfJEh2RaqeLpJSZXI8j28S+y6Ac08QOnp8mMOpOfR/L+IfSR+Ihqsu+9UVOqgZG6dHI4R6Jj1wRqVkfMM1Q+m6A7Qsr1o8IiWaNdA84coyUA4hxj2jrIks9KYMHRPmRLqn8JIqzOW4Mpluos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733788309; c=relaxed/simple;
	bh=4Nn+t2Yjyce34wgCQ3ETEjPe8rZLcWfxBP8EUFN0Dy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKEGuRAvB8jrXMZFfedhoxyHXIWFPMQXyJKgYQ/7rs5RTd8K+nr6xLgQbN3PI3V462W1WyrC7hNqjIMQV7i5yWv0Cmsx9G/MptRFCikIDMEpyH760GZxarjY6ul23+8OL3dL7HWsvF/66YVAJX9uW9gMer4OWTVDWtMFe42BfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDwfwm+3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDwfwm+3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef6af22ea8so3270553a91.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2024 15:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733788307; x=1734393107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSUQjXvXCX7n0zlIPB3T1YFCaCdLs1ofM4KWIMrWBKg=;
        b=aDwfwm+3OsDJ+hy8Yi+maopD92U+iq0Z6QXOZqANjwd6n669vFFVzlPoWRW/0jVQhY
         SCCEBweGkwc8VMyZRzsQu0Hk2ZBndjIbEyWkAbEzeqdNY138WjEQjvdaB2shwOqwVNHM
         dFZDRFhOlBnncBM/tK/w5BhXccL9RfamfIMy7RrJS0z5EyjJm0G42BX44Z3WV8Yttnu2
         i+9cZYl25pvQpmpvn84R3oVANouhiaNIahg+ff1Nl+jA+Alj7MmhVNoqCgFMueuYHaI8
         ejNunuELGOHp/lGILu0zicsTZWwRp3x6561ivktOwFxl/YZp2UB/2sYiv5S40qh4P+1v
         PQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733788307; x=1734393107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSUQjXvXCX7n0zlIPB3T1YFCaCdLs1ofM4KWIMrWBKg=;
        b=LOnF1o7N9nfm/Z+Txn8jM3CTSzjEfNX/mycF0gaWPmlGi3HZ3ZI7McwNRIgAUtLwuJ
         e75r4BfbWKGd0QYjCxZ6uOctiR/lRzgqXZu24V873SNVG6y3z+/ZJsTA6Ibtze4aLD62
         PoL/ENJkbfmsJ3BeuMx0TVjFwZzGC0PL1O+14X/9ckcIU87UXPHh0R1vtcGT1VIIV8U9
         vutc8Tt11VJkEkw/tf0V4WYPrc+/EwLXEMDKRJ8oRJWZoEU86njGDwobQJEXrnRZSjFf
         OM7yU7XSj61e5Gg0tUyHdWtky8Lok3/0J+x5LaAFE6vsR0lrGZNjIJZLg3UyyxpmJ1DU
         qXgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTec0l/00HwBOBY/jmX8RQ/X1MsGHWM9k8DWvNylDLzlExDffsFYhZO4R1lvSMHZ1GGzKjkCzoa+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEIdK5WiAaxbY7M9VUB8q6oRjWCxWiqs8Op1I/YqkJhddeWHS+
	sg83JHvJMjQ7o3uC3gW3cljhaqSPlxjQQ3oNIyUEUFMOkPlic5qKZzfr1AyWCUN8+NSpUsh0Epk
	tTFOoZkH8rz4gKqxa8T6TruVCv50FKL6iZgM=
X-Gm-Gg: ASbGncv40dMLVB2dLRoOJpri0hPMmGT9IIzQLjeybN65x0aO95LUKjWnIWqMaU4a3NH
	C1x8Gy6oxPgI3repYRj9oqMtstczPM9E8xF3niV0VU0sMb3Ic2vXPvIjr0+Cscgpa
X-Google-Smtp-Source: AGHT+IH/zZbQB//HIrX1JNipWnHUi43H4PwqcC6flKakC4Wp5vy64rAYnKcCmJw4Ryeyp5nKhAclTMf/QPAcT0muhIo=
X-Received: by 2002:a17:90b:4cce:b0:2ea:696d:732f with SMTP id
 98e67ed59e1d1-2efcf29a179mr3714478a91.29.1733788307107; Mon, 09 Dec 2024
 15:51:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com> <20241209162028.GD12428@willie-the-truck>
 <CAF1bQ=SiHi8oCyo5YnXGpQGofM1zAsnBdqSEet1mS-BYNKVU8A@mail.gmail.com> <20241209185623.GA13084@willie-the-truck>
In-Reply-To: <20241209185623.GA13084@willie-the-truck>
From: Yabin Cui <yabinc@google.com>
Date: Mon, 9 Dec 2024 15:51:34 -0800
X-Gm-Features: AZHOrDkYQ4V69Y7vLhOpgw-bfrlmqVn8MSQhz800aNeQq_Tq1k4ujC1njQBPuGU
Message-ID: <CALJ9ZPNfUFF8OrpvziTnTvGU7OxEgyy9ZTc3aF-NhZ5hMbp7RQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Will Deacon <will@kernel.org>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 On Mon, Dec 9, 2024 at 10:56=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> (Aside: please try to avoid top-posting on the public lists as it messes =
up
> the flow of conversation; I'll try to piece this back together.)
>
> On Mon, Dec 09, 2024 at 09:30:50AM -0800, Rong Xu wrote:
> > On Mon, Dec 9, 2024 at 8:20=E2=80=AFAM Will Deacon <will@kernel.org> wr=
ote:
> > > On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
> > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > index fd9df6dcc593..c3814df5e391 100644
> > > > --- a/arch/arm64/Kconfig
> > > > +++ b/arch/arm64/Kconfig
> > > > @@ -103,6 +103,7 @@ config ARM64
> > > >       select ARCH_SUPPORTS_PER_VMA_LOCK
> > > >       select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> > > >       select ARCH_SUPPORTS_RT
> > > > +     select ARCH_SUPPORTS_AUTOFDO_CLANG
> > > >       select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> > > >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> > > >       select ARCH_WANT_DEFAULT_BPF_JIT
> > >
> > > After this change, both arm64 and x86 select this option unconditiona=
lly
> > > and with no apparent support code being added. So what is actually
> > > required in order to select ARCH_SUPPORTS_AUTOFDO_CLANG and why isn't
> > > it just available for all architectures instead?

I think it's similar to ARCH_SUPPORTS_LTO_CLANG, which also doesn't need an=
y
support code but requires testing to ensure it works on a specific architec=
ture.

>
> > Enabling an AutoFDO build requires users to explicitly set CONFIG_AUTOF=
DO_CLANG.
> > The support code is in Commit 315ad8780a129e82 (kbuild: Add AutoFDO
> > support for Clang build).
>
> Yes, that is precisely my point. The user has to enable
> CONFIG_AUTOFDO_CLANG anyway, so what is the point in having
> ARCH_SUPPORTS_AUTOFDO_CLANG. Why would an architecture _not_ want to
> select that?
>
> > We are not enabling this for all architectures because AutoFDO's optimi=
zed build
> > relies on Last Branch Records (LBR) which aren't available on all archi=
tectures.
>
> So? ETM isn't available on all arm64 machines and I doubt whether LBR is
> available on _all_ x86 machines either. So there's a runtime failure
> mode that needs to be handled anyway and I don't think the arch-specific
> Kconfig option is really doing anything useful.

My understanding of the benefits of ARCH_SUPPORTS_AUTOFDO_CLANG is:
1. Generally, we don't prefer to collect an AutoFDO profile on one
architecture and use it to build the kernel for another architecture.
This is because the profile misses data for architecture-dependent
code. ARCH_SUPPORTS_AUTOFDO_CLANG can partially prevent this from
happening.

2. Building a kernel with an AutoFDO profile involves using new
optimization flags for clang.  Having ARCH_SUPPORTS_AUTOFDO_CLANG=3Dy
for one architecture means someone has tested building a kernel with
an AutoFDO profile on this architecture.
>
> Will
