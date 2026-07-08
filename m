Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D941735F
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519226; cv=none; b=Q/f7j+2j21pnwe3lHE1NQly/VClUWeYw6FmvXsquJRoTxQpU3dAEl1npSQcC5amk/lerUzhLmZKS1z2pk2fEwdK259sdLwtUD2AiyQ8UTkZxqIlGbw2u+gWm4yy28pIvPQHwnOovVzmyml/UXMBj7y10cNSBz7nGFIl/hzstE9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519226; c=relaxed/simple;
	bh=+MyyKOo8bICk/aJFc/E236U1cUIY6gKGxNFTDl8Ow44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6UwGft9Qqi0nMVOUmGWdPO7qlv1PYkU9kePo3CCVpCTFcl6F1igw73S1wpKmWYzCAbHKpFO20wnvu7tzkyYmNddgT8j1iGM6PiR4pNcG1O3nSOugu6m2IMpaRDIo/p/zLr+p/TjZKMAdMG9nyk2o5pvylPEJZGSy4ID50KBALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c/DJhJyf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c/DJhJyf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b77b150aso5616575e9.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783519223; x=1784124023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gyOhrDiD3HZi1C97C5b5wI4tA2tqQIhwOgRgckqnDRQ=;
        b=c/DJhJyfUAj7FvSEOi0hm/oFRuEy0iT9MztR0FqtAyq0sEag43soVsLcTJj81EfMWk
         p55OdUmEJ0euBIfs6GjVbbQSvt4EooewD367C3Chn4v+xwASPY/0JArxaRCdOLz7dxiE
         psiv73lgLDx3/+HPtcLtL8k5zvEQ8tSZHL+ZIRixs6K6ojNXfyYzSv9R6fSGVrH8zev6
         Ot5/h8vy2iHZxs5bixHHlMBAQBMVirBrUfO8ijsmO+P6XDcA1M7LpvRXy63EtxDAcRMM
         eNVrOVkQE8qW7vYMP6n8XWoy/2OHngwLkewXkOkconUi+MA7Gn50MV7hxPGKgGfyYGuU
         shKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519223; x=1784124023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyOhrDiD3HZi1C97C5b5wI4tA2tqQIhwOgRgckqnDRQ=;
        b=q8L1t+ajunIWKDSRYiR7zniMVu16IENoR08zytaIwqoThV4UgsiYFFo0TslUdyKXlZ
         rsD6O8rZr+BqpfypMJDisJAY5+dGzTBL4hXkv91hSYGId+cyQCUhe9DTq2tzFrrDjdmx
         PzKdGpsjkG2UpBAbDTYhsGGix8V4PsaT11ow3micvXXyHdr2G5mEkpPLEZRb5d8gyziD
         k1AnixchZNKx2l03tRHCxKhAOYOoLTu7qs8dNqkgylr2yyZX/y3lPrJxxw+liFS6onNB
         QZyfw/kaCV4e4PpFpL024MWd3UDUuV+H7gpFzTyctlghQ3koV6/tXqY6lvwiPScSs/c0
         7DwA==
X-Forwarded-Encrypted: i=1; AHgh+RpM3n/z9HX6NtHOXIZKIK2vjYn1nulT+ttRmGlUTOXv9oqCScPrabSDQfY2ttWgyJQZtPqymK2JWAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWBOVtamWI9ETPbfA1fJL/BZ+daq/vWxJwdWF9N0rHg+v2z3C
	JJlkoApdexkif+ZDBQuIA+xFaAVoMV0rqv0aDF/P1hTk6VFCcJhfM0XLmDcWGSlUHE4=
X-Gm-Gg: AfdE7ckGKbKYPzlq7OPRv2gZ69342Bq1C8zo+hbcKNNOqQt2KO9YVODNUhyLjf+DTuF
	SutmubjZijuoJnSgX/3ja2XZhpN4UaM1qOb6zFQncc/xYm1W1r/PtJEowQ62gEfCWyAbe6Q6JpN
	emfTkyPP2eRrCe41AVNW/aqXaGHgZrt7CAg5SG0nr0g5hHNoR81uCtH3Evi6qsJURs2hmHIkFLf
	HXcxlChQyOthczx02kvDlC/OtxvMn5s7hz2YiEhxC/C2PPITABMi1gig89hsaEwGee5fKhVKaGZ
	eAw50uxuTqQyYFM1fmYP10eE3GV7IkzuTAPI5zKQWnCV9+MBUKezHr9m6bKHADE0hwbBAMc8kWp
	jhQeYAJcbXKzN8vwyjSrnAt3Ish0ktjmGpegbxr9HNRu09864QIK1Q0jcbkl4Kduheq6j2j0Hn4
	BRyMdnsVOqmN28b/s=
X-Received: by 2002:a05:600c:3acf:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493e7a2b209mr20847575e9.32.1783519218219;
        Wed, 08 Jul 2026 07:00:18 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faee30sm120828745e9.10.2026.07.08.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:00:17 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:00:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
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
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <ak5X718OcOi8OeT4@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <87zf08w7qo.fsf@jogness.linutronix.de>
 <ak0b2S9jjYy49a8V@pathway.suse.cz>
 <87echdvkd5.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87echdvkd5.fsf@jogness.linutronix.de>

On Wed 2026-07-08 12:42:22, John Ogness wrote:
> On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> >> This is too deep (also pointed out by Sashiko) because it multiplies the
> >> delay times the number of consoles. For the legacy printing, it would be
> >> more appropriate to put the delay inside console_flush_all() and
> >> legacy_kthread_func().
> >
> > True. The question is if the proper solution is worth the complexity.
> > We would need to pass the information down two level of the API.
> > It would require adding a new (output) parameter to console_flush_one_record(),
> > nbcon_legacy_emit_next_record(), and console_emit_next_record().
> >
> > It is not that complicated but these functions are already hairy
> > enough so we should be careful.
> 
> Fair enough. But then it should be consistent and
> console_emit_next_record() should perform the delay before allowing the
> handover. Something like this:

Great catch!

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 2fe9a963c823a..62fd6a5ebef66 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3161,6 +3161,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
>  		 */
>  
>  		con->write(con, outbuf, pmsg.outbuf_len);
> +		printk_delay(false);
> +
>  		con->seq = pmsg.seq + 1;
>  	} else {
>  		/*
> @@ -3182,6 +3184,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
>  		printk_legacy_allow_spinlock_enter();
>  		con->write(con, outbuf, pmsg.outbuf_len);
>  		printk_legacy_allow_spinlock_exit();
> +		printk_delay(true);

It is pity that this is inside printk_safe context with IRQs
disabled. A solution might be to call it before the write.

But maybe, this is good enough. This code path is called from
vprintk_emit() and it might be in an atomic context anyway.
Also it increases the chance of successful handover which
might help as well.

Anyway, it would be nice to mention these pitfalls into commit message.

>  
>  		start_critical_timings();
>  
> 
> John
