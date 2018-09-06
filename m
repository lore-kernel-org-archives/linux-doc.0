Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C80167D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Sep 2018 13:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbeIFRgi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Sep 2018 13:36:38 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:53466 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbeIFRgi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Sep 2018 13:36:38 -0400
Received: by mail-it0-f67.google.com with SMTP id p79-v6so14587045itp.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Sep 2018 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xI4pb01POVYyYfifY/Nw/wjK5kaIjPidd8bHfuORLtA=;
        b=QmIeab5UuE6tqApc/KxxwaRSRP/rBf4qRwrDW7j8rYakSoz2e0l5JCSHCfOjci5EPT
         bYfk7FP20HVYvmabObbQHhvm8fisbnePjl06/OMfzQFBR6aaXfh9zFAZ7JvoVZht9XtH
         pbzhqlGNR+qlF/j2OYfoe6QKI4ljJ3YTQ/Xuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xI4pb01POVYyYfifY/Nw/wjK5kaIjPidd8bHfuORLtA=;
        b=aj8OETwXLImJptLi7pNDsKFWsQQZYd8Bhrq4rLFVZyD3J1T1bMBAH0pMJxM/nls27A
         U9F9QCOa4L0uNxmqSHeZovkrGH74Rp9NrPp02elORpMz9kbbSM0ll8568KCvgEOYgJ7y
         VVGUTyfoL7W9RhODdoOudJzcDD44mR3HdVqCCY5ex4oKWFIVCLK3jWPiEH/rQq5OSaZw
         oDFUwbsgS/3DONS8SVOxgF6s6lSba37yR3nojslgZ4D/Y+Ey5lkHuffMSd9NouhKafRq
         N+3D5cTZ0tER17DtMJCEkAbLWK6vR+2P5Ld83fD+RHf9dlDlYOffp7kG+C8k2T25ACI+
         OEHw==
X-Gm-Message-State: APzg51BxP3PqsXkacqGy8fZVai+yPWOUMLZc7SFwQT290nVY1mYafaX+
        2MIZuw4h0exhZbML7HlWXyqqWGb/dNa19MtJ+09Vrw==
X-Google-Smtp-Source: ANB0VdY2RGG+wEONcGehZLuaHPzHDGohFL+3Y9vNlOkWnOl5haLvqc/EbaGEqn5v9f+kkBL60SHWNkNQJ1CDf5WIxZQ=
X-Received: by 2002:a02:5916:: with SMTP id p22-v6mr1841916jab.113.1536238874472;
 Thu, 06 Sep 2018 06:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180905090555.9888-1-geert+renesas@glider.be>
In-Reply-To: <20180905090555.9888-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 Sep 2018 15:01:02 +0200
Message-ID: <CACRpkdZMD-GJUtcSiP30Rb-XAR6OHXZvdmEgOY-CxgauDGvViQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: Fix VLA removal fallout
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Laura Abbott <labbott@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Geert,

Thanks for the patches!

On Wed, Sep 5, 2018 at 11:23 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series fixes various (mostly harmless) issues introduced by
> commit 3027743f83f867d8 ("gpio: Remove VLA from gpiolib").
>
> As per the "one patch should fix one issue"-policy, this series contains 3
> patches, although they all have the same Fixes: tag.
>
> W.r.t. propagating errors: while gpiod_set_array_value_complex() and its
> callers can now return an error code, this is currently limited to -ENOMEM.
> Actual failures setting a GPIO output value cannot be propagated, as
> gpio_chip.set() still returns void.  Do you want to change that?
> E.g. gen_74x164_set_value() can fail.
>
> Feel free to fold patches if deemed appropriate.

What I want to know is if these patches drive a truck through Janusz patch
set augmenting the array functions that I definately also plan to merge for
this kernel cycle.

Issues should be fixed of course, but if some of them already disappear
if I apply Janusz patches, I'd rather postpone ... is it going to be hard
to redo the cleanups on top of his patches?

Yours,
Linus Walleij
