Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7E3BED74
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772724123; cv=none; b=cjvsipX8kb9QHHrCsDFxSxPdxboJLCC0DXonKMGyVnio9sTgZzoNEr5sk0KOeSKU0gn8cXhqt8heHWVGQrmEuZWeSWs7NdNG/Z8ZX6vSRYa29vFXL4z6ngGXHr4kRRnFiCKD+6kVL2KoXbRCBk2psQukkR6tRDV5s8CTEJfC2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772724123; c=relaxed/simple;
	bh=hVwWUyTaBA1X0Qtv3VS+VDzhq2Nom128L7vHpqlnT6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JspefxXLMm7C2XHOuBOY9kYYHOIZ2Zlq+iAhhlyr5rCi9aTmRhNwkMpeBfHrtni91ooZlF7DVGW6OkmXGQNZz51VTopndhJyDVszc79JnO4X8XasUrFrp7iEJUyLr38kjitx8N1lgMdkSjVD9FBjhkWfc9dc1FHIDqAqxelZMcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p1fFDBNS; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p1fFDBNS"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3598007eb74so25868804a91.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 07:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772724121; x=1773328921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L2qC3HnwuZHtn35QgRRL4tVQXqNGluOA+1BljQbEOw=;
        b=p1fFDBNSvRzFGBz37YQq5XBLg9u6JzIyvcAeK0vbP0w+7FpU+yBZzUb3MK8wb2W+27
         lc07v29E/YQbHqIRIKgwE2zP02L2qnBMPoE8JzBhAHpY2jZbAWXKxuaqbrHMLstUdfxV
         NnIp5tkCAg4S4s707/WwqqhbsVhcKdbejBn5u9J6s156D/K1jNuWuTM2Jh7olHngde21
         Pz2DuKNBLZr2NA9TPsNkoYDw3Jomit28pizECuMX23Xo/fVQLaFmOnXD/ny8ZMdmjNYd
         FoQQlp+f6EmkAWndn2mwKDQ/OOiQviSuMbf9Ahf0ww/kPQ/4rJ8/tV77QV0zxFIRvaeZ
         iUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772724121; x=1773328921;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0L2qC3HnwuZHtn35QgRRL4tVQXqNGluOA+1BljQbEOw=;
        b=DXAFWgzcohmWaE0eleqQv9del4Oo+jcPOOgT1QBS8GfMaib/1VHcsqtrKP22Db6Noj
         I/cv+hXauGR6YcCe1I3Y1hYoUyUOOlkqi4hvYQ4UmiT98OS8E+5PYiZcr7yq85qDRbWt
         GTsalbv4XrfuBxDJTF4N+83XW8pSyqEuviZQETAYMt52J6F0CdqLgNLvxV3fusxaoD6W
         4xTLnS4zHurVbya17LukmHi/stKtIpTBU0Vkn+pM5WQl3mAZHIJkQs8ZA2w/nycdbDvM
         h4JUORnIMNyQVMsyzX/dS0OToHlYYHVFG9r+8I9r5UeijjVOZ1CEthOYPmk9Tr7tof4C
         I7HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAJMyJWzcARW+TqgFeY0LJ9HAApKcBYFd3sWWoXtYhOStD+mYduiVPorzy2OSiOUswNkmBK3gD0LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwugwGLkPs3a/SYXcrcfcp3vTal7BNc2hYdXrcEjx/U6ogGLI9Q
	WbCgGraXsNM41a2BkqyGQOuwwnlMGJMhZyEdySUXz6kmxDqcSIkwAoNXPSEs1mdU8zUPNY+UgZ7
	DUyOJzw==
X-Received: from pjbcu12.prod.google.com ([2002:a17:90a:fa8c:b0:359:9633:e147])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:390a:b0:356:1edc:b6e
 with SMTP id 98e67ed59e1d1-359a69c1bcamr5203409a91.8.1772724120543; Thu, 05
 Mar 2026 07:22:00 -0800 (PST)
Date: Thu, 5 Mar 2026 07:21:53 -0800
In-Reply-To: <99463361-58F3-42F9-9BCC-4BF0BF73D247@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-8-xin@zytor.com>
 <8731e234-22b8-4ccf-89ef-63feed09e9c5@linux.intel.com> <aahchI7oiFrjFAmb@google.com>
 <99463361-58F3-42F9-9BCC-4BF0BF73D247@zytor.com>
Message-ID: <aamfka09bDZV0iUO@google.com>
Subject: Re: [PATCH v9 07/22] KVM: VMX: Initialize VMCS FRED fields
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, pbonzini@redhat.com, 
	corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, chao.gao@intel.com, 
	hch@infradead.org, sohil.mehta@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026, Xin Li wrote:
>=20
>=20
> > On Mar 4, 2026, at 8:23=E2=80=AFAM, Sean Christopherson <seanjc@google.=
com> wrote:
> >=20
> > On Wed, Jan 21, 2026, Binbin Wu wrote:
> >> On 10/27/2025 4:18 AM, Xin Li (Intel) wrote:
> >>> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> >>> index fcfa99160018..c8b5359123bf 100644
> >>> --- a/arch/x86/kvm/vmx/vmx.c
> >>> +++ b/arch/x86/kvm/vmx/vmx.c
> >>> @@ -1459,6 +1459,15 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu,=
 int cpu)
