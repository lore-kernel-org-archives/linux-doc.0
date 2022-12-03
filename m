Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76724C47088
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 09:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiLCJfP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 04:35:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiLCJfN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 04:35:13 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C8318B0E
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 01:35:12 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id y135so4222639yby.12
        for <linux-doc@vger.kernel.org>; Sat, 03 Dec 2022 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtrfFxLIH+KLlkwI+VYMEBrcCrDD9/VNajjGq7Nb1f4=;
        b=NVmWpl3QjoGFtPR4rDJHOoTnQYlO5GHybiR2vphJYM1XpTVLpHIkfNd2wQZ6LtTDp3
         vCvrQCjnj9qWcOUXMSnMba6qcboV+zVLK3NJR5d9ual0qeT9hFnC0cr/ZoenLJCQDycB
         p348AQq44S7N6fLPCPX3KjLf+xwnx20E6CFXhM6+kKwLAHnpoGlM8n45DKJFElO2gAWI
         kRGptrIyJYXUwPpGrUcr/QgSQBJ7v9ZdwH6O2xsjvLmdOt80D+J3VEfQfhwfnlP45/uu
         xCyle3Pbhdwg/TgcmeZ2gOY+XDtq3eouP6TBaOXcquCaXuVGam+xqsEMSmtcuhfzJCEq
         n+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtrfFxLIH+KLlkwI+VYMEBrcCrDD9/VNajjGq7Nb1f4=;
        b=R62ZqSWUgkkfbBznpqb6aZ3gM1WdmAQZg9i7GjVPnnm8JGSagOKtQ05RvISGQzd2Qk
         x9EQqQb3mwbN0S+4JaH++s2/1+Kw5KdTYoM+Tm1v1esjpwAHCs1xOUGaA4ubmqN8VzBl
         UX5dqQaKcvEhag988qrhXY+GSMUsWJRmWv8499VinohFfwkwMWJDKDbeZb22+13EXZAA
         ysEJezuR5e244RmUXnw3mzyK62xgH4gVWsq9u3yP77djDZOFJiRSmhG6W/B2kiBvpgGb
         PIxn9LEcAA1mi7H3TEZQyoMWDY4TRsYelzJiL2TvOxv6o7TLWydcML9hXqlGrRPuIKrt
         08cw==
X-Gm-Message-State: ANoB5pk4kz0/lb29nG5I+SEluFpjfUdUrsR0bYidhTkd4hhWFuSvOliT
        aVD5qutknO7uHjPjZGyXhSfpMEaBwPalHvugi6tdTQ==
X-Google-Smtp-Source: AA0mqf5lBr0i9TGCKJKQdl+c9tGgeapNQTrWM8pNJ2m+aX5ucbgHP6s/tq92nHKFL7pOBCILVQLukaUFbCxSZ2MnAf0=
X-Received: by 2002:a25:c7cb:0:b0:6fc:834c:9c89 with SMTP id
 w194-20020a25c7cb000000b006fc834c9c89mr8728927ybe.43.1670060111875; Sat, 03
 Dec 2022 01:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com> <20221130155519.20362-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221130155519.20362-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 10:35:00 +0100
Message-ID: <CACRpkdbhavSEFUiqEDO1cJXzmiQ8iHE25ciEt=c8NY-SQLAhow@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] Documentation: gpio: Replace leading TABs by
 spaces in the code blocks
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 30, 2022 at 4:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The code blocks are indented with two spaces, if the leading TAB
> is occurred the syntax highlighting might be broken in some editors.
> To prevent that unify all code blocks by using spaces instead of
> leading TAB(s).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
