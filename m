Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E809DC4332F
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 09:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiLCJeJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 04:34:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiLCJeD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 04:34:03 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C4B56D44
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 01:34:02 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3a7081e3b95so71686177b3.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Dec 2022 01:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fkGQMlu6wKeISp0zA+NNxO3uj0UvahfyytXWgxy5oAU=;
        b=arD8BDwE7ELF18ggu6/9RjwoeoBeB7H0+DwUtSejo+QUHEQbiDhl5V0CuZ0vTGpe6p
         hviivVCkjZoYd3PiKOH/6ZWghRadFalG22ZeSIyVKijrgJxiqaGrN05NEYSUvql2pOl0
         7yJk+iIsmF5I8snfE7ZDtQLoM66T+V9rLh4cBo4Vf2vy4oe0KhJxNVTiQirmga+YYWcd
         l64TvE0bmLdeg8gW04V8XaSzDtQBPmfj8MOuaV9XfDJLH4uykJI/wSQeThYIGP+dyk8a
         WGYau/0LOh43OvwlcTY38Jv4f0H72w4JzqpWEG5PUkxI8YTmF/rAxnMxkxJKf6PY1n5Z
         yjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkGQMlu6wKeISp0zA+NNxO3uj0UvahfyytXWgxy5oAU=;
        b=M/7LPh9/uVFWj3sHnBailwvhsmHH57UFceLbijiD8ROcH+Vp3vY6IjtUD3HqZiJJzj
         52nqHh2MtSV1xyo9lMUkwGU7HrCSafj3V5Y74spTcXJ2FdSy/l53JZFIP+InQgmOsMOT
         pLjlfrlE3wbuU5s3WEChQl1QqXX4jMZnFMNPBrY9yw+zfDChYZZOcr+Pw5twbetuLekG
         OUbBvOqLvxa/d7svoZbvRIeBP1SPnDyAfpsAqDE8x3Wh2E+923RowKigNJTxG7gt2AC1
         +iFNjYuLbok3d6vxq9el5vsD1SB9+wgklSopAEp8cfm5uLt3ue0kKWEAdMyqyHJ2eH8s
         DKlA==
X-Gm-Message-State: ANoB5pnvJcU21MWLW8T3Dl6bUdzzQZKQD1KSeBoN7sCJLrcApNycOy2P
        xzZwKelwe6IAOPj0kzZXtfWnTmN3rLBgY8L+EvfKlA==
X-Google-Smtp-Source: AA0mqf5rx5euZ8EgLbXLgUOq9u5gJklMo7bbGhLHT4FySZEtgNpgveMbe3VSrDmx8xMO3lU2qWmHQ5iT6VRng/f7FGc=
X-Received: by 2002:a81:5748:0:b0:3b1:eee3:32a with SMTP id
 l69-20020a815748000000b003b1eee3032amr43455788ywb.325.1670060041225; Sat, 03
 Dec 2022 01:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 10:33:50 +0100
Message-ID: <CACRpkdYVU2KJMw=FRxCLXbpWY+42RGheHvnqzg2bo2=JjTRCOw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] Documentation: gpio: Input mode is not true Hi-Z
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

> The true Hi-Z (a.k.a. high impedance) mode is when pin is completely
> disconnected from the chip. This includes input buffer as well.
> Nevertheless, some hardware may not support that mode and they are
> considering input only as Hi-Z, but more precisely it is an equivalent
> to that, in electronics it's basically "an antenna mode".
>
> Sligthly correct documentation to take the above into consideration.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
