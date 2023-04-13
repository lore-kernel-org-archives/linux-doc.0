Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84574C77B6E
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 13:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjDMNFL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 09:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjDMNFL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 09:05:11 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E776E6A42
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 06:05:08 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id xi5so37235790ejb.13
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681391107; x=1683983107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RhPvah70z+eyBLakI2k2O3UgMIi0l1eU1A4H/8LZsnA=;
        b=R6uaPIXfQmx43NMsDubyle99U+EyV+YjY87xPwBNOdey4pJBwhd0txY8DmmFSQK0D7
         xL8sivpMkCNP/Dye01gKxrxiFCRxuEz0iuF0f/W6IsgXwOvLSW8xN3PUW1A5du/CIAYp
         JawQyJYNyKzY/Dorli9ESJfplmIOT3eCgPZh12+Q7zuJkesXGQpshX/izNukldebWA8n
         zmNfloppsDQQDVfgMbvONeP17r2ciNPFb8s7g+PuYM67T5yXqe2LlZJyv9XNbVYVAjJT
         rkXf4Sh5P0Zt13P64vPqWXDiAGEWsrN1beNZH9DKt6zpESQ89ICXK0bfzxbY27HvgQ5p
         0aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391107; x=1683983107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhPvah70z+eyBLakI2k2O3UgMIi0l1eU1A4H/8LZsnA=;
        b=dpRqdLCay9u8cIJ8/EyS+Vw3kDQl9q8g/2fdin8+GBJSm6TPY7TEVeGnj18GnlAc2y
         2YGQml0Xs942pNfntrySiI+12iQmkN3AMXUoYu3oaA5EI2RUIYIk6MzWOzVKT7L1725y
         CGxjSJd6RTs4GvzFuYGi3l+9QnMtczwlWyCyvPLoQ80QbPFFRC1B1Sfu6Gx88zoET9TB
         IhbYkc8iYUgSzBzRUqhpHQhHJsYmaNzqf6ymBW4WWu4NsihouuH7ZRAko4bVnN+mKL9Y
         Cfy+NQRJsGvWAXK2nU/N4pdBM/2uBzMpU4o02nZZSM0uNLXbuOwGFNI4ErxV3PEPP/lh
         sc4Q==
X-Gm-Message-State: AAQBX9chQigkc4Z2EFODRMUhLvmRPdcQ+/at14r94VyT0RvfGyG8QfWe
        L0JVoYQWe+1mZl5AnLE3CjWUjA==
X-Google-Smtp-Source: AKy350YASwzdPHjKTP+s0mH1PP0hpEhhISJBRLnSGOThmUTpq/f5wf+uWOOX3kNRO4JdIAKsaj4XcA==
X-Received: by 2002:a17:906:6096:b0:94e:b717:5e3d with SMTP id t22-20020a170906609600b0094eb7175e3dmr927133ejj.60.1681391107416;
        Thu, 13 Apr 2023 06:05:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5032:d2d4:ece5:b035? ([2a02:810d:15c0:828:5032:d2d4:ece5:b035])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709067ad000b0094e6504d132sm956204ejo.167.2023.04.13.06.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:05:06 -0700 (PDT)
Message-ID: <8ace9b0f-742a-7ebc-555f-1f8be04a5955@linaro.org>
Date:   Thu, 13 Apr 2023 15:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 2/6] dt-bindings: hypervisor: Add binding for MediaTek
 GenieZone hypervisor
Content-Language: en-US
To:     Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Jades Shih <jades.shih@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Ivan Tseng <ivan.tseng@mediatek.com>,
        My Chuang <my.chuang@mediatek.com>,
        Shawn Hsiao <shawn.hsiao@mediatek.com>,
        PeiLun Suei <peilun.suei@mediatek.com>,
        Ze-Yu Wang <ze-yu.wang@mediatek.com>,
        Liju Chen <liju-clr.chen@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
 <20230413090735.4182-3-yi-de.wu@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413090735.4182-3-yi-de.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/04/2023 11:07, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> Add documentation for GenieZone(gzvm) node. This node informs gzvm
> driver to start probing if geniezone hypervisor is available and

Subject: drop second/last, redundant "binding for". The "dt-bindings"
prefix is already stating that these are bindings.

> able to do virtual machine operations.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>  .../bindings/hypervisor/mediatek,gzvm.yaml    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml b/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
> new file mode 100644
> index 000000000000..35e1e5b18e47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hypervisor/mediatek,gzvm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek GenieZone hypervisor
> +
> +maintainers:
> +  - Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> +
> +description:
> +  GenieZone is MediaTek proprietary hypervisor. This device node informs its
> +  driver, gzvm, to probe if platform supports running virtual machines.

Do not describe Linux, we all know how driver binding works, but
hardware/firmware/hypervisor.

I don't know if we actually want to support proprietary hypervisors.
There can be hundreds of them, one per each SoC manufacturer, and they
can come with many ridiculous ideas.

> +
> +properties:
> +  compatible:
> +    const: mediatek,gzvm
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hypervisor {
> +        compatible = "mediatek,gzvm";
> +        status = "okay";

Drop status.

Best regards,
Krzysztof

