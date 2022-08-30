Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496A2ECAAD8
	for <linux-doc@archiver.kernel.org>; Tue, 30 Aug 2022 17:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbiH3Roy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Aug 2022 13:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbiH3Roi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Aug 2022 13:44:38 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EAA163B65
        for <linux-doc@vger.kernel.org>; Tue, 30 Aug 2022 10:41:20 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id by6so12147278ljb.11
        for <linux-doc@vger.kernel.org>; Tue, 30 Aug 2022 10:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=g068sDOtegZG3B0E3N9qqa73w8mC4luwa5PK1E841Oc=;
        b=OXFHI8yptvhucT4YUUOtygY4O7bsAiXGdV3sDBj4S+zCmz1ExWyE5Lrl/YAU0EQt3e
         DGiqZsoyHdZGWxAR791s3ykxSAKk9LaPiUPPlLblSgHmFTuFinaSfSvMkZeFSvkUz0xm
         SMxLLMEFPxRr+jU9Gg6SrQd7V3caOTsV7RpSXgxLP84LZZ5nrdf6x2Gtn58CpSYKn7Ik
         gAAtZd3LTMKXhxyF79ygES+pSq3T2kz3zuASe5uQrH6/yvqBZIIGLdYW81ORN+njF2y5
         MZ/35FjfCPC5TGpqRrXmotp+iCvxIF1b5Gjjc4vIG1F03NYQo5fOT1Ts/jrvVHa0I8ry
         hEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=g068sDOtegZG3B0E3N9qqa73w8mC4luwa5PK1E841Oc=;
        b=OhUlJiNf5SCnx3BtHc2RY7TuUOfp93lWNGkhfuulWpB8FWnyWE8M8KQawYKE/ssdgI
         M34E91IILCki9psWypZNPUKvyw1Py6HNGVbngW89Cw29GFI6GJCLCWrI5zv9djPH2xMA
         MVybMWc64z0ZgoiC4cZBaoeTJSBaLq1XuoeeMRiWTvb0zRKKLaW/rYT4DtOc+GHH9kct
         4wDSU2nChwLosgXHgC4/qW9dMGWRJ4OQCA4RKyiNqz9d88hrgEO1/vc7K5aI0a9cCTBo
         s9FDdwYGNNS1aV4GbJgxKGGVIeEOKFtKjMK6D/TAd+SULG7c3s1317dOwnmLhg241sAd
         7WNg==
X-Gm-Message-State: ACgBeo1GTqVJ5Q9vhsOO5/Gn7A/OG2cYsDjhPPpBd/2yrQ7DOfZsT6C/
        4XtUn73Cm926FN+h9wndIYFA1g==
X-Google-Smtp-Source: AA6agR5vWqwc+VWS2HuKV8dho5GMBIfDIOF3NRboTp2dc6BcMwmp9hIlM7n+IYTRLFa+HruvI7r9NQ==
X-Received: by 2002:a05:651c:238c:b0:261:d468:d633 with SMTP id bk12-20020a05651c238c00b00261d468d633mr7294676ljb.479.1661881275308;
        Tue, 30 Aug 2022 10:41:15 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h5-20020a2ea485000000b0025e6a3556ffsm1846445lji.22.2022.08.30.10.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:41:14 -0700 (PDT)
Message-ID: <ee9bf56b-9624-b695-d724-2bf237c9c241@linaro.org>
Date:   Tue, 30 Aug 2022 20:41:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH net-next v4 6/7] dt-bindings: net: pse-dt: add bindings
 for generic PSE controller
Content-Language: en-US
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, David Jander <david@protonic.nl>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
References: <20220828063021.3963761-1-o.rempel@pengutronix.de>
 <20220828063021.3963761-7-o.rempel@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220828063021.3963761-7-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/08/2022 09:30, Oleksij Rempel wrote:
> Add binding for generic Ethernet PSE controller.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v4:
> - rename to PSE regulator
> - drop currently unused properties
> - use own compatible for PoDL PSE
> changes v2:
> - rename compatible to more generic "ieee802.3-pse"
> - add class and type properties for PoDL and PoE variants
> - add pairs property
> ---
>  .../bindings/net/pse-pd/pse-regulator.yaml    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/pse-pd/pse-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/pse-pd/pse-regulator.yaml b/Documentation/devicetree/bindings/net/pse-pd/pse-regulator.yaml
> new file mode 100644
> index 0000000000000..1a906d2135a7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pse-pd/pse-regulator.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/pse-pd/pse-regulator.yaml#

The convention is filename based on compatible, so "podl-pse-regulator.yaml"

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Regulator based Power Sourcing Equipment
> +
> +maintainers:
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: Regulator based PSE controller. The device must be referenced by
> +  the PHY node to control power injection to the Ethernet cable.
> +
> +properties:
> +  compatible:
> +    description: Regulator based PoDL PSE controller for a single twisted-pair
> +      link.

Why description of compatible? Description of hardware goes to top-level
description.

> +    const: podl-pse-regulator
> +
> +  '#pse-cells':
> +    const: 0
> +
> +  pse-supply:
> +    description: Power supply for the PSE controller
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - '#pse-cells'
> +  - pse-supply
> +
> +examples:
> +  - |
> +    pse_t1l2: ethernet-pse-1 {

Node name: ethernet-pse
(unless -1 stands for something generic?)

Also, no need for label.

Best regards,
Krzysztof
