Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6426A1AF
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768362494; cv=pass; b=cSfNlTosvyq1VMMbfhcqeYMw8CcibuIZCCGdkVk0B+4GGvGGIL73+jCKdE0jIJY6TaQ9Mx2BIiA9IPCjjhk3t4bk5MpGaEbr6kGO6yU2AHe5KnQXnBp9K6G8S17sdR9cIMtnyL4IuRvQ1jvFRpVgHmMWG0dJFEvfZyDHcw+Xx5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768362494; c=relaxed/simple;
	bh=+8CXAGHlN7h7rhVhzCZo5Odk3sIt9n0hDG3DU7w3Sr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqhxZXz6QZ7O4JChBuAiVlqZ1X2A6HjnXzf5KWmKQ2/sWBwgyLIme/D+7CB1WordgNIqbsUYbmuvtQc67Jc7FQ525C46/fdIVMEMVMEq8nrvisVaTJjmbrqnK283dEz3qNfrij4tlbmofMiXe8Yt3d4aSWoK0wkVGZgEpNO9HAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FfBdIHYJ; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FfBdIHYJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6505d147ce4so4883a12.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 19:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768362490; cv=none;
        d=google.com; s=arc-20240605;
        b=QhZFDZ/vRpgw4JUfhN357bbOwbw7awi4WpYSCTeCfbjHsNRqCzThVRpSyoiVHFqzK0
         U2K8jeaUFOAxDVTUuQ5admLnIfX1Nppk6yYHfAFmAui5ZGrxAksob1+/QMnT9zpqGBvH
         TvfGlpQWSRbswHh1njVnuYyXAz9G3RSJXwJR4pdO4WXWlSdrSff4huSyyXe1DiCJs4uX
         hXFnAy0dGgs9yQPN18zdOckht/aHouWU3mLxMQiTPdJjJv+uVsoiwdH8AzoFWM7bqQ6o
         ZYBhUW0WpomwRsMBpJO0NUPK/Nvqt2vEt7HoJJzACxw3Ww+K1nelO3MC/mkRnmfKy99T
         LFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=scD7kn+lNKFJW5bkLd/OkPYs8TXwvlIWtW1Nlv05sh4=;
        fh=RSzDuEKMX9MNgieVi1Ij2KZ7tXXVpCSGutzHg207hCo=;
        b=DYn+uSKjgzRm2APzZoIkU6aSPK46fl3zy9XOXLebs7OywiqbzvYMNBjzUiTOf2kxDk
         zdY6HzVUZoV6mx7favD1bUkEwxCND0KRvuIzHAO1TbBM0RZJmcs3mf0SscLMX3thHqni
         7zeKUyLJr3Zh28IZH087+l+HB1am3dwzyWmBvA8PMICB9oHjNeyiVajMsHgBgeO7Xaoq
         BkZmBw8a3h/gunX8fALkQAhVidNHf97FFZ51ZYvgkHvBwvWGUZIl79PXh/6HM+6NFPJE
         PMSOesJteyfnY6SkunpHuX25E1K/Kjwn+mg1d6JsK2bvzIOTL5FNlHvbqiFwIzQw+9bO
         aeCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768362490; x=1768967290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scD7kn+lNKFJW5bkLd/OkPYs8TXwvlIWtW1Nlv05sh4=;
        b=FfBdIHYJlKaJnccVUKhzNbjxwPwRwzXZBK7ubGs5QXWVbZO/FsGRB6Ei5rX2wKCVZt
         ty+aq7tid2Lum1wRyhY4KaSHot3QAICm3HLpB347cPn7p3D543ltIR6PFUzEuI5YCd5h
         X8KtbW+mate4wYnnrh6a7LQ0nRmQ1uuwswbesRsN5SFR1uaDYAQU/fTBHDBdVP+0pOQb
         /wW4M1yjNY5UhAq2o50WeM/tK2fTVN6dZ3MAnrP2A0GRt85uPJDH6jNiGRaHd64TdV6i
         lsMA1Ulg6fo4eziwEd3jzpurZq25USdERt9tot6HJ1Wrr6pzCmhmLHJkfTN05FmiouNn
         YptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768362490; x=1768967290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scD7kn+lNKFJW5bkLd/OkPYs8TXwvlIWtW1Nlv05sh4=;
        b=t1rg2MrGZBuAFXRJ4HU5mg/otaoaGTdatfqzQQu5y7dHKYKovtLG8DYADirznCbosH
         q/lpuEhnT6UM9Pixah7zph4LbVJ1DcMoY7+HhG3ozaFEXHkT1EcJnudm/eeVgfe63hHQ
         lUOv5iZTIc+FU6wguLfOQvvRsytianf3X3toFAt605CqRaHqvso7IOmNgxxpSKsWdUOa
         MusbiyBdGvBicFy3wBNeN+OD4K+gnwMGJYQSLpS4lksTHdMDX41g/3JpXUiyUsbk1n6O
         2PDHpWzzQnNSUKRV39vJ8x3erVOsbBEo/6f0IlSZj3b28qNye8osc4J+XPYutBvs/5g3
         forQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpP8mSEP4sO5InPJMqOru9Rin004hpMzygAX15imhj5vj1u7rTAQNqCS/+W0998uHa6dUROKt0pxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF3D00ip2ksclEyu3fY7ANnobswPp6QVx2oeCEKWGJnwxgW/FO
	rmqCx89WfrFcvcXyNc22YgeQKdCjqiGvars79NOlcnTwvqc6j0qd7QbOoOzJyN9rlh/G0JPtdXu
	myEpBxT+IxvsSzT2busB1MoLwnxC9C8EDg8TrD64w
