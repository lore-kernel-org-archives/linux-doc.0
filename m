Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB85BC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 23:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349610AbiFCXRY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 19:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243963AbiFCXRX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 19:17:23 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC92A44F
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 16:17:21 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-30c1b401711so96863277b3.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 16:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMFmCo0xnuCUH2Odncvs80dm9xF8nEGJy2inmx7xN8M=;
        b=F/+W8fk0dgYud/hQIhEr7Ufe0DudYnpd2d3N/0QQ/mEZHDrJyAgdLS/rukKTo6Pa/r
         0vkLYyBtvOi9xqUW95kLWzIE8kFPZougrxRfqCYcI1Th46WCBSnRYRjmEcro2ZgA49sQ
         Pb9vIABVpsGaSLRZc30B1diugL2galjwSUwT8vRnIwOcwQELVvVB3P/BgWbMDm3G9Rsh
         HaUU1cgnVD7bKtGFc4K4K1XOdxzvB4xi/zH1yT7Bu0Viw/1BIzzUu6dfP8/6739i0gVv
         BSLTI0blrAlLy03wv81cwm3JiGwkc5dEIZsn4ntx/wVskc9chkWUP+2bTGM1llLW5Bc7
         FPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMFmCo0xnuCUH2Odncvs80dm9xF8nEGJy2inmx7xN8M=;
        b=7WnY1Woqbla3flMUOpf8J9uyjT7CobipEXwV/L5iZv4IzLWSwMav4nuza/yesNAum4
         Y0SHxic7qw18nKfiDbeG+NMtW9QcmfgpWHgfW4w2d0ZExZCdWmaAizmmGZwrB+m27ech
         vh5S/eST8bcYSb6iLZkb/+bl09iMPjF/Esv1RGix2EVS7XTxyLiffPZI8xYdBy4l4QH7
         AvSONWWd6YwyNb17Ueu4489hHF4NXo2hxVkX5yg8iGgQaLU45dB7iMuRPcnVYVz86BIA
         S2M1/9eDMq3fsYSdS4gAWSCz651lYHgbAZBf1X4rr/I0fEuU7qPLOfga27izQDOLxLGe
         ke8w==
X-Gm-Message-State: AOAM532jK2Fzb/XfvhP/F7z2rGKHRgN3vKF27OAdSRfInFbp+YbVbHX7
        KIQNH1BszcTmIlzQ5070+MKkcvF24eSC/11s6bUZJBcgGdJwUeSq
X-Google-Smtp-Source: ABdhPJy6zJdvqOlia3DEMRKrSefA1gOxoUOJaclqxhYFZNEkw57TgseFZ/V6baktE3+iJU++/uD29MvHtCeGLT542Mc=
X-Received: by 2002:a81:87c2:0:b0:2ff:c948:ae50 with SMTP id
 x185-20020a8187c2000000b002ffc948ae50mr14029204ywf.83.1654298240056; Fri, 03
 Jun 2022 16:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220603055442.521888-1-saravanak@google.com> <YpoiWhMqANChE/ph@bombadil.infradead.org>
In-Reply-To: <YpoiWhMqANChE/ph@bombadil.infradead.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 3 Jun 2022 16:16:43 -0700
Message-ID: <CAGETcx_BOGp_GpNqxjrW1rrmkLrS76Xfh6rUE0tKbd2nqUmDqg@mail.gmail.com>
Subject: Re: [PATCH v1] module: Add support for default value for module async_probe
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 3, 2022 at 8:01 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Thu, Jun 02, 2022 at 10:54:41PM -0700, Saravana Kannan wrote:
> > Add a module.async_probe kernel command line option that allows enabling
> > async probing for all modules. When this command line option is used,
> > there might still be some modules for which we want to explicitly force
> > synchronous probing, so extend <modulename>.async_probe to take an
> > optional bool input so that async probing can be disabled for a specific
> > module.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt |  8 ++++++--
> >  kernel/module/main.c                            | 11 ++++++++++-
> >  2 files changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 710b52d87bdd..32083056bd25 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1147,8 +1147,12 @@
> >       nopku           [X86] Disable Memory Protection Keys CPU feature found
> >                       in some Intel CPUs.
> >
> > -     <module>.async_probe [KNL]
> > -                     Enable asynchronous probe on this module.
> > +     <module>.async_probe[=<bool>] [KNL]
> > +                     If no <bool> value is specified or if the value
> > +                     specified is not a valid <bool>, enable asynchronous
> > +                     probe on this module.  Otherwise, enable/disable
> > +                     asynchronous probe on this module as indicated by the
> > +                     <bool> value.
>
> The commit log says a bit more. Can you clarify this on the
> documentation?

Oh yeah, forgot to add module.async_probe there! Will do.

> We should strive slowly towards more async probes. This will take
> time.

Agreed.

> To help with further then a Kconfig option which sets this
> to a default to true if enabled would be useful so that no kernel
> parameter is needed at all to set the default. Then you can
> override the default, and blacklist each driver as well.

Based on Linus's view in this thread [1] (I see his point), I don't
think we'll ever enable default async probes for modules  as a compile
time config. I think it has to be an explicit decision by whoever
decides the list of modules being loaded in the system (OEMs in the
case of Android, end user in the case of a PC?) to enable the default
to be async probe and then the same entity can decide which modules to
force sync probe on. So, I'm not sure we want to add a Kconfig for
this or enable it by default. Let me know what you think. I'll send
out a v2 with the doc fixes in the meantime.

On a related note, I'm working on default async probes for built-in
drivers, but that's feasible to turn on by default because we can
synchronize everything before we jump to init. And then
<module>.async_probe needs to be passed explicitly for any modules we
want to allow async on.

-Saravana

[1] - https://lore.kernel.org/lkml/CA+55aFxV40V2WvNtJY3EC0F-B9wPk8CV2o1TTTyoF4CoWH7rhQ@mail.gmail.com/
