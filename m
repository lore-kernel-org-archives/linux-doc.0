Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD86E619
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723782541; cv=none; b=oM0WF69W2GhUCkfCmB4n4adYycw9QwYnG5IlQVhAZFeg2sX4dMpoAGSLivdxDaX3R0IxPQyli0QoqvWS2ei/Os2YNA/cem6+fGjAs2Tj4A+6f7TvlcRlB7Bd/C2vAtCndpKtooclRWDeJc+xh7tbkhHLN1MwYYic2P/dkG2G6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723782541; c=relaxed/simple;
	bh=ByDT93QIRaz0b5OIrhS/Gy2YbA/fcEY9TXdFbTmRyoY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=poK9mOOJEXXcOB7zpgCVRDQ7/Oa967yoa/0UF6+bI9ivDFpWWyJ328aFjKQjDI6Mmdyh3osbcva840/OqzlfpWjbion9YB2dC7MNrAOai8p0jFDOFM6otMI+fULNt5lwGonbPVvkJUhpHXfEmSfsGCMipakHH8ylBidW3jBY0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b971qGhC; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b971qGhC"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-665a6dd38c8so27670467b3.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 21:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723782537; x=1724387337; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=76V+p5WBi+LNq0dQVklKGYao/CBfne6Cn1SdVOP9ztw=;
        b=b971qGhCs4H17341dIWuxIan/K6Mq/8pDH3pj0kpfFlWVIhvRO0sYWa9zc8tOUsG28
         PMdkCFqIum3ScSUqRIXn5u6vHdK7qCQDO9m2FU1TK6nkdXGGdHyDXgJtwS7B2ktxWmUa
         je/mJouQE8mYtrHbzG9OSZ3IDvHNgx/AnFbkrQKlA3JyX4StJNTQ5y+z4OZ3KVxWyajx
         s4K1fni4FRQPdjhnK8LmMdxyRMhSKz2wELaNXeE6PVu35xVXtMK/WWlRwLaYQClVsbRo
         ewlhA/LKl0mIXzzPhKKDjyoyqrpkM18XX0UUnyaMKLoy5c9Roj+GT6rbahzcUiOhZk9s
         X7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723782537; x=1724387337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76V+p5WBi+LNq0dQVklKGYao/CBfne6Cn1SdVOP9ztw=;
        b=jTeiibIDW7Tu8zMAhrhqIEv76knvwsxe8BlQOWhOAWLKzbE77SSGPspPj18hEk+AEc
         Dcty2CrkJZnY8QuWRkuC0dEUNdtz4Rs9Ict7pn//5Eh8mXnM4FlTXzjNkDZM9tJQjOEy
         BQGSa4yH7kTS1zjn94Au+S9YYZgT4MYQCqhglbO7UXSvBRQpJww1fyPL1UPoyvnKzt2U
         TdkYIL9pACsCUSlUD0u+2dXiUN0xWgORcQrvmHSXPBT7R9SSigdxIm8rl6eRjuP8J/bu
         b0X/2YO3ceRjqQ5/S8uZRZVedw9UcNjNQPG8cu3xwqljMrDGSK0tYb2xf2g/uYRJV5z4
         ffaA==
X-Forwarded-Encrypted: i=1; AJvYcCV794SaBCQ+tcosuFVCJgvYcKL/li1eQKyuwE1tS4NG+bonZGnSoilJ3zY4AB6EmrH0TSE0Vb6va9i9/+z0ajsrUr1ORnfyhm6V
X-Gm-Message-State: AOJu0Ywog2GvS7okCvU6l5r/phX+h0nSwhRMblYbKhRh/F1XkqvRXvZm
	ZsJGxeAz7iHCXe/V+s+m4cm9WgA18WrJ8ztBpWemSrzc06IqUrKrMsR2qHN/EtlVP/aCHB2maX3
	yhw==
X-Google-Smtp-Source: AGHT+IGCuSD9mWkjwSN3Merz2iByF8JxicOek8mY5QtDXNf/JTFRsMbA4AkGDKCH6Rx5vw15cu/6Jvjnjis=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4506:b0:69b:5a4d:26fc with SMTP id
 00721157ae682-6b1bc7d1ff7mr34297b3.9.1723782537272; Thu, 15 Aug 2024 21:28:57
 -0700 (PDT)
Date: Thu, 15 Aug 2024 21:28:55 -0700
In-Reply-To: <20240522001817.619072-18-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522001817.619072-1-dwmw2@infradead.org> <20240522001817.619072-18-dwmw2@infradead.org>
Message-ID: <Zr7Vh74T5yIVQyqi@google.com>
Subject: Re: [RFC PATCH v3 17/21] KVM: x86: Avoid global clock update on
 setting KVM clock MSR
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
> Commit 0061d53daf26 ("KVM: x86: limit difference between kvmclock updates")
> introduced a KVM_REQ_GLOBAL_CLOCK_UPDATE when one vCPU set up its clock.
> 
> This was a workaround for the ever-drifting clocks which were based on the
> host's CLOCK_MONOTONIC and thus subject to NTP skew. On booting or resuming
> a guest, it just leads to running kvm_guest_time_update() twice for each
> vCPU for now good reason.

s/now/no

> Just use KVM_REQ_CLOCK_UPDATE on the vCPU itself, and only in the case
> where the KVM clock is being set up, not turned off.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 437412b36cae..32a873d5ed00 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -2361,13 +2361,13 @@ static void kvm_write_system_time(struct kvm_vcpu *vcpu, gpa_t system_time,
>  	}
>  
>  	vcpu->arch.time = system_time;
> -	kvm_make_request(KVM_REQ_GLOBAL_CLOCK_UPDATE, vcpu);
>  
>  	/* we verify if the enable bit is set... */
> -	if (system_time & 1)
> +	if (system_time & 1) {
>  		kvm_gpc_activate(&vcpu->arch.pv_time, system_time & ~1ULL,
>  				 sizeof(struct pvclock_vcpu_time_info));
> -	else
> +		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
> +	} else

Needs curly braces now that the if-statement has 'em.

>  		kvm_gpc_deactivate(&vcpu->arch.pv_time);
>  
>  	return;
> -- 
> 2.44.0
> 
