Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AD6344DAA
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 18:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770833042; cv=pass; b=BblMhg0wmgsp/NhtvMjBkZqBASRM7dsY3zuIZFIHtgG7UixTEp3uwF5POvSebvK0JKuXQzLhHvEZm4NWRoWhTAuE6RxYaKWMiA1sRJj+tfTSu7gOH+SpLxmMgjkzP4bNpGSR4uhGXEhZShuggOgNvoo7HjLq+/y4YK+gsSb2Tj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770833042; c=relaxed/simple;
	bh=ouUJwrGWrh8wBc0E6tYplmMc/jbS7J02rXG96ihY1P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWJwNygdpitQf8R7ZIkIhWB728/81b0RENZDJ3OijQvVAGzEknnOisCNgt+Xd4+IjJkI3SbzH4iFiyS+QTTXkc4HDkk2MOiIihSjNOQR6v3DqIEH/sAVMB/OsBE34/F2qTS8to1BrjyiTeakxrQRf714OjikHvU/1lntc0fCivE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3AaMguA/; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3AaMguA/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65a3a1740e7so419a12.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 10:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770833039; cv=none;
        d=google.com; s=arc-20240605;
        b=IREYoJxq8ZUzM+jl9742nbxYy/fxlRzuEK/dg3kgrq+eH7RyCFtuVtUJs2WWfPWN5R
         qpTxUeA0OcnEVNTxEP7x0S1bTIEPD1ct90YxjwQJOOlVF6U0rD2Sbd5m5CB0N7eQodzC
         cr8cKCBq9Kfacz6/sm+1H86Gh9GwZ64C1vYRlcZ1eWO3E7DKM3rBz8znqo69JoH93fxq
         tuGVLxmwmi0FitFWCvQt1a3EEPMtTTrq4u7SCzwBInIaNY+5QkaVK3twKXFg0ZiVt9lX
         G7Ebm0gbOk62mksSHuUPrq1o0IdAZOGIjmVeTtfXy1cJgGjbANWpnaZIji1eqD81/jJN
         v3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKlgXfWYb/Q3+FDpPTuMpP2koyA+/4Rt0aKVSAvYyco=;
        fh=Ywy5cFpIpC9MF7+LBpqZ2L+jjWki2pHVIuXpBDZxsY4=;
        b=P9JGptaEn5NiUAmJdWNQMmvnsrS0FwZuA9tQY4YxZr0rQrPYUCBBA96x9AY+eOFBBq
         csNcLFbl+UqwLrLLvo3MjrB0lck41P8xaM5i/82UXUydpPy83OEP9EGYVQ+y+KGpmtuU
         LwoJPIVGsxBkKaS4fL07caukO2nJpXfemVk+gLnpt8NH4Etey5lEKJOSadZQ7oyld1Cz
         psEntoL4K4pYIqNNkZNKwCDxmyBuJbXC8YKui4VanEYGNOklOrmZ0ML0UA6rP0tUJOnL
         qUS5N170ugwurzp7MSoCawHtGj4dFe0n/9JJnDwZ8HbWFrVC5uCIjFE88QyBay0dNWs8
         AcRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770833039; x=1771437839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKlgXfWYb/Q3+FDpPTuMpP2koyA+/4Rt0aKVSAvYyco=;
        b=3AaMguA/g9I/XNKBcnh06Swzeovz3CoU0UeXLYc0YH+DfD1FnxOaqrE6ymXx60BvPh
         3YyJJdszK7+3pv0qs/8kPAkmG/JDUHCziR0xhAnFSoTCjlE3bVdvWmC505tLxJy6MEaZ
         dLvT1shw8x3CC8ilBl0UO/ZBYHmbfovigoU80tMzuqYXrFJH5427MYVv6CXBKVq2I6UN
         dO4YFl8G9cKrXxKPEPcYvQems/TZyw4Ja6NOFGWQ9ijGjoR5/L2HY+CdBjnt0mETzoFw
         /6BYsjhmxvniV0TEmXKHgIdUUDH3yAZeiqsZRbe04/n2s3KO4V9mmKfYKroE/Di5x2zt
         YPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770833039; x=1771437839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FKlgXfWYb/Q3+FDpPTuMpP2koyA+/4Rt0aKVSAvYyco=;
        b=M+p5dKmLhy0DVzEhkrbK9cc3WDH5kzj3vIM60IlnRtO3D9LaSiXHMQxWgdTGzHhtMM
         MdIIR/aVdCW0R+aa5itJJNWhF3FrjBidDYhq6rGZdSxLnfFnViKlCet7yW0Ikvz5bVMI
         PKHUVsdvpaNHk2yXc+Wr/GOtgGhW3gg/8mLiBXEoM883Xma6Bv0nsIkEEK9MgeypQCme
         zPcy5N9QSFSgouF09KTOrzqVpugfiLg6FxlqWaaO9YKMMCqkQu4vErKYHq7KzOsHkd6P
         r7mSlZkYTLgGH278Qn6ex65PYXnBTy5lhX7REeE7JZYB57dbMfH02anQujfo/QSr8Qwh
         p5vw==
