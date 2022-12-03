Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5FDC4332F
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 09:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiLCJjD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 04:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiLCJjC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 04:39:02 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D11A5E3D0
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 01:38:57 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3b5d9050e48so71976227b3.2
        for <linux-doc@vger.kernel.org>; Sat, 03 Dec 2022 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r1oGywp14JWZ15FPL7OnZRGPM4ko/b7n8s59nLxtj8U=;
        b=s9QB5ECunL2ghBjfUzx+lJx+SxjrYch/xmnA+GUEUXdT8mq8nvvxfX3V1ncfLSXyHe
         EQOqbDQ88d8lyvV1TSdn7VjZkbgpDWeN9lOYQjn19674NnrhsA9QU1m9+6hWIHpNqIjs
         /qSJL5/81qi9XrhCqCFN7kc7oNTk+G/hxvRyKrjnr3XN7MslAb42mzzDBMWkYrAeu4ZE
         4MqoxvWsuWKzhMqfsOmyEzzEvGYzVR9Tq6HuAtgOtYOg0wI8AKtPJTSmhLvlSRiJE+CB
         p0kIIf8tMgwDo8sdm0KWuiz/RB3GEkpWpnz1jFYWbMsfMToAY0S7h/PD1aRE5ZxfhEdq
         6CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1oGywp14JWZ15FPL7OnZRGPM4ko/b7n8s59nLxtj8U=;
        b=Wc/J4AHlNO1Ox4/yaOf+0rmAYWfWHlK1wstDS3dq47db/ImW6n3L1x4a4QTg9uyRiP
         4L45QJrS8J0fFD4tiWg83bTLEf4KNl71xX2cfUwHxGid81IEwHLVoBMsYk5EuYo/Yj/5
         CXJXxFRyS/W3xHQBfAet9dPgh36pCVjawUF3Nggfbst++qJEulowG1VKhY+3kEsSvRpB
         jUmoDfnWkUsef32v6z8SkrSREqfuFJyp6KxnDjADyTRdcx/cG95QGZyM9GsO3UEOlP17
         7sq7KHBdCYeHrGbtHKkyirSPnYx1j1oySyM/BQVbN4Gl2bi2SOEo8J1U54+MhjkwmZDt
         vSWA==
X-Gm-Message-State: ANoB5pmA7UkiDeFWUhaUEUg91vXBDkdeSlAAoxWUmOupVivb07xpjNHB
        2Mv4zAfYphQIp/I/sZ6lxysUjx97j8Lh+t5h1qJqQBy4sCRmcA==
X-Google-Smtp-Source: AA0mqf6rtGoiX62tAlxDjk/WCyDBCu/w/wp+MD9OtLZHeHdONq/EZ7raekDVvTX5ZPXLENYFYKZblujPRMvOkyzLEmk=
X-Received: by 2002:a81:7909:0:b0:36f:d2d9:cdc4 with SMTP id
 u9-20020a817909000000b0036fd2d9cdc4mr54837574ywc.380.1670060336538; Sat, 03
 Dec 2022 01:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com> <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 10:38:45 +0100
Message-ID: <CACRpkdaQWZE6=BNEh5hSH9=jBK=TcLoD1uUb=JyNYmHFvaSAfg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
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

> +The below table gathered the most used cases.
> +
> +==========  ==========  ===============  =======================
> +  Input       Output         State        What value to return?
> +==========  ==========  ===============  =======================
> + Disabled    Disabled    Hi-Z             input buffer
> + Disabled    OS/OD/etc   Single ended     [cached] output buffer
> +    x        Push-Pull   Out              [cached] output buffer
> + Enabled     Disabled    In               input buffer
> + Enabled     OS/OD/etc   Bidirectional    input buffer
> +==========  ==========  ===============  =======================

This looks about right to me, but we need more input, Kent?

Yours,
Linus Walleij
