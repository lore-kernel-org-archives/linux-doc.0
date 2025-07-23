Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548F6225779
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753294750; cv=none; b=UuDRFRO71Y1azvCQVmSrI+iFTreI8M+531fxxlbTwh5+bjNdRAVf6UJAW3g1+fTJ+z4BXqgjn/P4x28dtLBx8CQFC0oVnd4OPZK63CdnSuGaF9NjnusCalm32V66kYYBYdhU8Eusp/J3DvoSYWgoNcJIGflsvbMkZjxXa0Oe7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753294750; c=relaxed/simple;
	bh=zdSvmSkd0NmmjOsTjLY3Hz7lD1LJ6biSJtMpZav9cQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c5O/40tvfcRcQ7994lfeVS3myNrHhocOv2kEwObXwmHDPtl8I8LqU8WLHMD71MStscqLyY8paKWkFJpTvz0sGdcIdoKyJl4nLW1P2jd3l2NzAcrulYJwPbqVt1rqFTZPW0EwHaLbLuOGys1wb0u7SnKIcSlQHJ9UFHOE5aTjeOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ahzOF9GR; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ahzOF9GR"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b31f4a9f67cso268926a12.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753294749; x=1753899549; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mgjRhl7QeLuKE3QQ3pMAhg0iltdJ7SjGRF1SJi7olo=;
        b=ahzOF9GRAsHQ4LaTD6Skh+jQ0d8iZwpqWSe9HknmDSdqicXoRQoxoyHjIWZJ0e9GsU
         zisQ+8cEd0UO/kpgj5DHz/+MpjiCiojtaXHwTcRVR0ItwgHHVoRbWK6udAk8Uc3kIrPW
         +OjQ+YGQMcIPuwN7flNR3iBSX0QA4q+MRM56i2vlrhB09kBxOxQAAQNYBD2X49PCV7RK
         m1GJ6dCDgbFRFmmGeyiqJSNWS5EvjpLy92QbkCkTYUhIl985ohDZgmNLY8yiDlEcDUbA
         fnr/y4qbl5I+MWdnUhKrr4FzGqy/H0HltC/kBN/u69LtqlGiwDTWaUNqAyIl7sehaMLD
         sRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753294749; x=1753899549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mgjRhl7QeLuKE3QQ3pMAhg0iltdJ7SjGRF1SJi7olo=;
        b=RfkrC250INekDKgjtUtNf/rjqeE0Xyb4F6+KxWIBzy2xX01+bQ1LAIm/ORtgbyWROo
         BDEbqDrt/lk9iFLyc1/J1t9RIDxoE7d2fI1TGSdD5hbT/yTC3gFn8lc7JcdLUh8hFbnJ
         7MmNy9xTItXxZHf1qqHGV7+vB89a0EabSuggf4NTRQWeLrKu2DEo3EWZxfXqylqm9a02
         ik2HvhabJ/kq1cfJz9OUjLDesBzNfRXDWRLCfvlHrDneEkG/g67yhvwMrvRMoyf80AmU
         jOIkMr2CgZkCu4YYzFzj2FKgKzMClmbxajjX4/s54aAujlCaCMaHIEyOHRhVRe0enaAn
         TeFw==
X-Forwarded-Encrypted: i=1; AJvYcCXVAJROeAc1Aoh2gJv77Aaj2KdhM1Z3RMQclrwvfFZ4B241nz99JoB2dkAHzJfmu/A1tdF7ep7KPuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YydVHHHz26T45QDCgF+QeLiLfjHaXcCElf02BqgG2w3l6Scz+l8
	tkh6C/88teMTN1t5dPcK8FETxwkAEf/aJIBx6jSFFLmA3PHgqZQlsxIr7iJYyAZ9pvNEe9AzGXA
	MFkxv7Q==
X-Google-Smtp-Source: AGHT+IF0icnWbWtzPJKSEKwjPNwYePDm/cMvEUI0qVfn/lywtl0EFsLb8tVoT1AeoKBbG2DyCjC/dY5y6V8=
X-Received: from pjx3.prod.google.com ([2002:a17:90b:5683:b0:311:7d77:229f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:47:b0:314:2840:8b21
 with SMTP id 98e67ed59e1d1-31e507fe4femr5047003a91.32.1753294748695; Wed, 23
 Jul 2025 11:19:08 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:19:07 -0700
In-Reply-To: <20250422161304.579394-5-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422161304.579394-1-zack.rusin@broadcom.com> <20250422161304.579394-5-zack.rusin@broadcom.com>
Message-ID: <aIEnm7Y1VN-PCfF8@google.com>
Subject: Re: [PATCH v2 4/5] KVM: x86: Add support for legacy VMware backdoors
 in nested setups
From: Sean Christopherson <seanjc@google.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Covelli <doug.covelli@broadcom.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 22, 2025, Zack Rusin wrote:
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 04c375bf1ac2..74c472e51479 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -22,6 +22,7 @@
>  #include <asm/debugreg.h>
>  
>  #include "kvm_emulate.h"
> +#include "kvm_vmware.h"
>  #include "trace.h"
>  #include "mmu.h"
>  #include "x86.h"
> @@ -1517,6 +1518,11 @@ int nested_svm_exit_special(struct vcpu_svm *svm)
>  			 svm->vcpu.arch.apf.host_apf_flags)
>  			/* Trap async PF even if not shadowing */
>  			return NESTED_EXIT_HOST;
> +#ifdef CONFIG_KVM_VMWARE
> +		else if ((exit_code == (SVM_EXIT_EXCP_BASE + GP_VECTOR)) &&
> +			 kvm_vmware_wants_backdoor_to_l0(vcpu, to_svm(vcpu)->vmcb->save.cpl))
> +			return NESTED_EXIT_HOST;
> +#endif

Either provide a stub or do

		else if (IS_ENABLED(CONFIG_KVM_VMWARE) && ...)

Don't do both.  And definitely don't add a stub and #ifdef (some) callers.  I'd
say just drop the #ifdef and rely on the kvm_vmware_wants_backdoor_to_l0() stub
to get the compiler to optimize out the entire elif.

> @@ -6386,6 +6387,11 @@ static bool nested_vmx_l0_wants_exit(struct kvm_vcpu *vcpu,
>  			return true;
>  		else if (is_ve_fault(intr_info))
>  			return true;
> +#ifdef CONFIG_KVM_VMWARE
> +		else if (is_gp_fault(intr_info) &&
> +			 kvm_vmware_wants_backdoor_to_l0(vcpu, vmx_get_cpl(vcpu)))
> +			return true;
> +#endif

Same thing here.