X-Forwarded-Encrypted: i=1; AJvYcCWicWF8WqXkfcfinNWaEQZtRs07CkC0b2YU0dNXuCYB/metzbj1ujNpaX5/sx0T9jXyZtIzXOhNpp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBh/H2b23EUI7SLa0MCHsjT052w0uYezmCEBK5zqvvobbeDnYm
	RaEUdIxXMJAbKHoLyeozq8Y2hbgBC44B3hbkf/mkNGmwAcZ4wrqklDQxG5u1AxQPZkfXGiarc27
	lk+JEhuATyU6CxNToR/Bhio0SGmdc964cLmSR5CILvwd3rh3Xbz0lqixp
X-Gm-Gg: AZuq6aKArcWubXaCbni2uVLtg6dymyGpFcKqqRoWQ6n64oMBDYoWoRlkjt+H7d4MPL4
	QMUMHmny6YvfYgY7+VB6iiND8HwuwWuhe4i1vQrsNdECBJZj4nEocJIfsSlhCQpDvWS40HAonQv
	fv0k/yZv5WVreKZmByH3e86KEFGHXztqY2rlT6pBRzPY+aALpuH9v5spgYa4FpTwgypEVy97Huu
	Te/AuCfSbnFZDZSttOUmjbSVwHIxH8jMGfqGmKXqMag/kr7LA7zY9Z7IiD4Z+pL4TyW8sDbwhns
	0L5z8dLpAYiSzEaIJw==
