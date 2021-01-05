Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9E2C433DB
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jan 2021 20:28:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 805B922D6F
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jan 2021 20:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbhAEU2i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Jan 2021 15:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbhAEU2i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jan 2021 15:28:38 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AD9C061793
        for <linux-doc@vger.kernel.org>; Tue,  5 Jan 2021 12:27:58 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id h10so392455pfo.9
        for <linux-doc@vger.kernel.org>; Tue, 05 Jan 2021 12:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/YvelAXsYnXU+Bvnv0BzA13QqeMxf6yycfKjv7cHTCk=;
        b=onB/wN8gaazvrGMm4+Kw7omwVGoS0u15gq86wS9zSOQaIY+1xIZTWnGnKXk00c1w/G
         OcT5GDj9SVrTeScetVyXzDZfTPYj7t4c+JOjeOkgAdLo5mhJmwaVFD9Ag0xFF8u1SoVr
         x/pDsdWVc++yjAc+5z3AA78ZtKiIMNT4qLrEiP4b7ith8ihJULpGRo9SYlDptd4HdmCR
         FzSmmXq29Mb6UYKcVJbkMg9tIzzqOdXvoKSwPOCs2rU9iyZU6QFAd6JSskyJAF+g7B/C
         71BK9lRYqXbw2hvBEGnLLnHFy0OiUAb2fE8TzIuR7E4rvvO/aqC3dDtQHMQIK4ujuLpy
         ghJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/YvelAXsYnXU+Bvnv0BzA13QqeMxf6yycfKjv7cHTCk=;
        b=Iv2DP5WvQFRZ9WJ9LLYuLTZOkArRihKM4fBQf2Ze6if5IsfiwjNR8T8gT8622m0W0Z
         vI6XbNsDIhakfkV2KM5gte57IFlMi2SkKkFIEJTfCOyUR7PC32dGC/qZFCJTZ6l615Cu
         Jzse6bLkr0c6ePAoq9C0o1G5A+CTPvHD+xPuWDeiiy520cCT9eq1Mc2Tl+CVS9PBMIG4
         5rhKpWARNgK0YXTLh/Sc1q4PRtfPxFEXlyhsOY9I4lD9sWCS3G7ANxxXXq+f5wLKlEPS
         EsXz+QZbIFUgyAakDqZNcn0oePC0T5Sp1LGtHLYTanhbgeepDinyiLXOugF/puHwOpea
         SROg==
X-Gm-Message-State: AOAM533Z+xk8PfM4piqbIvzIKEgrdZGqBHvK1DkLe4L40iY0OmZVyQUC
        yjYhprWyvJ2RqVfabBlaXuyHo7DCYmyLck9slZx9UQ==
X-Google-Smtp-Source: ABdhPJzWXZFR7uPYaRGO2lhxFMxIn6RNyxdCqjwbochS0dFcFYKUYR7gEDi1yj8Ko403p69EQ7mqhu9gDAmiUilCNfc=
X-Received: by 2002:a63:1142:: with SMTP id 2mr956382pgr.263.1609878477703;
 Tue, 05 Jan 2021 12:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20210105055815.GA5173@kernel.org>
In-Reply-To: <20210105055815.GA5173@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 5 Jan 2021 12:27:48 -0800
Message-ID: <CAKwvOdmtkTaxNAPE1edsD3hY31NN+6MriMDOSvV-vtv79_Kgpg@mail.gmail.com>
Subject: Re: [PATCH] docs: remove mention of ENABLE_MUST_CHECK
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 4, 2021 at 9:58 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
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

Thanks for the patch!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

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


-- 
Thanks,
~Nick Desaulniers
