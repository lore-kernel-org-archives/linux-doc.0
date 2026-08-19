Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B9397691
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147550; cv=none; b=NqLNK4x5nygERMO6q3Mj/WRbBEX0K3+LzNxRFA8GyLsqbBjW1xhEjEaSQtgwErjzQsmPYC3BLEogJvJG+Z0liXcL1Tx/YwlcLn1ubqI3g54dUC9OcgSEqtIy8HIyMO0guBko9F/N0Eks7NZrjEzE6b2vs6a3QOdhJTjm9Kg34OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147550; c=relaxed/simple;
	bh=ln/7B4Pej6hcFubHJcUPyI0A9KX65gM4p3/txkr9b7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV4wKCWayqyh5U7wFc9eWnCO4vbbs47f08/h3HB8dn2WrjbqYk6LReWD5D0SKAyqbP9cD/VT0DkaDZeF6VFcmwvJPMidxHwQF8ai7C0kgbiwrBcNSwcHKEBm9XP63tizI/7AYerRVIlvFdVrLDiCYdcb0DzVjVPvzGsjK87zYZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BkLeV8Zy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BkLeV8Zy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f7027ca11so616544f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 06:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787147546; x=1787752346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jr6zcbCHXlcAzdMG7DaCFPnnhFbAD1WDvR52R1Vpjn8=;
        b=BkLeV8ZyuYIMIJz6vlJZZC6NXco5CZrOJM5PcChnAfigNfP3vXoCyMq+1Nk6vWkh12
         1u7vMZVpFJDXAjy9xUhRTyh7XyPvaAweDebzzX02upppIoiIp+3ogoz0gvcyatTfwXWb
         5SVmhSJHCiHogMaaXOObDrnmTLt9PTHVRuAkghOqbdzYmYowGrpvLpUAPH/NmdO1JKhA
         N1GaMeUcPxt1UegL0vB3PQ6sC/Dz5F07vlC6uvrnowfOwNgM5dz7FRd6eRFDMyM8pO9w
         /Q0Vr2cgiV16SlJhMSdAh8FU3BtSh/8Nvn2YMxDg69lPbT7zi0D/jlOJOUrySYdWurtj
         7GDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147546; x=1787752346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jr6zcbCHXlcAzdMG7DaCFPnnhFbAD1WDvR52R1Vpjn8=;
        b=SOpRBjRsjFwI7FtRRGjh/8igpYQwpLY92ejNkD7FTCfPZCQLWrY1kOSylqeZVng6VH
         2jyqYePMNEZRppJjo74QEo80AgcV31wh9SRKi+tp6T2XKy3E8uSWX72HQu3PrYquGqJ6
         vZ4OxDlxPpIabsTJCYhBuoZ58/KqiWo5ErUj83ncDrxpu4DCP52/Fcr3R1x2Ob09AJgy
         7NFgHinQJsw6hwnHKkgxOu6tsop+Kjc1zPonkP8jCb5eyxu4IFRJOI9M6cD4AfafXZtD
         X9eVz3TUv3SBP8uS9IyEqEeqxHxXjWKXL0gHoPRZR7vN88CTRk6ycjUlh32MsufQVxOc
         SlZg==
X-Gm-Message-State: AFuF++kPpsgBo5RkiypveqX21RVLIwfCtlZxqhd4q3pne2y92TPgTUiF
	8WcRFcRx51CFmeRDpLWnLuCc6qYvkismNTgYwloyXWs6yZSJjE9AKFupw5oBpA6QW2A=
X-Gm-Gg: AR+sD10gN1OJ24OTbXE1J4Jt8adOKFSl8qxy9sRTcVLCS4ZFwr0HvJdCPtM+MrBNRD0
	53dAK+Lw18qGtkvvbdURLqbqXMQNw8MzPVmGsTTJkM934SXolO3OW9USYFcxwz4BIWVm3HRymVW
	Yt38mrasNEYzO4L9+Sr8/AndlzWAQkEFlyqWVIG3ojADWh73NlNc9VnF7QTXsDblvIY80Lp/dUu
	TvOA2KwYagL+Ma8jM+ajOUGzQMs1nP4CcwEV2cFNXsotWWQJUIACDu9ZVS6PbQQZQsvJzARPV4S
	u+tmghq1uzqRs6lxLiVR1MtpvkwUpdN9dfnORtjpdgbFJLmT5AxKKTYNwHfuecT6/t2a39KeEd/
	z5dHvY0ePl/DFPYLWKT0t/tSYxa6IKRwq+Y/H/g/+Vpv1AOMy9MishPaCqmQDHzy8v4rXDswFgP
	YLG6MgJKGFqc8CRYoNHcpEs3N5NcPMc42Qp4yfIB9hwe/v0/Lepr4PzI7hZR7sLw==
