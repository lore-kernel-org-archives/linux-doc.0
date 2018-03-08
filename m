Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 19DED7E676
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 06:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965035AbeCHGqo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 01:46:44 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:57318 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935257AbeCHGqk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Mar 2018 01:46:40 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 49D8760807; Thu,  8 Mar 2018 06:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1520491600;
        bh=FxgfiATLHNovwZPz7Acs5iEDxjxrHCrcfwlHQDt8FeA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Q99h0OWad9ai4bf441uYjz2R0DleHXhhP+jIBn4O8YErKmRUWie5Vqzj1ydvnBH7p
         wpununJynSNEK9TXFxN4hIBzpK7DKvkVX3NLuD43oINtdYoxxOw9rRbeZCvd1tkwwb
         MaQHvfk2SV8LmaKdbctTLXEvxRdD/U5M/B1pp6os=
Received: from [192.168.0.108] (unknown [161.97.199.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CCDD60390;
        Thu,  8 Mar 2018 06:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1520491598;
        bh=FxgfiATLHNovwZPz7Acs5iEDxjxrHCrcfwlHQDt8FeA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ft7XhDQJEnqX8BNxprYh6ewHTw5RB1O/zGdWLo5IL9NAtkewhYpoovbJO9UweRAYG
         d+gzsI3ld7kYb9hnos9qG7fWFWGUqJGw9EhX/wMCDk02O1nnlQel53ooaa2w7TAYUs
         d2sVjh9DMSGCh1+44bQr2uJUnWp2EGPp71Y6k5qk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3CCDD60390
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
Subject: Re: [PATCH v3 2/4] soc: qcom: Add GENI based QUP Wrapper driver
To:     Stephen Boyd <swboyd@chromium.org>,
        Stephen Boyd <sboyd@chromium.org>, andy.gross@linaro.org,
        corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        evgreen@chromium.org, acourbot@chromium.org,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        iommu@lists.linux-foundation.org
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-3-git-send-email-kramasub@codeaurora.org>
 <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
 <4ac213a6-081f-72c1-c9c8-6994786285c9@codeaurora.org>
 <152037339742.218381.11498404122038956963@swboyd.mtv.corp.google.com>
From:   Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <945b6c00-dde6-6ec7-4577-4cc0d034796b@codeaurora.org>
Date:   Wed, 7 Mar 2018 23:46:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <152037339742.218381.11498404122038956963@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/6/2018 2:56 PM, Stephen Boyd wrote:
> Quoting Karthik Ramasubramanian (2018-03-02 16:58:23)
> 
>>>> +       return iova;
>>>> +}
>>>> +EXPORT_SYMBOL(geni_se_tx_dma_prep);
>>>> +
>>>> +/**
>>>> + * geni_se_rx_dma_prep() - Prepare the Serial Engine for RX DMA transfer
>>>> + * @se:                        Pointer to the concerned Serial Engine.
>>>> + * @buf:               Pointer to the RX buffer.
>>>> + * @len:               Length of the RX buffer.
>>>> + *
>>>> + * This function is used to prepare the buffers for DMA RX.
>>>> + *
>>>> + * Return: Mapped DMA Address of the buffer on success, NULL on failure.
>>>> + */
>>>> +dma_addr_t geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len)
>>>> +{
>>>> +       dma_addr_t iova;
>>>> +       struct geni_wrapper *wrapper = se->wrapper;
>>>> +       u32 val;
>>>> +
>>>> +       iova = dma_map_single(wrapper->dev, buf, len, DMA_FROM_DEVICE);
>>>> +       if (dma_mapping_error(wrapper->dev, iova))
>>>> +               return (dma_addr_t)NULL;
>>>
>>> Can't return a dma_mapping_error address to the caller and have them
>>> figure it out?
>> Earlier we used to return the DMA_ERROR_CODE which has been removed
>> recently in arm64 architecture. If we return the dma_mapping_error, then
>> the caller also needs the device which encountered the mapping error.
>> The serial interface drivers can use their parent currently to resolve
>> the mapping error. Once the wrapper starts mapping using IOMMU context
>> bank, then the serial interface drivers do not know which device to use
>> to know if there is an error.
>>
>> Having said that, the dma_ops suggestion might help with handling this
>> situation. I will look into it further.
> 
> Ok, thanks.
> 
>>>> +{
>>>> +       struct geni_wrapper *wrapper = se->wrapper;
>>>> +
>>>> +       if (iova)
>>>> +               dma_unmap_single(wrapper->dev, iova, len, DMA_FROM_DEVICE);
>>>> +}
>>>> +EXPORT_SYMBOL(geni_se_rx_dma_unprep);
>>>
>>> Instead of having the functions exported, could we set the dma_ops on
>>> all child devices of the wrapper that this driver populates and then
>>> implement the DMA ops for those devices here? I assume that there's
>>> never another DMA master between the wrapper and the serial engine, so I
>>> think it would work.
>> This suggestion looks like it will work.
> 
> It would be a good idea to check with some other people on the dma_ops
> suggestion. Maybe add the DMA mapping subsystem folks to help out here
I have added the DMA mapping subsystem folks to help out here.

To present an overview, we have a wrapper controller which is composed 
of several serial engines. The serial engines are programmed with UART, 
I2C or SPI protocol and support DMA transfer. When the serial engines 
perform DMA transfer, the wrapper controller device is used to perform 
the mapping. The reason wrapper device is used is because of IOMMU and 
there is only one IOMMU context bank to perform the translation for the 
entire wrapper controller. So the wrapper controller exports map and 
unmap functions to the individual protocol drivers.

There is a suggestion to make the parent wrapper controller implement 
the dma_map_ops, instead of exported map/unmap functions and populate 
those dma_map_ops on all the children serial engines. Can you please 
provide your inputs regarding this suggestion?
> 
> DMA MAPPING HELPERS
> M:      Christoph Hellwig <hch@lst.de>
> M:      Marek Szyprowski <m.szyprowski@samsung.com>
> R:      Robin Murphy <robin.murphy@arm.com>
> L:      iommu@lists.linux-foundation.org
> 
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
