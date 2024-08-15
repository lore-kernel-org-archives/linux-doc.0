Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660291B373E
	for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737607; cv=none; b=lTlz0I0ihy8nyJ8IQuM2VV9qtZpXcRQTNrILW3eLKmZth/UzIk0mzXihoBFMBKdCePshvFWb0lhG+IX6AlrdbGEEjGXSSE1A7nNW59C6rsVENoFs7zfq3/ccGVQou8gfzQwsF7Sv9hB+DK/zFHvmLta/6xGOki3E/1LGacewQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737607; c=relaxed/simple;
	bh=8LOB4hMOsdMgF4WbkQ49wP5IJlz8nKKjriUyn+4jDsE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dKP8pWHwNW8In0OEOZGZkdvdetgcTbLjeCbpOcT0qGWIDFF01IO40wB7GiwH6xlAZso6m7poHT9ShaBO2iptM+c3+Jt4xcleKpi8KMl6BlBg1KRciCEpJGQ04PmWO5LY2edlDqP4GBdjhE3gWtaZEJ3A8kUEaCQ+0WSqOfCYnBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k2Ce3tGK; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2Ce3tGK"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso834231a12.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 09:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723737606; x=1724342406; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8NnW+ymJPO/5j9ioWkpEO+FljjLsToFL+mCOZ9DuZ8=;
        b=k2Ce3tGKvAagcinHeUztFYH7OCI3WMGz/YeWB2Nrbcz6uD+TzyvA077Gl9Ifh50Cyy
         01rGtL6ciEnPLrRUzhccZXrczauI7kYWWU8ghB8zJ+aZZIfzK9vKLl9Z7rYiP5SUcNOt
         RPQx2VFdnlYqE8qDuavlABzXwMgmVgR/eVk6urr8K5Yp7BP7R5vAYhCcUx9aHrwOlZqM
         Oozn8GPVo7+A7mki8sCoQtKjVhAQ2bbmXHtGCexm9WTg40lOxNFlrJjVNeb2QZIdF0NL
         Hk0MBGDoddQukfiMbXt/mYuQDSWE/7pgQhx3IrGy3dhErmkMGEqXHGxBodsBxSgnGe+s
         4jwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723737606; x=1724342406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8NnW+ymJPO/5j9ioWkpEO+FljjLsToFL+mCOZ9DuZ8=;
        b=KeyO7FUyIX9qthPFBrS0kXkYzJmqthcxkr7Dx2MdjUePayh3VU809r160/j+paQO6d
         Foips95Th96pHfsAClCCgDBJyAMf5ozxNie8uMPmTReKUlEPP1nFUS880uG7OmCtUkpx
         dMeVE5bnDn5PAAvCnZddryofmNh5SqWgYMPABq5j80L7WcIVcxljjoiWENgy7cxWMIU2
         CR8jU79taKPs51kpy3Fqeptppp7LEM/fMfjGf6Q1ndnH5VGnwuNiH09k03cSgcsTNKb3
         CXpGX76fvVWG1cfSNav4GAN0e0AL6Up8Lv3O4E1lP1PFWluX44WhPBvIUObnDssNLgXU
         R97g==
X-Forwarded-Encrypted: i=1; AJvYcCUaJXqTMmoqlN4ibunwEN6W4rO1IqOtSFv/jgW9IM0ryrepmVh/VY4biYkqEQsgque6VprGr7gqMwvxmwog+PiV3rYx6GdWGxBf
X-Gm-Message-State: AOJu0YzMEfM6r97erXf8dBFyqWaN536DmjxeNIhwI8HfnW2P3Bc060bc
	cHg8VT3DHeGDgWUnXAs9DYj9nCaDEx3vBJw/bEPm/UVBJh+d0RZckOt0oNkXN596qfGZ33anP7n
	aUw==
X-Google-Smtp-Source: AGHT+IGU1fKO78A5yr12VP/rYnQq2ySJsTi2GH/BAWbZmuduEGVPVlZ8I3b0WIj9vqu/ONJN8tWWO0QlPaE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:90a:b0:7b8:b174:3200 with SMTP id
 41be03b00d2f7-7c6b2c6857cmr9343a12.5.1723737605562; Thu, 15 Aug 2024 09:00:05
 -0700 (PDT)
Date: Thu, 15 Aug 2024 09:00:04 -0700
In-Reply-To: <20240522001817.619072-14-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522001817.619072-1-dwmw2@infradead.org> <20240522001817.619072-14-dwmw2@infradead.org>
Message-ID: <Zr4mBNTSquDqOtfw@google.com>
Subject: Re: [RFC PATCH v3 13/21] KVM: x86: Improve synchronization in kvm_synchronize_tsc()
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
> When synchronizing to an existing TSC (either by explicitly writing zero,
> or the legacy hack where the TSC is written within one second's worth of
> the previously written TSC), the last_tsc_write and last_tsc_nsec values
> were being misrecorded by __kvm_synchronize_tsc(). The *unsynchronized*
> value of the TSC (perhaps even zero) was bring recorded, along with the
> current time at which kvm_synchronize_tsc() was called. This could cause
> *subsequent* writes to fail to synchronize correctly.
> 
> Fix that by resetting {data, ns} to the previous values before passing
> them to __kvm_synchronize_tsc() when synchronization is detected. Except
> in the case where the TSC is unstable and *has* to be synthesised from
> the host clock, in which case attempt to create a nsec/tsc pair which is
> on the correct line.
> 
> Furthermore, there were *three* different TSC reads used for calculating
> the "current" time, all slightly different from each other. Fix that by
> using kvm_get_time_and_clockread() where possible and using the same
> host_tsc value in all cases.

Please split this into two patches, one to switch to a single RDTSC, and another
do fix the other stuff.

> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ea59694d712a..6ec43f39bdb0 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -201,6 +201,10 @@ module_param(eager_page_split, bool, 0644);
>  static bool __read_mostly mitigate_smt_rsb;
>  module_param(mitigate_smt_rsb, bool, 0444);
>  
> +#ifdef CONFIG_X86_64
> +static bool kvm_get_time_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp);
> +#endif
> +
>  /*
>   * Restoring the host value for MSRs that are only consumed when running in
>   * usermode, e.g. SYSCALL MSRs and TSC_AUX, can be deferred until the CPU
> @@ -2753,14 +2757,22 @@ static void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
>  {
>  	u64 data = user_value ? *user_value : 0;
>  	struct kvm *kvm = vcpu->kvm;
> -	u64 offset, ns, elapsed;
> +	u64 offset, host_tsc, ns, elapsed;
>  	unsigned long flags;
>  	bool matched = false;
>  	bool synchronizing = false;
>  
> +#ifdef CONFIG_X86_64
> +	if (!kvm_get_time_and_clockread(&ns, &host_tsc))
> +#endif

I'm pretty sure we can unconditionally declare kvm_get_time_and_clockread() above,
and then do

	if (!IS_ENABLED(CONFIG_X86_64) ||
	    !kvm_get_time_and_clockread(&ns, &host_tsc))

and let dead code elimintation do its thing to avoid a linker error.

> +	{
> +		ns = get_kvmclock_base_ns();
> +		host_tsc = rdtsc();
> +	}
> +
