Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E71E5B73
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 00:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770252147; cv=pass; b=LPQalQBz9bu6SihH3ZnPp3nDYIDvNn1kiw8l0ruO+r6z9qFpvqoo1QKNA+roZl4jQnbJf1muIeK9YYUd6HjHU55wJtsLqnI0fxWrdzB7K4EiTqeO0dAbNX4dULDDNN62YABSurwkOp3FwdIgf2sOfiOzKX6lxkD2TfNyRgYAfBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770252147; c=relaxed/simple;
	bh=Ow7r61Ujx6Fwtsev9bVFnpw1yXZnUtB5DPBVgBvAnEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pt37OfD8L5l9yMKBwvPqgAIWGCWqD8O3eyx+7aMg4byjZvxJsc7nZPgAWaxMI2kSRVn3MUtgK5VcpusY/uui8TdRlzhQLlpKoYrC8QQwqxlk3nfLUZx0QSxTWoVhiS3zmlsnLFnQYfYxmKhj07v6tXuX+6/HIYe5xbV+8Xpddks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZEriRCj; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZEriRCj"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65821afe680so2421a12.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 16:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770252145; cv=none;
        d=google.com; s=arc-20240605;
        b=SOU+an/1Y11gPG9VIVT2D3pG3Z4PYqRR5GJo3cS4mFnpm0GQEoEQGjkO7aXJqj6mZC
         +XnwZEJReAOsATPvqp2d25dCkeGExRaljHKtCRku+4IIU0bqElLFyx7yFhXlgpElLHt7
         JwTvVG6Y/Vvv9OkRDkJI35FrVTFS3DMXvdu62t+GWakW/B63kgZ0XOuAQ7TzO34wIIbK
         ffrHpPuWGJQCaJNQ4P+A23ruc2/qMDLmydbphm1FHo3P6iqzLwFdCN6R/7F6wfG/As50
         TSL2SAllcCMBr3x9dSr4+fJeHNU8vr1P0UDyAGa+s99n7JLpHOh2BW7TMab7jPvZhHG8
         av2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VlDrMcmalHLovHdz8eEZBmrC943QEAplMoC4h6ttO+8=;
        fh=DQYyQyB7CjgV/1g68JilSM7q4lvENyCB2vMKNXLU57Y=;
        b=OTFtLyRXA8zuXpY2BzV3Z2VcNjZ9xiN5nKUDpBlEadASKmlkHRq+qb68LLnBCP7y7K
         4Ueqe7I1GP8R/Y71Xf94PqRikOXZ7ZFUTotuv85zWAes/2UtchCHkXZxE8D98MPi3OLG
         c06G5EwoenGgZZN4pRjj1zbodM5/acc86qs7PELD1XVSW+cA2BTkzUt2YLhlWNcOZvIk
         2glUQuc2Kt1uhWHqlUvNM6ABS/P6lWP1FldKtpbbXsdKvPjMHIylzkcua+bewLdYHRZg
         3BZTjxr4kNz5YQkrO5CqWkn1Rw3ZxANtV5o39By6gSIq8miP8rqx5H4AON+o0B5Cu7BD
         gfaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770252145; x=1770856945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlDrMcmalHLovHdz8eEZBmrC943QEAplMoC4h6ttO+8=;
        b=wZEriRCjDzYAfqVgNYog+pKLyAT6ZsKdSxkkzrciJH51y2oQUal0uzZs8GEjzO0TJ/
         bPSN0Hfar6apX5DKOrcvPdXq/XBhapoqDE0Tdo8xdhEhBfNBlUMLzK+gwAGyRhNhrPWM
         YjKaJieHX0qjSz+yeARUB20l+0XtHqtFloEkK+jW5Bug4hYZ0WRl8jYAyEQQef5hAhvG
         BT1TFlW06bSbGUecIgiozyyodCu6xw0rP4yeTcmbQIH5KyRQcxVoBVSC2hoMouwDMA8e
         TMqcFt3Oaf1q5MaEKKpzRloTrzhh/mHw6TVj0lRmh01BuEMZ59Av3duQ4mcCG0VZhGyM
         bwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770252145; x=1770856945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VlDrMcmalHLovHdz8eEZBmrC943QEAplMoC4h6ttO+8=;
        b=F8NQ0pZFSy0YH3HBG10+hPxpmOjwJCh2zGFjEfPcMAnJTdNdAzQsbTzkSzkslquwbG
         mz4SVN95o1x45j3w8gEHmy3I+sYVO3rzFbakQfDN85OKcSdil/U1ahdo/N9tancDTli2
         +enhDSAGJDxICuRYP5Flf9pYmTU0S2DZZ53KkXBTbjIeRW5RZtUiVkuYSUOElbjA+8yh
         7ZmKFKbqPqyxSBwLsZEoffR7ys6o1HLYMW3cXFs8QUfSX5XMTQgSVcARyKt2RVyhfQfd
         2prELnWkSQDRQVJkGXrAFsbW5U/J7/ReKjNlRGqbDBofLnm2iRRmdlnec4ABO5qxRjkd
         LAAw==
