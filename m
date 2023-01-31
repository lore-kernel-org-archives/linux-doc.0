Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A89C38142
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 16:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbjAaQRG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 11:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbjAaQRE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 11:17:04 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD4656ECB
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 08:16:39 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id t7so6353243wrp.5
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 08:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sC+Di4TlxPVQsXJqfIn37g9Ynl7ooeDJgBJ8CzuZpDw=;
        b=Uf78pptncObWY5xdYUfe2j7UvjXYtPw+VQcbxe0alttk6JFQDrg6tA8iJX9Ohj8VzT
         YN8cYyfZ3DHpsnjtlWbzm0bM23MsAAn1Gum53E1PuLNlld7t3g6HuFYoLvWmrCNr1vWx
         y7rVfl0sn40yXsIZxuBmSgcsFpfTfmWn3OHOs6SpCyZAgcS6Q7ogT4ewMNKf41HMnmvc
         u3HuWpTh0gjdWAqWRl/sQ5mN2kvUKGOq9wy1H8ibGKOphJctkWcKCbiE7zWqduPsYosk
         R4y8TZQ76fQfEQ20NlM04AsnMKT+ODQOnRWu99lrENzhXJ4+w7Jeid5rqDIe1s2eTJLT
         MmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sC+Di4TlxPVQsXJqfIn37g9Ynl7ooeDJgBJ8CzuZpDw=;
        b=tGliVSm/CFHjjZjy1DbgrvTO7Ifl/54W9LA8rA3cmgyvWZdQ+svyewGzl8PtFcI0yL
         lePzPuBoNLQH3GFUnaiEd1KcleKssA4Dm+/KoQddncZDrXN2eZG6S8HkOFiFkh+Q/xO4
         59s23yJggMqbWKntTlH69GCP9ywUqZR60hiqMsBhE2BCOoqprrLpFgQrHeJ0xZpy8f7J
         QYz/RFzkl031JTZRzIvoofifvYUxSpSwxkWwRyCIBVxKldUoFnbUqKbQEtICcTBdIR3D
         RapDJgi7rSQ/Q1jKgsxOmH+3va5nq1CMWA+LRv82hq/1JIASXi9hdY6omzTnMphhmEEw
         sY1w==
X-Gm-Message-State: AO0yUKWy2U0K24NEOI3apT2zagk1BmX26n/ZwhM3iejfrohESdVacoUa
        asNKRAN/9XpnIOUydARd0rGjuQ==
X-Google-Smtp-Source: AK7set+z2vha8SMTRFw07oToyZO54cqTLBQQuhLnB/koaRsR37m5k+ULuqFbD5HHG6hr1qZjtljxKQ==
X-Received: by 2002:adf:dd12:0:b0:2bf:afdf:13db with SMTP id a18-20020adfdd12000000b002bfafdf13dbmr24003759wrm.47.1675181797823;
        Tue, 31 Jan 2023 08:16:37 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id m14-20020a5d6a0e000000b002bfd09f2ca6sm13188926wru.3.2023.01.31.08.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 08:16:36 -0800 (PST)
Message-ID: <8e21109b-37d9-982b-1cdb-aeaafaa986ea@linaro.org>
Date:   Tue, 31 Jan 2023 16:16:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 07/27] virt: gunyah: msgq: Add hypercalls to send and
 receive messages
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Alex Elder <elder@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230120224627.4053418-1-quic_eberman@quicinc.com>
 <20230120224627.4053418-8-quic_eberman@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230120224627.4053418-8-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 20/01/2023 22:46, Elliot Berman wrote:
> Add hypercalls to send and receive messages on a Gunyah message queue.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   arch/arm64/gunyah/gunyah_hypercall.c | 33 ++++++++++++++++++++++++++++
>   include/linux/gunyah.h               |  5 +++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
> index ffed4b71641f..d93ad2c08479 100644
> --- a/arch/arm64/gunyah/gunyah_hypercall.c
> +++ b/arch/arm64/gunyah/gunyah_hypercall.c
> @@ -13,6 +13,8 @@ static const uint32_t gunyah_known_uuids[][4] = {
>   };
>   
>   #define GH_HYPERCALL_HYP_IDENTIFY		GH_HYPERCALL(0x0000)
> +#define GH_HYPERCALL_MSGQ_SEND			GH_HYPERCALL(0x001B)
> +#define GH_HYPERCALL_MSGQ_RECV			GH_HYPERCALL(0x001C)
>   
>   /**
>    * gh_hypercall_get_uid() - Returns a UID when running under a Gunyah hypervisor
> @@ -71,5 +73,36 @@ void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identi
>   }
>   EXPORT_SYMBOL_GPL(gh_hypercall_hyp_identify);
>   
> +int gh_hypercall_msgq_send(u64 capid, size_t size, uintptr_t buff, int tx_flags, bool *ready)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_hvc(GH_HYPERCALL_MSGQ_SEND, capid, size, buff, tx_flags, 0, &res);
> +
<--
> +	if (res.a0)
> +		return res.a0;
> +
> +	*ready = res.a1;
> +
> +	return res.a0;
-->
this can be made more readable with code something like:

if (res.a0 == SMCCC_RET_SUCCESS)
	*ready = res.a1;

return res.a0;


> +}
> +EXPORT_SYMBOL_GPL(gh_hypercall_msgq_send);
> +
> +int gh_hypercall_msgq_recv(u64 capid, uintptr_t buff, size_t size, size_t *recv_size, bool *ready)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_hvc(GH_HYPERCALL_MSGQ_RECV, capid, buff, size, 0, &res);
> +
> +	if (res.a0)
> +		return res.a0;
> +
> +	*recv_size = res.a1;
> +	*ready = res.a2;
> +
same comment.


> +	return res.a0;
> +}
> +EXPORT_SYMBOL_GPL(gh_hypercall_msgq_recv);
> +
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
> index 6724d1264d58..b5f61c14ec1e 100644
> --- a/include/linux/gunyah.h
> +++ b/include/linux/gunyah.h
> @@ -104,4 +104,9 @@ struct gh_hypercall_hyp_identify_resp {
>   
>   void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identity);
>   
> +#define GH_HYPERCALL_MSGQ_TX_FLAGS_PUSH		BIT(0)
Please move unrelated changes from  this patch to the patch that 
actually uses these.

> +
> +int gh_hypercall_msgq_send(u64 capid, size_t size, uintptr_t buff, int tx_flags, bool *ready);
> +int gh_hypercall_msgq_recv(u64 capid, uintptr_t buff, size_t size, size_t *recv_size, bool *ready);
> +
>   #endif
