Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 051087D581
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 20:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbeIZCVq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 22:21:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35096 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbeIZCVq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 22:21:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id o16so11336209wrx.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Sep 2018 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KD68OO+Zb8yNT0w8I5hNpU0qCH3+ExU40WmiuRcgeRo=;
        b=X9az/ZJOX1sLQP8M2TIj2losjHqznGeV/ki94HxOy/5ekO4rfs/cA/CVt/ULTPD9kB
         5ckH+v5AKBxhoTE1MFxU+6pG2ZU3DhR4NTDWBYD4ACon93jbORPlqKfqZl/YeKYhL8Is
         kJc90YmrwEttTsKpqdSdJUT3AjeEr4MNCSoW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KD68OO+Zb8yNT0w8I5hNpU0qCH3+ExU40WmiuRcgeRo=;
        b=nKxAR62ihQyMr3hX10nxHzt4+nBkfInKcSXMoGvGtnrV+q+Q8DrMXHsvrA5QA+QLSO
         lMHLoEV+5nr45GltVb9WnBMsv3qmlrFnj6R0BxVExFVGacoo5OFVXCxAucBbQ50dy2V/
         0+AKHm7rVyUqr8YVdtJ0E9kLM6jHF/IW7yEbLjY8oC/cwl6zfjisR6GY2VtsCZCnKJit
         7mHFufI6fAwg18CJwIAFIDHcy/gE9yC+j2DPLeMrdkDmG9deUJq0bZ93EeqiuSaFM+wA
         GiEmsuXdgvv+SKIE753xNJwZuDj+FTuw61+zpZ0l8lmcWyxAQY0VRrtHqdYi+Pq3C5Nd
         EvaA==
X-Gm-Message-State: ABuFfoh8mDserpGq1BMYHKvmkrENIK318GY5/St1VhIYARgwiF1NV+JK
        7/mwYOD/l/fD8caNjRM5c5i/hA==
X-Google-Smtp-Source: ACcGV60OqFoavW+v4tDJ6TV48WmE7122ILnvjvGMFWlfHWEreh8Pj+XUlHZXxF0/nzPQGvLLcvplHA==
X-Received: by 2002:adf:ff08:: with SMTP id k8-v6mr2604535wrr.15.1537906351050;
        Tue, 25 Sep 2018 13:12:31 -0700 (PDT)
Received: from [192.168.0.41] (251.150.136.77.rev.sfr.net. [77.136.150.251])
        by smtp.googlemail.com with ESMTPSA id u12-v6sm2840653wrs.48.2018.09.25.13.12.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Sep 2018 13:12:30 -0700 (PDT)
Subject: Re: [PATCH v7 05/24] clocksource: Add a new timer-ingenic driver
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Mathieu Malaterre <malat@debian.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        linux-watchdog@vger.kernel.org, od@zcrc.me,
        linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org
References: <5baa3fa9.1c69fb81.4c7b7.19fdSMTPIN_ADDED_MISSING@mx.google.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <346cb95c-f9ce-f19b-30f3-75e9fb379290@linaro.org>
Date:   Tue, 25 Sep 2018 22:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5baa3fa9.1c69fb81.4c7b7.19fdSMTPIN_ADDED_MISSING@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25/09/2018 15:38, Paul Cercueil wrote:
> 
> Le 24 sept. 2018 9:14 AM, Daniel Lezcano <daniel.lezcano@linaro.org> a écrit :
>>
>> On 24/09/2018 08:53, Paul Cercueil wrote: 
>>>
>>> Le 24 sept. 2018 07:58, Daniel Lezcano <daniel.lezcano@linaro.org> a écrit : 
>>>>
>>>> On 24/09/2018 07:49, Paul Cercueil wrote: 
>>>>>
>>>>> Le 24 sept. 2018 07:35, Daniel Lezcano <daniel.lezcano@linaro.org> a 
>>>>> écrit : 
>>>>>>
>>>>>> On 24/09/2018 07:24, Paul Cercueil wrote: 
>>>>>>> Hi Daniel, 
>>>>>>>
>>>>>>> Le 24 sept. 2018 05:12, Daniel Lezcano 
>>>>>>> <daniel.lezcano@linaro.org> a écrit : 
>>>>>>>>
>>>>>>>> On 21/08/2018 19:16, Paul Cercueil wrote: 
>>>>>>>>> This driver handles the TCU (Timer Counter Unit) present on 
>>>>>>>>> the Ingenic JZ47xx SoCs, and provides the kernel with a 
>>>>>>>>> system timer, and optionally with a clocksource and a 
>>>>>>>>> sched_clock. 
>>>>>>>>>
>>>>>>>>> It also provides clocks and interrupt handling to client 
>>>>>>>>> drivers. 
>>>>>>>>
>>>>>>>> Can you provide a much more complete description of the timer 
>>>>>>>> in order to make my life easier for the review of this patch? 
>>>>>>>
>>>>>>> See patch [03/24], it adds a doc file that describes the 
>>>>>>> hardware. 
>>>>>>
>>>>>> Thanks, I went through but it is incomplete to understand what the 
>>>>>> timer do. I will reverse-engineer the code but it would help if you 
>>>>>> can give the gross approach. Why multiple channels ? mutexes and 
>>>>>> completion ? 
>>>>>
>>>>> Much of the complexity is because of the multi-purpose nature of the 
>>>>> TCU channels. Each one can be used as timer/clocksource, or PWM. 
>>>>>
>>>>> The driver starts by using channels 0 and 1 as system timer and 
>>>>> clocksource, respectively, the other ones being unused for now. Then, 
>>>>> *if* the PWM driver requests one of the channels in use by the 
>>>>> timer/clocksource driver, say channel 0, the timer/clocksource driver 
>>>>> will dynamically reassign the system timer to a free channel, from 
>>>>> channel 0 to e.g. channel 2. Only in that case the completion/mutex 
>>>>> are actually used. 
>>>>
>>>> Why do you need to do this? Can't be the channels dedicated and reserved 
>>>> for clocksource and clockevent? 
>>>
>>> That's what I had in place (ingenic,timer-channel and ingenic,clocksource-channel DT properties), but Rob didn't want any linux-specific properties in the devicetree binding :( 
>>
>> Isn't possible to specify the channel to use in the DT? like renesas16 ? 
> 
> That's what I did in V6 (and before), but Rob did not want me to add properties for Linux-specific concepts such as clocksource.

Hmm, I remember something like that, yes but I did a delete of the
previous version when you posted the v7. Can you give a pointer to its
answer ?



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

