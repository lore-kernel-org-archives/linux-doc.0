Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784EF2F3B
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 01:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742865826; cv=none; b=iJQ0ljI6lxSE6ZX0G8GZvFLHL5gNsQl57t9Cd9ShO7lCY+2wD6Zq48nCNeqisEdUznyjW3fWXWiM9e8CvB36jJzYub3BEjo/FBSTS+mzBTs7N6b04SUi3xNi+as4BaR1MEOEN/ZOV1VkjempL6BypvZDAFc+GzvJKxBABmGpczI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742865826; c=relaxed/simple;
	bh=dmXOgSyiMkzP5lmOjikLvzTL3OGmqHkvRNIsCLUyNUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNrXBEvEIiwqf4DdzgvSgHo7wI3UD7ZqbYzx4r4940BbpRY/VfBlKEtGdCFDu8OqwGRdzh1bPMcrj5yV8zQRUGsDVa+2AMU5pShlFJffbfDJRK6Iq9rtVKjGG4iVMnYPdWfsnzrL2IhStJSNPg6r2bQQ5OLtPNTNYMrKeCWGmt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oni1+47t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oni1+47t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742865823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80YXslX43Vd+KzUMLEtvDw9pbdwUBTF2zW23HR+RDds=;
	b=Oni1+47tB1OU7EAqp5eF68eTMmt54QyVeEyZB8LHbK014ecJI4NHj519XZKW2nzTe3bz5L
	UVWYJ3pslKmroeavmLuSdKNdd/ngyd3V1k0ekD/2/s6HY4yHAcgLldkMhmUhXMK4uiVyRl
	WrzBA9DaZMd9s5rEkXV/yXNB8niu3OI=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-xYb6qW4yNvu1bvt5LuHUBA-1; Mon, 24 Mar 2025 21:23:42 -0400
X-MC-Unique: xYb6qW4yNvu1bvt5LuHUBA-1
X-Mimecast-MFC-AGG-ID: xYb6qW4yNvu1bvt5LuHUBA_1742865821
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5bb1708e4so2357495ab.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 18:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742865821; x=1743470621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80YXslX43Vd+KzUMLEtvDw9pbdwUBTF2zW23HR+RDds=;
        b=UoYEq3RlW1fxH6TNXUasJizp/j41fr7NFvK81SzlfL8h+wN1jtI27QQ5QyXVzq/hk+
         BNpGKun4I6Y203NZfLxi4TUQQn/AsWyrx+WKj7JL0yuz/DvvLShuntwyoJJnRQbcm7EX
         WAijaPpz9mMMdriUQgUEeS50MYhTtuGef6gxRm0H+674Xw5yy1/zi7BA6u3AIsMTl5xQ
         LBW+5TcwWZ8fHh3MLqbwTDciNtcL74tkx/oXOve7DkAJp+oPN+2wiVvkeYcpgQ4WxeUo
         VSge3o2gwjlAOBT3MNZk4zjxHtWRb49IKe4mdn9Vs855tf1kOIGxQlZGs7c2AxcYJjr1
         5kYg==
X-Forwarded-Encrypted: i=1; AJvYcCUx5jfjYpACvP5G0hsXlrcUWLHrai76iiYqJV6qogg5iaCIQ1JGEytKTj1eSVQHX238NiXCMwJ1vx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3tJjQSO/SdFI+DapdYqp0KalbF9Ks6U6tfVCKUFiIoNxvy4+Y
	E9h3NFm1C4MmL//BKOQpSVfNBfhzcHhiFt5IrydmImuUFUVvqTOG/cleLjsxXkVb9piR+OxIgHs
	0rvfI/kd0k5TuHyUjfquXxPoDzBEL+aZFZ+sNhV7omCJM0aCk5h0icP7KtSNU37TeDJnVH5+bEp
	+5mphulWJwvqVqwjQ4xpITptYlOORTtcyK
X-Gm-Gg: ASbGnct0mGLQ/64SUC+HOg7rIQjLnj8XU1Ek1T82dMLVxSgT5I6Snh+2Km4Ym81ZOTN
	n6LKqsJcblyHm5WhdqIrnHNcQG10wMm5rwPxyxEzA5APz9an4ojDZiV0PkG3nj7K/IlIx5yqtFg
	==
