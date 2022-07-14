Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC794CCA480
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jul 2022 11:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239072AbiGNLsm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jul 2022 07:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbiGNLsl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jul 2022 07:48:41 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E3265EF
        for <linux-doc@vger.kernel.org>; Thu, 14 Jul 2022 04:48:38 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 19so1864564ljz.4
        for <linux-doc@vger.kernel.org>; Thu, 14 Jul 2022 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KmdkLZQTH7Au+8JqBR3UHKGQf5x82UafUt+CMJrqYow=;
        b=ykwOYMW0SFy7xWmcHnQ1EXNmukntRLlae+V63adrgl2q5taon6yOi4QBkcZ5yYkq0F
         rQsfSIfLMlr2bASl8+YqShrkKiUsmjlkMki8jt1v1AJPefxgpNEqfYsi89vCjKrWO1Rj
         AX6abGCe7KI0Y1er2+nTRmPMc5vjSsiad5Pkuuo9wKclct88rO3JGyiig1nwiUo12CAS
         BG9jzcvpXGiblYNyiaqNJopPjxPW+NcIpxwZ2Ob3nTWu6AoFjjNQL0Q2uvG/pPmfnP69
         d3w5KMCdTj/hpHFJZxeTJj74fJ+lO0yYh0LbAuv9Xa0iZrO4TB5ahNUbpnlh47PzcJIt
         oM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KmdkLZQTH7Au+8JqBR3UHKGQf5x82UafUt+CMJrqYow=;
        b=fkO/ZtZSKr0Gkp6EUhAIl7IR2JrM9RF0Q8yULNgH7X60THGZQGcdCdSDJiP6/mrLLN
         tiQhFvmw9S8/e9olzaK/oRfqooBoeFIaEfBI5WQNgtAlqevzIWE5nQTA9NUEBRr9oRAt
         Rp2lIulYU+l43LHkW7e5EPlQFz1PNEr7T0X5DlOvcdRKBIRPqXJWGc5wLQ1x9OgcZvWv
         B0E5oTpBTqQi12NvZKXLVnGxwKtHEG8rBcGdg0AHlub6u9wHwotCEORbixJBkgF50sPD
         f2Uv3WBKfLOs30oc0D6lX2Y2Ce0QS7by3ErkvDd2TkMQlCpSeioAvpjaeET3UvA9LNta
         QSDw==
X-Gm-Message-State: AJIora8eVXsFU03X6qAsuE1M+kBO0/USvSTxvqotHw67bzNkcpSEGARd
        1ItjA5X0QkE0mmAQh4khGQjX0A==
X-Google-Smtp-Source: AGRyM1uU3QSD8JP1L98Wd2/ma9Wp+GjizZuDEBOXcRlIFFWP8JTv+3GmZuQdlVAWpCpJL2ISRPH1Tg==
X-Received: by 2002:a2e:b892:0:b0:25b:ce73:675f with SMTP id r18-20020a2eb892000000b0025bce73675fmr4185438ljp.67.1657799316481;
        Thu, 14 Jul 2022 04:48:36 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id j28-20020ac2551c000000b0048329aa6c92sm318315lfk.139.2022.07.14.04.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 04:48:35 -0700 (PDT)
Message-ID: <c129c748-4306-da64-fc18-2d224b2fc97c@linaro.org>
Date:   Thu, 14 Jul 2022 13:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/2] dt-bindings: power: reset: qcom-pon: update "reg"
 property details
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>, corbet@lwn.net,
        sre@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <quic_collinsd@quicinc.com>
References: <20220713193350.29796-1-quic_amelende@quicinc.com>
 <20220713193350.29796-2-quic_amelende@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220713193350.29796-2-quic_amelende@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/07/2022 21:33, Anjelique Melendez wrote:
> From: David Collins <quic_collinsd@quicinc.com>
> 
> Update the description of "reg" property to add the PON_PBS base
> address along with PON_HLOS base address.  Also add "reg-names"
> property description.
> 
> Signed-off-by: David Collins <quic_collinsd@quicinc.com>
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---
>  Documentation/devicetree/bindings/power/reset/qcom,pon.yaml | 73 ++++++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> index 353f155d..562fe308 100644
> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> @@ -15,18 +15,26 @@ description: |
>  
>    This DT node has pwrkey and resin as sub nodes.
>  
> -allOf:
> -  - $ref: reboot-mode.yaml#
> -
>  properties:
>    compatible:
>      enum:
>        - qcom,pm8916-pon
>        - qcom,pms405-pon
>        - qcom,pm8998-pon
> +      - qcom,pmk8350-pon
>  
>    reg:
> -    maxItems: 1
> +    description: |
> +      Specifies the SPMI base address for the PON (power-on) peripheral.  For
> +      PMICs that have the PON peripheral (GEN3) split into PON_HLOS and PON_PBS
> +      (e.g. PMK8350), this can hold addresses of both PON_HLOS and PON_PBS
> +      peripherals.  In that case, the PON_PBS address needs to be specified to
> +      facilitate software debouncing on some PMIC.

You miss here min and maxItems

> +
> +  reg-names:
> +    description: |
> +      For PON GEN1 and GEN2, it should be "pon". For PON GEN3 it should include
> +      "hlos" and optionally "pbs".

Skip description. You miss here min and maxItems.

See
https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
for examples.


>  
>    pwrkey:
>      type: object
> @@ -42,6 +50,63 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - $ref: reboot-mode.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pm8916-pon
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: pon
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pms405-pon
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: pon
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pm8998-pon
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: pon

No clue why you made three if statements. This is one if for all three
variants.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pmk8350-pon
> +    then:
> +      properties:
> +        reg:
> +          minItems: 1
> +          maxItems: 2
> +        reg-names:
> +          minItems: 1
> +          items:
> +            - const: hlos
> +            - const: pbs
> +
>  examples:
>    - |
>     #include <dt-bindings/interrupt-controller/irq.h>


Best regards,
Krzysztof
