Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677DBC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Feb 2022 18:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbiB1Stt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Feb 2022 13:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbiB1Stt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Feb 2022 13:49:49 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DB122B0F
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 10:49:09 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id u20so23006789lff.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+acwbp8IAqy4EQhdzrRR6UrvnBSYJWdfAOCkLBEf6s=;
        b=LvJ51tK8OGXmUdrq1FTGfGhAU7kyWg6aDacet+/T6m1xcdm96SFLNin6cqkfGY+rbg
         A+4gdF9QL3th8X1CIPS6F2KrwGpjUcAkZFh2wMRAAEhyIS9gK5hzhXTjv7RRLGY5VhDN
         /ORnVKar4p0KNDioI7O/8vsyY3PJ0BwGF0c/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+acwbp8IAqy4EQhdzrRR6UrvnBSYJWdfAOCkLBEf6s=;
        b=7BhnVVMl0NtqPzmyk/WHGfnJTOi/d3Fr64djJsWBVnNA4M9o3rcp2ppcp0gC7Zbdgr
         DPzQI+pf4HqfQP7RbYoa4lLpXYX4Es8ZuFQ4mPWIbQ3ZG9hKaZHGJVLDUqBqLMv2W0tU
         k+OHeYjAQz6EB9MCCoMmdBfnzjucXNFU5YJ2+eLPDp3Qs0XU0kENKycQj9F7OjzQYwHr
         8XDRHQO74H7I04lmkYm3urFhKcLnDbMQbShDMEcVNRWKLVzZxCO3E/s9I5pNNvKj2Uig
         AI/kR5VS7gMBatJ5pr4VZJDbrE9Dhp90f1wFG0BkFaGA1WO/CocUddVkqxe8JejmSAB2
         4k5w==
X-Gm-Message-State: AOAM532Z983So6c2f3/zpPzvJmKQFFhy4JkIvTnRJYSB47Tn+b73ODhc
        oQju0obEpxzUztVBgXOEqmKj1zLw8fHdrUHf1wg=
X-Google-Smtp-Source: ABdhPJzK3PC4VfnMPJKiBmUHiMdnRBJXzGZ7K52sZyA7DIVpcMNXg3nUjxQJ12Pt7UeUFomJ4HOBrQ==
X-Received: by 2002:a19:3801:0:b0:444:150b:9ef5 with SMTP id f1-20020a193801000000b00444150b9ef5mr12898081lfa.523.1646074147283;
        Mon, 28 Feb 2022 10:49:07 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id m5-20020a195205000000b004433d027ce1sm1080343lfb.227.2022.02.28.10.49.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 10:49:07 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id j15so22936627lfe.11
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 10:49:07 -0800 (PST)
X-Received: by 2002:ac2:4c8c:0:b0:445:6c26:3cff with SMTP id
 d12-20020ac24c8c000000b004456c263cffmr13670491lfl.435.1646073655129; Mon, 28
 Feb 2022 10:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
 <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
In-Reply-To: <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Feb 2022 10:40:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjU+DCbFG4nd3Wne-KbQ1n5=BHynv3xEmRYTaayBj-EfQ@mail.gmail.com>
Message-ID: <CAHk-=wjU+DCbFG4nd3Wne-KbQ1n5=BHynv3xEmRYTaayBj-EfQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
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
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-btrfs <linux-btrfs@vger.kernel.org>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 28, 2022 at 3:37 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I think the KBUILD_USERCFLAGS portion and the modpost.c fix for it
> make sense regardless of the -std=gnu11 change

I do think they make sense, but I want to note again that people doing
cross builds obviously use different tools for user builds than for
the kernel. In fact, even not cross-building, we've had situations
where the "kbuild" compiler is different from the host compiler,
because people have upgraded one but not the other (upgrading the
kernel build environment is actually much easier than upgrading the
host build environment, because you don't need all the random
libraries etc, and you can literally _just_ build your own gcc and
binutils)

And we have *not* necessarily required that the host tools match the
kernel tools.

So I could well imagine that there are people who build their kernels,
but their host build environment might be old enough that -std=gnu11
is problematic for that part.

And note how any change to  KBUILD_USERCFLAGS is reflected in KBUILD_HOSTCFLAGS.

So I would suggest that the KBUILD_USERCFLAGS part of the patch (and
the modpost.c change that goes with it) be done as a separate commit.
Because we might end up reverting that part.

Hmm?

           Linus
