Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C95C2D0E4
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 18:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E55A2467A
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 18:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dHFgcdxT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730662AbgKQSX5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 13:23:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgKQSX4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 13:23:56 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CECC0613CF
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 10:23:56 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id s24so22150399ioj.13
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 10:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hStTG3+2TUli6PQOvC7dPwGocz2+5lnhRaphNDmsF7o=;
        b=dHFgcdxTqoVgltR0QV39GKAUWfKbMf5QfnMPG5p7waNUv+ZkA1/gneF1w6zkpH90MY
         EPdYSWFaQwMs45S/VeXDommwFjD02Nbk914rY/J4YuWDm9yOho2UJoB3kyXeiQ65+1T9
         ippsI9lSTpisSpV+93kQFB3qu0ulmT5nSov0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hStTG3+2TUli6PQOvC7dPwGocz2+5lnhRaphNDmsF7o=;
        b=JqJsaZAZzWpRWJPl54nFSUF4HFknV7dN5xYMqd7tp2j01gGbv5aDbrrnn0GepSu/11
         Pj7ewAl+PFbHpsJs77N4c4npOJIamW6ferTDwhw32aovIuxQZw7B4ORv8IPF3haqV+0h
         SsJ7ryC0JAdO231RAKKS0pYUm4zYDf/MpibeDLWzgwyt37DK4XtHP+I/lQgqeblkaWFI
         mISeb3bhaxlcty90eJ/vrqypF0CIkfwlY8STTbhBjAIdYsdQ6TE4xgf3nDO8PYK7eawA
         4huNwDp8Qc9UpwzL55szF+3f6tx1FzaIEuMMh/8SGZZEEjCoydOC25YN0hSngbtSnN5Q
         Mcgg==
X-Gm-Message-State: AOAM532xYzLZmRS5ginvHfGTD+UI+w7agLurQ7Kqv1NeZUZ2a0SXfCeC
        e2Szvov0ICpZa599eDhbUe929Q==
X-Google-Smtp-Source: ABdhPJwaX8OFMbS656oBoqafp2YHXNnFy4+skL3T48D9xTH0/h6YWfgkzADFw7Iuor466akBnnKSTQ==
X-Received: by 2002:a02:9f16:: with SMTP id z22mr4579615jal.123.1605637435780;
        Tue, 17 Nov 2020 10:23:55 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o3sm11660129ilk.27.2020.11.17.10.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 10:23:54 -0800 (PST)
Subject: Re: [PATCH v2 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Matthew Wilcox <willy@infradead.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1605287778.git.skhan@linuxfoundation.org>
 <26cbcc431be5e3ab7d8e0e881d522605a27b1312.1605287778.git.skhan@linuxfoundation.org>
 <20201113210327.GJ17076@casper.infradead.org>
 <13467f88-7e22-ce3e-60b6-44e7c3dfa7dc@linuxfoundation.org>
 <20201117173839.GO29991@casper.infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <322a050e-82dd-7a1c-07c4-279fd59f32b9@linuxfoundation.org>
Date:   Tue, 17 Nov 2020 11:23:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201117173839.GO29991@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/17/20 10:38 AM, Matthew Wilcox wrote:
> On Tue, Nov 17, 2020 at 09:34:24AM -0700, Shuah Khan wrote:
>>> seqnum_inc() should just return the new value -- seqnum_inc_return is
>>> too verbose.  And do we not need a seqnum_add()?
>>
>> I had the patch series with seqnum_inc() all ready to go and then
>> revisited the choice. My thinking is that matching the current atomic
>> api that has _inc() and inc_return() might be less confusing. That
> 
> No, it's more confusing.  I know you're converting things from using
> atomic_t, but you really need to think about this in terms of "What
> makes sense for this API".  Unless you really want to have inc that
> returns void and inc_return that returns the new value, having only
> inc_return makes no sense.
> 

I am fine with that. As I said I have a patch series saved with just
seqnum_inc() that increments and returns. I anticipated people would
have problems with seqnum_inc() that returns. :)

>> being said, I have no problems with making just _inc(). The reason
>> for 32 and 64 appended is based on comments that it including size
>> in the api makes it very clear.
> 
> By putting 32 and 64 in the name of the API, I would contend you're making
> people think about something that they should not need to think about.
> 

Are you recommending seqnum32_*() for 32bit and seqnum_*() for 64bit
which would make 64bit as a default? We have to make a distinction
for 32bit vs. 64-bit api.

>> No need for atomic_add() - inc_return() is sufficient for this use-case.
> 
> I haven't looked at the various potential users of this API, but there
> are often cases where we account, eg, number of bytes transmitted.
> 
> There are also cases where read-and-zero would be a useful operation
> to have.  I'm thinking about sampling statistics.
> 

The idea is isolating sequence number use-case first and restrict this
api for that.

thanks,
-- Shuah

