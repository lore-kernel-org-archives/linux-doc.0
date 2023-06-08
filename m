Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4A0C7EE37
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 06:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbjFHGny (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 02:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234897AbjFHGnx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 02:43:53 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0E02132
        for <linux-doc@vger.kernel.org>; Wed,  7 Jun 2023 23:43:51 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-97458c97333so48792666b.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jun 2023 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206630; x=1688798630;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKifchXYMlN5+2AWBL2iJu9wgd/o/GbojOV3x5kNS0c=;
        b=JJOaHAJBSsmNiXdcSeQRVYguDgcMAPhD/0NvwEH+rwM7oadea/3imyyUH7GrPuTVua
         GWSi9tgu58jqb30nw4MqAlo7O5SWGMJ11FRooQrXh3yOTIYbgaQEPuLqC/Lj80S4sMCR
         1OLmmdxqQGHIPGYlODMhf9sfAkzhi432GaN6FH+6a/D2O6abiJC5FwWROcARIIFB1WwW
         Zfk2lDW7MlAyOtthOz0DAKJuvJUgp3Xhka1pZonjWO/rAHZAMdVhZl/aNbhZvNrG9uBz
         kBIisZDL7MwN6ZGMIOPrR/+Odg7x691Ct67h/alSjDtLPrvpNdp/5LEiK4kDM/7Jlkv8
         FG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206630; x=1688798630;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKifchXYMlN5+2AWBL2iJu9wgd/o/GbojOV3x5kNS0c=;
        b=T+p4CcyJpxtfnw7CXg57FR+cFCIiGSkUekAXJq3864P55Ja00C5xCIfqdJPlQP5q8Y
         YOWTMSVjtxNH/RoOZsJwHhKcOxYN1XgAZ7VtMzonqy2ZrupKyjO1tEIEF/m+heI/QB7t
         4k0e936SZOfYFWPIZFOOFzlElZUKlvQhSnZngXvXaAHZZAR2+prtgJnXZ5kxLpWPMh06
         mjqOtg15N5QnEGvzxw8+Vu6MYWkb7pPuuebYRoTKWK1KhtnVyPg5SJNQ3Jsfr5OjVSdb
         5Q3DccYCiQGjSsQJ4DaKu0RmoQ/rU4fm94yAxyr7oFYpEHYNdDjpM91BpmBhvIoBUO+I
         rGIw==
X-Gm-Message-State: AC+VfDxS2r2iwbVrNEIOP9BCSXv5flKjqcxJ6cNlxpXmEuojZvVwVlzy
        B5Mmw1Qf7hY2UyENqHDvoYFWdw==
X-Google-Smtp-Source: ACHHUZ615GandBmkZOQAM6x5MNaoNmT/us1RhpkDbmH/Hf32IQotU4lzJJnZ910ZD8BTz+8svgYJMg==
X-Received: by 2002:a17:907:72c9:b0:977:abac:9635 with SMTP id du9-20020a17090772c900b00977abac9635mr7665424ejc.20.1686206630126;
        Wed, 07 Jun 2023 23:43:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bq15-20020a170906d0cf00b0094edfbd475csm273385ejb.127.2023.06.07.23.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:43:49 -0700 (PDT)
Message-ID: <ce99a709-ba4a-eb53-39ac-88a194879000@linaro.org>
Date:   Thu, 8 Jun 2023 08:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v4 1/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        lee@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, corbet@lwn.net,
        p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-2-billy_tsai@aspeedtech.com>
 <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
In-Reply-To: <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23/11/2022 09:24, Krzysztof Kozlowski wrote:
> On 23/11/2022 07:16, Billy Tsai wrote:
>> Add device binding for aspeed pwm-tach device which is a multi-function
>> device include pwm and tach function.
> 
> Subject: drop second, redundant "bindings".

Where did you implement this comment in your v6?

> Also use proper PATCH prefix.

Where did you implement this comment in your v6?

> 


Best regards,
Krzysztof

