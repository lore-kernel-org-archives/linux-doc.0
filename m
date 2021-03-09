Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE08C433DB
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 16:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5640A65238
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 16:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhCIQfn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhCIQfM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 11:35:12 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FF5C06174A
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 08:35:12 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id r25so21419351ljk.11
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MPh3fYrpynT8qqoQI9nObnRXX03m69XX0kkoxFbQtug=;
        b=GN41IGu42t9gXi3ED2C8ne+gWDPFIl3Cz+zhDgMErK/I8nl0dGuUEVs/SOVXHoc9Oe
         ilKTLAhuugELeyAiW1l7FwDwfoafn8RPjAlAQhZ2l6o/ZwZsSBLL7iOi20PgRZRw16rn
         zKT7aEBeaKpc5NwhEGaXJHg9+xQe2yJ3WMLdeKBKjNY0ecbISMGm4+UsVsBtN+9zbyAC
         1GTmuw3QVL1jWa8r409pZCvBeVAeiPTmtIhmdtVk0hhFgyMIrpnQ824GfENt38eoogfl
         QBtR1A3uCoHEQkvKOGVKhz3FGPwmdcvg0irrgkrAXnE7tQ0LRRfabW5cEhPNALjc1guq
         RSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MPh3fYrpynT8qqoQI9nObnRXX03m69XX0kkoxFbQtug=;
        b=Km2H4mVY3AbQBYiO8jzdDPRxJ+CdEkxBFccjj9c60dIILpr3We6Z81vlntQLd/By8Y
         ++azj/cCty7XxK2T0eIV1M9CS4PSSbC16uVm7PuoO1osjGA+x1OMTa7FPa1/vOZ8NW0J
         aa4P6Ut4hALkTib3sjN5KEGava6c7SQJ17VXjyJ1b9DhaPEdJnw8nulLCo0VJt93Rp9+
         bTSCHbHCsLyn/Z7YhlO/RqUdIP5jVjiD/Pb3hEJ6NbdvgCfrXYoosE7okbJ34Tr6Gn8X
         r+Nakj5Yk9gfp9Vv3kzlPvPGi5iQSEhkRMJmSS8uTIebn24fPEcrIw+O1Q9uEaKYSRRq
         Ar5w==
X-Gm-Message-State: AOAM533mIniybUhxndH78tAY8RA7jEbtDG1pqk9Qkddop8PumX5hkZAw
        akelOn325VVeeChwyzP9zZXO85eowC7A7b2gZjILhA==
X-Google-Smtp-Source: ABdhPJwx+vgRcYzzK5JGSjQMsz6ywP+zUvsGmW7juH6Hhh85o5Hv3QjRB3wk0V6V/HIy9NeuR+ZZD90xGrXYfnhHYpA=
X-Received: by 2002:a05:651c:103a:: with SMTP id w26mr14919558ljm.273.1615307710918;
 Tue, 09 Mar 2021 08:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20210308194535.66394-1-andriy.shevchenko@linux.intel.com> <20210308194535.66394-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210308194535.66394-6-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 17:34:59 +0100
Message-ID: <CACRpkdZmE2wCfhJsdCaVaaJbVDtvgReogVgx9_fpG=0YRS-U+Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] gpiolib: Reuse device's fwnode to create IRQ domain
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

On Mon, Mar 8, 2021 at 8:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When IRQ domain is created for an ACPI case, the name of it becomes unknown-%d
> since for now it utilizes of_node member only and doesn't consider fwnode case.
> Convert IRQ domain creation code to utilize fwnode instead.
>
> Before/After the change on Intel Galileo Gen 2 with two GPIO (IRQ) controllers:
>
>   unknown-1     ==>     \_SB.PCI0.GIP0.GPO
>   unknown-2     ==>     \_SB.NIO3
>
> Due to the nature of this change we may also deduplicate the WARN():s
> because in either case (DT or ACPI) the fwnode will be set correctly
> and %pfw is an equivalent to what the current code prints as a prefix.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
