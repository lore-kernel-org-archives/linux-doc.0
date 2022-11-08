Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588BBC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 11:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbiKHLWu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 06:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbiKHLWR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 06:22:17 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E5D4C244
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 03:22:11 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id l12so9653622lfp.6
        for <linux-doc@vger.kernel.org>; Tue, 08 Nov 2022 03:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6S31b1GgAuSZeRVi3aE6k9Lv1kYy2JgOJdueU/WrfPk=;
        b=FQVTX03+/jYDhFiJtnC4PlzY3j6O7eqRrURGbxCj9uxURjFPxqXVMZP/7fLhWbImBm
         JdC6fC+nWdrCet4LQal83kXfuzLLawXKFxu/oLYv8Kh2r6x559FfrsvfHjCmy2lBT2pa
         QV3OVJL19Mn4gyrzkg6t6afH5exahrLMKp49Zciw9Ta4DwOEluePqPBp/VNPXU+77weK
         lmit955EmN4VKHGupVAVSjMQxm/PKGzojOJMymAfU8+zG2QjMYaXztogXBUZ6oJAEr9X
         BXxZOLcPkDq8/wEIfmqbcQ9xMX56E55y+wwH5Tx8zJ331BBicVaEbuCsdYGaIZWrHAOU
         7t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S31b1GgAuSZeRVi3aE6k9Lv1kYy2JgOJdueU/WrfPk=;
        b=6wawr2yM4pshYU9xPaIEK7LvMfBKpZg9kMdwFXfztTJxQE6nO75UjbzU7IBrQqXwPK
         55/G8+2z4iXNzSz2jcgmqubwcoMFyVYzC5mXzyPK8q58L332BrtKoBQjvWRLxhta9id2
         sdq8klGaj7LQ4tSCqsC0b+0QMZKqso7g6Yw3OtOESgF6UHYKftSr9K/b5kPf74tRYDZz
         UlyMYWhZYC9kSQY32MiKvD8Wd7rtYFN89meygi+i+zlPkffsdWwY6Q3Ceil8e7JyGFDr
         4yddqPmeMtqx4b2aGtlILT7Pt3hPuDB3/b0v7trYQcrk2MsjVGAREJ5p25J2OG1f9mJ4
         tRhQ==
X-Gm-Message-State: ANoB5pk8WFkvs6A1duHSxf9UWqTjLiUv+tLnAPI4y5y500jVP7HnO932
        aitafguega55qCzdsoyIUlMLow==
X-Google-Smtp-Source: AA0mqf71iUpqb4+BI/4RUZw1laBPRBQU7iqH2g/sTobl9bST23hwOoH26omyo1cgyvEyZZV9JTdQ2Q==
X-Received: by 2002:ac2:43b0:0:b0:4b2:805:f5cb with SMTP id t16-20020ac243b0000000b004b20805f5cbmr5885841lfl.204.1667906530035;
        Tue, 08 Nov 2022 03:22:10 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id q7-20020ac25107000000b004b40c2fccfdsm221399lfb.59.2022.11.08.03.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 03:22:09 -0800 (PST)
Message-ID: <95f588d2-04f3-0be6-ebce-cb6957f5aa1a@linaro.org>
Date:   Tue, 8 Nov 2022 12:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 3/6] dt-bindings: hwmon: Add hpe,gxp-fan-ctrl
Content-Language: en-US
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "Verdun, Jean-Marie" <verdun@hpe.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20221104193657.105130-1-nick.hawkins@hpe.com>
 <20221104193657.105130-4-nick.hawkins@hpe.com>
 <1b90f86c-9c0f-225b-38b5-6f37a4eded69@linaro.org>
 <236F9C0A-797D-41C6-B342-4C32DF28C426@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <236F9C0A-797D-41C6-B342-4C32DF28C426@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/11/2022 23:36, Hawkins, Nick wrote:
> 
>     > > This provides the base registers address, programmable logic registers
>     > > address, and the function 2 registers to allow control access of the HPE
>     > > fans on the GXP SoC.
> 
>     > What is "This"? If "This patch", then drop it.
>     > https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
>     > If "This hardware" then please instead describe the hardware, not it
>     components. What are its features? If it controls the fan, then why
>     there are no PWM-related cells? How do you set the speed?
> 
> Greetings Krzysztof,
> 
>     Thank you for the feedback. The intention was this binding.. however, that was an error on my part, and I will correct it to reflect the hardware situation of the GXP with the fan controller and how each of the mapped registers provide control to the system. To answer your questions: The fans speeds are controlled through an external CPLD device which we provide a PWM value (0-255) using the "base" register to the CIF interface. 

Wrap your emails, it's impossible to simply reply to it.

Then your CIF interface is a PWM device?


> This interface provides access to the CPLD. The CPLD then drives the fan. The CPLD can generate up to 8 unique different PWMs to multiple fans. 

So you have other CPLD (not external) which generates PWM based on first
CPLD base register? Hm, I think it's one CPLD.

> The CPLD monitors the fans and reports the status back to the SoC through the CIF interface to the "plreg base". The plreg includes the installation, failed, and identification statuses. The function 2 register base is used to check the power state of the system as that influences the PWM values read back.

> As the PWM generation happens outside the SoC do we still need pwm-cells? If so, should we have a custom compatible for that?
> 

Depends, if these are actually tightly coupled and you cannot use PWM
for anything else, then you do not need.

> Thanks,
> 
> -Nick
> 
> 

Best regards,
Krzysztof

