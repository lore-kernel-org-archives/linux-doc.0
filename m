Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F98C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 18:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 631C861055
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 18:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbhCaSbc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 14:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235109AbhCaSb2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 14:31:28 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52571C06174A
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 11:31:27 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id i144so22198973ybg.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 11:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7jlof/pNjkC0LExRdM7E0LmWgRs1tjM6/e1u7N+Efkc=;
        b=htVxUbA9Mfr5t0HtFExDE8JZMnNHBDy4/VRicG2GAFsRoetik0xCsQwDdbmPSW8hYL
         djrulSGwMQaNb9JZFUoxaLN6oDL+dQ3kfmCkOUK7ioAqdZAVxq14im8uA8TDi1U+cfVD
         F/QE63rj2NF6F3cICQaPal6wDDMfk1A3N/9kyl+5wyM3tu6564JByr8/S6LgUiAaQGrK
         fL1XkHayuORUysW8HzeJnInGZKZ1LrqQqqJY3Eqg93coVu1Tbg572P1H5wx1gMpkdPIv
         XsmM7k7mb99MOnyz5MBMQym++Uj1EBXyYNYPkucZod2/m8fSdIi10JYDB1vy0BxY/h92
         tqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7jlof/pNjkC0LExRdM7E0LmWgRs1tjM6/e1u7N+Efkc=;
        b=hG3LHaI6zTD/8kAqH7+gUQJ9C1AvsyUibzIGQvFPIyJEMmW3ZtkeBncfdFQs5qOJ14
         9ScaNpcDHO4UCIbS4VkFFxKWZngboUhFnUP1mfo11fR3DCxH0AIM08ctNIFt/k5IG7y5
         0rKZG23Ij00BTYtAMmpeoxup+yOxEoL/tJQEvpuwXJf+U1+2IY3QkKFklTHIEdGFtfHX
         jOmztFwhOJsL4kKvjt6OaZtHwv8mnBziPoa20EaVOcr8/Cr9qeEQ4HIfgscIOFLVTgjn
         UoKWLlU2uhM6hVpvUyPzyU+tG5Hkl42WCjbUKgsW6ftz1c7tP4X/+RzTkZhvDXQPpKQu
         FKyg==
X-Gm-Message-State: AOAM531qPiMhFFL5HKMs3ZubLtgJ8G7v36G+VkhIL5PbzApR06QxJTjt
        ZYeQdbD775MlLOlprBWOc/9OYZxHh65QPiCNS7M83Q==
X-Google-Smtp-Source: ABdhPJxpmgjd76pWGD+FESc/KM3zqDsAUVN2y3sQ4/D6QZxHWdYPhKxrIno6Bs+eJeNOFFtdktHNc4yYXxfX4SZTU34=
X-Received: by 2002:a25:c588:: with SMTP id v130mr6398245ybe.312.1617215486701;
 Wed, 31 Mar 2021 11:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210329111648.7969-1-ada@thorsis.com> <20210329111648.7969-2-ada@thorsis.com>
 <CAHp75VdqtWS15YPvaPvy4yj5TdW7DDgFB+_bbavFqPBp1zm6eg@mail.gmail.com> <YGRw3PlLBYCPvPn1@ada-deb-carambola.ifak-system.com>
In-Reply-To: <YGRw3PlLBYCPvPn1@ada-deb-carambola.ifak-system.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 20:31:16 +0200
Message-ID: <CAMpxmJV6F5Q4dt71JvY6_awswDFhLFRUsNvx_oP8Wds=PfJwNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: gpio: mockup: Fix parameter name
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alexander Dahl <ada@thorsis.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 31, 2021 at 2:53 PM Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Andy,
>
> Am Wed, Mar 31, 2021 at 03:27:05PM +0300 schrieb Andy Shevchenko:
> > On Mon, Mar 29, 2021 at 2:18 PM Alexander Dahl <ada@thorsis.com> wrote:
> > >
> > > Module probing with the parameter documented yielded this in kernel log:
> > >
> > >         gpio_mockup: unknown parameter 'gpio_named_lines' ignored
> > >
> > > The parameter documented did not match the parameter actually
> > > implemented with commit 8a68ea00a62e ("gpio: mockup: implement naming
> > > the lines") long before introducing the documentation.
> > >
> > > Fixes: commit 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")
> >
> > Alexander, in the entire series you are using the wrong format for the
> > Fixes tag.
> > I highly recommend to add in your .gitconfig file an alias:
> >         one = show -s --pretty='format:%h (\"%s\")'
>
> You're right. Sorry, I messed things up. I first had that line without
> the additional "commit", and added it because I thought checkpatch
> complained (which it probably did not).
>
> The actual format is documented of course:
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
>
> I actually have a slightly different setting for pretty.fixes in my
> ~/.gitconfig for other demands. I'll go and make that project
> dependent now.
>
> Thanks for pointing this out.
>
> Greets
> Alex
>
> >
> > `git one <commit ID>` will give you proper value to refer to the
> > commit in question.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko

FYI no need to resend, I fixed it in my tree.

Bart
