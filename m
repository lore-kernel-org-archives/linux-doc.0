Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1327D7E868
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 05:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751862AbeDIFiw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 01:38:52 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:48267 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751629AbeDIFiv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Apr 2018 01:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi; s=20161220;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=8yhTcKZPGB1uk/tNL5TX+IRjD7LVZSJZVEF3A/bHi3A=;
        b=u67iKMU2W7TZM+NfFXx7NR+TQWxEocud1PEFyf2kd4uOYzfUE57+e5vP2xCCieArQiERr4Jd9vB6JhulInVWRsBHQAMMe1eX0KX2tsAd2PMb2gPAFUwoI++TguoNGhvp2a/sDE1taDLC/AfDSbOPJYqUF6uApzzqVjsVGwJqCQ77IYlqVn9mEJTmGrLRXPy/9UbBbuLcuYkGHu8UbV3FqMcp7IvoCNibcVBD3ZHrJllf7Yl9zIqP3HVSwCxyxLQtn9v1LJRv4PWMHu6O5NkcvdemgmVT/tANJbIxBejQzIpWUHGcuPlRkP7hFJeUYx3We7zMf0LqP0xLIX6fEc6Lpg==;
Received: from dsl-hkibng22-54faa2-250.dhcp.inet.fi ([84.250.162.250])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1f5PVo-0004gL-CL; Mon, 09 Apr 2018 08:38:40 +0300
Subject: Re: [PATCH V2 3/9] dt-bindings: Tegra186 tachometer device tree
 bindings
To:     Rob Herring <robh@kernel.org>, Rajkumar Rampelli <rrajk@nvidia.com>
Cc:     mark.rutland@arm.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com,
        kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
        pombredanne@nexb.com, mmaddireddy@nvidia.com,
        mperttunen@nvidia.com, arnd@arndb.de, timur@codeaurora.org,
        andy.gross@linaro.org, xuwei5@hisilicon.com, elder@linaro.org,
        heiko@sntech.de, krzk@kernel.org, ard.biesheuvel@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ldewangan@nvidia.com
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-4-git-send-email-rrajk@nvidia.com>
 <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <867aace8-dac7-51d4-bd46-15919b58b37d@kapsi.fi>
Date:   Mon, 9 Apr 2018 08:38:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.250.162.250
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rob,

this binding is for a specific IP block (for measuring/aggregating input 
pulses) on the Tegra186 SoC, so I don't think it fits into any generic 
binding.

Thanks,
Mikko

On 03/27/2018 05:52 PM, Rob Herring wrote:
> On Wed, Mar 21, 2018 at 10:10:38AM +0530, Rajkumar Rampelli wrote:
>> Supply Device tree binding documentation for the NVIDIA
>> Tegra186 SoC's Tachometer Controller
>>
>> Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
>> ---
>>
>> V2: Renamed compatible string to "nvidia,tegra186-pwm-tachometer"
>>      Renamed dt property values of clock-names and reset-names to "tachometer"
>>      from "tach"
> 
> Read my prior comments on v1.
> 
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
