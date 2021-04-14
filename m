Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B90C43461
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 23:25:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 972DC61222
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 23:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhDNXZX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 19:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbhDNXZX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 19:25:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4CAC061756
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 16:24:59 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u20so25032443lja.13
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 16:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CLbBTpjjt41QwROOmav9UyaOIjiz2GHQ1pdcG8Srixk=;
        b=VeP6IaajA77cFYvkuq8w+FxgsvKrtgTzKQkHsIUnbj3C5Jk22V4ZM9+zvZz37SPn5z
         TiQFCz/zT4vgS9uX4hRXotaSG7MLSStLMHrMXh0f0Rt/DJ38PQ9fpl7jzwvjtQeKgP8V
         Hx7UrZxMHdpm7+Tdggh/yOwOC1UOULzuqCLXra+jaDoh/GLN/nwdvuMUfuw3FJigXg4r
         /itKl6AchlHXWQsYtLaHMJxdUXNaT8xXG6nbMCYqVNOhYlcjAagZpB+7XqECkRedTxAs
         V31chxUfLNJEoewg9EHRlGhb4wWK0RQjRemX1GS5F3dJbU+MIRYMN+PBzRboJiJY0Dsa
         Ogig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CLbBTpjjt41QwROOmav9UyaOIjiz2GHQ1pdcG8Srixk=;
        b=tuYnzKdyS1ZXmZW8MVKE/UVrOfuAUhipJBzV9io58xpSYecSim3RUQUJf4XsckzoAU
         TvRA75+j5jpr0um3qeWYXyhjJxbRXw6osRp1+nK4L7/Z6Jifza6sgM22LCuAAfQ7I2Ek
         YLHSCfd4srMMx5rHbyuVS29xgDxEviGVmE/i3ZDfRjjoLteyskButDrz80VsE6K2IQXT
         MWq2x6BFYBYY8HBp7rPhiZsuG669LvA7xlTB0oX6g30j4uak2B+h84SWxJvIksES29iv
         KS4tS+MGi+C9dnLEYR9CS6cU3TRglrZr6vke/5nTd2XQPbpNoZIKjmw3lRkvLuS1/WBB
         vwaQ==
X-Gm-Message-State: AOAM5333BJUQ1pMWyx7UR47lpJSrBcUFzepMFLrzqKXMB/5lunHOEbZE
        tqMqpWA3SQxyOY8Zm8ItTOuqVgZYTNjSx3Jf46TfdA==
X-Google-Smtp-Source: ABdhPJznGa7Wth739yNjYu+WxC0CwVPRykaGcZdlpatQMKWs83I9ZIGfrqt/typWvysIBPbCfZdRKV/p/qOn75Gm3Yo=
X-Received: by 2002:a2e:b817:: with SMTP id u23mr212619ljo.116.1618442697752;
 Wed, 14 Apr 2021 16:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
In-Reply-To: <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 16:24:45 -0700
Message-ID: <CAKwvOd=Vo3wwm-egc6fTa7gD4dsrc77OvBhUy8e+VM=LujRCfg@mail.gmail.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 14, 2021 at 12:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
> >
> > From: Miguel Ojeda <ojeda@kernel.org>
> >
> > A set of Rust modules that showcase how Rust modules look like
> > and how to use the abstracted kernel features.
>
> Honestly, I'd like to see a real example. This is fine for testing,
> but I'd like to see something a bit more real, and a bit less special
> than the Android "binder" WIP that comes a few patches later.
>
> Would there be some kind of real driver or something that people could
> use as a example of a real piece of code that actually does something
> meaningful?

Are you suggesting that they "rewrite it in Rust?" :^P *ducks*

(sorry, I couldn't help myself) Perhaps it would be a good exercise to
demonstrate some of the benefits of using Rust for driver work?
--
Thanks,
~Nick Desaulniers
