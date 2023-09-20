Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F0FCE79CE
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 13:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbjITNXH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 09:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbjITNXG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 09:23:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF369E
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 06:23:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5033918c09eso1751106e87.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695216178; x=1695820978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnrQziMxAJShzzQ4GKaXTl7CTescsLkh1jNpmbrLCHU=;
        b=EI0ulgjQkxLhvpfxYPXHgOWBc+C3f5LTMsAq1w06UVk+wSwrcJAjNQmLCm16ng4TEg
         5g8+adu7WHxUWtSxgM2u8KhP6x3C9CA6rCKFPVWKdbsTOn5uAJzsy6KW6LjTnhzF+z5V
         PHFoAZubfMRQS3X+OT0HdVsL5onAWOQZA+yjmefQ14DMU9exetdNwNEpFNeWBvmbiBup
         Z6u/MXzUlu8xBlMcaSf6hDECRGq5gM9yVRNTC5Uhk6gEtPo76/4Ru3um6vh5zqgZIqEa
         0pn4fJ81tUVwBEKA0f80bsIT95RX4Bi8l8sdI3ZEksIw2GxEB8B3jVT49lLf8YJbsFKL
         lqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695216178; x=1695820978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnrQziMxAJShzzQ4GKaXTl7CTescsLkh1jNpmbrLCHU=;
        b=H+gFrC2vSGKIzC003YM1/51IeNEzFJsnlNaU6JX9JozlF+bJg1+oJvgMJrIqLQ2t1s
         66DTnwplDeLLS120xEGV/R0ONIbe6A9qn3lUenb8CCMsqBZgvoEgL85SS0wLsHFDw2xx
         JD6eSrBoNnWQMeDB9eHNzlQ2EZgMUMigV12kEEMTqjljGf29K2oKO1nOltzXuDWTMKQV
         AfyC2Wxy/bMa+aiv70BRdpvV5on4HhjA9GzeiBY9+bHIHM7nQifO9QVH9dIB97Cif6IS
         Eh/F013JZ1wW7BULltmDi7A5C0LroYHlvsU/hXfOwDHayqGkITbtBsad8zf2gHBViJVF
         Kfkw==
X-Gm-Message-State: AOJu0Ywgi58+wwS/uIpBJEwn70ImLnwZ/v9vralRFxaLAc90rDwFBKLW
        U1sHPkPaRTu4mIxdqpcsH+Ytug==
X-Google-Smtp-Source: AGHT+IFzGIhbM5fJ3qPoRY3Pzdp2jgx9b+4iH+ylHlPNnoK0tDCjPODgH4DBWWjPT50Eh4WaWrataw==
X-Received: by 2002:a05:6512:3d25:b0:503:35af:3058 with SMTP id d37-20020a0565123d2500b0050335af3058mr2855080lfv.52.1695216178277;
        Wed, 20 Sep 2023 06:22:58 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id r25-20020aa7d599000000b0052a1c0c859asm8949381edq.59.2023.09.20.06.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 06:22:57 -0700 (PDT)
Message-ID: <a30ffeb5-d43a-f450-0fed-1669a1925ece@linaro.org>
Date:   Wed, 20 Sep 2023 15:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/5] dt-bindings: perf: fsl-imx-ddr: Add i.MX8DXL
 compatible
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, Frank.li@nxp.com, corbet@lwn.net,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        will@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230920102004.886599-1-xu.yang_2@nxp.com>
 <20230920102004.886599-3-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230920102004.886599-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20/09/2023 12:20, Xu Yang wrote:
> Add a compatible for i.MX8DXL which is compatile with "fsl,imx8-ddr-pmu".
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml | 3 +++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

