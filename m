Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8673C524B4
	for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 04:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723611453; cv=none; b=H9KqpcttSpBz15Mrf8hVDe4rze0j7EouZQB/6efsWNDYozaTRjxOtgGBgedsuDvhczH5jnBoct1A5Cw/P3pQ4rpwQBMjNktn3izp76x6r6Ak4Hmtnq96jb6KL2styCP30ETTZXx0n2jQG628+nBT/4lFGLo8t47eZIU8G39NMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723611453; c=relaxed/simple;
	bh=YXccYMLFa96XMfu1WDEP2Dt5RSZkFd9vtGe9PaTJtwU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qQ5bgcx7hT1YTPUdIGgU72fO3V9fv8SBZ+b5jSFPIYyDC/iaFPpyOehgtJ6dORKa21PltehLOn9n9eT61+ARVNbN4itD/leV74xaIiXyHzqHWsqvszlw0q4N0kUQVmsS8Gt9H3GlWcOzVQmgTE4VMGvuA5SzCQXqLRjOe8TCYn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LKF/ne7+; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LKF/ne7+"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-200aa7dbc3bso42886895ad.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 21:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723611451; x=1724216251; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cWgG6XKabHVJipLdUK4SmJLHmxQeqEES8mvhtsUgneU=;
        b=LKF/ne7+ulDYouhnqkHbdo8J1N8fWq+y9J/36cmeLNR47qZoxmxCZQctRBmRCqppYs
         o2cje0eNGu2a8SyRtp5px6SuyobYExHMja3q5OffsRMTM/Vevbpea/8iysfn1ZnP2oS4
         t4LE2QFIElnTcVSWTVbxXPZwl/EZj253EYf4zzSpAKuo3qyXb3/ReZ/+TGOBo5O8IX3R
         oo0LV1igAT1vopKhUmOxhElTI0Q/EW8JIFtRXD+7GhBeFF3nCgc+r3CBzVVW+ePd77ZL
         2b/95ZGOGRYxVQPuz4au/7O9zWMqxDdmZtnWlKdIWSGyr835J4jMwnlErzScmnh6YdYc
         ONwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723611451; x=1724216251;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWgG6XKabHVJipLdUK4SmJLHmxQeqEES8mvhtsUgneU=;
        b=nowdltBhVDgU21zowlYmTLWozR1qbkl02ewOdz/RABRT3WfTZtd14tl/MZbtfervhu
         JDehiqJvxX/itLJj50EWsf2mSqTkQdxTSphRkwjZCQ9G4kB/DoT5NdkNqXuSa4QsFKfH
         5uMEMFFvJXDGu2FMcjvFLVRU4rkAJrS7CVznKhcbbn9XRW/jYXEn/DPumVpwMGy3lcYl
         FcVejt63UC8DceD7cf9/0scVGnBqt209QXij13xWMInWla9PqcxvrGHCPaxfgBox0NxP
         fkI5SdcVmpZ2Y4bKzXxpzRSl48mfyCBiaJtqa4l8weasRD2I1K9KAJZr5or7RdFvB6w4
         RV/A==
X-Forwarded-Encrypted: i=1; AJvYcCUvOdWooXQIGkSke2UEebmJCT5jIIBCQRRLGdx8JPAqMIZW9LuwtNcePjpirT2tL07nAEkDG0JU8mw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1SjmEkORWKLpaIh7T2Rv2tRS1VIcJiskmifZor4kP3Sgy4uv
	Rl/M7GxwL5tsnfprV68HzLRpxfj07gJNcyuu3SlP/IbDoFfp3Yxp7emktGJvfmf1D6qsx6WOpWM
	R8w==
