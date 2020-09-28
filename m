Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8669C2D0A8
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 16:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7674D207E8
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 16:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="XLChYpb+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgI1QCX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 12:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgI1QCX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 12:02:23 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A29BC061755
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 09:02:21 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id j2so1658643ioj.7
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Beb7AHySGsyjEGIYpYtOQgRUOc+Ox7Lq09Bf6qtNab8=;
        b=XLChYpb+lNHEqVKvw3ag/ZHYaGZefR52QZetHcKGbGil1brBqQgdflZhVGCCq9c7g0
         xyEdBIyB8Hox+di1BXVXMW72/IUG6L9D+rFPyyvTEaWxI6BeRTfD1qqVBIFH6M4E+WG/
         IBKdLMDXZSy6aYMFefJtcrSdSCORUwDgGNjCh+feqiEiVAzW4+v6/WTrZio8ukhIzxz7
         gSB4P6mgH2IdJG8D8qzJtqCW4+dIch0jva42HuIVmaZc++NSBD4jFvEwCwYPMDgXu++W
         b9Lp9UmODqOaf70oOpyYrD7OXooaNhwzHuAACkfILlxO3/+uzQghf7LkRFKiDbyuzs1k
         /TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Beb7AHySGsyjEGIYpYtOQgRUOc+Ox7Lq09Bf6qtNab8=;
        b=Jnu7c7ZqquKWZ9bW7Dou6A1ZNfkiGhUoDNxVJAJKrQlSNa+l4OV6F0G7+eVF6AOIa4
         fxGCQnwzWrzOchwGT0mKa/+HTRC/gZZoiYboXJKEjFoUEVoZkittTTqEpN3/RxZQFHvO
         0wYK6GRGDOwBIRL3D7dbOWtWJ/MTQr6/k345rafmLVd/MjIEeyGSZCgYK9gQgDoLUMBU
         l/VK+k6VjUE+gGCwtCp5Zj5Gkzw1yLbUaJLNYKI8CxcPufWk9LpcphPdxhzTDMUZ1yzI
         YiVyP1FTBBA5HMg1JT2dRdO2cdKrmisS2HdJJnwcqkpDw/VTbOMSAkh+f/Dp4gGVUt+H
         00mw==
X-Gm-Message-State: AOAM530DeklFThnZTPfOO8qhzSIQGB38td6K7bSVavc1IXizJz7FVn04
        IpZiTsBwmTuXK4CuoOgB4AuB/9DnNOVgz/TLABg/pw==
X-Google-Smtp-Source: ABdhPJzz42UKmX7awjxssAkSLiT+5SlH+O8wg4+gU/7bnE+JeDuRKky5DhDRqTCNpn1oF8PeVHiq6cdnbOCCwQl0tU8=
X-Received: by 2002:a05:6638:dc8:: with SMTP id m8mr336154jaj.102.1601308940843;
 Mon, 28 Sep 2020 09:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200928104155.7385-1-brgl@bgdev.pl> <20200928104155.7385-2-brgl@bgdev.pl>
 <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
In-Reply-To: <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Sep 2020 18:02:09 +0200
Message-ID: <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
To:     Joe Perches <joe@perches.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > There's a common pattern of dynamically allocating an array of char
> > pointers and then also dynamically allocating each string in this
> > array. Provide a helper for freeing such a string array with one call.
>
> Isn't this also common for things like ring buffers?
> Why limit this to char *[]?
>

I don't want to add APIs nobody is using. What do you suggest?

Bartosz
