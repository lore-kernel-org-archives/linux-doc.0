Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2526FA3742
	for <linux-doc@archiver.kernel.org>; Thu, 27 Oct 2022 19:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236759AbiJ0T5k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Oct 2022 15:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236768AbiJ0T5j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Oct 2022 15:57:39 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9E183069
        for <linux-doc@vger.kernel.org>; Thu, 27 Oct 2022 12:57:38 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id z30so1895704qkz.13
        for <linux-doc@vger.kernel.org>; Thu, 27 Oct 2022 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ShQMKq3f3t9mdNgDE4T4ISWotog7fNGhGUUcv2YoMg=;
        b=hLolaNNJy7xdgsD42DCxWNE5GBXgxjI4Umu9gglZGLPUaFCOYzjOXr39fae0Q0O8MF
         sHp9I+kowEZ/j+fhq3j8frUaMQ/WBAOehsUgwHmJkPYMIPh3W/mbmiNHWvyACkEgNl0u
         WBVnY86DnNjuML5ySVQfzetIWpibwQHcSymX+E3r4Q0ZdgWzHowCbDfAjq4GuUImdPyw
         Gi6hz7XVWHDp+evplMLg+uC5k0iY1rJM8j3jqRVUGpPLMlkaZiZMsXrQLPqno41tocYz
         NhvrJuYCM5QY1rf3mQJcsIjES6656UJ2W3gxyUyhS8hyQWORIakKv7u9lFzxd7n5fA3W
         RY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ShQMKq3f3t9mdNgDE4T4ISWotog7fNGhGUUcv2YoMg=;
        b=Ug1ei9mcHfUFcDNv4i4243FvzYiabO+q0ycDP1TlqHrbuNC2/rkN7zfaAMejzPE4wP
         T7FgWJaqrHlc9H2uPzL+vHa+05ibbI0etXy+lb02TgZetguscCGP0XfxNjgOwpyNUuMc
         zbdILk0wsyDqOuLdYcVO/I7pcRIAwQOugTkdy8RxqSiu8nWsUpBRam6qTq4GJ5plAdTO
         /yyovninwNUAyBNZqQzRaYbWt51TQcWQ23jxi8Z4BaRQ5bL91tZQIEpW6W/OV3oY3HE/
         PsJNL8yd5uHZKKkrUCpdoTOupfRbWpwh59bzRXQ4m9wqHqzy6OCczxWHh4BKRXfNWfAL
         CQvg==
X-Gm-Message-State: ACrzQf1Yt62tX3WAQVF8sAk8orYmtWBxuteqFs+FBv0kj7G2vp+ktPBm
        36KBIWwFgxzHjfQ1Z8aXrWXApA==
X-Google-Smtp-Source: AMsMyM4yWtOgOkt8YKdLB/crE8PcyGzMyTwx009SvdvsTbcpFw9bukNS9N5IRIVhT6odNhEr6wWlvw==
X-Received: by 2002:a05:620a:6011:b0:6ee:b2c1:686b with SMTP id dw17-20020a05620a601100b006eeb2c1686bmr35608281qkb.492.1666900657261;
        Thu, 27 Oct 2022 12:57:37 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id s4-20020ac85284000000b0039c7b9522ecsm1357716qtn.35.2022.10.27.12.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 12:57:36 -0700 (PDT)
Message-ID: <927392f9-aec5-7a34-b1ab-236a8d19d79c@linaro.org>
Date:   Thu, 27 Oct 2022 15:57:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v6 02/21] dt-bindings: Add binding for gunyah hypervisor
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026185846.3983888-1-quic_eberman@quicinc.com>
 <20221026185846.3983888-3-quic_eberman@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026185846.3983888-3-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26/10/2022 14:58, Elliot Berman wrote:
> When Linux is booted as a guest under the Gunyah hypervisor, the Gunyah
> Resource Manager applies a devicetree overlay describing the virtual
> platform configuration of the guest VM, such as the message queue
> capability IDs for communicating with the Resource Manager. This
> information is not otherwise discoverable by a VM: the Gunyah hypervisor
> core does not provide a direct interface to discover capability IDs nor
> a way to communicate with RM without having already known the
> corresponding message queue capability ID. Add the DT bindings that
> Gunyah adheres for the hypervisor node and message queues.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../bindings/firmware/gunyah-hypervisor.yaml  | 86 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> new file mode 100644
> index 000000000000..3a8c1c2157a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> @@ -0,0 +1,86 @@
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
> +  Gunyah virtual machines use this information to determine the capability IDs
> +  of the message queues used to communicate with the Gunyah Resource Manager.
> +  See also: https://github.com/quic/gunyah-resource-manager/blob/develop/src/vm_creation/dto_construct.c
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: gunyah-hypervisor-1.0
> +      - const: gunyah-hypervisor

You are sending next version while we still keep discussing old one...
and without necessary changes. Instead keep discussing the previous one
till we reach consensus.

These compatibles look wrong based on our discussion.

Best regards,
Krzysztof

