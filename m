Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A076C43381
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 16:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 115CB65238
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 16:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhCIQei (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:34:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbhCIQeQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 11:34:16 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B515C061760
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 08:34:15 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id h4so21486496ljl.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EInm0LEnIi7XLKD6zyKq8F4CqLBLvPBrEiCalMxA2ew=;
        b=QFCUfjyZ4xnhe0B+dyRwT4L7N42IypkyBWHBEcDUQLyrvB1LT+5M1yqzKzbOba5dQ4
         RsmcLSF8OBfOJotv21zMWOFayWlqRkAvd6OaQaKUZrSFzfCx7VThVzmcMyprHOix0c3z
         Ft6zo0djGIu9DR/IZJNnJmPEuDUibch6vSohkq3tH5bnOIB8nilOj0y2BdkeVxZzxR51
         hxQ8qQ2Ukx+t1Tf0q5JBwOD9wdfugEvno+I4uDWrEgwP49b0GCsQ8A6EGAIQj1i9VwTz
         zPigDd3wds5T7tibLYVgBzIBpTJiUNO0ZTOnaR41f+d1Cg1uwExHIPs7xtsCnjCZS7eU
         K5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EInm0LEnIi7XLKD6zyKq8F4CqLBLvPBrEiCalMxA2ew=;
        b=tYqBjqaz3IZ5TT51bob8nPJJ2BWBel6dEIHPfb3e26xBbOEYZsEdzmbbTAabUd6Lhg
         hocC7qyWqUC6EUvX260kGJsQEPJLJc0TcARG6nPjQALW56741ZZxxF9EwJ2imedymBTg
         IjBVqvQYfSmaNJCwEPB8oV+NpHlrL33g6aQxjXjlXuuh326Xn2fqzMem/vYavkqwctCa
         TeyAbXFjhqqNcHmUlScfhgoZfSC9c3XHjB4i0t4SOMcefz/cWwkMe1GU8YAIUidoPRNe
         quuVW3MkzvxRtnweMkloRPLrO0fwChMknWRZozeAL4oSKMWPFgnkC5Wqwr18dQD/8KSJ
         sqRw==
X-Gm-Message-State: AOAM531wqdJqk/f9tFsut8kx/HCFEmYapiM7eKsmnFhMBnOzGbND7XQA
        OOo6EmWe9ePugqFbnmDxPfqWWfZs0rmgvcNR7T4jWg==
X-Google-Smtp-Source: ABdhPJwNXAb9NrkkJhTzXglp6OzgZuNzRajKOhmHnYIlN9N9Kod+C9/W2ePM1dzVD0/tuS4O8FWQKlypJ/aXUx+mFvQ=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr16949254ljj.467.1615307653884;
 Tue, 09 Mar 2021 08:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20210308194535.66394-1-andriy.shevchenko@linux.intel.com> <20210308194535.66394-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210308194535.66394-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 17:34:02 +0100
Message-ID: <CACRpkdZO7TPcz6p8Gfavqd1SboCt7ZXwFa4+4TuWNTZuoXZqgg@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] irqdomain: Introduce irq_domain_create_simple() API
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

> Linus Walleij pointed out that ird_domain_add_simple() gained
> additional functionality and can't be anymore replaced with
> a simple conditional. In preparation to upgrade GPIO library
> to use fwnode, introduce irq_domain_create_simple() API which is
> functional equivalent to the existing irq_domain_add_simple(),
> but takes a pointer to the struct fwnode_handle as a parameter.
>
> While at it, amend documentation to mention irq_domain_create_*()
> functions where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Marc Zyngier <maz@kernel.org>

Excellent work Andy!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suggest Bartosz just apply this with the rest to the GPIO tree.

Yours,
Linus Walleij
