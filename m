Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC340C761AF
	for <linux-doc@archiver.kernel.org>; Fri, 31 Mar 2023 14:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbjCaO2p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 31 Mar 2023 10:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232866AbjCaO2h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Mar 2023 10:28:37 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4335593EB
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 07:28:07 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id h16so15014951qtn.7
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 07:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680272856; x=1682864856;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xf5n1p7jHpHvkrRgaWW38l7vENxHw15xBD2lZKkSQ6A=;
        b=MdTTYFwCWqSVkOu4qIAH7C1q9xYI6Eri+v/DfOyIPpe3IPemg+Nvt0FvQXwjUsGkxr
         OLra+2qBlKKOqyWEp9hKPAVd7Uz2dBqaENGbJxd0FpagTCknFaAMW4Q1p5i3n+b2yZZq
         VTT5O/fd2aWapfX0us5LGd8e9YX+/jhiE8UtnjIPamMFxhc43951J/1yjpDyHpCf94XG
         y7fCvPth2oMmtx70sBWu+Xt5nS+RWyX99hyKlitpLsaufxB31MdIFnwtkUjqv98plLzI
         OcCQ8c6NidiPrnM4VH99Po3kp+oUoCEpClPvi4BjqBy2Boil1DY9ycETzvHkmmWtoGTT
         KzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272856; x=1682864856;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf5n1p7jHpHvkrRgaWW38l7vENxHw15xBD2lZKkSQ6A=;
        b=HyLXnEbfB0ZbbYw90GVMzE5PSB0SwEodtiegJz811G/SWh6ZxjWk9R699EkpPvx7le
         Yk2UzlQw3kubTadMH01YGGqd7HL95/8f52WIQd8MHB+tx2SDz0YC2t/eWfQqcxZ3kDtZ
         Xeh+J5x7f7HV1RKbXxWFOf2+KqbtTuYKX3ou71ictInVVqz2MVB0pqMC0luEdLS8n+ik
         e2iul0yu8b9KUVIB5jBXWZ/c1SK/+IrCZGqAY2FdH/mSNJ1bLngqDOKzrx+t+ZVocQZV
         pD2XliPkueLCHU1gyiTusepbPdT2159te4kjA5ep0fpH9W2Z7yEsqt2x8tEM/v4f3jD8
         A/Tg==
X-Gm-Message-State: AO0yUKX5Jz/vr3az87VXVSHdjhph1rPRz/dEjS3m+AyDJmm/DB0VPni+
        Zv63gsVloq1wb2DCWzqoembB1A==
X-Google-Smtp-Source: AK7set/C5pqCW0ins+1roHtM3Ra5TZ5iADsNmdApxXIf/dZ7Lf6rRYntgQRnv9UBlWe8BjtwQdFS8A==
X-Received: by 2002:ac8:5982:0:b0:3e3:c889:ed06 with SMTP id e2-20020ac85982000000b003e3c889ed06mr44780052qte.21.1680272856579;
        Fri, 31 Mar 2023 07:27:36 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id ay8-20020a05622a228800b003e4d1d5ec8bsm645619qtb.52.2023.03.31.07.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:27:36 -0700 (PDT)
Message-ID: <1cf1384a-e5b1-c445-c825-b63fcfa34f91@linaro.org>
Date:   Fri, 31 Mar 2023 09:27:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v11 23/26] virt: gunyah: Add hypercalls for sending
 doorbell
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
 <20230304010632.2127470-24-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230304010632.2127470-24-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/3/23 7:06 PM, Elliot Berman wrote:
> Gunyah doorbells allow two virtual machines to signal each other using
> interrupts. Add the hypercalls needed to assert the interrupt.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

One minor suggestion below.	-Alex

> ---
>   arch/arm64/gunyah/gunyah_hypercall.c | 25 +++++++++++++++++++++++++
>   include/linux/gunyah.h               |  3 +++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
> index f01f5cec4d23..0f1cdb706e91 100644
> --- a/arch/arm64/gunyah/gunyah_hypercall.c
> +++ b/arch/arm64/gunyah/gunyah_hypercall.c
> @@ -41,6 +41,8 @@ EXPORT_SYMBOL_GPL(arch_is_gh_guest);
>   						   fn)
>   
>   #define GH_HYPERCALL_HYP_IDENTIFY		GH_HYPERCALL(0x8000)
> +#define GH_HYPERCALL_BELL_SEND			GH_HYPERCALL(0x8012)
> +#define GH_HYPERCALL_BELL_SET_MASK		GH_HYPERCALL(0x8015)
>   #define GH_HYPERCALL_MSGQ_SEND			GH_HYPERCALL(0x801B)
>   #define GH_HYPERCALL_MSGQ_RECV			GH_HYPERCALL(0x801C)
>   #define GH_HYPERCALL_VCPU_RUN			GH_HYPERCALL(0x8065)
> @@ -63,6 +65,29 @@ void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identi
>   }
>   EXPORT_SYMBOL_GPL(gh_hypercall_hyp_identify);
>   
> +enum gh_error gh_hypercall_bell_send(u64 capid, u64 new_flags, u64 *old_flags)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_hvc(GH_HYPERCALL_BELL_SEND, capid, new_flags, 0, &res);
> +
> +	if (res.a0 == GH_ERROR_OK)
> +		*old_flags = res.a1;

At least one caller doesn't care about the result.  So you could
accept a null pointer as the old_flags argument, and in that case
just don't assign it.

> +
> +	return res.a0;
> +}
> +EXPORT_SYMBOL_GPL(gh_hypercall_bell_send);
> +
> +enum gh_error gh_hypercall_bell_set_mask(u64 capid, u64 enable_mask, u64 ack_mask)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_hvc(GH_HYPERCALL_BELL_SET_MASK, capid, enable_mask, ack_mask, 0, &res);
> +
> +	return res.a0;
> +}
> +EXPORT_SYMBOL_GPL(gh_hypercall_bell_set_mask);
> +
>   enum gh_error gh_hypercall_msgq_send(u64 capid, size_t size, void *buff, int tx_flags, bool *ready)
>   {
>   	struct arm_smccc_res res;
> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
> index 37f1e2c822ce..63395dacc1a8 100644
> --- a/include/linux/gunyah.h
> +++ b/include/linux/gunyah.h
> @@ -169,6 +169,9 @@ struct gh_hypercall_hyp_identify_resp {
>   
>   void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identity);
>   
> +enum gh_error gh_hypercall_bell_send(u64 capid, u64 new_flags, u64 *old_flags);
> +enum gh_error gh_hypercall_bell_set_mask(u64 capid, u64 enable_mask, u64 ack_mask);
> +
>   #define GH_HYPERCALL_MSGQ_TX_FLAGS_PUSH		BIT(0)
>   
>   enum gh_error gh_hypercall_msgq_send(u64 capid, size_t size, void *buff, int tx_flags, bool *ready);

