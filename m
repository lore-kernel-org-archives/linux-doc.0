Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5DDC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jul 2022 21:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237349AbiGMV7o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jul 2022 17:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237355AbiGMV7j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 17:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E1E9DEE9
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657749574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=guTnNvlqH6K4wA2UCt8wsczuHAK4rJrHvdvd+slq1vY=;
        b=JeRfmIIYY8aRQ2zB44IpLbgd+6pXNSqiUDJZzX1v3+GYaCMDtQVz0Ysu+MnqOL3vhzqb/A
        CeH3I53cRV4ToYWBY6q7bnrpM3I+GBxxz6V6LdxODIvVCyj53575/xe3IhP+RIzaINkBBn
        CPaLqE0k1eP81MjD2fPPdXCvfHWm2Pc=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-TEiai-zHNNaQpA_BXzjWYg-1; Wed, 13 Jul 2022 17:59:30 -0400
X-MC-Unique: TEiai-zHNNaQpA_BXzjWYg-1
Received: by mail-oi1-f197.google.com with SMTP id b205-20020aca34d6000000b0033a33a68361so89049oia.10
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 14:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=guTnNvlqH6K4wA2UCt8wsczuHAK4rJrHvdvd+slq1vY=;
        b=IiRqjMBqLLRbRMcfjoAb9wZ/eukegsY2A/+WFfghN5raBt2yYE4okW0Op7w5tcE/FW
         hq3CDRHEPuX8xyyIPci8iSVS8TSyUDIi2/ZbJBtGhdeuFqhSr2iK/vpf0+AD5gT8q/Rz
         5CUcifOvgmmEsa4Jx7QyCGLcvqTFsNMxY/uruzBoOXWIRzytWb19V7AzE1/Am2yTKhVL
         nTtoTysKQG2mrargTMkF6WqphOlXfwoS8+gRqyzGMyFEd+s4Iz107rvQ0ihqc8ZTyQnT
         /kXh87L1TTwCKpnylxofR8G1/GBscVIwpbDEow7IllCHWrbuTd+LPcpA4zeqt57nszGy
         cEWg==
X-Gm-Message-State: AJIora/5VRKoFgvjo8tdJunLNTSuCy97ELgXO7POLW7iBYjTPI5uQQn9
        dHFqtHZcgv+8+1WH4zA23zCvSZzdqjrzo8A/+US2UI7QImnu6mJlX7ZlFKo28snbb4hpNEhd48p
        ekvgD2Z+ISNp86SeoyVDt
X-Received: by 2002:a05:6870:56a9:b0:10b:fca8:b578 with SMTP id p41-20020a05687056a900b0010bfca8b578mr3019411oao.78.1657749567195;
        Wed, 13 Jul 2022 14:59:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXUp0wlYWszzuHD0u8u82/GNIF0Dw1ziwn/JICNJZfYCbi3V26XmDeIVoOS/Lkfl6sMd8o8w==
X-Received: by 2002:a05:6870:56a9:b0:10b:fca8:b578 with SMTP id p41-20020a05687056a900b0010bfca8b578mr3019398oao.78.1657749567008;
        Wed, 13 Jul 2022 14:59:27 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id x13-20020a056870b40d00b001089aef1815sm32984oap.20.2022.07.13.14.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 14:59:26 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] fpga: dfl-pci: Add IDs for Intel N6000, N6001 and
 C6100 cards
To:     matthew.gerlach@linux.intel.com, hao.wu@intel.com,
        yilun.xu@intel.com, russell.h.weight@intel.com,
        basheer.ahmed.muddebihal@intel.com, mdf@kernel.org, corbet@lwn.net,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tianfei.zhang@intel.com
References: <20220707150549.265621-1-matthew.gerlach@linux.intel.com>
 <20220707150549.265621-3-matthew.gerlach@linux.intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <0c2affef-9a62-3422-ecdb-a8f196ce739c@redhat.com>
Date:   Wed, 13 Jul 2022 14:59:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220707150549.265621-3-matthew.gerlach@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 7/7/22 8:05 AM, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Add pci_dev_table entries supporting the Intel N6000, N6001
> and C6100 cards to the dfl-pci driver.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>
> ---
> v3: added necessary subdevice ids
>      removed 'drivers: ' from title
>
> v2: changed names from INTEL_OFS to INTEL_DFL
> ---
>   drivers/fpga/dfl-pci.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
> index fd1fa55c9113..94eabdf1d2f7 100644
> --- a/drivers/fpga/dfl-pci.c
> +++ b/drivers/fpga/dfl-pci.c
> @@ -77,12 +77,19 @@ static void cci_pci_free_irq(struct pci_dev *pcidev)
>   #define PCIE_DEVICE_ID_INTEL_PAC_D5005		0x0B2B
>   #define PCIE_DEVICE_ID_SILICOM_PAC_N5010	0x1000
>   #define PCIE_DEVICE_ID_SILICOM_PAC_N5011	0x1001
> +#define PCIE_DEVICE_ID_INTEL_DFL		0xbcce
>   
>   /* VF Device */
>   #define PCIE_DEVICE_ID_VF_INT_5_X		0xBCBF
>   #define PCIE_DEVICE_ID_VF_INT_6_X		0xBCC1
>   #define PCIE_DEVICE_ID_VF_DSC_1_X		0x09C5
>   #define PCIE_DEVICE_ID_INTEL_PAC_D5005_VF	0x0B2C
> +#define PCIE_DEVICE_ID_INTEL_DFL_VF		0xbccf
> +
> +/* PCI Subdevice ID */
> +#define PCIE_SUBDEVICE_ID_INTEL_N6000		0x1770
> +#define PCIE_SUBDEVICE_ID_INTEL_N6001		0x1771
> +#define PCIE_SUBDEVICE_ID_INTEL_C6100		0x17d4
>   
>   static struct pci_device_id cci_pcie_id_tbl[] = {
>   	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_PF_INT_5_X),},
> @@ -96,6 +103,18 @@ static struct pci_device_id cci_pcie_id_tbl[] = {
>   	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_PAC_D5005_VF),},
>   	{PCI_DEVICE(PCI_VENDOR_ID_SILICOM_DENMARK, PCIE_DEVICE_ID_SILICOM_PAC_N5010),},
>   	{PCI_DEVICE(PCI_VENDOR_ID_SILICOM_DENMARK, PCIE_DEVICE_ID_SILICOM_PAC_N5011),},
> +	{PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_DFL,
> +			PCI_VENDOR_ID_INTEL, PCIE_SUBDEVICE_ID_INTEL_N6000),},
> +	{PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_DFL_VF,
> +			PCI_VENDOR_ID_INTEL, PCIE_SUBDEVICE_ID_INTEL_N6000),},
> +	{PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_DFL,
> +			PCI_VENDOR_ID_INTEL, PCIE_SUBDEVICE_ID_INTEL_N6001),},
> +	{PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_DFL_VF,
> +			PCI_VENDOR_ID_INTEL, PCIE_SUBDEVICE_ID_INTEL_N6001),},
> +	{PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_DFL,
> +			PCI_VENDOR_ID_INTEL, PCIE_SUBDEVICE_ID_INTEL_C6100),},
> +	{PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_DFL_VF,
> +			PCI_VENDOR_ID_INTEL, PCIE_SUBDEVICE_ID_INTEL_C6100),},

Matt,

Thanks for making this change, this addresses my concerns with the 
earlier patch.

Reviewed-by: Tom Rix <trix@redhat.com>

>   	{0,}
>   };
>   MODULE_DEVICE_TABLE(pci, cci_pcie_id_tbl);

