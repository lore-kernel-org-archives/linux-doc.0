Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1027C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 10 May 2022 06:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236489AbiEJGVg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 May 2022 02:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235067AbiEJGVf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 May 2022 02:21:35 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945542608F4
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 23:17:38 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id r192so9661080pgr.6
        for <linux-doc@vger.kernel.org>; Mon, 09 May 2022 23:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3mMuHUw5LQd/2OaJhbwqHqpakfsb1/nemKao8lTZC2E=;
        b=F2y7Ag0zL0xv/YfLDk9kaKHLdhBugPOF73IGWK9tZaihnlc4jklTQZw1jlw0Vq8qJU
         wiVL9BkMBZU9srdavDr63fecPuIXKZEnA6UiVh7EcMtoeZFom27ufJIQ0U8FOmfW5yZa
         lzVDlky2rCMwNkLV4WCg9Qs8sncapXhIo+ap6/OW3Q9H05QkMfo25Cw2Cgsdd277QD06
         s7VGsnNC+Y83Gu24aPGhIgsYG9yWO5DZV1KLNrsp6jteENCKE92F+gwfMrocHUynkNfP
         H1/x9Em0YgvTlDHT4ORr7wgy3tSvK8UhJ9zGgpvXqOEVy5BNxX+JL+NnRm5s2p+RkvKY
         Kocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3mMuHUw5LQd/2OaJhbwqHqpakfsb1/nemKao8lTZC2E=;
        b=VarJ5cKznxEXm7qrQDFpyUVGDbhM8s+ZAcY/gjuzOMUKS/ovc+tNSQJF1wusIccViT
         tCAq+ZpKp41YUQqqgzq4fAWNAgL7B6oIre4Z/JrFp/7aIMgdsJW4vEcynlCL/owI7vnA
         mt3V1V+O+MWfoxmyb3fGYSFjnNbDXLp01sjkHIeEBiHQEFAzueoTMaTWkcpV42xLWzsO
         Lg4GaVfFcCa2vI/Msiz3xEcJBoUnX+qVNbCpf6/i1C5hTUWPaSAlRkwdVZgDaTmvllRz
         BidBgrq3WD+i57AJBaRvZktC2JWFQcSfWZV9oTbB5fJMbk0UjT1wVktsa9o+TzhlwalS
         VGgA==
X-Gm-Message-State: AOAM530WfqIxSPJD/YCyUMgge4FkE/WP+610Q3h+yRCJHuhTz26UwMDu
        +tKim7/NV7o31EoPSBh0itJ7DH8HErVb2ZSj
X-Google-Smtp-Source: ABdhPJyF4/rQn1UiHuqSaCXBbWBSwLw4FXKxSPC0Tm4BobhodNwR0GKYUL4pu28E3ov4MjRTstNpXA==
X-Received: by 2002:a63:cc4f:0:b0:3c5:fc22:f6a with SMTP id q15-20020a63cc4f000000b003c5fc220f6amr15775019pgi.67.1652163458103;
        Mon, 09 May 2022 23:17:38 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id bg9-20020a1709028e8900b0015e9f45c1f4sm1013160plb.186.2022.05.09.23.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 23:17:37 -0700 (PDT)
Message-ID: <df5cd5b7-238e-2e12-09e8-c892f0394818@gmail.com>
Date:   Tue, 10 May 2022 14:17:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] docs/zh_CN: fix devicetree usage-model translation
Content-Language: en-US
To:     Huilong Deng <denghuilong@cdjrlc.com>, alexs@kernel.org,
        corbet@lwn.net
Cc:     siyanteng01@gmail.com, linux-doc@vger.kernel.org
References: <20220510020135.55452-1-denghuilong@cdjrlc.com>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <20220510020135.55452-1-denghuilong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 5/10/22 10:01, Huilong Deng wrote:
> machine_desc is a item in devicetree, shouldn't be half translated. Let's
> keep a whole word untranslated.
> 
> Signed-off-by: Huilong Deng <denghuilong@cdjrlc.com>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  .../translations/zh_CN/devicetree/usage-model.rst         | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/devicetree/usage-model.rst b/Documentation/translations/zh_CN/devicetree/usage-model.rst
> index 318a3c6a0114..accdc33475a0 100644
> --- a/Documentation/translations/zh_CN/devicetree/usage-model.rst
> +++ b/Documentation/translations/zh_CN/devicetree/usage-model.rst
> @@ -120,24 +120,24 @@ dt_compat列表（如果你好奇，该列表定义在arch/arm/include/asm/mach/
>  表示什么。在Documentation/devicetree/bindings中添加兼容字符串的文档。
>  
>  同样在ARM上，对于每个machine_desc，内核会查看是否有任何dt_compat列表条
> -目出现在兼容属性中。如果有，那么该机器_desc就是驱动该机器的候选者。在搜索
> +目出现在兼容属性中。如果有，那么该machine_desc就是驱动该机器的候选者。在搜索
>  了整个machine_descs表之后，setup_machine_fdt()根据每个machine_desc
>  在兼容属性中匹配的条目，返回 “最兼容” 的machine_desc。如果没有找到匹配
>  的machine_desc，那么它将返回NULL。
>  
>  这个方案背后的原因是观察到，在大多数情况下，如果它们都使用相同的SoC或相同
> -系列的SoC，一个机器_desc可以支持大量的电路板。然而，不可避免地会有一些例
> +系列的SoC，一个machine_desc可以支持大量的电路板。然而，不可避免地会有一些例
>  外情况，即特定的板子需要特殊的设置代码，这在一般情况下是没有用的。特殊情况
>  可以通过在通用设置代码中明确检查有问题的板子来处理，但如果超过几个情况下，
>  这样做很快就会变得很难看和/或无法维护。
>  
> -相反，兼容列表允许通用机器_desc通过在dt_compat列表中指定“不太兼容”的值
> +相反，兼容列表允许通用machine_desc通过在dt_compat列表中指定“不太兼容”的值
>  来提供对广泛的通用板的支持。在上面的例子中，通用板支持可以声称与“ti,ompa3”
>  或“ti,ompa3450”兼容。如果在最初的beagleboard上发现了一个bug，需要在
>  早期启动时使用特殊的变通代码，那么可以添加一个新的machine_desc，实现变通，
>  并且只在“ti,omap3-beagleboard”上匹配。
>  
> -PowerPC使用了一个稍微不同的方案，它从每个机器_desc中调用.probe()钩子，
> +PowerPC使用了一个稍微不同的方案，它从每个machine_desc中调用.probe()钩子，
>  并使用第一个返回TRUE的钩子。然而，这种方法没有考虑到兼容列表的优先级，对于
>  新的架构支持可能应该避免。
>  
