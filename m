Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79CAC61DA4
	for <linux-doc@archiver.kernel.org>; Thu,  2 Feb 2023 19:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbjBBTNI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 14:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjBBTNH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 14:13:07 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754897D9A
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 11:13:01 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id m15so1170920ilh.9
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 11:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sze4SPkyx71GgTTpWniQiWnzfqpKfnGfdRyUcgKtQxI=;
        b=P1iCtDSmhy7TDXIs4AHa31OwJPsSNlFkjffGNkhdzZac6S4KXHJhIw/yUKu21tcahe
         MSVFuy8acefJgAVI8EFxdSOnbM7cGVKF5IeQQlt0hz1c22uykcdaVQyvFJm2cqXeYNdn
         1xvJVsPAhKf+/aWWN7s7OMbvg7e8LhI5GCqfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sze4SPkyx71GgTTpWniQiWnzfqpKfnGfdRyUcgKtQxI=;
        b=zFj5JUZkT4WS1aBp4xqPlTaBDy6YvH+rqrYMLknTpjnlzTLOQIoD71fFgj6aiQQLhX
         864ksmjuC/O+scifb8DHTxdXdl72qM9Ct0+7zpfIkiIzHpq81FJFU6NGVxYJIaslt/xY
         u5l5wFM+k2KtOI2dzpmKA+Irh/CtBVvYN2XBC0dY5Wxmi0esgoXX67Tdx3lILMW/WQOj
         kIJBenaJIlDdBWLMDp7s6dFAqXCeuj6yoZmHZmqIzkvCK6ZLwy5lpd8oJCJzq5qzG4GR
         m7NUT75TiwuyydsWtCg4e5rjun3hPe0FpVyB5Wq6VWE7mmABaAp9XqsbIU5/6sEDuvPW
         4jZg==
X-Gm-Message-State: AO0yUKUnqzVgCxDkungbvASdCwSzxSO5NBWtczAr72+4neLuO6pDECCA
        9Gq6q5B722nE0yUnn6CZz5DEJg==
X-Google-Smtp-Source: AK7set/S3fSxSa2iWklBy+crpw5U360y/+JVsFZvjT2X4u/YMtdF4l70hlyn6wVLEqhsnhZHTl01Sw==
X-Received: by 2002:a05:6e02:1746:b0:30d:bf1a:b174 with SMTP id y6-20020a056e02174600b0030dbf1ab174mr6291143ill.1.1675365180398;
        Thu, 02 Feb 2023 11:13:00 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id ch14-20020a0566383e8e00b00388660ca27dsm179623jab.4.2023.02.02.11.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 11:12:59 -0800 (PST)
Message-ID: <7d8f7371-6ca9-cb4b-5e82-2b2a21ee8ab8@linuxfoundation.org>
Date:   Thu, 2 Feb 2023 12:12:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3] docs: add workload-tracing document to admin-guide
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     sshefali021@gmail.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230131221105.39216-1-skhan@linuxfoundation.org>
 <87edr8vu8q.fsf@meer.lwn.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87edr8vu8q.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/2/23 10:43, Jonathan Corbet wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> Add a new section to the admin-guide with information of interest to
>> application developers and system integrators doing analysis of the
>> Linux kernel for safety critical applications.
>>
>> This section will contain documents supporting analysis of kernel
>> interactions with applications, and key kernel subsystems expectations.
>>
>> Add a new workload-tracing document to this new section.
>>
>> Signed-off-by: Shefali Sharma <sshefali021@gmail.com>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>> Changes since v2: Addressed review comments on v2
>>
>>   Documentation/admin-guide/index.rst           |  11 +
>>   .../admin-guide/workload-tracing.rst          | 605 ++++++++++++++++++
>>   2 files changed, 616 insertions(+)
>>   create mode 100644 Documentation/admin-guide/workload-tracing.rst
> 
> I've applied this with a couple of sphinx tweaks, including:
> 

>> +.. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
>> +
>> +Discovering Linux kernel subsystems used by a workload
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> 
> This doesn't follow our normal conventions, so I made it:
> 
>> ======================================================
>> Discovering Linux kernel subsystems used by a workload
>> ======================================================
> 
> Instead.
> 

Thank you.

-- Shuah

