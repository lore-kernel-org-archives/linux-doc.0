Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE7B27D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Apr 2019 21:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbfDAVMg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Apr 2019 17:12:36 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40715 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbfDAVMg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Apr 2019 17:12:36 -0400
Received: by mail-oi1-f196.google.com with SMTP id 3so8600730oir.7
        for <linux-doc@vger.kernel.org>; Mon, 01 Apr 2019 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=my+8kMrogBOyXJrCZPeMJC88daxVsQMYdE+rBltktwg=;
        b=j488x6tiM97EhXQc/V0QqchABBaTyH78NFyaCmrkFem7gAtMk15wihd5zSYn+QTzWL
         jCP8ef69w+NtciWMP0rB++VuHdApxi4cByB8/wn71c8/SOi+m57mLTVLF4UhqYGDLvwd
         4FBtacF/J8ZJlR2ykZ7YF+FMN2YqPd/Pm7ZCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=my+8kMrogBOyXJrCZPeMJC88daxVsQMYdE+rBltktwg=;
        b=PYhdejLEh9JCJpw0KQqQflffbZZHWHsNTl/hbyaZJQsB2HCLE2wO2wzn1AqKvJ8LZV
         Ecnr2CmuFccvZmIcwN0FfCwH1FdTwdgP+hlsjRfKWJjaoH0ArI2jBxreSzupb6H2UDYP
         JXL7iOVQyOY2FFssbKkXEwZ5zGCgn1YPp+15XXs7XVso7tihTXIAUBP597ytjUI0qlPk
         At4DZjLIIysm1Vx/usdVrMDnf8kdqpafvz56jjaimFyZfNrMluiBYYHUm5E6zaAZzpYv
         Ygj8L6e0v1QMKfl0WxQ6eQJSypJSjM03T/kNPEKLwVIiH/dmT9kJz53346L/8myN6lwu
         xr8Q==
X-Gm-Message-State: APjAAAXNWOZ/b3pGP+Re3ZMQ4yKF6nZw7IF7PbL2Rq6fWQqOrb5HYewz
        ZtjNT43i29bNwpEVT1PAvvO3QS+sL1c=
X-Google-Smtp-Source: APXvYqzFpv9x/YFU3NOfpgvW2pqyq3WzWTfXXiY04OW7igG5wPgSWSa6RWbsAPw7Uuwb6reCclzjfQ==
X-Received: by 2002:a05:6808:650:: with SMTP id z16mr14762534oih.100.1554153155690;
        Mon, 01 Apr 2019 14:12:35 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id p1sm4643731otl.75.2019.04.01.14.12.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 14:12:35 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id l203so7950484oia.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Apr 2019 14:12:34 -0700 (PDT)
X-Received: by 2002:aca:3905:: with SMTP id g5mr9847863oia.49.1554153154276;
 Mon, 01 Apr 2019 14:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <5d7229de06286b4ec06daee3411e39e9b638d66c.camel@perches.com>
In-Reply-To: <5d7229de06286b4ec06daee3411e39e9b638d66c.camel@perches.com>
From:   Nick Crews <ncrews@chromium.org>
Date:   Mon, 1 Apr 2019 15:12:23 -0600
X-Gmail-Original-Message-ID: <CAHX4x85RUfLG8caUY0fvN11qSNWiuzDjud_3Do8mUwM69M1OCg@mail.gmail.com>
Message-ID: <CAHX4x85RUfLG8caUY0fvN11qSNWiuzDjud_3Do8mUwM69M1OCg@mail.gmail.com>
Subject: Re: [PATCH] coding-style.rst: Generic alloc functions do not need OOM logging
To:     Joe Perches <joe@perches.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks Joe, this is a great detail to add.

On Sat, Mar 30, 2019 at 11:25 AM Joe Perches <joe@perches.com> wrote:
>
> Generic allocation functions already emit a dump_stack()
> so additional error logging isn't useful.
>
> Document it as such and add a reference to the allocation
> API.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  Documentation/process/coding-style.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 8ea913e99fa1..fa864a51e6ea 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -843,7 +843,8 @@ used.
>  The kernel provides the following general purpose memory allocators:
>  kmalloc(), kzalloc(), kmalloc_array(), kcalloc(), vmalloc(), and
>  vzalloc().  Please refer to the API documentation for further information
> -about them.
> +about them.  :ref:`Documentation/core-api/memory-allocation.rst
> +<memory_allocation>`
>
>  The preferred form for passing a size of a struct is the following:
>
> @@ -874,6 +875,9 @@ The preferred form for allocating a zeroed array is the following:
>  Both forms check for overflow on the allocation size n * sizeof(...),
>  and return NULL if that occurred.
>
> +These generic allocation functions all emit a stack dump on failure when used
> +without __GFP_NOWARN so there is no use in emitting an additional failure
> +message when NULL is returned.
>
>  15) The inline disease
>  ----------------------
>

Acked-by: Nick Crews <ncrews@chromium.org>
