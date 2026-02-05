Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDE62FB997
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770313396; cv=pass; b=bzGVbeWf5XeKJOUp9Fva3lGCFNjv3ScKgro4HXzF1teS1IW/DYe/KELkK3LmvMPW7K9R5woGlNJj2cEsdR09a8nYKV2yTJtZBVUx48lJzXXK4kbs0keHs4UYhzdP1ZfFr+1XyY4sRbHeTBULVufU/39y0bpudMFKyBVB0Yozx60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770313396; c=relaxed/simple;
	bh=W7PKbjr3sm8K2EitecNIWP8s6CcOSoC5YBXcikD3Z/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e98xa9XHFiwPsAW2deCSVJxn5DIgo/NqIZiSgDEaRG7A9V0dWYpUj0VVw4t+mR9n6J62P0XBjFzb7ksLE2ubCtJasr8t8awmqSpMyUz+8Nh3/jbO52rL5/ku0KXlnC6q+73RDrtjCrlv/7Z3/D1KRAHzvrSPmG8n3NYEKk9ZcTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V2FYhWU+; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2FYhWU+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so346a12.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 09:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770313394; cv=none;
        d=google.com; s=arc-20240605;
        b=QND0/bMclqk4NB1wkCa1yi48Lek/5KcFgJF4u/aIsbFTqUWWyUmm1D0tUHqF8SkefF
         HjhiPv/wfLc9VcqZKMxDbTVyonVu50rcy5vgjK1CX8LChmtZsoRDTqVCgtBwPUbu0Bkg
         7PjrX489K2jaswZpavK85ISxv+d/Ch+s9t/WVjtsm05dU4fvhRo3uuDeuMoBitWTex57
         cuRrqTm+lDAHPfEt7etkBPu0E4U6O7/eG3ab4et/W5/Mo/hlccvdmyvK4QMKosb2Xebk
         dVTOYUS46X2S7U7Vob1CFaOBTWwnkBZLdDOmsGU1HuBLSYRwDsba/CRZw0XHm++pFsSN
         Xnnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ohb+oFC1mbgPld1c1rVcaRxKKHn/WerjH5KdHZYbAwI=;
        fh=VLaeNlQE0AgVAxrJNA2FBAKrKeeYg/whWpQx3YfmGmw=;
        b=X9DJmU1NCrTeo34uHDT1WB02OO/6c03Qn8zsHR1JuztL4CBptdtS+xl80ckk92eWPw
         7l3NoD2nJUKelvBTQpyJOIPwbBNyCWpJZTAfhYEwX5BzTnC3anlwQY3Q9aGg1DC3bNbu
         mET0m40U0qrBdrMHXcg3FkcmxzP0lKPZJq4iK+9vk3pCMHOmI7eocKPMEDylIrNiFbTL
         dnhSZI2PAKp1rLlhtjL+LYOsqKkYoe2/XGua8Y5fzayR4UJk8rySlZcRSJjn/aFZTMf+
         NkmUvkbiDb/NyAUAbieqYNeywmD7kiz4r2dC7+TxYQOm0Eij5N5X6rfss5DrnKthbbFX
         0S2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770313394; x=1770918194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ohb+oFC1mbgPld1c1rVcaRxKKHn/WerjH5KdHZYbAwI=;
        b=V2FYhWU+rADJOagkSqGOfUO2E/edQ5pK5MwLldb/dwq0aYYjhH+bxdkeDpZ6wVTqwL
         mpheB+FvdGksnuqEExz5VMH/44FpxwKozpxXEnlp3rQpJNKV82pzOApOuxDt/3Tdiciq
         q7k+YjE8ob5I5QDSN7GQFw4aXJ5GvgbucTZqpVntQApTDavxQaladE9pkIuYBjS/X0vo
         6pvXprPeZ+IE1qdJi8cMrHkk9oJoXTXBNYTRVUc6KM1Z/J9ou3yrcgYzkUxzeHoNKPZJ
         euxdXOo2whLQXsP4F43tDcqcvJxApWjdf/2roJc5d9YSorHIU0wEH459fqDV5goXCPj7
         3qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770313394; x=1770918194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ohb+oFC1mbgPld1c1rVcaRxKKHn/WerjH5KdHZYbAwI=;
        b=VCVQOuacwD6jmuH+/DHoR35a6o0nAHl4Hjm/uwRE8SxdLkmAz78D8UOQ/YL9UMugfs
         tKpbCYhKBjOEMDWe8CkJxSvYRcHHitzPQzft5FjFezHXQPYa8h4bt93qc999btQGtT5w
         J3R4+aw4ymIoFiP31OjlUXhboSQhD0rpYtdqoXMo6g95isZK5zqQy1FSFjkcalfIorG2
         aokIMdMC2iRvhRwNSAowWeE3Y5cXf/uqtdYKfB8yL2V/b0q0tnvX+COnuTFK2ICx+q7a
         NsarropVRQMnwi8ayYLGYlyHfxx73XA7EHMTuO18AYUYDzY0Da6nwa0ABAxI0CZTVw3G
         R46g==
