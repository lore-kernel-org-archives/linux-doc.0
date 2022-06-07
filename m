Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F58CC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jun 2022 12:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242481AbiFGMPQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243612AbiFGMPF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jun 2022 08:15:05 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5809AC50AF
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 05:15:04 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z7so22705044edm.13
        for <linux-doc@vger.kernel.org>; Tue, 07 Jun 2022 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=5fH4FavPEfvLlMdMUWk9QQO46jHXVYLmKxePrfhtVTY=;
        b=xPL8KUcGOJQUW6FJ7vqGgkD7DnRuM9BbLBv1xfktYaCGemXr11kTt9hlgeR/rWy44D
         RsbYk+vgElonYHAOitiDzU81OjYUZLQqszvIIvJ8BpRX2kpcjCt9TbgRahx6J+Io1klS
         zCNPJEXCjy6asJRwIsfFUAm7JkpXdMqLGz0e8rUBCSiQdEibs2iO0eG4bY1idePyGUFM
         W6tscg+T2Y3QVHGUICuDo4KuG+UNCredWNAO604DOki/ZTHUia4AKV414vtxYnMvRlti
         82Suy2cGUjUiiTJNd3MpvBGtZfaEM5v6+fqBr2lMtfX2H4A8fsNkJdBn3UBWe+R31trJ
         Cu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=5fH4FavPEfvLlMdMUWk9QQO46jHXVYLmKxePrfhtVTY=;
        b=UmqlCpNnNaXyrvaLj2Uw9TcddwXLeUtiH9IuOXxrxhea6MkAtfo2XlitX3LstDavI8
         2KzBjos0NRmU/XQuIH0GUc7vZTXQKBMvVllgcHPnz22q3MNyOamYdbKY+kpFbhXyQfWn
         0v9vi6Wxm2+ZFwKaKlrJyu3UsA2QCrO/qscnjHCTCwXiPFqCX3saWcQK59D/vcH8Q9b9
         +AmYuvwhOY9UuxGUY1bW2LABG3xbb/98/Na5xIJf4r7wa18XE5A6/N3K/dQetoeu2p7z
         2pjpgvgN23PX3h/B5oKLL67mr8DBTme4T6H+ZGxHgyXoOKyYLfdj22U6zzyu7O2kC2wv
         wC+A==
X-Gm-Message-State: AOAM531x7YHe/jVFlTOKTBSmlHcRNI7IleSBPwx8zEwi/vI6By0g6Lfp
        +HP4emK7kMAgc9Wxb4Xr4AfS8Q==
X-Google-Smtp-Source: ABdhPJx0DSqjBZ+b9BV4kl1YSSXSZRVKSEOfofAh7Iqy1JDvVeOQvA2sW119u0gPadHqCpd/wWJZ+A==
X-Received: by 2002:a05:6402:254e:b0:431:35df:5e38 with SMTP id l14-20020a056402254e00b0043135df5e38mr18206654edb.385.1654604102905;
        Tue, 07 Jun 2022 05:15:02 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v2-20020a170906b00200b006ff05d4726esm7576280ejy.50.2022.06.07.05.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:15:02 -0700 (PDT)
Message-ID: <92db548d-aaa7-aac5-a56b-e787769ab0fb@linaro.org>
Date:   Tue, 7 Jun 2022 14:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/23] dt-bindings: mmc: exynos-dw-mshc: update
 samsung,pinctrl.yaml reference
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1654529011.git.mchehab@kernel.org>
 <5c937793dd7aec30da4964b39561072ae184f89b.1654529011.git.mchehab@kernel.org>
 <5fe2246f-97db-e7b0-a72e-c8c5ff6b2abe@linaro.org>
In-Reply-To: <5fe2246f-97db-e7b0-a72e-c8c5ff6b2abe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/06/2022 17:41, Krzysztof Kozlowski wrote:
> On 06/06/2022 17:25, Mauro Carvalho Chehab wrote:
>> Changeset af030d83da1d ("dt-bindings: pinctrl: samsung: convert to dtschema")
>> renamed: bindings/pinctrl/samsung-pinctrl.txt
>> to: bindings/pinctrl/samsung-pinctrl.yaml, splitting it into multiple
>> files.
>>
>> Update exynos-dw-mshc.txt accordingly.
>>
>> Fixes: af030d83da1d ("dt-bindings: pinctrl: samsung: convert to dtschema")
>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Commit is okay, but you can also drop it entirely because entire part
> will be removed with:
> https://lore.kernel.org/all/20220605163710.144210-4-krzysztof.kozlowski@linaro.org/

Which was now applied by Ulf.

Best regards,
Krzysztof
