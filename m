Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CBC057D912
	for <lwn-linux-doc@archive.lwn.net>; Sun, 28 Jul 2019 23:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfG1XGF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 28 Jul 2019 19:06:05 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36279 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfG1XGF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Jul 2019 19:06:05 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so40740601lfc.3
        for <linux-doc@vger.kernel.org>; Sun, 28 Jul 2019 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lwz4q2+szKTu4Ft4q7DE+NRgcxDusAz+Lo48bkTTfVs=;
        b=nqe53c1oBRmoMa5ivnh0qXiEubDFJreYPg8EhzLADL+Qil8rlxjmbc4rnNbdAuW5xI
         wxQ+La1VKcLxJdH9oQ55nVWWEk4ozIYfHyDhEQJkQS32fX7mJFZj4iFEyaqZVbD2Gjax
         5NPfJst7iuaAlYxYiu/ioTzM/CV6Hvai1b3FP2OUnCexJyuWLz/ddEoE5srcPRLcaHST
         YBU3Z/YNMr6IVtJkqciglGOEdWZ8movdNpkrys/AvR5PgamTvbji5Li8Oh7iFJ1jk9uh
         ERwjpP6Rh/TvMpg5jQRZbNSG+IokHU47CAcml4CsmXcfTE5L1HGln+jcyL+gytiZueFq
         tt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lwz4q2+szKTu4Ft4q7DE+NRgcxDusAz+Lo48bkTTfVs=;
        b=FSJuDfpAJ5aUYsJyJb0cGYNN9gAbeEohGuV7m4yzMfqGC6BXnLyMmWxggTzeZqIz0y
         EJa9FhqnIEnAVqoBHgNpIYlO3R0fRBHp4I/M48PhniYBAfFq0q1+PEzuCHIHgjynwEEc
         sxLfWmZZY8lZRRzuRBcNbs2efPyhvxNm+ZX3tZtUbGVMCb10/hKqHU4QUZHzz/9qwK6z
         hgRRHZoq4Cl8tiRtxn60RAMCidIdhotczsh6H15eoLAHFhb+1SQIpGSG5dsD9jeVYYON
         oSLHWQTypmMl9k4c62hInC+5U2cO3l6ov06L5y+y6yGMvhk7FXXsId3zcGf5+JM859xl
         ywQg==
X-Gm-Message-State: APjAAAWO8KYs8GvRrn6/b5FbRfC6otgeQZaD88BWNDR05qK9w/8xFTgT
        jgtFVCifj38Qn1z/NnLJjdk5Kq0SEW7Wi8LZoSLblw==
X-Google-Smtp-Source: APXvYqxO1ZShAsIw0HaFz8MRuajoyCEfOeK9aViZSPPZIHqcFUGTcVHBzvKwcuq0oXYGpEIw8+BgiZr/2ww+IkqsjVs=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr48403745lfh.92.1564355163192;
 Sun, 28 Jul 2019 16:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190708211123.16495-1-jcline@redhat.com>
In-Reply-To: <20190708211123.16495-1-jcline@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 01:05:51 +0200
Message-ID: <CACRpkdYaHd8ZhkRSRMWXSrasaMuCk=LDU40y0NkQXpeWDHAEZA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: fix function links in the HTML docs
To:     Jeremy Cline <jcline@redhat.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 8, 2019 at 11:11 PM Jeremy Cline <jcline@redhat.com> wrote:

> The shorthand [_data] and [devm_] cause the HTML documentation to not
> link to the function documentation properly. This expands the references
> to the complete function names with the exception of
> devm_gpiochip_remove() which was dropped by commit 48207d7595d2 ("gpio:
> drop devm_gpiochip_remove()").
>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>

This does not apply to v5.3-rc1 can you rebase and resend?

Thanks!
Linus Walleij
