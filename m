Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301F7C433E9
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 15:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F272165274
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 15:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbhCIPcX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 10:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbhCIPbw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 10:31:52 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349E8C061761
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 07:31:52 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x4so21024028lfu.7
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 07:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ytPSd3A3o1b3+2MlI23BkWVwBk2Qohz+v6T0uxCz9RU=;
        b=ZsDiIRRw+LQemQRHuo0zPr0x7lYYY1RnmWzkwLTDWTgoiy/WPSeXg/JaqaTrpgMG3q
         ikEXZC1G7CHl5BS1bfjXkICij2hiQ6WpSSM+Metl62wF5PagNLwgLpOJJ0GyWXw+7Mq0
         yZGh8DBCJF4pOgqHWr5Fwp+ga3e5eloGHFvzTJjeok0tMOwbfseR1tixEGwIuy/E2mEO
         REWCX0BsJOOBHq5W1AlXu+5NKi0y/LPYDmdZ4KJZ4sYnjc9oO3tmpALL7C4AQpar3ng8
         5dVI2dneZPzIGcGroTAYeGXc8nPkUdXN4CCe30O7y30/+9hokigEsxJTr7Vkhw7VftM8
         RYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ytPSd3A3o1b3+2MlI23BkWVwBk2Qohz+v6T0uxCz9RU=;
        b=XZkL1WKgRobG47jSxO9ZROUJLJJA8Ya9A3ML8EEDFcxxhy0u3CYih/3Vo0Enay9gOl
         WUl+3XQB9dZv96jgILfLcqeAqDZANgNF6MQtHTAgaNIXvUonEc2ZQb9PsZZWDpuEEESS
         zLSYLlM7GWNgIng5Md3+olqYitrPQegeDzt59iFDVOgW+IO4HhXmxzqprOBwtB/YL1BW
         Izzx9TQqO06F5FZS9eggpAHfzVeXw1W3vhozgw7ozcgdP3JjGw5JlOtW762IoD7GXg+6
         gw5NGQwq6hoO7LbLUBPSqQnHNNVLyUgcjUYqu4iuGBPoloXq97BqzIguvms8kDjSmy49
         ChzA==
X-Gm-Message-State: AOAM532/ZWb4Adndd7kdRfTduLiKpP6N/NWCRqzE/pEgm1tVUM47E0Ti
        fJsbva1+WXvJXQXB0+o7DKS4jfBXgSVabwRBrmKh7p/DbOUCH7LB
X-Google-Smtp-Source: ABdhPJw06MbLp34uxhYaAr5Kj9oirKrQg5zi5+BhFUpssWilBUXjFuULwcGEpI0qogMy5JAEwzC+K56ofZWkxv+pUqE=
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr17314789lfg.649.1615303910617;
 Tue, 09 Mar 2021 07:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20210309093736.67925-1-andriy.shevchenko@linux.intel.com> <20210309093736.67925-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210309093736.67925-7-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 16:31:39 +0100
Message-ID: <CACRpkdZaFv7c-mdxF+0T7ceU7ucjtE9-70nBune1iNj54moHXw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] gpiolib: Fold conditionals into a simple ternary operator
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 9, 2021 at 10:37 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It's quite spread code to initialize IRQ domain options.
> Let's fold it into a simple oneliner.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Definitely due to my coding style. (Not so fond of the ternary operator.)
Allright, it is so much more compact.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
