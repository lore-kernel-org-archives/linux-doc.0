Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF80432D45B
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784217176; cv=none; b=CxW/2loGZ79pRYlyrkuIY5e3oCEakfw/uUbhfm150ByA46/NHW5gaOJ/CK7XyFLY/LhtTVzBgExZSu6UC6VYZHcnE72AguBpsBu//rjge2gCeghtA1z6C57rkc35AEH4NA9T8mjt8jQ14poGjA4y3JtoTIJX1jpwKuRfjlRteKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784217176; c=relaxed/simple;
	bh=cpUqMFNxegSC+spKyaaAW/l/idjzsLOp3+SPVugt+dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgreKaQzMFzfN7f5ZdqZIKcWisEZxAIVinp03i+udYCSlDjZkN+QlxGdSqtyU8iSNa3GmfxPTzFadynvfG1gFUoZN9od/B+uxFIXY8mtUcTkzyYPuHei7q1R9hunvvSJKVT/EsukmDAoJUJvO6TFCvC9zjRB0eLQItkLZBfU5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AKAWuSBf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AKAWuSBf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c19bad03so57587365e9.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784217173; x=1784821973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=610vcd2ONEcjkXFZg+eI0At7uTF43lyNmlLxQtd66Lk=;
        b=AKAWuSBflxlLeN57AI9qchnnKZEDjgyYkTKHDfV5pVwF8BmBi4GiLWnzbzVzBYVIV5
         XV4dZE8/2vbrmKHMQmBaNUu0Gr0mWivuhaOUlrKpTLidaqBsyTN2VlVtsyfdzR6X7ccE
         6oGISs7p0KrF6I/VeahQpAYSuslJjaQcAlsknq0DOqa8k/7oVJR/e/RUOcuk6age2E0L
         9C22+hOxheAoadPobXcPJyLnm+ZmZLDEk74ebtZwppkxqrheq86peOvKjJOLYGtOmU5N
         glwvp280U1F7CPSNKeSr7sPTQ3uVHR2S2iJH7BCj3T+qrnGQkY1pSxE6bITut7MnoU39
         s20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784217173; x=1784821973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=610vcd2ONEcjkXFZg+eI0At7uTF43lyNmlLxQtd66Lk=;
        b=djxGHsFUK8HQA3hy3zdH74a8VOmjw6V5DeGTdf7X+lSCLf6oLtTyUW9dh85UNACYr6
         IdA7Fr+Jeu5KoLzYFfyLeJvG9tOWHJqHj9Y7XTn/rPk27rnAc5vsTtC/VL0LEPmfttba
         0JfPaeSKVmZN9Av2XlsTwhRSbosDEcmw5xEWkxX1hqO4hlHPPIRzAyhKJtqyF05taYZx
         u7j4AbW7fipfMTEcSnfIhpK40PsUxsdpAlNfkXv8FkMEeaxx2C1wxdHggNYE01JEEwcl
         shUnMdZH4pgf2oDXy9DktDYcBDLBTWwPQy2DBvnyo24uKgfsXgwjguH/dmm3rhO9VFs/
         rELw==
X-Forwarded-Encrypted: i=1; AHgh+RoONO+FdZ5UoaeeXRO4427dFcYVC8tnDRMwvVKxuqp6HgZjivWoiRFJiB1TkXV+Fgp2wpv5Z/tKBeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAI+zoBJPQU4iBsfUi0rQfF4sP94y20S7VFcvp5kXEU19/p0H8
	AY1Pao+hcUBkvz7SCaZkpQulPAtHfY01/ZTsfP0+chbT2tjzOjFkVocF9MJ0PXPwJ4A=
X-Gm-Gg: AfdE7cndiJJFNWkFTbeeBdKG8/I4/GW7ffQm4OecLijhEcIreusC0x/zJBgbiciTzxc
	xqdLfvn9vvzoawSuR/wgH//IjPBGbXg0YS1ENQBsojXm4AZV8dSPvue53TQBK1/ZysOfj6YrpHC
	u707UkYeiAQ7cSAKDhUFva+o/AVaADiasWVZIDr9u5eXMq+Jv5/VZ3GXYImCa6tLPKzuWYZliAx
	87Kz7mtjHoqs+bDVMnmC18owUD/XZRTGNocXN2q4g2TOcAimCHSaRdHmrIbopSFtmHd+/w95MkI
	I87svDot3nrMO2zHpGWDsnKflL2S4pwx3dTCtI79x+mdMkDWQOkr8Uec6czOeZJOOYk9kywPJ3d
	/xDWrF6vYp9KbaysTgjZOi3+Es5YNGAUd0DYLkHJyZx1q+e8fus+GwanR0aghX60E+XBMKJW/wC
	H4MVVjFxEmxZ2QXu0=
X-Received: by 2002:a05:600c:3e15:b0:495:409e:bc80 with SMTP id 5b1f17b1804b1-495409ebcfcmr47429445e9.37.1784217173152;
        Thu, 16 Jul 2026 08:52:53 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm90863465e9.13.2026.07.16.08.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:52:52 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:52:50 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 5/6] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <alj-UsDwB_vQ6nJ_@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-5-574547b8f71b@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-printkcleanup-v3-5-574547b8f71b@thegoodpenguin.co.uk>

