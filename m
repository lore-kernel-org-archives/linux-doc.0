Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 497687E677
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 11:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754248AbeCGLmy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 06:42:54 -0500
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36213 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754153AbeCGLmw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 06:42:52 -0500
Received: by mail-wm0-f66.google.com with SMTP id 188so4115225wme.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Mar 2018 03:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SGYEJ2GdA93cPIHnM4ofAPrDzbnSQgKIWDNz5mA2x1w=;
        b=P5CG+p47vsQvgH/AGYN4NItmuOWbI6tPYcfG8q1dv0rYe9WXxt7wz+yLvLUc+hYeDr
         bVFut03zIjIhQJ0x1CmJ3AnA8RAWIMNs6G6EiuxP7n2IgXm0UgJ1TxjCgd4w1KAhc358
         Gh/yvPgFtTdUWfJz8/WeTrhoK3GOT6OB78SaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SGYEJ2GdA93cPIHnM4ofAPrDzbnSQgKIWDNz5mA2x1w=;
        b=G1d5TocnMsqn52YGEXf5b+PrjLyFE41RoteOwiSdIStv0nmPE7pYjxvP1Mf1xEntjN
         R2Q0rce41cZX2GQq5drbgfL5xKDeyGEvN57iqW/2KKtAmEglAECNbsd0PYYWhwiz0zYP
         SAfqqnRu4mQnWN5kww6SLbAhBck5695DrSMpNs8RfEhKAcNDaMg8XtfHfgCesdUAaV6y
         K85j7oL6J7DEnIJNDLZkPKWtwPFfWPPaLosxSZAiXrR3JQF+NAfwkc5bXpmRvVuGc3X5
         wLwyoDga3s3IB/sGJfq3Bq58t5AVbRjz7Q45BfdVz7woOSBF9CB+/1zdoLmAhSX2ut3B
         I/9w==
X-Gm-Message-State: APf1xPB0Q52m3w2fxZMR8jThe4DAv8MLxi2OqR3OHxv2zUeO2pnD5li4
        INqpv39I/PUhgRFUPqHJLED2sVlbA+w=
X-Google-Smtp-Source: AG47ELtzXPyP/qsY7foVxThM3rOfGmVESNYgq5MVhHsFiwV2jZacsdvRWE/g+/OzA+U/h8UwiOrc/A==
X-Received: by 10.80.153.221 with SMTP id n29mr28114128edb.303.1520422971117;
        Wed, 07 Mar 2018 03:42:51 -0800 (PST)
Received: from [192.168.1.75] (lft31-1-88-121-166-205.fbx.proxad.net. [88.121.166.205])
        by smtp.googlemail.com with ESMTPSA id x44sm9914170ede.80.2018.03.07.03.42.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Mar 2018 03:42:50 -0800 (PST)
Subject: Re: [PATCH V2 5/7] thermal/drivers/cpu_cooling: Add idle cooling
 device documentation
To:     Pavel Machek <pavel@ucw.cz>
Cc:     edubezval@gmail.com, kevin.wangtao@linaro.org, leo.yan@linaro.org,
        vincent.guittot@linaro.org, amit.kachhap@gmail.com,
        linux-kernel@vger.kernel.org, javi.merino@kernel.org,
        rui.zhang@intel.com, daniel.thompson@linaro.org,
        linux-pm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <1519226968-19821-1-git-send-email-daniel.lezcano@linaro.org>
 <1519226968-19821-6-git-send-email-daniel.lezcano@linaro.org>
 <20180306231906.GB28911@amd>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <84fa8a3c-28bf-41ae-8ed7-9dd348b1cde9@linaro.org>
Date:   Wed, 7 Mar 2018 12:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180306231906.GB28911@amd>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/03/2018 00:19, Pavel Machek wrote:
> Hi!

Hi Pavel,

thanks for taking the time to review the documentation.

>> --- /dev/null
>> +++ b/Documentation/thermal/cpu-idle-cooling.txt
>> @@ -0,0 +1,165 @@
>> +
>> +Situation:
>> +----------
>> +
> 
> Can we have some real header here? Also if this is .rst, maybe it
> should be marked so?

Ok, I will fix it.

>> +Under certain circumstances, the SoC reaches a temperature exceeding
>> +the allocated power budget or the maximum temperature limit. The
> 
> I don't understand. Power budget is in W, temperature is in
> kelvin. Temperature can't exceed power budget AFAICT.

Yes, it is badly worded. Is the following better ?

"
Under certain circumstances a SoC can reach the maximum temperature
limit or is unable to stabilize the temperature around a temperature
control.

When the SoC has to stabilize the temperature, the kernel can act on a
cooling device to mitigate the dissipated power.

When the maximum temperature is reached and to prevent a catastrophic
situation a radical decision must be taken to reduce the temperature
under the critical threshold, that impacts the performance.

"

