Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA29C388F9
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 17:34:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85AAA2072C
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 17:34:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RPGnXMov"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgKKReI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Nov 2020 12:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgKKReH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Nov 2020 12:34:07 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED34C0613D4
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 09:34:07 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id o11so3068895ioo.11
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 09:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x+ZPIkewGIyEZqSMZxkzFb7eDMb8iLSX2JxWgENS124=;
        b=RPGnXMovCFux6DPWtNZll3p5WD/5MIG0O1M0Ddi5GmAaZhBPkCQX3w+xN1lF9COB5E
         l23astO6NnwIHkEudqwKqfzveu2eHSQI1LYNabs2/VIapZ8M+htKlJWreJQ0U+xhS26X
         s3K4a/EVxmMeqy3bb6jJu0gYlk9B8DKvqJAfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x+ZPIkewGIyEZqSMZxkzFb7eDMb8iLSX2JxWgENS124=;
        b=KUniGjHEvb3sYMilmFGdC/EA68TFFjkdst5mr9uzvDRUU+HqdpGgHb2hdcjgeihRfE
         rp0pRX01X44vHMQiXUEx3M6wZD2VVVTPrjRW6wg4tM73m8oCL7P99mozIfzk9L6f9ia2
         rKV1c66fffT+dKBfVYTR63d/FmhgyT8ROJCBzasl8wdwc4wCFFO2c3GmMjsG0rmbhJAo
         h1CEZNTsNDng201IIl1m4vuC6SZNhZEe9FYP0laYuRAlOZuXmaMgHNtq/3JOMTZs1Qox
         3yjEJkj5etOGvY99pbNlcAn9UOEuTYWpMBOuD9UUaApVWdxw2CNw814jjG0g1XpaHseE
         L8nQ==
X-Gm-Message-State: AOAM533OWPKyUUXRa25KUOA7VexjSVUefV/bzDARqvr77eSavyGLCmJd
        GLoOGVN2PNKi8dGeuGVJj2+nrA==
X-Google-Smtp-Source: ABdhPJwNf8L4kqcjShlFmCr/CVIXtDb2BUdeXRUd5wep5sqvAJ4Zu8Fu8DJir5l/g0orc03wtylz3A==
X-Received: by 2002:a05:6602:242e:: with SMTP id g14mr19440875iob.65.1605116046781;
        Wed, 11 Nov 2020 09:34:06 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u1sm1609915ili.55.2020.11.11.09.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 09:34:06 -0800 (PST)
Subject: Re: [PATCH 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <d265685c901ea81c83c18e218a29710317ab7670.1605027593.git.skhan@linuxfoundation.org>
 <20201111082320.GR2611@hirez.programming.kicks-ass.net>
 <7207fad6-6ca4-529b-60a8-63db998d10d9@linuxfoundation.org>
 <20201111160411.GF2628@hirez.programming.kicks-ass.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3fccb8d5-825a-a283-7b7e-6193e0c90237@linuxfoundation.org>
Date:   Wed, 11 Nov 2020 10:34:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201111160411.GF2628@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/11/20 9:04 AM, Peter Zijlstra wrote:
> On Wed, Nov 11, 2020 at 08:56:49AM -0700, Shuah Khan wrote:
> 
>> Why would you say no to read and inc?
> 
> Because they don't guarantee uniqueness (bar wrapping), which is the
> only reason to use an atomic to begin with.
> 

Thanks for the explanation. I see what you are saying.

Not sure what to make of the 6080 atomic_read()s and 3413
atomic_inc()s, some of which might be assuming uniqueness
guarantee.

As far as the sequence number api is concerned, I am with you on
not exposing read() and inc().

inc()s can just map to inc_return().

For read():
In the context of up counters, there is a definitely a need for get
current value type interface that guarantees uniqueness - similar to
inc_return without actually incrementing.

I will work on v2 based on the discussion.

thanks,
-- Shuah

