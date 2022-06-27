Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50ABC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jun 2022 23:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241967AbiF0XYQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jun 2022 19:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241196AbiF0XYQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jun 2022 19:24:16 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6265823169
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 16:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1656372254; x=1687908254;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S8N+p0moc3MloWqEEauJLXVpb/5eTV2AD6EVivHGR+Q=;
  b=OI0edh33Da6Kr4vDJdjyVE+HOpOLwVJxXtDJRqKZ/PFgQ9lyvBqJX126
   wjmzbAI/B6A8EaXC+LwyDiz6gJu5ZoToC2IyOww9yJ8bJduuFtKj40qsx
   kK98GfLegK6WSN0MI4PxfRjQsUZJ8PlQKGRpeSkgmDcRFoopPMCz/xjlc
   TowN2YWrCd9XjBC/tsaRns7aFlHejEei2IqfuO96wpKNyzbEuHgrvN4O4
   XoorNgNHlbzFot8O4XX68lO/NEmGXlzioR1yG6hIlGvEbErpcO1/fFgrB
   n02DCbwKWzA0ksPRvX46zlzgXmjJ1byFRcyDxJXJbZ7S+aZ01SPJx7u9C
   A==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650902400"; 
   d="scan'208";a="204233394"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jun 2022 07:24:13 +0800
IronPort-SDR: GqSySP5bRbq4WHE9ugaQLDjZ90TFqPvp0PsZj9dl/Ao3l3orHCazl8CsflojGqgifZIjMWRRIC
 3E8fl0Qdq2NCIGhoxvYtIPpHH2kpyHrqg8sdhy+D5jmL4cn0wA5RZijZUescFtMkz5qWi7X4Ub
 DxoacG8xG6gs3JxyPvaV4FZ+k+tiCWXFUvC8Fzu/fYEinhC0A8RIGElgE2HUGFgUY3M3vG/59p
 oSM7ReiPB00ONyazYQN6NinOSWxGdoZFwoEa05YmUv6JY0QRW/+6JrUPc7nQXa0B678UDEcEL5
 ejlbYSjTxVhaT448e9W5S0Gu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2022 15:46:36 -0700
IronPort-SDR: CZ8/P28ZoivDq9blZs8GybUrr6EM/UuUHJvW3JmAX4NKAV4E4NSPWTnH9Vqw9wP54Elfnisj48
 TE8jrf68IYvwLrb/jCPpQpn6BZ9lTqK++87xh2DqnmAaW/XZ70X1MlRtbIGzuJ/1g516bND1Zw
 odhzqKQCwkAVs9JMouLLd0IIbt2ps4GP8jEi/oHsgb7RU0sWXWf7ieRAhUEWoVkyWFHXcTxUF3
 7cBW0URBmIvNX028M78ZV3QZx4RyNyPRhIr5Yrbuvkg6yub5ytN0txNQS32whxP/Nz8klcg8dn
 YSQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2022 16:24:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LX3hY4Gqzz1Rw4L
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 16:24:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1656372252; x=1658964253; bh=S8N+p0moc3MloWqEEauJLXVpb/5eTV2AD6E
        VivHGR+Q=; b=DOmB0q+yumadQfEfKMysp6ZcnZ0HtW72qJdwM5m8B0Kc9Tad+dF
        7gDs0OfNHqCTGeSJfqD9/6sW1evo3sq7cfUvTRWVJIHK1cvpn/iA0skUc9IIKiE8
        KNmo/tqZYLCa5cn5qWD0Ryij/7qx8e/kumjGMwTGlY2HfYRxOMPtvr9WNC/dUNhF
        menESGNdXZJXjqA+MtrgYPevYEFlhkjHja7G3apSDEhYWjiRMEr2hwIPvwtYRb3G
        oGa6nySA/D6iv8hrxLg69E36edryEq45dv95ZCgDqaDMBUQ/0rXQ/5OSFkcyN4S3
        m/oYW8SWIyUKCVcIwEf/+kyLjCcbBjt44xA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ZFfKILKOpyJj for <linux-doc@vger.kernel.org>;
        Mon, 27 Jun 2022 16:24:12 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LX3hV0cq4z1RtVk;
        Mon, 27 Jun 2022 16:24:09 -0700 (PDT)
Message-ID: <b69c6112-98b7-3890-9d11-bb321a7c877a@opensource.wdc.com>
Date:   Tue, 28 Jun 2022 08:24:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 5/5] libata-scsi: Cap ata_device->max_sectors according
 to shost->max_sectors
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, joro@8bytes.org,
        will@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, iommu@lists.linux-foundation.org,
        iommu@lists.linux.dev, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com
References: <1656343521-62897-1-git-send-email-john.garry@huawei.com>
 <1656343521-62897-6-git-send-email-john.garry@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1656343521-62897-6-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/28/22 00:25, John Garry wrote:
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
> Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Nit: please change the patch title to "ata: libata-scsi: Cap ..."

> ---
>  drivers/ata/libata-scsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
> index 86dbb1cdfabd..24a43d540d9f 100644
> --- a/drivers/ata/libata-scsi.c
> +++ b/drivers/ata/libata-scsi.c
> @@ -1060,6 +1060,7 @@ int ata_scsi_dev_config(struct scsi_device *sdev, struct ata_device *dev)
>  		dev->flags |= ATA_DFLAG_NO_UNLOAD;
>  
>  	/* configure max sectors */
> +	dev->max_sectors = min(dev->max_sectors, sdev->host->max_sectors);
>  	blk_queue_max_hw_sectors(q, dev->max_sectors);
>  
>  	if (dev->class == ATA_DEV_ATAPI) {


-- 
Damien Le Moal
Western Digital Research
