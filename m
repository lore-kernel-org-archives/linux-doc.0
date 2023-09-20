Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258FBCE79D0
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 13:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbjITNXT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 09:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234531AbjITNXS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 09:23:18 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88B8AB
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 06:23:10 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98377c5d53eso885539066b.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695216189; x=1695820989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Df46fcKgl8vVjR+nR4H1C4EpDYFrcFVU3OYDvmRGlDk=;
        b=SW9kTQ4w7083oO9eAWPchTqv5BTUCInVaQ1KoGln2uPU9XENXW4L5RM0PAIWWJJgA1
         qiJTcsC/NPFXwMydiJSNFGKfn7Ep4pyCF5lacxbn5G+vEk6kGKUgFl/b2nDId3hlKWhQ
         yKHrt///4QVyU0fHxCd/HlMtwlzJ88uv211v272PxIV8r47bMaFzhMp1YzyE2sA4yNGR
         0k/7K56O5C867IBn5cF38t4vGQQ6fDsgEgfMdRYnKsFOnh5AkFREiX1KFbojOF8+ix0O
         m/YceK23eHQ8QSrxconwMCJuRk0fnj8CjolN0E+Bboh9JHflglj1RzsEkWp+C+xK42P/
         NB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695216189; x=1695820989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Df46fcKgl8vVjR+nR4H1C4EpDYFrcFVU3OYDvmRGlDk=;
        b=dcgIz7G3CsALqin0aaV7O2+X/YpSCHAG/Jhsmwd9DCazpgK3ljT/99o1Pze1RQxFE5
         VybG8rXcl82hFMszWCo+EQhiUWyTC1lqXiFy3JxXTHkEMk/IP06vnRt/4x43/ixaXiEf
         zA46PVfZFDRMpGNRHdMv3EzV23a+WUafXrD8F0ePJoDt9TouJv6JvmyoybtBEL95MZkJ
         3s14e+TEdaCiXW/jwipaFKG4QbefC8RGf7sHNXEvLMY9bmBma6vwIdMxaMAv8wcVgG+m
         P55TJr5ijB/n70Qvfs9sW0X6GLAojilEcWougtOOC7qZWzbU1hPqEwSnQV3of9Ah1XKG
         nSFQ==
X-Gm-Message-State: AOJu0Yx6qufU+yCzpnTf97VKBkR2Ir7BFvEEFEsFaR+VJwtNTdlFlzZn
        szCwgGe8YI2dRxZ4t1XZT3WDLg==
X-Google-Smtp-Source: AGHT+IGODhn34sgKEEB5Xvi5AdYAc84EeYLLuGWNJ38eH9//v1mx5a9k4Q2h92dHgysqXXRXchUhIQ==
X-Received: by 2002:a17:906:8449:b0:9a5:d899:cc36 with SMTP id e9-20020a170906844900b009a5d899cc36mr2076149ejy.2.1695216189410;
        Wed, 20 Sep 2023 06:23:09 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id gg23-20020a170906e29700b0099364d9f0e6sm9236846ejb.117.2023.09.20.06.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 06:23:08 -0700 (PDT)
Message-ID: <afedde62-f887-07a9-82dc-125f6e46c25a@linaro.org>
Date:   Wed, 20 Sep 2023 15:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/5] arm64: dts: imx8dxl-ss-ddr: change ddr_pmu0
 compatilbe
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, Frank.li@nxp.com, corbet@lwn.net,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        will@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230920102004.886599-1-xu.yang_2@nxp.com>
 <20230920102004.886599-5-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230920102004.886599-5-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20/09/2023 12:20, Xu Yang wrote:
> i.MX8DXL's ddr pmu has port/channel filter capabilities, but it still is
> compatilbe with "fsl,imx8-ddr-pmu". This will change the compatilbe.

Typos: compatible


Best regards,
Krzysztof

