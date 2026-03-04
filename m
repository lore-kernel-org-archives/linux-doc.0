Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A426FA5A
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641415; cv=none; b=mazRDgI5O2hbCSgu6l+7bRDfs8GZ4gVFTc7DEUfv8NiqGKVQggRImjmz5pGWWku+gr++e6Vxa9QbyYAJ9tOmVqX9IYdeB/C0X9mhEcQIfIkWppRzxtlcgsIzT2cY2roTdYTsaJy0goL5161gvEDc9OULefJABAHS8AgmMCPzKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641415; c=relaxed/simple;
	bh=+59wknHGTRW+W9SSh+h7PF3GSLLzGVapIaIAou5Ber0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A/qGGAxkbRHP31z6G+kd2JlPydi74nwxjSAa9+lkALAK5Q0RWn8X4TUJdqhRrkG7OVNnEIo3knELBiWCxwF8MPDYDOyYtGtqQWQmzzv9lBEX/A0u/tXHvP3/kaoX+PG4beTcY2wtOilHDijYWTt/+vB+3q7HXa46sSySRUAcVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qttMyaJY; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qttMyaJY"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae57228f64so33020355ad.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 08:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772641414; x=1773246214; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yrzSKo5+wXzomm7lL9SdcMFqNMmtfJshxUqsLyJWiLk=;
        b=qttMyaJYEkbbGPVshz/281IVwU/9Xus572XoR7cZ/lJhVdLZwGGGo0qSNqOi7zd+kO
         8dxI/FIHnMJYBd64NhGYhgGdTB2O7L0RhpejDVKzVeMyCou2bfPsuoZDKdZsQ+Dv/lVS
         mLunqPQAYUupxi/U/PmgW5EowL9CQKCqarelt4pb2Aoche0PNojPzSaRVE0ZeeZFcK7K
         uVa4u6OQF/hZMowLwsxmU3VBwL3Fk0xqP+Mat9Kgn1Dff5KvYA4gDwlHplL9GMM9gS0f
         SS+QSWGs28kxsys8+SYuYOLO5rsricW3+MH7T8ovNGXhVmvy66/nyXOqFEEHhcIC9h3R
         l0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772641414; x=1773246214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrzSKo5+wXzomm7lL9SdcMFqNMmtfJshxUqsLyJWiLk=;
        b=vBbtXllR1JjPwEfh5g/+kG/XIUxaaud7T35TUQ25wH/B2Zkb2U5DAJcz8XCA6N9Y/b
         DfaJjV8/n0kab49UVcGOTxBaRqnBUU0j6omzp+G5A0vDfAmNY0uv8IqXt8yJyk8FhTrW
         7EtsnDJIzucwMkrB3fnsruGP68kJQ9WMmE0mc1eX6qk0N4hZgLh5Y3LJaOD1UcW3nJbI
         6HkoG9yetIo9qkBgXDjbr3dbd9CikpkYoAHQulCb/Dw3DUZnkt10Qns58Un9VdZxBuRU
         LZ4OLqYne0EdyiUZQk5NrUpJfCwojs+dw34mIg8DIqjkVtRzAzIX3qKGJoC2XXDOeM7m
         Kq6w==
X-Forwarded-Encrypted: i=1; AJvYcCVVgJWeKBkst5OnFNIq6hPaXp3ERLMJl3bxl4v8Jzi825TBxWqc/ZfhxVxJdoFqnUPj2Arsstms+Z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhP+vMwEV+qEstT6l337gm4un/AKYzhMg6FEX3KvFrMftZ7HHn
	3LIpYF6bnpMyoC/kd5+9NFJ7j3yxWeUf2VZTOvopGMc3xOOlixdabAW5n/HcC+KPEQ0IBgx6cMl
	zwXtXww==
X-Received: from play21.prod.google.com ([2002:a17:902:e195:b0:2ae:5075:50d4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b4f:b0:2ae:3b9b:db41
 with SMTP id d9443c01a7336-2ae6ab4305fmr29611105ad.38.1772641413940; Wed, 04
 Mar 2026 08:23:33 -0800 (PST)
Date: Wed, 4 Mar 2026 08:23:32 -0800
In-Reply-To: <8731e234-22b8-4ccf-89ef-63feed09e9c5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-8-xin@zytor.com>
 <8731e234-22b8-4ccf-89ef-63feed09e9c5@linux.intel.com>
Message-ID: <aahchI7oiFrjFAmb@google.com>
Subject: Re: [PATCH v9 07/22] KVM: VMX: Initialize VMCS FRED fields
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, chao.gao@intel.com, 
	hch@infradead.org, sohil.mehta@intel.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Jan 21, 2026, Binbin Wu wrote:
> On 10/27/2025 4:18 AM, Xin Li (Intel) wrote:
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index fcfa99160018..c8b5359123bf 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -1459,6 +1459,15 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu)
> >  				    (unsigned long)(cpu_entry_stack(cpu) + 1));
> >  		}
> >  
> > +		/* Per-CPU FRED MSRs */

Meh, this is pretty self-explanatory code.

> > +		if (kvm_cpu_cap_has(X86_FEATURE_FRED)) {
> > +#ifdef CONFIG_X86_64
> 
> Nit:
> 
> Is this needed?
> 
> FRED is initialized by X86_64_F(), if CONFIG_X86_64 is not enabled, this
> path is not reachable.
> There should be no compilation issue without #ifdef CONFIG_X86_64 / #endif.
> 
> There are several similar patterns in this patch, using  #ifdef CONFIG_X86_64 / 
> #endif or not seems not consistent. E.g. __vmx_vcpu_reset() and init_vmcs()
> doesn't check the config, but here does.
> 
> > +			vmcs_write64(HOST_IA32_FRED_RSP1, __this_cpu_ist_top_va(ESTACK_DB));
> > +			vmcs_write64(HOST_IA32_FRED_RSP2, __this_cpu_ist_top_va(ESTACK_NMI));
> > +			vmcs_write64(HOST_IA32_FRED_RSP3, __this_cpu_ist_top_va(ESTACK_DF));

IMO, this is flawed for other reasons.  KVM shouldn't be relying on kernel
implementation details with respect to what FRED stack handles what event.

The simplest approach would be to read the actual MSR.  _If_ using a per-CPU read
provides meaningful performance benefits over RDMSR (or RDMSR w/ immediate?  I
don't see an API for that...), then have the kernel provide a dedicated accessor.

Then the accessor can be a non-inlined functions, and this code can be e.g.:

	if (IS_ENABLED(CONFIG_X86_64) && kvm_cpu_cap_has(X86_FEATURE_FRED)) {
		vmcs_write64(HOST_IA32_FRED_RSP1, fred_rsp(MSR_IA32_FRED_RSP1));
		vmcs_write64(HOST_IA32_FRED_RSP2, fred_rsp(MSR_IA32_FRED_RSP2));
		vmcs_write64(HOST_IA32_FRED_RSP3, fred_rsp(MSR_IA32_FRED_RSP2));
	}

where fred_rsp() is _declared_ unconditionally, but implemented only for 64-bit.
That way the compiler will be happy, and the actual usage will be dropped before
linking via dead-code elimination.

Actually, we can probably do one better?

	if (cpu_feature_enabled(X86_FEATURE_FRED) && kvm_cpu_cap_has(X86_FEATURE_FRED)) {
