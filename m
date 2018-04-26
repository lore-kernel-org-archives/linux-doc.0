Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E02507DD32
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Apr 2018 12:13:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755074AbeDZMNm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 08:13:42 -0400
Received: from mail-it0-f51.google.com ([209.85.214.51]:50802 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754277AbeDZMNl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 08:13:41 -0400
Received: by mail-it0-f51.google.com with SMTP id p3-v6so23584049itc.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Apr 2018 05:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=LEWY//XWBM8XklR1/nYiDMK3q6ggM8+or/1JLxedQy4=;
        b=OyKXUE1BsQ/iEZG6BMK6ZhmqJ1uA+KO+r7C4Xmnk2+RT2YbNdastegfaBcF0jJRjyj
         RG4WmvxZ2oDPmgt5OatEMATijEcxk/+Jd/W59aVv7dRsS2sFlPGgDPYyLzOvX3a+YwDJ
         kUJxN2B41Tpqr5npQcTlNTn6Ml4uM5HWZVz58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=LEWY//XWBM8XklR1/nYiDMK3q6ggM8+or/1JLxedQy4=;
        b=peb/bz4/8ZaDEsyBxtWMp8EgK7IX0u0BBtHBFipXY/Xyb8XuU3gy151WVLS6FK6+tv
         hJljwyktROvSX1jphP/rmQS47N2tDAM14OdfIgblu4uSDHcWqH8aShRUQi46KQE185XP
         sF1AZz2+DfC9eI6aXtPoG71jXRZG9ubAE2TAI2fmbwrndLMMYCOCY0MvhB0qz9hJ0sVL
         v7c0ghya0WiaGLqN+oFeEmeahgJ/biLXOyz2bl5ayReEEJRdwVpDLQEMA319Zi7G1rSe
         PDkzmpsRZovErYaelveDOx7UMUGFBDy9Gd1DdJ/WozqfDZfIMLFIrX0xRnc/QmWVMMSN
         QtRQ==
X-Gm-Message-State: ALQs6tC/4Nh9aOngmalpxWLBmLz01sOVaXVG9FDwPk40cQWm/jF70ARO
        xWnt3lshEL1vIEjLJ9MrZSp9hrM88M83x3nYAKd8LA==
X-Google-Smtp-Source: AB8JxZqx7UxppalR/4SsWloxZ6ooH58QfnHkVntsuMFVp/BtMX7rCIPOtv6GZ2f6ZlAW0Ai2zju/4lyFgOd58YbDaDg=
X-Received: by 2002:a24:ad1e:: with SMTP id c30-v6mr5194578itf.38.1524744821274;
 Thu, 26 Apr 2018 05:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:2793:0:0:0:0:0 with HTTP; Thu, 26 Apr 2018 05:13:40
 -0700 (PDT)
In-Reply-To: <17720832.6ELUnVt0BR@debian64>
References: <20180410203028.11412-1-brgl@bgdev.pl> <17720832.6ELUnVt0BR@debian64>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Apr 2018 14:13:40 +0200
Message-ID: <CACRpkdbFGXGqjtcyXLmgL=kYFkfR9_s9McrNU1-=bTO7-Wgs0w@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: add hogs support for machine code
To:     Christian Lamparter <chunkeey@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 12, 2018 at 10:00 PM, Christian Lamparter
<chunkeey@gmail.com> wrote:

> The problem is that unlike native gpio-controllers, pinctrls need
> to have a "pin/gpio range" defined before any gpio-hogs can be added.

Indeed. But the primary use case (correct me if I am wrong Bartosz)
is to clean up old boardfile code.

Old boardfiles belong to equally old boards. They very often do not
have pin control, just GPIO, and they very often have custom code
that just issue gpio_get(), gpio_* etc to set up hogs.

So this will be able to replace all such boilerplate with some
hog table for each boardfile and be done with it.

I.e. they have only drivers/gpio/gpio-foo.c and no pin control
driver in 9 cases out of 10. Cases do exist where they use
pin control with board files. Those are rare. But they will have
problems.

Some machine descriptor tables are used on modern archs
and the most prominent is x86 Intel. However the Intel pin control
driver is one of those that (IIRC) will actually survive this (i.e. it
doesn not have this bug). They are not even using DT, they
use ACPI.

> So what will happen is that you'll get an
> "gpiochip_machine_hog: unable to hog GPIO line $LABEL $GPIONR -517" error
> for every single gpio-hog and wonder why :(.

Hm maybe we can simply improbe the error messages so
people realize they have to go and fix their pin control driver(s)?

OK maybe a bit whimsical comment from me here... :/

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
