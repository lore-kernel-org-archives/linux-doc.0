Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626BCC6FD1C
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 08:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjCVIQv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 04:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjCVIQu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 04:16:50 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05D25C110
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 01:16:49 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w9so69455628edc.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 01:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679473008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXeMOsufe8hSFgTPxUltIiAHXtjsyiMFaKXE2Z0rVtc=;
        b=UOQ3t5C0nu5cx0SLEhSzRiJDhCU4o1AERxtqslmrrJ0Msz/J5gwFEFw5SPNfDf3KQn
         xE8TZAAVZ8fS3liTuyv0ta/JFMbECbDkvvkyz88nO55zspV8ldwXdmtnd3sN66Anfx//
         gT+LLvfMCH+yZTQ/5XFkNhajC1H4ZNKSin80mFepu6TT2IFc9ZmxJKNz8mTJQXk03Apb
         Z1Iv9Fn1f1r66Sn/4Gnr4CtInurCPgbAvi2SGHK05g3CSGYqv7VCKsyRop5hQvTeDV41
         9cI7oU9hpyLQniI6w3SbChM03RVI5NJIrFBUM5Wf2WvH4m3n/o6tJK8CvmFWJsMlB9gi
         T+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679473008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXeMOsufe8hSFgTPxUltIiAHXtjsyiMFaKXE2Z0rVtc=;
        b=wkaJ7T1agYiwYT3dwpLv5BVwBZU7HJJaix6acyCANppf0NQAjfO2ZXISq4Ry+CrlRq
         1/sekLYO9XTZPCLzANXz3KuzRnxq5TejcHmNUj+7oOxgSpl0QLIF8bdiyF6PUK4+a3ys
         BduegCjFt1gnpsSfemoSD6sp9x3dXFfRZ2rCn+dq+TWMEDTjirfek+z/IUboeVPRBq7Z
         Mk3QtKW66Rct96BR/fDHmYWYouyfBWj3+94T0xmNdFpI70ZnT7nGO8mG4CVXgsN7XVcu
         T9FL8GKEXAYJJxWl5DduvlAhPKaiax5WFPJTat0I0EiyBupZ2OfZ2ApTMXe90i3iOvYq
         k48w==
X-Gm-Message-State: AO0yUKWja3a0T2tRDGO/vCsgwO9vFKh1QNveVQ+9DRb73W+Aq4aRhq4Q
        MeeMEnd34CLsKbv0DAqk6Lz+Kw==
X-Google-Smtp-Source: AK7set9oGvfx3eMarIqqmx9cPnLmWTpEBMNaUrGWEQhYU1E1qPNKxTTukOWaBgC8HsULh/3229R/Jg==
X-Received: by 2002:a17:906:4ad1:b0:8e3:74ad:94ce with SMTP id u17-20020a1709064ad100b008e374ad94cemr1376556ejt.8.1679473008210;
        Wed, 22 Mar 2023 01:16:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b0093348be32cfsm4838527ejk.90.2023.03.22.01.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:16:47 -0700 (PDT)
Message-ID: <de3acab7-cf76-3135-9ff8-a0e5537a434b@linaro.org>
Date:   Wed, 22 Mar 2023 09:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Add TI TPS6594 PMIC
Content-Language: en-US
To:     Julien Panis <jpanis@baylibre.com>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        corbet@lwn.net, arnd@arndb.de, gregkh@linuxfoundation.org,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com
Cc:     eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
References: <20230321171020.74736-1-jpanis@baylibre.com>
 <20230321171020.74736-2-jpanis@baylibre.com>
 <88a6856e-c766-d4a5-1882-5350fd0e248a@linaro.org>
 <bffba580-e737-8996-4812-3c76c880acc9@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bffba580-e737-8996-4812-3c76c880acc9@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22/03/2023 09:01, Julien Panis wrote:
>>> +  ti,multi-phase-id:
>>> +    description: |
>>> +      Describes buck multi-phase configuration, if any. For instance, XY id means
>>> +      that outputs of buck converters X and Y are combined in multi-phase mode.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> No improvements here. As Rob pointed out, this looks like coupled
>> regulators.
> 
> I used 'oneOf' logic to handle mutual exclusion. But it seems that I did not
> understand what you and Rob expected.
> Does some generic property already exist for 'coupled regulators' ?

Yes, see regulator.yaml binding.

Best regards,
Krzysztof

