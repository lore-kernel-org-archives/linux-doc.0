Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499340;
	b=EibS3eVThrS/0ptPWzUStGKWeLMjKaFX8WVY/qKJ0W5fJRY0KVdEzC3fdZTrPLC4sQN/
	 Y0jfsY4NVQXQohJovMy+oUdUjzrpf/ocHzRXrHgsJwljP9yJOzXFQgq2tTxhmReL0Kf7T
	 78U87iCjOD3MAm6YehF7cPi8bcu+mK1Uxo3IXPShR1QV6xKDeZCxcEUPur2z1rwSpXZ0E
	 94463zeFLa1s5nj4y5ss9I0FZrLh9NjjyVLAzeD+eA2x1a09WnShdOB+pej0DiC4YLZ6S
	 q/NyIfm3Zjddc0usRh8kPiIwq5jQvM3hcvIjnizNniXhweckLVthTW5D+YrU/60qYJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lfZbqFmLr8Q6MECdNX562ifwqH83lxZBW8nCUfGoGTs=;
	b=rlv5rgvYyoUWrHCQWgzi3ODr7KlFPUlPzMFzw3vce83Ckr43Ha4h9x6GmDIhUXYIB+iL
	 2L0Aed9tq2ESrlUlw2k3v+tnjJZf3bDtfDJRmeBNJH35W2vBc7vJNKDvVfPczsNPUPcUF
	 ORyjmcFs7vI3yhsNUvFy37KqA06XhjIC8mLxH/w3lWHFjdnkNR/hyjAGpnSCdfTfbcgwa
	 khWjUQQVVj0C2jAKyvLpeCKZWeAF01Hi9gmCr9na2txCsC01oc55IDyzZ3RcMGgjy7FZ4
	 Rsf8xCSztHFEr1OkYpMi9XTM7iKBvpagdzuKWJOqIijj4CA4XOyE/A+NOWxzmDcNBeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="N6/XTZC1";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB73606A323
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB73606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=N6/XTZC1
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dc202a60eso875668f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792499338; x=1793104138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfZbqFmLr8Q6MECdNX562ifwqH83lxZBW8nCUfGoGTs=;
        b=N6/XTZC1nghPVLJWcx1jJKYR4/4ERrwB29Br8hBD6S6stsVkyggKbfiq5fzNXL0Ppa
         CpU5KUKmPjnpFpMbUt+w1NE/dR0xBhSLkoiEJUb8HbxJpF16pLYMJFzX4LZczorpoYDL
         tpWtXbrLIlLKnn+kut1zfc0Zvxe0vcdJhaSEnPgwC3UywPI7qKVSYwJwDJ1nYraXTk87
         xH4nt1vtE5uwMdNG/3RcqX25B/npAZxPRJyZXTpZryF+VdoS8Kaw+K+l/tJaKRJOage0
         UlXTfArrgqnCVZ89FPaeaQ8XanGPj7Wli8RNgRb/39LwAyz4fj5NCWP4ArMwt/WiJD2X
         8RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499338; x=1793104138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfZbqFmLr8Q6MECdNX562ifwqH83lxZBW8nCUfGoGTs=;
        b=rU22ZKen+Hqqor+lNwcy7rl5Ph46e9kTCaorTXbV/Tj8IOl/s53r/m//NjP/rOoeqb
         UDHvkiPOgZmXgAThgfbXATE83Esqw+TQO/tsT7dHSHiCieED4WGj1yaophDB/s9OTGQS
         JcetsI3eXfI8ig6QSGxlYCrr06DThlZmWC0T0hS6npMTSTBBTEdKDY0+BjCrBC11LBuO
         hvuildTs+MK1baSzPk57c2m2GTF9DKhBqkFVp7PoR5zi4OmuhxrBzUBidL0dAAiMlgUZ
         JLMOtKFahiTqnUxm1QXaNPtprCSA9WfaZZ19QJflmr/akH9m3Ni3f8cOJQnInxmHnPbb
         vqow==
X-Forwarded-Encrypted: i=1; AKwUvBwjBXaeqHsHp+DhbRqQQsoHPiU29+qj1SEqTEN7G20FpPzG632W/dpUrhaJiN649zKZWbwBB8EwEeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJixjdI7G5wjUBy5dC7NVKITTvKNFOkkkK/ISxNPsZFFkYAxVKt
	DBrs9lM8wD5w8/R8LEWDtsyzTUhBZT6zmdnD1PClwNuT0f5zvrzPSIMYJV+sGfr2n+s=
X-Gm-Gg: AYBFou2nzPOiTUS/yya4wgKqS/qa3UnOd/EbDEmMSps8jIUlTi+S9uPBGawv/2nYC1V
	LbS915mxMT4xCGdPstIFwvLF5AqwiP9ANHNu/HQGrN8KhLepLDcRpKDoi3FutalKN60AJNWguhb
	t4ieHctcle4to70YAICRDqBe6OxpjTgvFceHaxKC1aC6jUcNPmQDQIknJitgeD6wTzZcF+Hlfyx
	MTSJGvoDrfYWuK9iMb2/vQ6LkLgd9WDqgNZs08M4GyBIsNvEJdDUaT42UfAYk5cPYilbAXHRdCM
	kkoxlOoASiN/oHeCblz0Mt0SDin33oj60H20d9OvrAaoytP4dCQucWy12Vz3JM9BH37+sh+yANp
	hqQrMDm2irOGqlw5b3IDrRxNEHlvS+I6NR7Qgy/D9NP1zCttrK4t1RnE2iV1SVasHeWvwGGQ6FA
	LjNmLGxIhPvLA4UqqZVxa/YLi5/XUQH9IjcTzl3a5aLJKdHDQ9LUo/Kf+aJScDkxw/FxsWOJHZO
	djykFawZas=
