Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7BE4C9019
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522886; cv=none; b=fmxgEqk6+pfMEmkjJ5VreED27dJ89jcqq7JlwbLWS6QKWklV8tOg43fcwZrLwnDE/fyp1hP69VWHaTJmHE23d2n/T3TsHby1CsXLfzfJqH7QpxW+MzwwoOtg71Pk3RhGjv+PBSW3YzhCMW/Rxgsbi5w1rGCfrAZ5GAc2wMFDgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522886; c=relaxed/simple;
	bh=PyWD7vv+PrPGGDMvNSumMzBl2dGSOH4pmZnHK+3zSzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6HEdYGbTxtZEeM1oJeZz9vo7yRMlf4JbshXXJmgyIxoQ6YJXkRrVNncP1ZsqJmNb/YcQPp0E0UWtCu6JO3kSTgmXP90b2zXMhp1DxX/yAtAOzx9XwJo12K4xeE/Zlu6xbtNq+gdrN2FzfwGGzB/v9sD2L1gZl3NFJWSz48yjzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I+Qhjawh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I+Qhjawh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so442099f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783522882; x=1784127682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6o/0oz9zzNfbXHaSSbGqw9HJrGj0kr4qZrqpo2nmLDc=;
        b=I+Qhjawh/wlGH9EZP7GaZtgjQtiTT0U45tNgA5MtlGcKDjEu9/o/Rh2uC3nV9fr9BQ
         c585wfmFNRTodycARKnC77RNs3QGh7zJzAlAXr4xbb5E23Bmzjb6WGOwIPbyHggdzepO
         e98S8BOJwxKYbUgmwj4yzDyNKG0UpyNgB+oP6veZQrq7YeQpJihngc+ASOwnfzaWOBxC
         7nQqOsrL9qyegONhn3Psree+tWXmZ/nud7JXzxuM1bfGWs6iocsUkId21FXfPE3yrZd3
         O7DdQ7l7by2JALuuPDA6uTAL3hMSAbcoxNOJj4U3PiyiP1K82M89oHgPsA2pqdjdClPM
         /nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522882; x=1784127682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o/0oz9zzNfbXHaSSbGqw9HJrGj0kr4qZrqpo2nmLDc=;
        b=f9gLiIxtOsk9oUONu9aSSnpLgOAbJMDZoC8+AEACYo3FngpTgWQ8AqKJRZvauy2lkU
         nGil9B3Q+YE64fpU0U5GaCy3ak+ptD6f0MVYb/qiPWZH8PYv5hEE622LcvAIWYwy/0Ro
         KcSPLM9GTxWJaXdIuWpqevOEMurOlrcuvA0A5P/6eeAL8dsjSVnVoVvgD7R0/vKuTCNU
         x1c3jWUU39mjWpn44+mrXFgJASd5+F8D/AjQ4snaRB1Ab7woTeCAvAL1pem+hlMct0/M
         NHbQnbL2wuaxVLfbneHe7o0m4UatPw5FHLMuSA2cGqCIvgtSwcSTfe1DbqJ+oRh0VN7c
         Axbw==
X-Forwarded-Encrypted: i=1; AHgh+RpDXGYl/vvAuvo0yu4IHVOaeTga1V9z4L84FKcrMK7uL4tSJqL8KbsWwUdHso/pu77B0jKUNyE166k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjsaX2nZdVDD8PuoNUvAD4Lf97mzgqx3NjMARF066CnOUCTn6n
	RfdSo52AdXSgK80hFGg4VrHOSuga3A5qhP+bT18hO/pkVxAxNvznQL29ToKJVZ4b/7k=
X-Gm-Gg: AfdE7cmu1JbpbLLApDAV2aECG1LQk+DNbjRmTWTV/6kUfQlBVyPAiI7Fl60MKVJmvTV
	0yrVXVovzS6SWfwioYG4BkWxXBQTRdWLtENCAp61ZoahMUdowiN3zLOdoYbnOL+eBkBaHW6HF37
	5m7H6dC9JBe7Rx4FZlq+WI07Y0bN0rIo2iOMGNwwhZkM8HllfqR7IxN1uObMIS/emHHsUD9VFU6
	DvuIIhVPWz5QwBGoB+mMBAKzMol2A6MvzySMazzx9s+sk1OhJwEg/8JB6cIKw1qqGebhXuLmBFN
	uzJ4Y+y2R2LwRdFiNCwjU/LxIzc/csC48byN7hWxBTSlxfh7eBsBOlQsERhndWhkykFlLXrejgQ
	m2E18XtFv0yHI1CB04mjf9od5OKyWeRshhEfvyaifIZ4vhyAQtcEmINPBZzC3WKEDAz8k5agsJJ
	NiO6jI3i76SsVZQK8=
X-Received: by 2002:a05:6000:455c:b0:47d:f43d:8947 with SMTP id ffacd0b85a97d-47df43d8a02mr1010322f8f.47.1783522881817;
        Wed, 08 Jul 2026 08:01:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm39225385f8f.31.2026.07.08.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:01:21 -0700 (PDT)
Date: Wed, 8 Jul 2026 17:01:19 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <ak5mPxUdp2pzCMt5@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>

On Tue 2026-06-30 17:35:58, Andrew Murray wrote:
> The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> are two distinct mechanisms for providing similar functionality which add a
> delay prior to each printed printk message.
> 
> boot_delay provides a kernel parameter for delaying printk output from
> kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> configurable only via sysctl and thus is only used post boot.
> 
> Let's deprecate the boot_delay feature in favour of printk_delay. In order
> to preserve functionality, we'll also extend printk_delay such that it can
> additionally configured via an early kernel parameter.
> 
> Behavior change:
> 
> The delay enabled by both "boot_delay" and "printk_delay" continues
> working even in SYSTEM_RUNNING state. It must be explicitly stopped
> by setting printk_delay=0 via sysctl.
> 
> The delay is skipped when the message is suppressed in all system
> states. It used to skipped only for the boot_delay.
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Note that Sashiko AI warns about possible problems with negative
printk_delay values, see
https://sashiko.dev/#/patchset/20260630-deprecate_boot_delay-v2-0-f9883d36aa4b%40thegoodpenguin.co.uk

But they should be handled in both the early parameter
and sysctl interface by the "10 * 1000" and "&ten_thousand"
limits.

The only potential problem might be a warning about possible
"sign" mismatch from the compiler. But I do not see any
even with make W=2.

Best Regards,
Petr
