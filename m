Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49252C433E9
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 08:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07D0265295
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 08:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhCIITm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 03:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhCIITb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 03:19:31 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34656C061761
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 00:19:31 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id dx17so25692459ejb.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 00:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ktw6Vy0vKj0+IWZr4PuUcyXC0kFObus7a2EmBpNWdj4=;
        b=tH0VLSft5rYfI6ehechyQeyeheTGF4WBZ+zVPMOcqhQtUjwdPp/ZIgO6N92PQP22nv
         jv7WqiKtR4Ey4bLqONv4Cj7l3pDkLs/Ut7+UGvl0J6MV8P/IBpSgq+AWKTRoOM21azGt
         y9fA0kV7UhDZjTp4r94mkOrBYZxy0UAfHbRrceqBC2ydMnRvAi+JH40r3yqJkX4N1qiZ
         IAy8wffkslT8wuq9LrR6DpBc8ENsmvCBVL/hdRRKe7oEw5DgjxIvF276O+mp1q1Fw57v
         SjeBUjPf1gBQ1xzkmpHLkS8xjnd3+tSha2HFaHHjS7fZI/YJ2nXKW8wUl9CVqd937/+g
         mX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ktw6Vy0vKj0+IWZr4PuUcyXC0kFObus7a2EmBpNWdj4=;
        b=mAF0EWAFKYpS+/ciS4ThGN5SXSMpgbez9MsVXJBdom+YB0m27aKbdDM0j5TQw7+6Dz
         rNgYdsUHVk1xbF40KXul7txtCIdz3qxQfFVfbmAqd7cnR0WaaavvM7v2+50jvWKTICAn
         5YldGBDerj1c+FgcWPAlxIF4Bney1waQ/nKw8GvH6t5BV1p1+Q+T1MbLcDHeQZoDfMaa
         +n7iftM9pyx70Zb2uqWkVpKD5o4d/eXV61hlAMwXOE1yZQK3PvKTe5vr00l+bMHp9qlZ
         L4VrtRb+io9TMBVUtmnILzm5eMTj0Q8RF5zlw/GiDa+sUZSubhRhkYGfj2ZLrhzB/hPD
         8nGQ==
X-Gm-Message-State: AOAM533nYrEv2DilUIsTfrb9/+zlrggE/0C6Fqh2CDKBQtvqYJnCbN7u
        Hq+V0bYcDcy7+6rcTeAEeTSqho8EYBZL8eHT24t8rw==
X-Google-Smtp-Source: ABdhPJxccaY07lvzI3pyPNA1B4j+TqZ/AgQnJSiW91vnn1Z11jeetk9yG4K3pnXMtESj7nJOyz2L+HZGYHjmyyoztkU=
X-Received: by 2002:a17:907:76c7:: with SMTP id kf7mr18687281ejc.470.1615277969766;
 Tue, 09 Mar 2021 00:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20210304201253.14652-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0gR=gN2ROo9JSOGHokw5imscMBwDERni8X83p0eWt634w@mail.gmail.com>
 <CAMpxmJUQ3r0YCeQvPq=SW57w-5BLtoTO1_bv=2uw6CX_1-EXcQ@mail.gmail.com>
 <CAJZ5v0h7zUMU9DMofa3fhop9fYY6UJQ6Nm3xBOmG48bcmLCj3w@mail.gmail.com>
 <CAMpxmJXa2Qxznss3c79Zf-PzsX=SY6WOJorAMvS-UxKoViKP_w@mail.gmail.com>
 <YEZ81OraApPIu8d9@smile.fi.intel.com> <YEaAY37PsqT6WQB9@smile.fi.intel.com>
In-Reply-To: <YEaAY37PsqT6WQB9@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 9 Mar 2021 09:19:19 +0100
Message-ID: <CAMpxmJUQ+Fhz8XTh14eHiqdQc3jBEwr8wuezw+NcgtU8XXFUQg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpiolib: switch to fwnode in the core
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 8, 2021 at 8:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 08, 2021 at 09:36:52PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 08, 2021 at 08:29:27PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Mar 8, 2021 at 8:26 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > On Mon, Mar 8, 2021 at 8:23 PM Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> wrote:
> >
> > ...
> >
> > > > My impression was that Andy wanted me to take them.
> > > >
> > > > However, if you'd rather take care of them yourself, there you go!
> > > >
> > > > I'll drop them now and assume that they will be routed through the GPIO tree.
> > > >
> > > > Thanks!
> > >
> > > They touch a lot of core GPIO code and are likely to conflict if any
> > > other changes show up this release cycle. I'd rather take them through
> > > the usual channel. Thanks!
> >
> > Since now we have v4 based on Rafael's bleeding-edge, what do you want me to
> > do? Resend a v5 with all patches included?
>
> I have decided to resend as usually it's better for maintainers.
>
> But it appears I was too quick to miss Rafael's review tag / comments.
>
> So, I will send v6 with those included.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Does this series depend on patches already in Rafael's tree? If so,
maybe Rafael can provide me with an immutable tag to merge in?

Bartosz
