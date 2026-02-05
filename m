Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0404B156677
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770264732; cv=pass; b=e2fODYFz2YOSQFLg+6BiX4mkUiQR81MdCh8+IH3xRjVkE5NikoDvf00XcZidyk5sWcq8u9LBDUskqRsZDTZ0zMU/y6rM2BANrnpEpIE9sxPIQHRVwVroyroVVn+j38GjfZMemAq9cbEt8Pcz11VKCtAXS/l+UipCgnW/82ZFzz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770264732; c=relaxed/simple;
	bh=iHv3eVZ4uKQEnCsixa8y4B/vLhRYUmz/8FIeHb+C3QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUmYTVE0SbDN6DKHN9KG2bfrMrEqln07uSiiBQLvZTcxD7OxaxmhZF2V7jItAPdjIdtBlSGgIqsg9zR1kLrVMxO7CWwLY9YE1Pb7wnwAhpTCcbq5kWun3cbdE8tdUrH42vJHsOrUYcovMDL1Ge2GIPA0BaiV6DF6yUN4pKvQDKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VR935B40; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VR935B40"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so3717a12.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 20:12:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770264730; cv=none;
        d=google.com; s=arc-20240605;
        b=MiUiNKImmVgYZulkMRKyoUE7gET9Dn6BlTgpFok+Q2JEh23ajGk107dJZ4Vm10MkB8
         SvxzMFLAhhT/8IJfaFnIra1361tnSLuSdaHpcOKMaVr/AgvKXmipC1Tc35i+NUn4DbRt
         UEMP51/tBYyLJf/qjhKFXIHHs4/Pob9te6E4JGUp0ZTssKSLvgS2XqJfXeXYk6SqrMHz
         HqI1seQ82jfxS1UnHNqpARWFV7wYkMiwPoroOtNXCDjE9wxA99sKdsX6loiK+tlTdkqt
         T5I+RRdNo9e4WdHPCGOeSvyq5FLgwVE/rmjSyteNWl8FJ4m6MgZQB5YZqd4EG6qza08x
         niGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ICuQy7A+pz8n4uIx9cAJ+hnxhishMNCKfdmmi6Or3XQ=;
        fh=GjSsyLfzf6tK9G0CMwpAOagiJRNLwgMucVp244BQeOQ=;
        b=jri3VX0MG6I76wyXRZyLMUZdMmIbHQdqkWF4VLnrZBgJ95ogmiz/fDC+iNvpoSyuvM
         1FbOXduucN/lit2CyM5hUqZWYU3cSDSVOfSsQcKOGjum6vVLD54L432ESdZllK6G+n/m
         Iw7Dq/3Po5Exrjn6fnmfPSp3h1RIpdOTtwIKnbyyRRiayXkqTEQtLnjeXNbapQNBQazh
         UGJd4/FI6lKMyvh/+q+32EdZuy/9wviQea9McoUlKSDZG8TlpSuTF0y1zq48/q4lQUW2
         K9g9zUqN+0SayN/j9PbAV0ip/nFUJsDcS49RTK14/xINau17nDAhSmeOfSQK7corbXme
         d7hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770264730; x=1770869530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICuQy7A+pz8n4uIx9cAJ+hnxhishMNCKfdmmi6Or3XQ=;
        b=VR935B40t49/OEw8tjlQgRRex6rXoo9ezw1nnj4BbNEkaCLca27lWZwfOs6pwRd8Pb
         evki0mBw9+1RoZdsoNCTITCCV0v/XRrtdl7ipL/guJGBjVu1w3tJ1Pjzws7ClgT6/wJQ
         TmM/x8DjG4htW3DKcXjz04HMw8ZuNgIASrCeaXuTUbrMgqsonCxtUvBqItRH8kpQffyz
         n+bSA6IIgSZ2TOJUzGAHNt0mME9iY0G6FkusW+dwli7R10vu4WO1/Cw4XSywy1d1Wx1D
         JU92TOkQ5/0gEET8SUAdR/6HfYmN6qPH3iDtnWKZj7iuRQUeWhtVt48uL4wM6KckkQk/
         HTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770264730; x=1770869530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ICuQy7A+pz8n4uIx9cAJ+hnxhishMNCKfdmmi6Or3XQ=;
        b=hx30CFfk4I+sG3W0O5WF6yOqkAhIwSYtD3+PbBLyiuncqy6OML6sQ2CwjGYhfNQ8n7
         K9rtjImAm5D2grDwgbqoFE8mTuRCUqwqcGwWkzVzNXzXZPNXlytvFAHT2glS8xO+94ad
         QXJDqd8td9mRh0W2fg9K4EhCvQnxFux0B9T74JeNYdLhp1xeM9DOe5bcF/0B5Uw8Pjlk
         LbcAkeasniEhgnXIZHTp5eucBi5iLpeJaVjoD3mt2WLVbA9hLWkNuzSioVdtX0jfN/+U
         ntbMepp10Uu1hhKE1L0fN+D/AHGCiT3BYGRTzfNo17z4+2OyPfam3EZFFx+gtGqDPdKk
         +cCw==
