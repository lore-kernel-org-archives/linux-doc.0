Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242EA1A2C33
	for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 17:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723571444; cv=none; b=GrZv9ivmErqW0uexes67Zpe0ZwSVGEWE+dEr2eZx+myktTy5Qsf87Ayg5vW1UX7w9iR57S2hqMSECYUSxRoqdm27dAtagNGD8U0bRja/TrX/zvVKyNwCznVp04+VzRBfKjpVqA5xo5eLasHuXsZspGqfVqHrR4tAF4i5T7drIcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723571444; c=relaxed/simple;
	bh=FstfrUToh1EXfJSAiePToOTUvVOqDVYBssuR0AmtO98=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Du/D/zj0ZXTOSwRexD//9ccVat0XuMqWo1wwxBZx8u6lOtYKCOgYTlBTYsJ+0hc2l1IQuHr0yQi37HfMNDldJBCyuigN4OX7X6wVeKJhyEGyGJ/9D8rlGLZw7PZD/0yfC/ihBIJ/5/2N+TReogLX3DsPij/tAhvpMv79+qYp9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CAk5fGpY; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CAk5fGpY"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7a2a04c79b6so62511a12.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723571442; x=1724176242; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dN2AMVI/niFAXBXumTdMHyNBUN/yv7txGaV0Nn3/UZg=;
        b=CAk5fGpY3xK3zPZJ52R3nKOcnLqDxqy9DSjBex6z80baQRJ0M97CjBOO9Sl5kz6b+8
         94qPAay40t4+6DmrPP1GxjiZzAsqI2N4uK5o2B/b+aljHyCHtOcvAbYQR0a75Sd2SqLo
         2MEzO0X4o8x0n8wW+hI3/ZnHor5Fz8XI0b6qEWzw8sJt9rfCjoRDivTA2I17NLb04Hav
         j+gGoUKqmqUbN8cHZL7VwPBtiq8srVkJqBpKfjgPixD1AZT6t3wXWk1epPftEZpkA+nS
         ct/msZS2INSCkfabhSLrvzFqHQSVHJFmoZGycjJAo6HBgYGNbkXCXAxYfUhsPIF4HoIN
         Vy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723571442; x=1724176242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dN2AMVI/niFAXBXumTdMHyNBUN/yv7txGaV0Nn3/UZg=;
        b=EjeiMriV8kDVHq36XoDv3IAtrCUO0ugkgNmATiM0Xoaf6IhYb/AeSV4n5jxIe6JoxV
         1Oy08QSJ+fNKfS/ldZAK5JcjLJ9gSuOY1bORjwbDGQGEkikry5IvEex2GTlSYtiCXnbC
         QSLvzE6NQhgGsQ/B4rDaAEqu3Evb8+0SZRs25AfWzxaKk9WIUKzol7fgquolIyjZLwmz
         cRO2utoMQWUahKa4366EuM9YIyeVAI2uUw1EgFdIg2yNBURhLCo57a/ZD9EuIfNh9ch2
         wp/On2lbe4NuUyd73ZFmdQPD04NXlRJM5KWLrtWOTX774/T/TLOHu8+9JPk+PNsUVWsG
         AV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2+/I94g4xJAWjPAtI8eexWSsn3Zsn9FcvLgG3ojA+r4Qdb23obXkc9p0xC8Ey6nNrqqd/Sz5d3jmWrFh6aXhIKrWvjMqbhaL7
X-Gm-Message-State: AOJu0YzzJ3aTUt6tWqOzkLIA4AEUeWscPxDyTlaJ32UmASUNEiWAFrH1
	CKTaf/AsJp7C3vSFZARBbqYtTo+vlXB3e0Lxbnr6sMFSfLb3jnF4gAv0Pt2BWc0uiYTEXykCcJ7
	PXA==
X-Google-Smtp-Source: AGHT+IH7Zxucylz6R95aLD54zFrs2SBkGeRrDQqkhFde13ApbPQ4ZM/p/JbtmnqpgndbwN/eAgc+8ZtkApw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4ec8:b0:2ca:7f5a:db6c with SMTP id
 98e67ed59e1d1-2d3942d60b8mr56913a91.3.1723571442217; Tue, 13 Aug 2024
 10:50:42 -0700 (PDT)
Date: Tue, 13 Aug 2024 10:50:40 -0700
In-Reply-To: <20240522001817.619072-3-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522001817.619072-1-dwmw2@infradead.org> <20240522001817.619072-3-dwmw2@infradead.org>
Message-ID: <Zruc8CohpYUa1Im8@google.com>
Subject: Re: [RFC PATCH v3 02/21] KVM: x86: Improve accuracy of KVM clock when
 TSC scaling is in force
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
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The kvm_guest_time_update() function scales the host TSC frequency to
> the guest's using kvm_scale_tsc() and the v->arch.l1_tsc_scaling_ratio
> scaling ratio previously calculated for that vCPU. Then calcuates the
> scaling factors for the KVM clock itself based on that guest TSC
> frequency.
> 
> However, it uses kHz as the unit when scaling, and then multiplies by
> 1000 only at the end.
> 
> With a host TSC frequency of 3000MHz and a guest set to 2500MHz, the
> result of kvm_scale_tsc() will actually come out at 2,499,999kHz. So
> the KVM clock advertised to the guest is based on a frequency of
> 2,499,999,000 Hz.
> 
> By using Hz as the unit from the beginning, the KVM clock would be based
> on a more accurate frequency of 2,499,999,999 Hz in this example.
> 
> Fixes: 78db6a503796 ("KVM: x86: rewrite handling of scaled TSC for kvmclock")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  arch/x86/include/asm/kvm_host.h |  2 +-
>  arch/x86/kvm/x86.c              | 17 +++++++++--------
>  arch/x86/kvm/xen.c              |  2 +-
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 01c69840647e..8440c4081727 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -887,7 +887,7 @@ struct kvm_vcpu_arch {
>  
>  	gpa_t time;
>  	struct pvclock_vcpu_time_info hv_clock;
> -	unsigned int hw_tsc_khz;
> +	unsigned int hw_tsc_hz;

Isn't there an overflow issue here?  The local variable is a 64-bit value, but
kvm_vcpu_arch.hw_tsc_hz is a 32-bit value.  And unless I'm having an even worse
review week than I thought, a guest TSC frequency > 4Ghz will get truncated.

>  	struct gfn_to_pfn_cache pv_time;
>  	/* set guest stopped flag in pvclock flags field */
>  	bool pvclock_set_guest_stopped_request;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 2d2619d3eee4..23281c508c27 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3215,7 +3215,8 @@ static void kvm_setup_guest_pvclock(struct kvm_vcpu *v,
>  
>  static int kvm_guest_time_update(struct kvm_vcpu *v)
>  {
> -	unsigned long flags, tgt_tsc_khz;
> +	unsigned long flags;
> +	uint64_t tgt_tsc_hz;

s/uint64_t/u64 for kernel code.  There are more than a few uses of uint64_t in
KVM, but u64 is far and away the dominant flavor.

> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index 5a83a8154b79..014048c22652 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -2273,7 +2273,7 @@ void kvm_xen_update_tsc_info(struct kvm_vcpu *vcpu)
>  
>  	entry = kvm_find_cpuid_entry_index(vcpu, function, 2);
>  	if (entry)
> -		entry->eax = vcpu->arch.hw_tsc_khz;
> +		entry->eax = vcpu->arch.hw_tsc_hz / 1000;

And if hw_tsc_hz is a u64, this will need to use div_u64() to play nice with
32-bit kernels.
