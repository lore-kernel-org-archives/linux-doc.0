Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D3AC07E96
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jul 2021 20:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C51A0613F9
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jul 2021 20:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhGDUzG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jul 2021 16:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhGDUzB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jul 2021 16:55:01 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2E8C061574
        for <linux-doc@vger.kernel.org>; Sun,  4 Jul 2021 13:52:24 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v14so3113374lfb.4
        for <linux-doc@vger.kernel.org>; Sun, 04 Jul 2021 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kNbjhH0GpClGiRwzQUpR4hJv6EHO3XdnhQiyv1Zn4I=;
        b=DDKedwHAnd/R9xdhNG2krhsT+Nw/0E+PNH+jTyBdnlj/cEeFjebi3V2C3060Nznwiw
         vtlfihLS1N6oGS1nPJo971wzPG320Cr4ei5n8FjoPqsNRC/sBQhpBRy3FWWHn7ysHPW0
         LY6Jmq2nQLEukQRziXJban++K/Kva/xuLIO6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kNbjhH0GpClGiRwzQUpR4hJv6EHO3XdnhQiyv1Zn4I=;
        b=DjsVqsVP1zqIYUeP0tVzr4s0PtExhhzi16+ngLMnf5xF2sqC29XWUsyjcBLw/fvvpo
         +OcEqtiYs1yh+/m1Kp08t2ysVTPCJbZZxRdyc5JIcGYik9QdYeyBNIaK95gJkzDuz2uD
         Fl5cuGFv1//Yxc0cnCypDKr/fFvLDNFqoKlC8V18vWru1+DgGFQbhFkAAGbxJTRYmMF8
         AZ3a/E5k2zQ6m7goq1hzzPtI948iWw8QA0Tr/KrFpi7cZmd1B++vHsUWnwWfU6blVG9U
         ah4mRYUKeu4R4i4CrC3SIdN4knwRbJVx1+7x+zP6fTQYgNGRtrDHNpoXtPzfQv0e54Wo
         y+dw==
X-Gm-Message-State: AOAM530ia5STvNfxEV7hohM2Dri+25DxhBtyMJI8Kr0K/AtfgN/jNbTq
        Vj4N74xwJvFg4BmvkLPBg0g0VuW8ToYsIIMg
X-Google-Smtp-Source: ABdhPJy2e+rrtuhSKaFmzgQiCW3HLaoQlnhVKf7kYrkYXqg3oeaNSSCzze/BmzmK2bcjLCesL9FgmA==
X-Received: by 2002:a05:6512:110b:: with SMTP id l11mr8253690lfg.250.1625431942846;
        Sun, 04 Jul 2021 13:52:22 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id g14sm877958lfr.216.2021.07.04.13.52.22
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 13:52:22 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id f30so28697604lfj.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Jul 2021 13:52:22 -0700 (PDT)
X-Received: by 2002:ac2:42d6:: with SMTP id n22mr7866162lfl.41.1625431941847;
 Sun, 04 Jul 2021 13:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-2-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-2-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 4 Jul 2021 13:52:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com>
Message-ID: <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Sun, Jul 4, 2021 at 1:28 PM <ojeda@kernel.org> wrote:
>
>
> +       /* If zero, it is a "big" symbol, so a two byte length follows. */
> +       if (len == 0) {
> +               len = (data[0] << 8) | data[1];
> +               data += 2;
> +               off += len + 2;
> +       }

Side note: it might be a good idea at this point to verify that "len" is >255.

Also, why is this in big-endian order?

Let's just try to kill big-endian data, it's disgusting and should
just die already.

BE is practically dead anyway, we shouldn't add new cases. Networking
has legacy reasons from the bad old days when byte order wars were
still a thing, but those days are gone.

           Linus
