Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11119446853
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118188; cv=none; b=u036m4zrrUXIpazbp1PbsZ1kBWQ90BIQnt95RYfzmm99mf9J1a8nZtE7Rql98RSl+pXEDIOYMYhwSu+KpgKblc/qSxYjwwMBt1gs6pP9C6h1zLkThE3y1yJcMJQPTQv588xKtPcvWcXPXjfp/to7wPBErJyTPIdXkFrMRhHmbbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118188; c=relaxed/simple;
	bh=J9fhr7FaSxZDWuMJRjoWw59jgbyKeFhpzWnSAUIL8oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdwWG6zPt1ilLXobBfxzX+SgM/GBAju5pCkO1zlMPltNu/V4i39QOrb08w9LjDPrssCFedmoAZaCZ3nZbQKeo20tn9Q9oiO3YPTe9wq042v4TqnViDQzTvUL612no2VJyQiOmpEpeRj/mRGZ05lqDOly8AHFssZWiW57QaQMM1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TQySzl4x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TQySzl4x"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f75f7172so37179915e9.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 05:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784118183; x=1784722983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIjcruFunEQ7BqgUA3fdKqqcJcHc8EKYomArSLRloHY=;
        b=TQySzl4xdS8t7dQNF5QJauAUofNEeHlmGstwpFKdJrWrPFiw/OMGZ6kge9yPxM/Nz8
         YqlOrKyB+eCkueX7DoGQ6KWnKsIiI8964ZdpVuL8GrnS27ZSHJjcz3noUwjb7w608rqX
         WrY0BPcWVx9QvmpKUqiWblefro09gA2xl/1RlGr/ZzA8yvEfnMe5ev4SpGPKsXazWtoY
         FsJZlkRn5aIvQ+wHKfXXnRiYAOC5T8/REsHopZw2SFqFZhK2xUCJOXXwbDDW0Cb+Uu0w
         9ukaSQp3B5hQZNI83c36Yoket16Mt1jP4pr4g15JzgaB+GGoAfDONSmRfrwcsxQKLIaD
         lEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118183; x=1784722983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIjcruFunEQ7BqgUA3fdKqqcJcHc8EKYomArSLRloHY=;
        b=KYZzTHAeqyuUr5to7By0+fHPXUylxClayGt7gZrXnY6F6qXaUB7pZYZO5y5D7+Z5A7
         oM4jJ8kGTjQ1935MTRAob8xjlXqBhv3PGr43Q85HvSRWL/fxNwFoKcXX/998UYA13x/a
         DVVmZgk0F5GyEVJvTiaGx3OUcrkmMdjQOM8hefJp+Iu1gMCUj8WhwjA4Wo2Mb1y7nrwD
         +yCzV61xTBHewZ5wVQh2j7WdI73AWTHPYaLIQW/r8CR2iS3pr1iOp8satKuY5FqkQme/
         ym7PXxDifNgXcPCL8czcNSHhRzGe9iMWz2GQvxZbxuDEpDqUjaHzpkWHwdqO4BKI5KgQ
         KC6w==
X-Forwarded-Encrypted: i=1; AHgh+RrcYH10xNhQUpBiNvv/OC+Nk+IOv5iwmPlm+m6IwI8DISjAJ2UoalEBqOEVhnsPNR8u1Ac3BHChnYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YymrWJ40xccfFIFH3fo6JBOJboKLydx2xy3kGwoDFk7femhqUfl
	Bnz/bsqMK/Sat6aEf/Edm7GgdGlTUN0cpXbr1HLKB+OnCzMFhyzP1YfB1dtucEyY4EI=
X-Gm-Gg: AfdE7clUzHgl0vFFz1kvZkIotUppRADbr8LFXDmRVutA/rD+FyTFwSnG3HHhvGXt8AU
	c8ufWTlTqr+sMoO/HIqVHoDCLgMr7i8Vxlry5/rSun/RwSoIO7y4uT5S8L1swH2031Z5GtuO1jY
	UsuMOOkUtOplrmhzIo0n4hTJHfxC9DHcFx5Yu92o7e5Cz+sPY3pIcuXyksZmLWmoeTCAJwxMGqu
	iA7BU4RlfwQle2lVL9HxxM/L+OHQOV9LX60ZbtbkyAnqQryMJIgYqsNQNq38cW1d1LeKBpFEfFf
	Rdx1JNzX97FGPKm8o2DsIDrLT6kf5RW8NnCoBYdrx3wvsxxVTF1210cr4tVAeOxrulCW2LoPvkG
	/JYoZ9blqyfe/lTY81JLOl2sshqc1OhMWRtoTCf2t0aAWsPms17/h511t939eTPAeg2NXhUazDl
	0lI/fdkluSQf8kNaM=
X-Received: by 2002:a05:600c:1908:b0:492:41c9:886b with SMTP id 5b1f17b1804b1-4953c1620c0mr30396555e9.14.1784118183125;
        Wed, 15 Jul 2026 05:23:03 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953f643601sm25459495e9.3.2026.07.15.05.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:23:02 -0700 (PDT)
Date: Wed, 15 Jul 2026 14:23:00 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Chris Down <chris@chrisdown.name>, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH printk 3/3] printk: Support setting console sync mode via
 console=
