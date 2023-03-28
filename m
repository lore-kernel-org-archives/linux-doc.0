Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FE1C761AF
	for <linux-doc@archiver.kernel.org>; Tue, 28 Mar 2023 14:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbjC1OU1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Mar 2023 10:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbjC1OUZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Mar 2023 10:20:25 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4E17690
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 07:20:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n19so7078413wms.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680013219;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PEtB1leftLnTtvh+oHN0PgNHoCI5eZGmZHEiBkpRwA=;
        b=8QZSnfbOtyJyh9xV/e8zioGy7lOr8GXVGlKXrX7Ph766BOYNeeOfpM6muMSeN40UQ4
         ekxCt/LjmXJQXfRZcWMY+nS9l3m5kBPPrMZOCt5ogEUdgmX8Cvuzikvw1pH4AsIBCdTu
         4ewt9LW6Hv7yrOHy8RkMs+cfG9IwGyMKWrwVaPsHHdG/KY0jt+xqQE5DYX830789j2FR
         E1MDoO/jDQdTZBTyG+rgqMb2WT+UZe68TF6LjFDU26FZ/7Tr+9eNK5jRHHufVIOaMO3U
         P8dstfIEpDRqQf0+q7dyWyFjkc0bryMVcg/47azJpYSABzzRNFy7xNlfmd9mreruwGsk
         ex5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680013219;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PEtB1leftLnTtvh+oHN0PgNHoCI5eZGmZHEiBkpRwA=;
        b=XZN8iDE+KjumQrJVU9cejKjbc7QkiHDkmGMcWGh+4y/7RGO3BF/iWeVaAqrA15fo6s
         /E0y8L3mrK46wP7JFpIscd5ekU2N5OaYZlm7Hi/ItG+F+5J7eNk40c9hF6zYeyqToFOB
         eWgpUrbRIzuGic6pGpQozsQIH9e0fVA+pgxdEgcDnHyKL8nZEc2z5OO4wFLJ/F7nIvih
         fvjnM8kitfWBzlGGKdxUA1JAkvlINt56D0+Xafw+YonthThhzDzLV9DJJmLHnl8Xyo0V
         F9Ngdcvovy1Q8yxZ8cyBhgAfxuL9tdw1OP0XosVDTdQgnPHKu2QLWcWPGllIgJgIGJDn
         wn2A==
X-Gm-Message-State: AO0yUKXWH04b+7NyTiySnhjpsOrwRaucTAgzE4AIk2LaAFykFCSk22aX
        yrj8qxDumc4Gq0accN1ZbIvSoA==
X-Google-Smtp-Source: AK7set+BMwlEtjB3o6fUoqT4JYr5nGtbsMBbscTdTWB/vviOBBBLJCd6uSw5ZDqKEtisO3/CpdzCCQ==
X-Received: by 2002:a1c:790b:0:b0:3ed:9ed7:d676 with SMTP id l11-20020a1c790b000000b003ed9ed7d676mr12553625wme.13.1680013218951;
        Tue, 28 Mar 2023 07:20:18 -0700 (PDT)
