Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F20CC3526E
	for <linux-doc@archiver.kernel.org>; Sat, 19 Dec 2020 03:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE64E23BB5
	for <linux-doc@archiver.kernel.org>; Sat, 19 Dec 2020 03:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgLSDgH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Dec 2020 22:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgLSDgG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Dec 2020 22:36:06 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588DEC061282
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 19:35:20 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id a6so2899571qtw.6
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 19:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XWIxnd1TBokkeQDQoDs2P8h6KNdDQQlPBRCQPqQe8vw=;
        b=oT4McdXtX1VIEqC/VVrfo0fLp43cCBc3I5eiaj9ysuFEvUHHQvIi7jdhZ30CjQYwhm
         5PfHpVTU8EMUWgRoXVY+IhUgByR6sbEQzsUjUSezQxTYBJA5i6MYybCK/QjmtzwO9Mhz
         YGfjo66X6cNq1DYsVTfUk4QCRF4zftFk5BndhToeX5XBdfp+Y4LUd/hGBF6XziHM/Pkr
         qX0LmYurv2QIwATyXDmABTbmO/7E9KJ3s1JUdrdCyO0PssTAfQdiPuwN5kBytSzr7Pe9
         QohicqYEs+mpz+Hr9JF5QzDFQVYBgxIxMM0eb5rmeAqtqT9OZyxNsIGjtDnymKunXWtc
         A+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XWIxnd1TBokkeQDQoDs2P8h6KNdDQQlPBRCQPqQe8vw=;
        b=HhnTxxubw1zUKxsSP8FZQQOzHIZpc2jlEQbc1XeZ8rlE64r9ZhjcZ5JjG7U/pvZuUV
         bKiuzpFKOtbNB5TYC4Dq1Mz+SOTf5xGVKX7NWNZ3uC3iSNgZ8tmTmo3uDQhhRppk+pR4
         DHtWR0VHyjq1mJgbKUWKF/1cifyEgndn6qHtWYnI/E99/zBe20JmvVPxe42SkAMCASSr
         8revosBbkPTqnDU+avx0mrum6UqdlHrrIFDyC6StPE1VoTg1RId2nF2Cf/7ChrI5aOaK
         9YLn1+0d/CwQHdLRwxn+jlLQmXp+ELp8KEFwThhezjo8y9092TJ+uasd8sn7A+51ojKg
         ypTA==
X-Gm-Message-State: AOAM5318qTn05V67KGCcLHEV6l+2aH9FstlzayZ9hflGEMTZRSyFunHP
        IZnqQD0N42YIk8ACpvKTZsTtIw==
X-Google-Smtp-Source: ABdhPJzaYoqA+UVM8mSoDAHP47OOIG2HtxFlJ6430vZVxDe776H3vaiKcHiP9+DgjxyAnlqWl7mMkA==
X-Received: by 2002:ac8:464c:: with SMTP id f12mr7278436qto.272.1608348919450;
        Fri, 18 Dec 2020 19:35:19 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id s19sm3298501qta.35.2020.12.18.19.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Dec 2020 19:35:18 -0800 (PST)
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Add LOCK and UNLOCK flag bit
 support
To:     Md Sadre Alam <mdalam@codeaurora.org>, vkoul@kernel.org,
        corbet@lwn.net, agross@kernel.org, bjorn.andersson@linaro.org,
        dan.j.williams@intel.com, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     sricharan@codeaurora.org
References: <1608215842-15381-1-git-send-email-mdalam@codeaurora.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <6c85436d-e064-367e-736b-951af82256c8@linaro.org>
Date:   Fri, 18 Dec 2020 22:35:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608215842-15381-1-git-send-email-mdalam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 12/17/20 9:37 AM, Md Sadre Alam wrote:
> This change will add support for LOCK & UNLOCK flag bit support
> on CMD descriptor.
> 
> If DMA_PREP_LOCK flag passed in prep_slave_sg then requester of this
> transaction wanted to lock the DMA controller for this transaction so
> BAM driver should set LOCK bit for the HW descriptor.
> 
> If DMA_PREP_UNLOCK flag passed in prep_slave_sg then requester of this
> transaction wanted to unlock the DMA controller.so BAM driver should set
> UNLOCK bit for the HW descriptor.
Hi,

This is a generic question. What is the point of LOCK/UNLOCK with 
allocating LOCK groups to the individual dma channels? By default
doesn't all channels fall in the same group. This would mean that
a lock does not prevent the dma controller from not executing a
transaction on the other channels.

-- 
Warm Regards
Thara

> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>   Documentation/driver-api/dmaengine/provider.rst | 9 +++++++++
>   drivers/dma/qcom/bam_dma.c                      | 9 +++++++++
>   include/linux/dmaengine.h                       | 5 +++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
> index ddb0a81..d7516e2 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -599,6 +599,15 @@ DMA_CTRL_REUSE
>     - This flag is only supported if the channel reports the DMA_LOAD_EOT
>       capability.
>   
> +- DMA_PREP_LOCK
> +
> +  - If set , the client driver tells DMA controller I am locking you for
> +    this transcation.
> +
> +- DMA_PREP_UNLOCK
> +
> +  - If set, the client driver will tells DMA controller I am releasing the lock
> +
>   General Design Notes
>   ====================
>   
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 4eeb8bb..cdbe395 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -58,6 +58,8 @@ struct bam_desc_hw {
>   #define DESC_FLAG_EOB BIT(13)
>   #define DESC_FLAG_NWD BIT(12)
>   #define DESC_FLAG_CMD BIT(11)
> +#define DESC_FLAG_LOCK BIT(10)
> +#define DESC_FLAG_UNLOCK BIT(9)
>   
>   struct bam_async_desc {
>   	struct virt_dma_desc vd;
> @@ -644,6 +646,13 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
>   
>   	/* fill in temporary descriptors */
>   	desc = async_desc->desc;
> +	if (flags & DMA_PREP_CMD) {
> +		if (flags & DMA_PREP_LOCK)
> +			desc->flags |= cpu_to_le16(DESC_FLAG_LOCK);
> +		if (flags & DMA_PREP_UNLOCK)
> +			desc->flags |= cpu_to_le16(DESC_FLAG_UNLOCK);
> +	}
> +
>   	for_each_sg(sgl, sg, sg_len, i) {
>   		unsigned int remainder = sg_dma_len(sg);
>   		unsigned int curr_offset = 0;
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index dd357a7..79ccadb4 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -190,6 +190,9 @@ struct dma_interleaved_template {
>    *  transaction is marked with DMA_PREP_REPEAT will cause the new transaction
>    *  to never be processed and stay in the issued queue forever. The flag is
>    *  ignored if the previous transaction is not a repeated transaction.
> + * @DMA_PREP_LOCK: tell the driver that DMA HW engine going to be locked for this
> + *  transaction , until not seen DMA_PREP_UNLOCK flag set.
> + * @DMA_PREP_UNLOCK: tell the driver to unlock the DMA HW engine.
>    */
>   enum dma_ctrl_flags {
>   	DMA_PREP_INTERRUPT = (1 << 0),
> @@ -202,6 +205,8 @@ enum dma_ctrl_flags {
>   	DMA_PREP_CMD = (1 << 7),
>   	DMA_PREP_REPEAT = (1 << 8),
>   	DMA_PREP_LOAD_EOT = (1 << 9),
> +	DMA_PREP_LOCK = (1 << 10),
> +	DMA_PREP_UNLOCK = (1 << 11),
>   };
>   
>   /**
> 