> >>>    (unsigned long)(cpu_entry_stack(cpu) + 1));
> >>> }
> >>>=20
> >>> + /* Per-CPU FRED MSRs */
> >=20
> > Meh, this is pretty self-explanatory code.
>=20
> I want to remind that this is =E2=80=9CPer-CPU=E2=80=9D.
>=20
> On the other side, FRED_CONFIG and FRED_STKLVLS are typically the same on
> all CPUs, and they don=E2=80=99t need to be updated during vCPU migration=
.
>=20
> But anyway vCPU migration only cares per-CPU MSRs, so this is redundant.
>=20
> It often bothers me whether to explain the code a bit more or not, with a
> short brief comment or a lengthy one.

Oh, I'm all for comments,  But I generally dislike terse comments like the =
above,
as they're only useful for readers that *already* know many of the gory det=
ails,
and for everyone else, it's largely just noise.

E.g. in this case, what the subtlety of what you were trying to convey with
"Per-CPU" was completely lost on me.  It would have been a wee bit more hel=
pful
in earlier versions that used RDMSR, but even then it required the reader t=
o make
large leaps of intuition to understand the full context.

And the terse comment is also "wrong" in the sense that it lies by omission=
,
because this isn't *all* of the per-CPU MSRs.

E.g.

	/*
	 * Update the FRED RSP MSRs values that are restored on VM-Exit, as
	 * Linux uses dedicated per-CPU stacks for things like #DBs and NMIs.
	 * Note, RSP0 is _only_ used to load RSP on user=3D>kernel transitions,
	 * i.e. doesn't need to be loaded on VM-Exit and so doesn't have a VMCS
	 * field.  Note #2, the SSP MSRs will likely be per-CPU as well, but
	 * Linux doesn't yet support supervisor shadow stacks.
	 */=20

> >>> + if (kvm_cpu_cap_has(X86_FEATURE_FRED)) {
> >>> +#ifdef CONFIG_X86_64
> >>=20
> >> Nit:
> >>=20
> >> Is this needed?
> >>=20
> >> FRED is initialized by X86_64_F(), if CONFIG_X86_64 is not enabled, th=
is
> >> path is not reachable.
> >> There should be no compilation issue without #ifdef CONFIG_X86_64 / #e=
ndif.
> >>=20
> >> There are several similar patterns in this patch, using  #ifdef CONFIG=
_X86_64 /=20
> >> #endif or not seems not consistent. E.g. __vmx_vcpu_reset() and init_v=
mcs()
> >> doesn't check the config, but here does.
> >>=20
> >>> + vmcs_write64(HOST_IA32_FRED_RSP1, __this_cpu_ist_top_va(ESTACK_DB))=
;
> >>> + vmcs_write64(HOST_IA32_FRED_RSP2, __this_cpu_ist_top_va(ESTACK_NMI)=
);
> >>> + vmcs_write64(HOST_IA32_FRED_RSP3, __this_cpu_ist_top_va(ESTACK_DF))=
;
> >=20
> > IMO, this is flawed for other reasons.  KVM shouldn't be relying on ker=
nel
> > implementation details with respect to what FRED stack handles what eve=
nt.
> >=20
> > The simplest approach would be to read the actual MSR.  _If_ using a pe=
r-CPU read
> > provides meaningful performance benefits over RDMSR (or RDMSR w/ immedi=
ate?  I
> > don't see an API for that...), then have the kernel provide a dedicated=
 accessor.
>=20
> I think you asked for it:
>=20
> https://lore.kernel.org/kvm/ZmoWB_XtA0wR2K4Q@google.com/

Gah, so I did.  FWIW, comments like that aren't intended to be "you must do=
 it
this way", i.e. it's ok to push back (if there's justification to do so), b=
ut I
can totally see how it came across that way.

> I assume fetching through per-CPU cache is fast, but I might have misunde=
rstood
> your suggestion.

Oh, per-CPU cache is likely faster than RDMSR (though it would be nice to v=
erify).
The part I specifically don't like is referencing DB, NMI, and DF stacks.

> > Then the accessor can be a non-inlined functions, and this code can be =
e.g.:
> >=20
> > if (IS_ENABLED(CONFIG_X86_64) && kvm_cpu_cap_has(X86_FEATURE_FRED)) {
> > vmcs_write64(HOST_IA32_FRED_RSP1, fred_rsp(MSR_IA32_FRED_RSP1));
> > vmcs_write64(HOST_IA32_FRED_RSP2, fred_rsp(MSR_IA32_FRED_RSP2));
> > vmcs_write64(HOST_IA32_FRED_RSP3, fred_rsp(MSR_IA32_FRED_RSP2));
                                                                ^
                                                                |
                                                                3 (guess wh=
o failed at copy+paste)
> > }
> >=20
> > where fred_rsp() is _declared_ unconditionally, but implemented only fo=
r 64-bit.
> > That way the compiler will be happy, and the actual usage will be dropp=
ed before
> > linking via dead-code elimination.
>=20
> If KVM can=E2=80=99t rely on kernel side implementation details, fred_rsp=
() has to read
> directly from the corresponding MSRs, right?

No.  If the kernel provides an API specifically for getting RSP values, the=
n KVM
isn't rely on implementation details, KVM is relying on an (exported?) API,=
 and
it's the _kernel's_ responsibility to ensure that API is updated as needed.

Yeah, yeah, KVM is also part of the kernel, but it's a _lot_ easier to forg=
et to
update code when the implementation details change when some of the usage i=
s "far"
away.

> > Actually, we can probably do one better?
> >=20
> > if (cpu_feature_enabled(X86_FEATURE_FRED) && kvm_cpu_cap_has(X86_FEATUR=
E_FRED)) {
>=20
> I think KVM now forces X86_FEATURE_FRED=3Dy, no?

32-bit doesn't :-D

But even for 64-bit, X86_FEATURE_FRED should be cleared when FRED isn't sup=
ported
by hardware, in which case cpu_feature_enabled() still patches out the text=
.
