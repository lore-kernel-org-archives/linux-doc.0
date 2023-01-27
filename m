Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29629C38142
	for <linux-doc@archiver.kernel.org>; Fri, 27 Jan 2023 23:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjA0XtT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Jan 2023 18:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjA0XtS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 18:49:18 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9858784FA2
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 15:49:17 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id g16so2978203ilr.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 15:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U82QSz4+U84WxJAv5AOeZHi+Nv+t9W488aQxHAi4MfI=;
        b=GYJAPsuouZscCL5o7baIs2C1YXAC6QFhQiV+KUv1CbaLFmdzMODgqqMSpqfFXhHiCz
         l5P0bPCwfgnW2pCqS5Jyd+mu690xZz6W3SbmGWgW0p+zKhh1gAxmJeLZreiIEScAaIlh
         Qothlg1jXn8jZYGmRaYeUHG8zp4zkwp9iyT4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U82QSz4+U84WxJAv5AOeZHi+Nv+t9W488aQxHAi4MfI=;
        b=npy9lv4mmQ6lPZy/PKdAyJfYGh0S1zEi3NDzkxcCbXQvmHPZ4B6jrL10L7c8UxKSG0
         echfsKYzZGg3RacFYm+aUu0kR5uK1UhFMspuA4COotLI7l5sr1+ObXxwAUOJtV5HWSP0
         BySn54LeyscbI26hFWnw5aLbb5yUXaXgV0/q8vP9nlLFwf5hsFQWEvo/dUMJqyS0xeeX
         H3VFT+9E2afj2Dg9jrdvSXRb72CwTqECAksvqahwWcn2YTMaK9VyDWLlc/wB41gn5Ijw
         V5kjcHlP2rhxI31cEzbjj8UI/APLQ3hryBfMCvcnX+wSZe2bTg/deoV557X0EAPJlnWx
         Hz9g==
X-Gm-Message-State: AO0yUKWFbQLGBAARPsWsoFpKo6lKvdj3ctwqB4LbjserEXYqiGjQm7I2
        IoT436+t9gOvNkirFwQxvGiq9w==
X-Google-Smtp-Source: AK7set/5rL1ZWD/4GChUwZWhgeB7xoK8dGE9qFyGcrngeVcRaArqc/3GCftQ0aify7WUd+ie+onZMQ==
X-Received: by 2002:a05:6e02:54c:b0:310:57cd:2728 with SMTP id i12-20020a056e02054c00b0031057cd2728mr2534240ils.3.1674863356965;
        Fri, 27 Jan 2023 15:49:16 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id t16-20020a92ca90000000b0030f3bdd1f24sm872696ilo.61.2023.01.27.15.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 15:49:16 -0800 (PST)
Message-ID: <8d2f86cb-5dd1-4291-cbeb-2c9f72f9ed0b@linuxfoundation.org>
Date:   Fri, 27 Jan 2023 16:49:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] docs: add workload-tracing document to admin-guide
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     sshefali021@gmail.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230127165440.19158-1-skhan@linuxfoundation.org>
 <87bkmj99yv.fsf@meer.lwn.net>
 <063c51c3-c276-3b68-f130-db0751b35d42@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <063c51c3-c276-3b68-f130-db0751b35d42@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/27/23 12:18, Shuah Khan wrote:
> On 1/27/23 10:13, Jonathan Corbet wrote:
>> Shuah Khan <skhan@linuxfoundation.org> writes:
>>
>>> Add a new section to the admin-guide with information of interest to
>>> application developers and system integrators doing analysis of the
>>> Linux kernel for safety critical applications.
>>>
>>> This section will contain documents supporting analysis of kernel
>>> interactions with applications, and key kernel subsystems expectations.
>>>
>>> Add a new workload-tracing document to this new section.
>>>
>>> Signed-off-by: Shefali Sharma <sshefali021@gmail.com>
>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>> ---
>>>   Documentation/admin-guide/index.rst           |  11 +
>>>   .../admin-guide/workload-tracing.rst          | 486 ++++++++++++++++++
>>>   2 files changed, 497 insertions(+)
>>>   create mode 100644 Documentation/admin-guide/workload-tracing.rst
>>
>> This seems like generally good stuff, thanks.  I have a few nits...
> 
> Thanks for the review.
> 

Cleaned it up and sent you v2. Odd. checkpatch.pl didn't catch long
lines in the document. I was so focused on verifying the html doc,
I totally missed the cut & pasted long lines. Anyway it is all fixed
now in v2.

thanks,
-- Shuah

