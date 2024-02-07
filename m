Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C176911
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707317038; cv=none; b=VLGMUtVF8kc/+ZccYgztSbp2XrNx8E2qxvx/egQcOVnCMrYMV/NCr8ZHvx8ejLgXYYdyqhn3DXW8th8uZ6MGy9hp23sqVD+1n/sZ+LBWAgcpIUVJdnTYtjm2OIeD+bgpc1tnKlIiRzVwH9P1NbqFHXia/28qN5qjjSMGShYqdPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707317038; c=relaxed/simple;
	bh=fg1vK03qeyEYh8aWYY7ojoH+m10tqr1lJD/50h6YUrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0KtsrLyAyPzUadxrOK7Cu+aFuLPkRx/PaTqp2+r3P7FxYKTipSZcY6EDZ3Ge0otgc/IKWkZrvCxIujB9a13jKGNNSBQYqboG8y/p8cAXymB1k1GlMumpk6F0Y9SfKz7KbeEtm6q/dYeMUv23ylcZfTYEH7OaxcrLEs0d3XbykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WIWcj1Sv; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WIWcj1Sv"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511689cc22aso802522e87.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Feb 2024 06:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707317034; x=1707921834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ze9ZwLHA6Efy82qUcNxqthaSY7UMqDGuf7DhJv5BY3o=;
        b=WIWcj1SvKlfzyaDRbb2cI/SL7OQAySx4g3jeiDUE5ld95631J0EO5nMCo8OTsu+xus
         Cj7eqN+OAm2WgjmFZIHIvpTkvPH/wBbxKA9cPa8eIMo2jUxTwe1axS2hDTN7E6ONkhxs
         U7Eyw/KLJDE7Z6J14RvirB5e7/va89EHvCygjSRN2Kww5TqjVJm8TN9GoqFU+Ty+vtzC
         29twFWeGUSCGU9fvfcxeXk/eP6V25LXoZTLWvXSiTpuBOxO2THlEpnoujyEMaJuyknVM
         qT7JTOT+HdPwE5NMvb5XpsFbxnZu6BoRMBVOtDI/9+jWZsQY4zGN20m4EKXAr+GxqhzR
         nICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317034; x=1707921834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze9ZwLHA6Efy82qUcNxqthaSY7UMqDGuf7DhJv5BY3o=;
        b=EbZDF9wOe9EvnoIj99KK2Dq5o18soP5IksQggnsjdGqdAoY6YZtOMwEbJrswC6owPS
         io1uraaOpU0nQEJV+0qmdziuIllI1Z1UsSwFEQePyZH4J8edKgYSDLllHoVTXoXYXDQC
         MJ9Y2uaC0uvt3uU+uJl8X6HeGle/GbEDatbrRu82gSaVOCpWGU900uZKwmEHGNwzgkEd
         gqaDwSbMuypXA5+z6ntyG0ZELoQYONpZ7RJrR70fPf+2grSil9akzz5ye5lHVo01cNgL
         aFqNKyaDfyT15WllQWA/XLf9o2rWyu8mFd7lkEzxcvxwXn9VnulWOgdNYxot845PUhEN
         du9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4TLwPurQeWEQAMQLWx5ENYly8VGqcMIKFaotu5VRtBAhaMSsCNfblzADZkz43DZoPEF0cXise6B7LBA6wbztPsmwmzwWKlU2V
X-Gm-Message-State: AOJu0YzqDMcV1+Phm7bPjW1HbvdbBCPO+608R0RED5tlCipsqt7oJ6zX
	D5uruoTxv+Utsb+Gp6r+vtc15wqarAStnS/VwPs0eCztMKRKhZUur+UDrD9E2aw=
X-Google-Smtp-Source: AGHT+IG5pkdkXWGfV8yAdTjYMkiAYADdm/5219hi0EkLm9dapJXsvHjrWMaM24YHXyYPuiHR4deIvA==
X-Received: by 2002:a05:6512:3a8c:b0:511:3c06:9369 with SMTP id q12-20020a0565123a8c00b005113c069369mr5636045lfu.12.1707317034249;
        Wed, 07 Feb 2024 06:43:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUachyilhvlHEjsVwJMeBzkiDQhENc3Bye+vX++KgSwJ84OZvU6Yn2hYl1d131eryb7VCWC3dLn/rNctAbYxItdn4C60J1cyShJBqrN91EZkS/qPUX85NIjsPJxGVlyMLSs+FWpx9TgPzx3Rxm/La4SJoxYts6rog0uyZpIp1AEj9VmTGNx17blpL0Wr9wgyUbvg9GQQYVMrItn8pVSrr8D65SIqBVZ4EThM8Off2VwBX7PkONCdEsFPLg5kIHI11sumNlLDcvCGaH8akvJ8LpcN2AxCEkHNcIPP+0kzetbtKj+7WriWpcX4DcEGRm28LDjgHaIPKRfIfLiZ3sCgEwsU4cdF0sCUysAGWDlxVL+yB1MLQKSphVzhOUYqr1Kbq4BoRvpzedEGsZk0aJkI9iGNE67D4bMsQ+VTRrfztC+f//9b8dDhAlmxzQoC2Wy6XqPX6AOJKEn+xy9U3SJAG233ZOLsuYjptbU
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id yr2-20020a170907334200b00a379ef08ecbsm830951ejb.74.2024.02.07.06.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 06:43:53 -0800 (PST)
Date: Wed, 7 Feb 2024 15:43:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sreenath Vijayan <sreenath.vijayan@sony.com>
Cc: john.ogness@linutronix.de, corbet@lwn.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, rdunlap@infradead.org, rostedt@goodmis.org,
	senozhatsky@chromium.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	taichi.shimoyashiki@sony.com, daniel.palmer@sony.com,
	anandakumar.balasubramaniam@sony.com
