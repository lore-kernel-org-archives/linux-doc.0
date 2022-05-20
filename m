Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A315EC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 20 May 2022 23:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354134AbiETXeK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 May 2022 19:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiETXeJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 May 2022 19:34:09 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637E61A8111
        for <linux-doc@vger.kernel.org>; Fri, 20 May 2022 16:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1653089647; x=1684625647;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cxD0WkTRuBGs7QMn33plUCWC3KT9kbapNpgQIUmBMA8=;
  b=PcpKNCa5jpFfHYLabjvaku2vQQSqkMxZfhfQO0HAJ9koe4Gz9fNyS9yV
   poTxc7EfEL/ZoTHsF8wsc9FE25APoBNhp6IWfXQJLrSwI6w+P5HJvpKLc
   2MPRj1pS5SG1WezMjRurKyfO2fquBhGJsf+DxFBGG646Z1KIwmh377Bwk
   x+90/LhjJ/Hkgi+fMJduAVuwj5r/z0OqrJ9FBol+NztdyTMdfuVmbJUmv
   wydARh8PZImQAmaE75Ni9nekhGtXJ8NbAg6ddC6/U3qKykNlYjJoYGT7O
   Btf+cWZKl3ZYzBFHBLO6XGbvuYkMuk2/iK3wWMd30+QqDQ/ej4n386s2I
   g==;
X-IronPort-AV: E=Sophos;i="5.91,240,1647273600"; 
   d="scan'208";a="200966405"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 21 May 2022 07:34:07 +0800
IronPort-SDR: a/DhSMjE1JvCCetb8iuijNIAcD5ClDfvoz5HIj3ZGRUQGbY6uNWspi/1hJMC7l/fGDYkDqKz7d
 NP8KgxGlAmg7ntHi8FUqmMXjQ7G5Y/lZOR60Y6SzPkALVAySFgZ6Z8kbTLVr6bwG+xLBd27AMu
 Fzufxsaa72FPaAtKRBpPcY7xBURL2EebS8if2bxoKncWkCsxokj6ZhoUFjt11mjuytKXb7Q5NF
 T8HLPboH7OjpaFHDq3Fmo312413gSS1O85v19W9L8huJd43Z7EciavnzVz6QWWC2oQB5nwp3IO
 AWGa1c2fGBfJX1irXco1BSEY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2022 15:56:50 -0700
IronPort-SDR: CxGnuwO1zUGTTOBfghJM3oJA64dYV/PpvOApF6qh9Pqh14V2tKscDTboK3zIkUVU7m78beDFtd
 rdKtWiFNWvNMyccgJMWEs8cgp/SJMswlJhVFH1EUXKxmOjAS29ZIw9z7W/drMMIWp9nn2VR+1I
 YDkqdU2N6pAHEPK6+Xl2UI3tjDmjbuK9XaOpyt3qysTzzdvloFShbpQReQzxOUjXaKgCfiE7rE
 3aKLJ7R0wrABRYgY+XLlBk8lyP63XGyfePOT3Mv8swWIdbPhk+b/ZC1V8aLqDIvYBKkKHN1Vve
 OgA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2022 16:34:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L4jjW0d2mz1SVp3
        for <linux-doc@vger.kernel.org>; Fri, 20 May 2022 16:34:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1653089646; x=1655681647; bh=cxD0WkTRuBGs7QMn33plUCWC3KT9kbapNpg
        QIUmBMA8=; b=IAZfh2N/A1jItIRu6RNK4GCq/n7NLG1+opKeFCVPmNoD3nU4SpR
        bC6akAQHrRKjwDRGh4NXwXV/FMrBCZ6GcNYZcuC2ARib1r2sjAHkGU9Ep1cDFwop
        mDfqvuMSQssge51ujkq7vQ5pCjovouoGBfDz3E5IaM9G2Qqp9uzAo46qFsID7yHl
        Vw6amvteVP/EJl7jEGH7Boh6b3YkUpvvr5IwG9eq9uJub53GSlGzOb852GLfBhb/
        JW5MGlFzL5zQEqnjhAL3oRx/o0N9qjqNC1su+SaebsoCtTk5dX1J8MyoLkNh1FZr
        qCDdMdkk9R1i9CbzUDAwGjlwztQvrlS+5aw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 42vAjVRwfruc for <linux-doc@vger.kernel.org>;
        Fri, 20 May 2022 16:34:06 -0700 (PDT)
Received: from [10.225.163.51] (unknown [10.225.163.51])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L4jjS0PF4z1Rvlc;
        Fri, 20 May 2022 16:34:03 -0700 (PDT)
Message-ID: <1a683059-d718-9536-e8fe-d7d47e25e935@opensource.wdc.com>
Date:   Sat, 21 May 2022 08:34:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/4] libata-scsi: Cap ata_device->max_sectors according to
 shost->max_sectors
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, joro@8bytes.org,
        will@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-scsi@vger.kernel.org, liyihang6@hisilicon.com,
        chenxiang66@hisilicon.com, thunder.leizhen@huawei.com
References: <1653035003-70312-1-git-send-email-john.garry@huawei.com>
 <1653035003-70312-5-git-send-email-john.garry@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1653035003-70312-5-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/20/22 17:23, John Garry wrote:
> ATA devices (struct ata_device) have a max_sectors field which is
> configured internally in libata. This is then used to (re)configure the
> associated sdev request queue max_sectors value from how it is earlier set
> in __scsi_init_queue(). In __scsi_init_queue() the max_sectors value is set
> according to shost limits, which includes host DMA mapping limits.
> 
> Cap the ata_device max_sectors according to shost->max_sectors to respect
> this shost limit.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>  drivers/ata/libata-scsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
> index 06c9d90238d9..25fe89791641 100644
> --- a/drivers/ata/libata-scsi.c
> +++ b/drivers/ata/libata-scsi.c
> @@ -1036,6 +1036,7 @@ int ata_scsi_dev_config(struct scsi_device *sdev, struct ata_device *dev)
>  		dev->flags |= ATA_DFLAG_NO_UNLOAD;
>  
>  	/* configure max sectors */
> +	dev->max_sectors = min(dev->max_sectors, sdev->host->max_sectors);
>  	blk_queue_max_hw_sectors(q, dev->max_sectors);
>  
>  	if (dev->class == ATA_DEV_ATAPI) {

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
