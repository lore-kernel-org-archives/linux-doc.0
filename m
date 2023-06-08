Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44C0C7EE45
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 06:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbjFHGj1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 02:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbjFHGj0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 02:39:26 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C372132
        for <linux-doc@vger.kernel.org>; Wed,  7 Jun 2023 23:39:24 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977d0288fd2so49906666b.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jun 2023 23:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206363; x=1688798363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20VwnX/WoaRKV9arNTXMhn8ioZI7RTq9D1ov94KZAt0=;
        b=GBvMPK/cs2To8yEXE9SsipYC/K1njPu288BNro/g9k2fonTbbPNHjR6x/v6lQUDK1X
         BAS3uVWDIcWav1fDn/+ErtHtI7UEwBChae4r6rHEQMuY/PtUZrRTn4FVSI5aosRItmCw
         K/FePCj+GiqS7lxluja8iwNLBGIHNfZTg528SQ89huvg5dJ5iHnnbrCZEmf23JyU8lUe
         /SpaTtwUyRK8fgCmvhCmnzoZX3t2SRvOH6XyQ4bNSXGBXwKtRn31zQ/i8BijKOmZOV6C
         e8nS4f7O07aT7ZkG40L16LctrvwEkwkmMoKd31xIw3hk9r+D3QelJVr/FHc6AlSw5vb8
         LDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206363; x=1688798363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20VwnX/WoaRKV9arNTXMhn8ioZI7RTq9D1ov94KZAt0=;
        b=JzlfJnitbFpdAVx5+RkjJKZuSiMg9DRKNf/Q3T0JbqUeNgbaPrMASRRGPrV8aHyOlV
         ofqmqfGtvsZJakm+S1YbI034Nq34Kb/lmlBJy6eLMB+mx8pqqH/IqAwmE42Q4H8ty75i
         i8o0wSz12/q7JVQA3j4ITApx6kNDYsH2pCWW0k8haKMulkm/0KncV/oxGjx6BzZs0PmW
         MmyatjiSLum2vX1JryQx2WS/YX43WK56BTmJxD5KSGqeDcIHuDUBevnqwgMCajEBv2U3
         WxF8a3vuTDz0MOSePZ2vKZHP/bca5wIAJPNHY1RweoUieFsYLBoUB+XvlK4f/0Z+8jlD
         eD4Q==
X-Gm-Message-State: AC+VfDwy4mioYbH3V0gx/3jvtE9W5O6Tks3LJeKxIjk6IquM8KrglTl3
        M2AGgzr6A0mB8ajtfkrwIg0lmw==
X-Google-Smtp-Source: ACHHUZ4hT0e0tzGvbuWncVx7177VvT2kgg6YTLUjvuP4pV7zePZzqsLUl/diPhvVAIOjdTJZ3WZG2A==
X-Received: by 2002:a17:907:1c0c:b0:973:d857:9a33 with SMTP id nc12-20020a1709071c0c00b00973d8579a33mr9347535ejc.11.1686206362925;
        Wed, 07 Jun 2023 23:39:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t4-20020a17090616c400b00977d7ccd9fdsm272257ejd.95.2023.06.07.23.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:39:22 -0700 (PDT)
Message-ID: <b0f5f061-60ce-815f-4228-2033335e562d@linaro.org>
Date:   Thu, 8 Jun 2023 08:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        corbet@lwn.net, p.zabel@pengutronix.de,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org,
        patrick@stwcx.xyz
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608021839.12769-2-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/06/2023 04:18, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm device.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

I don't understand why you make the same mistakes, even though I pointed
them out two times already.

I am not going to point third time. Sorry, it's a waste of my time.

NAK.


Best regards,
Krzysztof

