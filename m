Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 656967DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Apr 2018 16:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756742AbeDZQmy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 12:42:54 -0400
Received: from mail-io0-f194.google.com ([209.85.223.194]:38918 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754582AbeDZQmx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 12:42:53 -0400
Received: by mail-io0-f194.google.com with SMTP id r9-v6so15758855iod.6
        for <linux-doc@vger.kernel.org>; Thu, 26 Apr 2018 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=/3xZ6WNublQWszIRaUqlclJsj4CoSbtB+cfFr/Yzjlo=;
        b=ptz20M35md2E/5WwGPZkz20ZpSfSPa3LwwtRnA3rctqUVjnNALHR/W3b0u8IpPU9xb
         WzY0ROeSjOQN2N4Q52fGiy4evWNcWYtO91DrMPAoFRGNH9uW18R2giziLco4ae6HX7Et
         JLaJOCAzHI5tS2d7s/72arBbbmwuY/7HT1UvTtHkS/z39TWJMjaG5kNAymkagZ8hY8DN
         4rc6wTKUSiqQzvn7ugwao8Ujx72V83FytFAyp3JjEtU6No0Uuk3J29t0Wu5c/d1VqQpx
         PBwcRJiLW8hZT4XRy2rWav3wuDPx8QVEEWv8CoK5XrzgTsn4CkHgQ06SWc5GGY0VoFtB
         xGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=/3xZ6WNublQWszIRaUqlclJsj4CoSbtB+cfFr/Yzjlo=;
        b=l8U+Pwum2tzauu/B5/Gw/HsDQBDTv2TFDUvBeEEnszHtuMsyI6gEIoJq64iLRQWCc1
         g4gXwtlyUY6K+uhSqFWfPuxnJFVlrvMspF+lBiP+loJld37vGXkT2QdMqrUniGBYw3mW
         Q9OyWAcwpt8eLQlZPM3BK3jDDCmX7JaIQaE/GrBVbc8oU4KL0c3DeIiOkzOqUCRZoznd
         DyfH0qfDjkaWUREFwvXQwfGcxijLlhjKLyVWR3rFue3GlD4Ixv3kAGJmuNHmur2zAcas
         T9g7scsks9pbLUPZJCiY0elKTkSjXQ8qbG9qb4/t1S5IgbLiX7CT9QD9wE7KB8xqBrap
         ueTg==
X-Gm-Message-State: ALQs6tCegK43EeRRxneerZhxx1PmTyEoDpC9jBTnm7Q9EafDrXlqXnr7
        8Msw2moo4gxrxaFaUVoS/2ML8mGiY27bwMo/Ai0bBMAX
X-Google-Smtp-Source: AB8JxZpffb/u3mD3pu/kbVehGhySyk4duaRtQ2rg45SZyfVsEnBTJceFIQTKoec4/LugcLePPqID0JWDes5Jtz8V4fI=
X-Received: by 2002:a6b:250d:: with SMTP id l13-v6mr433232iol.47.1524760973009;
 Thu, 26 Apr 2018 09:42:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.181.1 with HTTP; Thu, 26 Apr 2018 09:42:52 -0700 (PDT)
In-Reply-To: <CACRpkda+K3-=sPpJO90rjW0=+bsQ1uYT6E9Hp+G+-OEyTpc=fg@mail.gmail.com>
References: <20180410203028.11412-1-brgl@bgdev.pl> <CACRpkda+K3-=sPpJO90rjW0=+bsQ1uYT6E9Hp+G+-OEyTpc=fg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 26 Apr 2018 18:42:52 +0200
Message-ID: <CAMRc=Me2YD49VkwENwFmRUHGDYzPc_80b6uABUvi7_QeeoMrrQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: add hogs support for machine code
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-26 14:07 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Apr 10, 2018 at 10:30 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>> Board files constitute a significant part of the users of the legacy
>> GPIO framework. In many cases they only export a line and set its
>> desired value. We could use GPIO hogs for that like we do for DT and
>> ACPI but there's no support for that in machine code.
>>
>> This patch proposes to extend the machine.h API with support for
>> registering hog tables in board files.
>>
>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> ---
>> v1 -> v2:
>> - kbuild bot complains about enum gpiod_flags having incomplete type
>>   although it builds fine for me locally: change the type of dflags
>>   to int
>
> I like the idea and thinking behind this patch, so patch applied.
>
> It's a bit of code to carry, so if it doesn't see any use, I will simply
> revert it :)
>
> But I bet you intend to follow up with some machine patches
> and then it is immediately worth it.

Yes, I'll be submitting patches removing the legacy gpio calls for
boards in mach-davinci.

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
