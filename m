Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84D7C7EE25
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jun 2023 07:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238677AbjFIH1c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jun 2023 03:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238658AbjFIH1a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jun 2023 03:27:30 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3657A2D7F
        for <linux-doc@vger.kernel.org>; Fri,  9 Jun 2023 00:27:27 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5689335d2b6so12603377b3.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Jun 2023 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686295646; x=1688887646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79c5wwIkf5JFBuHBe/pz5shE4weHE+6yaH3P5LzlEZA=;
        b=CDzIQHQESQF3OKQcN2e/Uk5EHv1GuvRpWWO6qmJ28hV2ZWI0oltmfJfsEuVni7JKUj
         MCdkaTR+qjFMBLDpsbPTxFzbj0w+A1JE/fAuGkUh0K6HjZzUrICNeUSAWaD+wOoNSS+P
         3FxmA4eW0FCjImvwEvo8l3yBa021DL2+11cFd53jLhmiY8Se/cULYNYoenWkI+RBXecI
         xmjN5QtEggW/NGkgrUp5NplJ3uOONvUVP14do+mliUULmzE6iUR9pHU+yyrl+xAlcBdM
         qBrseG0CmciAuLddOaigdFvLesrrEPSFx+PExltJsxIEHZq1Y9lgwGCE3hPUCH9MzndW
         3jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295646; x=1688887646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79c5wwIkf5JFBuHBe/pz5shE4weHE+6yaH3P5LzlEZA=;
        b=HIC0Ty/4EWHeQHZEqacabdm6+ClbE9UNf6ZrUVa7lvHxYYGffqSD3egsrZ+HhsyOTB
         DEsgQ2yJogYyxbY1kpbo0HIaKRrq1lnrrZL8ZQREDrkcDfcoPgRNmbwDhtKWUMGfp9mN
         HCW26RB7flGVFX20PYTa5lY2qPFY+9NOe1eGtlrW1b7GaEVCgC6q7/okANnfeWK3kv8O
         KlD5guN/uzBr4dntW/19ZUzos1kb7kNJieKa0rilG8IY5W2mab8/4zOFXUg3Fl1TSZXj
         /nWMEWDdhHgXz85or34nksSrMp9IUU6Haeoi3SJfCvUxc3pYVpiAx2COSVW/+fs+NZqk
         QRGw==
X-Gm-Message-State: AC+VfDx97NLXRLLNc9ZQzVq5EI+xtE/qlFpV24WZLbo8C8ZzHvAFZj5L
        f4y3yMeMk9aSAdI8CRDnKNwu2IJViwIUdBMcxdZlTw==
X-Google-Smtp-Source: ACHHUZ6V8n51QunpOT9L+GvuKgO/ttKnk5Hb+I0waoIxJieTUrGVZBGkGdL4GRVfFKMIqAUIu0H1FEJhwjKDXkDyqJY=
X-Received: by 2002:a25:a025:0:b0:b9e:4d05:1f96 with SMTP id
 x34-20020a25a025000000b00b9e4d051f96mr385739ybh.44.1686295646461; Fri, 09 Jun
 2023 00:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230605125411.60378-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230605125411.60378-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:27:15 +0200
Message-ID: <CACRpkdYnFHBUt4rwLFqA7LYJRJxJ7e9hEGf_B8oi3rc_+Hc3AA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Remove unused gpio_cansleep()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 5, 2023 at 2:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is not a single user in the entire kernel of this deprecated API,
> kill it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for working on this!

Yours,
Linus Walleij