X-Gm-Gg: AY/fxX4jJqLx5FafLqgDx9w4Z6D2znFX+hnprgHRuuOziH/gJqMPH9jJ7vO/LnEiRUb
	PlyLh4A/ITQcQnxS/n/i3L4/oTpVBUmsWdwe+EUykJ+vMHh5Gx48PclEp/UsuVU1I1XyWGaQuEy
	NYwSkk+vaIOAcgTUEb1wr/VRq+tJEmZ78z8Cjt2YkHt1TVwzkiXZ8bvxiemf+9RDAS7sODeuOVB
	Rx012Ty0FGTGaK7yKwwWWEcL3CHv6ELLcsnCyMbLi4eD3DRi1T5zjfXW6GcXxDh6Z3CkDQ=
X-Received: by 2002:a05:6402:10c5:b0:645:21c1:97e1 with SMTP id
 4fb4d7f45d1cf-653ebe0df15mr20706a12.18.1768362490453; Tue, 13 Jan 2026
 19:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113225406.273373-1-jmattson@google.com> <aWbmXTJdZDO_tnvE@google.com>
In-Reply-To: <aWbmXTJdZDO_tnvE@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 13 Jan 2026 19:47:58 -0800
X-Gm-Features: AZwV_QjYk5AB3MTvpGonH_E4zGStZr00TM2lL2gptdhdYaN66acS8j7r7evEsoc
Message-ID: <CALMp9eTYakMk0Bogxa_GdGU5_h4PK-YOXcu-cSQ16m1QcusHxw@mail.gmail.com>
Subject: Re: [PATCH] KVM: VMX: Add quirk to allow L1 to set FREEZE_IN_SMM in vmcs12
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 4:42=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Jan 13, 2026, Jim Mattson wrote:
> > Add KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM to allow L1 to set
> > IA32_DEBUGCTL.FREEZE_IN_SMM in vmcs12 when using nested VMX.  Prior to
> > commit 6b1dd26544d0 ("KVM: VMX: Preserve host's
> > DEBUGCTLMSR_FREEZE_IN_SMM while running the guest"), L1 could set
> > FREEZE_IN_SMM in vmcs12 to freeze PMCs during physical SMM coincident
> > with L2's execution.  The quirk is enabled by default for backwards
> > compatibility; userspace can disable it via KVM_CAP_DISABLE_QUIRKS2 if
> > consistency with WRMSR(IA32_DEBUGCTL) is desired.
>
> It's probably worth calling out that KVM will still drop FREEZE_IN_SMM in=
 vmcs02
>
>         if (vmx->nested.nested_run_pending &&
>             (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS)) {
>                 kvm_set_dr(vcpu, 7, vmcs12->guest_dr7);
>                 vmx_guest_debugctl_write(vcpu, vmcs12->guest_ia32_debugct=
l &
>                                                vmx_get_supported_debugctl=
(vcpu, false)); <=3D=3D=3D=3D
>         } else {
>                 kvm_set_dr(vcpu, 7, vcpu->arch.dr7);
>                 vmx_guest_debugctl_write(vcpu, vmx->nested.pre_vmenter_de=
bugctl);
>         }
>
> both from a correctness standpoint and so that users aren't mislead into =
thinking
> the quirk lets L1 control of FREEZE_IN_SMM while running L2.

Yes, it's probably worth pointing out that the VM is now subject to
the whims of the L0 administrators.

While that makes some sense for the legacy vPMU, where KVM is just
another client of host perf, perhaps the decision should be revisited
in the case of the MPT vPMU, where KVM owns the PMU while the vCPU is
in VMX non-root operation.

> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index 0521b55d47a5..bc8f0b3aa70b 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -3298,10 +3298,24 @@ static int nested_vmx_check_guest_state(struct =
kvm_vcpu *vcpu,
> >       if (CC(vmcs12->guest_cr4 & X86_CR4_CET && !(vmcs12->guest_cr0 & X=
86_CR0_WP)))
> >               return -EINVAL;
> >
> > -     if ((vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS) &&
> > -         (CC(!kvm_dr7_valid(vmcs12->guest_dr7)) ||
> > -          CC(!vmx_is_valid_debugctl(vcpu, vmcs12->guest_ia32_debugctl,=
 false))))
> > -             return -EINVAL;
> > +     if (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS) {
> > +             u64 debugctl =3D vmcs12->guest_ia32_debugctl;
> > +
> > +             /*
> > +              * FREEZE_IN_SMM is not virtualized, but allow L1 to set =
it in
> > +              * L2's DEBUGCTL under a quirk for backwards compatibilit=
y.
> > +              * Prior to KVM taking ownership of the bit to ensure PMC=
s are
> > +              * frozen during physical SMM, L1 could set FREEZE_IN_SMM=
 in
> > +              * vmcs12 to freeze PMCs during physical SMM coincident w=
ith
> > +              * L2's execution.
> > +              */
> > +             if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_VMCS12_F=
REEZE_IN_SMM))
> > +                     debugctl &=3D ~DEBUGCTLMSR_FREEZE_IN_SMM;
> > +
> > +             if (CC(!kvm_dr7_valid(vmcs12->guest_dr7)) ||
> > +                 CC(!vmx_is_valid_debugctl(vcpu, debugctl, false)))
>
> I'm mildly tempted to say we should quirk the entire consistency check in=
stead of
> limiting it to FREEZE_IN_SMM, purely so that we don't have to add yet ano=
ther quirk
> if a different setup breaks on a different bit.  I suppose we could limit=
 the quirk
> to bits that could have been plausibly set in hardware, because otherwise=
 VM-Entry
> using L2 would VM-Fail, but that's still quite a few bits.
>
> I'm definitely not opposed to a targeted quirk though.

I have no preference.

> > +                     return -EINVAL;
> > +     }
> >
> >       if ((vmcs12->vm_entry_controls & VM_ENTRY_LOAD_IA32_PAT) &&
> >           CC(!kvm_pat_valid(vmcs12->guest_ia32_pat)))
> > --
> > 2.52.0.457.g6b5491de43-goog
> >
