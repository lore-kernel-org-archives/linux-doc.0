Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AE54E7E868
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 13:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753078AbeDJNbJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 09:31:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752943AbeDJNbH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Apr 2018 09:31:07 -0400
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com [209.85.220.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A06BF21771;
        Tue, 10 Apr 2018 13:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A06BF21771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh@kernel.org
Received: by mail-qk0-f174.google.com with SMTP id 132so13312969qkd.5;
        Tue, 10 Apr 2018 06:31:06 -0700 (PDT)
X-Gm-Message-State: ALQs6tBYQ9PbeGWkALn7d0chWsfdv45An1Ctbl8zcZfvU0BLDY8NWmbe
        z1XTDhE9U3DpDJOxooCkSNHYskUypZghQ8jQow==
X-Google-Smtp-Source: AIpwx4/NkFYIQkYcfq/Ae+JaXQI7vsltE7SNLSL3276K1uomZO1ofniLHfV6b3ZQqmR8ZBuTa9/RpFdcPGFZjMwClhY=
X-Received: by 10.55.221.219 with SMTP id u88mr600905qku.147.1523367065759;
 Tue, 10 Apr 2018 06:31:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.213.166 with HTTP; Tue, 10 Apr 2018 06:30:45 -0700 (PDT)
In-Reply-To: <615d6771-00c3-a4a7-a99f-ec4f6e667c8f@kapsi.fi>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-4-git-send-email-rrajk@nvidia.com> <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
 <867aace8-dac7-51d4-bd46-15919b58b37d@kapsi.fi> <CAL_Jsq+AsUiWWBQ7K4OUM58KqQbvBHuFYmXxXLwr7viwoKW-Yw@mail.gmail.com>
 <615d6771-00c3-a4a7-a99f-ec4f6e667c8f@kapsi.fi>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 10 Apr 2018 08:30:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ-ZJtprXcLxVhRGKp30DTFRO1NzNoqpeSne0marcnmBQ@mail.gmail.com>
Message-ID: <CAL_JsqJ-ZJtprXcLxVhRGKp30DTFRO1NzNoqpeSne0marcnmBQ@mail.gmail.com>
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

On Mon, Apr 9, 2018 at 9:37 AM, Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
>
> On 04/09/2018 04:21 PM, Rob Herring wrote:
>>
>> On Mon, Apr 9, 2018 at 12:38 AM, Mikko Perttunen <cyndis@kapsi.fi> wrote:
>>>
>>> Rob,
>>
>>
>> Please don't top post to lists.
>>
>>> this binding is for a specific IP block (for measuring/aggregating input
>>> pulses) on the Tegra186 SoC, so I don't think it fits into any generic
>>> binding.
>>
>>
>> What is it hooked up to to measure? You only mention "fan" five times
>> in the doc.
>
>
> In practice, fans.
>
>>
>> You have #pwm-cells too, so this block has PWM output as well? If not,
>> then where's the PWM for the fan control because there is no point in
>> having fan tach without some control mechanism.
>
>
> It doesn't provide a PWM output. The (Linux) PWM framework provides
> functionality in both directions - control and capture. But if the device
> tree #pwm-cells/pwms properties are only for control, we may need to
> introduce a new #capture-pwm-cells/capture-pwms or similar.

Yes, perhaps. But there is no point in having
#capture-pwm-cells/capture-pwms if you aren't describing the
connection between the fan and the fan controller.

> The idea is that the generic fan node can then specify two pwms, one for
> control and one for capture, to enable e.g. closed-loop control (I'm not
> personally familiar with the usecase for this but I could imagine something
> like that). The control PWM can be something completely different, maybe not
> a PWM in the first place (e.g. some fixed voltage).

Yes. As you can have different types of fans (3-wire, 4-wire, etc.)
they would have different compatibles and differing properties
associated with them.

>> There's only so many ways to control fans and types of fans, so yes,
>> the interface of control and feedback lines between a fan and its
>> controller should absolutely be generic.
>
>
> I'm not quite getting what you mean by this. Clearly we need a custom
> compatibility string for the tachometer as it's a different hardware block
> with different programming than others.

Yes, of course. It's the interface between fan controllers and fans
that I'm concerned about.

> Or are you complaining about the
> nvidia,pulse-per-rev/capture-window-len properties?

Well, those sound like properties of a fan (at least the first one),
so they belong in a fan node.

The aspeed fan controller is probably the closest thing we have to a
fan binding. Look at that if you haven't already.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
