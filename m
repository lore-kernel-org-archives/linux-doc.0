Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5348CC2D0A8
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 08:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9D5E207E8
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 08:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="fOnaGR3E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgI1Iou (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 04:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgI1Iou (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 04:44:50 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDE0C0613CE
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 01:44:50 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id g7so270541iov.13
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fayrMke/iMmL3S1m48cDdbLjSvfbjD1pPfIEkjq4r8=;
        b=fOnaGR3EiaURi1YbQBb1q+WGvG+oxcSl2yIiXnZXMLCOY7oS09bbAPxAN2EAfJEfLr
         xbZDIb5WUd5rAqBcTr8bCpkyOeJtRcY/NcZZEUP31NaA3vmlggQRBoSw0Q82khu7nq/I
         dsZuTwne4Oj4sXF105YDIiDOhYUFwmAALQ6la35k/BVkngr+OYaFtfz/8V2mL5swMzT+
         TJKhRUBMHLjvD3mtUqZLjbnH5iu/qC6JV9UClNEriSU9rAhgyLQeXfYbqoxrrVVU2Yr7
         rW1vaJHMQtZcW9T7NcTayiYvPNBzC7xBNLJ6O+vI+g6Nr/I0M6mZ2VWYjLc6sWwqMJ+j
         3e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fayrMke/iMmL3S1m48cDdbLjSvfbjD1pPfIEkjq4r8=;
        b=HaGEUxqbRbToSoUnEnImoDCN8QO+rKlrqIcATSZJu6rGEuOawB9u1k8F81uikIGU5w
         DNT2FlxZQWnpOGS6qjYLPgdW0XlfVCOSh6UzMm7PznjQw56JxbyiVfEu1U0qcB2ahxgm
         /fTqvB70Hukp4o7q50fA857iZBnuAuklWwp5fcO1n6pypnrhWFo+vZY8BWy4rCMwpH63
         9p3r4PwyKCXt0rpwA6Q3LsxweT312VLrkSgs3Ge7iriH+7oiHD2TaoJg+lpxX2MEQcem
         2rz8RH8L73J5/1T8qzIY68sdr4FEfXKgWL2MfXSgqY/+8lS6EM5x9zCaEeG5m9RpBkk0
         lc1w==
X-Gm-Message-State: AOAM532AQVlfYRwL2z5QSRxsqXz3D6z8lQsdMkuPtEaynPEzLAcWKKhR
        xuzqYfrMFmNMpIdfkM2QCnsKrGBYsdqjfMTOLEZAQA==
X-Google-Smtp-Source: ABdhPJyrLZMUXptlIkp7DAvbxVDjU2XfeRgHkmsku/FQbNMxC9CMqd1e1XHuvzm2Hk9b81beBAOnDyl/9H44WrcTtRc=
X-Received: by 2002:a5e:8c07:: with SMTP id n7mr6506942ioj.130.1601282689564;
 Mon, 28 Sep 2020 01:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200924113842.11670-1-brgl@bgdev.pl> <20200924113842.11670-9-brgl@bgdev.pl>
 <20200925090329.GZ3956970@smile.fi.intel.com> <CAMpxmJWBSwofFy94mHZWB2mdvHGStYp5oLDZp2M+wO57t40HSQ@mail.gmail.com>
 <20200925123000.GD3956970@smile.fi.intel.com>
In-Reply-To: <20200925123000.GD3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Sep 2020 10:44:38 +0200
Message-ID: <CAMRc=McfBLaE=N12z29JjTDJ0ABzC8OW4rPWeeSU82kag+9pgQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] gpio: mockup: use the generic 'gpio-line-names' property
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 25, 2020 at 6:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 25, 2020 at 01:40:10PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Sep 25, 2020 at 11:03 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Sep 24, 2020 at 01:38:41PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > GPIO line names are currently created by the driver from the chip label.
> > > > We'll want to support custom formats for line names (for instance: to
> > > > name all lines the same) for user-space tests so create them in the
> > > > module init function and pass them to the driver using the standard
> > > > 'gpio-line-names' property.
> > >
> > > ...
> > >
> > > > +             if (gpio_mockup_named_lines) {
> > > > +                     line_names = gpio_mockup_make_line_names(chip_label,
> > > > +                                                              ngpio);
> > > > +                     if (!line_names) {
> > > > +                             platform_driver_unregister(&gpio_mockup_driver);
> > > > +                             gpio_mockup_unregister_pdevs();
> > > > +                             return -ENOMEM;
> > > > +                     }
> > >
> > > > +                     properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
> > > > +                                             "gpio-line-names",
> > > > +                                             line_names, ngpio);
> > >
> > > Forgot to update GPIO_MOCKUP_MAX_PROP?
> > >
> >
> > No, there are still three properties: chip-label, nr-gpios and
> > gpio-line-names. Same answer to patch 8/9.
> >
> > > > +             }
> > >
> > > ...
> > >
> > > > +             kfree_strarray(line_names, line_names ? ngpio : 0);
> > >
> > > Perhaps you may check for NULL pointer in the kfree_strarray() and drop ternary
> > > here?
> > >
> >
> > I did in the previous series and you told me to not to. :)
>
> Hmm... What was my argument? What was wrong with me? free() should be NULL-aware.
>

Well, it is - your just need to make sure ngpio is 0 too. :)

I'll revert back to having the NULL check.

Bartosz