Subject: Re: [PATCH v4 1/2] printk: Add function to dump printk buffer
 directly to consoles
Message-ID: <ZcOXEyPsRnfewb4Y@alley>
References: <cover.1706772349.git.sreenath.vijayan@sony.com>
 <8cb5936021c5811bd03a6bc18300b1384009ac26.1706772349.git.sreenath.vijayan@sony.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cb5936021c5811bd03a6bc18300b1384009ac26.1706772349.git.sreenath.vijayan@sony.com>

On Thu 2024-02-01 15:53:40, Sreenath Vijayan wrote:
> It is useful to be able to dump the printk buffer directly to
> consoles in some situations so as to not flood the buffer.

This is not longer true. I think that it was valid for
the previous versions which used separate buffers with
the kmsg_dump API.

> To do this, we reuse the CONSOLE_REPLAY_ALL mode code in
> console_flush_on_panic() by moving the code to a helper function
> console_rewind_all(). This is done because console_flush_on_panic()
> sets console_may_schedule to 0 but this should not be done in our
> case.

Also the "c->seq = seq;" is not safe in the panic version.
But it will be safe when called under the console_lock.

> Then console_rewind_all() is called from the new function
> dump_printk_buffer() with console lock held to set the console
> sequence number to oldest record in the buffer for all consoles.
> Releasing the console lock will flush the contents of printk buffer
> to the consoles.

My proposed commit message is:

<proposal>
Add a generic function for replaying the kernel log on consoles.
It would allow seeing the the log on an unresponsive terminal
via sysrq interface.

Reuse the existing code from console_flush_on_panic() for
reseting the sequence numbers. It will be safe when called
under console_lock(). Also the console_unlock() will
automatically flush the messages on the consoles.

> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3134,6 +3134,32 @@ void console_unblank(void)
>  		pr_flush(1000, true);
>  }
>  

I would call this function __console_rewind_all(void)
because it is not safe on its own. Also It would
deserve a comment, something like:

/*
 * Rewind all consoles to the oldest available record.
 *
 * IMPORTANT: The function is safe only when called under
 *            console_lock(). It is not enforced because
 *	      it is used as a best effort in panic().
 */
static void __console_rewind_all(void)


This would deserve a comment because it is not safe by
default.

> +static void console_rewind_all(void)
> +{
> +	struct console *c;
> +	short flags;
> +	int cookie;
> +	u64 seq;
> +
> +	seq = prb_first_valid_seq(prb);
> +
> +	cookie = console_srcu_read_lock();
> +	for_each_console_srcu(c) {
> +		flags = console_srcu_read_flags(c);
> +
> +		if (flags & CON_NBCON) {
> +			nbcon_seq_force(c, seq);
> +		} else {
> +			/*
> +			 * This is an unsynchronized assignment. On
> +			 * panic legacy consoles are only best effort.
> +			 */

We should change this to something like:

			/*
			 * This assigment is safe only when called under
			 * console_lock(). */
			 */

> +			c->seq = seq;
> +		}
> +	}
> +	console_srcu_read_unlock(cookie);
> +}
> +
>  /**
>   * console_flush_on_panic - flush console content on panic
>   * @mode: flush all messages in buffer or just the pending ones
> @@ -3162,30 +3188,8 @@ void console_flush_on_panic(enum con_flush_mode mode)
>  	 */
>  	console_may_schedule = 0;
>  
> -	if (mode == CONSOLE_REPLAY_ALL) {
> -		struct console *c;
> -		short flags;
> -		int cookie;
> -		u64 seq;
> -
> -		seq = prb_first_valid_seq(prb);
> -
> -		cookie = console_srcu_read_lock();
> -		for_each_console_srcu(c) {
> -			flags = console_srcu_read_flags(c);
> -
> -			if (flags & CON_NBCON) {
> -				nbcon_seq_force(c, seq);
> -			} else {
> -				/*
> -				 * This is an unsynchronized assignment. On
> -				 * panic legacy consoles are only best effort.
> -				 */
> -				c->seq = seq;
> -			}
> -		}
> -		console_srcu_read_unlock(cookie);
> -	}
> +	if (mode == CONSOLE_REPLAY_ALL)
> +		console_rewind_all();
>  
>  	console_flush_all(false, &next_seq, &handover);
>  }
> @@ -4259,6 +4263,15 @@ void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
>  }
>  EXPORT_SYMBOL_GPL(kmsg_dump_rewind);
>  
> +/**
> + * Dump the printk ring buffer directly to consoles
> + */
> +void dump_printk_buffer(void)

I would call this function console_replay_all(). IMHO, it better describes
what it does.

> +{
> +	console_lock();
> +	console_rewind_all();

I would add a comment:

	/* Consoles are flushed as part of console_unlock(). */

> +	console_unlock();
> +}
>  #endif

Best Regards,
Petr