Received: from [10.3.3.14] (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c378e00b003ed2276cd0dsm17205130wmr.38.2023.03.28.07.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 07:20:18 -0700 (PDT)
Message-ID: <fc519231-dd00-8ce3-ecdb-a1e1364cd0c4@baylibre.com>
Date:   Tue, 28 Mar 2023 16:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: Add TI TPS6594 PMIC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, arnd@arndb.de,
        gregkh@linuxfoundation.org, derek.kiernan@xilinx.com,
        dragan.cvetic@xilinx.com
Cc:     eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
References: <20230327154101.211732-1-jpanis@baylibre.com>
 <20230327154101.211732-2-jpanis@baylibre.com>
 <a0c18c3a-4f9e-f491-582f-8d3ca56ec26f@linaro.org>
 <75f0a18d-aed9-8610-2925-4e604b4b0241@baylibre.com>
 <f69d7b3a-6b30-5f30-9e72-7197a3a62a2c@linaro.org>
From:   Julien Panis <jpanis@baylibre.com>
In-Reply-To: <f69d7b3a-6b30-5f30-9e72-7197a3a62a2c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/28/23 13:21, Krzysztof Kozlowski wrote:
> On 28/03/2023 12:45, Julien Panis wrote:
>>
>> On 3/28/23 08:51, Krzysztof Kozlowski wrote:
>>> On 27/03/2023 17:40, Julien Panis wrote:
>>>> TPS6594 is a Power Management IC which provides regulators and others
>>>> features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
>>>> PFSM (Pre-configurable Finite State Machine) managing the state of the
>>>> device.
>>>> TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.
>>>>
>>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>>>> ---
>>>>    .../devicetree/bindings/mfd/ti,tps6594.yaml   | 231 ++++++++++++++++++
>>>>    1 file changed, 231 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>>>> new file mode 100644
>>>> index 000000000000..4498e6361b34
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>>>> @@ -0,0 +1,231 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: TI TPS6594 Power Management Integrated Circuit
>>>> +
>>>> +maintainers:
>>>> +  - Julien Panis <jpanis@baylibre.com>
>>>> +
>>>> +description:
>>>> +  TPS6594 is a Power Management IC which provides regulators and others
>>>> +  features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
>>>> +  PFSM (Pre-configurable Finite State Machine) managing the state of the device.
>>>> +  TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.
>>> LP8764X? Compatible says LP8764.
>>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - ti,lp8764
>>> It's confusing. If x was wildcard, didn't you remove part of model name?
>> OK, I will remove 'X' from model name in v5.
> There is no x in compatible. What is (are) the model name(s)?

Basically, the model names are:
- lp8764-q1 ('x' came from an error in internal documentation)
- tps6593-q1
- tps6594-q1

But...for these 3 pmics, there are 19 PN provided
by TI. For instance: tps659413f, tps659411f, ...
Each PN gives information about non-volatile memory
settings and firmware. So, there can be several PN
for a given model name.

Which solution is recommended in such situation ?

IMO, using the 3 'xxxxxx-q1' names for compatible
strings makes sense (that's what already exists in
linux for others TI pmics).
But if you think that full PN names should be specified
to differentiate internal FW/NVM configurations, I will do
that and we will get 19 compatible strings.

>
>>>
>>>> +      - ti,tps6593
>>>> +      - ti,tps6594
> (...)
>
>>>> +
>>>> +  rtc:
>>>> +    type: object
>>>> +    description: RTC provided by this controller.
>>>> +    $ref: /schemas/rtc/rtc.yaml#
>>> I doubt that you can have here any RTC and any watchdog (below). This
>>> should be specific binding instead. Or list of compatibles if you have 3
>>> or more possible bindings.
>>>
>>> Additionally, judging by your DTS you do not have any resources in rtc
>>> and watchdog, so these should not be nodes by themself in such case.
>> It seems that I can't figure out what you and Rob mean by saying that
>> "binding must be complete" and that "RTC and watchdog may or may not
>> need binding changes".
>> What does "specific binding" mean ?
> Specific means not loose, not generic, precise with some accurate
> properties.
>
>> Should we add some specific property
>> for RTC/WDG provided by the PMIC ?
> You know ask me to know what is in your device. I don't know. You should
> know.
>
>> Should we write another yaml for both
>> of them ?
> Depends. Pretty often yes, but think what do you want to put there?

There's nothing to put there actually.

>
>> Why shouldn't they use the generic rtc/watchdog yaml ?
> There are no properties in these nodes, so you do not need nodes. Or if
> you have properties then you need specific binding, not generic one.

We do not need nodes indeed, since we do not have properties to put in them.

>
>> I don't
>> understand why they would need some "binding changes". Any example
>> I could refer to ? (I might have not looked at the relevant ones for my case
>> before sending this v4)
> git grep $ref | grep rtc.yaml
>
>
> Best regards,
> Krzysztof
>

