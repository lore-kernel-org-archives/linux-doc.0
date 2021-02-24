Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E645C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 22:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45DD960233
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 22:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhBXWNr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Feb 2021 17:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhBXWNq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Feb 2021 17:13:46 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C6CC061574
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 14:13:05 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id p2so4441151edm.12
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 14:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UApUAr5aUTGGANGV03dJ/EdX6/gNj/uFRxv6Z3ZwiG0=;
        b=G6HRa4tFcZ0icwERNU3bqShT2VGAE/aZGrPJoUnJL5qp74veH/6YOuZuvIKcykMntc
         JnmPUMoTcSxU/MmG51Xe8HDAO8lJNMd91/F+awStb+fncySkfGCR2mwee5a1i3tVX4bI
         y76QGMcKJHpiYN+N/Gg8UnLbdqNurSaNJxaeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UApUAr5aUTGGANGV03dJ/EdX6/gNj/uFRxv6Z3ZwiG0=;
        b=RkBRjnTTDceEAuulKHgnBP44cw7L3VnoeL2OiSrRynks7MhDUl0QFjlhhjw468RRqo
         N59aF9mecLKy1R3wcEzS2XNUDC2D1DYg903jpEZ24e97fM+Jet80xpP9mJrt0Ltivgvr
         fptuVuDwCqlD+vooltrmnY7MERWBwhfYBTWGGJI1njnCj+sWAxKMZc8R8BtIBYi93Te9
         OHd6jJCw4D/aBTWCMVhx+4mkaiU4lFOr00AX9d2iTf1XzuEqOUWoINWP3ggrZeJUgkL+
         KTVZW5pK3QZtMrb7XX5iURHb3c39nqUmcWQGSUGKvTsYYt2eCc+UXOzLXaUXOAi/9jFz
         RnhQ==
X-Gm-Message-State: AOAM531nCGP+ZD2uzX2E+bi37nZ/Z4lbINzU1p6OqMfKp6LECQtIe3/w
        LvylOWtSQpBvj7ge5tnMw9Si+Q==
X-Google-Smtp-Source: ABdhPJw31JmQb2U9hxnSi1tck9ojUKV8GQUw8l1du2a/V8uNEtS3qLmPrUahlUzGXGZnhyIVyExpxw==
X-Received: by 2002:a05:6402:1151:: with SMTP id g17mr35223342edw.48.1614204783891;
        Wed, 24 Feb 2021 14:13:03 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id lu26sm404186ejb.33.2021.02.24.14.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 14:13:03 -0800 (PST)
Subject: Re: [PATCH/RFC 1/2] init/initramfs.c: allow asynchronous unpacking
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210224142909.2092914-1-linux@rasmusvillemoes.dk>
 <20210224142909.2092914-2-linux@rasmusvillemoes.dk>
 <CAHk-=wgw1Eg9kDGUiEY6EL+6dTC8tVqAhstvcmUBgrF5hdoApQ@mail.gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <8ccfae21-c72a-f00e-8ec1-56ed809e3295@rasmusvillemoes.dk>
Date:   Wed, 24 Feb 2021 23:13:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgw1Eg9kDGUiEY6EL+6dTC8tVqAhstvcmUBgrF5hdoApQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/02/2021 18.17, Linus Torvalds wrote:
> On Wed, Feb 24, 2021 at 6:29 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> So add an initramfs_async= kernel parameter, allowing the main init
>> process to proceed to handling device_initcall()s without waiting for
>> populate_rootfs() to finish.
> 
> Hmm. This is why we have the whole "async_schedule()" thing (mostly
> used for things like disk spin-up etc). Is there some reason you
> didn't use that infrastructure?

Mostly because I completely forgot it existed, it's not an API you
stumble upon in every other source file.

I guess I could use that, but it would look very much like what I have
now - there'd still be some function to call to make sure the initramfs
is ready, only that would then do async_synchronize() instead of
wait_for_completion().

Is there some fundamental reason something like this shouldn't be
doable? Are there places other than the usermodehelper and firmware
loading (and obviously right-before-opening /dev/console and exec'ing
/init) that would need to be taught about this?

Rasmus
