Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED761A4E70
	for <linux-doc@vger.kernel.org>; Thu, 28 Aug 2025 23:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756423929; cv=none; b=hhzlr52gmtV7zuFjEHq50rLwVA8Dkd7Yvj2Ik3KE8EcekcwX2Ety8sVJk/UkAlXvprJgHQhyl6+/irmPvKz/2HHdJsoUTFEPKIYF61YT9PnPb0V4s7xBSvCJspCL9S2MUkgbf/jAEgVL+28Ckcn4gaRnZpySN4YnZNSv1L0D/ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756423929; c=relaxed/simple;
	bh=9vDtAA4+lwAqsGeIXMf7YE8I/fa3B0bsI9jCNNLIt8U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NJSKoF/gtBidFtvuAJsofcNKVOFMsRK4u5QSyFeiFYblthr7jKkwXJZRR31HDLtCN3ypcHwdA27Wo1OZnn0vH+hzPyxbIMYt6o4LireCTRnfEgZqBNd3uO2yiRDSU/m3EBlrNyx/a2QhBUdLEZRW3RWipwaoZ+TC7tfZupQd1oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L/xo1I/7; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L/xo1I/7"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-327a60cef33so1427116a91.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Aug 2025 16:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756423927; x=1757028727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3s7x7ZntxOINAcUHXGWjzDAQ0CfG/hBAnbKE7u0wyBQ=;
        b=L/xo1I/7042o+809zRrzUzKV02EmsAF40b0ezgi9lXASqIkwiRDXLpc4gEHRLdpngN
         cRrm3N8CFO1IRiMGMu8OIJT82PJylO8xv+t+oirA52jjhf+OqTngIBlrWSe5wb0iCZXu
         IEuSM96c/fO8P77JPLNATfpEKstrupjcQ5Nzgeh4J9SbQlcPE5lzkhss0WO6yY4i7CjM
         o7w8n3cuGSpUo1QObyVwP+dpWzIH7omyfmgN3SFoAta7U9tz2BQHcpAmsksYiGgwkh4H
         mLtks7ewSJs1yQ0lvvmwLYzja1djo4QhnIDM4c8yzDy9Ue/+M7kgS5ujb/MOkjiDow1a
         wHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756423927; x=1757028727;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3s7x7ZntxOINAcUHXGWjzDAQ0CfG/hBAnbKE7u0wyBQ=;
        b=UoQDrOTITH7cy2mQ2ER1/FBoiMmP07pv97npc6C7j1IvEKXz8/oJiXXoELO6SfeX91
         LwC/0TXg6xV1hg1OujSVFPtTr87w1MeI0Dc0ETRiVsiqXkIYpr1kIb7uJwjHK0sg8ZCG
         QSZBbZHGgfQfL297QFE/wCoI+SE04Z8N0uqqmidSrkZVBJnen6kAPodtsyok/whIWZwn
         0LqWWVJalhnBYGI5aPiXpXLtAHyNZeoabg/EPPJAD6i8RbYOud8YIkB6j6MF4Q6RGqy1
         fWNupYgxZgfroH0ASWxMjpKZpzdVTDokmj3Eo0IJfwqkPI19AGABNu0L8Vgj98PTue/u
         zDEw==
X-Forwarded-Encrypted: i=1; AJvYcCUCAK6t5U0Bi5K0GgAmoinoTPMPAthPawGevK7UD0cboR/85Y8Plz/UGJkwb8tKQe76J5OXLmxBiYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy62IsgAf/Fqn7RQjhk5jMFzQqMT5i/RN+z/FdCNQTmETF4Knb9
	cACtZaDeqqevQL4qBKtQUnfgxezS4RAtt/tFp/uPFnoxCm30XvHFIZMSUb7ifcQHAxVNRBiT5Xp
	jH0qFKQ==
