Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D1E2A7E676
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 06:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935556AbeCHGGg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 01:06:36 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10251 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934897AbeCHGGd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Mar 2018 01:06:33 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com
        id <B5aa0d2f00002>; Wed, 07 Mar 2018 22:06:40 -0800
Received: from HQMAIL105.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 07 Mar 2018 22:06:32 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 07 Mar 2018 22:06:32 -0800
Received: from BGMAIL102.nvidia.com (10.25.59.11) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 8 Mar
 2018 06:06:31 +0000
Received: from [10.19.64.176] (10.19.64.176) by bgmail102.nvidia.com
 (10.25.59.11) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 8 Mar
 2018 06:06:26 +0000
Subject: Re: [PATCH 05/10] hwmon: generic-pwm-tachometer: Add generic PWM
 based tachometer
To:     Guenter Roeck <linux@roeck-us.net>,
        Rajkumar Rampelli <rrajk@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <jdelvare@suse.com>, <corbet@lwn.net>,
        <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <kstewart@linuxfoundation.org>, <gregkh@linuxfoundation.org>,
        <pombredanne@nexb.com>, <mmaddireddy@nvidia.com>,
        <mperttunen@nvidia.com>, <arnd@arndb.de>, <timur@codeaurora.org>,
        <andy.gross@linaro.org>, <xuwei5@hisilicon.com>,
        <elder@linaro.org>, <heiko@sntech.de>, <krzk@kernel.org>,
        <ard.biesheuvel@linaro.org>
References: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
 <1519196339-9377-6-git-send-email-rrajk@nvidia.com>
 <5172edff-fe29-7ed1-f0d2-b0359ea2c24d@roeck-us.net>
 <2510b525-ec36-b49d-5a62-81f335c0d10d@nvidia.com>
 <cfe0d0ce-3a89-bad0-85ba-6edf1135d2dc@roeck-us.net>
 <2628eff2-dd33-34f4-a7e1-cfe46ef88a3f@nvidia.com>
 <4556a8d2-947d-72c4-2962-3167afb53978@kapsi.fi>
 <62ba7f67-5a99-51ab-1214-eb68ebb7e642@roeck-us.net>
 <952cb50e-d9a0-ae5e-d9f6-d1ce268f0384@nvidia.com>
 <f7818e4c-17b6-c58b-3424-85749bb9c1cc@roeck-us.net>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
From:   Laxman Dewangan <ldewangan@nvidia.com>
Message-ID: <5bffef40-a4a7-5f7d-a448-b2a381c57822@nvidia.com>
Date:   Thu, 8 Mar 2018 11:36:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f7818e4c-17b6-c58b-3424-85749bb9c1cc@roeck-us.net>
X-Originating-IP: [10.19.64.176]
X-ClientProxiedBy: BGMAIL103.nvidia.com (10.25.59.12) To bgmail102.nvidia.com
 (10.25.59.11)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Wednesday 07 March 2018 07:50 PM, Guenter Roeck wrote:
> On 03/07/2018 01:47 AM, Rajkumar Rampelli wrote:
>>
>>>
>>> While I am not opposed to ABI changes, the merits of those would 
>>> need to be
>>> discussed on the mailing list. But replacing "fan1_input" with "rpm" is
>>> not an acceptable ABI change, even if it may measure something that 
>>> turns
>>> but isn't a fan.
>>>
>>> If this _is_ in fact supposed to be used for something else but 
>>> fans, we
>>> would have to discuss what that might be, and if hwmon is the 
>>> appropriate
>>> subsystem to measure and report it. This does to some degree lead 
>>> back to
>>> my concern of having the "fan" part of this patch series in the pwm 
>>> core.
>>> I am still not sure if that makes sense.
>>>
>>> Thanks,
>>> Guenter
>> I am planning to add tachometer support in pwm-fan.c driver 
>> (drivers/hwmon/) instead of adding new generic-pwm-tachometer.c 
>> driver. Measuring RPM value will be done in pwm-fan driver itself 
>> using pwm capture feature and will add new sysfs attributes under 
>> this driver to report rpm value of fan.
>
> There is an existing attribute to report the RPM of fans. It is called 
> fan[1..n]_input.
>
> "replacing "fan1_input" with "rpm" is not an acceptable ABI change"
>
> Preemptive NACK.

The RPM is measured speed via PWM signal capture  which is output from fan.
So should we have the fan[1..n]_output_rpm?


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
