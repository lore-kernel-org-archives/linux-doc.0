Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68360C77B78
	for <linux-doc@archiver.kernel.org>; Thu,  4 May 2023 13:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjEDNn4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 May 2023 09:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjEDNnz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 May 2023 09:43:55 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25187A99
        for <linux-doc@vger.kernel.org>; Thu,  4 May 2023 06:43:53 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so992737a12.2
        for <linux-doc@vger.kernel.org>; Thu, 04 May 2023 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683207832; x=1685799832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q84mWcYMxDEvd8YZPYKI5dHtMMY1HQ2x8IlzEX6KNjQ=;
        b=Iw0fvW2W/ZRyO+X1d5fC8dre5uYE900wTxM9cVMADy9syUIV6R7HL/uXHHwJa28thf
         LVvTHtieL7jB2k/0P02K7Q79hgK5WGcMpHy+lHKlps8kehOFdrOcEaCTtQdUJcGG56Pd
         Z3Na0pGviZV9mhLuUBmgtIO5vYQixJA3YdSnwoi9fVXyt6qq+adq2jribijGE5f3yDDz
         YKQ2C3DYMfeM/aN2/Rzi5XuNwv4A6GrtSD9HMWcUsD88mXBYsvjtNSK6unDEkr5DPkyQ
         9gOmMGZvtWRsyIjC6PP/PQypEk+mpXRtxpve/MZ3k8GV+hL/OUYFxvLQQlUzatioL5QP
         0xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683207832; x=1685799832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q84mWcYMxDEvd8YZPYKI5dHtMMY1HQ2x8IlzEX6KNjQ=;
        b=Z1hbke1vSuTz+gsnH503STbRkyEJyDzPk+cNrZx6IRRco9OHaHqdj9vodWtE7FNd1d
         VIbkbWohF4RV3b+RK3p+FKBRuVeEAxdTzwp0f+9c47BkTY4nc0po3ujp8cBIAsAQ3Bce
         UQssBb/C1+FS8Vj8FhaWZbIf7hyx3RD2OcstMFPfq0XuQURMDPs8DZTiRTYt9aDaw7Jb
         wTbfq7NInfg+usaNRxxVpRVtZ6E8Pni7/QLnf2GY9yvKuwywEINZ0Quq0yog0GZrGWgX
         B+EppfipDvVIsm6vgl3t+rJH+2g/MZvRJxNbIYfnxTTm0UmQVdy6zaX2tU0Ydg4roNHC
         Um4A==
X-Gm-Message-State: AC+VfDwTqFvQosXJi36uYVj+zkHP4zf1tvLLxmZRpt9CJe0qGQ20f5nv
        2no3F1dTbdY/W0F5wFcTHntuyA==
X-Google-Smtp-Source: ACHHUZ5+6vZD8DQEcDcllibUIlq4Uqnivo5RlCCxosmsuQPc56WsPLj23s6NCbCu+fXymcz5/4uZwQ==
X-Received: by 2002:a17:907:9304:b0:94b:958c:8827 with SMTP id bu4-20020a170907930400b0094b958c8827mr6255020ejc.56.1683207832130;
        Thu, 04 May 2023 06:43:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090610c800b0093313f4fc3csm18730621ejv.70.2023.05.04.06.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 06:43:51 -0700 (PDT)
Message-ID: <31377f4b-56e3-4600-3171-a795c940e74d@linaro.org>
Date:   Thu, 4 May 2023 15:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: add MAX31827
Content-Language: en-US
To:     Daniel Matyas <daniel.matyas@analog.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230504161714.6281-1-daniel.matyas@analog.com>
 <20230504161714.6281-2-daniel.matyas@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230504161714.6281-2-daniel.matyas@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/05/2023 18:17, Daniel Matyas wrote:
> MAX31827 is a low-power temperature switch with I2C interface.
> 
> The device is a ±1°C accuracy from -40°C to +125°C
> (12 bits) local temperature switch and sensor with I2C/SM-
> Bus interface. The combination of small 6-bump wafer-lev-
> el package (WLP) and high accuracy makes this temper-
> ature sensor/switch ideal for a wide range of applications.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>

Hm, now I see the tag - did you just ignore it or did you change something?

Standard message follows:

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof

