Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C6CC7EE31
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 10:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbjFFK5t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 06:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbjFFK5M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 06:57:12 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3102E62
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 03:56:46 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-514924ca903so8380521a12.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Jun 2023 03:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686049005; x=1688641005;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEsKBsSffmKc/zSAV6wOrR7iFLeq5WaYkyI3CvHytZU=;
        b=vt7AVfq2arf4Qp5A3xYsMz1wdt5wTOuR1cIUFGDWwF34x+Q/CxhGrrilLmcuPuOVH3
         KVXiwsYRji6W04RLTHcRSTQzeiIOEuWZ6mWZRGZihFV3sZffr1KKmXaDNapD+zgymF39
         uI86z8eovwuubmiRV4jiHBV9by8kf4WULN+PXNgC2ld0+DsG6jfzqItIh4AdQgSZWi0b
         HpPjqi3HSEDLr9PpLkdMR8lZkKlK+U7FP4pAATmu646c+ykxn1/TYDhre/cjK1XeMUR8
         DBq/ELdF0EidJYsbnFzm/J0+u95cIC4hDlWJVFQlv3ecvunmjTIJkp+A5EhFt4DIPGan
         BTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049005; x=1688641005;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEsKBsSffmKc/zSAV6wOrR7iFLeq5WaYkyI3CvHytZU=;
        b=RzK1E7KAtuYXEkpgdtTj/9kSsh7Uakah4eteaarng18v8dLPf24TMtIoh5Kb2/b5kP
         pADqmO+8pAwNA+qygEiJIQc2RFZTqF3gvwa94DljvShwe+z2FV+ZwM5CiARs/To1FYZU
         6muXfq5aDwZT4jorY7iBsBXS2elLb5Ae2bp/0X3W5ZlxiCvUgrZoOGAfWqEDUWpe+1qc
         wIapy2edDuBv98QnVzRkLxy2hP++/JvJNFo0PvYlqyUmPkDHk4j5jnrQdP4/Qm/uRMUg
         1rho047H/njOIV9aLeOApLv1p/Q5BHiCHPyyEY/MsJqt6UCrmdJy2l461Z1d0Tn+eKfF
         fukQ==
X-Gm-Message-State: AC+VfDyAQd9+Bo2cimAHPSvlXP0Zgf07Xhjel5Bb62ymsdfoggxP0v5l
        pXDw0wt0sMwWJevulbOICy6mgA==
X-Google-Smtp-Source: ACHHUZ50UOBCxUsXhaGVyDZif/C/c1U/u3c87IyMXAQmNbsv2lf0xkReTrxYEjK7HQ/nqHXyEVfvlQ==
X-Received: by 2002:a17:906:794a:b0:966:eb8:2f12 with SMTP id l10-20020a170906794a00b009660eb82f12mr1715450ejo.11.1686049005533;
        Tue, 06 Jun 2023 03:56:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b00514ad0e3167sm4878151eds.71.2023.06.06.03.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:56:44 -0700 (PDT)
Message-ID: <47d95067-12e0-4b19-6b6d-104532fae1e0@linaro.org>
Date:   Tue, 6 Jun 2023 12:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 5/5] hwmon: Add Aspeed ast2600 TACH support
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        lee@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, corbet@lwn.net,
        p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org,
        patrick@stwcx.xyz
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-6-billy_tsai@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094535.5388-6-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/06/2023 11:45, Billy Tsai wrote:
> Add the support of Tachometer which can use to monitor the frequency of
> the input. The tach supports up to 16 channels and it's part function of
> multi-function device "pwm-tach controller".
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>


> +
> +static void aspeed_tach_reset_assert(void *data)
> +{
> +	struct reset_control *rst = data;
> +
> +	reset_control_assert(rst);
> +}
> +
> +static int aspeed_tach_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np, *child;
> +	struct aspeed_tach_data *priv;
> +	struct device *hwmon;
> +	int ret;
> +
> +	np = dev->parent->of_node;
> +	if (!of_device_is_compatible(np, "aspeed,ast2600-pwm-tach"))

Drop.

> +		return dev_err_probe(dev, -ENODEV,
> +				     "Unsupported tach device binding\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = &pdev->dev;
> +
> +	priv->regmap = syscon_node_to_regmap(np);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "Couldn't get regmap\n");
> +
> +	priv->clk = devm_clk_get_enabled(dev->parent, NULL);

NAK. Parent is simple-mfd, means it must not have clock.


> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "Couldn't get clock\n");
> +
> +	priv->clk_source = clk_get_rate(priv->clk);
> +
> +	priv->reset = devm_reset_control_get_shared(dev->parent, NULL);

NAK, same reasons.

Best regards,
Krzysztof

