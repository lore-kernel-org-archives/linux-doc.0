Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3849C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  1 May 2021 09:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D7B66141E
	for <linux-doc@archiver.kernel.org>; Sat,  1 May 2021 09:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhEAJbY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 1 May 2021 05:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbhEAJbX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 May 2021 05:31:23 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A4AC06138B;
        Sat,  1 May 2021 02:30:31 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id l10-20020a17090a850ab0290155b06f6267so2992125pjn.5;
        Sat, 01 May 2021 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ozGWR7HUiB8PmJLBAJ188PKLUOh7dBweE/9zGbN2Zp0=;
        b=D/0vPlgJu5jfqBOMQb50lihexlAJcQUP3pR3XMPv4HFKDZYb0SJapZVJ/gkmpAY8TG
         PyqPT9PUsuY5+PRiuEIMkfFVa21wyRDP2Pzb+NcG0GI7fQ7JOom2ex00qPbddZLHsoXL
         ckoFnKo9WAj563lpWcxYGf3SXQcLZUuOvRHmH8t5DnnODQ6ZIdpQ+2qJcm2KPuEjPR0n
         AI2ghO+t6CLTwfnhl7EDL5y5FyzjED2pRzPgEgSjBxJ8wgk2QpG07MnVQ6KI20afJ4VK
         o5Iq7bSCzkKekZFiGm8fYsq8aro5AtmnUKVvR2SDcx1kIOc6eqkw4CvoEyy3jBP9d/Sv
         vRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ozGWR7HUiB8PmJLBAJ188PKLUOh7dBweE/9zGbN2Zp0=;
        b=hGe1Pmz2mtoimFv446qByRriQt+joJEbiCE4Xy3DVsDLyZxuw3vJNBG/i9cFcN80Bs
         6zkpNVNsQtOeQ8akWT54lztxlt7SZgtJ4poUjFLMWINCzpl/m3MV1sDeK2cEYW2cTrXd
         jKJTmtkLTk0KHWiBdHi/Ddq+MYtvHWBL3WTlXEmtjHXyKisTeazsECxslKHo9/RXIL2/
         EYlYgFP2weAFbncR0UVQAhfJgEV8UywVsD2fAE0jBQzr7SHwn3q7UTLoJen651Oly2R8
         S5x5arRg38JWQKFsZsB9b/s62zXrBYgGGydcb89VglTzA8o8QFrvD10HUdmr8a7887lG
         rnZA==
X-Gm-Message-State: AOAM5330PHiBTdUv0b78WVTj9Covx52RmBuus3Onnq9UvCet9mI4TsdN
        xYGuGogbvRPZc7MDXSWKelgkJtip54qsBQ==
X-Google-Smtp-Source: ABdhPJwpm/0pMCfrGPM5UL4PfA3nBMBiph5MjUiyi4zHNxdxrqGxDn+fiDlj+fil1VWEFSLBopugoA==
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr20434639pjr.179.1619861430361;
        Sat, 01 May 2021 02:30:30 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:4bc:4b06:bb39:6fa2? ([2405:201:600d:a089:4bc:4b06:bb39:6fa2])
        by smtp.gmail.com with ESMTPSA id ms2sm453915pjb.8.2021.05.01.02.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 May 2021 02:30:30 -0700 (PDT)
Subject: Re: [RFC v3] scripts: kernel-doc: reduce repeated regex expressions
 into variables
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     lukas.bulwahn@gmail.com, willy@infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210427165633.GA235567@casper.infradead.org>
 <20210429063729.8144-1-yashsri421@gmail.com> <8735v8d5ja.fsf@meer.lwn.net>
From:   Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <99186604-8ed6-ff72-0308-9ca788db3a51@gmail.com>
Date:   Sat, 1 May 2021 15:00:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8735v8d5ja.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/4/21 5:09 am, Jonathan Corbet wrote:
> Aditya Srivastava <yashsri421@gmail.com> writes:
> 
>> There are some regex expressions in the kernel-doc script, which are used
>> repeatedly in the script.
>>
>> Reduce such expressions into variables, which can be used everywhere.
>>
>> A quick manual check found that no errors and warnings were added/removed
>> in this process.
>>
>> Suggested-by: Jonathan Corbet <corbet@lwn.net>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>> Changes in v3:
>> - Remove variables for separate qualifiers in "sub dump_struct"
>> - Make a common variable for all the qualifiers
>> - Make $attribute global variable to use it at "sub check_sections" as well
>>
>> Changes in v2:
>> - Rename $pointer_function to $function_pointer
>> - Combine elsif-block expressions at "sub dump_function" into lesser regex expressions
>> - Combine $prototype_end1,$prototype_end2 expressions into a common $prototype_end
>>
>>  scripts/kernel-doc | 71 ++++++++++++++++++++++------------------------
>>  1 file changed, 34 insertions(+), 37 deletions(-)
> 
> So this looks good but ... it adds a warning to the build:
> 
> /stuff/k/git/kernel/Documentation/driver-api/media/v4l2-controls:823: ./include/media/v4l2-ctrls.h:964: WARNING: Invalid C declaration: Expected identifier in nested name. [error at 6]
>   const * v4l2_ctrl_get_menu (u32 id)
>   ------^
> 
> So it looks like something isn't being parsed quite identically?
>

Hi Jonathan!
I could not reproduce this error..
Can you suggest me how can I reproduce this error?
I ran kernel-doc -none {$file} over the tree.

Probably, this is not a kernel-doc error

Thanks
Aditya
