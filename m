Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7AC1CD00
	for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 01:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723600680; cv=none; b=Wv+cpGoH7VX2EHiHDUMzn6f0Oswq2dH8KXloK6Z8ftisz3se4oGbzOZEasjt+R/B71ps337lHD0eQAYj9V01KQ9ORR3lwbxhakV67igKZhnRAj0ivu0ojmKMg521RbavcAZ6Z1zdIf3r/xOqw8Txj0UXiewFK0bEBPaC4R0V02g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723600680; c=relaxed/simple;
	bh=8d6PGwMHzA81/psTz46KEeZYkJAFBDXykPr3u6Uz85M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XD22TRoPZ0i5tAL0Q3+JZDpAkD9WLhkJK0tZ521YYpJssv+8fj1sfpuP/WyT++iqX/hYo/r96Lx5ZBToMiQemdxSsx7SMhb4ezRHctDjuqeWj7n66A1DGrbceTBIGk6kw7DRd5KGaR4c1GqIAs/LAV5X877A5YUpYejBvNycBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LrRaYfO3; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LrRaYfO3"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-64b70c4a269so124425497b3.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 18:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723600678; x=1724205478; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vVR4Zs76dJzNPyP14EOD69bGamaJOE55Zhb/9oRDLUQ=;
        b=LrRaYfO3/0laRqEjl900l88XVQBebftj3SBTVQDv45Db2C91vuIlveAhODmM+8guKK
         inLGNq3SOrPMRopJn5RzOaCTguPlFaCK3J+aSiEzaWroBmqkJ+quhXvjezbXWRFAGc5F
         DO/V+xGFLHVcMiPd4KsmQX0+pGSyvaqU+t+hX4a/pqUMJmEz+XgB9R3/101TorTreZDI
         J2a9PirOprWbV3vWFcB/HyAr9egfOrtud7Cw+I9UKaKiMKP4lXKoPBv0riah18odN19P
         9Mh9FMJyBs0uvYss1npNgHwsO0kZbIrFGF0tBWwkEloXx5H2q6/r2/dNgegwSWE6TnpM
         zkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723600678; x=1724205478;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vVR4Zs76dJzNPyP14EOD69bGamaJOE55Zhb/9oRDLUQ=;
        b=uzdZiPpwhLyZW2mmmooGJkwE/eY7yriVpy8fPoLzFx57XGr6QOey29NkNd5wBf+Dp/
         m52B1/Mbl3WlY44FyGX4Js/dcbHQFK2FZ90h4oAlOGyD8/q/PTDtwMs6OxCAVrlmffLm
         bnIYmsRjVpnAfCrY4qF131riqPyh0yQwLOSXjGvG7hRLycSaaI4oyxz+NLtkM8R+zVJM
         mSdIg5cLsxXBdsbVGzsKjqWAr/aVGYHa5paGzzwE0hfzMdb5UqL3v6uj1fNXHo6vwdnF
         wi13n7Sh8fvkD192+Qtj+y/eiSSxv25z/v+Ycg3G5s/ARIOJ/VTsoG6QfYDyJaSeIsO1
         Dp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq7H2dMtp6i80QdVhc5J3voTm/Qal1iir4PRLZCH2Fq4tBNJNwPwHNpJWHTFEcnfqezcIhNDkLgtCPLB97Raa9iMY0NcA1yAdf
X-Gm-Message-State: AOJu0YyPcuQjJ/wFvLocy4kKZOMEOXdPTZsmHNWaXaPnn/wSeeHEDLQS
	EoiphAMG44Xmp5SerF+b/ucUw2i2h5Rdx8yJVSElYTfZvlB6TG77V8Ip3KTV9OkVLHY1ApyA4X0
	Slw==
X-Google-Smtp-Source: AGHT+IFSegjyE66t4s58gnf9XNM5UY1397H7m/p5j+j7FRYqPMhvRwirhseK7sojYieVrgGq1fO67l5GO7w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:88c6:0:b0:62a:564d:aed1 with SMTP id
 00721157ae682-6ac9aa3f26dmr204777b3.8.1723600678485; Tue, 13 Aug 2024
 18:57:58 -0700 (PDT)
Date: Tue, 13 Aug 2024 18:57:57 -0700
In-Reply-To: <20240522001817.619072-9-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522001817.619072-1-dwmw2@infradead.org> <20240522001817.619072-9-dwmw2@infradead.org>
Message-ID: <ZrwPJWdRThqSvY0X@google.com>
Subject: Re: [RFC PATCH v3 08/21] KVM: x86: Avoid NTP frequency skew for KVM
 clock on 32-bit host
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Durrant <paul@xen.org>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jalliste@amazon.co.uk, sveith@amazon.de, zide.chen@intel.com, 
	Dongli Zhang <dongli.zhang@oracle.com>, Chenyi Qiang <chenyi.qiang@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 22, 2024, David Woodhouse wrote:
>  static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
>  {
> @@ -9984,9 +9977,10 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
>  
>  	if (pi_inject_timer == -1)
>  		pi_inject_timer = housekeeping_enabled(HK_TYPE_TIMER);
> -#ifdef CONFIG_X86_64
> +
>  	pvclock_gtod_register_notifier(&pvclock_gtod_notifier);

The unregister path got missed.

#ifdef CONFIG_X86_64
	pvclock_gtod_unregister_notifier(&pvclock_gtod_notifier);

>  
> +#ifdef CONFIG_X86_64
>  	if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
>  		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
>  #endif
> -- 
> 2.44.0
> 
