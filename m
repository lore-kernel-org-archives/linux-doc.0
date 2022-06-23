Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8B9C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 14:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbiFWOgx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 10:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbiFWOgw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 10:36:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A2B35DE8
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 07:36:51 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g26so20112068ejb.5
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qp/cRCbGIgaCK9Ty5kMpVAtTHuKK7E2w/DMIg7EAxo8=;
        b=FO8cBP0K4xsPceTBKKHnUGgnYHY1Skq6ChggmGpBCgZGpla/bByE6oUaAlWXyWU0vF
         PLhf3kmatH5of8GlqKiHPsRCyA5+r7g41edN+j8JCyhoVtTvCLU8KnaJSihfW9NPUtiE
         nmoc/SF+baFHe+LoOgYH0o6VZ1Lz3ZwDdgerB0kAiYWTGdZARohhrhB5wpCbDTC/OnW5
         Db+cMHuhKmYI8yDaUhdbaOSBdGyYNHD7+pbSEks0YpCyXh7IS1Yczau7NBKgqZU6lJvu
         tF2SxqKZmSGq3uSzUjsN364b9VQui0bWtNcoey7TDDTr8EcUiQThWwTnhH/4221dF58O
         TVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qp/cRCbGIgaCK9Ty5kMpVAtTHuKK7E2w/DMIg7EAxo8=;
        b=ERDdSt9v14lt4g+25opRI4W129mkvaLmggu+LLSl9xOq3rr6mY9ZCbTNC7CEmrhiBK
         Lf53aX7zUJpnUQfah4PnMTLQPHLKVKvkXjlwjZXvdNLa6qg7Ji1NLMnrLUPcln/pcM08
         6VsOmXtHWLqyoUt0lttEuQPKQup5/+Zdy5xybYg4Fmfg0+DcJ3K00C6Zw+Etwwm2a8fi
         C9j30/EH8ELZae9pWYJmmQ8CFpkrBzv0DF0LQK7JJ5FDfoTc5WvpluyhDkyLH9eHcGun
         S8T15v70zPQtunmPxUXU00MAy0J5JBwvJxKZgtbg5hOwMSHHH+OWXVbIaJpTGJlHkLVQ
         MJow==
X-Gm-Message-State: AJIora9t/l2vHfvnq4C4/mLdtjGAI7nSSBEVSqZPak4bHDh9aygt9NP4
        rj61rMRYZ5pnrHd7M3r0o7zMqjfrHTb05eS78cGZvQ==
X-Google-Smtp-Source: AGRyM1s564s3fiLiyBxM2nC5JNnQByLI+ku9H6xw8kOmrjGeURS4OVf9zehn05tp04En+oZZWCKo/XjwQ4Fy2TyI2f8=
X-Received: by 2002:a17:907:60cc:b0:722:e564:eb11 with SMTP id
 hv12-20020a17090760cc00b00722e564eb11mr8899574ejc.736.1655995009719; Thu, 23
 Jun 2022 07:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172842.86713-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220622172842.86713-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 16:36:39 +0200
Message-ID: <CAMRc=Mfqo19we+0ShbpCtbbsXgU6trKbwQR2Zg7LcAWSJ_834A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: devres: Get rid of unused devm_gpio_free()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 7:28 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The last user, which in fact was a dead code, has gone a year ago,
> previous one 3 years ago. On top of that we want to drop away the
> legacy GPIO APIs in the kernel, so take a chance to get rid of
> unused devm_gpio_free() and accompanying stuff.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Always a pleasure to remove code. :) Applied, thanks!

Bart
