Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5397C35E01
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 18:58:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BED55218AC
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 18:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OTDHNKDT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgBYS6b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:58:31 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44525 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730080AbgBYS6b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 13:58:31 -0500
Received: by mail-pf1-f194.google.com with SMTP id y5so9252pfb.11
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 10:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Iv8nu0Tmrew9fnUnqPnKjAEYAPCBJwm2aHqQgQlHcXI=;
        b=OTDHNKDTmnSxFLlKliRJJ9/P+0Gj67aV93Z9DkDKQSb5UBIv6Lf9hta72mOKzV7lCA
         hgdCJGHTBdyOTlwFrBh3IP1/RsLtfWq4kGje6VP73W5eFbI6N6Io/NJxgJdkF05efPs5
         m+mbix3wNRslURQ37RuZEZxFXo2t0g1SvssQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Iv8nu0Tmrew9fnUnqPnKjAEYAPCBJwm2aHqQgQlHcXI=;
        b=DDKmgH/BZ0exNSN10YPo2qHjg4w9kEd1On40BXviXpkP5ba+6fVHNKRrr39CVZYHvh
         Gh9V1d6crpb/wSVOUYrIFjjvNBPH9++jHubY5pmtGb0A7nO83bYQnfuKTkSYc/NKDnxT
         vlN9kwlqWsY136hxaOAswyGtYi+VAVCp5PVwbQ2LXZxeWKIg1eg3eKtZOf6UsDPkTc0R
         d3jGrfccOooqdf8QDzDVlTkU0urTlM98t/3PgRSeSypz8BXE5DnvoKiE8jmZBYpK+7RE
         fvxGCpL2cCVZoZqGqfvxTq095LNwUPYVx/vUWtiszwmkNc1SMGo7MLP05p+s+S7/aNIj
         LHfA==
X-Gm-Message-State: APjAAAWGdMWrbIC6F1MGRAWW9dGMYhw/oy9pkQnjbUC8c2ao/Qwe+czm
        6UnqMS956xmaW6NfYb5zcBmRZA==
X-Google-Smtp-Source: APXvYqwlFhU6hPGfLFawa58hpajX7pM4HYhMZNF5+kHXg+q9Uo6O71/hbEkW5Dj1+zEZt+TbulmPgw==
X-Received: by 2002:a63:ce03:: with SMTP id y3mr62064239pgf.427.1582657109996;
        Tue, 25 Feb 2020 10:58:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b18sm18196190pfd.63.2020.02.25.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:58:29 -0800 (PST)
Date:   Tue, 25 Feb 2020 10:58:28 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kernel-hardening@lists.openwall.com, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gcc-plugins: fix gcc-plugins directory path in
 documentation
Message-ID: <202002251057.C4E397A@keescook>
References: <20200213122410.1605-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213122410.1605-1-masahiroy@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 13, 2020 at 09:24:10PM +0900, Masahiro Yamada wrote:
> Fix typos "plgins" -> "plugins".
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks!

Acked-by: Kees Cook <keescook@chromium.org>

Jon, can you take this?

-Kees

> ---
> 
>  Documentation/kbuild/reproducible-builds.rst | 2 +-
>  scripts/gcc-plugins/Kconfig                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> index 503393854e2e..3b25655e441b 100644
> --- a/Documentation/kbuild/reproducible-builds.rst
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -101,7 +101,7 @@ Structure randomisation
>  
>  If you enable ``CONFIG_GCC_PLUGIN_RANDSTRUCT``, you will need to
>  pre-generate the random seed in
> -``scripts/gcc-plgins/randomize_layout_seed.h`` so the same value
> +``scripts/gcc-plugins/randomize_layout_seed.h`` so the same value
>  is used in rebuilds.
>  
>  Debug info conflicts
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index e3569543bdac..7b63c819610c 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -86,7 +86,7 @@ config GCC_PLUGIN_RANDSTRUCT
>  	  source tree isn't cleaned after kernel installation).
>  
>  	  The seed used for compilation is located at
> -	  scripts/gcc-plgins/randomize_layout_seed.h.  It remains after
> +	  scripts/gcc-plugins/randomize_layout_seed.h.  It remains after
>  	  a make clean to allow for external modules to be compiled with
>  	  the existing seed and will be removed by a make mrproper or
>  	  make distclean.
> -- 
> 2.17.1
> 

-- 
Kees Cook
