Return-Path: <SRS0=HEyG=CQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C953AC43461
	for <linux-doc@archiver.kernel.org>; Mon,  7 Sep 2020 10:50:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83E1520738
	for <linux-doc@archiver.kernel.org>; Mon,  7 Sep 2020 10:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="DXXW4y3J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbgIGKuQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Sep 2020 06:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728746AbgIGKuO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 06:50:14 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A65C061574
        for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2020 03:50:13 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id q6so12084320ild.12
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2020 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y2WbMMlWb+6LVnmTJRKV9M4FUT+m4Yhxko6TEmzZawo=;
        b=DXXW4y3JIc13ePP4dZs0HPbsWLHy9Mn1p6wfUdlMGf8aqElDxpEmWg3aw+DqpO5ss5
         foGGRIcNDCa/FPVCbUcEvaCUzHTCxoAMw2WYzPuFIY2s9jAQPmONVbR3BKFfH8sYdnsC
         dHQf8ZVmgZZ09vKY3G2gGhvUFZaA4X2zKkdKWKuGjV37gNKiWVSYvcoCZ2xcdpqymaI2
         Ki/4qC6smG9C5a2s0+BXm2TuolTZRs+pubuGVOK46JNqbGNqgWBJVxjQBZuuL0Z2NlQq
         nl1YC4vskdLtvxYJFDRk+G0y4qVL0DYvBbgeYpKCAWy2NhWNlpqcEhF3cdA1L7D1mzrB
         Rgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y2WbMMlWb+6LVnmTJRKV9M4FUT+m4Yhxko6TEmzZawo=;
        b=UB6E1/4pk+DP564YrZ6pxyT0r2zAU9PhjWtDRS37m67HafxTpKqDndCc6Zf7Z2oVOH
         2VdVfRjZKQdZYsqlhFEaUPUJ+hyjYCoEuIdrEiqEPUYU0Rzmbt6O+Gb9FeTL6k0kj7ht
         H1Z4Xyd1Kxq+SHUrBbouWwdRBXXaFqYRQARkGsx2bdUqqZRMIzeciaI/+XT7DSBeg5Y7
         pqzULPnjJjpBNnBHeaBg5e6mv7qEnD5MmJUMktp1C5scQLYi6O3++21gb3mEXGJHACcL
         Oi+rkoUevqd8o6sKDuEAzanRWi68bLW/8Y256LmACV31JBnZ4Vv+DQIXkd0fSuRq5bkW
         0msg==
X-Gm-Message-State: AOAM532Zi0/DgM6j5PZFfB8uLGd5/qAHA4AG+3LtxCOlXlGy0qr9JpP5
        qRZUW/m4oBQY/6SwS8aN5fgISHB69B3gqqz67z9uqw==
X-Google-Smtp-Source: ABdhPJynrTfkvCINR4dH6XcXpfLrT9viB5CqRNVONJhEUV5jYmiptH6QUEy6gzaqRlgTPWh+SDbiNtD7xbF8ZAG72hU=
X-Received: by 2002:a92:189:: with SMTP id 131mr19144027ilb.40.1599475813063;
 Mon, 07 Sep 2020 03:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-7-brgl@bgdev.pl>
 <20200904164128.GZ1891694@smile.fi.intel.com>
In-Reply-To: <20200904164128.GZ1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Sep 2020 12:50:01 +0200
Message-ID: <CAMRc=MeYw=tQABZ2ZGbFQC=yc-zzes6ohSzUJLOLBnEGHzeZhg@mail.gmail.com>
Subject: Re: [PATCH 06/23] gpiolib: switch to simpler IDA interface
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 4, 2020 at 6:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 04, 2020 at 05:45:30PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We don't need to specify any ranges when allocating IDs so we can switch
> > to ida_alloc() and ida_free() instead of the ida_simple_ counterparts.
> >
> > ida_simple_get(ida, 0, 0, gfp) is equivalent to
> > ida_alloc_range(ida, 0, UINT_MAX, gfp) which is equivalent to
> > ida_alloc(ida, gfp). Note: IDR will never actually allocate an ID
> > larger than INT_MAX.
>
> Have you considered switching to XArray API?
>

IDA uses an xarray internally but wraps it in a more straightforward
API. No need to use the low-level API IMO.

Bart