>> +former must be mitigated to stabilize the SoC temperature around the
>> +temperature control using the defined cooling devices, the latter
> 
> later?
> 
>> +catastrophic situation where a radical decision must be taken to
>> +reduce the temperature under the critical threshold, that can impact
>> +the performances.
> 
> performance.
> 
>> +Another situation is when the silicon reaches a certain temperature
>> +which continues to increase even if the dynamic leakage is reduced to
>> +its minimum by clock gating the component. The runaway phenomena will
>> +continue with the static leakage and only powering down the component,
>> +thus dropping the dynamic and static leakage will allow the component
>> +to cool down. This situation is critical.
> 
> Critical here, critical there. I have trouble following
> it. Theoretically hardware should protect itself, because you don't
> want kernel bug to damage your CPU?

There are several levels of protection. The first level is mitigating
the temperature from the kernel, then in the temperature sensor a reset
line will trigger the reboot of the CPUs. Usually it is a register where
you write the maximum temperature, from the driver itself. I never tried
to write 1000°C in this register and see if I can burn the board.

I know some boards have another level of thermal protection in the
hardware itself and some other don't.

In any case, from a kernel point of view, it is a critical situation as
we are about to hard reboot the system and in this case it is preferable
to drop drastically the performance but give the opportunity to the
system to run in a degraded mode.

>> +Last but not least, the system can ask for a specific power budget but
>> +because of the OPP density, we can only choose an OPP with a power
>> +budget lower than the requested one and underuse the CPU, thus losing
>> +performances. In other words, one OPP under uses the CPU with a
> 
> performance.
> 
>> +lesser than the power budget and the next OPP exceed the power budget,
>> +an intermediate OPP could have been used if it were present.
> 
> was.
> 
>> +Solutions:
>> +----------
>> +
>> +If we can remove the static and the dynamic leakage for a specific
>> +duration in a controlled period, the SoC temperature will
>> +decrease. Acting at the idle state duration or the idle cycle
> 
> "should" decrease? If you are in bad environment..

No, it will decrease in any case because of the static leakage drop. The
bad environment will impact the speed of this decrease.

>> +The Operating Performance Point (OPP) density has a great influence on
>> +the control precision of cpufreq, however different vendors have a
>> +plethora of OPP density, and some have large power gap between OPPs,
>> +that will result in loss of performance during thermal control and
>> +loss of power in other scenes.
> 
> scene seems to be wrong word here.

yes, 'scenario' will be better :)

>> +At a specific OPP, we can assume injecting idle cycle on all CPUs,
> 
> Extra comma?
> 
>> +Idle Injection:
>> +---------------
>> +
>> +The base concept of the idle injection is to force the CPU to go to an
>> +idle state for a specified time each control cycle, it provides
>> +another way to control CPU power and heat in addition to
>> +cpufreq. Ideally, if all CPUs of a cluster inject idle synchronously,
>> +this cluster can get into the deepest idle state and achieve minimum
>> +power consumption, but that will also increase system response latency
>> +if we inject less than cpuidle latency.
> 
> I don't understand last sentence.

Is it better ?

"Ideally, if all CPUs, belonging to the same cluster, inject their idle
cycle synchronously, the cluster can reach its power down state with a
minimum power consumption and static leakage drop. However, these idle
cycles injection will add extra latencies as the CPUs will have to
wakeup from a deep sleep state."


>> +The mitigation begins with a maximum period value which decrease
> 
> decreases?
>   
>> +more cooling effect is requested. When the period duration is equal
>> to
>> +the idle duration, then we are in a situation the platform can’t
>> +dissipate the heat enough and the mitigation fails. In this case
> 
> fast enough?
> 
>> +situation is considered critical and there is nothing to do. The idle
> 
> Nothing to do? Maybe power the system down?

Nothing to do == the mitigation can't handle the situation, it reached
its limit. We can't do better.

Solution: add an emergency thermal shutdown (which is an orthogonal
feature to be added to the thermal framework).

Sidenote: it is a very unlikely case, as we are idle most of the time
when the heat is hard to dissipate. I tested this with a proto-SoC with
an interesting thermal behavior (temperature jumps insanely high),
running at full blast and bad heat dissipation, the mitigation never
reached the limit.

>> +The idle injection duration value must comply with the constraints:
>> +
>> +- It is lesser or equal to the latency we tolerate when the mitigation
> 
> less ... than the latency
> 
>> +Minimum period
>> +--------------
>> +
>> +The idle injection duration being fixed, it is obvious the minimum
>> +period can’t be lesser than that, otherwise we will be scheduling the
> 
> less.
> 
>> +Practically, if the running power is lesses than the targeted power,
> 
> less.
> 
>> +However, in this demonstration we ignore three aspects:
>> +
>> + * The static leakage is not defined here, we can introduce it in the
>> +   equation but assuming it will be zero most of the time as it is
> 
> , but?
> 
> Best regards,

Thanks!


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