X-Received: by 2002:a05:6e02:349c:b0:3d3:dd60:bc37 with SMTP id e9e14a558f8ab-3d5961c530dmr173137375ab.22.1742865821211;
        Mon, 24 Mar 2025 18:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/JUKTQmyT7rmzB1113MDJsVnMSnwa5fEmJ4QQvGW8nT/qrXson+JpXQKKM8geQr7VEFqwbzNfblKLM2iKFAI=
X-Received: by 2002:a05:6e02:349c:b0:3d3:dd60:bc37 with SMTP id
 e9e14a558f8ab-3d5961c530dmr173136965ab.22.1742865820779; Mon, 24 Mar 2025
 18:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <CA+CK2bC4PM0JnHOUm7qfpQ=wUhwsYQ-hJ12tTK_7pSWgYk+bhg@mail.gmail.com>
In-Reply-To: <CA+CK2bC4PM0JnHOUm7qfpQ=wUhwsYQ-hJ12tTK_7pSWgYk+bhg@mail.gmail.com>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 25 Mar 2025 09:24:02 +0800
X-Gm-Features: AQ5f1JqwitaQjBg4ofN5mWtcdKnJXVa6ylkj6L0R0h_oYxt_kysMu1ZOpV0VfzE
Message-ID: <CALu+AoRL+oHW2vN8nf1wpsG2Ki8d44AABQRCBMd+CE4_XzqRTw@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org, 
	robh@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Mar 2025 at 03:27, Pasha Tatashin <pasha.tatashin@soleen.com> wr=
ote:
>
> On Mon, Mar 24, 2025 at 12:18=E2=80=AFAM Dave Young <dyoung@redhat.com> w=
rote:
> >
> > On Thu, 20 Mar 2025 at 23:05, Changyuan Lyu <changyuanl@google.com> wro=
te:
> > >
> > > From: Alexander Graf <graf@amazon.com>
> > >
> > > We have all generic code in place now to support Kexec with KHO. This
> > > patch adds a config option that depends on architecture support to
> > > enable KHO support.
> > >
> > > Signed-off-by: Alexander Graf <graf@amazon.com>
> > > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > > ---
> > >  kernel/Kconfig.kexec | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > > index 4d111f871951..57db99e758a8 100644
> > > --- a/kernel/Kconfig.kexec
> > > +++ b/kernel/Kconfig.kexec
> > > @@ -95,6 +95,21 @@ config KEXEC_JUMP
> > >           Jump between original kernel and kexeced kernel and invoke
> > >           code in physical address mode via KEXEC
> > >
> > > +config KEXEC_HANDOVER
> > > +       bool "kexec handover"
> > > +       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXE=
C_FILE
> > > +       select MEMBLOCK_KHO_SCRATCH
> > > +       select KEXEC_FILE
> > > +       select DEBUG_FS
> > > +       select LIBFDT
> > > +       select CMA
> > > +       select XXHASH
> > > +       help
> > > +         Allow kexec to hand over state across kernels by generating=
 and
> > > +         passing additional metadata to the target kernel. This is u=
seful
> > > +         to keep data or state alive across the kexec. For this to w=
ork,
> > > +         both source and target kernels need to have this option ena=
bled.
> > > +
> >
> > Have you tested kdump?  In my mind there are two issues,  one is with
> > CMA enabled, it could cause kdump crashkernel memory reservation
> > failures more often due to the fragmented low memory.  Secondly,  in
>
> As I understand cma low memory scratch reservation is needed only to
> support some legacy pci devices that cannot use the full 64-bit space.
> If so, I am not sure if KHO needs to be supported on machines with
> such devices. However, even if we keep it, it should really be small,
> so I would not expect that to be a problem for crash kernel memory
> reservation.

It is not easy to estimate how much of the KHO reserved memory is
needed.  I assume this as a mechanism for all different users, it is
not  predictable.  Also it is not only about the size, but also it
makes the memory fragmented.

>
> > kdump kernel dump the crazy scratch memory in vmcore is not very
> > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > so please disable this option for kdump.
>
> The scratch memory will appear as regular CMA in the vmcore. The crash
> kernel can be kexec loaded only from userland, long after the scratch
> memory is converted to CMA.

Depending on the reserved size, if big enough it should be excluded in
vmcore dumping.
Otherwise if it is a kdump kernel it should skip the handling of the
KHO passed previous old states.

>
> Pasha
>

