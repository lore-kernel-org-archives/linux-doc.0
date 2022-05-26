Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020FAC4332F
	for <linux-doc@archiver.kernel.org>; Thu, 26 May 2022 22:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344600AbiEZW5D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 May 2022 18:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245102AbiEZW47 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 May 2022 18:56:59 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC08AE279
        for <linux-doc@vger.kernel.org>; Thu, 26 May 2022 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1653605818; x=1685141818;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aI6/VxU2h7xTzqWQsH03zlgK2zXxTVp7REvISJhfkUM=;
  b=IynPiefEofyyWs80VmroKaQn2NDlPllfI4n2WlnwnroGvKo0nwQvB7tK
   x0B0w91JSP5VPeow35wMVhyYhvNf99mYG4cMz7sMnx8EJiQJSZjBLd/Wx
   GCz1Tt7eYy0XFLkgYx3omH4705WhladN0I5lpRDu82tJ0RFBH0fGWZkJ/
   AdjdOaV53939YAUN1kfB7RdOBGpM635oalYkBXnhVaA5jFpN/mmqIdfF8
   DeK8CD7zK7OtZeoAv9VtlF7/F2D31WLtOSVJpDT7NXklJTiyVF8Ia9Q0L
   0OdDMw26YjfrShHKmwuU7quBIGb990JBbkSMgIeJBgvVmO7kpdOzlABNr
   A==;
X-IronPort-AV: E=Sophos;i="5.91,252,1647273600"; 
   d="scan'208";a="200329735"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 May 2022 06:56:56 +0800
IronPort-SDR: 7R/iX04DCe++N5xvfgK/YDjtReNei+sLcXQS2OhwIe1Afefn/ir962Y3pYmUZOYZNsgO9vDExv
 k/MO6saV6ZWcZt7Acl0/jaoELeprgaSygj4ajz0qeEqbfVIF6lXZC/ObWfHRcF9Cnr4JG9rrUD
 8UXmfIZUdJu0Z4DgbeAVRhUFtkpAEryke5v5BDIJLIOExXadnc5Kk7WxpiVJulpkGT0x5gxtCS
 XhJ3UB7nNeNVP6Z1B8JyCtJBR5WhiPs9S381kedH1bBEcss8M0Wmy9HeTzgjTQ0HSpcNvtA6a8
 /P2ZwEIYV660+G05bnHWFaur
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 May 2022 15:20:50 -0700
IronPort-SDR: WuJJ4guttm+2u+h+0ThFi9TJF5/FG943n+SMSD2z2JABQc58oFrVdsorJ5/mVaoQ9ee+gitKCa
 kl6VKAKoc1SdYlZQDCTM3derSvqAmqYkqbtZ7pgFpoT1xxqYEHJ3yhVDg0McrMr6OThBRe8BR7
 eMzZuecAxAqjA+BQv46qdQD2xGSquXhMM7oP1TcB4IlQuqPMrDnFwgfuLGT4aNCWahli29LKB3
 peVs2P22qVc4Nx3lnDR2oZ6nXsW51v5Om8QUEFvDcGDa4UL2pSPRjxhBPfHvHYGw6nkgQCz9wa
 VRE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 May 2022 15:56:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L8Nbq15BLz1SVp0
        for <linux-doc@vger.kernel.org>; Thu, 26 May 2022 15:56:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1653605813; x=1656197814; bh=aI6/VxU2h7xTzqWQsH03zlgK2zXxTVp7REv
        ISJhfkUM=; b=ZMjnbG7olkfDf5l1SwlHU8A4lGWkNdfHPtKYVJRHL+5eszhJpP+
        XEyIWslNSQeJl8YYdu9noa4TAhHFBxIAw8jquqtu01xUi7+l30f3iHky1jC0pjbl
        8fWsJWgKoNkpssnhCIO+DeRD8dLG8ouA7Td+mlBidx8Spj+d3Ai+FNwcAwV3gIHs
        QovipGbyUGe3joG6No8N7KsmIJnH6ZfPkHSwKLaET55vJbSJ/KkWGLAN+xIXOoEP
        0QBw9YJb0fVwt7ZrEXDu0R4sIwrCUxnJRX0pZfCmW7ddqPlNlx3hJbyJ2B0oZRIF
        lSjn902FTXM8dV2sJcOXy25EW/9oAa6kAGw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id KuZDtZYpQcCl for <linux-doc@vger.kernel.org>;
        Thu, 26 May 2022 15:56:53 -0700 (PDT)
