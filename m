Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E134224228
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753294448; cv=none; b=rc3G45ENvbS8+aH5C71MMjWkwI6GK0mU0JizG1drskDM3BrXcdT4TGI2HnXOmZ+Pv5X4IXpHXKI4HnzX9YilvEkyxgLTTqOxo2sjnFatw+8ad0N46+yGzy95dl0hEVz7U5R2TZ61MTHchiDAL6eS6+ch6DmzaulUy67vo2XXi4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753294448; c=relaxed/simple;
	bh=JG4uReWgGvK254YxhuRwhsavbNKr7T50ZMO/oooWqyU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LhDcQthrEqDcbppPI/YovavGCGZZGa/UkYyxbpB/jbvC9ogGCzEzPLXSpSCOhIf2ePLyV7oKYMt+CDFMQc+kXI8Q2plzyz9E5Ez/XZcxA2ZBCAWAxr1FSUl/DDvsu8cvTmTAPNJ1bTH9BrlQmglpM01KJudIh/SfnVqTacSraqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KHqzV1T9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KHqzV1T9"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-237f8d64263so863035ad.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753294446; x=1753899246; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eO5dqZ0DhB/OAkXgsZy07YNUuWXJnLDBIhzJwZGa0YE=;
        b=KHqzV1T9+eNjT6tZ6XRjfLa8Um3r3wjiOynyi6iGJQA2kJ39I7Wo5kPShVTEIeaQtt
         EiBKWiRyaCVjwko2G9THc0I8yIRpR1Qe6hexGzAg8T8d9F7q76Nx5h2ZBlx6xLe3Mtes
         Ppn0t6SaLADPOELK+woAps78UbsycYB5KeC6sgJW8qHXiw0AfI4L1ZEKTOUgBo15XtAY
         nakRyLRD6icMuwFXyW8NAiZhEYuO4sG+m+VvGdXhCxJemaTQkVqwJBji3OamUH4EX0rt
         9JY5BM0j+ZZQWojFCNZyEcFnb3+DHCMNVRpIACVjXgptSglI3ypPQo9HpLG5/512XvQt
         3OrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753294446; x=1753899246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eO5dqZ0DhB/OAkXgsZy07YNUuWXJnLDBIhzJwZGa0YE=;
        b=jeJezSrsG4boaY4vLvFp/KXxH4k4J6xCE3xhXPYcwqORlRpvOnEEGNYDTmVGyTNEdI
         t1A9DpnySaT+T3vfZkpf4ZLumzm6/NIaX1h+OiiDqSQJkzKnuUVtfAzEhOPUC9WqIl8A
         Uy8MWfI3pToaVBodEr0re+d1jJajVw9IWvq6yF8w6XBNCreJ9ZTeKBI96oPZe3jjexba
         96JrwyWWPhF6SKSJ+QlzOOp4Q9bVuSJsXwmSzDrgI+fuXxbrMdxJHnHsPlEYS2bLYe8t
         eT36JhvbUswyODmCpnDwfauEqKb2b/JjSUWWcCoLgtiFpj6Ak5r7XhrzogHpkioGxMJp
         G1/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX17hehnnRwlTPASqVoWlSS3/6MBwu5TsG+vzlv271hwsRCg8DlyX4F2Y9ZL14FK6Zom21q35ZFkm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lpr/f2J72Ni1fl1lxZmaGc6k3e2IGleZ4swWTZggxtfTpPA9
	iyByP2sNcBBCFgeE9EiJHK+jygiNVNLfpVYFUCf93sA8HBihcK9sdI8Vq4WUWJBRIniVgtavpAL
	L44QrYA==
X-Google-Smtp-Source: AGHT+IEjAqLPa5W7Efdn/up6DoBz+19wIi12MSCKj7MrbSVpgqTQz1XXEAR5E+PKwmAfbifDD/Fz4Imnksk=
X-Received: from pji5.prod.google.com ([2002:a17:90b:3fc5:b0:312:3b05:5f44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f152:b0:235:e309:7dec
 with SMTP id d9443c01a7336-23f98204604mr31445345ad.26.1753294445204; Wed, 23
 Jul 2025 11:14:05 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:14:03 -0700
In-Reply-To: <20250422161304.579394-4-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422161304.579394-1-zack.rusin@broadcom.com> <20250422161304.579394-4-zack.rusin@broadcom.com>
Message-ID: <aIEmawm9gLflg8zt@google.com>
Subject: Re: [PATCH v2 3/5] KVM: x86: Add support for VMware guest specific hypercalls
From: Sean Christopherson <seanjc@google.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Covelli <doug.covelli@broadcom.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 22, 2025, Zack Rusin wrote:
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 9e3be87fc82b..f817601924bd 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -183,11 +183,13 @@ config KVM_VMWARE
>  	depends on KVM
>  	default y
>  	help
> -	  Provides KVM support for hosting VMware guests. Adds support for
> -	  VMware legacy backdoor interface: VMware tools and various userspace
> +	  Provides KVM support for hosting VMware guests. KVM features that can
> +	  be turned on when this option is enabled include:
> +	  - VMware legacy backdoor interface: VMware tools and various userspace
>  	  utilities running in VMware guests sometimes utilize specially
>  	  formatted IN, OUT and RDPMC instructions which need to be
>  	  intercepted.
> +	  - VMware hypercall interface: VMware hypercalls exit to userspace

Eh, I wouldn't bother enumerating the full set of features in the Kconfig.  Just
state that it guards VMware emulation, and let the documentation do the heavy
lifting.

> +static inline bool kvm_vmware_hypercall_enabled(struct kvm *kvm)
> +{
> +	return false;
> +}
> +
> +static inline int kvm_vmware_hypercall(struct kvm_vcpu *vcpu)
> +{
> +	return 0;
> +}

If we do this right, we shouldn't need a stub for kvm_vmware_hypercall(), and
can instead uncondtionally _declare_ kvm_vmware_hypercall(), but only fully
define/implement it CONFIG_KVM_VMWARE=y.  The kvm_is_vmware_xxx() stubs will
probably need to be __always_inline, but otherwise things should Just Work.

So long as kvm_is_vmware_hypercall_enabled() can be resolved to a compile-time
constant (of %false), the compiler's dead-code optimization will drop the call
to kvm_vmware_hypercall() before linking.  KVM (and the kernel at-large) already
heavily relies on dead-code optimization, e.g. we use this trick for sev.c APIs.

In addition to avoiding a stub, if we screw up, e.g. add an unguarded function
call, the bug will manifest as a link-time error, not a run-time error.

> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 793d0cf7ae3c..adf1a1449c06 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -135,6 +135,27 @@ struct kvm_xen_exit {
>  	} u;
>  };
>  
> +struct kvm_vmware_exit {
> +#define KVM_EXIT_VMWARE_HCALL          1
> +	__u32 type;
> +	__u32 pad1;
> +	union {
> +		struct {
> +			__u32 longmode;
> +			__u32 cpl;
> +			__u64 rax, rbx, rcx, rdx, rsi, rdi, rbp;
> +			__u64 result;
> +			struct {
> +				__u32 inject;
> +				__u32 pad2;
> +				__u32 vector;
> +				__u32 error_code;
> +				__u64 address;
> +			} exception;
> +		} hcall;
> +	};
> +};

Put this in the x86 header, arch/x86/include/uapi/asm/kvm.h.  The capability
itself goes in the arch-neutral header so that KVM doesn't have to worry about
collisions between capability numbers, but any arch specific payloads should go
in the arch header(s).
