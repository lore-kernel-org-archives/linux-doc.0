Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2596C636D4
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 09:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjBQJGR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 04:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjBQJGP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 04:06:15 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6787E60A43
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 01:06:13 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id dn12so9462414edb.5
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 01:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSIBIYecSAzgxxMW+baXFDwV8+JzmvL6P/jsbxXUIM8=;
        b=Y2/kbJRo//tgiNv267ceDZHTRJQc2QnBbl/hTDbXCBcGUZvpafMthRihk5BXV3snif
         cdDwQPfx9WkHfioUXRlfrNGz+jerIwUcJae2X+t80PPfeVGxjSz525CexDnpbEy9l3ur
         iZ7J9Cy+uD7yYGVOug5xKR96sCVbBIZNKdA88bV2PSthIpSjZ0xpdZMovRKwrA/SGMsE
         cwPQgX6mS4SKZn7BQTDj8FeWIRhFgtEXgtMZtRJiYvwPjW6gG4VjWYESNU0EFvEtUmDS
         6tVhg3Yo43uOA3MxppWLtxEKPnwUEFiQuimIDdxdP8h0NKmSn867Vqe5Eqd23J9a4JiD
         UlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSIBIYecSAzgxxMW+baXFDwV8+JzmvL6P/jsbxXUIM8=;
        b=JGOC52y+mSOL+MoghAf701gz0Hx2EkWU3OhXz4WeKLCkOBTSrBSTOR8kLDH0rjb/tI
         RwQPery1TX9ewxiXOissIDCSiMrFkg1Hn2MUS/btyCMTKICoD+gFEjZjMQ/klcfis9II
         O84jvaQn/M6C/81fHQ9M8LfJ1b5k0+Eq0dGuZDajG07tG2VJkGrtuVNUmboAgL9ivljh
         2KWvd1jBb3QzfxzVaNHkx5nSfzVrcSEXRyvOq4MUcC3G7Yya0N/YB9wiVhs+5az5HZpe
         1lFcyiWKVeDsate3ODKy5E28fcB71nWvG5ivx2vSPtTlEEEyIhaJTzqAIBKAD2VIQVAR
         G4xA==
X-Gm-Message-State: AO0yUKXGZjFE2kOR918Gp9Xr3OfLxzk+ZP/H4Crzwoe4aO71fkq19vsm
        KB3pmUMh0+wPuk/5TTWVjCGuXw==
X-Google-Smtp-Source: AK7set9mE6QyfGJnv+24G8XcIOFFM/CXR2pndtsVwQAW5+l7mkajK1EbhdqM4iSWcJJFbpSblf6ZPQ==
X-Received: by 2002:a17:906:e293:b0:8aa:9abe:8edd with SMTP id gg19-20020a170906e29300b008aa9abe8eddmr1718372ejb.66.1676624771844;
        Fri, 17 Feb 2023 01:06:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o1-20020a170906288100b0084cb4d37b8csm1906045ejd.141.2023.02.17.01.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 01:06:11 -0800 (PST)
Message-ID: <c50503f0-dce1-a3b0-2973-8a22b5ef8bc2@linaro.org>
Date:   Fri, 17 Feb 2023 10:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/4] dt-bindings: mfd: Add DT bindings for TI TPS6594
 PMIC
Content-Language: en-US
To:     Julien Panis <jpanis@baylibre.com>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        corbet@lwn.net
Cc:     hdegoede@redhat.com, eric.auger@redhat.com, jgg@ziepe.ca,
        razor@blackwall.org, suma.hegde@amd.com,
        stephen@networkplumber.org, arnd@arndb.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, eblanc@baylibre.com,
        jneanne@baylibre.com
References: <20230216114410.183489-1-jpanis@baylibre.com>
 <20230216114410.183489-2-jpanis@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216114410.183489-2-jpanis@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16/02/2023 12:44, Julien Panis wrote:
> TPS6594 is a Power Management IC which provides regulators and others

Subject: drop second/last, redundant "DT bindings for". The
"dt-bindings" prefix is already stating that these are bindings.


> features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
> PFSM (Pre-configurable Finite State Machine) managing the state of the
> device.
> TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>  .../devicetree/bindings/mfd/ti,tps6594.yaml   | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> new file mode 100644
> index 000000000000..37968d6c0420
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> @@ -0,0 +1,164 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI TPS6594 Power Management Integrated Circuit
> +
> +maintainers:
> +  - Julien Panis <jpanis@baylibre.com>
> +
> +description: |
> +  TPS6594 is a Power Management IC which provides regulators and others
> +  features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
> +  PFSM (Pre-configurable Finite State Machine) managing the state of the device.
> +  TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tps6594
> +      - ti,tps6593
> +      - ti,lp8764x

Any particular choice of ordering (different than alphabetical)?

> +
> +  reg:
> +    description: I2C slave address or SPI chip select number.
> +    maxItems: 1
> +
> +  ti,use-crc:
> +    type: boolean
> +    description: If true, use CRC for I2C and SPI interface protocols.

Hm, why different boards would like to enable or disable it? Why this
suits DT?

> +
> +  system-power-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,multi-phase-id:
> +    description: |
> +      Describes buck multi-phase configuration, if any. For instance, XY id means
> +      that outputs of buck converters X and Y are combined in multi-phase mode.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [12, 34, 123, 1234]
> +
> +patternProperties:
> +  "^buck([1-5]|12|34|123|1234)-supply$":
> +    description: Input supply phandle for each buck.
> +
> +  "^ldo[1-4]-supply$":
> +    description: Input supply phandle for each ldo.
> +
> +  regulators:

This should go to properties, not patternProperties.

> +    type: object
> +    description: List of regulators provided by this controller.
> +
> +    patternProperties:
> +      "^buck([1-5]|12|34|123|1234)$":
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo[1-4]$":
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +
> +        unevaluatedProperties: false
> +

You could add here - on this level - of indentation allOf:if for
excluding setups

if:
  required:
    - buck12
then:
  properties:
    buck123: false
    buck1234: false

Or, if you want to require regulator then:
oneOf:
  - required:
      - buck12
  - required:
      - buck123
  - required:
      - buck1234

and anyway exclude buck34 with two above.

> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false



Best regards,
Krzysztof