Received: from [10.89.80.98] (c02drav6md6t.dhcp.fujisawa.hgst.com [10.89.80.98])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L8Nbl3WbCz1Rvlc;
        Thu, 26 May 2022 15:56:51 -0700 (PDT)
Message-ID: <36dbfa77-d8f0-88d4-7dda-1e18c4c453b8@opensource.wdc.com>
Date:   Fri, 27 May 2022 07:56:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/4] dma-iommu: Add iommu_dma_opt_mapping_size()
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, joro@8bytes.org,
        will@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-scsi@vger.kernel.org, liyihang6@hisilicon.com,
        chenxiang66@hisilicon.com, thunder.leizhen@huawei.com
References: <1653560914-82185-1-git-send-email-john.garry@huawei.com>
 <1653560914-82185-3-git-send-email-john.garry@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1653560914-82185-3-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/05/26 19:28, John Garry wrote:
> Add the IOMMU callback for DMA mapping API dma_opt_mapping_size(), which
> allows the drivers to know the optimal mapping limit and thus limit the
> requested IOVA lengths.
> 
> This value is based on the IOVA rcache range limit, as IOVAs allocated
> above this limit must always be newly allocated, which may be quite slow.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>  drivers/iommu/dma-iommu.c | 6 ++++++
>  drivers/iommu/iova.c      | 5 +++++
>  include/linux/iova.h      | 2 ++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 09f6e1c0f9c0..f619e41b9172 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1442,6 +1442,11 @@ static unsigned long iommu_dma_get_merge_boundary(struct device *dev)
>  	return (1UL << __ffs(domain->pgsize_bitmap)) - 1;
>  }
>  
> +static size_t iommu_dma_opt_mapping_size(void)
> +{
> +	return iova_rcache_range();
> +}
> +
>  static const struct dma_map_ops iommu_dma_ops = {
>  	.alloc			= iommu_dma_alloc,
>  	.free			= iommu_dma_free,
> @@ -1462,6 +1467,7 @@ static const struct dma_map_ops iommu_dma_ops = {
>  	.map_resource		= iommu_dma_map_resource,
>  	.unmap_resource		= iommu_dma_unmap_resource,
>  	.get_merge_boundary	= iommu_dma_get_merge_boundary,
> +	.opt_mapping_size	= iommu_dma_opt_mapping_size,
>  };
>  
>  /*
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index db77aa675145..9f00b58d546e 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -26,6 +26,11 @@ static unsigned long iova_rcache_get(struct iova_domain *iovad,
>  static void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad);
>  static void free_iova_rcaches(struct iova_domain *iovad);
>  
> +unsigned long iova_rcache_range(void)
> +{
> +	return PAGE_SIZE << (IOVA_RANGE_CACHE_MAX_SIZE - 1);
> +}
> +
>  static int iova_cpuhp_dead(unsigned int cpu, struct hlist_node *node)
>  {
>  	struct iova_domain *iovad;
> diff --git a/include/linux/iova.h b/include/linux/iova.h
> index 320a70e40233..c6ba6d95d79c 100644
> --- a/include/linux/iova.h
> +++ b/include/linux/iova.h
> @@ -79,6 +79,8 @@ static inline unsigned long iova_pfn(struct iova_domain *iovad, dma_addr_t iova)
>  int iova_cache_get(void);
>  void iova_cache_put(void);
>  
> +unsigned long iova_rcache_range(void);
> +
>  void free_iova(struct iova_domain *iovad, unsigned long pfn);
>  void __free_iova(struct iova_domain *iovad, struct iova *iova);
>  struct iova *alloc_iova(struct iova_domain *iovad, unsigned long size,

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
