Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 12E6A7D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 20:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbeJCDhs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 23:37:48 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:42512 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbeJCDhs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 23:37:48 -0400
Received: by mail-yw1-f65.google.com with SMTP id a197-v6so1370462ywh.9
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 13:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=BigXsjJ8GKcX1ae9N+3KGnasaCrYsrBiqtxqVJKV8aA=;
        b=cw39HMQC1S6WK+5O5QLOBKHlI8qBLqR9uBkLnY0VLw6bvQ+jWSEHaXjZ8ynnU3ezAi
         jTDuob2JlwViYgMrSFMjH0iyJHVpPe+nIFN8ip6VIktHONuJx1od4sULQgpzFXZi/qty
         dlnTX9SWERJmLEqqImq5YAA7ZylbFpLghGWUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=BigXsjJ8GKcX1ae9N+3KGnasaCrYsrBiqtxqVJKV8aA=;
        b=e+DTGD3aNxjRUW+0Vz6XzTGOQpqqVm8W8m1Z9fT4ZaXRkVd79iHQxn4TwLqL6LCcsh
         ZyWXH9Nr4ZTDWa52dNZCPUJLHD9dfI+ZJReSBzE/WvxWAYabBgXokE8ORQC5im9OxuMw
         IXuSs6PfA/3f6K2gbjSAOrNWeU8GgLE8b0d7aOHi+dm4068AT+WOaMaGBVXrwvGnjbfW
         T/SQOKBUuEQ6kDM+v6Szy7lqjT2d9tH8uhp2Uh5HzKue/C442LMStKzXp6SYnmeiC/+r
         DltTPMCrUh+IPq/WWmw6WjTSdtVoYCPbIJGhjaX7L239VHL6XdVYML6haULe9oPEqDqT
         xthQ==
X-Gm-Message-State: ABuFfoh5FJyBpugoec/0XxykGDvdLKEX5zJnb6+5AjOm7YFUUc0YEPu/
        FX0l/Lz032heMnj7sVh+UDIp3OdzG1Y=
X-Google-Smtp-Source: ACcGV61itsPwhBTKdXRH5G1XPtP5gWA9vedD/YZKo4Aj+9qy0PqR8UsDYAId5gpC9n14xCXlWor/Lg==
X-Received: by 2002:a81:1e05:: with SMTP id e5-v6mr9664260ywe.439.1538513554481;
        Tue, 02 Oct 2018 13:52:34 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id p128-v6sm9580038ywp.65.2018.10.02.13.52.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 13:52:33 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id o8-v6so1404081ybk.13
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 13:52:33 -0700 (PDT)
X-Received: by 2002:a25:dd82:: with SMTP id u124-v6mr9471213ybg.171.1538513552785;
 Tue, 02 Oct 2018 13:52:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 13:52:32 -0700 (PDT)
In-Reply-To: <20181002204722.GA9610@scapa.corsac.net>
References: <20181002204722.GA9610@scapa.corsac.net>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 13:52:32 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKLaYxP81FYp_=Vc8GZWVGs_TAzjw5m2CBm0sNKwohXCg@mail.gmail.com>
Message-ID: <CAGXu5jKLaYxP81FYp_=Vc8GZWVGs_TAzjw5m2CBm0sNKwohXCg@mail.gmail.com>
Subject: Re: [PATCH] yama: clarify ptrace_scope=2 in Yama documentation
To:     Yves-Alexis Perez <corsac@corsac.net>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 2, 2018 at 1:47 PM, Yves-Alexis Perez <corsac@corsac.net> wrote:
> Current phrasing is ambiguous since it's unclear if attaching to a
> children through PTRACE_TRACEME requires CAP_SYS_PTRACE. Rephrase the
> sentence to make that clear.
>
> Signed-off-by: Yves-Alexis Perez <corsac@corsac.net>

Thanks! Yes, this makes things more clear.

Acked-by: Kees Cook <keescook@chromium.org>

Jon, can you take this in your tree?

-Kees

> ---
>  Documentation/admin-guide/LSM/Yama.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/LSM/Yama.rst b/Documentation/admin-guide/LSM/Yama.rst
> index 13468ea696b7..d0a060de3973 100644
> --- a/Documentation/admin-guide/LSM/Yama.rst
> +++ b/Documentation/admin-guide/LSM/Yama.rst
> @@ -64,8 +64,8 @@ The sysctl settings (writable only with ``CAP_SYS_PTRACE``) are:
>      Using ``PTRACE_TRACEME`` is unchanged.
>
>  2 - admin-only attach:
> -    only processes with ``CAP_SYS_PTRACE`` may use ptrace
> -    with ``PTRACE_ATTACH``, or through children calling ``PTRACE_TRACEME``.
> +    only processes with ``CAP_SYS_PTRACE`` may use ptrace, either with
> +    ``PTRACE_ATTACH`` or through children calling ``PTRACE_TRACEME``.
>
>  3 - no attach:
>      no processes may use ptrace with ``PTRACE_ATTACH`` nor via
> --
> 2.19.0
>
>
> --
> Yves-Alexis



-- 
Kees Cook
Pixel Security
