Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B16BC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 16:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241455AbiBOQQj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 11:16:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241453AbiBOQQj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 11:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6720AC0C
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 08:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644941787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B52YMK1HFvXByJ7MNOOTdlfyH5lYACIthHaLpPUqg9M=;
        b=a+gs1f74epAu1URvNZnKP2yr+uh8xovuoicX9W2v2P3ilbZtstIfalWl91jmUWWne9DoGY
        JwtYPtrN2ebMBfAoD4jXmuvdMYVewc3dqrtUwzUK5ZZdT0X71VlZKrfPUSfceY4qi986C/
        5G6c7hoXDV7HdX0JyRDjiRCFPPSW3q4=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-zi3Jq5vFPKOy5qWhPvbAdA-1; Tue, 15 Feb 2022 11:16:26 -0500
X-MC-Unique: zi3Jq5vFPKOy5qWhPvbAdA-1
Received: by mail-oo1-f70.google.com with SMTP id s14-20020a4aa54e000000b002ea553d580eso12898651oom.4
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 08:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=B52YMK1HFvXByJ7MNOOTdlfyH5lYACIthHaLpPUqg9M=;
        b=aPvS9UGJyIFJ+7jKTbsbjm7CnlP8L2/GCH9yieLBsHGzDcs09JHWG0w0skm1Scsfat
         UbmpCpxX9uOLr/vwcQDTi1ENtFZ68THpae2YIoadsDhV7cq8Vaa70QWsvESfVl5ejmCT
         OBtIKIRt0ojxR1hpuI5epJdExZC5FJji1VfMrU5GMhq/KLo8Z957pzXtNjIldUD9JSht
         U/Wm3MT6kqy6UyK2pOqERBLIjLSP/CpSk9det4pVKyV5bAi+3SP/g+NvbetgFcBrY6ME
         VibMEYNIMzMmQAtIO8U6TKEmdZvvdsKPS0wiqaDl7I51y+C+eyvNGwtQrAhA1K9A9y4+
         ZdOw==
X-Gm-Message-State: AOAM533OsswUfhdnbMmyXjaCvyOzaj8ScDuyEEzZaU+gmBWnxfZD1XGv
        9fyI/LDKoIU+kYV3CV9XxOiYdXN8R2lisb3e+9aCgMXYyhFLX1sOs3GXSmSbzELuI5prZ0RdVG9
        JOAPAlueda1pFfb6WoIGg
X-Received: by 2002:a4a:d5ca:: with SMTP id a10mr1537655oot.88.1644941785065;
        Tue, 15 Feb 2022 08:16:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvkXRkoitgTXd23UUFGnfd4xIFxcrT3/1sw6kemCC5pmflPuTRt9zwwMNWa6pDW67BJj5ghQ==
X-Received: by 2002:a4a:d5ca:: with SMTP id a10mr1537642oot.88.1644941784822;
        Tue, 15 Feb 2022 08:16:24 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id s11sm13619826otq.69.2022.02.15.08.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 08:16:24 -0800 (PST)
Subject: Re: [PATCH v1 7/7] fpga: dfl: pci: Add generic OFS PCI PID
To:     Tianfei zhang <tianfei.zhang@intel.com>, hao.wu@intel.com,
        mdf@kernel.org, yilun.xu@intel.com, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, Matthew Gerlach <matthew.gerlach@linux.intel.com>
References: <20220214112619.219761-1-tianfei.zhang@intel.com>
 <20220214112619.219761-8-tianfei.zhang@intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <ed8f4b5f-5c92-f555-ed2d-c5b8f38d5372@redhat.com>
Date:   Tue, 15 Feb 2022 08:16:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220214112619.219761-8-tianfei.zhang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2/14/22 3:26 AM, Tianfei zhang wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Add the PCI product id for an Open FPGA Stack PCI card.
Is there a URL to the card ?
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>
> ---
>   drivers/fpga/dfl-pci.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
> index 83b604d6dbe6..cb2fbf3eb918 100644
> --- a/drivers/fpga/dfl-pci.c
> +++ b/drivers/fpga/dfl-pci.c
> @@ -76,12 +76,14 @@ static void cci_pci_free_irq(struct pci_dev *pcidev)
>   #define PCIE_DEVICE_ID_INTEL_PAC_D5005		0x0B2B
>   #define PCIE_DEVICE_ID_SILICOM_PAC_N5010	0x1000
>   #define PCIE_DEVICE_ID_SILICOM_PAC_N5011	0x1001
> +#define PCIE_DEVICE_ID_INTEL_OFS		0xbcce

INTEL_OFS is a generic name, pci id's map to specific cards

Is there a more specific name for this card ?

Tom

>   
>   /* VF Device */
>   #define PCIE_DEVICE_ID_VF_INT_5_X		0xBCBF
>   #define PCIE_DEVICE_ID_VF_INT_6_X		0xBCC1
>   #define PCIE_DEVICE_ID_VF_DSC_1_X		0x09C5
>   #define PCIE_DEVICE_ID_INTEL_PAC_D5005_VF	0x0B2C
> +#define PCIE_DEVICE_ID_INTEL_OFS_VF		0xbccf
>   
>   static struct pci_device_id cci_pcie_id_tbl[] = {
>   	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_PF_INT_5_X),},
> @@ -95,6 +97,8 @@ static struct pci_device_id cci_pcie_id_tbl[] = {
>   	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_PAC_D5005_VF),},
>   	{PCI_DEVICE(PCI_VENDOR_ID_SILICOM_DENMARK, PCIE_DEVICE_ID_SILICOM_PAC_N5010),},
>   	{PCI_DEVICE(PCI_VENDOR_ID_SILICOM_DENMARK, PCIE_DEVICE_ID_SILICOM_PAC_N5011),},
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_OFS),},
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_OFS_VF),},
>   	{0,}
>   };
>   MODULE_DEVICE_TABLE(pci, cci_pcie_id_tbl);

