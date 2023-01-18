Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30DBC38159
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 12:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjARMXP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 07:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjARMWc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 07:22:32 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF3A5A363
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 03:43:44 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso1196925wmc.4
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vn93inJ4bTtG1cGSDdg+oHnqZVw5zHDa3f6LKH3htng=;
        b=d+OV15Cp1QiEo9qCuYZNJQ01/OLL4NHWtP7dnZzmdr6kpue5/9XyqolE15679koJTL
         3ZUcPGRZgzik0i+mywaZSdz1sOSkkEqpSJvDAUb7CfdPHjpnUT4vMQ1XO6/cqnjM394J
         xEWfZ367WdGmqbTvb5nxWjCZMBzL5HCq3h+upzAu32XhkgmFquxF89Y7lHOXIx2b9OgD
         gSyQZB5B8eDMAG3nqhDtIf93rvuOCFpowaIdaQw/ulVdavqdMf5+62qF1Kb7eeuYX2MQ
         5Ot4B+rRCYEyMrG9bhedcgrc9MOxAE/4j//MPiai4lg6d/MijvGQrzlnra0M9eeLvSpU
         V3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vn93inJ4bTtG1cGSDdg+oHnqZVw5zHDa3f6LKH3htng=;
        b=d8ovl8gFs9Lo4ZA4GiVx8+VqbpBPqukU4+tCbLT7RKTxUbiLWnXlwIrT/CI6GVLVCU
         nBpalnF0I+fMiwk1GAiraMUzchRTsrub1J04AqvdOsayJIY/wEWqvML5eJ8z3nZQ9+dD
         nyaJpogXP4XZ+KrEN6IbxxTDjU3QsSfBKBK9P02TSYjoDhAlEsoXJ3fedmutsT9YtNuz
         iVWq8rbDwYQcjUEyBVAmRl/ShglgdNn+SrdIBaHFtX3PJHO4ztKXASdXw/h5gCWow1dc
         yR/7S4lLWVqBN1hG9PaxkLt6Bx0zFM02Kd+KuyI+cxklWpnd1nXY7W1PKG6A2HHEquMd
         WFiA==
X-Gm-Message-State: AFqh2kpFVj4IynDEzhQggapfspEI85u2PsnC+2xqNws2BUNb6CPgzkHA
        mKS2ktNCoKGUvmxwf0R/5kKV2Q==
X-Google-Smtp-Source: AMrXdXv5fgECp3GO/5YMSbVKAmLwdjAXNgSIypPT6DsToxURxC2zgPr+om30Q0dvjZRKqC0RuyKthQ==
X-Received: by 2002:a05:600c:3c91:b0:3da:f5d1:c677 with SMTP id bg17-20020a05600c3c9100b003daf5d1c677mr2323702wmb.35.1674042223254;
        Wed, 18 Jan 2023 03:43:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q24-20020a05600c331800b003d1de805de5sm1636884wmp.16.2023.01.18.03.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:43:42 -0800 (PST)
Message-ID: <ecffda73-9c73-1dbe-3da1-93c205128277@linaro.org>
Date:   Wed, 18 Jan 2023 12:43:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: add nxp,mc34vr500
Content-Language: en-US
To:     Mario Kicherer <dev@kicherer.org>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
References: <20230117161340.1310936-1-dev@kicherer.org>
 <20230117161340.1310936-3-dev@kicherer.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117161340.1310936-3-dev@kicherer.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/01/2023 17:13, Mario Kicherer wrote:
> This patch adds dt-bindings for the NXP MC34VR500 PMIC.
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> ---

Except being untested one more comment:

> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      mc34vr500@8 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