X-Forwarded-Encrypted: i=1; AJvYcCXdZYFBAH/x6/A2WOIvPTJSOvl0T49b3woBYqnWSizBhu9kptZ0MyV9kK5/C/HLw2J2NopQ2rKlRHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8d+oOyOK7DkD2PajO11G5l9lMyd6gAB+MTogABugSyFd+pvJO
	NfFqjYw/zJo594F82uNSdN3u0HqkQ0uRc84sLMas2BkqYjSxgoL2sNOY2qYaGH+pt5r35zqsDOi
	EPcUcnOEcgQarTrlkAIgh2uIOeM5yEZWmdTgufQDP
X-Gm-Gg: AZuq6aKCjYfmRx3lrRa9KvxVAXxNCX9uoG0NATp+779KETQGmlWcWmeJkwe1aAGl12U
	ChF19ikjBLZ5tV1vEJB318MMtTxo7muhcX6AmSff+YrfAP/xTOcndMaIW4qdWITIilSpUwIbanT
	/8pu43FYVXZfoHdXhAY9hix9N6EfmK5GLCBVAsmvUeqKrQnx0kcnjV5/rEDHABmG75rZmlJw0+F
	8Ixwi/t+b5WsPRMjLBlb3q6DW7kN7sZOIwnJP16YyNW3z1y1va1kZeP0MYTtqMA7cPb6Mg=
X-Received: by 2002:a05:6402:510f:b0:64b:560e:41e2 with SMTP id
 4fb4d7f45d1cf-659634ab258mr56359a12.6.1770313394070; Thu, 05 Feb 2026
 09:43:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113225406.273373-1-jmattson@google.com> <aWbmXTJdZDO_tnvE@google.com>
 <CALMp9eTYakMk0Bogxa_GdGU5_h4PK-YOXcu-cSQ16m1QcusHxw@mail.gmail.com>
 <CALMp9eQx7EVim4iYGbAhoHrei2YmTra6oxtdmKaY7bw-M0PHbw@mail.gmail.com>
 <aYKoJ74MWboBuE_M@google.com> <CALMp9eSc=0zS+6Rk-c_0P-Q1Y8_9Xv58G5BYxieKpv_XaSj0wg@mail.gmail.com>
 <aYPvyMDipM9Z9Z7t@google.com> <CALMp9eR4trBDwgDnyEJmrHnStKnAMiRgehty=xu=NMnLVN2vtw@mail.gmail.com>
 <aYStVN5MyME-Pkwt@google.com>
