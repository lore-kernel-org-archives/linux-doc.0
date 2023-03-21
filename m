Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96498C7619A
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 15:49:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbjCUPtS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Mar 2023 11:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbjCUPtE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 11:49:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C25D4DE22
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 08:49:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id eg48so61371463edb.13
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679413739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzDFIymbRjbLhmlcc42BiXxJve1ZLr1cxA94sUeeuDQ=;
        b=xOT3dQErkNbyGneftJFjSnjdfjvRXh/wgUVE5YAfSTsdLMTa+oockgRQBPsMclLUqB
         U4IIkytzklFq3jHOSyH/KRiUUMWFL904rv+e2yYFdLIGSSxwYfEn66IwA+O/FKnkH9iK
         OJK3kwJMjNqVkvLoIjBC6FS9mNN4Ll7JAfWxkUWqChVcMIXFTR5NbWlFd0yD13vIyBxI
         uAKdjSajzGq8sZ6BxflLceYT/1OTdUELaqxWhf+6s70Re59N2OD/PhlyfVbBfXF4GO6g
         nH4567gpkoZS/JXECrwQYFmnNnPF7Aat07MoTwnRh/gCm8hQ+LrxqJqlp9XGSbdaAFlx
         NpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679413739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzDFIymbRjbLhmlcc42BiXxJve1ZLr1cxA94sUeeuDQ=;
        b=f/dtUABVzYxowTvTxr3yT8ZkEg0hTi/MRxgw7Wm5Gf81fmuKfBUcmQd2Mg5G6PD8jF
         LtTlKNigwKvqBo9z4TPLCLCIhYwAjNBMpzOQXXZCK0d4lXY3/TcwVa98VOEvXDWL/3l7
         otQgsqSK8nUrEtpZHuuEaxRZe3Z/jcun1Ph29F+N31QBxXS0eZxZCdVSRHBD6ZSf0F0l
         ACFyldsJEPGAldtWzzp0xyfmmP3qPQugPFjjLRfidrwIJY/PJs6cay3JDPLnkQiz9BUc
         ISGwPQq6njXfHcgshfQKVtb977hCfvqMFu7YJukhzri4Y/Gex8e/vWUSFWmgxn3NjpqJ
         dHcg==
X-Gm-Message-State: AO0yUKUlLoYgre1WoS4Kp2d0pSjnghQ5AjVzzSFNNcCMifMSFJ/HQ94K
        6bmQikyx9l8IplmMupeVEGHWmw==
X-Google-Smtp-Source: AK7set9vvgE0/AZT5nETWstzcgB/WJjjvy5BXgYV3f+XN39lD7CIun132siBk0Fq/T5DQE94TJZWlQ==
X-Received: by 2002:a17:906:6d13:b0:925:f542:1a3d with SMTP id m19-20020a1709066d1300b00925f5421a3dmr3383284ejr.25.1679413739616;
        Tue, 21 Mar 2023 08:48:59 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id s9-20020a170906454900b008f89953b761sm5958260ejq.3.2023.03.21.08.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 08:48:58 -0700 (PDT)
Message-ID: <fcffc785-42b0-0312-daa3-f927f18cd43e@linaro.org>
Date:   Tue, 21 Mar 2023 15:48:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 05/26] virt: gunyah: Identify hypervisor version
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
References: <20230304010632.2127470-1-quic_eberman@quicinc.com>
 <20230304010632.2127470-6-quic_eberman@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230304010632.2127470-6-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 04/03/2023 01:06, Elliot Berman wrote:
> Export the version of Gunyah which is reported via the hyp_identify
> hypercall. Increments of the major API version indicate possibly
> backwards incompatible changes.
> 
> Export the hypervisor identity so that Gunyah drivers can act according
> to the major API version.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> ---
>   drivers/virt/Makefile        |  1 +
>   drivers/virt/gunyah/Makefile |  3 ++
>   drivers/virt/gunyah/gunyah.c | 57 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 61 insertions(+)
>   create mode 100644 drivers/virt/gunyah/Makefile
>   create mode 100644 drivers/virt/gunyah/gunyah.c
> 
> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
> index e9aa6fc96fab..a5817e2d7d71 100644
> --- a/drivers/virt/Makefile
> +++ b/drivers/virt/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_ACRN_HSM)		+= acrn/
>   obj-$(CONFIG_EFI_SECRET)	+= coco/efi_secret/
>   obj-$(CONFIG_SEV_GUEST)		+= coco/sev-guest/
>   obj-$(CONFIG_INTEL_TDX_GUEST)	+= coco/tdx-guest/
> +obj-y				+= gunyah/
> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
> new file mode 100644
> index 000000000000..34f32110faf9
> --- /dev/null
> +++ b/drivers/virt/gunyah/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_GUNYAH) += gunyah.o
> diff --git a/drivers/virt/gunyah/gunyah.c b/drivers/virt/gunyah/gunyah.c
> new file mode 100644
> index 000000000000..4b7e6f3edaff
> --- /dev/null
> +++ b/drivers/virt/gunyah/gunyah.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) "gunyah: " fmt
> +
> +#include <linux/gunyah.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +
> +static struct gh_hypercall_hyp_identify_resp gh_api;
> +
> +u16 gh_api_version(void)
> +{
> +	return FIELD_GET(GH_API_INFO_API_VERSION_MASK, gh_api.api_info);
> +}
> +EXPORT_SYMBOL_GPL(gh_api_version);
> +
> +bool gh_api_has_feature(enum gh_api_feature feature)
> +{
> +	switch (feature) {
> +	case GH_FEATURE_DOORBELL:
> +	case GH_FEATURE_MSGQUEUE:
> +	case GH_FEATURE_VCPU:
> +	case GH_FEATURE_MEMEXTENT:
> +		return !!(gh_api.flags[0] & BIT_ULL(feature));
> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(gh_api_has_feature);
> +
> +static int __init gh_init(void)
> +{
> +	if (!arch_is_gh_guest())
> +		return -ENODEV;
> +
> +	gh_hypercall_hyp_identify(&gh_api);
> +
> +	pr_info("Running under Gunyah hypervisor %llx/v%u\n",
> +		FIELD_GET(GH_API_INFO_VARIANT_MASK, gh_api.api_info),
> +		gh_api_version());
> +
> +	/* We might move this out to individual drivers if there's ever an API version bump */
> +	if (gh_api_version() != GH_API_V1) {
> +		pr_info("Unsupported Gunyah version: %u\n", gh_api_version());
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +arch_initcall(gh_init);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Gunyah Hypervisor Driver");
