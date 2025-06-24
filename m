Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA563074A4
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778875; cv=none; b=uYu208mrWP82Rzvc2rxntisqqvqnsPfLcNbXB+dF3TCHXKDg0dI7mTafMZMyoJ0fJcGe0IaxqGqRMx05/zjdtVC1YvgtCHCwAP5KU4cTtkNbrKSBnE0maZ0UQxfBNLw8zlSK2AFcNMwt6HrOEdhgvNkNIem10SAq3VGc+u9lOAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778875; c=relaxed/simple;
	bh=MepxRO2ogI5XQ3ZUzw1gcXY64ic46PvTDY+KYhuA9P0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GW1Rx0fGF9uG27iu5s7IgvIATLK/tGwU5XJEyuEZY7Vv3l7gKq+Wy099G815RnCux4eOMkOxZIYmyAU//FoHKiOg/QWytS+mfI9QaLVGTbtNanBpJX+RIxnrMm6EdqGAMRcyFW+iurqoe3h+nFqt4f2mDQPgJZHDGu0L53z7pS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WZK6ZJ3A; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WZK6ZJ3A"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235f77f86f6so54786195ad.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750778874; x=1751383674; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ozpzeYt4xTkvHRuQkIJTdoQYtXmcQ7LICuVmYRW9gk=;
        b=WZK6ZJ3AuiGdvP2b+SBCaWG2/HwwkhXTBNXfMqnckLRQMPj0MJ4iZ14Hmp7ZdULO+X
         DslGD5rMmwc6tWFnbIFSQzHR16uUTpRLwPi7KaAhdE7EBprCSyzT0Dtx8nI84pDwcqNk
         zYBrRrQTWp5ZrjAb+2LUgUD3S4ki7FqBl3QGomQ5bOgxJWrFhUAUVvPsQy/eVLZJVPqB
         uoVml+AG9ETMzACojMoKizPs0JQu64axF4SZJMV6N/QtqESGESuMJ7cwfUI4g0LJ7dvX
         ssg4lzk41nqtojkamz36RhZVOV9VYnQ9hefZhYPxWTZ/8V8utCGKB1x0/KIL2YSWvnBY
         Scog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778874; x=1751383674;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ozpzeYt4xTkvHRuQkIJTdoQYtXmcQ7LICuVmYRW9gk=;
        b=W4qiwNymdM+SqmJN8SjEw3oA8IEMV5f+l/N/FXKQK02yI7oGYgHRUV6cuZF8c8xEBx
         N38HYBUaA3hxQ38EB/FCCp8qNadgQ8XFvW8P5/h7BHVkvbN3ckVsRG/MgDQA5nZIn6Kj
         yxNvFVMV30+Izp3jkB8ZtImuVIcXWTbCfmCN3Zg66EAagMQBv5oMorYvP5ucQraBdkXc
         RvBNOIQaz4dBxU4gsuWmUOvsCb4M4NJJw0h4GeMEOlT1ZLbbS0xYFrf1eU1M8l821cLI
         CotTdu7vKpaLiTJKFHsWhTyNit9XES9rU7euJpeyD08S04HO1VRSvS+eGBAMpjLpppb4
         Il2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUn3XcI6NRwd3m7mQK8Pp/qI5HZThoiCLy0cufeU5wKoF/1R2ENk9nwAuqWMEVlylT47cLkQXcVxD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuavTIvZqZ0+NYXxuGe/mYfkfcAFvzlPOiObAjGJ8BeuqjKtfX
	vzJuV0mNN3w4/CDAkHGVzzron/I/xUcN2/PnBzWNyH+RHPcf4X724auQT0L3KlvxwWWyS8FqZbO
	y6OjX7Q==
X-Google-Smtp-Source: AGHT+IFUejh1pO/KNNRbnpHWhaff//dtVImgTpNy+o6XsUzk8HP9FdRsW+ItyD5wajOAd09IzHcqdYMV9uY=
X-Received: from plbky5.prod.google.com ([2002:a17:902:f985:b0:223:f7e6:116d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dac6:b0:236:7165:6ecf
 with SMTP id d9443c01a7336-237d9a7c3a9mr312281565ad.38.1750778873740; Tue, 24
 Jun 2025 08:27:53 -0700 (PDT)
Date: Tue, 24 Jun 2025 08:27:52 -0700
In-Reply-To: <20250328171205.2029296-7-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <20250328171205.2029296-7-xin@zytor.com>
Message-ID: <aFrD-Pn9cmHcVxWs@google.com>
Subject: Re: [PATCH v4 06/19] KVM: VMX: Set FRED MSR interception
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 28, 2025, Xin Li (Intel) wrote:
> @@ -7935,6 +7945,34 @@ static void update_intel_pt_cfg(struct kvm_vcpu *vcpu)
>  		vmx->pt_desc.ctl_bitmask &= ~(0xfULL << (32 + i * 4));
>  }
>  
> +static void vmx_set_intercept_for_fred_msr(struct kvm_vcpu *vcpu)
> +{

This function should short-circult on

	if (!kvm_cpu_cap_has(X86_FEATURE_FRED))
		return;

Functionally, it shouldn't matter.  It's mostly for documentation purposes, and
to avoid doing unnecessary work.

> +	bool flag = !guest_cpu_cap_has(vcpu, X86_FEATURE_FRED);

"flag" is unnecessarily ambiguous (eww, I see that the exiting PT code does that).
I like "set", as it has (hopefully) obvious polarity, and aligns with the function
being called.

> +
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP1, MSR_TYPE_RW, flag);
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP2, MSR_TYPE_RW, flag);
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP3, MSR_TYPE_RW, flag);
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_STKLVLS, MSR_TYPE_RW, flag);
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_SSP1, MSR_TYPE_RW, flag);
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_SSP2, MSR_TYPE_RW, flag);
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_SSP3, MSR_TYPE_RW, flag);
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_CONFIG, MSR_TYPE_RW, flag);
> +
> +	/*
> +	 * IA32_FRED_RSP0 and IA32_PL0_SSP (a.k.a. IA32_FRED_SSP0) are only used
> +	 * for delivering events when running userspace, while KVM always runs in
> +	 * kernel mode (the CPL is always 0 after any VM exit), thus KVM can run
> +	 * safely with guest IA32_FRED_RSP0 and IA32_PL0_SSP.
> +	 *
> +	 * As a result, no need to intercept IA32_FRED_RSP0 and IA32_PL0_SSP.
> +	 *
> +	 * Note, save and restore of IA32_PL0_SSP belong to CET supervisor context
> +	 * management no matter whether FRED is enabled or not.  So leave its
> +	 * state management to CET code.
> +	 */
> +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP0, MSR_TYPE_RW, flag);
> +}