X-Forwarded-Encrypted: i=1; AJvYcCUC1QTV/7YEpHCgE2me9UnkkBMLuMtK9ZRqb3SuUtzt3FY3MDw9n3euGvdkOgP/4VTh2xwy7CSUjic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1eddCxQRdz8nCONV2fahn2w7bq9aggOSKnOjlxDCUu3kNxtm
	bSPy6pbNS/m2anW/W2knJIxfRX2TO8OoQ1owyGunqc/mGkaz8T/EOSlclN6NFvr4zQ+qOA/XDUI
	5BjLao91OnWmdvZ1kyiEnCr4lpbiKOO7A5S1ulMVr
X-Gm-Gg: AZuq6aJAeKqrWNgMBpJ3tx6VMAomcXLVrSIKL7ZpFYtkznLcjmNHQXcWp3orbEp5y6r
	U7w1rpM4LkARIuYpGV/JKcBkVR8DbjgtnEQckMTS6NZAHzBApGLuGs+0ZaSJF/0bPMw0NAfiOwb
	ixf6lu/bMGiJnJaAsAc6MouU2BQ7tCdcU/xw1pDP0J9k6zUDuJgVekRUvbVfVufh4csB+e4b89m
	HzOKzH/QsNcUR22N24Il6iOOaf48SHFhgnmZAGu+fBWeVQwEcY5hzgAYIlXDTGpCoc/fBU=
X-Received: by 2002:aa7:da0d:0:b0:649:69e6:cd4d with SMTP id
 4fb4d7f45d1cf-65965ebacd3mr5686a12.11.1770252144864; Wed, 04 Feb 2026
 16:42:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113225406.273373-1-jmattson@google.com> <aWbmXTJdZDO_tnvE@google.com>
 <CALMp9eTYakMk0Bogxa_GdGU5_h4PK-YOXcu-cSQ16m1QcusHxw@mail.gmail.com>
 <CALMp9eQx7EVim4iYGbAhoHrei2YmTra6oxtdmKaY7bw-M0PHbw@mail.gmail.com> <aYKoJ74MWboBuE_M@google.com>
