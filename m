Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE17C433E6
	for <linux-doc@archiver.kernel.org>; Fri, 12 Mar 2021 13:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE18F64FEE
	for <linux-doc@archiver.kernel.org>; Fri, 12 Mar 2021 13:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhCLNl3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Mar 2021 08:41:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhCLNlA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Mar 2021 08:41:00 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F2EC061761
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 05:40:59 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id lr13so53481354ejb.8
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 05:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SlkfLw8Neaaz5YToNxw3zyE/AeBfKZ9Au+54DNTf9Hg=;
        b=GRlQoI0IO2icO5oP/pQqgiELU7s2k4QaUbN89SPnVCX4EFGKK/xS7bHZaBeSCtYn+x
         LB7rIUXyM9eUVBqyooCCqKlDe/oplETynuBc0/gZgDMYZ1Auq+yxGJEvEYuh/VdpivN4
         S3S+I8544E7KYIw1/57UnsGPUWq+R9A+bCfFB0tDS5oDSs9CMgr+HvmSjPLUsCPEgiAc
         ccSBLkzKfpv6+QhsRnaQnGDC367d7tJSPtlj5CR26TjytMmSI4wOY9+vNb7SImAG/QOm
         sZzgP284Dz1oWV/RyGldeAWdCRYeO1TjFHhhps295Xss4Hzht8XMMuNjABIsGkrchzql
         fA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SlkfLw8Neaaz5YToNxw3zyE/AeBfKZ9Au+54DNTf9Hg=;
        b=hoUO9KOBnHNqUyG2OAGNFgkH5mSHDSbES2/8gaoWGwGuEI2KJePuDeoPNWGnJAPjwE
         VWzXaptISDT9VOs4GkJ1WIZPOVfC1MPqV6QtvCHVcpkoNJbbvzyhrnOX0Hc/SB03/PVh
         Utp2ln7ksRs1JxY0/ZBjfPbsybS7oEuDB1rpECJ8pgxydD+e1rFKvzMf41YqSOvikXsj
         Rhox6++nTgbUtDC6IXxpVOw2PIj5SIyU252gGeBXalXwdpaorAaxsE3AFSkeG+bHjJIq
         GlVu58kDsqykCmWDsnvrNW6tXbLqmV7UosUusf65VCBMwnkCIWGsY00HBHkRMKKVc7IV
         UbzA==
X-Gm-Message-State: AOAM53010a7NkVi7kSkbWwKefm0YH3CDWlBLrkk+79mitgtrABN6NpKK
        ITJEFD+orpKZxEalwcqsu8juJQ/TUUhr+05srdtvGg==
X-Google-Smtp-Source: ABdhPJwtm4v97kPrzdnQxf0mV2PkLS8sJs5nBVfE1CL3gYBJyAzifajJbvTYVgx2t203x80Jo1LjyBsd0Q/Fgg/CuYk=
X-Received: by 2002:a17:906:c0c8:: with SMTP id bn8mr8450077ejb.445.1615556458708;
 Fri, 12 Mar 2021 05:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20210309093736.67925-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210309093736.67925-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 12 Mar 2021 14:40:47 +0100
Message-ID: <CAMpxmJW=z+jX3grh+KuikEo0hwPNqz0JQDEyfGLsFzF8A8+f2w@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] gpiolib: switch to fwnode in the core
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 9, 2021 at 10:37 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> GPIO library uses of_node and fwnode in the core in non-unified way.
> The series cleans this up and improves IRQ domain creation for non-OF cases
> where currently the names of the domain are 'unknown'.
>
> This has been tested on Intel Galileo Gen 2.
>
> It touches GPIO core parts and it's expected that the series is routed via
> GPIO tree.
>
> In v6:
> - added tag to the patch 5 (Rafael)
> - dropped ops temporary variable (Rafael)
>
> In v5:
> - same as v4 + v3 (patches 1-4/5) in order to route via GPIO tree (Bart)
>
> In v4:
> - based on Rafael's bleeding-edge
> - split the rest to two patches (Rafael)
> - elaborate WARN() deduplication in the commit message (Rafael)
>
> In v3:
> - fixed subtle bug in gpiod_count
> - made irq_domain_add_simple() static inline (Marc)
>
> In v2:
> - added a new patch due to functionality in irq_comain_add_simple() (Linus)
> - tagged patches 2-4 (Linus)
> - Cc'ed to Rafael
>
> Andy Shevchenko (6):
>   irqdomain: Introduce irq_domain_create_simple() API
>   gpiolib: Unify the checks on fwnode type
>   gpiolib: Move of_node operations to gpiolib-of and correct fwnode use
>   gpiolib: Introduce acpi_gpio_dev_init() and call it from core
>   gpiolib: Reuse device's fwnode to create IRQ domain
>   gpiolib: Fold conditionals into a simple ternary operator
>
>  Documentation/core-api/irq/irq-domain.rst | 22 ++++----
>  drivers/gpio/gpiolib-acpi.c               |  7 +++
>  drivers/gpio/gpiolib-acpi.h               |  4 ++
>  drivers/gpio/gpiolib-of.c                 |  6 ++-
>  drivers/gpio/gpiolib.c                    | 62 +++++++++--------------
>  include/linux/irqdomain.h                 | 19 +++++--
>  kernel/irq/irqdomain.c                    | 20 ++++----
>  7 files changed, 75 insertions(+), 65 deletions(-)
>
> --
> 2.30.1
>

Series applied, thanks!

Bartosz
