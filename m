Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D3AC761AF
	for <linux-doc@archiver.kernel.org>; Sat, 25 Mar 2023 11:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjCYLEi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 25 Mar 2023 07:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjCYLEh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 25 Mar 2023 07:04:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199C7126EE
        for <linux-doc@vger.kernel.org>; Sat, 25 Mar 2023 04:04:35 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x3so17246817edb.10
        for <linux-doc@vger.kernel.org>; Sat, 25 Mar 2023 04:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742273;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGuQcUMPAohDQdYCn6esi5t8mBDfcwG+UMgt1Vpx+WM=;
        b=pMAvRb8aCJ2b0iCd+bQbJvnxrHmZdtK2pRSRcgh8uUGqvblJeke1gYjt2UVdKTPv2T
         tE/Jx7SUB3KniKeL3tXU9iLtWMVaVOQn2bD0tkfIwL+eY/NlNpJBI/hXmIDAh8bMyaYI
         HxIWizm/znH9TrCyib1AJNP0PMJXPbJ1I8+dxmfRO9M6mkYHa9lSvSjWmGoAta0y3o61
         RUXOIC0PIN/nYSvCp4SDQyCd2//4jjpLR3o1hFqT22PbPt8syu6kWex4RbPC1Voip8PD
         jMvgpF3URNTFFCWYZiTX/Qv30J+QbEIufaG3hIQmjufi0hl6LEfjfX2yX6SW+1o5ZMfX
         LrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742273;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGuQcUMPAohDQdYCn6esi5t8mBDfcwG+UMgt1Vpx+WM=;
        b=8HrmIUY1wMfS1tOxa1bOmUgThSE/Jq+HVkeFBsyiiW9OqITe1n3El7mZ0g0rh82NTv
         3xAvW1Umn4VHtbZIgmwGXwcCqxyoRUYmBTQr1BFam4kLFmh/LbrLdlMvAOOJw3iSwy07
         LiPZ6vtZcHApEQ9rNHABG0RwfmoaTlFJmn5+33GM79+zXegX13RugQvHQw6uH8QzE89U
         5bZrbKLek8NEVDyQBLO9ocbduBTc4Ka6Sl20d00TNTrCERwYDnLV3AicwE3ExIHAHlZ/
         a3Jl8aUp80xF16F6dxHSzbFGf6A7aLI7uVEQtmY2p42u1MXJ3jhZbaF35bA3wm3MSOTc
         WsrA==
X-Gm-Message-State: AAQBX9fpOK9+AeKVfQXyu5eHN1hla5NOOwu6bTE3VReE37B0ymQFsSft
        efQYkCueMONPmefgwSelwDyMgQ==
X-Google-Smtp-Source: AKy350Y/NlId/yerM/9zRTivgf+nQ019MPql1v8mGNitanGiTO1YCTgARhntB8wDoJL8eH7ILlPbiQ==
X-Received: by 2002:a17:906:951:b0:933:3cc7:4420 with SMTP id j17-20020a170906095100b009333cc74420mr5852539ejd.45.1679742273597;
        Sat, 25 Mar 2023 04:04:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id b1-20020a1709065e4100b008ca52f7fbcbsm11602168eju.1.2023.03.25.04.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:04:33 -0700 (PDT)
Message-ID: <55ab6fdb-7b93-38bb-bbf9-9d9e2051afba@linaro.org>
Date:   Sat, 25 Mar 2023 12:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V4 02/10] dt-bindings: timestamp: Add Tegra234 support
Content-Language: en-US
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-3-dipenp@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323012929.10815-3-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23/03/2023 02:29, Dipen Patel wrote:
> Added timestamp provider support for the Tegra234 in devicetree
> bindings.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