X-Google-Smtp-Source: AGHT+IEjuqIH2I7nKGtbSjNMqKc3S2bpfZK77l9Ly4zJZH6+/tKqDOzzvO1sJg9+jVPQQo695sOQz18bnEs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:da8b:b0:1fd:6529:7443 with SMTP id
 d9443c01a7336-201d64b4f7bmr1285895ad.11.1723611450408; Tue, 13 Aug 2024
 21:57:30 -0700 (PDT)
Date: Tue, 13 Aug 2024 21:57:29 -0700
In-Reply-To: <20240522001817.619072-11-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522001817.619072-1-dwmw2@infradead.org> <20240522001817.619072-11-dwmw2@infradead.org>
Message-ID: <Zrw5ORlemXZPrIWl@google.com>
Subject: Re: [RFC PATCH v3 10/21] KVM: x86: Fix software TSC upscaling in kvm_update_guest_time()
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
> There was some confusion in kvm_update_guest_time() when software needs
> to advance the guest TSC.
> 
> In master clock mode, there are two points of time which need to be taken
> into account. First there is the master clock reference point, stored in
> kvm->arch.master_kernel_ns (and associated host TSC ->master_cycle_now).
> Secondly, there is the time *now*, at the point kvm_update_guest_time()
> is being called.
> 
> With software TSC upscaling, the guest TSC is getting further and further
> ahead of the host TSC as time elapses. So at time "now", the guest TSC
> should be further ahead of the host, than it was at master_kernel_ns.
> 
> The adjustment in kvm_update_guest_time() was not taking that into
> account, and was only advancing the guest TSC by the appropriate amount
> for master_kernel_ns, *not* the current time.
> 
> Fix it to calculate them both correctly.
> 
> Since the KVM clock reference point in master_kernel_ns might actually
> be *earlier* than the reference point used for the guest TSC
> (vcpu->last_tsc_nsec), this might lead to a negative delta. Fix the
> compute_guest_tsc() function to cope with negative numbers, which
> then means there is no need to force a master clock update when the
> guest TSC is written.

Please do this in a separate patch.  There's no need to squeeze it in here, and
this change is complex/subtle enough as it is.

