Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6192E3367
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 03:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742872012; cv=none; b=WqjGOX98yapw8hYLjDLc0bbp26oVO5cqbBLnyYJbhV48fFt9x9H9zJba+WLvGr4JXMsnsoxGtqWvpvt8dxZDUvlbTUlkDO/93+QokIMQ2xVTuMlO6q6kYAf2UdmcEWx+dp7QQa/xmzB3H6aA9rvwM8j6ZmZHc4VyfX272YcJGLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742872012; c=relaxed/simple;
	bh=3AifEiAg7S/85pNP2ZR0L9nqZjoYs72DEVHapNmbIX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANrWkKMjFOgTLOZQ3v8z1Eu1JAyWLaOMYiqpgLQ0E0MIRWwSOvih/CAkk/Ir9Cao1cfq/zyj1k3nOzUkSlV/BXzZIWy4T8V2OkkaG5IR7v+bhOlEaMrLi5dgYbFKYHGdcSlfxYhd17ZV0T3dS77aT3XSw6TeDOIljvK0poiPSQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gt/DY1J/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gt/DY1J/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742872008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8QX+zFdWjeuQlzuCcAZM/kErn+a5XVCQ6Ck8ssaU/og=;
	b=gt/DY1J/08YJGkLPSbtFsj9R0wa9fKrpv0qFhOS8BcAQTTB+X7Wy+jG+mVWQ1vMk4yrREM
	ZiH3R+YzkRLR9m9doV7s1JZsBY85LNv/o6pLKGyiTEx2Exp1aluntf5+ihk8Y6OuwmzG8v
	29RgOsYkL7AjGDiqBAM+q01qch4kb1w=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-9XHbGFjiPES05IRFJe7vgg-1; Mon, 24 Mar 2025 23:06:47 -0400
X-MC-Unique: 9XHbGFjiPES05IRFJe7vgg-1
X-Mimecast-MFC-AGG-ID: 9XHbGFjiPES05IRFJe7vgg_1742872006
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d2a379bbf0so95625655ab.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 20:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742872006; x=1743476806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QX+zFdWjeuQlzuCcAZM/kErn+a5XVCQ6Ck8ssaU/og=;
        b=ZXS4ui+tWa+2g59V5fg1ki0wKZlc2W/Tj0bcJUUThTY3pnzLrjFZAU581azWu+kgY9
         rjuUhQSE8UJObL42ypEqPi//+JdO85+/noVODckM0v+uuKhjOELZ7ohwhFsHGl4vKuOh
         RfmnWBW4e9ZiiVnt/h4YtXfOnsWysAdW0hwv0RtdZBlg3MgHhMGNwFEMegdX4K9J6nBk
         rZUxJTftHBWKlydniboQb+dcuIZI2ivNxjjqZ4PswaH6jB4OII6/ul+cTx23Qofa3jM6
         od3b901p90ZY/3aNsgS/ZULwQUeJhIlybpFBW6UkISbNhR0H7fw8WOCBMm0sVlBD1ILc
         YGVA==
X-Forwarded-Encrypted: i=1; AJvYcCWcbJGZipS9juuyeQMb7rlurNS1WQygMsZU8tA61rrSOijmweGY5MTCPmKo2t0Y+TBEv8QtSJfQN9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFfnbg1Ge8RXOZalSMm2izNC0G922zJq2zUaCStJFZ2mnxouMe
	D4s9N1Oq92mnF0IVCRc01pQYbRHqNri0xsuNQ5oVVgu17LW6r9tV8v4daBrlUB4AmSLJz5BsF1D
	YV0tjYaoVUYZ44ow3+7vb9BKGvqNiRfPNU5IZ/9JCQp6FTA44pHx6W5C7ac/+kcroWd1gbmJWcP
	TEpVSyPWfwgecb8Hhu1GNmftzNRmuz5qAG
X-Gm-Gg: ASbGncvIZujSdecmWeMU7d7Td0zvZNJtDcH614BOqR75I/0ZcRmSRgHSziaMrkZAbUN
	ovsoJEriF5UjF7u8DoH9P3YqUu/6EDRQJExMf4oxwFdCxL+Q9JozN6dvvDb7QpRN+yfTJyV4YVw
	==
X-Received: by 2002:a05:6e02:748:b0:3d4:6e2f:b493 with SMTP id e9e14a558f8ab-3d59615d9b2mr153651345ab.11.1742872006027;
        Mon, 24 Mar 2025 20:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5XTfTYA1qkf4MGjSh6Evza+A2MB/jUqh1YG/uG3OXh4qzNNvGTBc1K4PgXO/eVmwdqOvHcPKX5AjVSKaQhLs=
