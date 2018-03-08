Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F0AC37E676
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 14:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755699AbeCHOba (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 09:31:30 -0500
Received: from mail-pf0-f193.google.com ([209.85.192.193]:37474 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755544AbeCHOb2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Mar 2018 09:31:28 -0500
Received: by mail-pf0-f193.google.com with SMTP id h11so2400383pfn.4;
        Thu, 08 Mar 2018 06:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EhMSOyPt0j50HSQlPtq+UTCKLccPuKAUxDLCcyANLTo=;
        b=Se1FD3BT9vO1VMLtY+SlnXxJVputqWuxyNmyMMNci7PreYipdh/zc2/k4x+0ojEmYm
         ndYK9LZaxFPKk/qGLDR4EPMpnssibJHNyLInSrXNV/cfNqpl/fiHtDprtudxL215bcS2
         U75P0miO0NkA7I/amLwZPUvGidWWECPftICXyC1QhEqhuBzCkwKNnadKvt6Rs9Xmimvz
         eukxWcbhWb+kPOHKpcizikIC6SeekXpLTi7GixjQe3JuFtWaQ3P5/OqMATqm5javZMcg
         2FrtbVK+7i0EYQ8hLq7McpOXf+qEfETHMrZ6M+O/IHzXXsfGX3KKD+pqlkMQSj/8q/ds
         98ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EhMSOyPt0j50HSQlPtq+UTCKLccPuKAUxDLCcyANLTo=;
        b=MrxqswplNP59V+niK8eatVHx6tkaFnmScH1/u1GjV9LWLvVlMdoLR+kslVXnK/yVAE
         plfYbNiIPXciIJGnVVxywsyxbfiaAfAWG2KuhTsp1sUY7DRwcmrW3yM5AiXbKWZHig+k
         maiZUJEHaupl7wU0B9WoBVs0AQbIaRFHyBNMGEI37tRFXGS01PyBcPNCRn6U8+K4BK8D
         czjye94ugnfEIernbX0dXYYW4TJVoLINlwBA3zwZ/9Ekn672Mubh27/MeYtR9VNzxW5V
         1vhEmfBHu6iHBXfoV83mDoTqKk+gQ5O+2qyS/X5LgEmVmEcb4al9/EYiwEYBQl/+6FNH
         aSFw==
X-Gm-Message-State: APf1xPDe41em4QnRC6KK2LihLEhqT6zfUE4ioWJMH8JsG7SaVtK7hn0z
        l+NqjSpRU8kT/QDaJwDUB80=
X-Google-Smtp-Source: AG47ELvkZ0/GvyAFfnVrhd7W0Utul9pD7jzYRlJyK2YqAyWR1L03CL22yL1KJBJCVjQ98RNalQ2x9A==
X-Received: by 10.98.211.1 with SMTP id q1mr26664495pfg.199.1520519487282;
        Thu, 08 Mar 2018 06:31:27 -0800 (PST)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id w88sm44296467pfa.50.2018.03.08.06.31.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Mar 2018 06:31:26 -0800 (PST)
Subject: Re: [PATCH 05/10] hwmon: generic-pwm-tachometer: Add generic PWM
 based tachometer
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Rajkumar Rampelli <rrajk@nvidia.com>,
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
        linux-arm-kernel@lists.infradead.org
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
 <5bffef40-a4a7-5f7d-a448-b2a381c57822@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d4e745a6-5534-662e-f6d5-a91bf580f550@roeck-us.net>
Date:   Thu, 8 Mar 2018 06:31:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <5bffef40-a4a7-5f7d-a448-b2a381c57822@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/07/2018 10:06 PM, Laxman Dewangan wrote:
> 
> 
> On Wednesday 07 March 2018 07:50 PM, Guenter Roeck wrote:
>> On 03/07/2018 01:47 AM, Rajkumar Rampelli wrote:
>>>
>>>>
>>>> While I am not opposed to ABI changes, the merits of those would need to be
>>>> discussed on the mailing list. But replacing "fan1_input" with "rpm" is
>>>> not an acceptable ABI change, even if it may measure something that turns
>>>> but isn't a fan.
>>>>
>>>> If this _is_ in fact supposed to be used for something else but fans, we
>>>> would have to discuss what that might be, and if hwmon is the appropriate
>>>> subsystem to measure and report it. This does to some degree lead back to
>>>> my concern of having the "fan" part of this patch series in the pwm core.
>>>> I am still not sure if that makes sense.
>>>>
>>>> Thanks,
>>>> Guenter
>>> I am planning to add tachometer support in pwm-fan.c driver (drivers/hwmon/) instead of adding new generic-pwm-tachometer.c driver. Measuring RPM value will be done in pwm-fan driver itself using pwm capture feature and will add new sysfs attributes under this driver to report rpm value of fan.
>>
>> There is an existing attribute to report the RPM of fans. It is called fan[1..n]_input.
>>
>> "replacing "fan1_input" with "rpm" is not an acceptable ABI change"
>>
>> Preemptive NACK.
> 
> The RPM is measured speed via PWM signal capture  which is output from fan.
> So should we have the fan[1..n]_output_rpm?
> 

No. I hear you clearly that you for some reason dislike fan[1..n]_input.
While ABIs are not always to our liking, that doesn't mean that we get
to change them at our whim. If that is not acceptable for you, I can't
help you. And you can't change inX_input to inX_voltage either, sorry.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
