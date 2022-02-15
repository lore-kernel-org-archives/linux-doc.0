Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ACFC433FE
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 15:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239594AbiBOPGM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 10:06:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239589AbiBOPGM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 10:06:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC901108560
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 07:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644937561;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y8jOHYZYbA4jfSLJsozB4dmcPQCNz7v+Rkf0nVLhgeE=;
        b=AYZBS6iC4bRoQhMm4Kp7apcOZtfu2vZ0SEjhGUp2MGFVBQdSpKAqRPjckmEDGuNE+FSRZ/
        RooLUBPqo+eC9qCdKd6is0y+6mT4qtsfh1WFe8+duZsJ+UVx++pyDAirNMWfobbwW9Qba2
        DyaHuAOsukDXWWYHLLJLBPVgkv3VXSo=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-p6heNjLVObuVBBaCMduoiw-1; Tue, 15 Feb 2022 10:05:59 -0500
X-MC-Unique: p6heNjLVObuVBBaCMduoiw-1
Received: by mail-oo1-f69.google.com with SMTP id k10-20020a4ad98a000000b003185c75574dso10123659oou.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 07:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Y8jOHYZYbA4jfSLJsozB4dmcPQCNz7v+Rkf0nVLhgeE=;
        b=tKhmVriw5UA3E8HViuy+L52Bh3EXq9Lf6C+aDxpIhxBYxnTjydhtb2JGpg4lCDYn7y
         OefX8XgLHwI9CeW8GKWfh29mzoGPYbBy2O1Mrj1ifFkxBc3ss6Dd/Vp+ATnpouBjjZR9
         ujYs+to16Fbljge/1CBWoYLUUYGcu0Th0tjEnxE9PEYOz9wdyGxqd7v6HZmfEnPxr7fn
         ZSNNJ/kLbqmlqfzoGdLBeq/iKkTKML6JSX+9Z5547V1BXik+rF5971GyfWD/11mBnzp4
         f3wp/FPumfjgBOdf5UGuyUnVl7wOsAGbPiFmWN0izwZxae7esrwmsT9PePob5kPmAwt0
         b8/g==
X-Gm-Message-State: AOAM532YJDPHiCfOHZGNwYuueP6NcwQAUG3aB2fjyJxS8KfJTJyOdcz0
        ALHhQeKdXrMA0aod+P7+9DAN0tQieCOb/KMFIfr+Hbio56cGX6gwmRJsiuAUGViw9NFbiLMiabp
        ZP1v7E+GujjUesMz8aIcx
X-Received: by 2002:a05:6870:1284:: with SMTP id 4mr1499031oal.237.1644937558264;
        Tue, 15 Feb 2022 07:05:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVovLR+b6s5gf/IniSELroXTJ36lsSG5z6YFueoHAg9Edc5evG7o1wiRDX2UOg2n6RnV6AtQ==
X-Received: by 2002:a05:6870:1284:: with SMTP id 4mr1499013oal.237.1644937558019;
        Tue, 15 Feb 2022 07:05:58 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m7sm13932894ots.32.2022.02.15.07.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 07:05:57 -0800 (PST)
Subject: Re: [PATCH v1 3/7] fpga: dfl: Allow for ports with no local bar
 space.
To:     Tianfei zhang <tianfei.zhang@intel.com>, hao.wu@intel.com,
        mdf@kernel.org, yilun.xu@intel.com, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, Matthew Gerlach <matthew.gerlach@linux.intel.com>
References: <20220214112619.219761-1-tianfei.zhang@intel.com>
 <20220214112619.219761-4-tianfei.zhang@intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <0fdd3d0d-d280-8104-eccc-8fa8d8a992c2@redhat.com>
Date:   Tue, 15 Feb 2022 07:05:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220214112619.219761-4-tianfei.zhang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2/14/22 3:26 AM, Tianfei zhang wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
>  From a fpga partial reconfiguration standpoint, a port
> may not be connected any local BAR space.  The port could
> be connected to a different PCIe Physical Function (PF) or
> Virtual Function (VF), in which case another driver instance
> would manage the endpoint.

It is not clear if this is part of iofs or a bug fix.

> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>
> ---
>   drivers/fpga/dfl-pci.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
> index 4d68719e608f..8abd9b408403 100644
> --- a/drivers/fpga/dfl-pci.c
> +++ b/drivers/fpga/dfl-pci.c
> @@ -243,6 +243,7 @@ static int find_dfls_by_default(struct pci_dev *pcidev,
>   		v = readq(base + FME_HDR_CAP);
>   		port_num = FIELD_GET(FME_CAP_NUM_PORTS, v);
>   
> +		dev_info(&pcidev->dev, "port_num = %d\n", port_num);
>   		WARN_ON(port_num > MAX_DFL_FPGA_PORT_NUM);
>   
>   		for (i = 0; i < port_num; i++) {
> @@ -258,6 +259,13 @@ static int find_dfls_by_default(struct pci_dev *pcidev,
>   			 */
>   			bar = FIELD_GET(FME_PORT_OFST_BAR_ID, v);
>   			offset = FIELD_GET(FME_PORT_OFST_DFH_OFST, v);
> +			if (bar >= PCI_STD_NUM_BARS) {

Is bar set to a better magic number that pci_std_num_bars ? maybe 0xff's

How do you tell between this case and broken hw ?

Move up a line and skip getting an offset that will not be used.

> +				dev_info(&pcidev->dev, "skipping port without local BAR space %d\n",
> +					 bar);
> +				continue;
> +			} else {
> +				dev_info(&pcidev->dev, "BAR %d offset %u\n", bar, offset);
> +			}
>   			start = pci_resource_start(pcidev, bar) + offset;
>   			len = pci_resource_len(pcidev, bar) - offset;
>   

Is similar logic needed for else-if (port) block below this ?

Tom

