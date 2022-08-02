Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70F4C19F2B
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 10:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbiHBKyX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 06:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236057AbiHBKyU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 06:54:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBB018B1A
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 03:54:18 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s14so15205505ljh.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=k/Q7X6FiTaxzyTMXxbbQRlGSpVkQViGsC2v5dU+gKqs=;
        b=my2KLGdr1IhY1mYpjSo3vp1aSC2H0iWCr0XrDEVg+DDFbGVMt9k4y7TNZSZ4WAySHR
         jEbtXsvd2SxKaJFO9iCFYbQ1Xf2IA+U7pdpE4mgqQ6cjCGDsnWATLf3QncJ9Yhqq2f4A
         JDa2IUF1aGgDEge1N/9hH2yD3JYKH7aB297cR1RAT/hucRkBJc2jqlP1kZMd4K0s1VO3
         rCYNwqFeRL3KoXrr9EtPFuC4bqKmvrsX2sBVKWEmq09d5CpxA8AM0BXrBtsvElD2Kchi
         XSzFoKf0BDZA3kerx+brFWTlsOGgjr3kWQ7IVwoTui/BmB0OVWX5TXEo4lVGl/0IPL9o
         jhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k/Q7X6FiTaxzyTMXxbbQRlGSpVkQViGsC2v5dU+gKqs=;
        b=QDezuc8YcS8i6HajNRebakTotoeZte40SPyqGCN3yOZTdBxBiiyEYUsWCLmEusybk/
         MbQSWBUUxvaQe9qfhoTSJJ5FSAahon+IQgc9+RkJaxZKkbUO0pV7L5BxkKX4+mu9o3kX
         uza3HlaC0taRqdcCL84lY0bImdgV/vQI13g4voHmwwb+Zo41DZcAvhM6L3jVy63Xv7G3
         bRCJ1L7i6hv7RnBqWc+kTsiXtxICGFYgqmTpN78fO6bGQBW1A17oKxRnjfHAszqyokD9
         kR1e+T44lihOoITqE4SYGqyOfTZkr4IS4ywJknBBoB88JGs1El5wLHHaPkuir7WlBf0E
         ry/g==
X-Gm-Message-State: ACgBeo2yL0bTmyeTrknSMmsEHa/ClYt6CzDAwNaMBAZYiApsgYjqCWpo
        lnp1HSUuDiphYqRCPOJw6+NCJw==
X-Google-Smtp-Source: AA6agR6cc+tQ3dfd9VGRdTgGi1UQwgjRLGNCZ6mtI3GN0976KBHlTjTPg6i/IR0SEBdEcoTYZTj1dQ==
X-Received: by 2002:a05:651c:211e:b0:25e:4fa0:1512 with SMTP id a30-20020a05651c211e00b0025e4fa01512mr2951334ljq.39.1659437656758;
        Tue, 02 Aug 2022 03:54:16 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id a19-20020ac25e73000000b0048b120ba622sm149440lfr.81.2022.08.02.03.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 03:54:16 -0700 (PDT)
Message-ID: <26aa894f-7680-478e-7dc1-a42c0ea22c4a@linaro.org>
Date:   Tue, 2 Aug 2022 12:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 02/11] dt-bindings: Add binding for gunyah hypervisor
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-3-quic_eberman@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220801211240.597859-3-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/08/2022 23:12, Elliot Berman wrote:
> When Linux is booted as a guest under the Gunyah hypervisor, Gunyah
> applies a devicetree overlay describing the virtual platform
> configuration of the guest VM, such as the message queue capability IDs
> for communicating with the Resource Manager. Add the DT bindings that
> Gunyah adheres for the hypervisor node and message queues.

Previously you explained that this cannot be discoverable, because EL2
hypervisor follows micro-kernel architecture and it is small. Size of
your code is not a reason to push things to DT... This is a kind of
explanation like: we did not add auto-discoverability, because we don't
want to add more code.

> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../bindings/firmware/gunyah-hypervisor.yaml  | 84 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> new file mode 100644
> index 000000000000..e50d932e768c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/gunyah-hypervisor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Gunyah Hypervisor
> +
> +maintainers:
> +  - Murali Nalajala <quic_mnalajal@quicinc.com>
> +  - Elliot Berman <quic_eberman@quicinc.com>
> +
> +description: |+
> +  On systems which support devicetree, Gunyah generates and overlays a deviceetree overlay which
> +  describes the basic configuration of the hypervisor. Virtual machines use this information for
> +  initial discovery that they are running as a Gunyah guest VM.
> +  See also: https://github.com/quic/gunyah-resource-manager/blob/develop/src/vm_creation/dto_construct.c
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: gunyah-hypervisor-1.0
> +          - const: gunyah-hypervisor
> +
> +  "#address-cells":
> +    description: Number of cells needed to represent 64-bit capability IDs.
> +    const: 2

Blank line between definition of each property.

> +  "#size-cells":
> +    description: must be 0, because capability IDs are not memory address
> +                  ranges and do not have a size.
> +    const: 0
> +
> +patternProperties:
> +  "^gunyah-resource-mgr(@.*)?":
> +    type: object
> +    description:
> +      Resource Manager node which is required to communicate to Resource
> +      Manager VM using Gunyah Message Queues.
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          - items:
> +              - const: gunyah-resource-manager-1-0
> +              - const: gunyah-resource-manager

Blank line.

> +      reg:
> +        items:
> +          - description: Gunyah capability ID of the TX message queue
> +          - description: Gunyah capability ID of the RX message queue

Blank line.

> +      interrupts:
> +        items:
> +          - description: Interrupt for the TX message queue
> +          - description: Interrupt for the RX message queue

Blank line.

> +    additionalProperties: false

Blank line.

> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    hypervisor {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        compatible = "gunyah-hypervisor-1.0", "gunyah-hypervisor";
> +
> +        gunyah-resource-mgr@1 {
> +            compatible = "gunyah-resource-manager-1-0", "gunyah-resource-manager";
> +            interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>, /* TX full IRQ */
> +                         <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>; /* RX empty IRQ */
> +            reg = <0x00000000 0x00000000>, <0x00000000 0x00000001>;
> +                  /* TX, RX cap ids */
> +        };
> +    };


Best regards,
Krzysztof
