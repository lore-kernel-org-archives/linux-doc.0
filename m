Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 547B07E27E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Apr 2018 12:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755979AbeDZMHZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 08:07:25 -0400
Received: from mail-it0-f47.google.com ([209.85.214.47]:54103 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755207AbeDZMHV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 08:07:21 -0400
Received: by mail-it0-f47.google.com with SMTP id m134-v6so24058547itb.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Apr 2018 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=BaIUcVJJB1IZT9ZhgMRGp+d8QqN2KWuPLugWs+xnd3U=;
        b=JGtO24q92TSIJ8hdX5sA8+fwF429ihh7IM57jdGZyl1KNweH9AEkTD/pPVJP5QMRV3
         xqLriZjfd6WeWwfpjwij01H7y8MgqdzKS5bBMWbOzW8Mvvo1bTHVjaNxiMYfyi5Axp/q
         SkuxOw0vf5TeDUfVweuU8x92QiKLRhxFIWpL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=BaIUcVJJB1IZT9ZhgMRGp+d8QqN2KWuPLugWs+xnd3U=;
        b=sedvP1cikOUYEvAA/+ijt9uoFmk3b6MCrekkprG7kdPn8BhfMMdv+19lE7yuid/TxN
         yd5RXRfbqpJ5hdYhhx/LXxS7yIQz9GefhGEh4vOcsMOox9DkSu/hqARj38wBG34bQDQc
         zAh+E+U+iRH9XPAfX2cxeLCNHZrLsJFSgPM48gU4JvT3KbYvdp8r5vBOWB8rczJXep2+
         VG9UhHzrc7T2K/TduOe6nmz6w2q2iMGguvtZuDEBAHuHLpYyH3icsgQtjPxbIZiyURH6
         NkJUgQVs8gOw6lt1lcHggZFesEVX0+xP+n8aA7QuCaykp+0zHk8P0t+cbiBxuTD1visl
         lwPA==
X-Gm-Message-State: ALQs6tAfBthgokNBB9ILi3I8GSR9lk4BZMJLDoCwl24q5x7RzPpqfW0E
        m428EWFCEi/+76rDT7W7F6gmuaaVEw57Rd9PWsiel+PY
X-Google-Smtp-Source: AIpwx4/y8mzfbIBIa70QlTgvTGjEe/ZZCnlM8BGTc9J4sJigkSAAgNjSGakd40ywiy1maRZXkMqDEWcIVOTq7SOpGHw=
X-Received: by 2002:a24:c146:: with SMTP id e67-v6mr26472064itg.70.1524744441197;
 Thu, 26 Apr 2018 05:07:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:2793:0:0:0:0:0 with HTTP; Thu, 26 Apr 2018 05:07:20
 -0700 (PDT)
In-Reply-To: <20180410203028.11412-1-brgl@bgdev.pl>
References: <20180410203028.11412-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Apr 2018 14:07:20 +0200
Message-ID: <CACRpkda+K3-=sPpJO90rjW0=+bsQ1uYT6E9Hp+G+-OEyTpc=fg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: add hogs support for machine code
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 10, 2018 at 10:30 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Board files constitute a significant part of the users of the legacy
> GPIO framework. In many cases they only export a line and set its
> desired value. We could use GPIO hogs for that like we do for DT and
> ACPI but there's no support for that in machine code.
>
> This patch proposes to extend the machine.h API with support for
> registering hog tables in board files.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> v1 -> v2:
> - kbuild bot complains about enum gpiod_flags having incomplete type
>   although it builds fine for me locally: change the type of dflags
>   to int

I like the idea and thinking behind this patch, so patch applied.

It's a bit of code to carry, so if it doesn't see any use, I will simply
revert it :)

But I bet you intend to follow up with some machine patches
and then it is immediately worth it.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