X-Received: by 2002:a05:6402:3092:b0:658:133d:8eb9 with SMTP id
 4fb4d7f45d1cf-65b98a1ae2cmr165a12.2.1770833038931; Wed, 11 Feb 2026 10:03:58
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205231537.1278753-1-jmattson@google.com> <cjmbfd5uexxzqzfzzwpgbehpyv7iqz6du4wfvwqnrenwlaaujs@42fhftddlgyx>
In-Reply-To: <cjmbfd5uexxzqzfzzwpgbehpyv7iqz6du4wfvwqnrenwlaaujs@42fhftddlgyx>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Feb 2026 10:03:46 -0800
X-Gm-Features: AZwV_QhwWsyRzE_AT1EuQKews13sAf-cBD-yj_uaEohGNfmzM27uNdDvKwoioDI
Message-ID: <CALMp9eT3NzQyeC4vgwF=82hUFGx6Zgp3NYWwAvMS5J7KCLFPcg@mail.gmail.com>
Subject: Re: [PATCH v2] Introduce KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 1:14=E2=80=AFPM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> On Thu, Feb 05, 2026 at 03:15:26PM -0800, Jim Mattson wrote:
> > Add KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC to allow L1 to set FREEZE_IN_=
SMM
> > in vmcs12's GUEST_IA32_DEBUGCTL field, as permitted prior to
> > commit 6b1dd26544d0 ("KVM: VMX: Preserve host's DEBUGCTLMSR_FREEZE_IN_S=
MM
> > while running the guest").  The quirk is enabled by default for backwar=
ds
> > compatibility; userspace can disable it via KVM_CAP_DISABLE_QUIRKS2 for
> > consistency with the constraints on WRMSR(IA32_DEBUGCTL).
> >
> > Note that the quirk only bypasses the consistency check. The vmcs02 bit=
 is
> > still owned by the host, and PMCs are not frozen during virtualized SMM=
.
> > In particular, if a host administrator decides that PMCs should not be
> > frozen during physical SMM, then L1 has no say in the matter.
> >
> > Fixes: 095686e6fcb4 ("KVM: nVMX: Check vmcs12->guest_ia32_debugctl on n=
ested VM-Enter")
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  Documentation/virt/kvm/api.rst  | 10 ++++++++++
> >  arch/x86/include/asm/kvm_host.h |  3 ++-
> >  arch/x86/include/uapi/asm/kvm.h |  1 +
> >  arch/x86/kvm/vmx/nested.c       | 23 +++++++++++++++++++----
> >  4 files changed, 32 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/ap=
i.rst
> > index d04b4bdd60c1..325e565ff99e 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -8482,6 +8482,16 @@ KVM_X86_QUIRK_IGNORE_GUEST_PAT      By default, =
on Intel platforms, KVM ignores
> >                                      guest software, for example if it =
does not
> >                                      expose a bochs graphics device (wh=
ich is
> >                                      known to have had a buggy driver).
> > +
> > +KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC
> > +                                 By default, KVM relaxes the consisten=
cy
> > +                                 check for GUEST_IA32_DEBUGCTL in vmcb=
12
>
> vmcs12*
>
> > +                                 to allow FREEZE_IN_SMM to be set.  Wh=
en
> > +                                 this quirk is disabled, KVM requires
> > +                                 this bit to be cleared.  Note that th=
e
> > +                                 vmcs02 bit is still completely
> > +                                 controlled by the host, regardless of
> > +                                 the quirk setting.
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >
> >  7.32 KVM_CAP_MAX_VCPU_ID
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm=
_host.h
> > index ff07c45e3c73..1669d4797f0b 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -2485,7 +2485,8 @@ int memslot_rmap_alloc(struct kvm_memory_slot *sl=
ot, unsigned long npages);
> >        KVM_X86_QUIRK_MWAIT_NEVER_UD_FAULTS |  \
> >        KVM_X86_QUIRK_SLOT_ZAP_ALL |           \
> >        KVM_X86_QUIRK_STUFF_FEATURE_MSRS |     \
> > -      KVM_X86_QUIRK_IGNORE_GUEST_PAT)
> > +      KVM_X86_QUIRK_IGNORE_GUEST_PAT |       \
> > +      KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC)
> >
> >  #define KVM_X86_CONDITIONAL_QUIRKS           \
> >       (KVM_X86_QUIRK_CD_NW_CLEARED |          \
> > diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/as=
m/kvm.h
> > index 846a63215ce1..76128958bbca 100644
> > --- a/arch/x86/include/uapi/asm/kvm.h
> > +++ b/arch/x86/include/uapi/asm/kvm.h
> > @@ -476,6 +476,7 @@ struct kvm_sync_regs {
> >  #define KVM_X86_QUIRK_SLOT_ZAP_ALL           (1 << 7)
> >  #define KVM_X86_QUIRK_STUFF_FEATURE_MSRS     (1 << 8)
> >  #define KVM_X86_QUIRK_IGNORE_GUEST_PAT               (1 << 9)
> > +#define KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC        (1 << 10)
> >
> >  #define KVM_STATE_NESTED_FORMAT_VMX  0
> >  #define KVM_STATE_NESTED_FORMAT_SVM  1
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index 248635da6766..9bd29b9375fb 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -3300,10 +3300,25 @@ static int nested_vmx_check_guest_state(struct =
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
it
> > +              * in VMCB12's DEBUGCTL under a quirk for backwards
>
> VMCS12's
>
> > +              * compatibility.  Note that the quirk only relaxes the
> > +              * consistency check. The vmcb02 bit is still under the
>
> vmcs02
>

/facepalm

> > +              * control of the host. In particular, if a host
> > +              * administrator decides to clear the bit, then L1 has no
> > +              * say in the matter.
> > +              */
> > +             if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_VMCS12_F=
REEZE_IN_SMM_CC))
> > +                     debugctl &=3D ~DEBUGCTLMSR_FREEZE_IN_SMM;
> > +
> > +             if (CC(!kvm_dr7_valid(vmcs12->guest_dr7)) ||
> > +                 CC(!vmx_is_valid_debugctl(vcpu, debugctl, false)))
> > +                     return -EINVAL;
> > +     }
> >
> >       if ((vmcs12->vm_entry_controls & VM_ENTRY_LOAD_IA32_PAT) &&
> >           CC(!kvm_pat_valid(vmcs12->guest_ia32_pat)))
> >
> > base-commit: e944fe2c09f405a2e2d147145c9b470084bc4c9a
> > --
> > 2.53.0.rc2.204.g2597b5adb4-goog
> >
>
