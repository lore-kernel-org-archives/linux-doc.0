Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 047867D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Mar 2019 20:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfCDUtq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Mar 2019 15:49:46 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35398 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfCDUtq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Mar 2019 15:49:46 -0500
Received: by mail-ua1-f68.google.com with SMTP id f88so5688741uaf.2
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2019 12:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9gMVJpgA2l3SJq7DPq7voXcLik2e2b70fmXxGcEnxeY=;
        b=NQ6hTc/OzPF1OYz1PnyBN/6w4LZwMMaSuk9HVGlP9RrEXmUBAa+8g70YPbYdhFyYCH
         ZXdX/xBcZDvCIEef3kZAIko3vJcu/RJO74UcMjEPqMJ6CtmVI4gww//nTaQvwc/7Kwoc
         RiakEN4LuVfi9lG2HS1770ZWV6DmMJ/9TPNRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9gMVJpgA2l3SJq7DPq7voXcLik2e2b70fmXxGcEnxeY=;
        b=rb+/pVTdyMw+9u34UP5kKQTbMnNWPRAyTAWTAlEBlRdM26QM7W/5a+7JAQ0gwDAgif
         po63sZ+Mk/azLhokhi3eKqwkQbJ3ajEmRmWvgdArWwOdJGMZFvT8doT/kiPecL1pAxkZ
         M81myLTQDNCZFeJ9QkMeHnLLNxBUIp4s252xLtPutVM8+btoEg+Cfa6x2v4AvoMKvWXz
         Hr3TpO3dU2w9R7I4Vo6UQou1L0piIlj32rdw3oqbsBaqfSlWI5gfJiQj2LHtMHbd1L35
         yPN7Jyg9buol09CtCfuyOF/qj67yOSAfJY3olzEmbDVwf+n9Kz/vVFBKJb1qqpe7ZRtQ
         auGw==
X-Gm-Message-State: APjAAAXTqEjWy9hAGfB00lSe9ufGDhyWAReDAIMRb2c56pVsxEx1+vmi
        Nm5gWvzja0iMb9wbYJwibhm22eyfvws=
X-Google-Smtp-Source: APXvYqyTHZIYX0LDzsMVnmYHXJnl1M+cZrI8y1Rehbb0W3l8jzjlPjT4je6BPJdOkyfFOxRqiF/PGQ==
X-Received: by 2002:a67:8c82:: with SMTP id o124mr10809564vsd.204.1551732584893;
        Mon, 04 Mar 2019 12:49:44 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a64sm1381813uaa.1.2019.03.04.12.49.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 12:49:44 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id j8so5659165uae.13
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2019 12:49:44 -0800 (PST)
X-Received: by 2002:ab0:74cb:: with SMTP id f11mr10394375uaq.14.1551732583665;
 Mon, 04 Mar 2019 12:49:43 -0800 (PST)
MIME-Version: 1.0
References: <20190304203152.8236-1-jwilk@jwilk.net> <20190304203152.8236-2-jwilk@jwilk.net>
In-Reply-To: <20190304203152.8236-2-jwilk@jwilk.net>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 4 Mar 2019 12:49:32 -0800
X-Gmail-Original-Message-ID: <CAGXu5jLaBQDAa5Jvudb1t53mUWu-Fywz6eD0Nf8weextAodFiQ@mail.gmail.com>
Message-ID: <CAGXu5jLaBQDAa5Jvudb1t53mUWu-Fywz6eD0Nf8weextAodFiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: seccomp: unify list indentation
To:     Jakub Wilk <jwilk@jwilk.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Tycho Andersen <tycho@tycho.ws>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 4, 2019 at 12:32 PM Jakub Wilk <jwilk@jwilk.net> wrote:
>
> Use tabs to indent SECCOMP_RET_USER_NOTIF definition, for consistency
> with other items in this list.
>
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  Documentation/userspace-api/seccomp_filter.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/seccomp_filter.rst b/Documentation/userspace-api/seccomp_filter.rst
> index 0f09a63ea923..bd9165241b6c 100644
> --- a/Documentation/userspace-api/seccomp_filter.rst
> +++ b/Documentation/userspace-api/seccomp_filter.rst
> @@ -123,9 +123,9 @@ In precedence order, they are:
>         to userland as the errno without executing the system call.
>
>  ``SECCOMP_RET_USER_NOTIF``:
> -    Results in a ``struct seccomp_notif`` message sent on the userspace
> -    notification fd, if it is attached, or ``-ENOSYS`` if it is not. See below
> -    on discussion of how to handle user notifications.
> +       Results in a ``struct seccomp_notif`` message sent on the userspace
> +       notification fd, if it is attached, or ``-ENOSYS`` if it is not. See
> +       below on discussion of how to handle user notifications.
>
>  ``SECCOMP_RET_TRACE``:
>         When returned, this value will cause the kernel to attempt to
> --
> 2.20.1
>


-- 
Kees Cook
