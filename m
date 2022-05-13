Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2608C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 13 May 2022 20:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245722AbiEMUxY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 May 2022 16:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358847AbiEMUxW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 May 2022 16:53:22 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D1A2C666
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 13:53:21 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2feb8eac315so24624317b3.3
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3BpKCW0mAZxesf8MD9gQhcGX4ZUphV6PxZU1r5+tMQ4=;
        b=aIMWf1OMDIoIe5YoZsrtM/JaUfXehGm5I0Rlj+NfC7dRIpV/fhFhqt90I7aA7z1DU7
         7/hda/0xHror5lqtewr82JP49Lp6JaC6rFVNI0c04hYxER/fkSIfC8PvPemTJMehmxiI
         EzTNmPrDt/xFkwf62psgBsqN/T06UEucWqGtG3g64zUMMJwUpwwTOSWUnrZgVeQheoCI
         EoyBdAXfWgIKZqBx+3IXftTc3Li97z92rd7T+PV5ZNEvdSaHDMBgTgizMcSU/3YrxexX
         WFWnY9kSAVT+pXA7/yEGBcxWzf/uw2NLOIjbEI3ZHpt5uVo9/s/YZPRuHn4phrU1zZLc
         sUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3BpKCW0mAZxesf8MD9gQhcGX4ZUphV6PxZU1r5+tMQ4=;
        b=InPzQJsZX+7WBQeH1f955JS1TMamNObVeHqcnLZUf/kVEv1jRYp3oE62nSBMpWdKNM
         MuWYF03je5ejxf9UqvtdoY/1OEfJFc7/QZOJ2N00mvtqfykvL0zqUwdLTX7dz9z2hrib
         fyh0EPxqXTo/3CKs550kVNRDmmVL6xe287WaZL15nqj8bFAWpbO3wpIBgbVoevcYGacf
         pz1pW5wBoWyjtWy9LzpEqqRHRSimXZWdf9f65HDLMjeKfq+Pp6OJcT6jxgVV+FYqboaI
         ez4yyNxuenVIZVkan9XJPqWNDELQ1iC25npNsDSisRM2e+Hazryye/25kLkB5k6cix9E
         nE9A==
X-Gm-Message-State: AOAM531HycT9gVtUwiqmLQkK3JILHRpshbW3bBxO+Y2bRet5Jk3OIBPq
        ao741cvlAhvFviIL9DqnO2Nti0w4IvoYB/e4B+WUbA==
X-Google-Smtp-Source: ABdhPJx8jJTCH0VbcuwkjIDXFcnDsNCGoInF6vmx6ON7UezZsqZwhVZDJdl1W8RgHgFMJdz+mbzq1pICnkcFspGn4A0=
X-Received: by 2002:a0d:e612:0:b0:2fb:103f:4067 with SMTP id
 p18-20020a0de612000000b002fb103f4067mr8029998ywe.151.1652475200755; Fri, 13
 May 2022 13:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220512173921.8210-1-andriy.shevchenko@linux.intel.com> <20220512173921.8210-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220512173921.8210-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 May 2022 22:53:09 +0200
Message-ID: <CACRpkdbg14fdyQmdapeAFgWmSDJ5zSWWkvSjKiLJfxKUfF6_Mg@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] Documentation: gpio: Advertise irqd_to_hwirq()
 helper in the examples
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 12, 2022 at 7:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of direct dereferencing the IRQ data in order to get HW IRQ number
> use the irqd_to_hwirq() helper.
>
> Fixes: 5644b66a9c63 ("Documentation: Update the recommended pattern for GPIO irqchips")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Good idea.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