X-Received: by 2002:a05:6000:4694:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-48e07f9c387mr16153415f8f.40.1792499337854;
        Tue, 20 Oct 2026 05:28:57 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbd33sm5588977f8f.8.2026.10.20.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:28:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:28:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>, Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2 3/6] panic: Allow postponing pre-kdump notifiers
Message-ID: <atdee9q7DExYLGPE@pathway.suse.cz>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
 <52183acf25209275a9a57fe5d746f82d3b7efc3c.1790014793.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52183acf25209275a9a57fe5d746f82d3b7efc3c.1790014793.git.zack.rusin@broadcom.com>

On Mon 2026-09-28 13:55:37, Zack Rusin wrote:
> Provide an escape hatch for debugging kdump failures that may involve
> pre-kdump callbacks. Add panic_pre_kdump_postpone to skip their early
> invocation in crash core without consuming the once-only guard.
> 
> When enabled, the chain runs before kdump only when
> crash_kexec_post_notifiers is also enabled. Leave the late panic call
> unchanged so callbacks remain eligible if that path is reached.
> Skipping the callbacks may prevent hypervisor crash handling.
> 
> Suggested-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> Link: https://lore.kernel.org/r/bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
> New in v2: optional postponement policy suggested by Guilherme.
> 
>  Documentation/admin-guide/kernel-parameters.txt | 14 ++++++++++++++
>  include/linux/panic_notifier.h                  |  1 +
>  kernel/crash_core.c                             |  3 ++-
>  kernel/panic.c                                  |  2 ++
>  4 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 33cd30996e47..3d722df30838 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4904,6 +4904,20 @@ Kernel parameters
>  			This option should only be used for systems with the above
>  			constraints as it might cause the panic operation to be less reliable.
>  
> +	panic_pre_kdump_postpone=
> +			[KNL] Defer pre-kdump notifiers to the late panic path.
> +			They run before kdump only when
> +			crash_kexec_post_notifiers is also enabled. If panic
> +			reaches the late path without entering kdump, they
> +			can still run there.
> +			Intended for debugging kexec/crash-dump failures.
> +			Skipping these callbacks may prevent correct crash
> +			handling by the hypervisor.
> +			Format: <bool>
> +			Default: 0
> +			Writable at runtime via
> +			/sys/module/kernel/parameters/panic_pre_kdump_postpone.
> +
>  	panic_print=	Bitmask for printing system info when panic happens.
>  			User can chose combination of the following bits:
>  
> diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> index 3ad390764a41..655ee5c77181 100644
> --- a/include/linux/panic_notifier.h
> +++ b/include/linux/panic_notifier.h
> @@ -11,5 +11,6 @@ extern struct atomic_notifier_head panic_pre_kdump_list;
>  void panic_notify_pre_kdump(char *msg);
>  
>  extern bool crash_kexec_post_notifiers;
> +extern bool panic_pre_kdump_postpone;
>  
>  #endif	/* _LINUX_PANIC_NOTIFIERS_H */
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 5d9fe9e00f39..d6b2293dd0fe 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -140,7 +140,8 @@ void __noclone __crash_kexec(struct pt_regs *regs)
>  			struct pt_regs fixed_regs;
>  
>  			crash_setup_regs(&fixed_regs, regs);
> -			panic_notify_pre_kdump(NULL);
> +			if (!READ_ONCE(panic_pre_kdump_postpone))
> +				panic_notify_pre_kdump(NULL);

Honestly, it looks a bit confusing to me.

The name "postpone" suggests that they will be called later.
But they likely will never be called because the crash kernel
will take over the control and eventually reboot the system.
The panic() path will never run.

Also there is:

void oops_end(unsigned long flags, struct pt_regs *regs, int signr)
{
	if (regs && kexec_should_crash(current))
		crash_kexec(regs);

where

int kexec_should_crash(struct task_struct *p)
{
	/*
	 * If crash_kexec_post_notifiers is enabled, don't run
	 * crash_kexec() here yet, which must be run after panic
	 * notifiers in panic().
	 */
	if (crash_kexec_post_notifiers)
		return 0;

So, when: "crash_kexec_post_notifiers == true" then
kexec_should_crash() returns "0" then
crash_exec() is not called. The system might still
call panic() but remember "crash_kexec_post_notifiers == true"
so the notifiers are called before __crash_kexec().
So panic_notify_pre_kdump() will still get called
before __crash_exec().

Is this intended, please?
What is use case, please?

Maybe, it would make sense to add "panic_pre_kdump_disable"
which would completely disable the notifiers when they cause
problems.

Best Regards,
Petr
