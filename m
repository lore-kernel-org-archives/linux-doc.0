Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6934C48BD1
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 21:29:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0B26613D0
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 21:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFKVbQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 17:31:16 -0400
Received: from mail-ed1-f46.google.com ([209.85.208.46]:37711 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhFKVbQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jun 2021 17:31:16 -0400
Received: by mail-ed1-f46.google.com with SMTP id b11so38665514edy.4
        for <linux-doc@vger.kernel.org>; Fri, 11 Jun 2021 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yj/vp7a0ivkIMlD+voHVQNNmuERYkNcOuFUlb3V5+QU=;
        b=ajiSwjMERGP2Z/iuuXasSqjkJ8BYoaGXsEDLrPGqmodRD89SMCOkxYz/x8/F/ZhuL/
         dnUA5/b7MkoPeEu+KPcGzPOJ9WZp0F5iunGA8iq1RiGXSXBSPDh5gqdGF6JncWWT/ODj
         +470G9xNl22BhqGdGKor1/Y5eU0Epq5MuFRuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yj/vp7a0ivkIMlD+voHVQNNmuERYkNcOuFUlb3V5+QU=;
        b=BtWgd0/jz6TAw/U/Q/K0tMKA/4bj3IIUGF0gmajFSSz4rZgd5vdeBnKbhF6HLcs8eR
         YZFXA5X4Vb46i8gZl1WMGO8u0F03AokXuN9ha7F47OZ47/DQtCBeYhu2VA7BClx3rXo/
         /ynan8VssQe4D/0Gqml8z/M7ewdFMAkMOrn8lhulwxgaed8zJNOsOBtipg0T3XfYG8kj
         dwZxCNwek1cLP2uqjEF+sCy/r7pHecqAcjVjt5Vu3udW4CIMkECV90A+oR/oeRcSvXHk
         bMcDsLiIUBVaKH6NG1+zYPzMl1ox8TTz8Mzo1sW5uy3+asF3PAamVqSF2Y9c6TQQTBme
         DEng==
X-Gm-Message-State: AOAM533ohhGwV5AqB+InbHC6L1vvlQdfNzATTYUJTci4zEI0mhh9/qt8
        dn576zI37AMPadOyDzzTQM5DdQ==
X-Google-Smtp-Source: ABdhPJwq53CQ9eBtPD8hVpIx6faEUJL9Vm6nZO2saTd2fFDa8JKoNUeDVbkS5vRIsoOdUY77vA6TTw==
X-Received: by 2002:a05:6402:61a:: with SMTP id n26mr5734045edv.220.1623446897185;
        Fri, 11 Jun 2021 14:28:17 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.64.110])
        by smtp.gmail.com with ESMTPSA id f8sm2437137ejw.75.2021.06.11.14.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 14:28:16 -0700 (PDT)
Subject: Re: [PATCH RFCv3 2/3] lib/vsprintf.c: make %pD print full path for
 file
To:     Jia He <justin.he@arm.com>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20210611155953.3010-1-justin.he@arm.com>
 <20210611155953.3010-3-justin.he@arm.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <35c35b55-3c58-59e8-532a-6cad34aff729@rasmusvillemoes.dk>
