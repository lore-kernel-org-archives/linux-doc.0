Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9A3197D082
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 10:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbeJARBh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Oct 2018 13:01:37 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42783 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728826AbeJARBh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Oct 2018 13:01:37 -0400
Received: by mail-io1-f65.google.com with SMTP id n18-v6so8919397ioa.9
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=THM6kc82mMstt4+zJoSfqZigSugW3/mfNxEP+tVrN74=;
        b=KdxsoKZqk8t+2eIMUQP9++XuiiWF6j5GYR/NaLmlWgDxUl5uOVHI7q+JGfSJirX9tN
         FqMNrp1SL6XLvHN0mBjQXJPrddiFZUV+rSYqYQUEQToatQzTYtae0jluNEN/Dpc35n2N
         pL0x6a3xwD/BtoEw/lY+t765VcnlZZu2M8bRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=THM6kc82mMstt4+zJoSfqZigSugW3/mfNxEP+tVrN74=;
        b=Dx/k/pOT+PvZPiTBtP0r7PPYp9s4yQKHFeD2YWn/1wjVbfv6yE+xIKgkk5zSgwlB8h
         lAxNQNprnCUnOSBNTLSjhTMzTiCKFWQh5loH4B5I2CXac2udecb2xlrfhUdzFBvNdS68
         rj59VaaFp23NbxgFkE/9Z8VV2X0kX4xgoJY4r0ZOgBhQP7wztRJdenFAvzvRsDxWgZ1D
         FHEjeYOJM7fAXP+38WeAfoUkOupApJZ/9T9tc7WuX0H7Danginb1aM8T126hKi4faF+k
         saSxkR7My4NIM+fyPXP/RWvyq5WZhVC9VVumU45SP9CBsvVwE6N0DWWPI/wDZVxABYUI
         4U0A==
X-Gm-Message-State: ABuFfogKMVfq12M7lZ2nsNHLeZkhwbYtEhcZM5Du9VZjQ3SWGtVXScnZ
        1Dunn9Xz0QD6TxVzU5jneJxhY6nZ0FauuqP/VvNpcrwY
X-Google-Smtp-Source: ACcGV61L2gQrvU1Niq7Y35IOGz4oyPzHhoNiQZa1c1ji58cobp2MSbOPeWcudsA1SWkFF7f6qWFWdz1nDUX7Rk9pkeY=
X-Received: by 2002:a6b:c3c4:: with SMTP id t187-v6mr6326932iof.304.1538389471412;
 Mon, 01 Oct 2018 03:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180927113810.30721-1-geert+renesas@glider.be>
In-Reply-To: <20180927113810.30721-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 1 Oct 2018 12:24:18 +0200
Message-ID: <CACRpkdYgX6aMACDdE6yMkur9txQq1hKCMfaLj_+FTg4vg-+Mzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: Fix VLA removal fallout
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Laura Abbott <labbott@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 27, 2018 at 1:38 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series fixes various (mostly harmless) issues introduced by
> commit 3027743f83f867d8 ("gpio: Remove VLA from gpiolib").
>
> As per the "one patch should fix one issue"-policy, this series contains 3
> patches, although they all have the same Fixes: tag.
>
> Changes compared to v1:
>   - Rebase on top of gpio array rework.

Patches applied, thanks Geert!

> W.r.t. propagating errors: while gpiod_set_array_value_complex() and its
> callers can now return an error code, this is currently limited to -ENOMEM.
> Actual failures setting a GPIO output value cannot be propagated, as
> gpio_chip.set() still returns void.  Do you want to change that?
> E.g. gen_74x164_set_value() can fail.

I think we discussed it at one point and said that it's something
we should fix some day, just nobody has got around to do it.

Yours,
Linus Walleij