X-Received: by 2002:a05:6000:260d:b0:482:a36c:a5d7 with SMTP id ffacd0b85a97d-482b1eb1607mr9572369f8f.10.1787147546100;
        Wed, 19 Aug 2026 06:52:26 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm5067699f8f.26.2026.08.19.06.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:52:25 -0700 (PDT)
Date: Wed, 19 Aug 2026 15:52:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, feng.tang@linux.alibaba.com,
	andriy.shevchenko@linux.intel.com, kees@kernel.org,
	tony.luck@intel.com, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, kernel@gpiccoli.net
Subject: Re: [PATCH] docs: panic: Disclaimer about console verbosity when
 using panic_print with pstore
Message-ID: <aoW1F698494dIOyg@pathway.suse.cz>
References: <20260805205026.1699568-1-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805205026.1699568-1-gpiccoli@igalia.com>

On Wed 2026-08-05 17:49:04, Guilherme G. Piccoli wrote:
> Users of panic_print / panic_sys_info are usually aware of the potentially
> huge amount of information displayed with such options - their goal by
> using them is indeed to dump more information during panic!
> 
> What might come unnoticed at first is the impact that the console_verbose()
> call on panic path has, specially in cases that users rely on pstore as
> a means to collect the panic logs. Recent experience shows that dumping
> all tasks in an ARM64 system (with qcom_geni tty driver) gets a 2 minute
> delay on panic time due to writing such information to console. But in
> that case, pstore was used, so there was no need for console printing,
> and suppressing that reduced the full time to less than 1 second.
> 
> The option "printk.console_no_auto_verbose" aims exactly at this use
> case: avoid automatically increasing the loglevel during panic path.
> So, let's officially document this to avoid users wasting their time
> either on long panic printing or debugging the panic delays.

Make sense. Few nits below.

> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..04c0ef2cf910 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4862,6 +4862,9 @@ Kernel parameters
>  			so there are risks of losing older messages in the log.
>  			Use this option carefully, maybe worth to setup a
>  			bigger log buffer with "log_buf_len" along with this.
> +			Also consider using "printk.console_no_auto_verbose=Y"
> +			if using this along with pstore, to avoid extra delays
> +			due to increased console verbosity during panic.

The long blobs of text are hard to read. I would use this opportunity
to add some blank lines, for example:

<proposal>
	panic_print=	Bitmask for printing system info when panic happens.
			User can chose combination of the following bits:

			bit 0: print all tasks info
			bit 1: print system memory info
			bit 2: print timer info
			bit 3: print locks info if CONFIG_LOCKDEP is on
			bit 4: print ftrace buffer
			bit 5: replay all kernel messages on consoles at the end of panic
			bit 6: print all CPUs backtrace (if available in the arch)
			bit 7: print only tasks in uninterruptible (blocked) state

			*Be aware* that this option may print a _lot_ of lines.

			There is an increased risk of losing older messages in
			the log. Maybe worth to setup a bigger log buffer with
			"log_buf_len" along with this.

			Also consider using "printk.console_no_auto_verbose=Y"
			if using this along with pstore, to avoid extra delays
			due to increased console verbosity during panic.
</proposal>

>  
>  	panic_sys_info= A comma separated list of extra information to be dumped
>                          on panic.
> @@ -4877,6 +4880,8 @@ Kernel parameters
>                          blocked_tasks:  print only tasks in uninterruptible (blocked) state
>  
>                          This is a human readable alternative to the 'panic_print' option.
> +                        Please be aware of the caveats using this option, check
> +                        the panic_print information above regarding delays.

This is too focused on the "delays" problem. I would write it a
generic way:

<proposal>
			Please be aware of the caveats using this option, see
			the 'panic_print' option for more details.
</proposal>

>  	panic_console_replay
>  			When panic happens, replay all kernel messages on

Best Regards,
Petr
