Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B90617DD31
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 16:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753205AbeC1QZy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 12:25:54 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:40462 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753198AbeC1QZv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 12:25:51 -0400
Received: by mail-wm0-f65.google.com with SMTP id x4so6408242wmh.5
        for <linux-doc@vger.kernel.org>; Wed, 28 Mar 2018 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BXKDMJG3JeCpej2WnLf9wqzx5IMUXIkH5dpeKYi6VvU=;
        b=A20CcuINqjOypQe/pFrKhZYvabm2UxnSDgnRiva6XUEAR+ZyZ+mQaVtMD+yO5lG6t9
         4+3E9VugFKPMnQ8b6u8MwEZl5BJqhersmE6zIS8ALIo6fGZXq1WdRj9teM6Mq8VdWIUd
         E8ncp85Nntir3428iWSF9UdoN1Cz9VnhcTYpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BXKDMJG3JeCpej2WnLf9wqzx5IMUXIkH5dpeKYi6VvU=;
        b=H80/IlhnuL0VSaW1Y2/SBFIQAnVNS1pxU/Ocb5sQDTu8QVkXGnFDLcs0eGA1t7/lTO
         aD7at1PMmL3CJ6ZANBz2Gxqv5ZSjrvkH3lYWKbuliDfDgtAWDo+oMu8bt7X0dEIKcOJ+
         MkYcpfWOpjHHidXlLWJHRlJpWRS0O8568a2WVl4an3kYNMcNzoi6yQz49jr/8LKGs2q6
         GneCBMifDkh/I18CbYu37tF+/LELlvE8w6KCj0VXMNhhGRZEL0LFxV5j//vT7kSRR5da
         bLF17lirMNLe+MLzsdDMiKyZMzWP4pqIO7AJ/zPfkYaaDwvgqG0VO8nr3CzozbJfBOU3
         TaqA==
X-Gm-Message-State: AElRT7GDf5HUyXXSakMQgGV/O0RQH51260a7Jr9GuvV0tpmqJeIqUFyb
        JXtyRsunH8hx0fklxu2e8Inf0TnR8Eg=
X-Google-Smtp-Source: AIpwx48VNu4+BWNyeezFgHKTTr3sNGMJ2dFhw03oSKkfdoc75R8eqZxgHf6m+FKrnt4WpiHF+Gajuw==
X-Received: by 10.28.134.203 with SMTP id i194mr3525664wmd.114.1522254349714;
        Wed, 28 Mar 2018 09:25:49 -0700 (PDT)
Received: from ?IPv6:2001:41d0:fe90:b800:b0a9:da92:8c72:d9e2? ([2001:41d0:fe90:b800:b0a9:da92:8c72:d9e2])
        by smtp.googlemail.com with ESMTPSA id e27sm7813448wre.86.2018.03.28.09.25.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Mar 2018 09:25:48 -0700 (PDT)
Subject: Re: [PATCH v4 7/8] clocksource: Add a new timer-ingenic driver
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Maarten ter Huurne <maarten@treewalker.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
        linux-doc@vger.kernel.org
References: <20180110224838.16711-2-paul@crapouillou.net>
 <20180317232901.14129-1-paul@crapouillou.net>
 <20180317232901.14129-8-paul@crapouillou.net>
 <a8d28b2b-4e40-83b9-d65e-beecbd36ad33@linaro.org>
 <06976e4ae275c4cc0bddacc5e0c0c9a9@crapouillou.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <af33e522-7f87-d62a-0a35-d56a403387b7@linaro.org>
Date:   Wed, 28 Mar 2018 18:25:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <06976e4ae275c4cc0bddacc5e0c0c9a9@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/03/2018 17:15, Paul Cercueil wrote:
> Le 2018-03-24 07:26, Daniel Lezcano a écrit :
>> On 18/03/2018 00:29, Paul Cercueil wrote:
>>> This driver will use the TCU (Timer Counter Unit) present on the Ingenic
>>> JZ47xx SoCs to provide the kernel with a clocksource and timers.
>>
>> Please provide a more detailed description about the timer.
> 
> There's a doc file for that :)

Usually, when there is a new driver I ask for a description in the
changelog for reference.

>> Where is the clocksource ?
> 
> Right, there is no clocksource, just timers.
> 
>> I don't see the point of using channel idx and pwm checking here.
>>
>> There is one clockevent, why create multiple channels ? Can't you stick
>> to the usual init routine for a timer.
> 
> So the idea is that we use all the TCU channels that won't be used for PWM
> as timers. Hence the PWM checking. Why is this bad?

It is not bad but arguable. By checking the channels used by the pwm in
the code, you introduce an adherence between two subsystems even if it
is just related to the DT parsing part.

As it is not needed to have more than one timer in the time framework
(at least with the same characteristics), the pwm channels check is
pointless. We can assume the author of the DT file is smart enough to
prevent conflicts and define a pwm and a timer properly instead of
adding more code complexity.

In addition, simplifying the code will allow you to use the timer-of
code and reduce very significantly the init function.

>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>> ---
>>>  drivers/clocksource/Kconfig         |   8 ++
>>>  drivers/clocksource/Makefile        |   1 +
>>>  drivers/clocksource/timer-ingenic.c | 278
>>> ++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 287 insertions(+)
>>>  create mode 100644 drivers/clocksource/timer-ingenic.c
>>>
>>>  v2: Use SPDX identifier for the license
>>>  v3: - Move documentation to its own patch
>>>      - Search the devicetree for PWM clients, and use all the TCU
>>>        channels that won't be used for PWM
>>>  v4: - Add documentation about why we search for PWM clients
>>>      - Verify that the PWM clients are for the TCU PWM driver
>>>
>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>> index d2e5382821a4..481422145fb4 100644
>>> --- a/drivers/clocksource/Kconfig
>>> +++ b/drivers/clocksource/Kconfig
>>> @@ -592,4 +592,12 @@ config CLKSRC_ST_LPC
>>>        Enable this option to use the Low Power controller timer
>>>        as clocksource.
>>>
>>> +config INGENIC_TIMER
>>> +    bool "Clocksource/timer using the TCU in Ingenic JZ SoCs"
>>> +    depends on MACH_INGENIC || COMPILE_TEST
>>
>> bool "Clocksource/timer using the TCU in Ingenic JZ SoCs" if COMPILE_TEST
>>
>> Remove the depends MACH_INGENIC.
> 
> This driver is not useful on anything else than Ingenic SoCs, why should I
> remove MACH_INGENIC then?

For COMPILE_TEST on x86.

>>> +    select CLKSRC_OF
>>> +    default y
>>
>> No default, Kconfig platform selects the timer.
> 
> Alright.
[ ... ]

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
