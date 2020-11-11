Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50A0C4742C
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 18:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C78620797
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 18:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NdWu3R/q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgKKS2Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Nov 2020 13:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbgKKS2P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Nov 2020 13:28:15 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D47C0613D4
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 10:28:15 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id y17so2871391ilg.4
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 10:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qP0MFJQneS6o093B0Yu5YM9hNevkDE0K7N59r8X3Qgk=;
        b=NdWu3R/qDj3xIk1uD8EGdw74GeMEZbhHrtP7L0W1UogKdu5CnXplA+z6KCyeoSeFfD
         LwqFxBIz/32jJUHw7DI2JbEUfwzaOvj9inf7YQymSN9dM2zpwtKRBIgj3ASRcIhHKVQQ
         gYOrYR0mDDpOFIbqL+Y9DUJ2+8XTWQJkASUAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qP0MFJQneS6o093B0Yu5YM9hNevkDE0K7N59r8X3Qgk=;
        b=g+uSYB0c0E237bh4ueyiM1v3P9w7+K1u15CLdCoEevI20sRqZ6DIWvJUaqpOY5B2ju
         KHhZj61T2iCr5vc7hFutMapPPxP6axwbZrs/DeNwy79XbAP37LbDfp4GKPc2drSG6/on
         wha1buchBrcTpFBgktf1fACoIoKk47YuMh/NHAtSIUwb4RIpsHEeeIaKSEQ7i38QbEvD
         wflXXvZkW1NcwHHGsL0+08BMWhTw9+24/Z/VsTcpaw/mw9t+YudUQbE5vFL9ph1PRGop
         JMiMurIgb2Wk/VkXhXTHReYup+QZ8Yd2u6VJtR6tqStm1eZ6VHkrsyZ0JpQKJWsP0zy/
         +rXg==
X-Gm-Message-State: AOAM532ezUrO8zcrEFPhkoto3/IEvFxVTd7q3SVoUtOzVJs01ZaTX4kD
        Qw8QsOxOeFaqjbOo1gQRwzwbxw==
X-Google-Smtp-Source: ABdhPJzozMlBWriwx1fqAHsI5fF36/jcoQtAa9L8fGDGnYBPwHzc/1bxV/EvkmSNQ43tbU0f9kbGlA==
X-Received: by 2002:a92:c88c:: with SMTP id w12mr20906915ilo.204.1605119295155;
        Wed, 11 Nov 2020 10:28:15 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o124sm1655462ila.62.2020.11.11.10.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 10:28:14 -0800 (PST)
Subject: Re: [PATCH 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <d265685c901ea81c83c18e218a29710317ab7670.1605027593.git.skhan@linuxfoundation.org>
 <20201111082320.GR2611@hirez.programming.kicks-ass.net>
 <7207fad6-6ca4-529b-60a8-63db998d10d9@linuxfoundation.org>
 <20201111160411.GF2628@hirez.programming.kicks-ass.net>
 <3fccb8d5-825a-a283-7b7e-6193e0c90237@linuxfoundation.org>
 <20201111175031.GI2628@hirez.programming.kicks-ass.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0aed620f-911d-4715-bd41-a6b9a37862b4@linuxfoundation.org>
Date:   Wed, 11 Nov 2020 11:28:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201111175031.GI2628@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/11/20 10:50 AM, Peter Zijlstra wrote:
> On Wed, Nov 11, 2020 at 10:34:05AM -0700, Shuah Khan wrote:
> 
>> Not sure what to make of the 6080 atomic_read()s and 3413
>> atomic_inc()s, some of which might be assuming uniqueness
>> guarantee.
> 
> Well, clearly you just did: git grep atimic_{read,inc}() | wc -l and
> didn't look at the usage. Equally clearly there can be bugs. Also
> evidently much of those are not in fact sequence numbers.
> 

Looking at the usage and classifying which usages are sequence
numbers is part of may audit and we are covered. Your explanation
and this discussion helps with do a better audit of these usages.

> All I'm saying is that if you want a sequence number, inc_return (or
> fetch_inc) is the only sane option.
> 

Cool.

thanks,
-- Shuah
