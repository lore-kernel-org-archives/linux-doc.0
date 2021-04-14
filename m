Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03553C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:19:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D90C66113B
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353262AbhDNTUG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353281AbhDNTUC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 15:20:02 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBC6C061756
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:19:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id n8so35137948lfh.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2NCuqqnTNRZqz4gVa7VmF8X9q5BSGA2MnI49n6bMs7A=;
        b=dCmT2JevlN2Um24EUlGKuB1noKIv7ps6g0KvoFc8NO7f9Egls/Mith+iaPjQtsQfnr
         V3m5Niy5LYKZYm6IIrt5kn+7wbQBG2dzlRjqlgBgfDXYfOc9ZchG7DC8UHzaS3kiP/3M
         I5Wq5Fh4vLEyyOX6IyyZ6+LRoWZP+OivJSbUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NCuqqnTNRZqz4gVa7VmF8X9q5BSGA2MnI49n6bMs7A=;
        b=snD1GnAa2Plo8Qz94oAlsD3M7pzA15gJbMJrT8pJwA0pGiY1EbhKEawIvCgkggo16M
         OyMP3Brwx6ZdIVuztDf7L4mFar115Ty4ujIHykCBxFHPTtkQWesLCs9EtUkCddzTWXp3
         dRsokcgoKale1EvRbbQbARMUwQdB7NRd5sLhDl6jt5En7vA993EbLdsFFAZKGKbwNAkJ
         HjLb3UqCA4w0oSvLNCPoM5vDDJK0OeB7sDnvLhnFcgkvIaANQ+o8wAhylIABZjE2IZEE
         z2HxeEblXlhnN4oUGPGVVQaQWGGi9jKxguJdOMwDz/S5CakepwjlbRfGk+iIJYp3+rV+
         dHBw==
X-Gm-Message-State: AOAM533JXAnjQutIEiiruCQOwM0EMkl+BwGaY4mdLyvaDx3uV/l17ihR
        wvJLsGPa+XUaB4hTLQvMo6hJgNMYqW3XE7td
X-Google-Smtp-Source: ABdhPJxkH4Lg9dnfOQDDRk4im/cQC1k6cVDhXJXo0hdIY54dY878eospTU8igB8hhqbrUzC1aOc5JA==
X-Received: by 2002:ac2:5e22:: with SMTP id o2mr15849578lfg.341.1618427978376;
        Wed, 14 Apr 2021 12:19:38 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id d15sm149405lfm.247.2021.04.14.12.19.36
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:19:37 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id j18so35096697lfg.5
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:19:36 -0700 (PDT)
X-Received: by 2002:a05:6512:31c7:: with SMTP id j7mr18301122lfe.41.1618427976755;
 Wed, 14 Apr 2021 12:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-6-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-6-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:19:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJvJJtd2mpYpx5+zn_hPrSOqGqi-Pxb7e+h+anhsLnQg@mail.gmail.com>
Message-ID: <CAHk-=wgJvJJtd2mpYpx5+zn_hPrSOqGqi-Pxb7e+h+anhsLnQg@mail.gmail.com>
Subject: Re: [PATCH 05/13] Rust: Compiler builtins crate
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
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 14, 2021 at 11:46 AM <ojeda@kernel.org> wrote:
>
> We also need a helpers C source file to contain some forwarders
> to C macros and inlined functions. For the moment, we only need it
> to call the `BUG()` macro, but we will be adding more later.

Not being a Rust person, I can only guess based on random pattern
matching, but this _looks_ like these "panicking intrinsics" panic at
run-time (by calling BUG()).

Is there some way these things could cause built-time link errors
instead, so that if somebody uses 128-bit shifts, or floating point
ops in the rust code, they show up as build failures, not as run-time
ones?

Hmm?

          Linus