X-Received: by 2002:a05:6e02:748:b0:3d4:6e2f:b493 with SMTP id
 e9e14a558f8ab-3d59615d9b2mr153650885ab.11.1742872005537; Mon, 24 Mar 2025
 20:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <CA+CK2bC4PM0JnHOUm7qfpQ=wUhwsYQ-hJ12tTK_7pSWgYk+bhg@mail.gmail.com> <CALu+AoRL+oHW2vN8nf1wpsG2Ki8d44AABQRCBMd+CE4_XzqRTw@mail.gmail.com>
In-Reply-To: <CALu+AoRL+oHW2vN8nf1wpsG2Ki8d44AABQRCBMd+CE4_XzqRTw@mail.gmail.com>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 25 Mar 2025 11:07:06 +0800
X-Gm-Features: AQ5f1JodZdPjZPmn7C-4IUrPojZILVca8awRM4MpIz-0KIylSAlKoZUHH0RUnGg
Message-ID: <CALu+AoSzOixDBHiFdry=RbFGX5Umk5XxLC=BmPKMYW7rCLUxSw@mail.gmail.com>
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

On Tue, 25 Mar 2025 at 09:24, Dave Young <dyoung@redhat.com> wrote:
>
> On Tue, 25 Mar 2025 at 03:27, Pasha Tatashin <pasha.tatashin@soleen.com> =
wrote:
> >
> > On Mon, Mar 24, 2025 at 12:18=E2=80=AFAM Dave Young <dyoung@redhat.com>=
 wrote:
> > >
> > > On Thu, 20 Mar 2025 at 23:05, Changyuan Lyu <changyuanl@google.com> w=
rote:
> > > >
> > > > From: Alexander Graf <graf@amazon.com>
> > > >
> > > > We have all generic code in place now to support Kexec with KHO. Th=
is
> > > > patch adds a config option that depends on architecture support to
> > > > enable KHO support.
> > > >
> > > > Signed-off-by: Alexander Graf <graf@amazon.com>
> > > > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > > > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > > > ---
> > > >  kernel/Kconfig.kexec | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > > > index 4d111f871951..57db99e758a8 100644
> > > > --- a/kernel/Kconfig.kexec
> > > > +++ b/kernel/Kconfig.kexec
> > > > @@ -95,6 +95,21 @@ config KEXEC_JUMP
> > > >           Jump between original kernel and kexeced kernel and invok=
e
> > > >           code in physical address mode via KEXEC
> > > >
> > > > +config KEXEC_HANDOVER
> > > > +       bool "kexec handover"
> > > > +       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KE=
XEC_FILE
> > > > +       select MEMBLOCK_KHO_SCRATCH
> > > > +       select KEXEC_FILE
> > > > +       select DEBUG_FS
> > > > +       select LIBFDT
> > > > +       select CMA
> > > > +       select XXHASH
> > > > +       help
> > > > +         Allow kexec to hand over state across kernels by generati=
ng and
> > > > +         passing additional metadata to the target kernel. This is=
 useful
> > > > +         to keep data or state alive across the kexec. For this to=
 work,
> > > > +         both source and target kernels need to have this option e=
nabled.
> > > > +
> > >
> > > Have you tested kdump?  In my mind there are two issues,  one is with
> > > CMA enabled, it could cause kdump crashkernel memory reservation
> > > failures more often due to the fragmented low memory.  Secondly,  in
> >
> > As I understand cma low memory scratch reservation is needed only to
> > support some legacy pci devices that cannot use the full 64-bit space.
> > If so, I am not sure if KHO needs to be supported on machines with
> > such devices. However, even if we keep it, it should really be small,
> > so I would not expect that to be a problem for crash kernel memory
> > reservation.
>
> It is not easy to estimate how much of the KHO reserved memory is
> needed.  I assume this as a mechanism for all different users, it is
> not  predictable.  Also it is not only about the size, but also it
> makes the memory fragmented.
>
> >
> > > kdump kernel dump the crazy scratch memory in vmcore is not very
> > > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > > so please disable this option for kdump.
> >
> > The scratch memory will appear as regular CMA in the vmcore. The crash
> > kernel can be kexec loaded only from userland, long after the scratch
> > memory is converted to CMA.
>
> Depending on the reserved size, if big enough it should be excluded in
> vmcore dumping.
> Otherwise if it is a kdump kernel it should skip the handling of the
> KHO passed previous old states.

If you do not want to make the KHO conflicts with kdump, then the
above should be handled and well tested.  And then leave to end user
and distribution to determine if they want the both enabled
considering the risk of crashkernel reservation failure.

>
> >
> > Pasha
> >

