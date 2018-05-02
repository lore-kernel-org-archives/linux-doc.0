Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D61957DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 11:51:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751174AbeEBLvL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 07:51:11 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:33130 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751020AbeEBLvK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 07:51:10 -0400
Received: by mail-it0-f66.google.com with SMTP id t7-v6so8090095itf.0
        for <linux-doc@vger.kernel.org>; Wed, 02 May 2018 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=WOCbKwrD4HPuSZgtFI09s5YbzOmu/+mqU5O5PPnQbrA=;
        b=H2XzHer7YDEUk8hLhPny8X6JUDrt8BLWkCwq87S7Q69WFRZzW3VE7KCZgL6e2NMihe
         SPt7unpE3LppOc4ZbyfUwh07CBv0uY8gkUkbdL18FaPvVQ7ME2OAI8KDTyZDdworUs59
         tDtZr7HeJ6KDiUpgK1wO0ljgV454dSGCKMaQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=WOCbKwrD4HPuSZgtFI09s5YbzOmu/+mqU5O5PPnQbrA=;
        b=d3p0kjlaBBJp0qvvy2575QiS8XXOfiGJ7EXG1Nk4wdvhysK7kWK+/CiQ2b7CoNJs6p
         39VJCOHoE6Kd37U6lAjTc/FPyBPwF7U3U3vsZeVfg1I4UQCMU6p5WSDnJGZMKnqwkFXO
         WBam2spzt75e32p8uwlc95bXHZ0aPofZUv+Hz+7A3Bya04ZqHaEj+jl/VA+IJpOsT6bD
         BEqyo22bZkEBPDN3UhJRD397khYk7LaSZ1nneWgxiHbF9eSc+XEJS+qZkzp0IUIC/RME
         bmDeR+XSkke6fPuw6DWvhTW2zS0ecjkT+gkNS0D+J72vowEVv1f1wUMIFfu2CQtRnL3h
         beFw==
X-Gm-Message-State: ALQs6tBm95c4dIzs+BdFja37SSPvGdNVFMZIF+2CnInw/rRFQaN7gT59
        jrGLDQMGXxxO89RTS4S2lHukhkDibuExpHf3kJZHkg==
X-Google-Smtp-Source: AB8JxZp5E/hf1VGT2sWyszYu+hnDZWr8UXLZJdHK8G2tIEBi3Iw1omEZdLP3EQD1CY3BzogUt4XfQMSLQVj/E0YM8Rw=
X-Received: by 2002:a24:c146:: with SMTP id e67-v6mr19243645itg.70.1525261870276;
 Wed, 02 May 2018 04:51:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:2793:0:0:0:0:0 with HTTP; Wed, 2 May 2018 04:51:09 -0700 (PDT)
In-Reply-To: <CAMRc=Me2YD49VkwENwFmRUHGDYzPc_80b6uABUvi7_QeeoMrrQ@mail.gmail.com>
References: <20180410203028.11412-1-brgl@bgdev.pl> <CACRpkda+K3-=sPpJO90rjW0=+bsQ1uYT6E9Hp+G+-OEyTpc=fg@mail.gmail.com>
 <CAMRc=Me2YD49VkwENwFmRUHGDYzPc_80b6uABUvi7_QeeoMrrQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 2 May 2018 13:51:09 +0200
Message-ID: <CACRpkdbbCKkzCq1S86OTwjrZ4SQFFPAg92qgbzt2U2QaqEwZaw@mail.gmail.com>
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

On Thu, Apr 26, 2018 at 6:42 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 2018-04-26 14:07 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Tue, Apr 10, 2018 at 10:30 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>>> Board files constitute a significant part of the users of the legacy
>>> GPIO framework. In many cases they only export a line and set its
>>> desired value. We could use GPIO hogs for that like we do for DT and
>>> ACPI but there's no support for that in machine code.
>>>
>>> This patch proposes to extend the machine.h API with support for
>>> registering hog tables in board files.
>>>
>>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>>> ---
>>> v1 -> v2:
>>> - kbuild bot complains about enum gpiod_flags having incomplete type
>>>   although it builds fine for me locally: change the type of dflags
>>>   to int
>>
>> I like the idea and thinking behind this patch, so patch applied.
>>
>> It's a bit of code to carry, so if it doesn't see any use, I will simply
>> revert it :)
>>
>> But I bet you intend to follow up with some machine patches
>> and then it is immediately worth it.
>
> Yes, I'll be submitting patches removing the legacy gpio calls for
> boards in mach-davinci.

Awesome, thanks!

(I guess they should all be converted to device tree though, hope that
will happen...)

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
