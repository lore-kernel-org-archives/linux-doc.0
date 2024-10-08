Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DACB20B20
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 02:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728355517; cv=none; b=fOMLUVgBtYvRahlqfkVfNs9Nm1O9YXgw5YO6l6PII49FmO/nxU7Ner7oXvwmi7iv/kjzInwhrmQWTmrRN8fBdoDF5mkjKjRD0Um4tj7psxZjg6xKYrH57HntfXETMm9/2AESQGPCSBYQM5TkXn+clXLvK+oTL2If4ep8W8kUokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728355517; c=relaxed/simple;
	bh=P+sGKUsU1JXC+KOeOIzzN8hFIZjjLWZPTzMMqPFhvYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFF7xKWgiAZDSupQa7gIftvbUovuASaU0mNfjkH1LjzPyoCAB5VSO4YjHjVrzpeApP/x6InvrZyxD9fgeUdYnMYR9FNcBVdL9GHV7rvsjLpBUrPaoTR6TH0lrHHqBVo6yvVDt6p8myB8pvu0obvSKHSqXDPZGe2aRYXs6eamdbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=a3G2Ye5D; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="a3G2Ye5D"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7e9ad969a4fso3118623a12.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 19:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1728355514; x=1728960314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFcATZCMsPC6Fp0EMf5HkgHaM5OAeeYAZy65k0Lqyj4=;
        b=a3G2Ye5D4ioIkaVcPeOjczECoDCBsupxog7MXz72fzX6q/dRB4rV7hDnxeWbvjQTUw
         TTaWhgZrKK3ZrMT9IGHQ0yfW/zHZUaJYtRo8IZc/7Hx51yJAuddAFEfNXj8jHv0QPqms
         O8t6hvofKI3WhJb+B0ZfkPHfWNGjheLoAefzyv3ulf1i45fXhFQSSeoeLzqVvuj5JdE+
         NEEyE+81dOpr5UvHtppq+SMRH8d8ahvR0xW+LfiMfVyozi/JQF5vO8O1/qAnDEyYoiqo
         NXDZco20aYeKNFvCrAd3fW7EHGypYTJ8gILdn7nqN76fJ9ogpfZ63ZX4jO/ukuXhuACI
         wrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728355514; x=1728960314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFcATZCMsPC6Fp0EMf5HkgHaM5OAeeYAZy65k0Lqyj4=;
        b=N8QD5pNkLJeolHce/9/ARIhlGDN4SZrbzxM+LzLobTctui6nsfhfeUtL8wkuM+elmd
         UK58vghW+uv0tk84Q+pPihfKFKPIjhqKQ7Now829jKgck3UW5UhnzfRSvMkEpDroozuB
         lI1c8AOFGB5GjCMSMeN7JA9tNQjd7LSaRfXhZ/CnrtUejz8TvzIMY/AOxM/rCmvOhmnZ
         0DhZm5ireKU9tbRBswHlN/xvJnDAJFK5j1lXK6vtrH3hF0Z84o30DipnjAxm2X19bjk8
         3i8LebPkvpznJhwBvXNE5bJ3KagnYl1gfsu3QnLZAfJnvTfEt0WVHcPz60sOuTW0LOui
         9Ieg==
X-Forwarded-Encrypted: i=1; AJvYcCVPPNOXLC0d2+66LV4H/liQTc0sl1AiCmPflCTI5dPY0KosgRGoyoCqA8pDiQ0hSWxfDLRHJCqdd04=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAa+4F66Vt+TmTxhi0y9M1mDbWX02NnK14Pb1TEDo7q3HfDeO4
	40Xsx1gjz7Ux4g94Hw+8VbzXkzmTX9cEA7skgg57+tZcNXOwN6k8L4CK6M9IepxhtPB3MhWpnr5
	YoZiboQ==
X-Google-Smtp-Source: AGHT+IFBaAmFOMV0Au5T1pkAH7uKwY2yTi7LwpZ08FbejIHOE4VsjGu/R8d5qu42NNHLgabBbU2YvQ==
X-Received: by 2002:a05:6a21:6e4b:b0:1cf:31b6:18c6 with SMTP id adf61e73a8af0-1d6dfae30eemr21767902637.46.1728355513916;
        Mon, 07 Oct 2024 19:45:13 -0700 (PDT)
Received: from [192.168.1.24] (174-21-189-109.tukw.qwest.net. [174.21.189.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7d4a0sm5110330b3a.212.2024.10.07.19.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 19:45:13 -0700 (PDT)
Message-ID: <35c505ee-b44d-4817-ab68-c4f1f768b242@davidwei.uk>
Date: Mon, 7 Oct 2024 19:45:12 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 7/7] bnxt_en: add support for device memory
 tcp
Content-Language: en-GB
To: Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@google.com, almasrymina@google.com,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, donald.hunter@gmail.com,
 corbet@lwn.net, michael.chan@broadcom.com
Cc: kory.maincent@bootlin.com, andrew@lunn.ch, maxime.chevallier@bootlin.com,
 danieller@nvidia.com, hengqi@linux.alibaba.com, ecree.xilinx@gmail.com,
 przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com,
 paul.greenwalt@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com,
 asml.silence@gmail.com, kaiyuanz@google.com, willemb@google.com,
 aleksander.lobakin@intel.com, sridhar.samudrala@intel.com, bcreeley@amd.com
References: <20241003160620.1521626-1-ap420073@gmail.com>
 <20241003160620.1521626-8-ap420073@gmail.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20241003160620.1521626-8-ap420073@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-10-03 09:06, Taehee Yoo wrote:
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 872b15842b11..64e07d247f97 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -55,6 +55,7 @@
>  #include <net/page_pool/helpers.h>
>  #include <linux/align.h>
>  #include <net/netdev_queues.h>
> +#include <net/netdev_rx_queue.h>
>  
>  #include "bnxt_hsi.h"
>  #include "bnxt.h"
> @@ -863,6 +864,22 @@ static void bnxt_tx_int(struct bnxt *bp, struct bnxt_napi *bnapi, int budget)
>  		bnapi->events &= ~BNXT_TX_CMP_EVENT;
>  }
>  
> +static netmem_ref __bnxt_alloc_rx_netmem(struct bnxt *bp, dma_addr_t *mapping,
> +					 struct bnxt_rx_ring_info *rxr,
> +					 unsigned int *offset,
> +					 gfp_t gfp)

