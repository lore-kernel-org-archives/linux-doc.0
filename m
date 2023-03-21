Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3391C74A5B
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 07:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjCUHgX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Mar 2023 03:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjCUHgW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 03:36:22 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E38166F8
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 00:36:19 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w9so56099823edc.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679384177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZcB4apmfbzyH292GW/VpUyc9V0bRiv/TIitEWXTXpc=;
        b=roTwN/AKgRSZVWpS2NX8pvwjW7iUHDo+WbM+ikjSCwQkuyZbJru03zNkX+8AN8cQGN
         VCVLavviZ3KqrEMUPK11jA+XhkK/ra5yGVSxdXyHBqxbNqyBPS6rVlzLe7AmDINn4Quk
         aIoZlhZS36+XJ63O8QIfA1WjYYCTfwlh3rdgKmxMAh9l8iWY0dEnx3H7iHLiqXKDix0D
         Rl3O1aAt5gYZ4qt+FiZzFCgrdxKVGOM30VwXdhm7TMFPxLBSt7xP7hJSdf+TLhT3SPPd
         w1ja1EiTij1Bj2BOwCPKZo7XB7VH1sYrFSrRyhxYFtmGy94hGw6GVQgP3of1qYXXA0TN
         vRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZcB4apmfbzyH292GW/VpUyc9V0bRiv/TIitEWXTXpc=;
        b=YjSyQb5pSCZXZPawB4Yxbp12R8DJ/erSpGKK4no2GQN0DJfyDAqwrTWMaKmYEgqM9y
         Q2E2iPGFE7bzANtGYP3dAWfLbOBLAzjhHeSYJe/pPmr9bUWLXHauA6INyjn00H4n5SPe
         YcpEFaSPmCTpgm/woykp85L8B4d5NJLiOuSzwzQp88ozuBSMwwQh4ZLzZnmW9gqkbyW8
         uUDchU1o8kyY7dp++3eQyrxqGo8rHrIalkbpsRfbmdyay27KlPA5ntkquTc85LDNsO4+
         ShAQ6E2bfhli+b/fbxaLVWW6eiSj3nF+6/qIFrMSCgHdF5fNixdyBGF9dB02nHGXXZSH
         gV9w==
X-Gm-Message-State: AO0yUKXYljRpf7K8T4Z1vfUTFrux9V+1t3krHXZuz9T5JqPg39v1OtZ2
        f9GPYzGaHxwDEmFL/YkQ7LFq2fUZJMEm5nBa4IQ=
X-Google-Smtp-Source: AK7set+5L/M20YUucU92wFfD4vI6F96YOVFZtRlPRr/4Bdeqz6gqhWMiYvGGRPBGa2psnBJ1J9/0Wg==
X-Received: by 2002:a17:906:22d4:b0:931:a0cb:1ef1 with SMTP id q20-20020a17090622d400b00931a0cb1ef1mr1865510eja.7.1679384177599;
        Tue, 21 Mar 2023 00:36:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b009334edaed98sm3133849ejc.50.2023.03.21.00.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 00:36:17 -0700 (PDT)
Message-ID: <2dcfd9dc-6c43-20b7-e27b-8ec2883be237@linaro.org>
Date:   Tue, 21 Mar 2023 08:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: Add TI TPS6594 PMIC
Content-Language: en-US
To:     Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>
Cc:     lee@kernel.org, krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
References: <20230315110736.35506-1-jpanis@baylibre.com>
 <20230315110736.35506-2-jpanis@baylibre.com>
 <20230320155354.GB1733616-robh@kernel.org>
 <04914464-2bc2-9d86-e9e2-8a716b929f28@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04914464-2bc2-9d86-e9e2-8a716b929f28@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20/03/2023 17:35, Julien Panis wrote:
> 
> 
> On 3/20/23 16:53, Rob Herring wrote:
>> On Wed, Mar 15, 2023 at 12:07:33PM +0100, Julien Panis wrote:
>>> TPS6594 is a Power Management IC which provides regulators and others
>>> features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
>>> PFSM (Pre-configurable Finite State Machine) managing the state of the
>>> device.
>>> TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.
>> As mentioned, the binding needs to be complete. It's missing GPIO at
>> least. RTC and watchdog may or may not need binding changes.
> 
> Thank you for your feedback.
> 
> About GPIO, do you speak about 'gpio-controller'
> and/or '#gpio-cells' properties ?

Yes.

> For RTC (and for watchdog, once the driver will be
> implemented), our driver do not require any node
> to work. What could make an explicit instantiation
> necessary in DT ?

Properties from RTC schema, e.g. start-year, wakeup etc.
>>> +  ti,spmi-controller:
>>> +    type: boolean
>>> +    description: |
>>> +      Identify the primary PMIC on SPMI bus.
>> Perhaps the property name should include 'primary' and 'pmic'.
>> Otherwise, it looks like it is just marked as 'a SPMI controller'.
> 
> Including 'primary' and 'pmic' will be more understandable indeed.
> I will change that in v3.
> 
>>
>>
>>> +      A multi-PMIC synchronization scheme is implemented in the PMIC device
>>> +      to synchronize the power state changes with other PMIC devices. This is
>>> +      accomplished through a SPMI bus: the primary PMIC is the controller
>>> +      device on the SPMI bus, and the secondary PMICs are the target devices
>>> +      on the SPMI bus.
>> Is this a TI specific feature?
> 
> I don't think so. I will double-check that.
> If not, shall I remove the 'ti,' prefix ?

Somehow reminds me qcom,bus-id, but the wording and code are not exactly
the same. The question here is whether this is generic feature of all
SPMI devices or PMICs, or device specific. If it is generic, then naming
and type should be chosen a bit more carefully and then indeed skip
"ti," prefix.

> 
>>
>>> +
>>> +  system-power-controller: true
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  ti,multi-phase-id:
>>> +    description: |
>>> +      Describes buck multi-phase configuration, if any. For instance, XY id means
>>> +      that outputs of buck converters X and Y are combined in multi-phase mode.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [12, 34, 123, 1234]
>> coupled regulator stuff doesn't work here?
> 
> Coupled regulator stuff works here.
> Is it also necessary to specify some 'allOf' logic here to ensure
> that mutual exclusions described below (for regulators) will be
> applied ?

None of other regulators do it but you could add something.


Best regards,
Krzysztof

