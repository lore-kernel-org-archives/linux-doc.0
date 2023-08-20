Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636D3EE49A4
	for <linux-doc@archiver.kernel.org>; Sun, 20 Aug 2023 07:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjHTHZ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Aug 2023 03:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjHTHZV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Aug 2023 03:25:21 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46668198C
        for <linux-doc@vger.kernel.org>; Sun, 20 Aug 2023 00:21:25 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so248014b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 20 Aug 2023 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692516085; x=1693120885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2GjKlgrr0th7ky2xTqHRqanB89DFHlsIAVq6xB4FtkI=;
        b=Llw5jlEyl3YJi8wPXC3XEdwm80JhWBms1Hxwa7M375oPxtMMsDMpdXnno3QM8UkHij
         rd5tvbNpbUehZhZHZZdanPyF/mwJrwHcJJY9lUX7AsUS45F0JW/gpleCdp1WSL6ZAiN/
         P98p+J84mIm2om+7bduqY7/h185yDO9UEyjeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692516085; x=1693120885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GjKlgrr0th7ky2xTqHRqanB89DFHlsIAVq6xB4FtkI=;
        b=iKzMRTqPXUVP+5iqWi4ZpofiiOFzqM3qBl28t4LggkeCKb6AYF/muCDZSHWLXJg0Wo
         dULkxTQXEwFm9A0kAcmEakbzXpV0UQ9wtVAQ4Y61cCjwQHbUM4/pSUImRRG0IYf6VeGz
         07Lj9sEEOgxSA3pR8LGsyd/fmqB6H9KyWTCzXAUvLI6cW0FQulQ/maHG4p/KEYoHmy5H
         NMjalfKeGfNMwHcv3wbqennBdwEhHTh7xW4GMhajs5EGXx/RbaoA/cWpM1f5EBpBnN8R
         CyZGkI5A4mNThzBGVLrug5ZsJcrqKwpakFhNtrE4AExw0Ib/CqOliXDFPO4SLqqQc6TH
         KFVg==
X-Gm-Message-State: AOJu0YxfY2uTs7OX45QRo/YwC6xpfIqR7y6qtquB+I0UsG+pEHueH+2C
        3+3ZrNpT/rmcEiFmOrw09h+2Sw==
X-Google-Smtp-Source: AGHT+IGIQAjbE3hh0ICrLFqCMNEeMJMax+giGMT6cu4dqkwKnm2z/qwkPtiVoEYnad5tcQ5DceDh6A==
X-Received: by 2002:a05:6a00:b4e:b0:687:6184:def4 with SMTP id p14-20020a056a000b4e00b006876184def4mr5234317pfo.21.1692516084499;
        Sun, 20 Aug 2023 00:21:24 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id j6-20020aa78d06000000b0068991abe1desm4150966pfe.176.2023.08.20.00.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 00:21:23 -0700 (PDT)
Date:   Sun, 20 Aug 2023 16:21:19 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
Message-ID: <20230820072119.GM907732@google.com>
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com>
 <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (23/08/20 14:11), Masahiro Yamada wrote:
> > That doesn't seem cover the cases that I'm concerned with. I don't see
> > anything related to "!sym" in the patch.
> >
> > What will KCONFIG_VERBOSE do if it reads the following config file?
> >
> > // assuming that both config options were valid and existed in the old
> > // kernel, but were removed/renamed in the new kernel
> >
> >  $ cat .config
> >  CONFIG_DISABLE_BUGS=y
> >  # CONFIG_ENABLE_WINAPI is not set
> >
> >
> > I'd like to see warnings for both lines, even for config that is not
> > set, because it maybe we set by a build script depending on USE flags
> > for instance, so that build target may still refer to non-existent
> > config.
> 
> 
> I did not say Ying Sun's patch covered your case.
> 
> I just meant I dislike your approach.

Sure, OK.

> After his patch is applied, please come back with a similar approach

I guess Ying Sun's patch cannot be extended to cover these extra cases?

What the preferred approach would be? Do we want a new KCONFIG_FOO env
variable that changes behaviour of one of the targets? E.g.

	KCONFIG_LIST_MISSING=1 make oldconfig

and then have conf list symbols and terminate with exit(1) if there are
some unrecognized symbols?

We have "listnew", so "listmissing" sort of fits as a new target.

> if you want to address your case in the mainline kernel

Yes please, we want an upstream solution for the problem in question.