X-Google-Smtp-Source: AGHT+IGm5PXVW+/HSToHQbcSx7l89Pa+l1pX/Blng7NNUGGHaw1L2hsscDZ5/k8V2r1pcR+kt4QrfsU6X7A=
X-Received: from pjx8.prod.google.com ([2002:a17:90b:5688:b0:327:5037:f8c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:518c:b0:325:9829:db4f
 with SMTP id 98e67ed59e1d1-3259829dde3mr23072750a91.21.1756423926905; Thu, 28
 Aug 2025 16:32:06 -0700 (PDT)
Date: Thu, 28 Aug 2025 16:32:05 -0700
In-Reply-To: <77076b24-c503-40e8-9459-ede808074f0f@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250821223630.984383-1-xin@zytor.com> <20250821223630.984383-7-xin@zytor.com>
 <2dd8c323-7654-4a28-86f1-d743b70d10b1@zytor.com> <aK340-6yIE_qujUm@google.com>
 <c45a7c91-e393-4f71-8b22-aef6486aaa9e@zytor.com> <aK4yXT9y5YHeEWkb@google.com>
 <5b1c5f80-bbe1-4294-8ede-5e097e8feda1@zytor.com> <77076b24-c503-40e8-9459-ede808074f0f@zytor.com>
Message-ID: <aLDm9YID-r5WWcD9@google.com>
Subject: Re: [PATCH v6 06/20] KVM: VMX: Set FRED MSR intercepts
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, chao.gao@intel.com, 
	hch@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025, Xin Li wrote:
> On 8/27/2025 3:24 PM, Xin Li wrote:
> > On 8/26/2025 3:17 PM, Sean Christopherson wrote:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!kvm_cpu_cap_has(X8=
6_FEATURE_SHSTK))
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 wrmsrns(MSR_IA32_FRED_SSP0, vmx->msr_guest_fred_ssp0);
> > > FWIW, if we can't get an SDM change, don't bother with RDMSR/WRMSRNS,=
 just
> > > configure KVM to intercept accesses.=C2=A0 Then in kvm_set_msr_common=
(), pivot on
> > > X86_FEATURE_SHSTK, e.g.
> >=20
> >=20
> > Intercepting is a solid approach: it ensures the guest value is fully
> > virtual and does not affect the hardware FRED SSP0 MSR.=C2=A0 Of course=
 the code
> > is also simplified.
> >=20
> >=20
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0case MSR_IA32_U_CET:
> > > =C2=A0=C2=A0=C2=A0=C2=A0case MSR_IA32_PL0_SSP ... MSR_IA32_PL3_SSP:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!kvm_cpu_cap_has(X86_F=
EATURE_SHSTK)) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WA=
RN_ON_ONCE(msr !=3D MSR_IA32_FRED_SSP0);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vc=
pu->arch.fred_rsp0_fallback =3D data;
>=20
> Putting fred_rsp0_fallback in struct kvm_vcpu_arch reminds me one thing:
>=20
> We know AMD will do FRED and follow the FRED spec for bare metal, but
> regarding virtualization of FRED, I have no idea how it will be done on
> AMD, so I keep the KVM FRED code in VMX files, e.g., msr_guest_fred_rsp0 =
is
> defined in struct vcpu_vmx, and saved/restored in vmx.c.

The problem is that if you do that, then the handling of MSR_IA32_PL0_SSP t=
akes
completely different paths depending on vendor, theoretically on hardware, =
and
on guest CPUID model.  That makes it _really_ difficult to understand how P=
L0_SSP
is emulated by KVM.

And I actually think that's moot anyways.  KVM _always_ needs to emulated M=
SR
accesses in software, and the whole goofy PL0_SSP behavior is a bare metal =
quirk,
not a virtualization quirk.  So unless AMD defines different architecture (=
which
is certainly possible), AMD will also need arch.fred_rsp0_fallback.

> It is a future task to make common KVM FRED code for Intel and AMD.

No, this is not how I want to approach hardware enabling.  KVM needs to gua=
rd
against false advertising, e.g. ensure likely-to-be-common CPUID features a=
re
explicitly cleared in the other vendor.  But deliberately burying code that=
's
vendor agnostic in whatever vendor support happens to come along first isn'=
t
necessary by any means, and is usually a net negative in the grand scheme, =
and
often in a big way.

E.g. in this case, if arch.fred_rsp0_fallback ends up being unnecessary for=
 AMD,
we probably don't even need to do anything, KVM will just have a field that=
's
only used on Intel because the quirky scenario can't be reached on AMD.

But if we bury the code in VMX, then the _best_ case scenario is that KVM c=
arries
a weird split of responsibility in perpetuity (happy path handled in x86.c,=
 rare
sad path handled in vmx.c).  And the worst case scenario is that we carry t=
he
weird split for some time, and then have to undo all of it when AMD support=
 comes
along.  Actually, the worst case scenario is that we forget about the VMX c=
ode
and re-implement the same thing in svm.c.
