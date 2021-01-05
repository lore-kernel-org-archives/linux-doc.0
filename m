Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8208C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jan 2021 22:26:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A48C922E00
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jan 2021 22:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbhAEW0B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Jan 2021 17:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbhAEW0A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jan 2021 17:26:00 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3522CC061574
        for <linux-doc@vger.kernel.org>; Tue,  5 Jan 2021 14:25:20 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id l7so482521qvt.4
        for <linux-doc@vger.kernel.org>; Tue, 05 Jan 2021 14:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kArfORnpXbDzEYXVcymH4JI7ZzyFJH6GXHj8Z5zwiLU=;
        b=jPDIrncDMNhUA6ptnOi0eDtRt/t3cfS0PCXbRqKfL6UKuh8zo9Ky6W8lhJPCMGlBZj
         acp6MEj4AbMxPc6ZHuaBsTGIjaoAId7tiMeIBgO5609XwDTxpGO2dn+ojbfUJuf+nlUq
         QSBKM/6yTEL7qg9oPvoJ0plwWdzZ8V5Oevj5Thykh6bD/sQmMU5/AqQXRzSwj6GI3EqF
         iDggCz+3sG7L/Nmm43rzv8V5mosq82N4Uqe54k8UrVZicvA5DJDEJPQp8nhzyJxrrUHl
         FzJhzNM71ViDNzykdGwSOY3OKCxlkN0vmtuUyPJFhcMB8aJEMUMh+Y7TZKJBYjxatw/2
         ue6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kArfORnpXbDzEYXVcymH4JI7ZzyFJH6GXHj8Z5zwiLU=;
        b=VmW1olVt19A40WEpJF/IuUDOKHfdoV4JnGv1w7cIfqq22HXQCNlqDnz2fL3kbuVSDp
         XucyxJ2tDw8D7gThIUEzilxs1iJwChh82a/LFMSV0uKn0suPJqogA2aNOVYj31WSMo3I
         aB0Z+/zJkHA8bZ9vOfcqp8zzvwagAu8CM6Yop2QdUKKB34C+lsz727zC0QBVqaQXELs1
         JPl4IV+fLwKGHLyE5RrnRKpJu+/W01c3RU4sqqN3trnps8Lle8zQECt2d5MUtARN3zho
         u5WXyFmFNyEqFvSkYiP6hdGh+r3RQS0KoD834UlqTZORVAs30L03r8L6jFPg0vI1+RfU
         0Qvg==
X-Gm-Message-State: AOAM530o0XiKjZMA5n+DAKepTXjEbn97AoPL1Gu7cLrgT8ufGCXZJgJB
        1GhgA/utpTt4FoGPhMPp4FY=
X-Google-Smtp-Source: ABdhPJxAN7xgIkhC03wkcR/4WagnxKigRc8M8QietcD+aUj0mEPXgIkDowF4G//hgUvdu3/yenEmRA==
X-Received: by 2002:ad4:4c0f:: with SMTP id bz15mr1759478qvb.10.1609885519431;
        Tue, 05 Jan 2021 14:25:19 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id q3sm442883qkb.73.2021.01.05.14.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 14:25:18 -0800 (PST)
Date:   Tue, 5 Jan 2021 15:25:17 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: remove mention of ENABLE_MUST_CHECK
Message-ID: <20210105222517.GA4089778@ubuntu-m3-large-x86>
References: <20210105055815.GA5173@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105055815.GA5173@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 05, 2021 at 06:58:15AM +0100, Miguel Ojeda wrote:
> We removed ENABLE_MUST_CHECK in 196793946264 ("Compiler Attributes:
> remove CONFIG_ENABLE_MUST_CHECK"), so let's remove docs' mentions.
> 
> At the same time, fix the outdated text related to
> ENABLE_WARN_DEPRECATED that wasn't removed in 3337d5cfe5e08
> ("configs: get rid of obsolete CONFIG_ENABLE_WARN_DEPRECATED").
> 
> Finally, reflow the paragraph.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> A couple translations (it and zh) should consider updating this
> too, since they also have the mention -- Cc'ing their maintainers.
> 
>  Documentation/process/4.Coding.rst | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/process/4.Coding.rst b/Documentation/process/4.Coding.rst
> index c27e59d2f702..0825dc496f22 100644
> --- a/Documentation/process/4.Coding.rst
> +++ b/Documentation/process/4.Coding.rst
> @@ -249,10 +249,8 @@ features; most of these are found in the "kernel hacking" submenu.  Several
>  of these options should be turned on for any kernel used for development or
>  testing purposes.  In particular, you should turn on:
>  
> - - ENABLE_MUST_CHECK and FRAME_WARN to get an
> -   extra set of warnings for problems like the use of deprecated interfaces
> -   or ignoring an important return value from a function.  The output
> -   generated by these warnings can be verbose, but one need not worry about
> + - FRAME_WARN to get warnings for stack frames larger than a given amount.
> +   The output generated can be verbose, but one need not worry about
>     warnings from other parts of the kernel.
>  
>   - DEBUG_OBJECTS will add code to track the lifetime of various objects
> -- 
> 2.29.2
> 
