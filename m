Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E577C77B61
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 09:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbjEAJyC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 05:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbjEAJyB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 05:54:01 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A421E4A
        for <linux-doc@vger.kernel.org>; Mon,  1 May 2023 02:53:56 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-95369921f8eso381065866b.0
        for <linux-doc@vger.kernel.org>; Mon, 01 May 2023 02:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682934834; x=1685526834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2LAaaX3T1102gejNKuIMfwgpgomPZOYq3AaB4DZgS2M=;
        b=COZ6qAXyDJLCOXzJXDsLdMqZM434wQCv0uDnV2J73w8sWz8MioHIy0gY+0P2KGIiRb
         58BiHfD9UtcepfvZZhB3wb3AYDtuuqGUWQubTUVpXDTCchOegxaAme4NKfwTd7NiQJKY
         jobW+FwpbUv6woqc2KMjVlP8ELxp5FXNG+qnkxyXhSW4DvxRJBLxm6uX8Ky94tODisgQ
         mJDdIq1GWgQaqApbcHHdnV8DTrPP+AZCU269IdD2p+H2Lfs1bpub/5Sjig/6wIzFm7de
         RIAEeMjkzeBHV/K++nlDkoSwPpaXEkSbTEDGXgg6xdCNzTQwAW9F+TEjLm61fKYvxckJ
         Y86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682934834; x=1685526834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2LAaaX3T1102gejNKuIMfwgpgomPZOYq3AaB4DZgS2M=;
        b=a1C8STQZVHFDEVMGNeejGiezILIVyPevB3xuMBObsPb8wBW4TW0aNfkYX5ZiDLiRHh
         FgubReVZXm6UStQup4MfQYLDkXHmY7bgsIrSNHrx7Kgn5KIX+fFZxa9H+ekd59GVeJy2
         05K9K556fttuLYCtqaeL7ZaS1/U7IHvTi7OLNc3YIdoCFUfCBHzbWiDGrpjGoESBLgzQ
         t6w/geMto/dolaaPlbRbqa69SwpuHciVOkcyNFq/IUBxrl7VYpiJ5hvWHYT63vFN5GMD
         FTEtlq8YarOMR+L+PFgTn8ynUB128z8oDHy0KTp08D/mfly+gBzgmKPfSJJ6wOOZkJ2n
         /adQ==
X-Gm-Message-State: AC+VfDxc0J6ZaJ+9jxFr3TBBmuU9W6EtYD+OlMC2R5ju0Q+Z9tsjdmHr
        rY5ECHF0G8Q10qtopZmuhcEbtg==
X-Google-Smtp-Source: ACHHUZ4TN6CiMt7jfmu82h2+5M0Puw5ke/1EkQwBWppoXUIN5oBKNEUpvIVsWTKjWC0uIPvSqsjcBg==
X-Received: by 2002:a17:907:97ca:b0:95e:ce4b:b333 with SMTP id js10-20020a17090797ca00b0095ece4bb333mr14048400ejc.53.1682934834504;
        Mon, 01 May 2023 02:53:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id z16-20020a1709063ad000b0094f71500bfesm14540877ejd.4.2023.05.01.02.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 02:53:53 -0700 (PDT)
Message-ID: <9569ef0d-0d94-3ff9-468b-152fe949e7b5@linaro.org>
Date:   Mon, 1 May 2023 11:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] docs: dt: fix documented Primecell compatible
 string
Content-Language: en-US
To:     Baruch Siach <baruch@tkos.co.il>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
 <878regbbr7.fsf@tarshish>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <878regbbr7.fsf@tarshish>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25/04/2023 10:31, Baruch Siach wrote:
> Hi Rob, Krzysztof,
> 
> On Mon, Apr 24 2023, Baruch Siach wrote:
>> Only arm,primecell is documented as compatible string for Primecell
>> peripherals. Current code agrees with that.
> 
> Once again my patches do not show up in patchwork. But they do show in
> lore:
> 
>   https://lore.kernel.org/linux-devicetree/9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il/
> 

You used subject prefix which targets Doc subsystem, but did not Cc Doc
maintainers (get_maintainers do not print them). If you target Rob's
Patchwork, probably you need to fix subject prefix. There is no "dt" prefix.

Best regards,
Krzysztof

