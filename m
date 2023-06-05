Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1AFC77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 21:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbjFEVcC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 17:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbjFEVbv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 17:31:51 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6853C5
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 14:31:49 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f7353993cbso17244805e9.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Jun 2023 14:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686000708; x=1688592708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vsMxNf5Vwnvm2j+EraOyZ9qeS4I0RPX8I6SvaUZOdto=;
        b=HlPR1u+9slU6Kh0sKqpFxjLqAhj3HVgrM5rhkeVdQzg+ltKR7EjgTtrIsKCe3n9y93
         pNyT45KPRtzDHaC4zX4ffuzdhyE0a5W37rBANoOQaFuCeblYnozvrtA2hlUw3PrwNzIf
         YhIxUIbFtyC92xac1lgdQ0zXVqUCaxOEsX72Tk+O3UsP9sNPUOGzzjVPB2bneZ+UiVob
         E2pK/G1qKpvsmB4CvO8TvDkP2B53bbi/4AN4dhjFZhnq7T7nOVtt68guUXGQqkvddmDH
         uYduFaoiEJbzE2y0+ltWXjSIR0gmkws4abvzQ4zzO8nDAIaHD48A3TUZnlMJWbsmoyEZ
         x5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686000708; x=1688592708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsMxNf5Vwnvm2j+EraOyZ9qeS4I0RPX8I6SvaUZOdto=;
        b=Qo2LrGz1n/zKnb3d+qdOGBYQB49jcggbt3R81zw+jt74v9H6qcAkPQ0/gAa/dM2pum
         H2x4RBH0EPI5NnGmVDtbBh5rhNlb0yMAr8eYW0I0kaX8N7CYDC7voAtlrj3rLsVVKxgC
         SDJEGqZUhT7ThQPPVaYRkb1+OxC7EUCpNa4r/Yaxzhu4IPAj9jfVjkJAyJt400gwgKOz
         VVpZmM7y9T8l6bohrEaEsa+X8i84nHZOM3tzQh+fOXKukLDhaRNQ495TLXbyH2gmSAl+
         1wdDEB4FZSghqUNhbF5z7fIX0B0RQBej00b1k6iG2jWBTdurTZZx0OJEIU5r7tYEH2k6
         oLyA==
X-Gm-Message-State: AC+VfDx7LxWfdLKv3tZLg+9e8Mh11JIjdpHSelhPqxnxXbw0t8f9ONSt
        Yy4dXggJJfI9mYUkKSG2ksbFdg==
X-Google-Smtp-Source: ACHHUZ7MIqGXI0X1CHiRRjTcLBKm1keweji4T/dx4MuwL38Bn/t+21v6YqBFecokhEPRTcSaX4cbgQ==
X-Received: by 2002:a05:600c:1d98:b0:3f7:367a:38cb with SMTP id p24-20020a05600c1d9800b003f7367a38cbmr4859123wms.2.1686000708386;
        Mon, 05 Jun 2023 14:31:48 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id j27-20020a05600c1c1b00b003f4283f5c1bsm398001wms.2.2023.06.05.14.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 14:31:47 -0700 (PDT)
Message-ID: <29c5ffd5-6300-4fa5-f391-fc0b7ac97831@linaro.org>
Date:   Mon, 5 Jun 2023 22:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 02/24] gunyah: Common types and error codes for Gunyah
 hypercalls
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Alex Elder <elder@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-3-quic_eberman@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230509204801.2824351-3-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 09/05/2023 21:47, Elliot Berman wrote:
> Add architecture-independent standard error codes, types, and macros for
> Gunyah hypercalls.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---

lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   include/linux/gunyah.h | 83 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>   create mode 100644 include/linux/gunyah.h
> 
> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
> new file mode 100644
> index 000000000000..a4e8ec91961d
> --- /dev/null
> +++ b/include/linux/gunyah.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _LINUX_GUNYAH_H
> +#define _LINUX_GUNYAH_H
> +
> +#include <linux/errno.h>
> +#include <linux/limits.h>
> +
> +/******************************************************************************/
> +/* Common arch-independent definitions for Gunyah hypercalls                  */
> +#define GH_CAPID_INVAL	U64_MAX
> +#define GH_VMID_ROOT_VM	0xff
> +
> +enum gh_error {
> +	GH_ERROR_OK			= 0,
> +	GH_ERROR_UNIMPLEMENTED		= -1,
> +	GH_ERROR_RETRY			= -2,
> +
> +	GH_ERROR_ARG_INVAL		= 1,
> +	GH_ERROR_ARG_SIZE		= 2,
> +	GH_ERROR_ARG_ALIGN		= 3,
> +
> +	GH_ERROR_NOMEM			= 10,
> +
> +	GH_ERROR_ADDR_OVFL		= 20,
> +	GH_ERROR_ADDR_UNFL		= 21,
> +	GH_ERROR_ADDR_INVAL		= 22,
> +
> +	GH_ERROR_DENIED			= 30,
> +	GH_ERROR_BUSY			= 31,
> +	GH_ERROR_IDLE			= 32,
> +
> +	GH_ERROR_IRQ_BOUND		= 40,
> +	GH_ERROR_IRQ_UNBOUND		= 41,
> +
> +	GH_ERROR_CSPACE_CAP_NULL	= 50,
> +	GH_ERROR_CSPACE_CAP_REVOKED	= 51,
> +	GH_ERROR_CSPACE_WRONG_OBJ_TYPE	= 52,
> +	GH_ERROR_CSPACE_INSUF_RIGHTS	= 53,
> +	GH_ERROR_CSPACE_FULL		= 54,
> +
> +	GH_ERROR_MSGQUEUE_EMPTY		= 60,
> +	GH_ERROR_MSGQUEUE_FULL		= 61,
> +};
> +
> +/**
> + * gh_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
> + * @gh_error: Gunyah hypercall return value
> + */
> +static inline int gh_error_remap(enum gh_error gh_error)
> +{
> +	switch (gh_error) {
> +	case GH_ERROR_OK:
> +		return 0;
> +	case GH_ERROR_NOMEM:
> +		return -ENOMEM;
> +	case GH_ERROR_DENIED:
> +	case GH_ERROR_CSPACE_CAP_NULL:
> +	case GH_ERROR_CSPACE_CAP_REVOKED:
> +	case GH_ERROR_CSPACE_WRONG_OBJ_TYPE:
> +	case GH_ERROR_CSPACE_INSUF_RIGHTS:
> +	case GH_ERROR_CSPACE_FULL:
> +		return -EACCES;
> +	case GH_ERROR_BUSY:
> +	case GH_ERROR_IDLE:
> +		return -EBUSY;
> +	case GH_ERROR_IRQ_BOUND:
> +	case GH_ERROR_IRQ_UNBOUND:
> +	case GH_ERROR_MSGQUEUE_FULL:
> +	case GH_ERROR_MSGQUEUE_EMPTY:
> +		return -EIO;
> +	case GH_ERROR_UNIMPLEMENTED:
> +	case GH_ERROR_RETRY:
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +#endif
