Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3FEC7EE25
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 11:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbjFHLbK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 07:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236138AbjFHLbF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 07:31:05 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069DA273A
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 04:30:48 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so718389a12.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jun 2023 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686223846; x=1688815846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7+yLjS2Rdd8+uD9LEVYNPNGYkGBInfOHop83YoJaEA=;
        b=dLQKRo/NGUR6kw/0uWRJAYY+OEFxZpAL5WHNmgT7OPeQgtqnDBUMIruxm+6wPKf0bi
         p6xt3+Mgo3R2a8JRPyZ9SegJycNN0k81HfuXLpcNMAChNJsSuhDbh2AfycsFa7KQ1PxH
         qm948QlMwm4anohfh4c5xJMz98HB8ukVeDoQHb/szhjxKCtd2cafGzE/4ygBVYeXC9Hk
         F9yCSItCwBZSpmEuGzUiePsqaO+5zJVggEsQiMa54cUZuLRsY2bab+rg3wGwD3l4WsQN
         vFl3pGNNZY1VNXM24tsJIt06+lbj8qW1/zqCf0QLl0uDyz9bm6WGhjBr2zvnmAEdGzcg
         13kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686223846; x=1688815846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7+yLjS2Rdd8+uD9LEVYNPNGYkGBInfOHop83YoJaEA=;
        b=IbykgbsHuqms8zeEIQNBtFYCpHbzeohwyazosMerVg1ksanlww+AFIXgkyI6Wvxahh
         yky42sFsg/O0LIcy47aWM/RrUTVuFQnFuSneuHNva/LjVkWkHyi9UupGqKjsZ/R5q0Dz
         8s1MNnYc893bEd2GunMVrzDf5fGQiEYERmcxNfCxuY/01ZuiZ76d/2tnYoiHXnmLE3Cy
         BE/ozYVTrS3Dy1D33YsqGVH3wnjGXmWxFWP/+6f6M0liYM1cfx8vqPn6loJPBEe4nURz
         tdT+4bC9NeKdG7sZSegXG0COSjmrkBre/i1KMYGnsYg244jgF4yAnZVK6aJj+AScG0eV
         HdKw==
X-Gm-Message-State: AC+VfDxqkQhzd1LI3dnjJ6QVTuIxMnQs1lr91tUim50VYMIywa6v+M7t
        5WKPpJ8DX/c9TZ8ERgz5IasalQ==
X-Google-Smtp-Source: ACHHUZ7IDl+KBpIUAFfVeokHth5486E9vBPZCjaiGmbSJYszj03jrLtK14VAf3gKtwBkyl3ykX/jLg==
X-Received: by 2002:aa7:c602:0:b0:514:75ff:6a86 with SMTP id h2-20020aa7c602000000b0051475ff6a86mr7037567edq.29.1686223846434;
        Thu, 08 Jun 2023 04:30:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7d055000000b0050bc7c882bfsm426433edo.65.2023.06.08.04.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 04:30:45 -0700 (PDT)
Message-ID: <aeef2066-72f4-8e41-cec3-f5c6815820a6@linaro.org>
Date:   Thu, 8 Jun 2023 13:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v11 1/2] dt-bindings: hwmon: add MAX31827
Content-Language: en-US
To:     Daniel Matyas <daniel.matyas@analog.com>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230608104152.14249-1-daniel.matyas@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608104152.14249-1-daniel.matyas@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/06/2023 12:41, Daniel Matyas wrote:
> MAX31827 is a low-power temperature switch with I2C interface.
> 
> The device is a ±1°C accuracy from -40°C to +125°C
> (12 bits) local temperature switch and sensor with I2C/SM-
> Bus interface. The combination of small 6-bump wafer-lev-
> el package (WLP) and high accuracy makes this temper-
> ature sensor/switch ideal for a wide range of applications.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Change log:
> v10 -> v11: No change.

Wasn't this applied? Why do you send it again?

Best regards,
Krzysztof

