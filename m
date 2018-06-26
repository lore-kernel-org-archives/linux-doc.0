Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B73C17DF89
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 09:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933482AbeFZJeK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 05:34:10 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:33149 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933675AbeFZJeG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jun 2018 05:34:06 -0400
Received: by mail-it0-f67.google.com with SMTP id k17-v6so14822789ita.0
        for <linux-doc@vger.kernel.org>; Tue, 26 Jun 2018 02:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5rPSc8bEh8JJ/gyd8mxuLhMXDecD/m8KQxD9RUIVHHU=;
        b=UyRQr8kf6obvWWPRwezaBp5y5ovi12ruOnxOcQ7xWTQpvLHrmNnYqgWEF6L+UkLZ3I
         ibHqyKjjKFvmw0SZDmV/uDjsfe4qCm8ZJM5unJgY4rfOAaL+Cqh018Lp7Vz493UGEFTM
         dLgQaE30FeYUkARkj8cHIFjNY4ytxrEY5aQrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5rPSc8bEh8JJ/gyd8mxuLhMXDecD/m8KQxD9RUIVHHU=;
        b=FJjm/ivqmsTm56TK/9P010I7iN59/Aur3mBiooeJimYGARMKbLqk1L6gpgEwmY/i9o
         UFgmdW+cyN3lqT5jArECcgwBffhut9Yc8Wd7oJn2AzMxrli7MTnHvSxR1nrccp175sCr
         YYyHhFz9hkdYpYRVqXglsRgfcgrU1xcAIKb0SrmKzNMJvZciLoVS4R5sv28pxQVwu9tl
         1+7nztdoBK6QIpzEQxr8HPs7kgaawyCrkgCFv0dvTjfGztK37n/kCBN6KbJQJHHsUYR6
         b/iwQQVlgcwwUYGc8l4CQItcEfl96NISFcg3Q1n9XEbhfckvJEJexMZlLMFbyJbueI0a
         k3IA==
X-Gm-Message-State: APt69E2rs5GJcfBTsPx3TFYrZkKe5nnyyO5Gme3tWzy7oc8ds0XkhpV6
        JnaoGUBrUX4AjQe//A+TgNinuBxEFA+y3M6e51M/LEzK
X-Google-Smtp-Source: ADUXVKItDBdKbMcgppfhp2L4s2KfSlNUJrnBZFBZNlH5mMHTXoLNp+1AAqIfz5I/9IAkjpo/85Towk8uK2RZYYbC2lM=
X-Received: by 2002:a24:42c8:: with SMTP id i191-v6mr775864itb.135.1530005646219;
 Tue, 26 Jun 2018 02:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1528990947.git.mchehab+samsung@kernel.org> <d04d47f9fba035cf9de8589a288964c636324d58.1528990947.git.mchehab+samsung@kernel.org>
In-Reply-To: <d04d47f9fba035cf9de8589a288964c636324d58.1528990947.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jun 2018 11:33:53 +0200
Message-ID: <CACRpkda4AVhbeka0V17mJDjFihTFQY3+6M+iUBbPyaX22RTDow@mail.gmail.com>
Subject: Re: [PATCH v3 23/27] devicetree: fix name of pinctrl-bindings.txt
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 14, 2018 at 6:09 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> Rename:
>         pinctrl-binding.txt -> pinctrl-bindings.txt
>
> In order to match the current name of this file.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Is this applied in some other tree or something I should
apply to the pinctrl tree?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
