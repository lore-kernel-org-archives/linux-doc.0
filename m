Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F78AC47082
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 16:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F6A6613F7
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 16:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFEQ1s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Jun 2021 12:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEQ1s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Jun 2021 12:27:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AECC061766
        for <linux-doc@vger.kernel.org>; Sat,  5 Jun 2021 09:25:50 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m21so3035519lfg.13
        for <linux-doc@vger.kernel.org>; Sat, 05 Jun 2021 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrCDT9/BrFc5JTZQvS/vmJq/oRXt2DZtyVSWmdgwMSk=;
        b=NO+aHNUK9eeNAXYlgZh+KdSaJPd0/ddCUtczvY28depLkTGy6F3fT05tmVi3sw7ycH
         mmYh2Bm0ignR2mXzhBksbvf7IWCw2xPhxUDKmkjXKTn82/F7eM53hqh2AMHwnd5Gy46E
         gEB06bXm8YCNWp79uD48Qml1bYDafyzKoRGlWfvddfZF7QO7hyFf3ysWGfRSF3knwOa7
         udtK0E82puJ3rfpuNk/cdlQT3m1z17G6YOeGaI5TVniO182hHOKEhOlhfNgbjt6eLtvr
         SYO+A+5/hgcIh0sb4YSr1VHJKVPm3Y9FD+pV3Tld07I+yHuKa9ma52CuKb4FviJkbn7X
         QzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrCDT9/BrFc5JTZQvS/vmJq/oRXt2DZtyVSWmdgwMSk=;
        b=d1AIxtvf/ePrm0Wdh/aokTsBinC+SJDokZ0X6gW58m+j5iP+NFhVBy0Em5PIGn0glF
         PFJMEDqU7++2S+xrDxvfZFCYdRDZKKHzfO7wjQHnV3WeBGs7JO5FEj3HDi2SXAazMn15
         FEsKj6ZtHMUkYvQiZUI5AHtWuso5XMW1WUDpTOF5lq57H0kZK09/J/eNc5ak3gVt59Fc
         rEJVlwruZCtFLhdOOHCXk2TdhtaWKPYzU0RyhyZqatUjqJUp99p2k6eW0vDOYs+rTEdS
         wEIBb4wCYJ7Hbvh5PsT+3rJU8oYF6eST5x31gE1v1Rnp1+E71fVJlS8JC++CjxS+Bwku
         Nf7g==
X-Gm-Message-State: AOAM531EHRWMg1ZcjRB8Qe4HHvwRGDWctR1pVBTn5HX7CK5i1MEqqC0P
        El6Uv2frLUF8zB5+R1XSHYsgDfJxeYFXebMK+GvZeg==
X-Google-Smtp-Source: ABdhPJwWXh8YFjT5OUKlc/yT0+RpQOtLPrqc9AOXSBB/yaIWf+9GL/lva+Gj/FpKd1g/afqGfRV8xMUi4XrTt8covsg=
X-Received: by 2002:a19:c753:: with SMTP id x80mr6370090lff.586.1622910349250;
 Sat, 05 Jun 2021 09:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622898327.git.mchehab+huawei@kernel.org> <ed02be4feb78dc86dbd17ddfa2e896d8dda7fa8d.1622898327.git.mchehab+huawei@kernel.org>
In-Reply-To: <ed02be4feb78dc86dbd17ddfa2e896d8dda7fa8d.1622898327.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 18:25:38 +0200
Message-ID: <CACRpkdYYioDfJFEGREhjxmT7YU5_3nrJR8wP3BAC4b=ihqVY5Q@mail.gmail.com>
Subject: Re: [PATCH 18/34] docs: driver-api: gpio: using-gpio.rst: avoid using
 ReSt :doc:`foo` markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 5, 2021 at 3:18 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> The :doc:`foo` tag is auto-generated via automarkup.py.
> So, use the filename at the sources, instead of :doc:`foo`.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
