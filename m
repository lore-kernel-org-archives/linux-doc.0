Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58C5C4727D
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 19:04:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4959B235FD
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 19:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g/kVwnzn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIWTEL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 15:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIWTEL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Sep 2020 15:04:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD65C0613D1
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 12:04:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t14so267273pgl.10
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N07Cl/GilBZce2Pz3gC9ZzLgKPovt2L421rI4Ys/crM=;
        b=g/kVwnznwiPFjtbSK63Tiu8j6vRqdQVDOwf93gztWd/W6C6OoBS+17yRPdI7s+AhvQ
         OKy7CPhOdUXrSYiCSwT7PN++KhJVa7EZ8HoxRqwrxnhev2lZjZ4pdKNCMENhnoYXdnaJ
         4Yf+lR1rjMrB62hAbCoG//zs5F+DCJc5z5DP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N07Cl/GilBZce2Pz3gC9ZzLgKPovt2L421rI4Ys/crM=;
        b=tg21D643mWdybB4cNdJLzGHUG4mM6tJdjNdCHp7NiJqaw7L5LB0UKgScRGbSo2vGjB
         /40dTjujIa+UOUivYicZo8rgHShhJHMY27piJLCcx3Butg/8QeJPTH3kZx7l+8E1x71r
         u64FTP875e4jQ/XL3qL7QMWFBF4hKYXKvGN4LTjFVz07s5XkvBazUTFifTmWbeaoggC8
         8FQ01DqTyRUXyh5YFAJ9ugAUOpyvvqzsGehLCz4cBBjoo8oYxQWHF/rVUNp8nIAIv+T9
         /tSU25W7lnUtSguWiihjht98sPhWnQo4oPmK/lqkw+UAIdwUGtmD00jzbA9G+B3iivsk
         zZDw==
X-Gm-Message-State: AOAM530YjJu/s6e/4vV2c9KbnQW4kV8H32F4yKSfY4xWDlH4uQAJulKB
        9xMIPFR2HELQNcHkNmIjIoAXog==
X-Google-Smtp-Source: ABdhPJw4tDznZX1pgkAiSRs41UVXOf6+TSnfIb7cggrtqBz0spL0mnRdDiw0nSpLR4MnAz0yH0W8vA==
X-Received: by 2002:a62:2b52:0:b029:142:2501:35d9 with SMTP id r79-20020a622b520000b0290142250135d9mr1158573pfr.57.1600887850574;
        Wed, 23 Sep 2020 12:04:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i25sm603978pgi.9.2020.09.23.12.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 12:04:09 -0700 (PDT)
Date:   Wed, 23 Sep 2020 12:04:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/11] counters: Introduce counter and counter_atomic
Message-ID: <202009231152.5023C4656F@keescook>
References: <cover.1600816121.git.skhan@linuxfoundation.org>
 <e57eb89132000b255b5a7952cb82725ec2f3e4e0.1600816121.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e57eb89132000b255b5a7952cb82725ec2f3e4e0.1600816121.git.skhan@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 22, 2020 at 07:43:30PM -0600, Shuah Khan wrote:
> Introduce Simple atomic and non-atomic counters.
> 
> There are a number of atomic_t usages in the kernel where atomic_t api
> is used strictly for counting and not for managing object lifetime. In
> some cases, atomic_t might not even be needed.

Thank you for working on a counter API! I'm glad to see work here,
though I have some pretty significant changes to request; see below...

> 
> The purpose of these counters is twofold: 1. clearly differentiate
> atomic_t counters from atomic_t usages that guard object lifetimes,
> hence prone to overflow and underflow errors. It allows tools that scan
> for underflow and overflow on atomic_t usages to detect overflow and
> underflows to scan just the cases that are prone to errors. 2. provides
> non-atomic counters for cases where atomic isn't necessary.
> 
> Simple atomic and non-atomic counters api provides interfaces for simple
> atomic and non-atomic counters that just count, and don't guard resource
> lifetimes. Counters will wrap around to 0 when it overflows and should
> not be used to guard resource lifetimes, device usage and open counts
> that control state changes, and pm states.
> 
> Using counter_atomic to guard lifetimes could lead to use-after free
> when it overflows and undefined behavior when used to manage state
> changes and device usage/open states.
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

