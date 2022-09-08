Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAF3C38145
	for <linux-doc@archiver.kernel.org>; Thu,  8 Sep 2022 12:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbiIHMSA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Sep 2022 08:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiIHMR6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Sep 2022 08:17:58 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88FE57F0AF
        for <linux-doc@vger.kernel.org>; Thu,  8 Sep 2022 05:17:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id k10so12794477lfm.4
        for <linux-doc@vger.kernel.org>; Thu, 08 Sep 2022 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ck7V+o7JPb3N5t8+G9G1surewJtHGKQZMAePo7SGqo0=;
        b=tsj1pSYdiYyvTqNXt1FY72ZnSGTTMGm06Sjc41bCQjYjInVfeyel2iFXOt6E+H9emc
         SU3kqTMCgQkdj6nNYUzlQIgw5WFWS6c3tCDG1L0b16AY9i7knwFTHrMazizbhgqmAjRi
         N0NmnHNfoK0PqU1a1t5+wuj5uAJbDNqXGU2V6rO8dWDWKuMz43SLhEUpedh05irJ9/c6
         8sWQC7U/KaVWxtmOV8Awy4AxC+n7HOCISDks/Yy6xpkb5MrTBBoHox2iaIwMuc508y1x
         VG5N+/ivUVZ/qQZKn5X87Z2XPJCaKjWCZzu+CNb0YNWCrRpzuCOSzS6CdfXQvh+RjRZL
         e1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ck7V+o7JPb3N5t8+G9G1surewJtHGKQZMAePo7SGqo0=;
        b=SnJpvcfLaFV0lKD4nAUa/66+uSRHCyyw3w2GkP209b9NrllhwPCdBiZfp5lV39ssoD
         DPbBajc7BgOf0F1DOvhIqi3bUTUWhalKEaToDRA7mQUOv5V5YClQu02miHWPlMrVmXi4
         ZThDcA2yP1ji/ElpXvq0BYf7xi7tsMR6MeA1dqLy63LUislr8GgSAqviHRhY6+/JBjMQ
         J6eW7nLBLqwHMeqMuV3qAfKE9eTd4yiB0M0sL4TLzGPjgFr7pwenHHEQGWgpDWiCnj6G
         syQzK+l1yOgtmOmFrfMKGlj4AOzG4A0xtu29ukfwLUEi+kAhYjcYqafKZGoQtOeUI8LA
         9YIA==
X-Gm-Message-State: ACgBeo0jcL+Ajei3n5lqdaCzkkXbj0QT8nG//t/QTzb81jpy+Po0nG3T
        bxuRkwF5JFvNFW3oxzAKbggnyg==
X-Google-Smtp-Source: AA6agR4Fg7IVq6RMZ+ReLSyWao9EV+xIdPoQuu5k0CpfePwRxeHRwu9dpM1o9cmvXOsvUpU4oYiO/w==
X-Received: by 2002:a19:5e5e:0:b0:497:a26d:89ef with SMTP id z30-20020a195e5e000000b00497a26d89efmr2937764lfi.555.1662639475896;
        Thu, 08 Sep 2022 05:17:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 12-20020ac25f0c000000b00497a41b3a39sm1179754lfq.93.2022.09.08.05.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:17:55 -0700 (PDT)
Message-ID: <39b08217-b939-d188-12ce-ce6006282e1e@linaro.org>
Date:   Thu, 8 Sep 2022 14:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/7] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
Content-Language: en-US
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/09/2022 15:19, Russell King (Oracle) wrote:
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
>  .../devicetree/bindings/mfd/apple,smc.yaml    |  4 +++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> new file mode 100644
> index 000000000000..ee620fe50ca8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller GPIO
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  This describes the binding for the Apple Mac System Management Controller
> +  GPIO block.
> +
> +properties:
> +  gpio-controller: true
> +  '#gpio-cells':
> +    const: 2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    smc_gpio: gpio {
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> index 168f237c2962..47e3cd58bf19 100644
> --- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -37,6 +37,10 @@ title: Apple Mac System Management Controller
>      description:
>        A phandle to the mailbox channel
>  
> +patternProperties:
> +  gpio:

This is not a pattern. Should be in properties.

Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).


Best regards,
Krzysztof
