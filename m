Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049D9C2D0E4
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 16:34:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F85216C4
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 16:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VFL2449H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgKQQea (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 11:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgKQQe3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 11:34:29 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DEAC0613CF
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 08:34:29 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id w10so4820969ilq.5
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 08:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RqplN2MiH2RjrN8xmsMKxzO1axkoRnoqOLkoBb/frOA=;
        b=VFL2449HKDpbkT2SJgPuvTAvv3Cqpu1i8x/oHlk9UGYPr2pCkqDpashemizpuoBxLT
         UkTLFs5Lkn9jzbTTDQnKHWomHDRI3U3xEbwB6A5UjqGPkNzJMwPgWLwmRKYbgRUfoLd/
         2m3jnnW4g2b9Vl5Dkv631xzB0zy6fTk4acBjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RqplN2MiH2RjrN8xmsMKxzO1axkoRnoqOLkoBb/frOA=;
        b=F52FbmI6GLLdGjceSa4n9APL2REZrPrDHy8hR6cQHIpof4Rg7ruD5QrY2gE5sTKW2N
         MUXEFeZdW72k1a07nChwy83RjNkdwo3AoSYE4TjB3Ho17ZTO+U1zK6sNpWDOSFlzKDIl
         Q22rASGsVv2QKYY8szv617soEZtXe8ILpgCA3uryW5Y/Qyz/Gwc/+R91YJc4M7HZpEN0
         5wqVvhPI3xLZhpBvskTWxmvn9rL81aPVqbW2HSACTI/DLjuIkQpDwrd1OZC2aVQHOT6S
         8jnhweKFREzqelZAvW2Rf7eZL9CI/vFy2hPpD699Zhlhb3U0lePD5fsqqQRgRxkRQEDT
         xkIA==
X-Gm-Message-State: AOAM5321TqHs9Zk7WqaKqIkAbuT8Eo+0QnVOxgKyCiSAE82A4oONo8bN
        m6QdiFgYGpcyETK/5qQxe2lvRg==
X-Google-Smtp-Source: ABdhPJw/mA/iYQQSv4k/JHfC31cbAasPx1/IXtRaSmWLoORQI1uHOTMDjYnK1igIhgEr3YUPsnjFjw==
X-Received: by 2002:a92:5b8c:: with SMTP id c12mr13558561ilg.293.1605630867532;
        Tue, 17 Nov 2020 08:34:27 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x25sm9425546ioa.23.2020.11.17.08.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 08:34:26 -0800 (PST)
Subject: Re: [PATCH v2 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Matthew Wilcox <willy@infradead.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1605287778.git.skhan@linuxfoundation.org>
 <26cbcc431be5e3ab7d8e0e881d522605a27b1312.1605287778.git.skhan@linuxfoundation.org>
 <20201113210327.GJ17076@casper.infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <13467f88-7e22-ce3e-60b6-44e7c3dfa7dc@linuxfoundation.org>
Date:   Tue, 17 Nov 2020 09:34:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201113210327.GJ17076@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/13/20 2:03 PM, Matthew Wilcox wrote:
>> +==========================
>> +Sequence Number Operations
>> +==========================
>> +
>> +:Author: Shuah Khan
>> +:Copyright: |copy| 2020, The Linux Foundation
>> +:Copyright: |copy| 2020, Shuah Khan <skhan@linuxfoundation.org>
>> +
>> +Sequence Number api provides interfaces for unsigned up counters
>> +leveraging atomic_t and atomic64_t ops underneath.
> 
> As I said last time you posted this, the documentation is all
> back-to-front.  You're describing what it isn't, not what it is.
>

I will rephrase it to read better.

>> +There are a number of atomic_t usages in the kernel where atomic_t api
>> +is used for counting sequence numbers and other statistical counters.
>> +Several of these usages, convert atomic_read() and atomic_inc_return()
>> +return values to unsigned. Introducing sequence number ops supports
>> +these use-cases with a standard core-api.
>> +
>> +The atomic_t api provides a wide range of atomic operations as a base
>> +api to implement atomic counters, bitops, spinlock interfaces. The usages
>> +also evolved into being used for resource lifetimes and state management.
>> +The refcount_t api was introduced to address resource lifetime problems
>> +related to atomic_t wrapping. There is a large overlap between the
>> +atomic_t api used for resource lifetimes and just counters, stats, and
>> +sequence numbers. It has become difficult to differentiate between the
>> +atomic_t usages that should be converted to refcount_t and the ones that
>> +can be left alone. Introducing seqnum_ops to wrap the usages that are
>> +stats, counters, sequence numbers makes it easier for tools that scan
>> +for underflow and overflow on atomic_t usages to detect overflow and
>> +underflows to scan just the cases that are prone to errors.
>> +
>> +In addition, to supporting sequence number use-cases, Sequence Number Ops
>> +helps differentiate atomic_t counter usages from atomic_t usages that guard
>> +object lifetimes, hence prone to overflow and underflow errors from up
>> +counting use-cases.
> 
> I think almost all of this information should go into atomic_ops.rst
> pushing people towards using the other APIs instead of atomic_t.
> Someone who already landed here doesn't want to read about refcount_t.
> They want to know what a seqnum_t is and how to use it.
> 

Looks like this is resolved with atomic_ops.rst is now gone.

>> +Sequence Number Ops
>> +===================
>> +
>> +seqnum32 and seqnum64 types use atomic_t and atomic64_t underneath to
> 
> Don't talk about the implementation.
> 
>> +leverage atomic_t api, to provide increment by 1 and return new value
>> +and fetch current value interfaces necessary to support unsigned up
>> +counters. ::
>> +
>> +        struct seqnum32 { atomic_t seqnum; };
>> +        struct seqnum64 { atomic64_t seqnum; };
>> +
>> +Please see :ref:`Documentation/core-api/atomic_ops.rst <atomic_ops>` for
>> +information on the Semantics and Behavior of Atomic operations.
>> +
>> +Initializers
>> +------------
>> +
>> +Interfaces for initializing sequence numbers are write operations which
>> +in turn invoke their ``ATOMIC_INIT() and atomic_set()`` counterparts ::
>> +
>> +        #define SEQNUM_INIT(i)    { .seqnum = ATOMIC_INIT(i) }
>> +        seqnum32_init() --> atomic_set() to 0
>> +        seqnum64_init() --> atomic64_set() to 0
>> +
>> +Increment interface
>> +-------------------
>> +
>> +Increments sequence number and returns the new value. ::
>> +
>> +        seqnum32_inc_return() --> (u32) atomic_inc_return(seqnum)
>> +        seqnum64_inc_return() --> (u64) atomic64_inc_return(seqnum)
> 
> seqnum_inc() should just return the new value -- seqnum_inc_return is
> too verbose.  And do we not need a seqnum_add()?
> 

I had the patch series with seqnum_inc() all ready to go and then
revisited the choice. My thinking is that matching the current atomic
api that has _inc() and inc_return() might be less confusing. That
being said, I have no problems with making just _inc(). The reason
for 32 and 64 appended is based on comments that it including size
in the api makes it very clear.

No need for atomic_add() - inc_return() is sufficient for this use-case.

> Also, this would be a good point to talk about behaviour on overflow.
> 

I can add some overflow information.

thanks,
-- Shuah

