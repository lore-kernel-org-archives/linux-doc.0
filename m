Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32052D94A3
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 21:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117217; cv=pass; b=dp5hidYcoaI3PcBWSxNP+C+pi22pFASNCtDsc+mdlJrBhjrPvdGbwU+nii2HKIQUrnAySUk6InuG4qOD/UqyTiywOXjaWBHOra5KQ+h8kKcpkrJltCRiiFFBbBLs2RJDLSkxibtWFynvkspX65oEKWnLypL8Vnuog0IO6ql0ito=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117217; c=relaxed/simple;
	bh=BC8nFTG86vfd/JV3Ur3Vnv61JQ8TQGgb2hnHokTdwfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMcbDBF28+wkL61X3bAgJiKYk74VgYUx44t6PopWkLX5f+UzAHq7CofBJmIo+n/NBzYyzfjjy6KVGU6tpaeoU05MtdW/TbyKYIp+LFhxxNi7jh04FIYOatvxlEib3uTToxd6VDbTaZkt+rxtjRxBcnhTpI+UAiAMIL396K+MaLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BCJ0AjLn; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BCJ0AjLn"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so3158a12.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 13:26:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769117205; cv=none;
        d=google.com; s=arc-20240605;
        b=UjgWUdozMmLz/rVD6gbcWz9stTELJobOyjkxXpsmWkk+1HukjM+nopyszcRns43BC7
         jYZSK4ECnVcqZKMsSb5ns20qVfG/OA5F4SmrKP4/AXRKHhCUggUWEVLhLsmtu2BcX49n
         siXAZ79exdLaE4dfNxNH9i4+h215e/X+75qR2ngHLOmhveNT0yKJj/srW43Yp0hh2Xy2
         UbzQP4hiLeuYhgL0szdobGDuqP1IPhVkhrb51uluRmicBABpPqhyTIS0D2E4S5M/q9x2
         paKxZB9qNF2H/t5EoXp1ZU93kLnuLJ77JbhDx/bhTpXZwGa6pQZdCxuA5nWmU4M7ubNf
         o3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/+D/s4bwsqNNaSjIaXHNf2UcfLo5UUZymlR0tqKlbQ=;
        fh=94gqPYU+WkrsW6OCwajwT3pRT0gtrTn4D1CmxEmpbgg=;
        b=eL0GTJJGiy4OnT7/jJobdioS+OVf76GjXorb3FBYJGxW8r9iRZ4Yn4HxdgVskXpW4h
         7wrFzXyytMYU76uiuK2G+wG7Pq+vC+zoLP5nFKrhx1KR5VPFrY9W1tlKOTNpTu3FfPMy
         RGIihLGRU8Ae3JQgbEfAYpq/Q6FW7vN/SLec8OhffK/hSP7g/g+mXKleyYC1SX1eo6to
         fr/OWhDFaZ/z4NOyRGPQ1Cu9Fxs+ropnqoP8fX0hYyauTgRcR09gzCNVnhkRInUh3uTu
         mcAR8VxGpZ7yuUHotEi+7rsLlWgewwId+zoofwZ8uEnYDIBrrZd2bJ+c1YmLs0nFdkE/
         JK4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117205; x=1769722005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/+D/s4bwsqNNaSjIaXHNf2UcfLo5UUZymlR0tqKlbQ=;
        b=BCJ0AjLn3+m4uTzW+3XHgZBfCM+s/Cdo4me9s8vFGRnzyWkS21yZBz2RJqPFJljAc1
         DXO93QcdFh7XW3k9p6DPz+k3W4qx5NNtpdU1arYFW6y/P+CtpRs2xsqezHnLtmYZ3RZi
         GmY9WLZdG8FSGvbnt6/kyEJNQbqpiuY+seIb2HpR53l9K9QjNAnt+PkmAUwWyQlf2A7J
         JytiEWoBrQqaQKpYS36u9WORYuP73TfbRczcUX4PPlPdQ+0zjTqpMA5JR4taiFYXk+x/
         atV0APikoAFqQhpWuaKgfp/f6Yj4iug6w0b2sKeKx5Uj3t8qtyzud4O71a/nchQcWdi7
         hsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117205; x=1769722005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/+D/s4bwsqNNaSjIaXHNf2UcfLo5UUZymlR0tqKlbQ=;
        b=AP2tiWnkfYg2l1RThfLKtNuMEyGW1FgDKEEAHgg4i8+pdibEj5SBfeWsVCxcxDLYT2
         GF5IpPYqMDtePpExG9G6k4gPDsWj1ZHuq8jw0lbZSIjUBLqkcVZ+hOrK5mhII2g/14+Z
         sWk1mVZH7wZ5dS/yvdxi6b4Rad545Opol2pjCQSud+0ccdHX1RElf1v7NznOnvuTWDFS
         qe0KS4h/MoeHs720d9FN5/LAaUiNTtVSTf8Goa9YAuYA1iY67u6arM7Z2NToYZ4Qvsdy
         KptyRdeFA43dwcfIx/85B5uGPAKb3xiN0WXhgM8kCO2OA10KYZSe/gd5uS9OCW6S5Fpr
         wh2w==