X-Forwarded-Encrypted: i=1; AJvYcCXUNfgek1oHiYhpDvqHBxLc0ZD5CUK+ec2etsyHoIc/bHrssx68L2dWR5EhUlg4Q0tQ7H6B5uydVPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPkYWtvULakBI1AuBUD6jc4QRQjYapH983ViJW83kwmUtIWya
	YMtGT+AUPFpWHVAeSNDu3lzHk3+T8K6vloSl0H5KuPy/B/11r7zOSBACxFVQTiHESUiwuXL0JMc
	HRObNYsYWsahH3cXbYoRgRbpxeFVxGV8NO2vpNe5d
X-Gm-Gg: AZuq6aIEMir/uYTZM6lqXJamCmEWfeocPAYtDgFtBxAoO1glrcLXt5RwDZtopTD3Oms
	I0xj6NB3bDZnqN90bovZMIixdlxVVe/MEc2uv02FnjdIVWGXOqPJTIZZgYPuLY7XTvAj049cX+H
	TBw/7RVYVKcKABcgcvLqSC3RlW0+OPHXf19bsChXczO6NbnnKfkKyrGrApPhEFImqAdoOB08/ti
	HXCHVnlVd+gNCMHyhT1qpBqcKeB2M4TXPYFwZt8iLaCG1xlv4RHd7H0U0DLff9tb77d2w0=
X-Received: by 2002:a50:fb99:0:b0:649:8aa1:e524 with SMTP id
 4fb4d7f45d1cf-65965ebe482mr10226a12.11.1770264730115; Wed, 04 Feb 2026
 20:12:10 -0800 (PST)
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
 <aYPvyMDipM9Z9Z7t@google.com>
In-Reply-To: <aYPvyMDipM9Z9Z7t@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 4 Feb 2026 20:11:57 -0800
X-Gm-Features: AZwV_Qhrwh_pA1gXlaRFSMVmwpj18Td64_tdGrDJiNzY-mtZF0eo8OUjw8uOEFA
Message-ID: <CALMp9eR4trBDwgDnyEJmrHnStKnAMiRgehty=xu=NMnLVN2vtw@mail.gmail.com>
Subject: Re: [PATCH] KVM: VMX: Add quirk to allow L1 to set FREEZE_IN_SMM in vmcs12
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 5:18=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Wed, Feb 04, 2026, Jim Mattson wrote:
> > On Tue, Feb 3, 2026 at 6:00=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > >
> > > On Thu, Jan 22, 2026, Jim Mattson wrote:
> > > > On Tue, Jan 13, 2026 at 7:47=E2=80=AFPM Jim Mattson <jmattson@googl=
e.com> wrote:
> > > > > On Tue, Jan 13, 2026 at 4:42=E2=80=AFPM Sean Christopherson <sean=
jc@google.com> wrote:
> > > > > >
> > > > > > On Tue, Jan 13, 2026, Jim Mattson wrote:
> > > > > > > Add KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM to allow L1 to set
> > > > > > > IA32_DEBUGCTL.FREEZE_IN_SMM in vmcs12 when using nested VMX. =
 Prior to
