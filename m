Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFD4C43334
	for <linux-doc@archiver.kernel.org>; Thu, 30 Jun 2022 23:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbiF3XuR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Jun 2022 19:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbiF3XuR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jun 2022 19:50:17 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0107E5C967
        for <linux-doc@vger.kernel.org>; Thu, 30 Jun 2022 16:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1656632981; x=1688168981;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nwEn1VMZrx8GUvODDT0OaTNy6z1BOZ2HCe57NZ02Lbc=;
  b=kpEbRW2X3oEidjs8uBQHkwmJkxUhHK/wYY7FI6uj9a5dnSE6TzlXWTEK
   0TAlt8byWlEFQtZRArQHxIKvqorHEwNfYBGYy7FitZm1B+BAK11HwLnSr
   H/QTnxcgLitwaF+5jEyL1Qcgc+xBaSZok+ML/l3w/omzzYmdx1XzT+gOG
   eY1jsg+pHl7ZiZI5IQuiM5r0whL7CzhxSgBFUcRifmsS7weZGjGvJsk/h
   NaB5SzfNRsdSfq7ufdY1XNiBEs+1p79oQWzKLKYO3QQS5+iHmlJnYH9Ff
   CZNZ6d5t+SPIiwqKv4q/W1diZLQvSvQLteAfJHQd8Sa6orFR8t/aYPelk
   g==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650902400"; 
   d="scan'208";a="308859934"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2022 07:49:41 +0800
IronPort-SDR: 2KRSNGLVrFA1MasZC076VG4JSf7NAKUq+/t8TnFfgAW+kHb4lNdN68a76rGaIkheLg4GJj5Pq9
 PIlbUw95KicRAO/TaQKh6y4bale95oUIVEhZEg7PxNE5ACgV9VdfW8xUZ6CwjuutYg4N84+ULo
 nZQ7nG3jIaq7rqLkHRT/nAHMxVMLkWKFPhHTr4tDMrs/rhMEH0pVGC6NaJ40YP4ReoJkihuAoR
 jZ3dU/mCb0kNBtkFXGl7aL9lBxZiT+xEr7wV028ITrdO1FrRe8urQosUhXfZtWzWUYXWaCv7LL
 ahqD40oxyePHSphAuHGhc/Yk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2022 16:07:15 -0700
IronPort-SDR: mXV9R6jSXMRNlDloGj7ukdWJUj2ctTDe1N04UF2P93RpcyjT1b9/wqyY+wCfPGucQMLPFvC/mJ
 gAF14fL4Bf2BhKV8EW5YDqUDHzUWP3zzd5XQbUyIgrtAp7wFXczgcicuXkxH3r9opThlolUW4P
 geJziEv5S96AREJaE585N88MvEhIjqM8KVNHQM3EcFUR/i+qP14E2w1uJMx/lzeNbTwE3VpIdf
 CVNrQ4Rj+j1rV669znCVpzT7CF/8aawEwv4w+5j83iyOIXYmJx+sigjzaOqgLimu3/w9TG/jxP
 gpc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2022 16:49:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYw6Y0xH0z1Rwnm
        for <linux-doc@vger.kernel.org>; Thu, 30 Jun 2022 16:49:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1656632980; x=1659224981; bh=nwEn1VMZrx8GUvODDT0OaTNy6z1BOZ2HCe5
        7NZ02Lbc=; b=WLH01e7EcYJscXnwQ3vvbmxQTuNCz3i5pBQVZdrz66seSwF49h1
        +8GS6jTrsLEAkuw/tD2AknhPYioGLd4d7sT3GQLnO6xu/H8Jja/BvPtC53e7auQP
        2ySivAr3YR8mb2/bi7YxGSMXNxKQK4k66W4nuilErMzlwRy3gJ/aBV7BiQf2lZgN
        w3Be/GZWvaOFz6780wZxse2VtnKneGGzbV4SXNJ7ACmPrxcECYPahoxF1WbKesDe
        Kdmo3OxJxKftQgVnI75yZCLNb1RE5mbPQy6HR+ycBckrjlDzqPdHq0Q3XHuPEaRr
        ThWJqmi9TPbB2tm7FvbOONX5x4GDU+VLEEw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id euqz00ks2OwQ for <linux-doc@vger.kernel.org>;
        Thu, 30 Jun 2022 16:49:40 -0700 (PDT)
Received: from [10.225.163.102] (unknown [10.225.163.102])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYw6T5Ymgz1RtVk;
        Thu, 30 Jun 2022 16:49:37 -0700 (PDT)
Message-ID: <2e6475e5-4899-1e3a-1418-918b9510ec6d@opensource.wdc.com>
Date:   Fri, 1 Jul 2022 08:49:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 4/5] scsi: scsi_transport_sas: Cap shost max_sectors
 according to DMA optimal limit
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, joro@8bytes.org,
        will@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, iommu@lists.linux-foundation.org,
        iommu@lists.linux.dev, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com
References: <1656590892-42307-1-git-send-email-john.garry@huawei.com>
 <1656590892-42307-5-git-send-email-john.garry@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1656590892-42307-5-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/30/22 21:08, John Garry wrote:
> Streaming DMA mappings may be considerably slower when mappings go through
> an IOMMU and the total mapping length is somewhat long. This is because the
> IOMMU IOVA code allocates and free an IOVA for each mapping, which may
> affect performance.
> 
> For performance reasons set the request queue max_sectors from
> dma_opt_mapping_size(), which knows this mapping limit.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>  drivers/scsi/scsi_transport_sas.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/scsi/scsi_transport_sas.c b/drivers/scsi/scsi_transport_sas.c
> index 12bff64dade6..1b45248748e0 100644
> --- a/drivers/scsi/scsi_transport_sas.c
> +++ b/drivers/scsi/scsi_transport_sas.c
> @@ -225,6 +225,7 @@ static int sas_host_setup(struct transport_container *tc, struct device *dev,
>  {
>  	struct Scsi_Host *shost = dev_to_shost(dev);
>  	struct sas_host_attrs *sas_host = to_sas_host_attrs(shost);
> +	struct device *dma_dev = shost->dma_dev;
>  
>  	INIT_LIST_HEAD(&sas_host->rphy_list);
>  	mutex_init(&sas_host->lock);
> @@ -236,6 +237,11 @@ static int sas_host_setup(struct transport_container *tc, struct device *dev,
>  		dev_printk(KERN_ERR, dev, "fail to a bsg device %d\n",
>  			   shost->host_no);
>  
> +	if (dma_dev) {
> +		shost->max_sectors = min_t(unsigned int, shost->max_sectors,
> +				dma_opt_mapping_size(dma_dev) >> SECTOR_SHIFT);
> +	}

Hmm... shost->max_sectors becomes the max_hw_sectors limit for the block
dev. So using dma_max_mapping_size(dma_dev) for that limit makes sense.
Shouldn't dma_opt_mapping_size(dma_dev) be used to limit only the default
"soft" limit (queue max_sectors limit) instead of the hard limit ?

> +
>  	return 0;
>  }
>  
-- 
Damien Le Moal
Western Digital Research