X-Forwarded-Encrypted: i=1; AJvYcCUHkD3VSXfk9pNnSPTilwHLalOSZI6FVu+PG5eOv8riGh+hEWuFVJ6RuMbLh6J2A29hb9oZmT8JRak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyPt7eNgJj+UA3PY7xUFMdfbBh1eFrKniyJnMhYaeyCgFJcJZF
	rR0SocrOcZQJGlePSOlseWAZB1ic8hpl+VMUY6BQcF7HzhxKBmTlsIg1WzxzP9L4E0dpo7KWxtP
	LOm8zslvhLVRnrCIITNia3CKNvYOMzwBW2c0Y4fso
X-Gm-Gg: AZuq6aK7kcDbiMFBjCYzpYrLyPW1wJakgCiyn9F/JdVQcrVabUNJ0JZlE206l4GOtsC
	E5hatikiAJsPiDKtdsoC8+AajLKfuXG7/qKTgvHK1J5D7Stq9YhTXeMAu2QOvN/NrY2D+fDObD5
	NIbtgAZd/6/1iB6XmoBBr5E0aLzh9wuh3wmuG92qQNFk0tbhd1HH1X8HeENQiHyfc0ekC5LxSh1
	XvettxjFR1jNMsw+5Arhd+hk3OzxPdQwv8JgY6/zKi3UUDtRwIQEPwi0gWjf3h61P+J7COFoFWI
	n0LT3A==
X-Received: by 2002:aa7:c606:0:b0:658:e7a:6fa7 with SMTP id
 4fb4d7f45d1cf-6584bfcad65mr10888a12.4.1769117205288; Thu, 22 Jan 2026
 13:26:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113225406.273373-1-jmattson@google.com> <aWbmXTJdZDO_tnvE@google.com>
 <CALMp9eTYakMk0Bogxa_GdGU5_h4PK-YOXcu-cSQ16m1QcusHxw@mail.gmail.com>
