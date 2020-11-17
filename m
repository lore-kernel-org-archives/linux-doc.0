Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE709C63697
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 16:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96CD02467A
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 16:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RqPHXFKC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbgKQQPl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 11:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbgKQQPi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 11:15:38 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2148CC0617A6
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 08:15:37 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id s10so21755090ioe.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 08:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xs5k6YmbTpMovlIFJB8mdshUmOv20DI0EOKiJyCm2p8=;
        b=RqPHXFKC0r07EUj3VDcH44zvE4ccrWVVfCttCRK9UoI2TgwDNQBdZdboesMHvSaobF
         j3xKWyla3OTvIL3oWpC/u07BBWaqSRKc1aKdihR5KaniKEhFtrFRTsxIVDeVza93G12C
         Nc4ZAWQPtwO1+lCH+Tu9yc+kZnCSKCadNtqV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xs5k6YmbTpMovlIFJB8mdshUmOv20DI0EOKiJyCm2p8=;
        b=rXqbO8zJfjTRk2/Ru2sgcmVD0++vmnB7LSMM/JDtV3Uyg5GrG8N7BY7b+lwJtpELfY
         OHyQE5eV2XUZ02NVcOZqrGpxNjHcZ1xHuuZMWbnjkKZlU/aRc+QO43Gvfk+ZA54G2xFZ
         DwIp9I7iMNBJA7SZaIdu6qTbGlNqdzQJRiFrGYU69/9SD/PPwzFF+077ySQi2QdZmLkF
         l/f9ONL31BfGutLXASIB80H5uvvIX0yfQDAcdZjyy7Io8j+4IADkbWC0Zjjat4lbnnoP
         UxGGpDVlAD68ArKyMUVORdh52JBQIKdjnNcmLvF6PzfjTWwrcWL9BeOI2gvLpKWAburq
         C4yg==
X-Gm-Message-State: AOAM5336UlgtawWggfugbqLBTs0OfNjHgy6qK1ePrgEnNU5dluSZxHJn
        2V9RanLiBgVtBymbqBRHbUxVTw==
X-Google-Smtp-Source: ABdhPJzPxtjW4UEbWguV0tGH3zB08KjlVyyfqkpm6Q82roW+c92WTHp3RBzgnBHcoeKGOPtNlA9tXg==
X-Received: by 2002:a6b:fb07:: with SMTP id h7mr12048193iog.163.1605629736300;
        Tue, 17 Nov 2020 08:15:36 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y3sm10847573ioq.18.2020.11.17.08.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 08:15:35 -0800 (PST)
Subject: Re: [PATCH v2 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org
References: <cover.1605287778.git.skhan@linuxfoundation.org>
 <26cbcc431be5e3ab7d8e0e881d522605a27b1312.1605287778.git.skhan@linuxfoundation.org>
 <20201116145309.GF3121378@hirez.programming.kicks-ass.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <105a8806-7a44-1b1e-f77c-4471cc9e1f17@linuxfoundation.org>
Date:   Tue, 17 Nov 2020 09:15:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201116145309.GF3121378@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/16/20 7:53 AM, Peter Zijlstra wrote:
> On Fri, Nov 13, 2020 at 10:46:03AM -0700, Shuah Khan wrote:
> 
>> +Increment interface
>> +-------------------
>> +
>> +Increments sequence number and returns the new value. ::
>> +
>> +        seqnum32_inc_return() --> (u32) atomic_inc_return(seqnum)
>> +        seqnum64_inc_return() --> (u64) atomic64_inc_return(seqnum)
> 
> Did you think about the ordering?
> 

Looking at atomic_t.txt _inc_return() can be fully ordered without
loosing or making the intermediate state visible. This is good for
this sequence number use-case. Is there something I am overlooking?

>> +Fetch interface
>> +---------------
>> +
>> +Fetched and returns current sequence number value. ::
>> +
>> +        seqnum32_fetch() --> (u32) atomic_add_return(0, seqnum)
>> +        seqnum64_fetch() --> (u64) atomic64_add_return(0, seqnum)
> 
> That's horrible. Please explain how that is not broken garbage.
> 
> Per the fact that it is atomic, nothing prevents the counter being
> incremented concurrently. There is no such thing as a 'current' sequence
> number.
> 

Correct. Some usages of this _fecth() in this patch series are for
printing sequence numbers in debug message and others are stats.

I will review the patches in this series and drop the ones that use
read/fetch - the reason being sequence numbers are strictly up counters
and don't need read/fetch.

thanks,
-- Shuah





