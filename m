Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233FF19C56C
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734521720; cv=none; b=eCzmcayqCdw7HBlJ+UBSvTdqbXk56ATsGW/lKCpHgDLBGpG1rqf2e0hKYouoQPY6jPBTGABn9Rw5aTQ/kVfzDS6IQcF9b2l0JfR1JPl93K7j78yb+P69n8g5wYpGhmkESi+553WecsQJ3vNLgmhRIn4MCi7XPSxxvqrtYHUs7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734521720; c=relaxed/simple;
	bh=gOiMAnrjvHN0iPlKNzqS7+6gHJppdNewW/4kpkijjMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyBJZ266868kwRe4s34mihdcsxPDeyfDZcnjmUjqFZE0mnUBd2Z5OsDWszAYJlVeGEwMT9i5mbK6nQoLXSXBhhohurBJpA2WzNEz48lY0G5NAo3aTeDjhLCW5s479zR619RNKJEjAY9O5ma3DK0HFFRuZhuVIliArQ9wXaPA6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZpUpJ5/Q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZpUpJ5/Q"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso6782301f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 03:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734521715; x=1735126515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VlJJETf0GEG5l1fQK2RThJLw2n20sbAz6B1Azi0svlk=;
        b=ZpUpJ5/QylowrV3JqsfgMS2hgTThrGYcD+Ro6FuLOjXOnzSb+Ex6xpm2JBBXd5PBFd
         sdkg7ZVOstjiPvW7Lcf+nPLEEHdlVSVZNDpNsE72PusZtbzXFD8xTRO1IkOq+JTclBr3
         yJAkS1SGmLqMcdZm7XjTc8kKTXgbdUg2MT2zIk0g90b+ls1WYc/cglquKsPb3fB2/gY0
         Owb0e8+cJJ9C55kFffGEWX+BjNuqp7qJVf9rn4A+lQR81nwz9gapEwIOP8F8AbAvRzZ7
         9ru4PyeJytdrXNDJhtycxOI8O/CtTqr7x9qNTNCkcrhrCXlcgcvUM2o9ytqmHgn3sjb1
         Wiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521715; x=1735126515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlJJETf0GEG5l1fQK2RThJLw2n20sbAz6B1Azi0svlk=;
        b=sz2xmj5tkjA6rXfOukVNe0m03F6455EftlCStZYZGk4HrQD7f18S6SgMjCNXHo6Yr4
         9D7nMi87Q/JyaKp1O2FGBfvi6IcE0auGo1A3EL3q+YrBld0kqeD3AcL/THzbZddId9HK
         fhyGowMJrWYqx11X8oJ7nGZeWh/0nigtHL+qeoLMgMoW6kxTLGnOB/FfyqYG7cZyh1Om
         jTLyt4z5pJLE5jaBpj+I1KtUrKQXpIZ8viMxJ8lldbC9juuiEQxo8M+jaO4n2I8BEMkR
         9rMYCojZwaLqliJze4psTB6Di+TlGzeuLc4liEHImVrzXrpqDXoQ476gTQX/ZAI6qVzd
         /I+A==
X-Forwarded-Encrypted: i=1; AJvYcCXBh65MJpTvyshOGVfKMPSkMCukc+ZGaGhOZlSMYqpUnXhCg4k/vMy7+vpOBON3xv5C6xJXvbSVbgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIq+mHZSg+gkBfsClZADoCtz4EWID7mrvpJ+YAXwz5Q3ZwXnyS
	f0dgQ8WvJMKGzxyuWNoLVZpRK+T602i71l/mvjPg5wmr9agONCuqsqV+CWCP69s=
X-Gm-Gg: ASbGncuzGO+TU/ZNWBojELz81AjkC93FY4rgP0UApTZGDNg+ihkA7fulyyz+zdVS8pB
	NwHA65wH6nNs669B++1JEoAblzv+IQGVvK1QoP4vXJUF/1W3WWLfYo39dFAdIBcyXCRUbn5LPzj
	KexS0hNilqocSWyf4D++l1fbxJ70lRD2W7jVz8FNyL0aBY6XwQgqc8JnEndz8vgDxoGgYaDFOaf
	/er44FrIDWv7pDKSlxdYIFLIXSuy9dIGKfGve9MQETEnVHYn5bvs0uFeg==
X-Google-Smtp-Source: AGHT+IGnVN8Zbotu5KkOnXCz05raBpseI5GUh9bTzmh4+dTqb3vp6Jmq20mEcYqJv0Y4S8sbzjycFw==
X-Received: by 2002:a05:6000:4a16:b0:385:fa26:f0ac with SMTP id ffacd0b85a97d-388e4d6a9aemr2531218f8f.7.1734521715441;
        Wed, 18 Dec 2024 03:35:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801223dsm13978802f8f.3.2024.12.18.03.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:35:14 -0800 (PST)
Date: Wed, 18 Dec 2024 12:35:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Saravana Kannan <saravanak@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: ssize_t: was: Re: [PATCH] of: Add printf '%pOFm' for generating
 modalias
Message-ID: <Z2KzcORZocQAwAi9@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217183711.2525863-1-robh@kernel.org>

On Tue 2024-12-17 12:37:09, Rob Herring (Arm) wrote:
> The callers for of_modalias() generally need the module alias as part of
> some larger string. That results in some error prone manipulation of the
> buffer prepend/append the module alias string. In fact,
> of_device_uevent_modalias() has several issues. First, it's off by one
> too few characters in utilization of the full buffer. Second, the error
> paths leave OF_MODALIAS with a truncated value when in the end nothing
> should be added to the buffer. It is also fragile because it needs
> internal details of struct kobj_uevent_env. add_uevent_var() really
> wants to write the env variable and value in one shot which would need
> either a temporary buffer for value or a format specifier.
> 
> Fix these issues by adding a new printf format specifier, "%pOFm". With
> the format specifier in place, simplify all the callers of
> of_modalias(). of_modalias() can also be simplified with vsprintf()
> being the only caller as it avoids the error conditions.
> 
> --- a/drivers/of/module.c
> +++ b/drivers/of/module.c
> @@ -8,21 +8,14 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  
> -ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len)
> +/* Do not use directly, use %pOFm format specifier instead */
> +size_t of_modalias(const struct device_node *np, char *str, size_t len)

We should keep ssize_t.

"end - buf" passed from device_node_string() in vprintf.c might be
negative. The "buf" pointer is used to count the number of characters
which might be written when the buffer is big enough.

>  {
>  	const char *compat;
>  	char *c;
>  	struct property *p;
> -	ssize_t csize;
> -	ssize_t tsize;
> -
> -	/*
> -	 * Prevent a kernel oops in vsnprintf() -- it only allows passing a
> -	 * NULL ptr when the length is also 0. Also filter out the negative
> -	 * lengths...
> -	 */
> -	if ((len > 0 && !str) || len < 0)
> -		return -EINVAL;

There is later called

		csize = snprintf(str, len, "C%s", compat);

and snprintf() uses size_t for the len attribute. It would go wild
when we pass a negative len.


> +	size_t csize;
> +	size_t tsize;
>  
>  	/* Name & Type */
>  	/* %p eats all alphanum characters, so %c must be used here */

Best Regards,
Petr
