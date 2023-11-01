Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D89315492
	for <linux-doc@vger.kernel.org>; Wed,  1 Nov 2023 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GbmChK2+"
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D60FD
	for <linux-doc@vger.kernel.org>; Wed,  1 Nov 2023 09:46:06 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da0c6d62ec8so6276746276.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Nov 2023 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698857165; x=1699461965; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TK6zRbNRnaaGZQru6tpn4DJQzZiGHhIaVNTtMzEhwHs=;
        b=GbmChK2++j9Z0JUs0KsrZHv0aPtsBHfQ0LvOKWrnYyC+OIcBG/jf0zqKdDGrmK1dkR
         lEoqiLdsmhTrvJzGEtUBgACUoyQko7v1lYUAwq61Z0S8BQZI5VFhr9Bp6t9nmB2sCFK6
         4VHft0h0xIwFXgELuGQTNBblAB8Nysjmzz4+gZPi01nbB8+lN+MTgZIAny0qcxYfz2ru
         rIy5oTNyaWUUxA97ABomiUqQO1LiYLGGXbtB15VA9Qn/gLJjd2voWNeyhOp/H5Kajepr
         Ngw8wDy4Nerq8zm8YywlCqJjyjm1WmSjnAPPtJKFkkkICxYDI3Cf0KM5bf3N4vhrjfnc
         r/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698857166; x=1699461966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TK6zRbNRnaaGZQru6tpn4DJQzZiGHhIaVNTtMzEhwHs=;
        b=bDgxnNhwttvfDv4vmktRXHdXvCPG1a7l5wg8zXZYVEVVokuY1M2sQNmWVNf5v8eITx
         h9H4pw9FebwIxSBybw9cW6OouTmWEa0JAYuZgoDYvY4oiNVv25bhp92WwffWZjsZznfn
         tpmA0PHLCo4Lg9YHhwwXLLdD3OXrdJ2UHdMM8nt9RWJzeRVBk+qRNZ/fFy7QPV32K3Ya
         1FEC8BFyf0AVFEfzB7rB6RQEv31p4IKYjZE+Hd+6SYW2g0H6/gkGBiWx8xMDVf6lVzuO
         smKBlLATCMZMHYgiQQUf1iz0oxDQNNIeZAXeXQD41DWuMUhE4lk1u2WLsm/Cmso4RhXm
         rTww==
X-Gm-Message-State: AOJu0YzzNqNF8HUxhgIE+YsUtUNEZ5SAF4bZcEISrhiY0mjKA0SSoHc8
	YcEerNyVzAfNeehp9CsIwnNMWt8yyMA=
X-Google-Smtp-Source: AGHT+IHtwh3c3DNIaPCk1TA9eY4hLxblw7bOvi/N9yqoqPx/PUA0Lv0gE6u8JTy7Iy5AmtVcGWneKurXYr8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:abcd:0:b0:da0:42f3:6ce4 with SMTP id
 v71-20020a25abcd000000b00da042f36ce4mr277219ybi.7.1698857165733; Wed, 01 Nov
 2023 09:46:05 -0700 (PDT)
Date: Wed, 1 Nov 2023 09:46:04 -0700
In-Reply-To: <20231101112934.631344-1-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231101112934.631344-1-paul@xen.org>
Message-ID: <ZUKAzGzEts262FqC@google.com>
Subject: Re: [PATCH v3] KVM x86/xen: add an override for PVCLOCK_TSC_STABLE_BIT
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 01, 2023, Paul Durrant wrote:
> @@ -3231,12 +3245,15 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
>  	vcpu->hv_clock.flags = pvclock_flags;
>  
>  	if (vcpu->pv_time.active)
> -		kvm_setup_guest_pvclock(v, &vcpu->pv_time, 0);
> +		kvm_setup_guest_pvclock(v, &vcpu->pv_time, 0, false);
> +
>  	if (vcpu->xen.vcpu_info_cache.active)
>  		kvm_setup_guest_pvclock(v, &vcpu->xen.vcpu_info_cache,
> -					offsetof(struct compat_vcpu_info, time));
> +					offsetof(struct compat_vcpu_info, time),
> +					xen_pvclock_tsc_unstable);
>  	if (vcpu->xen.vcpu_time_info_cache.active)
> -		kvm_setup_guest_pvclock(v, &vcpu->xen.vcpu_time_info_cache, 0);
> +		kvm_setup_guest_pvclock(v, &vcpu->xen.vcpu_time_info_cache, 0,
> +					xen_pvclock_tsc_unstable);
>  	kvm_hv_setup_tsc_page(v->kvm, &vcpu->hv_clock);
>  	return 0;

