Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EECC433EF
	for <linux-doc@archiver.kernel.org>; Sun, 27 Feb 2022 23:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbiB0XTd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 27 Feb 2022 18:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbiB0XTc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Feb 2022 18:19:32 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE4422501
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 15:18:55 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id p14so21348235ejf.11
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 15:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
        b=COC/4g+XK0ncFFdjTFjbGI8kwJnazvpy+Y8Z5kBv2abHG/7OdfJl8XVUO/gQJQXrgU
         7syJ6Bl4EH1rhevEXJDyJCzV6vXIrdiBYUsB99agtvA7QQFqI7pET+wt/bULnxpe/llB
         DoHBp+DrTOur4By7IXXtsNs4+hSllcxUFM+zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
        b=FsXuoIKXZv9TNcPC1PydUujoDm2i01aVbuDH/hy65czB+Vbu2coxvDt2v7a12Quwt3
         6U/VKJ8IOOFB8Nd5Av5T6nkTJHISybEPbspxDVwVALOBDoEqppH4QchEVAInNx5hVjfY
         VEgIPwQUINEGDDycwr66Pje0h7iQpXPLNYazhgrv2CGM7VMzJ01PhzeEtjBEZ9+M/vzZ
         CFAqCC36tVMJJ48uWPZLXr1yloy9AKjM3fH9dh9ilEg03b+RDL4mP4G9b3FmGSvRLA6j
         qWbW5ktQk3onqlnRFzj+r3OL76EAgCu7fv0LyKXRfxlOYf5OxQty4YAFgD3gov+YhHTi
         N9ZQ==
X-Gm-Message-State: AOAM533Euxmg+ie76mrdrlle499cA4X5nzafqtND7tJ9REcPoBz0DQSu
        3wpT5bzPHgV3PiOXRBwKzbFWaRm91wqJ00vxjKg=
X-Google-Smtp-Source: ABdhPJy09Di3kHrXdC9uvOrY2w54tEKFkGgJACaaN3ADf/6rj15vXjEW8V1IgrRQee+IWyU3ZdxoXQ==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id y2-20020a17090668c200b006b49f26c099mr13519454ejr.41.1646003933617;
        Sun, 27 Feb 2022 15:18:53 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b0040f826f09fdsm5338021edt.81.2022.02.27.15.18.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 15:18:53 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id s1so15097993edd.13
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 15:18:53 -0800 (PST)
X-Received: by 2002:a2e:b8cc:0:b0:246:4767:7a29 with SMTP id
 s12-20020a2eb8cc000000b0024647677a29mr12717079ljp.152.1646003517979; Sun, 27
 Feb 2022 15:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org> <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
In-Reply-To: <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 27 Feb 2022 15:11:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
To:     Alex Elder <elder@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Feb 27, 2022 at 3:04 PM Alex Elder <elder@linaro.org> wrote:
>
> Glancing at the Greybus code, I don't believe there's any
> reason it needs to shift a negative value.  Such warnings
> could be fixed by making certain variables unsigned, for
> example.

As mentioned in the original thread, making things unsigned actually
is likely to introduce bugs and make things worse.

The warning is simply bogus, and the fact that it was enabled by
-Wextra in gcc for std=gnu99 and up was a mistake that looks likely to
be fixed in gcc.

So don't try to "fix" the code to make any possible warnings go away.
You may just make things worse.

(That is often true in general for the more esoteric warnings, but in
this case it's just painfully more obvious).

              Linus
