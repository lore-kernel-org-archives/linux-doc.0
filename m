Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23670C5519F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 16:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD98F216FD
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 16:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b6ZpgqQn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgKLQ7F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 11:59:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgKLQ7F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 11:59:05 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F38C0613D1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2020 08:59:04 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id n5so5896872ile.7
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2020 08:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GaO4q7T8iJjRlcnl93QU8Zwl4O2C359DE1W1JVxhVXg=;
        b=b6ZpgqQnIUqlYhaFnT3Ou7QD+FXOKHPByYy3RWrr8gsAroJlielBkL6YYndoXMh3g9
         rsjP4Q/9ungxcBW4afCFKkZ3DEqZc2DfXzcE6yNqYA/dlPR4s5WscDWRFqtt7kW0K/4I
         9kFdYw8H985FGwCp0eLFZs0/YexMY4qyt6qHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GaO4q7T8iJjRlcnl93QU8Zwl4O2C359DE1W1JVxhVXg=;
        b=UzYhyxYu5IEsUAhHM2cGWpjhK4jO01iOVPulxbJLafjNEtd2Fb1xuHdARIefgEkTMQ
         y7PtPvIsay0I98IduWe1qlu0XzzRZ+S+l6ALmSesphtrlhhpxRONdkGevjmRLz5oF3W7
         elEjaEQmP0LgfjmxF2VZ632GparW7T6EDhcrRPNTOL4z+EvUmmG83O+uSY+ZRKMS3yO2
         CS5z5WbZ0z552DrbjOPUoX0O4go1XnBz88BRxCLHlFO5aM2bNfaWWqulERHN5LafsXQV
         YrdrcR/vqOvF5zJT2kiCinBboroFW/wA8EO2dnpOk5Nf7a6sUoilslzyG/zDXJe2l0qN
         h+zA==
X-Gm-Message-State: AOAM530j4u9Jis3wwtWBaygbJFP8OiIwfM31oKzrGgJQNTIdHuQ/0wpq
        FQF6KQNklxTjbParW3yucpS7DeGF5DfGyw==
X-Google-Smtp-Source: ABdhPJwN6Vf5B+ZH0aq7fuoCQ9TKbzlvtMLLvd38lE9BKuuu/XpeqkLpsg3KNdrzb27u9aqnoM3T+Q==
X-Received: by 2002:a05:6e02:931:: with SMTP id o17mr328192ilt.273.1605200344286;
        Thu, 12 Nov 2020 08:59:04 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j10sm2983083iop.34.2020.11.12.08.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 08:59:03 -0800 (PST)
Subject: Re: [PATCH 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Kees Cook <keescook@chromium.org>, corbet@lwn.net,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <d265685c901ea81c83c18e218a29710317ab7670.1605027593.git.skhan@linuxfoundation.org>
 <X6r7BIG8JTUOLcY0@kroah.com> <X6r7Vl45bgGQiAD2@kroah.com>
 <202011101614.E7D880689@keescook>
 <3075a4fd-8615-1459-2b20-b7d9d2be34ff@linuxfoundation.org>
 <20201112123621.GY17076@casper.infradead.org>
 <acad8c18-a0a6-f52c-429a-02e614bee05c@linuxfoundation.org>
 <X61mwRe6tFrSrgQa@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <c20dc33b-3163-b7cf-fdd0-12c30e07ecc0@linuxfoundation.org>
Date:   Thu, 12 Nov 2020 09:59:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <X61mwRe6tFrSrgQa@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/12/20 9:45 AM, Greg KH wrote:
> On Thu, Nov 12, 2020 at 09:17:27AM -0700, Shuah Khan wrote:
>> On 11/12/20 5:36 AM, Matthew Wilcox wrote:
>>> On Wed, Nov 11, 2020 at 12:23:03PM -0700, Shuah Khan wrote:
>>>>> Agreed: this is a clear wrapping sequence counter. It's only abuse would
>>>>> be using it in a place where wrapping actually is _not_ safe. (bikeshed:
>>>>> can we call it wrap_u32 and wrap_u64?)
>>>>
>>>> Still like seqnum_ops.
>>>>
>>>> There is seqcount_t in seqlock.h which is a totally different feature.
>>>
>>> Yes, and that's why this new thing, whatever it is called should not
>>> have the word "sequence" in it.  People will get it confused.
>>
>> Any suggestions for name. I am bad with coming up with names. How does
>> Statcnt API and struct statcnt along the lines of your name suggestions
>> in your previous email?
> 
> What does "stat" mean here?
> 

Stat doesn't really reflect what we are trying to do here and sequence
does. I am just looking to address confusion if any and make a call.

> And I don't understand the hesitation about "sequence" in a name, as
> that's exactly what this is.  seqlock is different, yes.
>  > How about "seqnum_t"?  That's what we call the sequence number that we
> export to uevents, a "SEQNUM".
> 

Good point.
This is what we have currently in patch v1 and let's just go with it.

thanks,
-- Shuah





