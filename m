Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 748207E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 13:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751918AbeDINVm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 09:21:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751522AbeDINVk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Apr 2018 09:21:40 -0400
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com [209.85.216.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72913217DF;
        Mon,  9 Apr 2018 13:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72913217DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh@kernel.org
Received: by mail-qt0-f176.google.com with SMTP id w23so9072751qtn.3;
        Mon, 09 Apr 2018 06:21:39 -0700 (PDT)
X-Gm-Message-State: ALQs6tDC+6NvSxDDFMhJqbDYTNYSlRKyR6BAy71X0rW1Wbo/4FvWu7RX
        tKydPstb8OzyRQBcgz6YCtiR0GFk34hf4wL8BA==
X-Google-Smtp-Source: AIpwx49AiKwVXA+22dmgtpCoe/3MSl+q8J2KD7auJAaxpfmB7RjsnFsqd2DSbwBKgg2VDUfk+0304dIIwMWEtG62rME=
X-Received: by 10.200.42.72 with SMTP id l8mr52420890qtl.164.1523280098591;
 Mon, 09 Apr 2018 06:21:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.213.166 with HTTP; Mon, 9 Apr 2018 06:21:17 -0700 (PDT)
In-Reply-To: <867aace8-dac7-51d4-bd46-15919b58b37d@kapsi.fi>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-4-git-send-email-rrajk@nvidia.com> <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
 <867aace8-dac7-51d4-bd46-15919b58b37d@kapsi.fi>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 9 Apr 2018 08:21:17 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+AsUiWWBQ7K4OUM58KqQbvBHuFYmXxXLwr7viwoKW-Yw@mail.gmail.com>
Message-ID: <CAL_Jsq+AsUiWWBQ7K4OUM58KqQbvBHuFYmXxXLwr7viwoKW-Yw@mail.gmail.com>
Subject: Re: [PATCH V2 3/9] dt-bindings: Tegra186 tachometer device tree bindings
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Rajkumar Rampelli <rrajk@nvidia.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Timur Tabi <timur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Alex Elder <elder@linaro.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Laxman Dewangan <ldewangan@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 9, 2018 at 12:38 AM, Mikko Perttunen <cyndis@kapsi.fi> wrote:
> Rob,

Please don't top post to lists.

> this binding is for a specific IP block (for measuring/aggregating input
> pulses) on the Tegra186 SoC, so I don't think it fits into any generic
> binding.

What is it hooked up to to measure? You only mention "fan" five times
in the doc.

You have #pwm-cells too, so this block has PWM output as well? If not,
then where's the PWM for the fan control because there is no point in
having fan tach without some control mechanism.

There's only so many ways to control fans and types of fans, so yes,
the interface of control and feedback lines between a fan and its
controller should absolutely be generic.

Rob

>
> Thanks,
> Mikko
>
>
> On 03/27/2018 05:52 PM, Rob Herring wrote:
>>
>> On Wed, Mar 21, 2018 at 10:10:38AM +0530, Rajkumar Rampelli wrote:
>>>
>>> Supply Device tree binding documentation for the NVIDIA
>>> Tegra186 SoC's Tachometer Controller
>>>
>>> Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
>>> ---
>>>
>>> V2: Renamed compatible string to "nvidia,tegra186-pwm-tachometer"
>>>      Renamed dt property values of clock-names and reset-names to
>>> "tachometer"
>>>      from "tach"
>>
>>
>> Read my prior comments on v1.
>>
>> Rob
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
