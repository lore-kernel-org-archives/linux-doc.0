Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D936D7D90C
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Jul 2019 07:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfGDHde (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Jul 2019 03:33:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45785 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfGDHde (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Jul 2019 03:33:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so5104062lje.12
        for <linux-doc@vger.kernel.org>; Thu, 04 Jul 2019 00:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5nZlyonaYBcIHFs68w4W+bmgmZLAi4DVNEFkxYXC9bg=;
        b=ly2ZB1RacvoXgtBZuxppsAKpbjRSfhQ8AdBwb59ZI7CcTPAY1b3+VAeo9SDLy3CvhX
         NErHZ15uZn6Ui9j+6+th4cMMXPdKCoDyxmdwWuuy5tfhlvQqFRHhSdtzBGediN13vhQg
         ltkRmZPytPiNO1j6j96DMn2FyHsaAg57+T7wMNLrUzRhGGk+MnbAtjEi5HuvEI/lFLdR
         pbrUYpGK0O8kY6JjOxnLdhffIFMFuFnUYi0npgFV5QL5gdABcvOnBBKyK9tW8UKnUTr9
         NchwHX5TsqNKMwWVk9WGT3/5wDsYuqYktsAKmDS1iOpCpm/BQN4/Woo2HrGv6JUS5dgk
         LcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5nZlyonaYBcIHFs68w4W+bmgmZLAi4DVNEFkxYXC9bg=;
        b=uKgY8cjTpSQq2RazbOKAXEe4WJ+U5xaS20zklIm2zcxbZcMJv2M/3t6fRCijNXUTzU
         dZmSvTFAkOHeX68V2WN3qbdntsS/dNoe29YYUJRrAXkxOAFb5xAc7EoSI8rPPjtJF9Hw
         xMGJmEPrgi+tu9TcI7uoLgYWoPOaRDCB97C4wrC69tkM9hceGrp9N/7QO2lZpK/wvUSO
         BZxWz9gbQZaNYNEm0MbOrCJPWigriu+lBv1DWSw/w/ztUbbwnyZoaxwponjaZeXMqJmv
         qLm9lOxNuMfa4lZsZAwzh2h6XA0Cpp8kpWHvI3j7xQ5p0bM+jUt7o5EF8D15u1CFNEUr
         v8zw==
X-Gm-Message-State: APjAAAWKi/wzJZIJhNPJFcs9PoDj3PWBD4gKKHc+8HyhozzLSyjklKGp
        2t+f63OnV4B1vypD9H7ji8QNAfBf49/r5IEHO+K8Jg==
X-Google-Smtp-Source: APXvYqx26V0oB3KzDPNa332FvmrdU9YRFQjWa+Pf4/6aOydVvuHTShaMCf9kZhWzOw++n54b2Y94ETsphqlWJxoLR4E=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr2092620ljg.37.1562225612626;
 Thu, 04 Jul 2019 00:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190701141005.24631-1-geert+renesas@glider.be>
In-Reply-To: <20190701141005.24631-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:33:21 +0200
Message-ID: <CACRpkdavvUR3G89_5DpXvgfpJ7LsxWiLyjFS0hSXVwAgaRFM-Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: Fix reference to gpiod_get_array()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 1, 2019 at 4:10 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The function is called gpiod_get_array(), not gpiod_array_get().
>
> Fixes: 77588c14ac868cae ("gpiolib: Pass array info to get/set array functions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
