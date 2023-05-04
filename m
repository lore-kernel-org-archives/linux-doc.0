Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E326FC7EE21
	for <linux-doc@archiver.kernel.org>; Thu,  4 May 2023 13:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjEDNmn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 May 2023 09:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjEDNmm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 May 2023 09:42:42 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3F67AB5
        for <linux-doc@vger.kernel.org>; Thu,  4 May 2023 06:42:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96598a7c5e0so81965366b.3
        for <linux-doc@vger.kernel.org>; Thu, 04 May 2023 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683207759; x=1685799759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XclQCB7wsuLH7QcRppmPyiTXI2wCqwp/OyebX9CqAQA=;
        b=zqfiCvIhfmN9k4zckos1BJ2EGxuh8hVux6Xi9B8ad3l2UBt2yLXeWcfkomMNI+NXyJ
         9lBXGvMuEvMSdrOMqfCGozbmrIoFqSqslvWpDyrqbvqM/LpY0sdS4+6VLTt6dAmVNdfP
         bmp6YIby9HTpseFTzUsBQzBx0MjIjySjXnUeRUxLGyxP462HXJkxx8XF6aBqsvcKGJ8S
         s8lGRm3qCO9YtdeFZDUlC1sIwC8dYInivBdmeI+i+eQ6b84Sm+8U9bRAqkkvnR1o+PqF
         uIu8f+JSXgWYQWGN1GUxB/wPb3vBKDY9+dpToktlALtS906bL7/IH6xKNyix+gIRTuph
         qGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683207759; x=1685799759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XclQCB7wsuLH7QcRppmPyiTXI2wCqwp/OyebX9CqAQA=;
        b=fJEPNQVTBWZytWb8X9/X8nGZxjI6ab93t2jQy69R+svjVNs5Y0GxfC+YDs7pjMzfR+
         4AwpN2QIRCwYk7jx4JBKJBLIKz0OTWYXotxuZSj3+sQO0TPBqi+5BV70xPj3lXSzkRvZ
         wXHkNENS+KXE2MwcYMeYcP8VWZZLtQz3wrtYlZ2hlpNyX37pztgFvVvIMk80kKi5p36b
         4doZEDy/JMPjk5A+1K13wBYaxfOCYA7P4baJnqOih+4SnzM3jTQ94bAcB4LpJu0x+pvm
         WZtfcf5FJqsiTo+i2Pvdgk7KQK3jP4rU0lSZxOG6+rCIUxRTDP8ME6d1JjzifY4usffb
         qNAw==
X-Gm-Message-State: AC+VfDy/ImvCE5q8AlU2tyqUcF9VkCuoA0hUOX5OGFEq8h0BfEjrrqDj
        M9yE2Q+u5S32fG8EsdpRo/6zdw==
X-Google-Smtp-Source: ACHHUZ7NyhfTSFqzA3q9IMvmTqtn0LeSPOINeaVwsKiDoUZEg2vNSGTls9aalOuKm/qfsIEtkWa7lg==
X-Received: by 2002:a17:907:7f08:b0:94f:12c0:4c8f with SMTP id qf8-20020a1709077f0800b0094f12c04c8fmr7109448ejc.50.1683207758733;
        Thu, 04 May 2023 06:42:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id ia22-20020a170907a07600b0096595cc0810sm1431932ejc.72.2023.05.04.06.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 06:42:38 -0700 (PDT)
Message-ID: <a86c0a3e-91b6-965e-0857-bbcb1ba63ef9@linaro.org>
Date:   Thu, 4 May 2023 15:42:36 +0200
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

Guenter asked for changelog... What do you expect us to do here?

Best regards,
Krzysztof

