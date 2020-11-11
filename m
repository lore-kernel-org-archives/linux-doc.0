Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF563C388F9
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 19:23:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F54D206FB
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 19:23:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eszmSPgQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgKKTXF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Nov 2020 14:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgKKTXF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Nov 2020 14:23:05 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7E8C0613D4
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 11:23:05 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id n12so3475998ioc.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 11:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lmjn0u+3CoqX+/52WJ4IwcLKpxoCspiDsW6aAU64h0U=;
        b=eszmSPgQ8a/d41JjhcQITNhjxzSCVdQulFedcIg+p5J3equDhEXa+WfaCrVqrdNfTD
         V2FgYbWDoKRvOyQ23Md4IrKukcmBbIwwjm/IM5d/yzx470rM4HnfcRXKODMMb+bMhkUE
         toE/hWQR6HejYLWGFlLIiFP544NJ/BsGyC95I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lmjn0u+3CoqX+/52WJ4IwcLKpxoCspiDsW6aAU64h0U=;
        b=Agjh7EB7LfwbdHxIvJH/ud8SDxKV1X7R3ekq4kwEZi4VEDwhTGnujyMygVLlRGYx1h
         /oRwB6cpJeJqWG6RHv+V664oYilrFMNIBSNgrAVDaphtPOmtGIBdi7KX0Ht6WK3DTqF9
         j6d6PSNk6N7yGXsXgnzrH9MMESunN5c6EvhfsUWaFs8mLzrdPbHPYQ9D4w4km1eQFdIB
         bDvdybqciEo5xvdUfFCtf3GEl21higNaBVR3vQxQuvYvSZs6XQKXcHmdiWh2GJ34w6fQ
         IV+AMQWFRDBsG4BnZwKT8QGSf5PofIvqh7GgkeN3bCuM137fxMfz+IGB9PrzWbCyWjco
         BOMg==
X-Gm-Message-State: AOAM533jL0nR1p4+vxqk3yJGPNXvcmsCG9lCl39b/Q6jC9PdTWHiHR4h
        y2p5p4q5s5llCnRW4S1gHD6E0Q==
X-Google-Smtp-Source: ABdhPJxefe9JwPeKX4HmnPQKwjrAZ2CYikYSpLNrlNnDYChDOBXecqtIh2PHr1IIox8XYGby1PcLaA==
X-Received: by 2002:a5e:d515:: with SMTP id e21mr19879703iom.9.1605122584623;
        Wed, 11 Nov 2020 11:23:04 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c89sm1755885ilf.26.2020.11.11.11.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 11:23:03 -0800 (PST)
Subject: Re: [PATCH 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Kees Cook <keescook@chromium.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     corbet@lwn.net, peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <d265685c901ea81c83c18e218a29710317ab7670.1605027593.git.skhan@linuxfoundation.org>
 <X6r7BIG8JTUOLcY0@kroah.com> <X6r7Vl45bgGQiAD2@kroah.com>
 <202011101614.E7D880689@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3075a4fd-8615-1459-2b20-b7d9d2be34ff@linuxfoundation.org>
Date:   Wed, 11 Nov 2020 12:23:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <202011101614.E7D880689@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/10/20 5:18 PM, Kees Cook wrote:
> On Tue, Nov 10, 2020 at 09:43:02PM +0100, Greg KH wrote:
>> On Tue, Nov 10, 2020 at 09:41:40PM +0100, Greg KH wrote:
>>> On Tue, Nov 10, 2020 at 12:53:27PM -0700, Shuah Khan wrote:
>>>> +Decrement interface
>>>> +-------------------
>>>> +
>>>> +Decrements sequence number and doesn't return the new value. ::
>>>> +
>>>> +        seqnum32_dec() --> atomic_dec()
>>>> +        seqnum64_dec() --> atomic64_dec()
>>>
>>> Why would you need to decrement a sequence number?  Shouldn't they just
>>> always go up?
>>>
>>> I see you use them in your patch 12/13, but I don't think that really is
>>> a sequence number there, but rather just some other odd value :)
> 
> To that end, they should likely be internally cast to u32 and u64 (and
> why is seqnum64 ifdef on CONFIG_64BIT?).
> 

I had a reason for doing this, can't recall. I will revisit and remove
it which is ideal. I have to look at CONFIG_GENERIC_ATOMIC64 as well.

Not seeing any errors with my config which has CONFIG_64BIT=y


>> Note, other than this, I like the idea.  It makes it obvious what these
>> atomic variables are being used for, and they can't be abused for other
>> things.  Nice work.
> 

Thanks.

> Agreed: this is a clear wrapping sequence counter. It's only abuse would
> be using it in a place where wrapping actually is _not_ safe. (bikeshed:
> can we call it wrap_u32 and wrap_u64?)
> 

Still like seqnum_ops.

There is seqcount_t in seqlock.h which is a totally different feature.

thanks,
-- Shuah