In-Reply-To: <aYStVN5MyME-Pkwt@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Feb 2026 09:43:01 -0800
X-Gm-Features: AZwV_Qigg_-JCEjJmebwjFdGWMLQ6vwSO12veSukovsezN310bnQnkd0-q3_c9M
Message-ID: <CALMp9eT_uJZwO5AF-wWHFH1DnOKWjUtU2u9TCOs7=ZK8_xCx+w@mail.gmail.com>
Subject: Re: [PATCH] KVM: VMX: Add quirk to allow L1 to set FREEZE_IN_SMM in vmcs12
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:47=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Wed, Feb 04, 2026, Jim Mattson wrote:
> > On Wed, Feb 4, 2026 at 5:18=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > >
> > > On Wed, Feb 04, 2026, Jim Mattson wrote:
> > > > On Tue, Feb 3, 2026 at 6:00=E2=80=AFPM Sean Christopherson <seanjc@=
google.com> wrote:
> > > > >
> > > > > On Thu, Jan 22, 2026, Jim Mattson wrote:
> > > > > > On Tue, Jan 13, 2026 at 7:47=E2=80=AFPM Jim Mattson <jmattson@g=
oogle.com> wrote:
> > > > > > > On Tue, Jan 13, 2026 at 4:42=E2=80=AFPM Sean Christopherson <=
seanjc@google.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jan 13, 2026, Jim Mattson wrote:
> > > > > > > > > Add KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM to allow L1 to set
> > > > > > > > > IA32_DEBUGCTL.FREEZE_IN_SMM in vmcs12 when using nested V=
MX.  Prior to
> > > > > > > > > commit 6b1dd26544d0 ("KVM: VMX: Preserve host's
> > > > > > > > > DEBUGCTLMSR_FREEZE_IN_SMM while running the guest"), L1 c=
ould set
> > > > > > > > > FREEZE_IN_SMM in vmcs12 to freeze PMCs during physical SM=
M coincident
> > > > > > > > > with L2's execution.  The quirk is enabled by default for=
 backwards
> > > > > > > > > compatibility; userspace can disable it via KVM_CAP_DISAB=
LE_QUIRKS2 if
> > > > > > > > > consistency with WRMSR(IA32_DEBUGCTL) is desired.
> > > > > > > >
> > > > > > > > It's probably worth calling out that KVM will still drop FR=
EEZE_IN_SMM in vmcs02
> > > > > > > >
> > > > > > > >         if (vmx->nested.nested_run_pending &&
> > > > > > > >             (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBU=
G_CONTROLS)) {
> > > > > > > >                 kvm_set_dr(vcpu, 7, vmcs12->guest_dr7);
> > > > > > > >                 vmx_guest_debugctl_write(vcpu, vmcs12->gues=
t_ia32_debugctl &
> > > > > > > >                                                vmx_get_supp=
orted_debugctl(vcpu, false)); <=3D=3D=3D=3D
> > > > > > > >         } else {
> > > > > > > >                 kvm_set_dr(vcpu, 7, vcpu->arch.dr7);
> > > > > > > >                 vmx_guest_debugctl_write(vcpu, vmx->nested.=
pre_vmenter_debugctl);
> > > > > > > >         }
> > > > > > > >
> > > > > > > > both from a correctness standpoint and so that users aren't=
 mislead into thinking
> > > > > > > > the quirk lets L1 control of FREEZE_IN_SMM while running L2=
.
> > > > > > >
> > > > > > > Yes, it's probably worth pointing out that the VM is now subj=
ect to
> > > > > > > the whims of the L0 administrators.
> > > > > > >
> > > > > > > While that makes some sense for the legacy vPMU, where KVM is=
 just
> > > > > > > another client of host perf, perhaps the decision should be r=
evisited
> > > > > > > in the case of the MPT vPMU, where KVM owns the PMU while the=
 vCPU is
> > > > > > > in VMX non-root operation.
> > > > >
> > > > > Eh, running guests with FREEZE_IN_SMM=3D0 seems absolutely crazy =
from a security
> > > > > perspective.  If an admin wants to disable FREEZE_IN_SMM, they ge=
t to keep the
> > > > > pieces.  And KVM definitely isn't going to override the admin, e.=
g. to allow the
> > > > > guest to profile host SMM.
> > > >
> > > > I'm not sure what you mean by "they get to keep the pieces." What i=
s
> > > > the security problem with allowing L1 to freeze *guest-owned* PMCs
> > > > during SMM?
> > >
> > > To give L1 the option to freeze PMCs, KVM would also need to give L1 =
the option
> > > to *not* freeze PMCs.  At that point, the guest can use its PMCs to p=
rofile host
> > > SMM code.  Maybe even leverage a PMI to attack a poorly written SMM h=
andler.
> >
> > Perhaps I'm missing something. I was thinking, essentially, of a logica=
l or:
> >
> > vmcs02.debugctl.freeze_in_smm =3D vmcs12.debugctl.freeze_in_smm |
> > vmcs01.debugctl.freeze_in_smm
> >
> > So, an L1 request to freeze counters in SMM would be granted, but an
> > L1 request to *not* freeze counters could be overruled by the host.
>
> /facepalm
>
> Sorry, I misunderstood what you were suggesting.  Not sure how, it's supe=
r obvious,
> at least in hindsight.

My bad. I should have been more explicit (or maybe I should have just
omitted the aside).

> > I'm not suggesting this in the context of the legacy vPMU, because
> > some PMCs may be counting host-initiated perf events, and L1 should
> > not have any say in what those PMCs count. However, with the mediated
> > vPMU, L1 owns the entire PMU while L2 is running, so it seems
> > reasonable to allow it to freeze the counters during physical SMM.
>
> Agreed.
>
> > > In other words, unless I'm missing something, the only reasonable opt=
ion is to
> > > run the guest with FREEZE_IN_SMM=3D1, which means ignoring the guest'=
s wishes.
> > > Or I guess another way to look at it: you can have any color car you =
want, as
> > > long as it's black :-)
> >
> > I would be happy with FREEZE_IN_SMM=3D1. I'm not happy with the host
> > dictating FREEZE_IN_SMM=3D0.
>
> Yep, make sense.

Perhaps we should ignore both L0 and L1, and arbitrarily set
FREEZE_IN_SMM=3D1 for both vmcs01 and vmcs02 when MPT is enabled. But, I
don't think that discussion should block the resolution of this quirk.
I'll try to send v2 out later today.
