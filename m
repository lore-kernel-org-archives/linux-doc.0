Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EE21C84CB
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670342; cv=none; b=K29NEXTddPyHf+laso+XJ2nKqUWktNYt+ZHHZNBWdu4j1y00uk48X7pLilO0fOBzzetlMlUpqQ+V9giCVzk3aWSgOYCzEaudbqk7hhJmduQ8rOJFELnAOEujvq4LyVdz5FFKl0u9QAUG0C3OIhkJ0KwN02alTQP54C6HpmTXqgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670342; c=relaxed/simple;
	bh=mUxrgPvdoi3NLrb186ru794HJXSt0wMU9NWs4rAc07k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B4DdDqV/lecXYLLUdjhOPrVgQFAoMKC3iAAkZ0n4aIqc52JEe73QYLPoVT/hNjkyK99OPIvB6h0aCAqUMiEBec+9ONP2yEpOnl7Y8WWCWRNSPVxknveVaN/QXPURh08Jtc2uI15ksegrQdf/pHkqmUbrZQnLayN6ChIhTAHBIyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bZS5tFeG; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bZS5tFeG"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3598d4b19deso16155772a91.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 16:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772670341; x=1773275141; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6VS0dk9UF5seMj98ZZR+BIsl/8iPOzHKFtlmFRwLVSc=;
        b=bZS5tFeG544y5XMZe9oJPLrqBTefC0wHWN55OCePC+JJB5Ox/9IbKiEOy2UbstYI6Y
         U6HjRONIZ7pUW+wCvwZQ/PFdmUeNkTyAm41NynuIrundEolsUGdYGA1TOZhn0zZV/k+P
         BHsDmxsj2tPW/gH/+1Fd2JkplsJ1eenAQ6bszMNdYeFGjpmsL43+Bf9PD5RGTeF13i5H
         Rai7QZyZrG6q4t/dRGGWoy+I2ekWUPiLwbm5cLCELdSHmXKCDZwd9A+wtRKLhraBkDtr
         swhKkzhYbJiJ7aRqzOv9SQGhP0Cch7kTvC+ALWyKMQLKb6ASC5kipYo9hSg8nzUPca4t
         ZdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670341; x=1773275141;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VS0dk9UF5seMj98ZZR+BIsl/8iPOzHKFtlmFRwLVSc=;
        b=eG2m5w5MKpFZ4+GJrtVutI7qKLaWLS/lHKLefl0Ts73dp2x+b7yFaMKNnpGa5hnWtk
         hNeTv4sB7qNAwAqrXL4clfLc81BjgvtN6rLODDG0yGGXyZVd+ib8zWXZKHKfQXQV5ptH
         RWZa13VqUm97e8Q/cO3xWH9LciA8DuUSztUEqypHjtljWzwq279PbCTHP/Mb5y1eQc3m
         fe7Zc+eemUteVsSXw5wl/BW0dHuQrvGwzSMpdtJT836Q8d7MuU92OzPABkflM5vT+7ph
         2AZ3O4ezllK1DbR6yLpH0IcSNmAiH30pmOBVKV4avlkk0T6UjmNOYB/+9E3/vHgJOxDY
         FUgA==
X-Forwarded-Encrypted: i=1; AJvYcCU44fTYM5O/1Hog/vDiyCqy0n/Kpq0jHHQgX50/pQ1Tz60RJC5M8mI/PlcN00iHH+KEfeFmXRlITv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qz+OJ/LUEl8adFmAjt3s/Koeu+RGMm+E3FSlv6lM/BpQcSUk
	gdDu5nCtlFjsgZ5fAO9rdtPHA3JUGPg31C4IZmgW7C3IvioVCRFN9XnpBqqlx85+wlpgI7q0iQZ
	SsnrZBQ==
X-Received: from pjzb1.prod.google.com ([2002:a17:90a:e381:b0:359:7e40:7d79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3fc4:b0:359:974a:3d65
 with SMTP id 98e67ed59e1d1-359a6a421a8mr3564264a91.16.1772670340830; Wed, 04
 Mar 2026 16:25:40 -0800 (PST)
Date: Wed, 4 Mar 2026 16:25:39 -0800
In-Reply-To: <20251026201911.505204-4-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-4-xin@zytor.com>
Message-ID: <aajNg6YrDljfneEE@google.com>
Subject: Re: [PATCH v9 03/22] KVM: VMX: Disable FRED if FRED consistency
 checks fail
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, chao.gao@intel.com, 
	hch@infradead.org, sohil.mehta@intel.com
Content-Type: text/plain; charset="us-ascii"

On Sun, Oct 26, 2025, Xin Li (Intel) wrote:
> diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
> index 6bd67c40ca3b..651507627ef3 100644
> --- a/arch/x86/kvm/vmx/capabilities.h
> +++ b/arch/x86/kvm/vmx/capabilities.h
> @@ -405,6 +405,16 @@ static inline bool vmx_pebs_supported(void)
>  	return boot_cpu_has(X86_FEATURE_PEBS) && kvm_pmu_cap.pebs_ept;
>  }
>  
> +static inline bool cpu_has_vmx_fred(void)
> +{
> +	/*
> +	 * setup_vmcs_config() guarantees FRED VM-entry/exit controls
> +	 * are either all set or none.  So, no need to check FRED VM-exit
> +	 * controls.
> +	 */

Eh, omit the comment, there are at least six other control pairs that use this
logic.

> +	return (vmcs_config.vmentry_ctrl & VM_ENTRY_LOAD_IA32_FRED);

Unnecessary parentheses.

> +}
> +
>  static inline bool cpu_has_notify_vmexit(void)
>  {
>  	return vmcs_config.cpu_based_2nd_exec_ctrl &
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index be48ba2d70e1..fcfa99160018 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8020,6 +8020,9 @@ static __init void vmx_set_cpu_caps(void)
>  		kvm_cpu_cap_check_and_set(X86_FEATURE_DTES64);
>  	}
>  
> +	if (!cpu_has_vmx_fred())
> +		kvm_cpu_cap_clear(X86_FEATURE_FRED);
> +
>  	if (!enable_pmu)
>  		kvm_cpu_cap_clear(X86_FEATURE_PDCM);
>  	kvm_caps.supported_perf_cap = vmx_get_perf_capabilities();
> -- 
> 2.51.0
> 