> > > > > > > commit 6b1dd26544d0 ("KVM: VMX: Preserve host's
> > > > > > > DEBUGCTLMSR_FREEZE_IN_SMM while running the guest"), L1 could=
 set
> > > > > > > FREEZE_IN_SMM in vmcs12 to freeze PMCs during physical SMM co=
incident
> > > > > > > with L2's execution.  The quirk is enabled by default for bac=
kwards
> > > > > > > compatibility; userspace can disable it via KVM_CAP_DISABLE_Q=
UIRKS2 if
> > > > > > > consistency with WRMSR(IA32_DEBUGCTL) is desired.
> > > > > >
> > > > > > It's probably worth calling out that KVM will still drop FREEZE=
_IN_SMM in vmcs02
> > > > > >
> > > > > >         if (vmx->nested.nested_run_pending &&
> > > > > >             (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CO=
NTROLS)) {
> > > > > >                 kvm_set_dr(vcpu, 7, vmcs12->guest_dr7);
> > > > > >                 vmx_guest_debugctl_write(vcpu, vmcs12->guest_ia=
32_debugctl &
> > > > > >                                                vmx_get_supporte=
d_debugctl(vcpu, false)); <=3D=3D=3D=3D
> > > > > >         } else {
> > > > > >                 kvm_set_dr(vcpu, 7, vcpu->arch.dr7);
> > > > > >                 vmx_guest_debugctl_write(vcpu, vmx->nested.pre_=
vmenter_debugctl);
> > > > > >         }
> > > > > >
> > > > > > both from a correctness standpoint and so that users aren't mis=
lead into thinking
> > > > > > the quirk lets L1 control of FREEZE_IN_SMM while running L2.
> > > > >
> > > > > Yes, it's probably worth pointing out that the VM is now subject =
to
> > > > > the whims of the L0 administrators.
> > > > >
> > > > > While that makes some sense for the legacy vPMU, where KVM is jus=
t
> > > > > another client of host perf, perhaps the decision should be revis=
ited
> > > > > in the case of the MPT vPMU, where KVM owns the PMU while the vCP=
U is
> > > > > in VMX non-root operation.
> > >
> > > Eh, running guests with FREEZE_IN_SMM=3D0 seems absolutely crazy from=
 a security
> > > perspective.  If an admin wants to disable FREEZE_IN_SMM, they get to=
 keep the
> > > pieces.  And KVM definitely isn't going to override the admin, e.g. t=
o allow the
> > > guest to profile host SMM.
> >
> > I'm not sure what you mean by "they get to keep the pieces." What is
> > the security problem with allowing L1 to freeze *guest-owned* PMCs
> > during SMM?
>
> To give L1 the option to freeze PMCs, KVM would also need to give L1 the =
option
> to *not* freeze PMCs.  At that point, the guest can use its PMCs to profi=
le host
> SMM code.  Maybe even leverage a PMI to attack a poorly written SMM handl=
er.

Perhaps I'm missing something. I was thinking, essentially, of a logical or=
:

vmcs02.debugctl.freeze_in_smm =3D vmcs12.debugctl.freeze_in_smm |
vmcs01.debugctl.freeze_in_smm

So, an L1 request to freeze counters in SMM would be granted, but an
L1 request to *not* freeze counters could be overruled by the host.

I'm not suggesting this in the context of the legacy vPMU, because
some PMCs may be counting host-initiated perf events, and L1 should
not have any say in what those PMCs count. However, with the mediated
vPMU, L1 owns the entire PMU while L2 is running, so it seems
reasonable to allow it to freeze the counters during physical SMM.

> In other words, unless I'm missing something, the only reasonable option =
is to
> run the guest with FREEZE_IN_SMM=3D1, which means ignoring the guest's wi=
shes.
> Or I guess another way to look at it: you can have any color car you want=
, as
> long as it's black :-)

I would be happy with FREEZE_IN_SMM=3D1. I'm not happy with the host
dictating FREEZE_IN_SMM=3D0.
