Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C70C46467
	for <linux-doc@archiver.kernel.org>; Mon, 16 Jan 2023 14:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjAPOrn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Jan 2023 09:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjAPOrR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jan 2023 09:47:17 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0855A23302
        for <linux-doc@vger.kernel.org>; Mon, 16 Jan 2023 06:29:46 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id d62so14301587ybh.8
        for <linux-doc@vger.kernel.org>; Mon, 16 Jan 2023 06:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LlT3/9OUvutP7VvfxlbNRKjuyN5KCHWjHMPtY13KD4A=;
        b=E11T6SWFQLjpvpWZl6/zFSmbp42oUMOwB76D9OrBwgxQDzKvjxiXLjM8wWs/SAeo03
         Np7KuQ638sd0tYB+EMBHAwA6Lb03gX/dR2BN46C57YrIt4ttEC4MqZTKFfSAod9RpT/O
         6fdYAVXJ/TEjXYQmAM85Ia9TTXTN9o/ssBm8prfQTr+ntRLu2Ea5Eyqpci4Urqz50Mhc
         p6tXO52etbSZo8aho38HQQJwA9YMdUL2Bz2Lx/6Sy2yB+jSuJRKq89bowouaxoycArYO
         8CG8/oSWR1NWeS2R//rw7fmpvdPmT8Rbi5HN8Myl4OM6furTwSbZAw60e8NoBQaQv8oE
         /8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlT3/9OUvutP7VvfxlbNRKjuyN5KCHWjHMPtY13KD4A=;
        b=XhFwvJ224C8poWF2mRsVZ9DQ2lc5/hDSiScAi3xtosD5NJEsUenFie9F63dcqunUOu
         cDL6Yq0bFrxyfM3HB0z6hCb+Py37hoA8SjPYPi+q6GL81j5Dxosf99ir1ewQfOwW+b1o
         iTyOvStwOyusvRy4IRywVc2fvC4J6hFC6rsCNZyLLmsS/YrDPuQEH9uVFSRPsifzKMVf
         eXE2R3QM4psEN+GIgDuGPvQp4heNzlu1CL4Xl8Du4hqviZtqr1gQLrU6vCZ2jxj1xmjF
         GQA5WxB9Kv03fZVzUPkocPfbvDp5yT9DF2+Kh2thllgNFA1rNSMSolO0+w8c1B2eS0tj
         yS8A==
X-Gm-Message-State: AFqh2krTC3K05qvRdnDsSLbxQ797GZbPaQ/5XRNj35URB/bhWOzZCnGM
        2keww7GKYQP+Wf6uUjjZFo55cF4NahyYC/nC8OExZg==
X-Google-Smtp-Source: AMrXdXtd5fUt49TBzg30p8QXrh2V1ZEz9SaQ+wLWPEoHDzNytLWHJ08uQw/FRD/pUVTwOpfRPAGa6eaS5bOvGE5QKXI=
X-Received: by 2002:a25:d08d:0:b0:7ca:9b40:72a7 with SMTP id
 h135-20020a25d08d000000b007ca9b4072a7mr1866366ybg.130.1673879385297; Mon, 16
 Jan 2023 06:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20230112133942.58471-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112133942.58471-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 15:29:34 +0100
Message-ID: <CACRpkdbZs1qF8sqHv+V4-su6rfQvHEJoEHPJkef4cj172ZYKew@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused and obsoleted irq_to_gpio()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 12, 2023 at 2:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> irq_to_gpio() is legacy and unused API, remove it for good.
>
> This leaves gpio_to_irq() as it's used yet in many places.
> Nevertheless, removal of its counterpart is a good signal
> to whoever even trying to consider using them that do not.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for killing off this API.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
