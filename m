Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8F7C4332E
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 15:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0E4C6525F
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 15:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbhCIPk2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 10:40:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbhCIPkW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 10:40:22 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE4FC061760
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 07:40:21 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id i26so9585473ljn.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lu+kK3nSAEUTNwnDM4pW2WC6uWJJmrapOL1I+PVvtnU=;
        b=RGZPUNMxbSls/6ut21Ur6KbghdWogF4sL+NXMIA9cKyeKwNKL0Hz0mhyFsSXv/OBtb
         jnTPF5TJwRfP2h3ns1CWqPwbvZ4FlR8eSaemHeyxekynGvXftNVUqM65k0VzJehBmDiy
         owGLAG6He59RMMoToMWvTXpswEBmJpDEWhPBCvrtWjGEFW10PpYT6vEhruku3/ccszps
         RiZ0KG+sggU/vWnMvLxnqun6CIJ+9PI9QkRuasLDeWjdRis4tG9zoBRBzMgZyJc7uNlS
         tDF2cw3jmG11uhRjhoVDbmrssDArdZ/i28IYjqFlv8rJaqbzR0I9MClkeGzwb4zyqUyh
         kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lu+kK3nSAEUTNwnDM4pW2WC6uWJJmrapOL1I+PVvtnU=;
        b=p9Yw9/6LWs/pwqulQG1ygT0u4z+A3iyGZp1g23P/xOfk3Et/qJlxG0qLqEkRUwfAud
         YXTviqTAeyCS4xUhVK3oWW2626z5LpzeK/Shpw0GK9E6spC2EYRb18cLJyqJmoVDu4wa
         SOaLpmb2ZghSLsBQkNUYv+HMzqXvb3kyygTKqiHE7AfTz8pH7EaCR0Cc+X6SDYpO03bA
         r3f0hMInW6baXcPe1IdhAuyYT94+LZk5XKjF8n0X0Y+9J0x/3b8mOxFrl359EOqrJd8M
         T8lno1iMSeI/7e9FSUdsbUzouIOxiPf1bJ3QDu8yQTotkKZkEFENh7zfNg1d+S1DINjJ
         hdwg==
X-Gm-Message-State: AOAM533G/jr5xq/lOzeGpR6B1oJSajShph1NZ7Sz+ogOUXg8XX2mYv1X
        LDDJvbTLwnhPNKb7p/R/f0ePmWkTRSdgv41q5y9Z3g==
X-Google-Smtp-Source: ABdhPJwEI7sL2ZOe/ozOi+pJFvTfLuJFts7EVCGgPZapWZODVntgxp5IN5ZQc/HGdbEc0f45tW7JoT/HzKQUQHQUuLQ=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr16814623ljj.467.1615304420049;
 Tue, 09 Mar 2021 07:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20210304213902.83903-1-marcan@marcan.st> <20210304213902.83903-13-marcan@marcan.st>
 <CAL_JsqJF2Hz=4U7FR_GOSjCxqt3dpf-CAWFNfsSrDjDLpHqgCA@mail.gmail.com>
 <6e4880b3-1fb6-0cbf-c1a5-7a46fd9ccf62@marcan.st> <CAK8P3a0Hmwt-ywzS-2eEmqyQ0v2SxLsLxFwfTUoWwbzCrBNhsQ@mail.gmail.com>
 <CAL_JsqJHRM59GC3FjvaGLCELemy1uspnGvTEFH6q0OdyBPVSjA@mail.gmail.com>
 <CAK8P3a0_GBB-VYFO5NaySyBJDN2Ra-WMH4WfFrnzgOejmJVG8g@mail.gmail.com>
 <20210308211306.GA2920998@robh.at.kernel.org> <CACRpkdZd_PU-W37szfGL7J2RYWhZzXdX342vt93H7mWXdh5iHA@mail.gmail.com>
 <CAK8P3a104VXhPHuWaJVEw3uMEp3rSEHsFJ6w2sW4FhNjiQ2VQQ@mail.gmail.com>
In-Reply-To: <CAK8P3a104VXhPHuWaJVEw3uMEp3rSEHsFJ6w2sW4FhNjiQ2VQQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 16:40:09 +0100
Message-ID: <CACRpkdYSFGF1crqDnwB_UbEXV8q5xqx7n8VHCyKYjCpy1PMK8A@mail.gmail.com>
Subject: Re: [RFT PATCH v3 12/27] of/address: Add infrastructure to declare
 MMIO as non-posted
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Hector Martin <marcan@marcan.st>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>, Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        DTML <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 9, 2021 at 1:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> - A driver writer may want to choose between posted and
>   nonposted mmio based on performance considerations:
>   if writes are never serialized, posted writes should always
>   be faster. However, if the driver uses a spinlock to serialize
>   writes, then a nonposted write is likely faster than a posted
>   write followed by a read that serializes the spin_unlock.
>   In this case we want the driver to explicitly pick one over
>   the other, and not have rely on bus specific magic.

OK then I am all for having drivers explicitly choose access
method. Openness to speed optimization is a well established
Linux kernel design principle.

Yours,
Linus Walleij
