Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC96C77B75
	for <linux-doc@archiver.kernel.org>; Wed, 19 Apr 2023 12:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbjDSMxw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Apr 2023 08:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbjDSMxu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Apr 2023 08:53:50 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B67B47C
        for <linux-doc@vger.kernel.org>; Wed, 19 Apr 2023 05:53:48 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id xi5so81345713ejb.13
        for <linux-doc@vger.kernel.org>; Wed, 19 Apr 2023 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681908827; x=1684500827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0N26j4yQXe74e+ivxmlhFDmNYunjLTGE2X1AOgnduA=;
        b=WYoY7KPFhRVS4KLzydaQSNQzYa2dWzZKW2yW8rpjs01sSODWUBXWzbIfn4vA9H6uK0
         s5kSjt85Lz2Ghc7SRuksA1JggdACvcAtj/8GGETZebpBIzb4refKMx6Cbko5WvD0hckk
         F1bZEYSwgX6qySecvsW5wNqpNILssGorZCBJdNF1PS13CQOa64wcpwwn1Iq70zwAMspL
         6KoGWU76d6E+Zcklv/i5KTKkdmaY/32ieN5wneFh+gYNjysrhKL5bcRh13Df0Ov2CF5F
         clw07YZvcQiDBXzB8llq7WVhGI/SgaNgW5ZV6v9GFdCd3u/X2KMBtv9pRQFNszezcfZy
         kKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681908827; x=1684500827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0N26j4yQXe74e+ivxmlhFDmNYunjLTGE2X1AOgnduA=;
        b=Fnl3h/CzuleZp8oo4+KclRIMUL/TIIXcKV702b6XfGFS2f8OrvBUSs+SLcmaQFDRN4
         iOj/orsTSpYrKSke7k7uMvwKRrevn44IY1apWwwGbMLuUVsnXtKtSwAkA+ieCXQ/8PjB
         8PT1uM6OdPlshLhPnix2uJnwEDFavsDuYxdc5FwsvuGLCpspsUgM5hFqOEoHM3wThL+V
         kREIOW7mOtMklWzZNoA+v3yNT3ClAN7yTUxAHWf9GNRHI4FIZn5GTRGoWqAnH8TaUwPE
         2ccaSV6D70PdbgsWE48mSa/gjYluuFTTbi0FQQRHGCtPASl32G9+hJNzRcB8Tea2RK2C
         Ztfg==
X-Gm-Message-State: AAQBX9d3OPDnO3ZmapMsKjyGoFonhv60en7tzQMAwND/m6SPLVI0ydHm
        t6y1+el5Ht24G7Do9frFm1bLJQ==
X-Google-Smtp-Source: AKy350bBAaFNCpPlZzVexPb06lfEEFm/VEOm9rkda8D24LkFidQ/l3ZzXLJDLeOkUaIfhIETMTQqNg==
X-Received: by 2002:a17:906:1ec8:b0:906:3373:cfe9 with SMTP id m8-20020a1709061ec800b009063373cfe9mr14669488ejj.10.1681908827214;
        Wed, 19 Apr 2023 05:53:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b7d8:d88b:1fac:c802? ([2a02:810d:15c0:828:b7d8:d88b:1fac:c802])
        by smtp.gmail.com with ESMTPSA id wy5-20020a170906fe0500b0094f1d0bad81sm6336798ejb.139.2023.04.19.05.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 05:53:46 -0700 (PDT)
Message-ID: <289b7604-d32d-49d9-8f06-87147d6fd473@linaro.org>
Date:   Wed, 19 Apr 2023 14:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [net-next PATCH v7 13/16] ARM: dts: qcom: ipq8064-rb3011: Add
 Switch LED for each port
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20230417151738.19426-1-ansuelsmth@gmail.com>
 <20230417151738.19426-14-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417151738.19426-14-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/04/2023 17:17, Christian Marangi wrote:
> Add Switch LED for each port for MikroTik RB3011UiAS-RM.
> 
> MikroTik RB3011UiAS-RM is a 10 port device with 2 qca8337 switch chips
> connected.
> 
> It was discovered that in the hardware design all 3 Switch LED trace of
> the related port is connected to the same LED. This was discovered by
> setting to 'always on' the related led in the switch regs and noticing
> that all 3 LED for the specific port (for example for port 1) cause the
> connected LED for port 1 to turn on. As an extra test we tried enabling
> 2 different LED for the port resulting in the LED turned off only if
> every led in the reg was off.
> 
> Aside from this funny and strange hardware implementation, the device
> itself have one green LED for each port, resulting in 10 green LED one
> for each of the 10 supported port.
> 
> Cc: Jonathan McDowell <noodles@earth.li>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 120 ++++++++++++++++++++++

Please do not send the DTS patches to the net-next, but to the Qualcomm
SoC maintainers. The DTS must not be mixed with driver code.

Best regards,
Krzysztof

