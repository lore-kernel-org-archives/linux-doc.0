Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2767C43462
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 20:22:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0E0261177
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 20:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245351AbhDNUWf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 16:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhDNUWe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 16:22:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8386C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 13:22:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 12so35186540lfq.13
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 13:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6thTORuT8bN7jwK094fMT/y8sU4GZakkr5R6ovUTdHI=;
        b=UAoa76Qtsf0pbMc9IJqG9ooEMfjhEIrknCxndD8VY6cPrguml69YvPFqGmlzuBSQzh
         FrdelVohMGw/UXPitS8jaS0vYBU01i6SIHCs/u+B0uDNa1/+o7AFCQGtYFo/uY/vW9FE
         e35iod5n6V1pTvp83DTqqYHvpeFqDSO7Dx/Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6thTORuT8bN7jwK094fMT/y8sU4GZakkr5R6ovUTdHI=;
        b=SHWdMtFa9yjruouuVa4omQtwgcKhgqqV83o8sok5A/agYdzNuVHlZBcM1AI0y8UYCw
         N+Sj1QuY1IBWVyhZ6tdI0ry+eetDxWUdpQjOlu+Ef5bMPi2gnymKLeyObS/Xl0w3VMAG
         b0PEUo+WTcIvKSNLiIL+GOqISpTMNPKelbyBJav5UKB86SyEvX/e2mAo/j9ctGBGk3XK
         7TqKktFxdjFgy1LR5jE6RTmEZDdQxzhfWYVkB8L2l4K5pTwEj6jQjpSDHIPqS2W6lmlT
         +b18nOa9yJ+F1luMKgzU3wwi7oxta99O/YHAaD52KC6r5q2bUwVRuhOsy1r/CF4GAL67
         5UBQ==
X-Gm-Message-State: AOAM5322RGhA3cUMTH9xq/Azjz3ZCh/VRYrIfbv+1nnsN2RCgT80j3Ss
        4H4cO/vI9VPvhSKM3tfIlMTBgjIIBOMnchw4
X-Google-Smtp-Source: ABdhPJx/yJr6oRL8iTShsCPEECltGl/K7yW142/m/wVOUoCqfHzfQvR2Io3UaFvS/QKC9xbZE7UDSA==
X-Received: by 2002:ac2:546c:: with SMTP id e12mr12830722lfn.299.1618431729129;
        Wed, 14 Apr 2021 13:22:09 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id d7sm195963lfv.268.2021.04.14.13.22.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 13:22:08 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id z13so18290242lfd.9
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 13:22:08 -0700 (PDT)
X-Received: by 2002:a05:6512:1286:: with SMTP id u6mr16109842lfs.377.1618431727841;
 Wed, 14 Apr 2021 13:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414200953.GX2531743@casper.infradead.org>
In-Reply-To: <20210414200953.GX2531743@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 13:21:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
Message-ID: <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Matthew Wilcox <willy@infradead.org>
Cc:     ojeda@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 14, 2021 at 1:10 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> There's a philosophical point to be discussed here which you're skating
> right over!  Should rust-in-the-linux-kernel provide the same memory
> allocation APIs as the rust-standard-library, or should it provide a Rusty
> API to the standard-linux-memory-allocation APIs?

Yeah, I think that the standard Rust API may simply not be acceptable
inside the kernel, if it has similar behavior to the (completely
broken) C++ "new" operator.

So anything that does "panic!" in the normal Rust API model needs to
be (statically) caught, and never exposed as an actual call to
"panic()/BUG()" in the kernel.

So "Result<T, E>" is basically the way to go, and if the standard Rust
library alloc() model is based on "panic!" then that kind of model
must simply not be used in the kernel.

             Linus

           Linus
