Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B608C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jan 2021 09:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42CB422DBF
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jan 2021 09:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbhAVJrM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Jan 2021 04:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbhAVJpp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Jan 2021 04:45:45 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C86C061786
        for <linux-doc@vger.kernel.org>; Fri, 22 Jan 2021 01:45:03 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id q8so6644603lfm.10
        for <linux-doc@vger.kernel.org>; Fri, 22 Jan 2021 01:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pDRquJVrfnNoeJ4upSmG0vI7kekYkwTVuEqcSdN8tQ=;
        b=sJeUKGVC5/NEjTGf1NfpOths4SV6P9SSv9PbKaxwQ9RCKQygPR0prnK78CrrbSk5pq
         +ybO6K99AjttqTa5IesXQd1VJC7l6o7O3PC8plQeu0P+UoWE2Xk6r4/kJHsElWynoAhl
         gIWT9R2vMN8kPwpXJA16nWK9SmOPZgmon+yZgElcgU0p7qIeBF1SPcs/noDpcdrinkgG
         1vmbt4s/7REBxEp3wOhKoc8BjAWz/KsjvgJqOMWeITxJdxozt9QQG9S7hFJMFcuiqpUP
         /BZcar8RNZXxzAQyTBOraGgNFhVEFmZb8K1lo6Jz6M7NnnUzmjaOlexlizhJW3ECCorA
         vR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pDRquJVrfnNoeJ4upSmG0vI7kekYkwTVuEqcSdN8tQ=;
        b=uddIB5gYL+VlB5nI31gDp0lkI0R0O+f67x1sT+Q3r6XvV0w/Th64MI6aD67FQAOGUu
         t7XL6NMUdf1cGDuVLqUT2fsrwPZnI82Op7dNXhhyKuCBiFXKxidoG68WeFflOMFln4H6
         yMZVliavsTl2s/CWZPTsfimQx0ka7+Ak+E57H3blp/Gs4rb4M60YXh6SkEpJG8/7IzgJ
         z+i5pFEJ5LgKuVHTJEQDjCqnt8rkgy7WS/vN0sJ+qd4qoEn1EkXjvTjzZeqzN2lUxAT7
         m0xLAS4OKX7Z/pE6YLgW3VHOC3k+6SaWgnLmYsBGVk+Z9Fz0mlp8dodntfKrQb+1lg8k
         7EUw==
X-Gm-Message-State: AOAM531MIt9rMADFIgLhsKmFenCJMMykJnBT2rPWlkziDYUyhV91GImx
        P9SfzAFMkfZWoCKb/fl9eoA4nTjmADG0bThS0U1ejw==
X-Google-Smtp-Source: ABdhPJzlNIoTt5bK7+X26R6ooLH4qz3LfMQ9Ge6ctwR4g5lNJ9GZZ0yxT12FiosySOH1lkTmCGzDAg0zKZAWH6BWMeA=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr63199lfg.649.1611308701615;
 Fri, 22 Jan 2021 01:45:01 -0800 (PST)
MIME-Version: 1.0
References: <20201214155440.2950-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201214155440.2950-1-wsa+renesas@sang-engineering.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 10:44:50 +0100
Message-ID: <CACRpkdY71c=Pyv6Gsw9D5U8aRgQ1kx8QJ0RJmUyb8CLtC2s9Cg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: Fix typo
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 14, 2020 at 4:56 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Does this go via doc or gpio?

We usually apply it to the GPIO tree. Bartosz is handling this
right now.

Yours,
Linus Walleij