In-Reply-To: <CALMp9eTYakMk0Bogxa_GdGU5_h4PK-YOXcu-cSQ16m1QcusHxw@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 22 Jan 2026 13:26:32 -0800
X-Gm-Features: AZwV_QhQTOem4BLVo53HKT58urNX60REF_SUeJPvF_yxD4XbcC-SDKdt9bRc4xc
Message-ID: <CALMp9eQx7EVim4iYGbAhoHrei2YmTra6oxtdmKaY7bw-M0PHbw@mail.gmail.com>
Subject: Re: [PATCH] KVM: VMX: Add quirk to allow L1 to set FREEZE_IN_SMM in vmcs12
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 7:47=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> On Tue, Jan 13, 2026 at 4:42=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Tue, Jan 13, 2026, Jim Mattson wrote:
> > > Add KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM to allow L1 to set
> > > IA32_DEBUGCTL.FREEZE_IN_SMM in vmcs12 when using nested VMX.  Prior t=
o
> > > commit 6b1dd26544d0 ("KVM: VMX: Preserve host's
> > > DEBUGCTLMSR_FREEZE_IN_SMM while running the guest"), L1 could set
> > > FREEZE_IN_SMM in vmcs12 to freeze PMCs during physical SMM coincident
> > > with L2's execution.  The quirk is enabled by default for backwards
> > > compatibility; userspace can disable it via KVM_CAP_DISABLE_QUIRKS2 i=
f
> > > consistency with WRMSR(IA32_DEBUGCTL) is desired.
> >
> > It's probably worth calling out that KVM will still drop FREEZE_IN_SMM =
in vmcs02
> >
> >         if (vmx->nested.nested_run_pending &&
> >             (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS))=
 {
> >                 kvm_set_dr(vcpu, 7, vmcs12->guest_dr7);
> >                 vmx_guest_debugctl_write(vcpu, vmcs12->guest_ia32_debug=
ctl &
> >                                                vmx_get_supported_debugc=
tl(vcpu, false)); <=3D=3D=3D=3D
> >         } else {
> >                 kvm_set_dr(vcpu, 7, vcpu->arch.dr7);
> >                 vmx_guest_debugctl_write(vcpu, vmx->nested.pre_vmenter_=
debugctl);
> >         }
> >
> > both from a correctness standpoint and so that users aren't mislead int=
o thinking
> > the quirk lets L1 control of FREEZE_IN_SMM while running L2.
>
> Yes, it's probably worth pointing out that the VM is now subject to
> the whims of the L0 administrators.
>
> While that makes some sense for the legacy vPMU, where KVM is just
> another client of host perf, perhaps the decision should be revisited
> in the case of the MPT vPMU, where KVM owns the PMU while the vCPU is
> in VMX non-root operation.
>
> > > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > > index 0521b55d47a5..bc8f0b3aa70b 100644
> > > --- a/arch/x86/kvm/vmx/nested.c
> > > +++ b/arch/x86/kvm/vmx/nested.c
> > > @@ -3298,10 +3298,24 @@ static int nested_vmx_check_guest_state(struc=
t kvm_vcpu *vcpu,
> > >       if (CC(vmcs12->guest_cr4 & X86_CR4_CET && !(vmcs12->guest_cr0 &=
 X86_CR0_WP)))
> > >               return -EINVAL;
> > >
> > > -     if ((vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS) =
&&
> > > -         (CC(!kvm_dr7_valid(vmcs12->guest_dr7)) ||
> > > -          CC(!vmx_is_valid_debugctl(vcpu, vmcs12->guest_ia32_debugct=
l, false))))
> > > -             return -EINVAL;
> > > +     if (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS) {
> > > +             u64 debugctl =3D vmcs12->guest_ia32_debugctl;
> > > +
> > > +             /*
> > > +              * FREEZE_IN_SMM is not virtualized, but allow L1 to se=
t it in
> > > +              * L2's DEBUGCTL under a quirk for backwards compatibil=
ity.
> > > +              * Prior to KVM taking ownership of the bit to ensure P=
MCs are
> > > +              * frozen during physical SMM, L1 could set FREEZE_IN_S=
MM in
> > > +              * vmcs12 to freeze PMCs during physical SMM coincident=
 with
> > > +              * L2's execution.
> > > +              */
> > > +             if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_VMCS12=
_FREEZE_IN_SMM))
> > > +                     debugctl &=3D ~DEBUGCTLMSR_FREEZE_IN_SMM;
> > > +
> > > +             if (CC(!kvm_dr7_valid(vmcs12->guest_dr7)) ||
> > > +                 CC(!vmx_is_valid_debugctl(vcpu, debugctl, false)))
> >
> > I'm mildly tempted to say we should quirk the entire consistency check =
instead of
> > limiting it to FREEZE_IN_SMM, purely so that we don't have to add yet a=
nother quirk
> > if a different setup breaks on a different bit.  I suppose we could lim=
it the quirk
> > to bits that could have been plausibly set in hardware, because otherwi=
se VM-Entry
> > using L2 would VM-Fail, but that's still quite a few bits.
> >
> > I'm definitely not opposed to a targeted quirk though.
>
> I have no preference.
>
Sean -

Would you like me to post a v2?
