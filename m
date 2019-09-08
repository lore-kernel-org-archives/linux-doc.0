Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB8107D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Sep 2019 23:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731425AbfIHXkX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Sep 2019 19:40:23 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40465 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731343AbfIHXkX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Sep 2019 19:40:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id y10so5709771pll.7
        for <linux-doc@vger.kernel.org>; Sun, 08 Sep 2019 16:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LohfG3rkkHl8bureWEJkUvhdbDGFWW8YgBUzOLjQodY=;
        b=Fqe9X1qllKs5enf5FC3P4j5w8zG3QiuUGfXHor2b6R811HjACIddysCpE5pQtTJsbu
         SoiWUs2RboFfg1mm0G8XfeWXwKybjnISHzhYZmH26MOBUbc/2FZeIZosjLwXl8uj8wZT
         kix6cH9yj/f87Et7cEIUZIRUB/Q+fxiq+IIl48S0t7ez7FdF9RzbXX5aSovS2mUEoC57
         hMUkz8DtSM5HPz4TZbuf+ohR/zzwKt/oqvUGDeyAov+PXg/eJLe20jY/eoyLwLrMEG9q
         +m2a42Z8XgGDrzxFTom6qWYM1rCw6tm7jRTZ6duum4yp5jRj0CdR0FrUO18fE/8ZHxXn
         +90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LohfG3rkkHl8bureWEJkUvhdbDGFWW8YgBUzOLjQodY=;
        b=keOcMpSXcPPaZEU/+KZSMzDnQ9c4lfDsTQLhalroaKQ0wdHiX6uouYv2WTGG301cIL
         J/KQLPlo2++zAgyuhFOGRppKXmEbEyb7+6U3cOb/Ul17n/1GgRi06RqqYKd3qnIZ1e80
         U3oGEermb/EUANkd9r2vMWwHb5txoyeEsLJBk7W4Q9GngV/QfnBrukN9AN55IWQWo87B
         sxVMu2ccyNND24CtYfbEZTPohoQD012XsQpD2qge6/t6p+twjJKjrGxcsKOQVZoFlW9V
         sz17a+yYCrUP/dznEPDhqpKFGC1qOZd1rh0VPn2x9H6s7xJgdIXms8WaZlLk25rN2VPn
         z6wQ==
X-Gm-Message-State: APjAAAXQwiHDJcUlICkQkpV5cAO+7CYtEiKvHaj3JWThoLwLjCUp/q4K
        LNAJcRytWNN/Z+He3hmFaAyPVHoKcz45mC64Qo20PQ==
X-Google-Smtp-Source: APXvYqyrH785kn4aLZQoAcdk/b4CYqJIOXgDPzV+kfYglrL5OB9k2ceCWlG1luir/5qE+eNXHMdRoV6KPjOZAP4ArkY=
X-Received: by 2002:a17:902:169:: with SMTP id 96mr20334010plb.297.1567986021747;
 Sun, 08 Sep 2019 16:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <1567890091-9712-1-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1567890091-9712-1-git-send-email-sj38.park@gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Sun, 8 Sep 2019 16:40:10 -0700
Message-ID: <CAFd5g46MNYcY-o8Z-1tSi0Kva02CjhcWC-xwkeNc6kfiDzLpLQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Fix verification command
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     shuah <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, kunit-dev@googlegroups.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 7, 2019 at 2:01 PM SeongJae Park <sj38.park@gmail.com> wrote:
>
> kunit wrapper script ('kunit.py') receives a sub-command (only 'run' for
> now) as its argument.  If no sub-command is given, it prints help
> message and just quit.  However, an example command in the kunit
> documentation for a verification of kunit is missing the sub-command.
> This commit fixes the example.
>
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

> ---
>  Documentation/dev-tools/kunit/start.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
> index 6dc229e..aeeddfa 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst
> @@ -43,7 +43,7 @@ wrapper from your kernel repo:
>
>  .. code-block:: bash
>
> -       ./tools/testing/kunit/kunit.py
> +       ./tools/testing/kunit/kunit.py run

Ooops, that's embarrassing; I have the right command a couple lines above.

In anycase, thanks for finding and fixing this!

>  .. note::
>     You may want to run ``make mrproper`` first.
> --
> 2.7.4
>
