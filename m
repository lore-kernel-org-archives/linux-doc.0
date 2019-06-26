Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C77F67D8AB
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Jun 2019 19:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfFZT7v (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 26 Jun 2019 15:59:51 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36583 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfFZT7v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jun 2019 15:59:51 -0400
Received: by mail-pl1-f195.google.com with SMTP id k8so2018436plt.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2019 12:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oJrm4UyKgvoevmBE4eZPkQ/+kkY70KZGEQ0Q2cnjCFc=;
        b=fsE7LC3omCGhexX9SxhYLu3osDjmI5IO1mcikyIyBAs6zALQQUP8jP37oWiKt5Z0UL
         9QFM5YXuvbppFfsfhQIrW7neyfgexnYYBO0IzrrU3APhRiyqKvLrFxLflkCmPoj0EApW
         yIMuMW8aARU2MWuFHH2/6QwZOvcCaxhWQlJgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oJrm4UyKgvoevmBE4eZPkQ/+kkY70KZGEQ0Q2cnjCFc=;
        b=B6jBcimc/cU9w1alaLvW78DNSjR9h6hA2GCP2iWHXTImZFxGhrNqwoPX8a+krJ1oIk
         AUt/gd0VbmRGMDpgWqvWIpWtjLqJ5c/HYXVRDlIC6tHIg0DHoqSKyMjGh6Yu65KUYMbR
         X67zhAzl/5kYF9BMZ5PD1YmHX4XjUyL1bswPBfv9Nw4u84VEqjzx00sq1/VdFLG6ORm8
         m+9SaCvKx2rdWd2BUD3mkdOPZqBcpINPJwRU460TVmg+mk2BMR/1BkXIFDWC1WqdwjV9
         qhumzuLa/vy3NHaHEw2qoaElLKq8O6eGpqKDpfMWhaut79AYMRoV0pftFNg1ABphMrYE
         6X6w==
X-Gm-Message-State: APjAAAWIABdlJwcw9mYBMKlsH/EEPKVwxM7E/D3RgaXLBV4Ryn/MRcZw
        wBrljiCdFS4+DzBuqCsX7JJ+cQ==
X-Google-Smtp-Source: APXvYqzFMKnWTXmF+17dsuclaAZ/vYLU8FRyvzEYjwf+Z7iMzF+jmOZhMCafJuUIe4LUhngbX9tXtg==
X-Received: by 2002:a17:902:788e:: with SMTP id q14mr7551852pll.234.1561579190689;
        Wed, 26 Jun 2019 12:59:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 22sm37148pfu.179.2019.06.26.12.59.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 12:59:49 -0700 (PDT)
Date:   Wed, 26 Jun 2019 12:59:48 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Emese Revfy <re.emese@gmail.com>
Subject: Re: [PATCH] docs: move gcc_plugins.txt to core-api and rename to .rst
Message-ID: <201906261259.34343CC@keescook>
References: <4937ff4f93282ed57c9859de4300b4d835880ebb.1561556794.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4937ff4f93282ed57c9859de4300b4d835880ebb.1561556794.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 26, 2019 at 10:47:46AM -0300, Mauro Carvalho Chehab wrote:
> 
> 
> The gcc_plugins.txt file is already a ReST file. Move it
> to the core-api book while renaming it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  Documentation/{gcc-plugins.txt => core-api/gcc-plugins.rst} | 0
>  Documentation/core-api/index.rst                            | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/{gcc-plugins.txt => core-api/gcc-plugins.rst} (100%)
> 
> diff --git a/Documentation/gcc-plugins.txt b/Documentation/core-api/gcc-plugins.rst
> similarity index 100%
> rename from Documentation/gcc-plugins.txt
> rename to Documentation/core-api/gcc-plugins.rst
> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
> index 2466a4c51031..d1e5b95bf86d 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -35,7 +35,7 @@ Core utilities
>     boot-time-mm
>     memory-hotplug
>     protection-keys
> -
> +   gcc-plugins
>  
>  Interfaces for kernel debugging
>  ===============================
> -- 
> 2.21.0
> 
> 

-- 
Kees Cook
