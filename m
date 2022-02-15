Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557B3C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 16:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241333AbiBOQKG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 11:10:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241362AbiBOQKF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 11:10:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E68EA9AD96
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644941394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bcIcETvSlPf3OlzpU/yW8tdxkR8GvRw96tnUizl6xXs=;
        b=CKpvzAeeSyroybj1fmwtBP1eFeaNO1268paeCCNLgopjxReMBOgF4BNIe8od2ClfNr4Ik6
        URt6vrZ+Dve4eFPql61IMTwzXRkjX+THlXdOiSAfz/nUlCbrQmKPzSBlUCCZ5vTsyjZFsV
        PGwMq6vYW7pmg64DS3hoKcxGkwbQhVI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-IKBQv2gMPyWvRwqP6-GxSQ-1; Tue, 15 Feb 2022 11:09:52 -0500
X-MC-Unique: IKBQv2gMPyWvRwqP6-GxSQ-1
Received: by mail-oi1-f198.google.com with SMTP id bb20-20020a056808169400b002cd940d6247so4861787oib.7
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 08:09:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bcIcETvSlPf3OlzpU/yW8tdxkR8GvRw96tnUizl6xXs=;
        b=B60dryYsPEevOpHzNHquP3yudfhvsup2gu+deoohG30hh3OZkhdG811cBHm7LhT88J
         80Lx+B5aX/LmlMA0fL0eY09DtE8lu+xJXzN8NZkYVAxa35WjS53lsfWAXPjOvr4wWMws
         HXzUhgutMsdMr/1ZDhWfPheUGKJQMFt7fWoR3DxRMqpFERVIx2c4T/3TLYmDqNdpheUg
         VzjtDvLbwAxu+/vpHzo41t9BfQOCGtg316DpGgoikULcE/skIK7cOD0sW717sj01E8oI
         TibRwY/PyaVb7q4sw2/Q/7DglCEjQdwLIIvDA3RJsHVy0pMoyABUNt2fjyP+pqBlVb82
         ReEw==
X-Gm-Message-State: AOAM530mMJ0mh4KaEQ1TUN6r3y3td/p8VhPB2SQUfaKBpAEyVmzWeH7b
        Knm7GBvSwpwrBsRSpXBoHWAPuMtQsItHYBobC5vFpQSn9DvuG54S4hPxm8QgPci/u6UAYpNbWin
        ZiqA2XXcESgAT2qk7HqZa
X-Received: by 2002:a05:6808:1647:: with SMTP id az7mr1864901oib.44.1644941391756;
        Tue, 15 Feb 2022 08:09:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwev/0bdfzhXzkz4NGi0esA4iqcPc0qa9laUz9bKob2D1v1DR8Wy/5YIceKRy1HZKCBLBb8Sw==
X-Received: by 2002:a05:6808:1647:: with SMTP id az7mr1864879oib.44.1644941391490;
        Tue, 15 Feb 2022 08:09:51 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m14sm15080864ooj.22.2022.02.15.08.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 08:09:50 -0800 (PST)
Subject: Re: [PATCH v1 6/7] fpga: dfl: Handle dfl's starting with AFU
To:     Tianfei zhang <tianfei.zhang@intel.com>, hao.wu@intel.com,
        mdf@kernel.org, yilun.xu@intel.com, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, Matthew Gerlach <matthew.gerlach@linux.intel.com>
References: <20220214112619.219761-1-tianfei.zhang@intel.com>
 <20220214112619.219761-7-tianfei.zhang@intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <773f3851-f2d3-36e6-afab-a3cf73644b87@redhat.com>
Date:   Tue, 15 Feb 2022 08:09:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220214112619.219761-7-tianfei.zhang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2/14/22 3:26 AM, Tianfei zhang wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Allow for a Device Feature List (DFL) to start with
> a Device Feature Header (DFH) of type Accelerator Function Unit (AFU)
> by doing nothing.  This allows for PCIe VFs to be created.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>
> ---
>   drivers/fpga/dfl-pci.c |  7 ++++++-
>   drivers/fpga/dfl.c     | 23 ++++++++++++++---------
>   2 files changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
> index 8abd9b408403..83b604d6dbe6 100644
> --- a/drivers/fpga/dfl-pci.c
> +++ b/drivers/fpga/dfl-pci.c
> @@ -277,7 +277,12 @@ static int find_dfls_by_default(struct pci_dev *pcidev,
>   
>   		dfl_fpga_enum_info_add_dfl(info, start, len);
>   	} else {
> -		ret = -ENODEV;
> +		v = readq(base + DFH);

This isn't likely to work on older cards.

Is there there a version to key off of ?

Tom

> +		if (FIELD_GET(DFH_TYPE, v) != DFH_TYPE_AFU) {
> +			dev_info(&pcidev->dev, "Unknown feature type 0x%llx id 0x%llx\n",
> +				 FIELD_GET(DFH_TYPE, v), FIELD_GET(DFH_ID, v));
> +			ret = -ENODEV;
> +		}
>   	}
>   
>   	/* release I/O mappings for next step enumeration */
> diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
> index a5263ac258c5..25bd24a4cca0 100644
> --- a/drivers/fpga/dfl.c
> +++ b/drivers/fpga/dfl.c
> @@ -900,9 +900,11 @@ static void build_info_free(struct build_feature_devs_info *binfo)
>   		dfl_id_free(feature_dev_id_type(binfo->feature_dev),
>   			    binfo->feature_dev->id);
>   
> -		list_for_each_entry_safe(finfo, p, &binfo->sub_features, node) {
> -			list_del(&finfo->node);
> -			kfree(finfo);
> +		if (!list_empty(&binfo->sub_features)) {
> +			list_for_each_entry_safe(finfo, p, &binfo->sub_features, node) {
> +				list_del(&finfo->node);
> +				kfree(finfo);
> +			}
>   		}
>   	}
>   
> @@ -1437,6 +1439,7 @@ dfl_fpga_feature_devs_enumerate(struct dfl_fpga_enum_info *info)
>   
>   	binfo->dev = info->dev;
>   	binfo->cdev = cdev;
> +	INIT_LIST_HEAD(&binfo->sub_features);
>   
>   	binfo->nr_irqs = info->nr_irqs;
>   	if (info->nr_irqs)
> @@ -1446,12 +1449,14 @@ dfl_fpga_feature_devs_enumerate(struct dfl_fpga_enum_info *info)
>   	 * start enumeration for all feature devices based on Device Feature
>   	 * Lists.
>   	 */
> -	list_for_each_entry(dfl, &info->dfls, node) {
> -		ret = parse_feature_list(binfo, dfl->start, dfl->len);
> -		if (ret) {
> -			remove_feature_devs(cdev);
> -			build_info_free(binfo);
> -			goto unregister_region_exit;
> +	if (!list_empty(&info->dfls)) {
> +		list_for_each_entry(dfl, &info->dfls, node) {
> +			ret = parse_feature_list(binfo, dfl->start, dfl->len);
> +			if (ret) {
> +				remove_feature_devs(cdev);
> +				build_info_free(binfo);
> +				goto unregister_region_exit;
> +			}
>   		}
>   	}
>   