I would really like these APIs to be _impossible_ to use for object
lifetime management. To that end, I would like to have all of the
*_return() functions removed. It should be strictly init, inc, dec,
read.

> +There are a number of atomic_t usages in the kernel where atomic_t api
> +is used strictly for counting and not for managing object lifetime. In
> +some cases, atomic_t might not even be needed.

Why even force the distinction? I think all the counters should be
atomic and then there is no chance they will get accidentally used in
places where someone *thinks* it's safe to use a non-atomic. So,
"_atomic" can be removed from the name and the non-atomic implementation
can get removed. Anyone already using non-atomic counters is just using
"int" and "long" anyway. Let's please only create APIs that are always
safe to use, and provide some benefit over a native time.

> +Simple atomic and non-atomic counters api provides interfaces for simple
> +atomic and non-atomic counters that just count, and don't guard resource
> +lifetimes. Counters will wrap around to 0 when it overflows and should
> +not be used to guard resource lifetimes, device usage and open counts
> +that control state changes, and pm states.
> +
> +Using counter_atomic to guard lifetimes could lead to use-after free
> +when it overflows and undefined behavior when used to manage state
> +changes and device usage/open states.
> +
> +Use refcnt_t interfaces for guarding resources.

typo: refcount_t (this typo is repeated in a few places)

> +
> +.. warning::
> +        Counter will wrap around to 0 when it overflows.
> +        Should not be used to guard resource lifetimes.
> +        Should not be used to manage device state and pm state.
> +
> +Test Counters Module and selftest
> +---------------------------------
> +
> +Please see :ref:`lib/test_counters.c <Test Counters Module>` for how to
> +use these interfaces and also test them.
> +
> +Selftest for testing:
> +:ref:`testing/selftests/lib/test_counters.sh <selftest for counters>`
> +
> +Atomic counter interfaces
> +=========================
> +
> +counter_atomic and counter_atomic_long types use atomic_t and atomic_long_t
> +underneath to leverage atomic_t api,  providing a small subset of atomic_t
> +interfaces necessary to support simple counters. ::
> +
> +        struct counter_atomic { atomic_t cnt; };
> +        struct counter_atomic_long { atomic_long_t cnt; };

"Unsized" and "Long" are both unhelpful here. If it's unsized, that
tells nothing about the counter size. And "long" changes with word size.
I think counters should either _all_ be 64-bit, or they should be
explicitly sized in their name. Either:

struct counter;  /* unsigned 64-bit, wraps back around to 0 */

or

struct counter32; /* unsigned 32-bit, wraps back around to 0 */
struct counter64; /* unsigned 64-bit, wraps back around to 0 */

> --- /dev/null
> +++ b/lib/test_counters.c
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Kernel module for testing Counters
> + *
> + * Authors:
> + *	Shuah Khan	<skhan@linuxfoundation.org>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/counters.h>
> +
> +void test_counter_atomic(void)
> +{
> +	static struct counter_atomic acnt = COUNTER_ATOMIC_INIT(0);
> +	int start_val = counter_atomic_read(&acnt);
> +	int end_val;

Please build this test using KUnit.

> +	start_val = counter_long_read(&acnt);
> +	end_val = counter_long_dec_return(&acnt);
> +	pr_info("Test read decrement and return: %ld to %ld - %s\n",
> +		start_val, end_val,
> +		((start_val-1 == end_val) ? "PASS" : "FAIL"));

I also see a lot of copy/paste patterns here. These should all use a
common helper.

-- 
Kees Cook