Please rebase, this conflicts with commit ee11ab6bb04e ("KVM: X86: Reduce size of
kvm_vcpu_arch structure when CONFIG_KVM_XEN=n").  I can solve the conflict, but
I really shouldn't have to.

Also, your version of git should support --base, which makes life much easier for
others when non-trivial conflicts are encountered.  From maintainer-kvm-x86.rst:

 : Git Base
 : ~~~~~~~~
 : If you are using git version 2.9.0 or later (Googlers, this is all of you!),
 : use ``git format-patch`` with the ``--base`` flag to automatically include the
 : base tree information in the generated patches.
 : 
 : Note, ``--base=auto`` works as expected if and only if a branch's upstream is
 : set to the base topic branch, e.g. it will do the wrong thing if your upstream
 : is set to your personal repository for backup purposes.  An alternative "auto"
 : solution is to derive the names of your development branches based on their
 : KVM x86 topic, and feed that into ``--base``.  E.g. ``x86/pmu/my_branch_name``,
 : and then write a small wrapper to extract ``pmu`` from the current branch name
 : to yield ``--base=x/pmu``, where ``x`` is whatever name your repository uses to
 : track the KVM x86 remote.

> @@ -4531,7 +4548,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		    KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL |
>  		    KVM_XEN_HVM_CONFIG_SHARED_INFO |
>  		    KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL |
> -		    KVM_XEN_HVM_CONFIG_EVTCHN_SEND;
> +		    KVM_XEN_HVM_CONFIG_EVTCHN_SEND |
> +		    KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE;
>  		if (sched_info_on())
>  			r |= KVM_XEN_HVM_CONFIG_RUNSTATE |
>  			     KVM_XEN_HVM_CONFIG_RUNSTATE_UPDATE_FLAG;
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index 40edf4d1974c..7699d94f190b 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -1111,9 +1111,12 @@ int kvm_xen_write_hypercall_page(struct kvm_vcpu *vcpu, u64 data)
>  
>  int kvm_xen_hvm_config(struct kvm *kvm, struct kvm_xen_hvm_config *xhc)
>  {
> +	bool update_pvclock = false;
> +
>  	/* Only some feature flags need to be *enabled* by userspace */
>  	u32 permitted_flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL |
> -		KVM_XEN_HVM_CONFIG_EVTCHN_SEND;
> +		KVM_XEN_HVM_CONFIG_EVTCHN_SEND |
> +		KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE;
>  
>  	if (xhc->flags & ~permitted_flags)
>  		return -EINVAL;
> @@ -1134,9 +1137,19 @@ int kvm_xen_hvm_config(struct kvm *kvm, struct kvm_xen_hvm_config *xhc)
>  	else if (!xhc->msr && kvm->arch.xen_hvm_config.msr)
>  		static_branch_slow_dec_deferred(&kvm_xen_enabled);
>  
> +	if ((kvm->arch.xen_hvm_config.flags &
> +	     KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE) !=
> +	    (xhc->flags &
> +	     KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE))
> +		update_pvclock = true;

Rather than a boolean and the above, which is a bit hard to parse, what about
taking a snapshot of the old flags and then doing an XOR?

	/* Only some feature flags need to be *enabled* by userspace */
	u32 permitted_flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL |
		KVM_XEN_HVM_CONFIG_EVTCHN_SEND |
		KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE;
	u32 old_flags;

	if (xhc->flags & ~permitted_flags)
		return -EINVAL;

	/*
	 * With hypercall interception the kernel generates its own
	 * hypercall page so it must not be provided.
	 */
	if ((xhc->flags & KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL) &&
	    (xhc->blob_addr_32 || xhc->blob_addr_64 ||
	     xhc->blob_size_32 || xhc->blob_size_64))
		return -EINVAL;

	mutex_lock(&kvm->arch.xen.xen_lock);

	if (xhc->msr && !kvm->arch.xen_hvm_config.msr)
		static_branch_inc(&kvm_xen_enabled.key);
	else if (!xhc->msr && kvm->arch.xen_hvm_config.msr)
		static_branch_slow_dec_deferred(&kvm_xen_enabled);

	old_flags = kvm->arch.xen_hvm_config.flags;
	memcpy(&kvm->arch.xen_hvm_config, xhc, sizeof(*xhc));

	mutex_unlock(&kvm->arch.xen.xen_lock);

	if ((old_flags ^ xhc->flags) & KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE)
		kvm_make_all_cpus_request(kvm, KVM_REQ_CLOCK_UPDATE);

	return 0;
