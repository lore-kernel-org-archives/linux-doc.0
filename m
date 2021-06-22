Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F60C2B9F4
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 20:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 099726128C
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 20:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhFVUyQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhFVUyP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 16:54:15 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406ABC061574
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 13:51:59 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id d7so642282edx.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZY3YaHE10SpvWGlFOYAiGNFzyBoBoxG7r17DT+vqrXQ=;
        b=Lkkzz8xgvR4WijuDgBCSmNfFcjiHP1ZaGCOPnAYe06FmobkuzmkXtqFUhxHgxT8y8a
         s1e8UekMvWi4xMuXwtVNTsCjRDv+ZvIcJ/sAUbcjE4pCaFOmcM2dvYClmlB/fadIxAUP
         ooLWq5/OVVj4Jl2ULqLpOazUlV7XgDMzD+j8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZY3YaHE10SpvWGlFOYAiGNFzyBoBoxG7r17DT+vqrXQ=;
        b=tIufTGWpJzlGvctkOjOyBQNRtKcoOYHqhzXliZNegeSOYh7CAbUNTt7DVEjMViYzu+
         6TUuw5tfUzo77AW1AYh39kaEnz7qwJ6kn5QfGcOqqXURaWEX93NCfds1gPFukip+8vO4
         QbrdYFOEo72Kd/sKT/3bOAOvyRBLDvw1LY45XQsdSWQcYRqD4cOFT6ghAtFcfQrTzWPu
         PdW2IbNMqRV0IAfXAHYAN97dcM77x92MfciTh/PTWo4qZPTpFwV7yHXN8U3FzLwqzzbr
         E+A2v1QDtuILA6nlkNTmas2DZu9TYqaljCgJHPxBbMsBTISK03eJAZfWD+KAHO8m9m+x
         NoyQ==
X-Gm-Message-State: AOAM531iLSBtP9ERtQz8D73GrkS9k7QMFKI0lRZpNC1/86yH3o8dKTcG
        VrdJasro+VItZb1N99c4W4jKmw==
X-Google-Smtp-Source: ABdhPJx9zQm41CmxJvLsDsSorsOThIixs2MfsXafuymEJPCWCUufv3lIBA9vynUopa82psJxXTYfFA==
X-Received: by 2002:a05:6402:34c6:: with SMTP id w6mr7851532edc.174.1624395117905;
        Tue, 22 Jun 2021 13:51:57 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.64.110])
        by smtp.gmail.com with ESMTPSA id g16sm6356357ejh.92.2021.06.22.13.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:51:57 -0700 (PDT)
Subject: Re: [PATCH v5 4/4] lib/test_printf.c: add test cases for '%pD'
To:     Jia He <justin.he@arm.com>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Christoph Hellwig <hch@infradead.org>, nd@arm.com
References: <20210622140634.2436-1-justin.he@arm.com>
 <20210622140634.2436-5-justin.he@arm.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <03f59e85-bba3-2e2c-ebaa-48daa93d6fec@rasmusvillemoes.dk>
Date:   Tue, 22 Jun 2021 22:51:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210622140634.2436-5-justin.he@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22/06/2021 16.06, Jia He wrote:
> After the behaviour of specifier '%pD' is changed to print the full path
> of struct file, the related test cases are also updated.
> 
> Given the full path string of '%pD' is prepended from the end of the scratch
> buffer, the check of "wrote beyond the nul-terminator" should be skipped
> for '%pD'.
> 
> Parameterize the new using_scratch_space in __test, do_test to skip the
> test case mentioned above,

I actually prefer the first suggestion of just having a file-global bool.

If and when we get other checks that need to be done selectively [e.g.
"snprintf into a too short buffer produces a prefix of the full string",
which also came up during this discussion but was ultimately kept]
depending on the %<whatever> being exercised, we can add a "u32 nocheck"
with a bunch of bits saying what to elide.

Not insisting either way, just my $0.02.

Rasmus
