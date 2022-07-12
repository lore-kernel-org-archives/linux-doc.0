Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BA7C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jul 2022 15:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbiGLPMv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbiGLPM0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jul 2022 11:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BBE8DC167A
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 08:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657638312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UYGQowRRWMmN0sxEy+ystye0hklNDwtwy22gwY/oCHU=;
        b=NPGGlyt+XV0KVPZ41pR6MlKtMGyhgsxQMxCnDKnDKkzFxTbeQBWnnfuxQZ2SLr2RbwjPzD
        BXuSziQviHqZsn1rVM5CS5XacwqXi9ixPu/jQlTU1NsqXq72135KWi+du+Tr8kPbkqN7GO
        T75Ii3Ph9lc6Fxid5vtf36SMtinzApY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-e17Dx557MNKlfo1qVQ2o2A-1; Tue, 12 Jul 2022 11:05:05 -0400
X-MC-Unique: e17Dx557MNKlfo1qVQ2o2A-1
Received: by mail-wm1-f71.google.com with SMTP id y14-20020a7bcd8e000000b003a2ea282944so903871wmj.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 08:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=UYGQowRRWMmN0sxEy+ystye0hklNDwtwy22gwY/oCHU=;
        b=5OAUT7qc8GweDPCi6foVpXupQ41qfJQ5kPy99D3N8gjlc5mjAPip0lLtXwHqpz8Kck
         72euW9yFYHrsg9/YUFE3+pSfkposA3fQft0icQDQvlkJ6V2DxmkCUlpGMzQKvsbwBaZ+
         HzZ8/v9WhK4KRYk+f6KSDfW73nnQZGCzRMIBsL/cZlhfHV0z10SaOhn8SBLRQG1Izdj8
         P9fgK/lu4OwSLZe7Yv2CHYioL5o+d5AeWgH2CdOdC5jk7hhcfno92/hFJNrVHHvje+fU
         cdKgt1s+VU44Si+XcTs2Gey4UD25ECkLv34HWthqXvqdcfqGu/8HTSMm6tv1Uj/8e5qN
         B4OA==
X-Gm-Message-State: AJIora/A30916aqUFDYmDQnwSNQGTNVpKFsvavjC6VQ9+jr6Xj6igXiy
        Qnf6Qs6J+/pbXASiWfHTf2cnTx1//2zHjSEjMG9UiiCe9OzW7luts71iGArQJhzB7A5hElicp0N
        a2eA8C63yrRmD4IzbBgk=
X-Received: by 2002:a5d:5846:0:b0:21d:a98a:b236 with SMTP id i6-20020a5d5846000000b0021da98ab236mr9133156wrf.674.1657638303589;
        Tue, 12 Jul 2022 08:05:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9DslN6RE054elR+7RG4LKNVXeLPBmWOEg+8DTB3NT7tuycRzCk/nDHHFVlmgVhISImkhmFg==
X-Received: by 2002:a5d:5846:0:b0:21d:a98a:b236 with SMTP id i6-20020a5d5846000000b0021da98ab236mr9133136wrf.674.1657638303418;
        Tue, 12 Jul 2022 08:05:03 -0700 (PDT)
Received: from [192.168.9.27] (net-2-34-30-100.cust.vodafonedsl.it. [2.34.30.100])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c1d1300b003976fbfbf00sm9491042wms.30.2022.07.12.08.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 08:05:02 -0700 (PDT)
Message-ID: <23a5d310-7d5e-a8ee-bd66-b80505e0553e@redhat.com>
Date:   Tue, 12 Jul 2022 17:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To:     matthew.gerlach@linux.intel.com
Cc:     basheer.ahmed.muddebihal@intel.com, corbet@lwn.net,
        hao.wu@intel.com, linux-doc@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        mdf@kernel.org, russell.h.weight@intel.com,
        tianfei.zhang@intel.com, trix@redhat.com, yilun.xu@intel.com
References: <20220707150549.265621-3-matthew.gerlach@linux.intel.com>
Subject: Re: [PATCH v3 2/2] fpga: dfl-pci: Add IDs for Intel N6000, N6001 and
 C6100 cards
Content-Language: en-US
From:   Marco Pagani <marpagan@redhat.com>
In-Reply-To: <20220707150549.265621-3-matthew.gerlach@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022-07-07 17:05, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> 
> Add pci_dev_table entries supporting the Intel N6000, N6001
> and C6100 cards to the dfl-pci driver.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>

Tested-by: Marco Pagani <marpagan@redhat.com>

> ---
> v3: added necessary subdevice ids
>     removed 'drivers: ' from title
> 
> v2: changed names from INTEL_OFS to INTEL_DFL
> ---
>  drivers/fpga/dfl-pci.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
> index fd1fa55c9113..94eabdf1d2f7 100644
> --- a/drivers/fpga/dfl-pci.c
> +++ b/drivers/fpga/dfl-pci.c
> @@ -77,12 +77,19 @@ static void cci_pci_free_irq(struct pci_dev *pcidev)
>  #define PCIE_DEVICE_ID_INTEL_PAC_D5005		0x0B2B
>  #define PCIE_DEVICE_ID_SILICOM_PAC_N5010	0x1000
>  #define PCIE_DEVICE_ID_SILICOM_PAC_N5011	0x1001
> +#define PCIE_DEVICE_ID_INTEL_DFL		0xbcce
>  
>  /* VF Device */
>  #define PCIE_DEVICE_ID_VF_INT_5_X		0xBCBF
>  #define PCIE_DEVICE_ID_VF_INT_6_X		0xBCC1
>  #define PCIE_DEVICE_ID_VF_DSC_1_X		0x09C5
>  #define PCIE_DEVICE_ID_INTEL_PAC_D5005_VF	0x0B2C
> +#define PCIE_DEVICE_ID_INTEL_DFL_VF		0xbccf
> +
> +/* PCI Subdevice ID */
> +#define PCIE_SUBDEVICE_ID_INTEL_N6000		0x1770
> +#define PCIE_SUBDEVICE_ID_INTEL_N6001		0x1771
> +#define PCIE_SUBDEVICE_ID_INTEL_C6100		0x17d4
>  
>  static struct pci_device_id cci_pcie_id_tbl[] = {
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_PF_INT_5_X),},
> @@ -96,6 +103,18 @@ static struct pci_device_id cci_pcie_id_tbl[] = {
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCIE_DEVICE_ID_INTEL_PAC_D5005_VF),},
>  	{PCI_DEVICE(PCI_VENDOR_ID_SILICOM_DENMARK, PCIE_DEVICE_ID_SILICOM_PAC_N5010),},
>  	{PCI_DEVICE(PCI_VENDOR_ID_SILICOM_DENMARK, PCIE_DEVICE_ID_SILICOM_PAC_N5011),},
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
>  	{0,}
>  };
>  MODULE_DEVICE_TABLE(pci, cci_pcie_id_tbl);

