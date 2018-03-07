Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C7167E66E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 14:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753901AbeCGOUd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 09:20:33 -0500
Received: from mail-pg0-f65.google.com ([74.125.83.65]:38784 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751241AbeCGOUb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 09:20:31 -0500
Received: by mail-pg0-f65.google.com with SMTP id l24so923272pgc.5;
        Wed, 07 Mar 2018 06:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tODR7fHbn1+g7gWxoea1NNcNxr6JztsgTEkaBki5rIc=;
        b=QhiKTJHsthu4YPPQTGEgQlRx2AutLMgfWDuGZNeqzf4EaNNDSizA7vFks1KRh7gCi4
         eaGSEoHNTLoba2RpTXSwKmGkfP7ZKcc0tXd4Y8SoB4AiHbjV4UuHwpElAhLpPrOK6exm
         GajCzoXkO+XS4AYcUelCuw/Jr39WsgN/1+YTPiwMuiLpSylXnwH9gaxHPHeEkrVxeKJs
         Q75xZVMaaXIlnp61+rTyNYNMXGfLfaqdRHQei45LHNVVupbgQfXMjmynHePE5JzrmCfd
         0fS0MqQIh2Al5GAtfpxmTgJlLTtK5mno04PXhf9Wnd6nWUsufGf9+VnAFlFhgDzM71Xd
         nyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tODR7fHbn1+g7gWxoea1NNcNxr6JztsgTEkaBki5rIc=;
        b=DdwYzD7ocJwAzETEYQ1+3avN9zuyWf/6M95+Mqxj6T/PRwod8Btt7pRS7MV4zssnQA
         hraaCYzrIZGB4K1NKzoOTxXcyXMFpA/2pf8f2KXIHZhKEh3te2NvUaqh07UaR4e5F1SY
         c9RSiHw85LlknRAKIUudHEETSppXKM/0G1nyuEAxT2wlkfYy314cvTkWfrLkcSXc0l7m
         e/Bh4dyvBOr3i4Qi+pl/aoLcAmF0YF5Kf2C3i7iBqYjHCLByN1dUycvbHIMVHpstZ2Ou
         G9r6zQvUcrySdx84f29+zJymqAxPYik12Gh15L3W1cqc/6x6bUWsGCelR1R+Dr6HT+al
         wwHA==
X-Gm-Message-State: APf1xPBUEG6Y3HFVbocWC4T+hTF97r3GD2xGd1ECI4HPInlhPyh4xT5Y
        1C5C+z0F+hBgC77dsk3MEBhDjf1a
X-Google-Smtp-Source: AG47ELvLzy7yMMINg/z4HfFujeMWuenvPsl8fwBhlWaLDHFZxZshXNeO1V/6g7e3pTJWWvwKlU3QxA==
X-Received: by 10.98.13.211 with SMTP id 80mr22917899pfn.69.1520432430312;
        Wed, 07 Mar 2018 06:20:30 -0800 (PST)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id a67sm29709363pgc.6.2018.03.07.06.20.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Mar 2018 06:20:29 -0800 (PST)
Subject: Re: [PATCH 05/10] hwmon: generic-pwm-tachometer: Add generic PWM
 based tachometer
To:     Rajkumar Rampelli <rrajk@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, robh+dt@kernel.org,
        mark.rutland@arm.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jdelvare@suse.com, corbet@lwn.net,
        catalin.marinas@arm.com, will.deacon@arm.com,
        kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
        pombredanne@nexb.com, mmaddireddy@nvidia.com,
        mperttunen@nvidia.com, arnd@arndb.de, timur@codeaurora.org,
        andy.gross@linaro.org, xuwei5@hisilicon.com, elder@linaro.org,
        heiko@sntech.de, krzk@kernel.org, ard.biesheuvel@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ldewangan@nvidia.com
References: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
 <1519196339-9377-6-git-send-email-rrajk@nvidia.com>
 <5172edff-fe29-7ed1-f0d2-b0359ea2c24d@roeck-us.net>
 <2510b525-ec36-b49d-5a62-81f335c0d10d@nvidia.com>
 <cfe0d0ce-3a89-bad0-85ba-6edf1135d2dc@roeck-us.net>
 <2628eff2-dd33-34f4-a7e1-cfe46ef88a3f@nvidia.com>
 <4556a8d2-947d-72c4-2962-3167afb53978@kapsi.fi>
 <62ba7f67-5a99-51ab-1214-eb68ebb7e642@roeck-us.net>
 <952cb50e-d9a0-ae5e-d9f6-d1ce268f0384@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f7818e4c-17b6-c58b-3424-85749bb9c1cc@roeck-us.net>
Date:   Wed, 7 Mar 2018 06:20:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <952cb50e-d9a0-ae5e-d9f6-d1ce268f0384@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/07/2018 01:47 AM, Rajkumar Rampelli wrote:
> 
> 
> On Wednesday 28 February 2018 07:59 PM, Guenter Roeck wrote:
>> On 02/27/2018 11:03 PM, Mikko Perttunen wrote:
>>> On 02/28/2018 08:12 AM, Rajkumar Rampelli wrote:
>>>>
>>>> On Wednesday 28 February 2018 11:28 AM, Guenter Roeck wrote:
>>>>> On 02/27/2018 09:38 PM, Rajkumar Rampelli wrote:
>>>>>>
>>>>>> On Wednesday 21 February 2018 08:20 PM, Guenter Roeck wrote:
>>>>>>> On 02/20/2018 10:58 PM, Rajkumar Rampelli wrote:
>>>>>>>> Add generic PWM based tachometer driver via HWMON interface
>>>>>>>> to report the RPM of motor. This drivers get the period/duty
>>>>>>>> cycle from PWM IP which captures the motor PWM output.
>>>>>>>>
>>>>>>>> This driver implements a simple interface for monitoring the speed of
>>>>>>>> a fan and exposes it in roatations per minute (RPM) to the user space
>>>>>>>> by using the hwmon's sysfs interface
>>>>>>>>
>>>>>>>> Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
>>>>>>>> ---
>>>>>>>>   Documentation/hwmon/generic-pwm-tachometer |  17 +++++
>>>>>>>>   drivers/hwmon/Kconfig                      |  10 +++
>>>>>>>>   drivers/hwmon/Makefile                     |   1 +
>>>>>>>>   drivers/hwmon/generic-pwm-tachometer.c     | 112 +++++++++++++++++++++++++++++
>>>>>>>>   4 files changed, 140 insertions(+)
>>>>>>>>   create mode 100644 Documentation/hwmon/generic-pwm-tachometer
>>>>>>>>   create mode 100644 drivers/hwmon/generic-pwm-tachometer.c
>>>>>>>>
>>>>>>>> diff --git a/Documentation/hwmon/generic-pwm-tachometer b/Documentation/hwmon/generic-pwm-tachometer
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..e0713ee
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/hwmon/generic-pwm-tachometer
>>>>>>>> @@ -0,0 +1,17 @@
>>>>>>>> +Kernel driver generic-pwm-tachometer
>>>>>>>> +====================================
>>>>>>>> +
>>>>>>>> +This driver enables the use of a PWM module to monitor a fan. It uses the
>>>>>>>> +generic PWM interface and can be used on SoCs as along as the SoC supports
>>>>>>>> +Tachometer controller that moniors the Fan speed in periods.
>>>>>>>> +
>>>>>>>> +Author: Rajkumar Rampelli <rrajk@nvidia.com>
>>>>>>>> +
>>>>>>>> +Description
>>>>>>>> +-----------
>>>>>>>> +
>>>>>>>> +The driver implements a simple interface for monitoring the Fan speed using
>>>>>>>> +PWM module and Tachometer controller. It requests period value through PWM
>>>>>>>> +capture interface to Tachometer and measures the Rotations per minute using
>>>>>>>> +received period value. It exposes the Fan speed in RPM to the user space by
>>>>>>>> +using the hwmon's sysfs interface.
>>>>>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>>>>>> index ef23553..8912dcb 100644
>>>>>>>> --- a/drivers/hwmon/Kconfig
>>>>>>>> +++ b/drivers/hwmon/Kconfig
>>>>>>>> @@ -1878,6 +1878,16 @@ config SENSORS_XGENE
>>>>>>>>         If you say yes here you get support for the temperature
>>>>>>>>         and power sensors for APM X-Gene SoC.
>>>>>>>>   +config GENERIC_PWM_TACHOMETER
>>>>>>>> +    tristate "Generic PWM based tachometer driver"
>>>>>>>> +    depends on PWM
>>>>>>>> +    help
>>>>>>>> +      Enables a driver to use PWM signal from motor to use
>>>>>>>> +      for measuring the motor speed. The RPM is captured by
>>>>>>>> +      PWM modules which has PWM capture capability and this
>>>>>>>> +      drivers reads the captured data from PWM IP to convert
>>>>>>>> +      it to speed in RPM.
>>>>>>>> +
>>>>>>>>   if ACPI
>>>>>>>>     comment "ACPI drivers"
>>>>>>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>>>>>>> index f814b4a..9dcc374 100644
>>>>>>>> --- a/drivers/hwmon/Makefile
>>>>>>>> +++ b/drivers/hwmon/Makefile
>>>>>>>> @@ -175,6 +175,7 @@ obj-$(CONFIG_SENSORS_WM8350)    += wm8350-hwmon.o
>>>>>>>>   obj-$(CONFIG_SENSORS_XGENE)    += xgene-hwmon.o
>>>>>>>>     obj-$(CONFIG_PMBUS)        += pmbus/
>>>>>>>> +obj-$(CONFIG_GENERIC_PWM_TACHOMETER) += generic-pwm-tachometer.o
>>>>>>>>     ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
>>>>>>>>   diff --git a/drivers/hwmon/generic-pwm-tachometer.c b/drivers/hwmon/generic-pwm-tachometer.c
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..9354d43
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/drivers/hwmon/generic-pwm-tachometer.c
>>>>>>>> @@ -0,0 +1,112 @@
>>>>>>>> +/*
>>>>>>>> + * Copyright (c) 2017-2018, NVIDIA CORPORATION.  All rights reserved.
>>>>>>>> + *
>>>>>>>> + * This program is free software; you can redistribute it and/or modify it
>>>>>>>> + * under the terms and conditions of the GNU General Public License,
>>>>>>>> + * version 2, as published by the Free Software Foundation.
>>>>>>>> + *
>>>>>>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>>>>>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>>>>>>> + * more details.
>>>>>>>> + *
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#include <linux/module.h>
>>>>>>>> +#include <linux/platform_device.h>
>>>>>>>> +#include <linux/err.h>
>>>>>>>> +#include <linux/pwm.h>
>>>>>>>> +#include <linux/hwmon.h>
>>>>>>>> +#include <linux/hwmon-sysfs.h>
>>>>>>>> +
>>>>>>>> +struct pwm_hwmon_tach {
>>>>>>>> +    struct device        *dev;
>>>>>>>> +    struct pwm_device    *pwm;
>>>>>>>> +    struct device        *hwmon;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
>>>>>>>> +            char *buf)
>>>>>>>> +{
>>>>>>>> +    struct pwm_hwmon_tach *ptt = dev_get_drvdata(dev);
>>>>>>>> +    struct pwm_device *pwm = ptt->pwm;
>>>>>>>> +    struct pwm_capture result;
>>>>>>>> +    int err;
>>>>>>>> +    unsigned int rpm = 0;
>>>>>>>> +
>>>>>>>> +    err = pwm_capture(pwm, &result, 0);
>>>>>>>> +    if (err < 0) {
>>>>>>>> +        dev_err(ptt->dev, "Failed to capture PWM: %d\n", err);
>>>>>>>> +        return err;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    if (result.period)
>>>>>>>> +        rpm = DIV_ROUND_CLOSEST_ULL(60ULL * NSEC_PER_SEC,
>>>>>>>> +                        result.period);
>>>>>>>> +
>>>>>>>> +    return sprintf(buf, "%u\n", rpm);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static SENSOR_DEVICE_ATTR(rpm, 0444, show_rpm, NULL, 0);
>>>>>>>> +
>>>>>>>> +static struct attribute *pwm_tach_attrs[] = {
>>>>>>>> +    &sensor_dev_attr_rpm.dev_attr.attr,
>>>>>>>> +    NULL,
>>>>>>>> +};
>>>>>>>
>>>>>>> "rpm" is not a standard hwmon sysfs attribute. If you don't provide
>>>>>>> a single standard hwmon sysfs attribute, having a hwmon driver is pointless.
>>>>>> Guenter Roeck,
>>>>>> I will define a new hwmon sysfs attribute node called "hwmon_tachometer_attributes" in hwmon.h like below and update the same in tachometer hwmon driver. Is it fine ?
>>>>>> enum hwmon_tachometer_attributes {
>>>>>
>>>>> Are you kidding me ?
>>>>>
>>>>> Guenter
>>>> Sorry, I just wanted to confirm whether my understanding is correct or not before implementing it actually.
>>>> Or, shall I add this attribute as a part of fan attributes with "hwmon_fan_rpm" ? or any other way to do it ? I need your inputs in fixing this.
>>>
>>> I think he wants the attribute to be named according to the properties in this document: https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface. I guess the attribute would then map to fan1_input, though I'm not sure if that's 100% correct either since this could technically be attached to something other than a fan. But I would think in practice that's not a big concern.
>>>
>>> Guenter,
>>> Please correct me as well if I'm wrong.
>>>
>> You are absolutely correct.
>>
>> While I am not opposed to ABI changes, the merits of those would need to be
>> discussed on the mailing list. But replacing "fan1_input" with "rpm" is
>> not an acceptable ABI change, even if it may measure something that turns
>> but isn't a fan.
>>
>> If this _is_ in fact supposed to be used for something else but fans, we
>> would have to discuss what that might be, and if hwmon is the appropriate
>> subsystem to measure and report it. This does to some degree lead back to
>> my concern of having the "fan" part of this patch series in the pwm core.
>> I am still not sure if that makes sense.
>>
>> Thanks,
>> Guenter
> I am planning to add tachometer support in pwm-fan.c driver (drivers/hwmon/) instead of adding new generic-pwm-tachometer.c driver. Measuring RPM value will be done in pwm-fan driver itself using pwm capture feature and will add new sysfs attributes under this driver to report rpm value of fan.

There is an existing attribute to report the RPM of fans. It is called fan[1..n]_input.

"replacing "fan1_input" with "rpm" is not an acceptable ABI change"

Preemptive NACK.

Guenter

>>
>>> Thank you,
>>> Mikko
>>>
>>>>
>>>> -- 
>>>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
