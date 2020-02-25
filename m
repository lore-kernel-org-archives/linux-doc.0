Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817D0C35DF0
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 04:48:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56E8C24681
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 04:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fx4scD3F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgBYEsX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Feb 2020 23:48:23 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35232 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbgBYEsX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Feb 2020 23:48:23 -0500
Received: by mail-pj1-f66.google.com with SMTP id q39so743361pjc.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2020 20:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=81l7NwHvXz+VUnXaAAg16mnqTnYDAhfYGXIvoHGH9P4=;
        b=fx4scD3FL/TDLA2lgN+AAH0tErMyHywacByeNxNyqQonmrDosecMfvfM2oStXdBQ9n
         LZl8NaLpWTitbWTeeEn+gOHay1ZqHrIbHe6yHBM3y9DaVjdbG7WpbZfyHl8azxkiKTUh
         iD8DZUnOTYSLlxR2wXXiHxGaxAEDVZ0oDCoDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=81l7NwHvXz+VUnXaAAg16mnqTnYDAhfYGXIvoHGH9P4=;
        b=c4caJE95fymKHwyq+5YlJB3JG9jY50oUA6Y2QEI4dMNOVAkQB5xrO9v2O/Djy21DuG
         TDGKck6+wCMIwuVBjsU9Yf0NpPhk/7KkApCc+E8AYOj/210oFkxFut31imZFkXPA0ulZ
         /6MFvaaQtTFar5YyHDn7u3UP0gzffW+ChxAGSKgo+3RBWqG09n28BlDD293ZQ5mpr6K8
         1f1KWLa8Mlg/uFGpAmnsW/ubGMZTPYrLZ1h/+jjOhChKUy602X2YrhiuCUmywTeJmema
         0kUUR3XEtkJKtTXeQcej6vZEgrcFDD3GuFFjk+ok6QmwHIZ4QoQLeManA3MwFKQsUQyp
         qgYw==
X-Gm-Message-State: APjAAAV8Kl/GdY7nEE0T6v7WRcFhZyB2yBKfpdDF/pNdiGdktYM115hy
        zy2rjyikk+jnaoDr+pALxMrbUfKROd4=
X-Google-Smtp-Source: APXvYqwTLu3U8UF6VHUXN8KLR0YGEkVBH1ZQTUW4b4bj/PCntk4G2rYRt0ZHMe5aWKB1/Y4iuN1Z/g==
X-Received: by 2002:a17:90a:858c:: with SMTP id m12mr2790126pjn.127.1582606103038;
        Mon, 24 Feb 2020 20:48:23 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w81sm15080442pff.95.2020.02.24.20.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 20:48:22 -0800 (PST)
Date:   Mon, 24 Feb 2020 20:48:21 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH] docs/core-api: Add Fedora instructions for GCC plugins
Message-ID: <202002242048.7C6DB909E@keescook>
References: <20200221004843.1709-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221004843.1709-1-mpe@ellerman.id.au>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 21, 2020 at 11:48:43AM +1100, Michael Ellerman wrote:
> Add an example of how to install the necessary packages for GCC
> plugins on Fedora.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  Documentation/core-api/gcc-plugins.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/core-api/gcc-plugins.rst b/Documentation/core-api/gcc-plugins.rst
> index 8502f24396fb..4b1c10f88e30 100644
> --- a/Documentation/core-api/gcc-plugins.rst
> +++ b/Documentation/core-api/gcc-plugins.rst
> @@ -72,6 +72,10 @@ You must install the gcc plugin headers for your gcc version,
>  
>  	apt-get install gcc-4.9-plugin-dev
>  
> +Or on Fedora::
> +
> +	dnf install gcc-plugin-devel
> +
>  Enable a GCC plugin based feature in the kernel config::
>  
>  	CONFIG_GCC_PLUGIN_CYC_COMPLEXITY = y
> -- 
> 2.21.1
> 

-- 
Kees Cook