Date:   Fri, 11 Jun 2021 23:28:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611155953.3010-3-justin.he@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/06/2021 17.59, Jia He wrote:
> We have '%pD' for printing a filename. It may not be perfect (by
> default it only prints one component.)
> 
> As suggested by Linus at [1]:
> A dentry has a parent, but at the same time, a dentry really does
> inherently have "one name" (and given just the dentry pointers, you
> can't show mount-related parenthood, so in many ways the "show just
> one name" makes sense for "%pd" in ways it doesn't necessarily for
> "%pD"). But while a dentry arguably has that "one primary component",
> a _file_ is certainly not exclusively about that last component.
> 
> Hence change the behavior of '%pD' to print full path of that file.
> 
> Things become more complicated when spec.precision and spec.field_width
> is added in. string_truncate() is to handle the small space case for
> '%pD' precision and field_width.
> 
> [1] https://lore.kernel.org/lkml/CAHk-=wimsMqGdzik187YWLb-ru+iktb4MYbMQG1rnZ81dXYFVg@mail.gmail.com/
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Jia He <justin.he@arm.com>
> ---
>  Documentation/core-api/printk-formats.rst |  5 ++-
>  lib/vsprintf.c                            | 47 +++++++++++++++++++++--
>  2 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index f063a384c7c8..95ba14dc529b 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -408,12 +408,13 @@ dentry names
>  ::
>  
>  	%pd{,2,3,4}
> -	%pD{,2,3,4}
> +	%pD
>  
>  For printing dentry name; if we race with :c:func:`d_move`, the name might
>  be a mix of old and new ones, but it won't oops.  %pd dentry is a safer
>  equivalent of %s dentry->d_name.name we used to use, %pd<n> prints ``n``
> -last components.  %pD does the same thing for struct file.
> +last components.  %pD prints full file path together with mount-related
> +parenthood.
>  
>  Passed by reference.
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index f0c35d9b65bf..317b65280252 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -27,6 +27,7 @@
>  #include <linux/string.h>
>  #include <linux/ctype.h>
>  #include <linux/kernel.h>
> +#include <linux/dcache.h>
>  #include <linux/kallsyms.h>
>  #include <linux/math64.h>
>  #include <linux/uaccess.h>
> @@ -601,6 +602,20 @@ char *widen_string(char *buf, int n, char *end, struct printf_spec spec)
>  }
>  
>  /* Handle string from a well known address. */
> +static char *string_truncate(char *buf, char *end, const char *s,
> +			     u32 full_len, struct printf_spec spec)
> +{
> +	int lim = 0;
> +
> +	if (buf < end) {

See below, I think the sole caller guarantees this,

> +		if (spec.precision >= 0)
> +			lim = strlen(s) - min_t(int, spec.precision, strlen(s));
> +
> +		return widen_string(buf + full_len, full_len, end - lim, spec);
> +	}
> +
> +	return buf;

which is good because this would almost certainly be wrong (violating
the "always forward buf appropriately regardless of whether you wrote
something" rule).

> +}
>  static char *string_nocheck(char *buf, char *end, const char *s,
>  			    struct printf_spec spec)
>  {
> @@ -920,13 +935,37 @@ char *dentry_name(char *buf, char *end, const struct dentry *d, struct printf_sp
>  }
>  
>  static noinline_for_stack
> -char *file_dentry_name(char *buf, char *end, const struct file *f,
> +char *file_d_path_name(char *buf, char *end, const struct file *f,
>  			struct printf_spec spec, const char *fmt)
>  {
> +	const struct path *path;
> +	char *p;
> +	int prepend_len, reserved_size, dpath_len;
> +
>  	if (check_pointer(&buf, end, f, spec))
>  		return buf;
>  
> -	return dentry_name(buf, end, f->f_path.dentry, spec, fmt);
> +	path = &f->f_path;
> +	if (check_pointer(&buf, end, path, spec))
> +		return buf;
> +
> +	p = d_path_unsafe(path, buf, end - buf, &prepend_len);

If I'm reading this right, you're using buf as scratch space to write
however much of the path fits. Then [*]

> +	/* Minus 1 byte for '\0' */
> +	dpath_len = end - buf - prepend_len - 1;
> +
> +	reserved_size = max_t(int, dpath_len, spec.field_width);
> +
> +	/* no filling space at all */
> +	if (buf >= end || !buf)
> +		return buf + reserved_size;

Why the !buf check? The only way we can have that is the snprintf(NULL,
0, ...) case of asking how much space we'd need to malloc, right? In
which case end would be NULL+0 == NULL, so buf >= end automatically,
regardless of how much have been "printed" before %pD.

> +
> +	/* small space for long name */
> +	if (buf < end && prepend_len < 0)

So if we did an early return for buf >= end, we now know buf < end and
hence the first part here is redundant.

Anyway, as for [*]:

> +		return string_truncate(buf, end, p, dpath_len, spec);
> +
> +	/* space is enough */
> +	return string_nocheck(buf, end, p, spec);

Now you're passing p to string_truncate or string_nocheck, while p
points somewhere into buf itself. I can't convince myself that would be
safe. At the very least, it deserves a couple of comments.

Rasmus
