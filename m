Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C804CEE14D8
	for <linux-doc@archiver.kernel.org>; Sun, 10 Sep 2023 10:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344887AbjIJKzW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 Sep 2023 06:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234093AbjIJKzW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 Sep 2023 06:55:22 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66C0CCC
        for <linux-doc@vger.kernel.org>; Sun, 10 Sep 2023 03:55:17 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52c88a03f99so4268339a12.2
        for <linux-doc@vger.kernel.org>; Sun, 10 Sep 2023 03:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694343316; x=1694948116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=puTyiF7lSO91f2hx49Y8uu9bTlDZQ2heMks8xKH0qYk=;
        b=JlBgVMIode+Sh1KsqhI1qHSaK3enqKRveA//ohv30Q5fPEevcBCP6HXmIdTGiDFx1T
         AXP/HUuUwhVIn2K2dXQ2EwYPju0/xf8FN2cPfrDvWJgXcQ67A5GTmR+cMkp4WXyrxhq+
         kHhZCpDntsLPGSyJ4OiDo5wndeZ1nFFspLogSThe8tqW5nOR2mMBbNryADvZB3dm6aNq
         tEnuEpiOnSftigX2THx6Plfs7P2+PDrR6rg116A4Dai76zXvRinoknzpL4Ed4geKUbL4
         FTaTRK0A4rO8Bv2WNEazf7eLjFoHsoWoOXRfOjn0kT65zBIDkoIjThR54XGwFDm1h7NH
         SdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694343316; x=1694948116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puTyiF7lSO91f2hx49Y8uu9bTlDZQ2heMks8xKH0qYk=;
        b=b56Z7CudqTP3GJNbr0dFBdViIZWL/OMFHgf/La87T4+91ClnMOcJp4U/V/5XtvLx2B
         6ysSnC9K6H5six/EGzAbukbZa+nX+AYBJAbrx/obDJFKFEYcKmUYDvYtq/G4l1ICXw/8
         mpgYhsnXc3q0aCX0wOn29gzYMnaKsIFDA0l9yUGSV5hPn4+gs/MnWLSDQeKFQwgT5cQu
         h3ca+kti86dBS87WXkmzfWVct9RDb5t9H4/RNF5X6gvb35L1h3nEZhCK2yHYUWQedRWa
         N0B4KyW4bzcJASGuht3LpZJMMTOuN2WoCEjbGEIWQIVo7wu684DwLNWIjDnxyLB+OO6F
         BGWg==
X-Gm-Message-State: AOJu0YyFxtwT/6GgQsc8AsDr9G/ZkK/JlgSAXVVpy6rrMThuBtjmVhpE
        3wvPcoKuwifEI0ibIk89n1BYZA==
X-Google-Smtp-Source: AGHT+IHM0sRwrwHDiGd+MkKBFN1EjjQ3cC0NYWTn5BzqqBklD9R01Xykug8EJN7zERNVsImMivnFUQ==
X-Received: by 2002:a50:ee89:0:b0:529:fa63:ef7d with SMTP id f9-20020a50ee89000000b00529fa63ef7dmr5063892edr.7.1694343315732;
        Sun, 10 Sep 2023 03:55:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id j8-20020aa7c0c8000000b00525503fac84sm3240460edp.25.2023.09.10.03.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 03:55:15 -0700 (PDT)
Message-ID: <feb8eaeb-954c-416d-6e30-acb4b92764e0@linaro.org>
Date:   Sun, 10 Sep 2023 12:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH net-next 6/6] microchip: lan865x: add device-tree
 support for Microchip's LAN865X MACPHY
Content-Language: en-US
To:     Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net, steen.hegelund@microchip.com,
        rdunlap@infradead.org, horms@kernel.org, casper.casan@gmail.com,
        andrew@lunn.ch
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        horatiu.vultur@microchip.com, Woojung.Huh@microchip.com,
        Nicolas.Ferre@microchip.com, UNGLinuxDriver@microchip.com,
        Thorsten.Kummermehr@microchip.com
References: <20230908142919.14849-1-Parthiban.Veerasooran@microchip.com>
 <20230908142919.14849-7-Parthiban.Veerasooran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230908142919.14849-7-Parthiban.Veerasooran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/09/2023 16:29, Parthiban Veerasooran wrote:
> Add device-tree support for Microchip's LAN865X MACPHY for configuring
> the OPEN Alliance 10BASE-T1x MACPHY Serial Interface parameters.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> 
> Signed-off-by: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
> ---
>  .../bindings/net/microchip,lan865x.yaml       | 54 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/microchip,lan865x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/microchip,lan865x.yaml b/Documentation/devicetree/bindings/net/microchip,lan865x.yaml
> new file mode 100644
> index 000000000000..3465b2c97690
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/microchip,lan865x.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/microchip,lan865x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip LAN8650/1 10BASE-T1S MACPHY Ethernet Controllers
> +
> +maintainers:
> +  - Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
> +
> +description: |
> +  Device tree properties for LAN8650/1 10BASE-T1S MACPHY Ethernet

Drop "Device tree properties for" and instead describe the hardware.

> +  controller.
> +
> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:

No need for items. Just enum.


> +      - enum:
> +          - microchip,lan865x

No wildcards in compatibles.

Missing blank line.



> +  reg:
> +    maxItems: 1
> +
> +  local-mac-address: true
> +  oa-chunk-size: true
> +  oa-tx-cut-through: true
> +  oa-rx-cut-through: true
> +  oa-protected: true

What are all these? Where are they defined that you skip description,
type and vendor prefix?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet@1{

Missing space

> +            compatible = "microchip,lan865x";
> +            reg = <1>; /* CE0 */

CE0? chip-select? What does this comment mean in this context?

> +            local-mac-address = [04 05 06 01 02 03];
> +            oa-chunk-size = <64>;
> +            oa-tx-cut-through;
> +            oa-rx-cut-through;
> +            oa-protected;



Best regards,
Krzysztof