> @@ -3300,8 +3306,6 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
>  		kernel_ns = get_kvmclock_base_ns();
>  	}
>  
> -	tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
> -
>  	/*
>  	 * We may have to catch up the TSC to match elapsed wall clock
>  	 * time for two reasons, even if kvmclock is used.
> @@ -3313,11 +3317,46 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
>  	 *	very slowly.
>  	 */
>  	if (vcpu->tsc_catchup) {
> -		u64 tsc = compute_guest_tsc(v, kernel_ns);

Random side topic, kernel_ns is a s64, shouldn't it be a u64?

> -		if (tsc > tsc_timestamp) {
> -			adjust_tsc_offset_guest(v, tsc - tsc_timestamp);
> -			tsc_timestamp = tsc;
> +		uint64_t now_host_tsc, now_guest_tsc;
> +		int64_t adjustment;
> +
> +		/*
> +		 * First, calculate what the guest TSC should be at the
> +		 * time (kernel_ns) which will be placed in the hvclock.
> +		 * This may be the *current* time, or it may be the time
> +		 * of the master clock reference. This is 'tsc_timestamp'.
> +		 */
> +		tsc_timestamp = compute_guest_tsc(v, kernel_ns);
> +
> +		now_guest_tsc = tsc_timestamp;
> +		now_host_tsc = host_tsc;
> +
> +#ifdef CONFIG_X86_64
> +		/*
> +		 * If the master clock was used, calculate what the guest
> +		 * TSC should be *now* in order to advance to that.
> +		 */
> +		if (use_master_clock) {
> +			int64_t now_kernel_ns;
> +
> +			if (!kvm_get_time_and_clockread(&now_kernel_ns,

Doesn't this need to be called under protection of the seqcount?

Ahh, but with that change, then get_cpu_tsc_khz() isn't guaranteed to be from
the same CPU.

Oof, disabling IRQs to protect against migration is complete overkill, and at
this point dumb luck as much as anything.  Saving IRQs was added by commit
commit 18068523d3a0 ("KVM: paravirtualized clocksource: host part") before there
was any coordination with timekeeping.  And then after the coordination and
locking was added, commit c09664bb4418 ("KVM: x86: fix deadlock in clock-in-progress
request handling") moved the locking/coordination out of IRQ protection, and thus
made disabling IRQs completely pointless, except for protecting get_cpu_tsc_khz()
and now kvm_get_time_and_clockread().

Ha!  And if we slowly unwind that mess, this all ends up being _excrutiatingly_
close to the same code as get_kvmclock().  Sadly, I don't think it's close enough
to be reusable, unless we want to play macro games.

> +							&now_host_tsc)) {
> +				now_kernel_ns = get_kvmclock_base_ns();
> +				now_host_tsc = rdtsc();
> +			}
> +			now_guest_tsc = compute_guest_tsc(v, now_kernel_ns);

I find the mixed state of kernel_ns and host_tsc to be terribly confusing.  It's
hard to see and remember that kernel_ns/host_tsc aren't "now" when use_master_clock
is true.

For TSC upscaling, I think we can have kernel_ns/host_tsc always be "now", we just
need to snapshot the master clock tsc+ns, and then shove those into kernel_ns and
host_tsc after doing the software upscaling.  That simplifies the TSC upscaling
code considerably, and IMO makes it more obvious how tsc_timestamp is computed,
and what its role is.

When all is said and done, I think we can get to this?

	/*
	 * If the host uses TSC clock, then passthrough TSC as stable
	 * to the guest.
	 */
	do {
		seq = read_seqcount_begin(&ka->pvclock_sc);

		use_master_clock = ka->use_master_clock;

		/*
		 * The TSC read and the call to get_cpu_tsc_khz() must happen
		 * on the same CPU.
		 */
		get_cpu();

		tgt_tsc_hz = get_cpu_tsc_khz();

		if (use_master_clock &&
		    !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
		    WARN_ON_ONCE(!read_seqcount_retry(&ka->pvclock_sc, seq)))
			use_master_clock = false;

		put_cpu();

		if (!use_master_clock)
			break;

		master_host_tsc = ka->master_cycle_now;
		master_kernel_ns = ka->master_kernel_ns;
	while (read_seqcount_retry(&ka->pvclock_sc, seq))

	if (unlikely(!tgt_tsc_hz)) {
		kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
		return 1;
	}
	if (!use_master_clock) {
		host_tsc = rdtsc();
		kernel_ns = get_kvmclock_base_ns();
	}

	/*
	 * We may have to catch up the TSC to match elapsed wall clock
	 * time for two reasons, even if kvmclock is used.
	 *   1) CPU could have been running below the maximum TSC rate
	 *   2) Broken TSC compensation resets the base at each VCPU
	 *      entry to avoid unknown leaps of TSC even when running
	 *      again on the same CPU.  This may cause apparent elapsed
	 *      time to disappear, and the guest to stand still or run
	 *	very slowly.
	 */
	if (vcpu->tsc_catchup) {
		int64_t adjustment;

		/*
		 * Calculate the delta between what the guest TSC *should* be,
		 * and what it actually is according to kvm_read_l1_tsc().
		 */
		adjustment = compute_guest_tsc(v, kernel_ns) -
			     kvm_read_l1_tsc(v, host_tsc);
		if (adjustment > 0)
			adjust_tsc_offset_guest(v, adjustment);
	}

	/*
	 * Now that TSC upscaling is out of the way, the remaining calculations
	 * are all relative to the reference time that's placed in hv_clock.
	 * If the master clock is NOT in use, the reference time is "now".  If
	 * master clock is in use, the reference time comes from there.
	 */
	if (use_master_clock) {
		host_tsc = master_host_tsc;
		kernel_ns = master_kernel_ns;
	}
	tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
