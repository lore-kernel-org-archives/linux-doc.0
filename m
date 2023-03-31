Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB626C76196
	for <linux-doc@archiver.kernel.org>; Fri, 31 Mar 2023 14:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbjCaOZV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 31 Mar 2023 10:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbjCaOZR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Mar 2023 10:25:17 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871462031B
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 07:25:04 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id n1so10849379ili.10
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680272704; x=1682864704;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u2DKRWokxdgFHFKK9gKH+IOprEI8thh0AGrCKbdGi4w=;
        b=RbnLRCaLKbxYJSXuHmiUbzKL6mD8U9zonSzHyaUaRB1/V3UHPD4gtQKsl6tSVwqIN9
         zLvgDzW1ScNkMDyYujTOmBiyu7vtEpgCXWO272QdHB3GyVHyLS2YWk0vvydEH53kzGgS
         13UVDi9Vo0e6ZaeKk3++OQ3JOAtO5JnL6AbEFVEeF0f2jb1RHcmYQrtkbmO644PzjADF
         ObwM41wE3xqkvkZ/F137cceCZhm0awNWBo+LbF053a0HeBlYZf7ix6o7S7u46mq3ODv7
         DpZTvebnlkZoIlcEks5oYO0uUOzOMl0chxoNwbGyzFm9Let7zvln3QUlFCMDK6UXzUdq
         mwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272704; x=1682864704;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2DKRWokxdgFHFKK9gKH+IOprEI8thh0AGrCKbdGi4w=;
        b=DZkdQfx7oVz1MPSj959zdcN2yS0tB853tcRoPZtaHOUFW4p1ZKDqzdxATLGdlPfyaD
         rMJVLFaeEpbTX6kk5QwELwycXQZPomlGrZLEbYf7vpEJI0gosWZ50K57LNf5KXsIwW3s
         oVLOHBGZ42LlYgF1l+zbUNNV7Kv0MunLKV0cLp57X5+NukDlFS4w2N2zQSYM4zhbtzEA
         w22pJhoJb2USpJISU6l6Bo02BZfk46K/GvDSaUUFnBnvACXdfsOzoce+VdjdNmjMai3C
         zHbxnktG0+jIHw52t9V6IpscAEDdpBLcdXaCx7tQCfpX16O+S7ok9UeA0G90JYC3pQv5
         hZnw==
X-Gm-Message-State: AAQBX9d8dm0EWB6hy/ckI4qyvtQzJ12E5g1HJb8YYW2DZUQM0YUOaTBr
        55186y1Vo9XbsDmU798IioCZsw==
X-Google-Smtp-Source: AKy350aDhKvOw9mwCosjWKdjOjXLs4ZIU5w9nwygH8V2n8hkd1yNtA2VKND5cjez00k1fpPbkLu72Q==
X-Received: by 2002:a92:907:0:b0:326:2d3a:c770 with SMTP id y7-20020a920907000000b003262d3ac770mr6423077ilg.26.1680272704208;
        Fri, 31 Mar 2023 07:25:04 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id m36-20020a056638272400b003c4f7dd7554sm669484jav.5.2023.03.31.07.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:25:03 -0700 (PDT)
Message-ID: <947e17c0-c157-148c-035b-f9578466a6e1@linaro.org>
Date:   Fri, 31 Mar 2023 09:25:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v11 06/26] virt: gunyah: msgq: Add hypercalls to send and
 receive messages
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
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
        Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230304010632.2127470-1-quic_eberman@quicinc.com>
 <20230304010632.2127470-7-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230304010632.2127470-7-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/3/23 7:06 PM, Elliot Berman wrote:
> Add hypercalls to send and receive messages on a Gunyah message queue.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

One comment below.	-Alex

> ---
>   arch/arm64/gunyah/gunyah_hypercall.c | 31 ++++++++++++++++++++++++++++
>   include/linux/gunyah.h               |  6 ++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
> index 0d14e767e2c8..3420d8f286a9 100644
> --- a/arch/arm64/gunyah/gunyah_hypercall.c
> +++ b/arch/arm64/gunyah/gunyah_hypercall.c
> @@ -41,6 +41,8 @@ EXPORT_SYMBOL_GPL(arch_is_gh_guest);
>   						   fn)
>   
>   #define GH_HYPERCALL_HYP_IDENTIFY		GH_HYPERCALL(0x8000)
> +#define GH_HYPERCALL_MSGQ_SEND			GH_HYPERCALL(0x801B)
> +#define GH_HYPERCALL_MSGQ_RECV			GH_HYPERCALL(0x801C)
>   
>   /**
>    * gh_hypercall_hyp_identify() - Returns build information and feature flags
> @@ -60,5 +62,34 @@ void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identi
>   }
>   EXPORT_SYMBOL_GPL(gh_hypercall_hyp_identify);
>   
> +enum gh_error gh_hypercall_msgq_send(u64 capid, size_t size, void *buff, int tx_flags, bool *ready)

The tx_flags argument--being a mask of some kind--should be unsigned,
and perhaps 64 bits wide.  The only caller passes a u64 value here
(which would technically be truncated).

> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_hvc(GH_HYPERCALL_MSGQ_SEND, capid, size, (uintptr_t)buff, tx_flags, 0, &res);
> +
> +	if (res.a0 == GH_ERROR_OK)
> +		*ready = !!res.a1;
> +
> +	return res.a0;
> +}
> +EXPORT_SYMBOL_GPL(gh_hypercall_msgq_send);
> +
> +enum gh_error gh_hypercall_msgq_recv(u64 capid, void *buff, size_t size, size_t *recv_size,
> +					bool *ready)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_hvc(GH_HYPERCALL_MSGQ_RECV, capid, (uintptr_t)buff, size, 0, &res);
> +
> +	if (res.a0 == GH_ERROR_OK) {
> +		*recv_size = res.a1;
> +		*ready = !!res.a2;
> +	}
> +
> +	return res.a0;
> +}
> +EXPORT_SYMBOL_GPL(gh_hypercall_msgq_recv);
> +
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
> index bd080e3a6fc9..18cfbf5ee48b 100644
> --- a/include/linux/gunyah.h
> +++ b/include/linux/gunyah.h
> @@ -108,4 +108,10 @@ struct gh_hypercall_hyp_identify_resp {
>   
>   void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identity);
>   
> +#define GH_HYPERCALL_MSGQ_TX_FLAGS_PUSH		BIT(0)
> +
> +enum gh_error gh_hypercall_msgq_send(u64 capid, size_t size, void *buff, int tx_flags, bool *ready);
> +enum gh_error gh_hypercall_msgq_recv(u64 capid, void *buff, size_t size, size_t *recv_size,
> +					bool *ready);
> +
>   #endif