In-Reply-To: <aYKoJ74MWboBuE_M@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 4 Feb 2026 16:42:12 -0800
X-Gm-Features: AZwV_QhLA8eJsXkrtDZzOLlw96qtQQW2WL1CaWfZKw649MsGypEsGWxa5AFa2fo
Message-ID: <CALMp9eSc=0zS+6Rk-c_0P-Q1Y8_9Xv58G5BYxieKpv_XaSj0wg@mail.gmail.com>
Subject: Re: [PATCH] KVM: VMX: Add quirk to allow L1 to set FREEZE_IN_SMM in vmcs12
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 6:00=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Jan 22, 2026, Jim Mattson wrote:
> > On Tue, Jan 13, 2026 at 7:47=E2=80=AFPM Jim Mattson <jmattson@google.co=
m> wrote:
> > > On Tue, Jan 13, 2026 at 4:42=E2=80=AFPM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > > >
> > > > On Tue, Jan 13, 2026, Jim Mattson wrote:
> > > > > Add KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM to allow L1 to set
> > > > > IA32_DEBUGCTL.FREEZE_IN_SMM in vmcs12 when using nested VMX.  Pri=
or to
> > > > > commit 6b1dd26544d0 ("KVM: VMX: Preserve host's
> > > > > DEBUGCTLMSR_FREEZE_IN_SMM while running the guest"), L1 could set
> > > > > FREEZE_IN_SMM in vmcs12 to freeze PMCs during physical SMM coinci=
dent
> > > > > with L2's execution.  The quirk is enabled by default for backwar=
ds
> > > > > compatibility; userspace can disable it via KVM_CAP_DISABLE_QUIRK=
S2 if
> > > > > consistency with WRMSR(IA32_DEBUGCTL) is desired.
> > > >
> > > > It's probably worth calling out that KVM will still drop FREEZE_IN_=
SMM in vmcs02
> > > >
> > > >         if (vmx->nested.nested_run_pending &&
> > > >             (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTRO=
LS)) {
> > > >                 kvm_set_dr(vcpu, 7, vmcs12->guest_dr7);
> > > >                 vmx_guest_debugctl_write(vcpu, vmcs12->guest_ia32_d=
ebugctl &
> > > >                                                vmx_get_supported_de=
bugctl(vcpu, false)); <=3D=3D=3D=3D
> > > >         } else {
> > > >                 kvm_set_dr(vcpu, 7, vcpu->arch.dr7);
> > > >                 vmx_guest_debugctl_write(vcpu, vmx->nested.pre_vmen=
ter_debugctl);
> > > >         }
> > > >
> > > > both from a correctness standpoint and so that users aren't mislead=
 into thinking
> > > > the quirk lets L1 control of FREEZE_IN_SMM while running L2.
> > >
> > > Yes, it's probably worth pointing out that the VM is now subject to
> > > the whims of the L0 administrators.
> > >
> > > While that makes some sense for the legacy vPMU, where KVM is just
> > > another client of host perf, perhaps the decision should be revisited
> > > in the case of the MPT vPMU, where KVM owns the PMU while the vCPU is
> > > in VMX non-root operation.
>
> Eh, running guests with FREEZE_IN_SMM=3D0 seems absolutely crazy from a s=
ecurity
> perspective.  If an admin wants to disable FREEZE_IN_SMM, they get to kee=
p the
> pieces.  And KVM definitely isn't going to override the admin, e.g. to al=
low the
> guest to profile host SMM.

I'm not sure what you mean by "they get to keep the pieces." What is
the security problem with allowing L1 to freeze *guest-owned* PMCs
during SMM?

> > > > > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.=
c
> > > > > index 0521b55d47a5..bc8f0b3aa70b 100644
> > > > > --- a/arch/x86/kvm/vmx/nested.c
> > > > > +++ b/arch/x86/kvm/vmx/nested.c
> > > > > @@ -3298,10 +3298,24 @@ static int nested_vmx_check_guest_state(s=
truct kvm_vcpu *vcpu,
> > > > >       if (CC(vmcs12->guest_cr4 & X86_CR4_CET && !(vmcs12->guest_c=
r0 & X86_CR0_WP)))
> > > > >               return -EINVAL;
> > > > >
> > > > > -     if ((vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTRO=
LS) &&
> > > > > -         (CC(!kvm_dr7_valid(vmcs12->guest_dr7)) ||
> > > > > -          CC(!vmx_is_valid_debugctl(vcpu, vmcs12->guest_ia32_deb=
ugctl, false))))
> > > > > -             return -EINVAL;
> > > > > +     if (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROL=
S) {
> > > > > +             u64 debugctl =3D vmcs12->guest_ia32_debugctl;
> > > > > +
> > > > > +             /*
> > > > > +              * FREEZE_IN_SMM is not virtualized, but allow L1 t=
o set it in
> > > > > +              * L2's DEBUGCTL under a quirk for backwards compat=
ibility.
> > > > > +              * Prior to KVM taking ownership of the bit to ensu=
re PMCs are
> > > > > +              * frozen during physical SMM, L1 could set FREEZE_=
IN_SMM in
> > > > > +              * vmcs12 to freeze PMCs during physical SMM coinci=
dent with
> > > > > +              * L2's execution.
> > > > > +              */
> > > > > +             if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_VM=
CS12_FREEZE_IN_SMM))
> > > > > +                     debugctl &=3D ~DEBUGCTLMSR_FREEZE_IN_SMM;
> > > > > +
> > > > > +             if (CC(!kvm_dr7_valid(vmcs12->guest_dr7)) ||
> > > > > +                 CC(!vmx_is_valid_debugctl(vcpu, debugctl, false=
)))
> > > >
> > > > I'm mildly tempted to say we should quirk the entire consistency ch=
eck instead of
> > > > limiting it to FREEZE_IN_SMM, purely so that we don't have to add y=
et another quirk
> > > > if a different setup breaks on a different bit.  I suppose we could=
 limit the quirk
> > > > to bits that could have been plausibly set in hardware, because oth=
erwise VM-Entry
> > > > using L2 would VM-Fail, but that's still quite a few bits.
> > > >
> > > > I'm definitely not opposed to a targeted quirk though.
> > >
> > > I have no preference.
>
> After mulling over the options from time to time, I think our best be is =
to quirk
> only FREEZE_IN_SMM, but very explicity scope the quirk to just the consis=
tency
> check.  E.g. maybe KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC?  That should he=
lp alert
> readers to the fact that the quirk bypasses the check, but L2 will still =
see
> FREEZE_IN_SMM=3D0 (e.g. in the unlikely scenario L1 disables interception=
 of
> DEBUGCTL).
>
> As for why just FREEZE_IN_SMM, in addition to the fact that FREEZE_IN_SMM=
 is the
> only bit that broke anyone (as far as we know, /knock wood), it's also th=
e only
> bit that is host-owned.  I.e. unless the host admin likes SMM mucking wit=
h things,
> skipping the consistency check isn't terrible from a functionality perspe=
ctive
> (KVM doesn't honor the bit for emulated SMM, but that's QEMU's problem :-=
D).
>
> > Would you like me to post a v2?
>
> Yes please.
