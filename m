Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B0C6B7E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 13:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934930AbeCHNYw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 08:24:52 -0500
Received: from foss.arm.com ([217.140.101.70]:37706 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933173AbeCHNYv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Mar 2018 08:24:51 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A7E1435;
        Thu,  8 Mar 2018 05:24:50 -0800 (PST)
Received: from [10.1.210.88] (e110467-lin.cambridge.arm.com [10.1.210.88])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D1703F53D;
        Thu,  8 Mar 2018 05:24:47 -0800 (PST)
Subject: Re: [PATCH v3 2/4] soc: qcom: Add GENI based QUP Wrapper driver
To:     Karthik Ramasubramanian <kramasub@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stephen Boyd <sboyd@chromium.org>, andy.gross@linaro.org,
        corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de,
        hch@lst.de, m.szyprowski@samsung.com
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
 <945b6c00-dde6-6ec7-4577-4cc0d034796b@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <8567be1b-1431-4f1d-cb41-6a7eaa434438@arm.com>
Date:   Thu, 8 Mar 2018 13:24:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <945b6c00-dde6-6ec7-4577-4cc0d034796b@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/03/18 06:46, Karthik Ramasubramanian wrote:
> 
> 
> On 3/6/2018 2:56 PM, Stephen Boyd wrote:
>> Quoting Karthik Ramasubramanian (2018-03-02 16:58:23)
>>
>>>>> +       return iova;
>>>>> +}
>>>>> +EXPORT_SYMBOL(geni_se_tx_dma_prep);
>>>>> +
>>>>> +/**
>>>>> + * geni_se_rx_dma_prep() - Prepare the Serial Engine for RX DMA 
>>>>> transfer
>>>>> + * @se:                        Pointer to the concerned Serial 
>>>>> Engine.
>>>>> + * @buf:               Pointer to the RX buffer.
>>>>> + * @len:               Length of the RX buffer.
>>>>> + *
>>>>> + * This function is used to prepare the buffers for DMA RX.
>>>>> + *
>>>>> + * Return: Mapped DMA Address of the buffer on success, NULL on 
>>>>> failure.
>>>>> + */
>>>>> +dma_addr_t geni_se_rx_dma_prep(struct geni_se *se, void *buf, 
>>>>> size_t len)
>>>>> +{
>>>>> +       dma_addr_t iova;
>>>>> +       struct geni_wrapper *wrapper = se->wrapper;
>>>>> +       u32 val;
>>>>> +
>>>>> +       iova = dma_map_single(wrapper->dev, buf, len, 
>>>>> DMA_FROM_DEVICE);
>>>>> +       if (dma_mapping_error(wrapper->dev, iova))
>>>>> +               return (dma_addr_t)NULL;
>>>>
>>>> Can't return a dma_mapping_error address to the caller and have them
>>>> figure it out?
>>> Earlier we used to return the DMA_ERROR_CODE which has been removed
>>> recently in arm64 architecture. If we return the dma_mapping_error, then
>>> the caller also needs the device which encountered the mapping error.
>>> The serial interface drivers can use their parent currently to resolve
>>> the mapping error. Once the wrapper starts mapping using IOMMU context
>>> bank, then the serial interface drivers do not know which device to use
>>> to know if there is an error.
>>>
>>> Having said that, the dma_ops suggestion might help with handling this
>>> situation. I will look into it further.
>>
>> Ok, thanks.
>>
>>>>> +{
>>>>> +       struct geni_wrapper *wrapper = se->wrapper;
>>>>> +
>>>>> +       if (iova)
>>>>> +               dma_unmap_single(wrapper->dev, iova, len, 
>>>>> DMA_FROM_DEVICE);
>>>>> +}
>>>>> +EXPORT_SYMBOL(geni_se_rx_dma_unprep);
>>>>
>>>> Instead of having the functions exported, could we set the dma_ops on
>>>> all child devices of the wrapper that this driver populates and then
>>>> implement the DMA ops for those devices here? I assume that there's
>>>> never another DMA master between the wrapper and the serial engine, 
>>>> so I
>>>> think it would work.
>>> This suggestion looks like it will work.
>>
>> It would be a good idea to check with some other people on the dma_ops
>> suggestion. Maybe add the DMA mapping subsystem folks to help out here
> I have added the DMA mapping subsystem folks to help out here.
> 
> To present an overview, we have a wrapper controller which is composed 
> of several serial engines. The serial engines are programmed with UART, 
> I2C or SPI protocol and support DMA transfer. When the serial engines 
> perform DMA transfer, the wrapper controller device is used to perform 
> the mapping. The reason wrapper device is used is because of IOMMU and 
> there is only one IOMMU context bank to perform the translation for the 
> entire wrapper controller. So the wrapper controller exports map and 
> unmap functions to the individual protocol drivers.
> 
> There is a suggestion to make the parent wrapper controller implement 
> the dma_map_ops, instead of exported map/unmap functions and populate 
> those dma_map_ops on all the children serial engines. Can you please 
> provide your inputs regarding this suggestion?

Implementing dma_map_ops inside a driver for real hardware is almost 
always the wrong thing to do.

Based on what I could infer about the hardware from looking through the 
whole series in the linux-arm-msm archive, this is probably more like a 
multi-channel DMA controller where each "channel" has a configurable 
serial interface on the other end, as opposed to an actual bus where the 
serial engines are individually distinct AHB masters routed through the 
wrapper. If that's true, then using the QUP platform device for DMA API 
calls is the appropriate thing to do. Personally I'd be inclined not to 
abstract the dma_{map,unmap} calls at all, and just have the protocol 
drivers make them directly using dev->parent/wrapper->dev/whatever, but 
if you do want to abstract those then just give the abstraction a saner 
interface, i.e. pass the DMA handle by reference and return a regular 
int for error/success status.

Robin.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