Message-ID: <ald7pDMwHkwiAG2K@pathway.suse.cz>
References: <20260710144609.194487-1-john.ogness@linutronix.de>
 <20260710144609.194487-4-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710144609.194487-4-john.ogness@linutronix.de>

On Fri 2026-07-10 16:51:53, John Ogness wrote:
> Extend the console= kernel command line argument to support specifying
> sync mode at boot time. This is achieved by introducing a new "sync"
> option that can be passed within a console= cmdline argument.
> 
> For example, assuming the first serial device should be a console using
> sync mode:
> 
>    console=ttyS0,115200,sync
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Co-authored-by: Chris Down <chris@chrisdown.name>

Just for record, I guess that Chris Down is mentioned as a Co-author
because of the function find_and_remove_console_option() which seems
to be taken from
https://lore.kernel.org/all/d1cae00c839a3681759061e646f21a35b9b66613.1764272407.git.chris@chrisdown.name/

> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2567,6 +2567,81 @@ static void set_user_specified(struct console_cmdline *c, bool user_specified)
>  	console_set_on_cmdline = 1;
>  }
>  
> +/**
> + * find_and_remove_console_option - Find and remove a named option from console options string
> + * @options: The console options string (will be modified in-place)
> + * @key: The option name to find (e.g., "loglevel")
> + * @val_buf: Buffer to store the option value (if present)
> + * @val_buf_size: Size of @val_buf
> + *
> + * This function searches for a named option in a comma-separated options string
> + * (e.g., "9600n8,loglevel:3,sync"). If found, it extracts the value
> + * (the part after ':') and removes the entire option from the string.
> + *
> + * If an option does not support values, @val_buf should be NULL, in which
> + * case no value part is extracted and any user provided ':' is considered part
> + * of the option key.
> + *
> + * The function modifies @options in-place by:
> + * 1. Temporarily null-terminating option names and values during parsing
> + * 2. Restoring separators if the option isn't found
> + * 3. Removing the found option by shifting the remaining string
> + *
> + * Return: true if the option was found and removed, false otherwise
> + */
> +static bool find_and_remove_console_option(char *options, const char *key,
> +					   char *val_buf, size_t val_buf_size)
> +{
> +	bool found = false, first = true;
> +	char *option, *next = options;
> +
> +	while ((option = strsep(&next, ","))) {

Sashiko AI pointed out that add_preferred_console() is called also
by of_console_check() where the @options parameter is casted from
"const char *", see
https://sashiko.dev/#/patchset/20260710144609.194487-1-john.ogness%40linutronix.de

I believe that we should be on the safe side. Honestly, I did not
analyze it to the bottom. But the string "of_stdout_options":

  + must be '\0' terminated. So that it can't be part of a full memory dump
    of the original device tree file. It must be a dedicated memory
    entity which is accessed separately in some node tree, see
    of_find_node_opts_by_path().

  + is used only by of_console_check(). So there should not be problem
    with parallel access [*]

[*] of_console_check() is actually called from two locations:
    serial_core_add_one_port() and sprd_uart_is_console(). So there
    is some risk of parallelism.

    On the other hand, it makes sense to add the console from
    the device tree only once. And we would have bigger problems
    when add_preferred_console() is called by mode CPUs in
    parallel.

Sigh, I think that we could keep it because it should be good enough.
But I do not have 100% good feeling about it.

Second sigh, proper fix would need to either allocate a copy
or create some static buffer for options in struct console_cmdline
or so.

Or handle this a different way.

> +		char *value = NULL;
> +
> +		if (val_buf) {
> +			value = strchr(option, ':');
> +			if (value)
> +				*(value++) = '\0';
> +		}
> +
> +		if (strcmp(option, key) == 0) {
> +			found = true;
> +			if (value) {
> +				if (strlen(value) >= val_buf_size) {
> +					pr_warn("Cannot copy console option value for %s:%s: not enough space (%zu)\n",
> +						option, value, val_buf_size);
> +					found = false;
> +				} else {
> +					strscpy(val_buf, value, val_buf_size);
> +				}
> +			} else if (val_buf) {
> +				*val_buf = '\0';
> +			}
> +		}
> +
> +		if (found)
> +			break;
> +
> +		if (next)
> +			*(next - 1) = ',';
> +		if (value)
> +			*(value - 1) = ':';
> +
> +		first = false;
> +	}
> +
> +	if (found) {
> +		if (next)
> +			memmove(option, next, strlen(next) + 1);
> +		else if (first)
> +			*option = '\0';

Sashiko AI also pointed out that this would create an empty string.
For example, serial8250_console_setup() checks only whether it is NULL
and tries to read the baudate, ...

Sigh, the handling of the console parameters is yet another historic
mess which would deserve a clean up. I'll add this to my TODO
in the console registration clean up. But I think that it is beyond
the scope of this patch set.

Well, we should stay conservative and set options to NULL in this case.

> +		else
> +			*--option = '\0';
> +	}
> +
> +	return found;
> +}
> +
>  static int __add_preferred_console(const char *name, const short idx,
>  				   const char *devname, char *options,
>  				   char *brl_options, bool user_specified)

Otherwise, it looks good to me.

Best Regards,
Petr
