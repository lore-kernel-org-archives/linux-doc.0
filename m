Return-Path: <SRS0=A2eK=34=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2317CC2BA83
	for <linux-doc@archiver.kernel.org>; Sat,  8 Feb 2020 00:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6863222D9
	for <linux-doc@archiver.kernel.org>; Sat,  8 Feb 2020 00:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f8bTlSKJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgBHA4d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Feb 2020 19:56:33 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33753 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgBHA4d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Feb 2020 19:56:33 -0500
Received: by mail-oi1-f194.google.com with SMTP id q81so3878822oig.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2020 16:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uUfk7LrvhAOk4XnaKszmkISGSZZmMHnSqDKeNNRnGws=;
        b=f8bTlSKJK1CASCBdMQDuUR+vovMi+dMZj+TNpw9WYAn0ySvo8/rrah47ObGOipgd8/
         Laiem1ICYt7oJh+ssG0CRh1GYOD+VwLr0PIOyE+wzn4kpxyRtFo6amz3qzGEebdeAuhf
         u2tiPis+FlODyz1DcO4c2f2+Y3NGJhh7PakVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uUfk7LrvhAOk4XnaKszmkISGSZZmMHnSqDKeNNRnGws=;
        b=pwC+HbBCh6ba9BGarxSx4qnmhVpZvrrMIW2gUmSuamvAoaKQrYmwMXOzmmydS1Go4s
         L/11Gmxa37uZE97tt5fC28OrB+idk3ifadmIzihAaKbeHoovCJy+eZghPRz9kD71EpRg
         4Eikd+8X8GGHbfqoEXqKXrBZsEvH1nDHBR7SCN/t3rpaXpJKuLqlti31th2rE2Vt8B+Z
         QQ2vlYE3GX+NDhRhYmbL0WSXUUTRr8PTEGKcIn95Dxbl99GxMe/NKmLNBTlIdYvQ95fT
         OqpH9/v4i5IEObqjMBDiZYsAF9tAD3fiPfogCzyH7PrdVWDAnLSw+R6dEkEill+G6dRt
         xAnA==
X-Gm-Message-State: APjAAAWReUlV6GCxxMvAWGxT9aZHleIU/5zqjuprEvEN0A3XYdU9S0YL
        CAhE4qz2Zc6zG+9bHDrTqR+Cww==
X-Google-Smtp-Source: APXvYqzL7hihDJWm1D3vB2KlBuf44XoCpp4DTzE6I+oV82jKtnFMR5SCdUclYPxB3PiQlLUVecS/PA==
X-Received: by 2002:aca:1c01:: with SMTP id c1mr3956614oic.18.1581123391068;
        Fri, 07 Feb 2020 16:56:31 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v10sm1585946oic.32.2020.02.07.16.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 16:56:30 -0800 (PST)
Date:   Fri, 7 Feb 2020 16:56:28 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Tim Bird <Tim.Bird@sony.com>, Jiri Olsa <jolsa@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] bootconfig: Use parse_args() to find bootconfig and '--'
Message-ID: <202002071656.A078FB34@keescook>
References: <20200207192632.0cd953a7@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207192632.0cd953a7@oasis.local.home>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 07, 2020 at 07:26:32PM -0500, Steven Rostedt wrote:
> 
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> The current implementation does a naive search of "bootconfig" on the kernel
> command line. But this could find "bootconfig" that is part of another
> option in quotes (although highly unlikely). But it also needs to find '--'
> on the kernel command line to know if it should append a '--' or not when a
> bootconfig in the initrd file has an "init" section. The check uses the
> naive strstr() to find to see if it exists. But this can return a false
> positive if it exists in an option and then the "init" section in the initrd
> will not be appended properly.
> 
> Using parse_args() to find both of these will solve both of these problems.
> 
> Link: https://lore.kernel.org/r/202002070954.C18E7F58B@keescook
> 
> Fixes: 7495e0926fdf3 ("bootconfig: Only load bootconfig if "bootconfig" is on the kernel cmdline")
> Fixes: 1319916209ce8 ("bootconfig: init: Allow admin to use bootconfig for init command line")
> Reported-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Cool; thanks for fixing this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  init/main.c | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 491f1cdb3105..e7261f1a3523 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -142,6 +142,15 @@ static char *extra_command_line;
>  /* Extra init arguments */
>  static char *extra_init_args;
>  
> +#ifdef CONFIG_BOOT_CONFIG
> +/* Is bootconfig on command line? */
> +static bool bootconfig_found;
> +static bool initargs_found;
> +#else
> +# define bootconfig_found false
> +# define initargs_found false
> +#endif
> +
>  static char *execute_command;
>  static char *ramdisk_execute_command;
>  
> @@ -336,17 +345,31 @@ u32 boot_config_checksum(unsigned char *p, u32 size)
>  	return ret;
>  }
>  
> +static int __init bootconfig_params(char *param, char *val,
> +				    const char *unused, void *arg)
> +{
> +	if (strcmp(param, "bootconfig") == 0) {
> +		bootconfig_found = true;
> +	} else if (strcmp(param, "--") == 0) {
> +		initargs_found = true;
> +	}
> +	return 0;
> +}
> +
>  static void __init setup_boot_config(const char *cmdline)
>  {
> +	static char tmp_cmdline[COMMAND_LINE_SIZE] __initdata;
>  	u32 size, csum;
>  	char *data, *copy;
>  	const char *p;
>  	u32 *hdr;
>  	int ret;
>  
> -	p = strstr(cmdline, "bootconfig");
> -	if (!p || (p != cmdline && !isspace(*(p-1))) ||
> -	    (p[10] && !isspace(p[10])))
> +	strlcpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> +	parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0, NULL,
> +		   bootconfig_params);
> +
> +	if (!bootconfig_found)
>  		return;
>  
>  	if (!initrd_end)
> @@ -563,11 +586,12 @@ static void __init setup_command_line(char *command_line)
>  		 * to init.
>  		 */
>  		len = strlen(saved_command_line);
> -		if (!strstr(boot_command_line, " -- ")) {
> +		if (initargs_found) {
> +			saved_command_line[len++] = ' ';
> +		} else {
>  			strcpy(saved_command_line + len, " -- ");
>  			len += 4;
> -		} else
> -			saved_command_line[len++] = ' ';
> +		}
>  
>  		strcpy(saved_command_line + len, extra_init_args);
>  	}
> -- 
> 2.20.1
> 

-- 
Kees Cook
