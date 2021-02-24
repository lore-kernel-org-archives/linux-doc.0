Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D18DC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 17:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C19164F0D
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 17:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234973AbhBXRSS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Feb 2021 12:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234826AbhBXRSP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Feb 2021 12:18:15 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A639C06174A
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 09:17:34 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id m11so2418870lji.10
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYBdoP96cyQRYv1FhbQIANzdHpvYhEawFInfbX+0I5I=;
        b=XBy3xiSWhvQAEAL40mALdcAlI+Cox5aPXE7tNtrbTb1YpVW3IpuFWWBvgC5jL+g2iy
         FlDJtfj6JaLPP4iOnhwtcFCGcVb+mWpT6rE21kfERoAZL5JWel8Zxj2IAj3rPtbSmtcf
         Yg8HRxeQvf5vrgfnt+SWTDiCWmYO1RPTc9INU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYBdoP96cyQRYv1FhbQIANzdHpvYhEawFInfbX+0I5I=;
        b=Yil1HIo1nCJPFVZpRrGnJbXjYXaSgh2nabqrqV6W99EoEP7nMTs9uMBEyifq6NQu2c
         9i60G7eN9cTjMxHDn3mJ7dmWiQskg6wAi81zJhmVo4O1txuL06y8E6r1nMkPioGQET3R
         kOc+vCAhnY3fbD44GDCGf7MPabUN0D4RRu4+Xdi8J0HpanrqinTXP0xPvKhbkU8PBPkF
         DM8DulTf0BwGPPtHvtGNZbqOdf41SXDASf2vSk9vgYmp0n390E842EHmEzYm5eXBnqH5
         Jb3OgNKnRGC2M7pMlAUWXuKTq9MJpvim7yRfqZyz3X5rd3Dmy71jBEVQoLVBjex6Oi43
         8U+w==
X-Gm-Message-State: AOAM530xTn0h1qT7pV8ASobP6E5qDYIIeN0XvnCsCDsAf5DKTDRlU7bf
        1so0kpknO3ph3eTrFkljTnub4YpQqkq78g==
X-Google-Smtp-Source: ABdhPJyIr6CMx1GTx3yrTLEvczGSMU+KGkkMUBuMoZ17E3jPIs6kUaN2J8g83ltoViMV9+BogLuOhw==
X-Received: by 2002:a2e:9355:: with SMTP id m21mr8495787ljh.368.1614187051656;
        Wed, 24 Feb 2021 09:17:31 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id u13sm580361lju.37.2021.02.24.09.17.30
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 09:17:30 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id c8so3244761ljd.12
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 09:17:30 -0800 (PST)
X-Received: by 2002:a2e:a306:: with SMTP id l6mr2234860lje.251.1614187050274;
 Wed, 24 Feb 2021 09:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20210224142909.2092914-1-linux@rasmusvillemoes.dk> <20210224142909.2092914-2-linux@rasmusvillemoes.dk>
In-Reply-To: <20210224142909.2092914-2-linux@rasmusvillemoes.dk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 24 Feb 2021 09:17:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgw1Eg9kDGUiEY6EL+6dTC8tVqAhstvcmUBgrF5hdoApQ@mail.gmail.com>
Message-ID: <CAHk-=wgw1Eg9kDGUiEY6EL+6dTC8tVqAhstvcmUBgrF5hdoApQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/2] init/initramfs.c: allow asynchronous unpacking
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 24, 2021 at 6:29 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> So add an initramfs_async= kernel parameter, allowing the main init
> process to proceed to handling device_initcall()s without waiting for
> populate_rootfs() to finish.

Hmm. This is why we have the whole "async_schedule()" thing (mostly
used for things like disk spin-up etc). Is there some reason you
didn't use that infrastructure?

           Linus
