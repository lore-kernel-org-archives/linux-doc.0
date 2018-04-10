Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 414987E868
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 13:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752907AbeDJNnr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 09:43:47 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34395 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752622AbeDJNnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 09:43:45 -0400
Received: by mail-pf0-f194.google.com with SMTP id q9so8352147pff.1;
        Tue, 10 Apr 2018 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uIrVlepof7UzBXFxeuEEixRu/1RCcnYcwaqRB8sAdBQ=;
        b=fiWzySGNb0rce7/lvZp1aPxU/Wx2Fg/54JjCcqp3ZpqdeK6euCgMtvnRcPfxB55WZV
         lYV+UiMJJiYaVv6+5rIte4V7CdsbMVLZpFnOv5N7JTu2IKFSAvh8aLGmtJ2DdKJOMalz
         L7Zy314X5dNuNuf5Vr+lL7GXhHoa3bcuuN07n4YcHDGTxfuo2DuRv4VUf2sgpOhWT2U4
         YAXY+WEFKF8cz28fdxTY4Uw819sr3Xh6BcJ0HEVJuzueztNl2knSG7NtAI9/eekgMygp
         0ImJsogQhmGtih0kvDEl62/SWHXrdlWQmWcE12mJModorkXeloWYrrU6wlHkPXL5pL84
         18XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uIrVlepof7UzBXFxeuEEixRu/1RCcnYcwaqRB8sAdBQ=;
        b=srWUlKJdmgjIIicDhaRj/GqTMGE6ptMCLToLhCFe/gNNs0SUrZvRTFuOVfieqcdRHF
         6ombmgqVMZr2nGWHlJZFqDr1mpNLgc4uth1IHMrumKjOeR5oiYipsiZsLymV3qEz9XJs
         sU3kKgZZj3jbglcl7AQvpPh1ogZrZvXjOIkXVjsUrJZZjlVzoUXa58EWHIjIS7/Mwhfb
         YJi7w8tGs98t4ItaUnCjf8Ykdmh81noB3VZxKp3IeIrtXNB9WMmSlLS04+s7/ueLSxqG
         hacBXNWGq2tdNcDj5oJ2kySuqDgtm37737d8P6AyIScML3dXWFPf9PKWqa4q09M4Cu/s
         Z9wA==
X-Gm-Message-State: ALQs6tBB7JR2Sz5w+MRqOQzJ1Xp0AEi+FHpkbPodlnUE7D2fp2dAS4VX
        eyosuhSlLTHcG3yaowXSDX4=
X-Google-Smtp-Source: AIpwx48LiitEpf5FjMGkkeTy38GSxRxgrAefpLnnDmPVdIKCg4nEYSH2GVQLESKbiRIc30k0Li5q4A==
X-Received: by 10.99.115.4 with SMTP id o4mr350242pgc.404.1523367824564;
        Tue, 10 Apr 2018 06:43:44 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id b3sm5182588pfi.54.2018.04.10.06.43.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 06:43:43 -0700 (PDT)
Subject: Re: [PATCH V2 3/9] dt-bindings: Tegra186 tachometer device tree
 bindings
To:     Rob Herring <robh@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Rajkumar Rampelli <rrajk@nvidia.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
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
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-4-git-send-email-rrajk@nvidia.com>
 <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
 <867aace8-dac7-51d4-bd46-15919b58b37d@kapsi.fi>
 <CAL_Jsq+AsUiWWBQ7K4OUM58KqQbvBHuFYmXxXLwr7viwoKW-Yw@mail.gmail.com>
 <615d6771-00c3-a4a7-a99f-ec4f6e667c8f@kapsi.fi>
 <CAL_JsqJ-ZJtprXcLxVhRGKp30DTFRO1NzNoqpeSne0marcnmBQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b735b140-314e-80f3-b8a4-660c573897b1@roeck-us.net>
Date:   Tue, 10 Apr 2018 06:43:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ-ZJtprXcLxVhRGKp30DTFRO1NzNoqpeSne0marcnmBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/10/2018 06:30 AM, Rob Herring wrote:
> On Mon, Apr 9, 2018 at 9:37 AM, Mikko Perttunen <cyndis@kapsi.fi> wrote:
>>
>>
>> On 04/09/2018 04:21 PM, Rob Herring wrote:
>>>
>>> On Mon, Apr 9, 2018 at 12:38 AM, Mikko Perttunen <cyndis@kapsi.fi> wrote:
>>>>
>>>> Rob,
>>>
>>>
>>> Please don't top post to lists.
>>>
>>>> this binding is for a specific IP block (for measuring/aggregating input
>>>> pulses) on the Tegra186 SoC, so I don't think it fits into any generic
>>>> binding.
>>>
>>>
>>> What is it hooked up to to measure? You only mention "fan" five times
>>> in the doc.
>>
>>
>> In practice, fans.
>>
>>>
>>> You have #pwm-cells too, so this block has PWM output as well? If not,
>>> then where's the PWM for the fan control because there is no point in
>>> having fan tach without some control mechanism.
>>
>>
>> It doesn't provide a PWM output. The (Linux) PWM framework provides
>> functionality in both directions - control and capture. But if the device
>> tree #pwm-cells/pwms properties are only for control, we may need to
>> introduce a new #capture-pwm-cells/capture-pwms or similar.
> 
> Yes, perhaps. But there is no point in having
> #capture-pwm-cells/capture-pwms if you aren't describing the
> connection between the fan and the fan controller.
> 
>> The idea is that the generic fan node can then specify two pwms, one for
>> control and one for capture, to enable e.g. closed-loop control (I'm not
>> personally familiar with the usecase for this but I could imagine something
>> like that). The control PWM can be something completely different, maybe not
>> a PWM in the first place (e.g. some fixed voltage).
> 
> Yes. As you can have different types of fans (3-wire, 4-wire, etc.)
> they would have different compatibles and differing properties
> associated with them.
> 
>>> There's only so many ways to control fans and types of fans, so yes,
>>> the interface of control and feedback lines between a fan and its
>>> controller should absolutely be generic.
>>
>>
>> I'm not quite getting what you mean by this. Clearly we need a custom
>> compatibility string for the tachometer as it's a different hardware block
>> with different programming than others.
> 
> Yes, of course. It's the interface between fan controllers and fans
> that I'm concerned about.
> 
>> Or are you complaining about the
>> nvidia,pulse-per-rev/capture-window-len properties?
> 
> Well, those sound like properties of a fan (at least the first one),
> so they belong in a fan node.
> 
> The aspeed fan controller is probably the closest thing we have to a
> fan binding. Look at that if you haven't already.
> 

FWIW, this is a fan speed (tachometer) counter which is modeled as pwm input.
This, in my opinion, and as stated before, is conceptually wrong. The pwm
subsystem should not (need to) know anything about fans, much less about
specifics such as the number of pulses per revolution.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
