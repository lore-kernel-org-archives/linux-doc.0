Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4123FC43461
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15CDB60FF0
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbhDNTbx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353394AbhDNTbv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 15:31:51 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B22C061760
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:31:29 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g8so35124828lfv.12
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8tmkl21nBTrgg+zi0wiLnvNOnvLGFNGElqoYB3gSO4k=;
        b=fcsPK/9hZwnNtEOdCgJlxw05JK+JnScQC6KTDZz/6X9MVaflY6Jqqe4mj4BbDYGIn6
         D5cRaqLVGf110aJOYDRuUskjfvklEd0pqbbD6FIOHNNLHu3Y3CC1Te8apRSktxKYlGWX
         ozpACYQ9P5BsjDg3WbdRsGj5aS6Iw1MmwYSsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8tmkl21nBTrgg+zi0wiLnvNOnvLGFNGElqoYB3gSO4k=;
        b=G4h3EqAxfTYXoGPhOqZeFx3WDHrEZA45ke1GRngf+xxz87/bFOSa+NNNPClQh3BG6o
         lcmYXGiPWGF7y8x/jLEBXzFJoCIdxpipa9D6K4IJH/BdQSzIAgM8bOITkZpL21BTASt1
         TPiKqbZ2v9v/omMVBHHzC0OeaqAAd3Q4pNHgq6Y3/vvzunvv0IO6tVlY51/i0I7AKxta
         WI2Xda/IPmOpBCR69qk8hDDz8xwFt9we7NXhRIgIpDPx+A5+QEgPL5uUb7IsNXR3hNG3
         EB8liJQdQQIp2YS5SdtvGWpzol0crL4a1tN1cKKIf0/Cf33Dt0OO+5eKaMSZwxo1BOYQ
         LL7A==
X-Gm-Message-State: AOAM531H551G/3gJ5VrITpFG8Xl2vypBH0d36oFei4DkdmeOsVY7Du+z
        2smz+dSuIfRs1pNuOYn8y6zJMG/cgJYxPZsw
X-Google-Smtp-Source: ABdhPJyUJpF6E4uAeMh1BNaGndxAKyzm+BijDrmZgPcFO+q5Amq3NX9aucXQLx/owDNL7SPs1t2xkw==
X-Received: by 2002:ac2:43bc:: with SMTP id t28mr6733262lfl.318.1618428687666;
        Wed, 14 Apr 2021 12:31:27 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id a20sm156436lfl.211.2021.04.14.12.31.26
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:31:26 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id z8so24485302ljm.12
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:31:26 -0700 (PDT)
X-Received: by 2002:a2e:8893:: with SMTP id k19mr9184503lji.465.1618428685906;
 Wed, 14 Apr 2021 12:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-8-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-8-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:31:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVY56LzwV_G075NEFwsdf-p7GOTy_cB7-UU9b=49rB1g@mail.gmail.com>
Message-ID: <CAHk-=wiVY56LzwV_G075NEFwsdf-p7GOTy_cB7-UU9b=49rB1g@mail.gmail.com>
Subject: Re: [PATCH 07/13] Rust: Kernel crate
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
>
> +#[alloc_error_handler]
> +fn oom(_layout: Layout) -> ! {
> +    panic!("Out of memory!");
> +}
> +
> +#[no_mangle]
> +pub fn __rust_alloc_error_handler(_size: usize, _align: usize) -> ! {
> +    panic!("Out of memory!");
> +}

Again, excuse my lack of internal Rust knowledge, but when do these
end up being an issue?

If the Rust compiler ends up doing hidden allocations, and they then
cause panics, then one of the main *points* of Rustification is
entirely broken. That's 100% the opposite of being memory-safe at
build time.

An allocation failure in some random driver must never ever be
something that the compiler just turns into a panic. It must be
something that is caught and handled synchronously and results in an
ENOMEM error return.

So the fact that the core patches have these kinds of

    panic!("Out of memory!");

things in them as part of just the support infrastructure makes me go
"Yeah, that's fundamentally wrong".

And if this is some default that is called only when the Rust code
doesn't have error handling, then once again - I think it needs to be
a *build-time* failure, not a runtime one. Because having unsafe code
that will cause a panic only under very special situations that are
hard to trigger is about the worst possible case.

             Linus
