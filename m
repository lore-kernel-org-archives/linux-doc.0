Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93874C5519F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 21:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19DDC22241
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 21:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a4nIvoFd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbgKLV1y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 16:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbgKLV1w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 16:27:52 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A53C0613D4
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2020 13:27:52 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id z2so6606108ilh.11
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2020 13:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pe7knPPM6RlQRiyKkqHKowghuuy1LIXCQskVBXm8l/4=;
        b=a4nIvoFdd07r8vUOoQfGfMWVPK1O+s3ylwqh1FSBwKi2gBJxL5iI84Bw5zkNhxJo8E
         T4Jrb7aWCnL5uxBa9duWfo71MKj5BAxPTy5Q8BQ+32pTQ6T1TenQNbH+Fh9FjL5m60PJ
         wC2dzl66KcrD9IwOc3RwQZnssW2HnC1AhmnSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pe7knPPM6RlQRiyKkqHKowghuuy1LIXCQskVBXm8l/4=;
        b=kGTMzQQjcpmNBynFRyBivdXuTwdo5xxXYGf6dr4FXoZMwX9LVZ1UuojnBSQqIzzpxD
         3uD09DWHz91jnjpOP8/BUGjAc5LnJ6mOnHEV+KHrFGu/m+hJp6nJiz7+e7/TWiPYiNef
         +Jlqnoq4OLXB8hQFkZO8/IPr6H6kzSUSkEZzVGyK5bohROZq/dd/gna1blrmvrtVYSMW
         v98RAlswFFA8iV5meapC4Tf2RLNswDGxtcNhNsmqnFeleFw8qXahkI6rAZqID5QGIOGi
         UVpfjvpjxz/gDnv8DjkXhzLYJzmsqceaErz+IEl4OFLsJKEUQpiLziuwYtaZmBb76ODW
         1Z6A==
X-Gm-Message-State: AOAM530hEZA8UCrUj+CSKYiaDN8GcA7vxrEYCQ1kG02I4FRrmnwTjUjj
        grVCCM0pRyvTvO+bOXXBDD5RpEA+UWg8mQ==
X-Google-Smtp-Source: ABdhPJwrPDF8nlrvD3hxuIrtrSQDWQIdi9vBTbEo2An0oCHD8zWfGIs/vBLQ26UesmiscVzXPhKAPw==
X-Received: by 2002:a92:ba8c:: with SMTP id t12mr1184674ill.243.1605216471357;
        Thu, 12 Nov 2020 13:27:51 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d14sm3525098ila.42.2020.11.12.13.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 13:27:50 -0800 (PST)
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
 <3075a4fd-8615-1459-2b20-b7d9d2be34ff@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f2b3ae49-bc41-0061-e811-1a7e41040366@linuxfoundation.org>
Date:   Thu, 12 Nov 2020 14:27:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <3075a4fd-8615-1459-2b20-b7d9d2be34ff@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/11/20 12:23 PM, Shuah Khan wrote:
> On 11/10/20 5:18 PM, Kees Cook wrote:
>> On Tue, Nov 10, 2020 at 09:43:02PM +0100, Greg KH wrote:
>>> On Tue, Nov 10, 2020 at 09:41:40PM +0100, Greg KH wrote:
>>>> On Tue, Nov 10, 2020 at 12:53:27PM -0700, Shuah Khan wrote:
>>>>> +Decrement interface
>>>>> +-------------------
>>>>> +
>>>>> +Decrements sequence number and doesn't return the new value. ::
>>>>> +
>>>>> +        seqnum32_dec() --> atomic_dec()
>>>>> +        seqnum64_dec() --> atomic64_dec()
>>>>
>>>> Why would you need to decrement a sequence number?  Shouldn't they just
>>>> always go up?
>>>>
>>>> I see you use them in your patch 12/13, but I don't think that 
>>>> really is
>>>> a sequence number there, but rather just some other odd value :)
>>
>> To that end, they should likely be internally cast to u32 and u64 (and
>> why is seqnum64 ifdef on CONFIG_64BIT?).
>>
> 

atomic64_t depends on CONFIG_64BIT

include/linux/types.h

#ifdef CONFIG_64BIT
typedef struct {
         s64 counter;
} atomic64_t;
#endif

thanks,
-- Shuah