gfp is unused

> +{
> +	netmem_ref netmem;
> +
> +	netmem = page_pool_alloc_netmem(rxr->page_pool, GFP_ATOMIC);
> +	if (!netmem)
> +		return 0;
> +	*offset = 0;
> +
> +	*mapping = page_pool_get_dma_addr_netmem(netmem) + *offset;

offset is always 0

> +	return netmem;
> +}
> +
>  static struct page *__bnxt_alloc_rx_page(struct bnxt *bp, dma_addr_t *mapping,
>  					 struct bnxt_rx_ring_info *rxr,
>  					 unsigned int *offset,

[...]

> @@ -1192,6 +1209,7 @@ static struct sk_buff *bnxt_rx_skb(struct bnxt *bp,
>  
>  static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
>  			       struct bnxt_cp_ring_info *cpr,
> +			       struct sk_buff *skb,
>  			       struct skb_shared_info *shinfo,
>  			       u16 idx, u32 agg_bufs, bool tpa,
>  			       struct xdp_buff *xdp)
> @@ -1211,7 +1229,7 @@ static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
>  		u16 cons, frag_len;
>  		struct rx_agg_cmp *agg;
>  		struct bnxt_sw_rx_agg_bd *cons_rx_buf;
> -		struct page *page;
> +		netmem_ref netmem;
>  		dma_addr_t mapping;
>  
>  		if (p5_tpa)
> @@ -1223,9 +1241,15 @@ static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
>  			    RX_AGG_CMP_LEN) >> RX_AGG_CMP_LEN_SHIFT;
>  
>  		cons_rx_buf = &rxr->rx_agg_ring[cons];
> -		skb_frag_fill_page_desc(frag, cons_rx_buf->page,
> -					cons_rx_buf->offset, frag_len);
> -		shinfo->nr_frags = i + 1;
> +		if (skb) {
> +			skb_add_rx_frag_netmem(skb, i, cons_rx_buf->netmem,
> +					       cons_rx_buf->offset, frag_len,
> +					       BNXT_RX_PAGE_SIZE);
> +		} else {
> +			skb_frag_fill_page_desc(frag, netmem_to_page(cons_rx_buf->netmem),
> +						cons_rx_buf->offset, frag_len);
> +			shinfo->nr_frags = i + 1;
> +		}

I feel like this function needs a refactor at some point to split out
the skb and xdp paths.

>  		__clear_bit(cons, rxr->rx_agg_bmap);
>  
>  		/* It is possible for bnxt_alloc_rx_page() to allocate

[...]

> @@ -3608,9 +3629,11 @@ static void bnxt_free_rx_rings(struct bnxt *bp)
>  
>  static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
>  				   struct bnxt_rx_ring_info *rxr,
> +				   int queue_idx,

To save a parameter, the index is available already in rxr->bnapi->index

>  				   int numa_node)
>  {
>  	struct page_pool_params pp = { 0 };
> +	struct netdev_rx_queue *rxq;
>  
>  	pp.pool_size = bp->rx_agg_ring_size;
>  	if (BNXT_RX_PAGE_MODE(bp))
> @@ -3621,8 +3644,15 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
>  	pp.dev = &bp->pdev->dev;
>  	pp.dma_dir = bp->rx_dir;
>  	pp.max_len = PAGE_SIZE;
> -	pp.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
> +	pp.order = 0;
> +
> +	rxq = __netif_get_rx_queue(bp->dev, queue_idx);
> +	if (rxq->mp_params.mp_priv)
> +		pp.flags = PP_FLAG_DMA_MAP | PP_FLAG_ALLOW_UNREADABLE_NETMEM;
> +	else
> +		pp.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
>  
> +	pp.queue_idx = queue_idx;
>  	rxr->page_pool = page_pool_create(&pp);
>  	if (IS_ERR(rxr->page_pool)) {
>  		int err = PTR_ERR(rxr->page_pool);
> @@ -3655,7 +3685,7 @@ static int bnxt_alloc_rx_rings(struct bnxt *bp)
>  		cpu_node = cpu_to_node(cpu);
>  		netdev_dbg(bp->dev, "Allocating page pool for rx_ring[%d] on numa_node: %d\n",
>  			   i, cpu_node);
> -		rc = bnxt_alloc_rx_page_pool(bp, rxr, cpu_node);
> +		rc = bnxt_alloc_rx_page_pool(bp, rxr, i, cpu_node);
>  		if (rc)
>  			return rc;
>  
