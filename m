Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9E274B47
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784055; cv=none; b=Pdn4DsUpiccaerdqY3pqEeRF/27frc7o/Ih8Lk2KcAbfPdgwpNXJH5mxKjvkj5SAVZJa4NHCCp2gvAoYjITynZgFZlVHd3AKzRoSfdFs4dsSA1PIn3nnnIU4eNUGo3p0S0JLpC6Es5zSfWirAzGuDEn2QF763tgKoSuKTKyNL3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784055; c=relaxed/simple;
	bh=HzTXMQK0Sk+89eCcGCRpe2fDVECOwc6M6+7TFRwpUsc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AVjlGL1ifUu+ylT1G9mSmdvW9vUnhoACE57Y02fxCIS+S7wGuTkrXIZNJrddBublq7V73tB12QJvc2rJadUneMssBKRbeOs80LaGdKCrEyzYKiCMH0MT1EQUxyGSH5UYMC4qTjLvJBZi35rO0q4wqS33s7TYEqBpRXJ2tM+pB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f963h6Ls; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f963h6Ls"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31c8104e84so3814678a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750784053; x=1751388853; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PtWwPcbALvYkeiY4pVsinxdvdY8YE60we2liZ/hv4Jc=;
        b=f963h6Lswl2en5I0suVNTbeEe+9hcZ/NlRkjz5XE98QLCud3N90hc4sPUsX0ZkAE46
         ZysBQ52V3wNheF99+9D7C9ldcsC+6Li79Qdy/IcCnCKUdFxHVtKviwroLQYv5mYcCIIN
         M2XIjRlArMfGv64EUJsv6HDw5YFZShx7ohugD1OVZ1PfFah9RS3aKoLrurH0VzHJ0ruf
         ibjpF6QflHlsGBNE8RCnyZ0MR65lww4rM0lEipubeiDpZAuCH/EAnrlRYM2E6f8y+bpa
         Yw/VRAw/oO9xzUlm+ZjldTNf7Rm7hkRCuiMw3RnkJ76r5++hwNtKmd9Vn/c+AlMwxGUh
         vnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750784053; x=1751388853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtWwPcbALvYkeiY4pVsinxdvdY8YE60we2liZ/hv4Jc=;
        b=c8FixjWP/FwDd+AkP4YKu+Okz2iXx4xuEiOrQ0rdJ7oDEhfo9XRDHeS7Wuoyb7U/0o
         /b/+1C28JCPHkeB1ylw0Z4+WpbIo6hRNe0SCYiQwQaUOWoD5vRk15eBllktZEuiSOP99
         tZgmjTvvxia2pI5Alqtwcn01oMN8t2Vi1557SfpwwgIi+I4cKOSIswoftDrZaiUdsj1E
         11xdsOW7hnoLOaUg7zPg8SytcBRuzfaCt0GnaPSzN8DSrc/aUNoRriSz3LHwPS/GSrUN
         U51OPA3rSZq2G+OUBUzo910/67Vn0/GWet1OOd+jF9BGWWsrNE0MS1xZhdnO6E3sUmPR
         IdNA==
X-Forwarded-Encrypted: i=1; AJvYcCVQAT2XK2iA7THE718Sv/KieRaM2Qsa96+7/96SBSF5JG8+mOTR0sFoGL1B5o9PKRKv987YxrTr024=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuN6Wyf2jCYoorhHFZAnZMFu7Hjh6Ex+uIln/XqwCAAC5/17uH
	dUAtcBZZkOztWRzNsGNaR1asIOEGZotAxPotJ+TSYT2oEIDzdWx54g2qe8FvWdGJHYcoO/0fulJ
	KenCGEA==
X-Google-Smtp-Source: AGHT+IH+8dH4wyPpmgAFC48DsVTB8bgti3rxgqoIRLFuvBNppEpHbI1xoF+oj+TP+ZbSUrJsVS2UPRM9h+M=
X-Received: from pfbfi22.prod.google.com ([2002:a05:6a00:3996:b0:749:1e51:d39a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a6:b0:748:68dd:ecc8
 with SMTP id d2e1a72fcca58-7490d9e7228mr23007806b3a.22.1750784052939; Tue, 24
 Jun 2025 09:54:12 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:54:11 -0700
In-Reply-To: <20250328171205.2029296-17-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <20250328171205.2029296-17-xin@zytor.com>
Message-ID: <aFrYM2urBeoFDVAV@google.com>
Subject: Re: [PATCH v4 16/19] KVM: nVMX: Add support for the secondary VM exit controls
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 28, 2025, Xin Li (Intel) wrote:
> diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
> index b4f49a4690ca..d29be4e4124e 100644
> --- a/arch/x86/kvm/vmx/capabilities.h
> +++ b/arch/x86/kvm/vmx/capabilities.h
> @@ -38,6 +38,7 @@ struct nested_vmx_msrs {
>  	u32 pinbased_ctls_high;
>  	u32 exit_ctls_low;
>  	u32 exit_ctls_high;
> +	u64 secondary_exit_ctls;
>  	u32 entry_ctls_low;
>  	u32 entry_ctls_high;
>  	u32 misc_low;
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index 5504d9e9fd32..8b0c5e5f1e98 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -1457,6 +1457,7 @@ int vmx_set_vmx_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 data)
>  	case MSR_IA32_VMX_PINBASED_CTLS:
>  	case MSR_IA32_VMX_PROCBASED_CTLS:
>  	case MSR_IA32_VMX_EXIT_CTLS:
> +	case MSR_IA32_VMX_EXIT_CTLS2:

This is wrong.  KVM allows userspace to configure control MSRs, it's just the
non-true MSRs that have a true version that KVM rejects.  I.e. KVM needs to
actually handle writing MSR_IA32_VMX_EXIT_CTLS2.

>  	case MSR_IA32_VMX_ENTRY_CTLS:
>  		/*
>  		 * The "non-true" VMX capability MSRs are generated from the