On Sun 2026-07-12 11:20:36, Andrew Murray wrote:
> The printk_delay and boot_delay features are helpful for debugging
> as kernel output can be slowed down during boot allowing messages to
> be seen before scrolling off the screen, or to correlate timing between
> some physical event and console output.
> 
> However, since the introduction of nbcon and the legacy printer thread
> for PREEMPT_RT kernels, printk records are now emited to the console
> asynchronously to the caller of printk. Thus, any printk delay added by
> boot_delay/printk_delay continues to slow down the calling process but
> may not have any impact to the rate in which records are emited to the
> console.
> 
> Let's address this by moving the printk delay from the calling code
> to the console emiting code instead. Whilst this ensures that delays
> are still observed (especially for slower consoles), it doesn't improve
> the use-case of using boot_delay/printk_delay to correlate timings
> between physical events and console output.
> 
> Behavior change:
> 
> Please note that printk delays now occur after messages are emitted
> rather than before.
> 
> Please also note that the printk delays occur within the printk_safe
> (irqs off) context.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -266,6 +266,8 @@ struct printk_buffers;
>   *				might cause a system freeze when the console
>   *				is used later.
>   * @backlog:			Ringbuffer has pending records
> + * @emitted:			The context attempted to emit the message. Might
> + *				be incomplete.
>   * @pbufs:			Pointer to the text buffer for this context
>   * @seq:			The sequence number to print for this context
>   */
> @@ -278,6 +280,7 @@ struct nbcon_context {
>  
>  	/* members set by emit */
>  	unsigned int		backlog			: 1;
> +	unsigned char		emitted			: 1;

We should be consistent. Note that there is one more
"allow_unsafe_takeover" bit defined above.

Maybe, the "unsigned int" was a waste of space. I do not see any
technical reason to keep it. But we should switch the existing
members in a separate patch. It might help bisecting eventual
problems, ...

>  	/* members set by acquire */
>  	struct printk_buffers	*pbufs;
> @@ -298,7 +301,7 @@ struct nbcon_write_context {
>  	struct nbcon_context	__private ctxt;
>  	char			*outbuf;
>  	unsigned int		len;
> -	bool			unsafe_takeover;
> +	unsigned char		unsafe_takeover : 1;

Makes perfect sense. But it should be done in a separate patch. We
should not hide this in complex patches. It will most likely
just work. But there is always a tiny risk that such changes
might cause regression or unveil an existing problem which was
hidded before.

>  #ifdef CONFIG_PRINTK_EXECUTION_CTX
>  	int			cpu;
>  	pid_t			pid;
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1267,11 +1269,16 @@ static int nbcon_kthread_func(void *__console)
>  
>  		con_flags = console_srcu_read_flags(con);
>  
> +		ctxt->emitted = 0;
> +
>  		if (console_is_usable(con, con_flags, false))
>  			backlog = nbcon_emit_one(&wctxt, false);
>  
>  		console_srcu_read_unlock(cookie);
>  
> +		if (backlog && ctxt->emitted)
> +			printk_delay(false);

This should be:

		/*
		 * This is a compromise between reliability and	effectiveness.
		 * A less intrusive sleeping wait might be used	here. But
		 * the released nbcon context allows to print one more message
		 * in an emergency or panic context immediately. But
		 * next	messages in these contexts will have its own delay.
		 */
		if (ctxt->emitted)
			printk_delay(false);

We need to check only ctxt->emitted. Otherwise, the delay would be
skipped for the last message. It would be bad when messages are added
slow-enough so that the kthread can emit them immediately and
the delay is always skipped. But it still might be too fast for a
human reader.

> +
>  		cond_resched();
>  
>  	} while (backlog);
> @@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
>  	}
>  
>  	progress = nbcon_emit_one(&wctxt, use_atomic);
> +	if (progress && ctxt->emitted)
> +		printk_delay(use_atomic);

Same here:

	if (ctxt->emitted)
		printk_delay(use_atomic);
>  
>  	if (use_atomic) {
>  		start_critical_timings();
> @@ -1584,6 +1593,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  			if (!nbcon_context_try_acquire(ctxt, false))
>  				return -EPERM;
>  
> +			ctxt->emitted = 0;
> +
>  			/*
>  			 * nbcon_emit_next_record() returns false when
>  			 * the console was handed over or taken over.
> @@ -1600,6 +1611,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  			if (nbcon_seq_read(con) < stop_seq)
>  				err = -ENOENT;
>  			break;
> +		} else if (ctxt->emitted) {
> +			printk_delay(true);

Similar here. We need something like:

		if (ctxt->emitted) {
			printk_delay(true);

		if (!ctxt->backlog) {
			/* Are there reserved but not yet finalized records? */
			if (nbcon_seq_read(con) < stop_seq)
				err = -ENOENT;
			break;
		}

>  	}
>  
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 4517266e9ca112e0dcb0163a99dd0e8d50931848..5df09e56cf8abc2d0555b6950eed4e483ba56d4b 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3206,6 +3205,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
>  		printk_legacy_allow_spinlock_enter();
>  		con->write(con, outbuf, pmsg.outbuf_len);
>  		printk_legacy_allow_spinlock_exit();
> +		printk_delay(true);
>  
>  		start_critical_timings();
>  

The rest looks good to me.

Well, the bool parameters are always hard to follow. I would prefer to
create two wrappers. They might be defined in kernel/printk/internal.h

static inline void printk_delay_atomic(void)
{
	printk_delay(true);
}

static inline void printk_delay_thread(void)
{
	printk_delay(false);
}

Or maybe rename the original printk_delay() to __printk_delay().
And use:

static inline void printk_delay_atomic(void)
{
	printk_delay(true);
}

static inline void printk_delay(void)
{
	printk_delay(false);
}


Finally, Sashiko AI pointed out that the delay is newly done while
holding console_sem and might trigger lockup detector warning, see
https://sashiko.dev/#/patchset/20260712-printkcleanup-v3-0-574547b8f71b%40thegoodpenguin.co.uk
I would ignore it until we see real-life problems.

Best Regards,
Petr

