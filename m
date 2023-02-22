Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C662C6379F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Feb 2023 08:40:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjBVIkP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 03:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjBVIkO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 03:40:14 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5771360A6
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 00:40:12 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id f13so26666676edz.6
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 00:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lR+ISQQSb0vmBiGpqXlpCKGu34UyCzsJKioNfm+3xdA=;
        b=KIr+5u8tc47eHv6DkkJqDeie1JQk4hY22L8yH26fDT81Zx+yYccFRNvZfGErS/JwgE
         CkFTu4B3dTBom6tlDAwOKATkapR/iOJYg+iJK4VHTkXHpOfJVFgSH5DXftj8ZU/agotq
         35qCt4kfM1oA7fUFnXluAKK8qz9YXpPBBmC4oqmjx1kpKurIgc2q5bHCEJIImZa6Vl29
         LDxG5C/+Io3PGuebh/xBRhqYtOJ5AbzvYMLWtPKn6Hw37AKvuI/w/050rIMCDvSIGFdj
         TY7LrQmsvqagR/tB59EO3jMP3aZyI9yO1hgVgCjWYZlMnCRN+9T20pPlUrxmfQvsNtSi
         IBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lR+ISQQSb0vmBiGpqXlpCKGu34UyCzsJKioNfm+3xdA=;
        b=2C3a/FmcpCbmzrQeHuKTABF0ABaHTedyu90UOURe2sbxSLYiFRwxKverlOTaUvrzYL
         OzWIwXlf/8Qd568ypVv4bEWwJyElfOAMPcCDSlzm0mEfYe6FCvMGAYBsBBbGqE7fq7xJ
         7c1l+F+HZ68gYiAxMO6YyUuk/7RUBAbIObMDN3G86UZf4rNJDMDeuWz8zm4XPrcrHsNC
         TnLHj6hvqThlRfdM/Oa+gTUcrqoWrwYYAXRGQddjCrk26pqzjxynzniCOs386uZfY4Sb
         QJEnWYNT9hhF5XdDB5K+tvS48bHXaf8to80x+Ddx5QayzoJ9pmu3wdcDo5tcma+b1cUo
         Gn4g==
X-Gm-Message-State: AO0yUKWgxXe+enM00OF9gVZKevWjnN/ZjvQr4ihLxX7/TAeWUFQ0/oM6
        eMUCi0rJVkaQiCKWbsG8Xn7Kew==
X-Google-Smtp-Source: AK7set8iXoGezZDOE3ZDJrGYpXVqhY+danP4XJR6egsj0cAxZ2DnpxbBKjpo8ym6+Oa7myY+JjJauQ==
X-Received: by 2002:a17:907:3e22:b0:8e3:8543:8e71 with SMTP id hp34-20020a1709073e2200b008e385438e71mr5006300ejc.40.1677055211264;
        Wed, 22 Feb 2023 00:40:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 6-20020a170906318600b008e03af7e7c9sm1708450ejy.188.2023.02.22.00.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:40:10 -0800 (PST)
Message-ID: <939ffe2e-9b03-528a-3d27-e9eac7a04ded@linaro.org>
Date:   Wed, 22 Feb 2023 09:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/4] dt-bindings: mfd: Add DT bindings for TI TPS6594
 PMIC
Content-Language: en-US
To:     Julien Panis <jpanis@baylibre.com>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        corbet@lwn.net
Cc:     hdegoede@redhat.com, eric.auger@redhat.com, jgg@ziepe.ca,
        razor@blackwall.org, suma.hegde@amd.com,
        stephen@networkplumber.org, arnd@arndb.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, eblanc@baylibre.com,
        jneanne@baylibre.com
References: <20230216114410.183489-1-jpanis@baylibre.com>
 <20230216114410.183489-2-jpanis@baylibre.com>
 <c50503f0-dce1-a3b0-2973-8a22b5ef8bc2@linaro.org>
 <4e64838c-b727-923b-b6d5-413a0681977c@baylibre.com>
 <8de5a3bb-a0b1-8d69-cf61-0c33f42c56f6@linaro.org>
 <85183c04-40e3-fd97-c4ca-06795fe99e40@baylibre.com>
 <ce5f8e9c-0e05-3391-1393-25ea8086f10c@linaro.org>
 <633753f7-2b8a-15bb-ba55-1c5a6f2eb3f1@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <633753f7-2b8a-15bb-ba55-1c5a6f2eb3f1@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21/02/2023 16:18, Julien Panis wrote:
>>>> It looks the property should be only in the drivers, not in the DT.
>>> I will remove 'ti,use-crc;' property from the DT. This will be only in
>>> the driver.
>>> Do you also consider that a property such as 'ti,is-secondary-pmic;'
>>> would not be acceptable either ? From driver point of view, this
>>> primary/secondary role on SPMI bus is a 'built-in' property of the
>>> PMIC (CRC must be enabled only via primary PMIC but using the
>>> primary PMIC does not imply that CRC is necessarily used).
>> Depends, I am not sure. Are the PMICs in some kind of hierarchical
>> topology? Like one is parent of another? If not (so both are
>> parallel/equal children of SPMI bus), then some property to indicate
>> which one is the main PMIC makes sense.
> 
> There is no hierarchical topology.
> So, I will consider identifying in DT which one is the main PMIC.

Yes. Such property would be also better than the "use-crc" as it
describes the hardware, not desired Linux driver behavior.


Best regards,
Krzysztof

