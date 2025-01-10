Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36DA24B221
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736536365; cv=none; b=i89tr3VhiOkDh+DGi/Jhyfwysjg/9ccRfPT07j9GU2NA+W2vr7rDNX7eyeUf24/CO6iBVUsd7lLrk13aP7f+Q4VIhuG+eUunUhmB0+nfN+VKSet5Aq/BmdLnSx2tVhgmONYWTt8cxOpR1upjymVuXB36Yj3Ti/87HVoMurmVBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736536365; c=relaxed/simple;
	bh=cFwgrJxoYebslO0bk5I6LLDVEt5Eer1aQ6QhvY69hwI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hC3pqJTad1JLmvdI+wiHP4MuZ60XvFqqK0UyK+JqEXeRXGRKFXMoU2jdmu8DXthL+DN/8MnTMXDrs5n8NdnhKofP7FOKn1rjYUasYXK6whkJIXa4e6mFx0eV554568vikc0xE4REjnsGhy/VrphzQeFpYYjNUoN6u3YoJFk6q+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B1THGBN9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B1THGBN9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21634338cfdso8919105ad.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 11:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736536363; x=1737141163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOGW6WY55Ygwka983QrGkbA0JofKRNeOKbsf6IJQCI4=;
        b=B1THGBN9hMbfz7qj4FoGEb+vGEWDf7GKfvJJuNdtSaS6tUeQyS4OW325nNxgJf12wq
         j5DHnhfsQDZwhk+HLPYWZ1KXw0JXckdNFIvnkspjhF6wfHLoifCYgYevrEWBcdoi1ueX
         C9cuTtwLRZvEOv8Kb6EkK4MFdOfKtRrjnlcIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736536363; x=1737141163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOGW6WY55Ygwka983QrGkbA0JofKRNeOKbsf6IJQCI4=;
        b=sIoOP2tiZqwaWQ6yW8fEjfm7FYAM+uRcms37Mt1ueiuSvyDna2Y+UPWYpokPbMlM1t
         c6AOOz2/gpRzOcag9NPTfnK+nn20oeMz4d5eZICNwZJy8SsPjy9LT49XWLwOyK9kuQKJ
         n+Zul7juiU0D9+pHtDByeIrsUjzjDwzrJ26ljWydix9ALSeJzQP2KrTtsjm75gnEC9e5
         jijffSBnur03tAoKmGR04akOJhTw4htIlZelySfuPAfkdmBtU41J0XXHpXNOUMzE6DIf
         LVLYgxVBRvanGpGDMvggw8IYExrnNNN34aHi0oeSGD22wEDfwfVBo/6QN0TC2qgqnFBc
         91sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbYNqa1jF0u1nHj94jGJog9HO8x5lsupVGZ7yZizk9MXq1qrkd8H52T687hn6/3BVOW4nPV0awzuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo8kMAjR8AfMddL6NU5EOplKL8IXILHjDF1/DaRm6m570SqbEu
	hBpNe+gGKfS5ND9CnnUD4Fke4o3xygk6Q1EGowFXIPx0xryK8uH4f/1rMknefw==
X-Gm-Gg: ASbGncv+GueisruOrVkGNyDbPn4owNgkWtXxa+SYdJ4WDjoWdbXjm83Ig9wynyKnU/d
	MFkjbaGUYV0LKMSU0Cid3ELbILFu2dorTt9WArAz2iuKNJzP7BB1Ry+LoFjuJ/kiwJ6JvV9euva
	E/JdF0Q16lKZyYeCV2HgZ88VKEpw7292t8LrRs7WZpfvbRNzzcJ0VLKwJw1VpxVEfNDAptz2h7N
	Z4i3tBFAWsS5f9cD3cUpGXo06hWiqLhSxxs7DGMkaVKsfyKR4o39MSwHnLNwYisHOGEFNLIqaI3
	ch+vCOoB60ODURF9BWP8Zpf7pEtctNfZFKwM
X-Google-Smtp-Source: AGHT+IEB8b5JS5i0JlQkkHA6V854VottRYlqNwTBPse0VV3Rw8DFa9c2cy9r+/T/g6pkYG+ZSmHMRA==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:a0b6:9872 with SMTP id adf61e73a8af0-1e88d10ac61mr17916427637.11.1736536363098;
        Fri, 10 Jan 2025 11:12:43 -0800 (PST)
Received: from JRM7P7Q02P.dhcp.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a3196da0894sm2762853a12.41.2025.01.10.11.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:12:42 -0800 (PST)
From: Andy Gospodarek <andrew.gospodarek@broadcom.com>
X-Google-Original-From: Andy Gospodarek <gospo@broadcom.com>
Date: Fri, 10 Jan 2025 14:12:35 -0500
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	edumazet@google.com, almasrymina@google.com,
	donald.hunter@gmail.com, corbet@lwn.net, michael.chan@broadcom.com,
	andrew+netdev@lunn.ch, hawk@kernel.org, ilias.apalodimas@linaro.org,
	ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
	dw@davidwei.uk, sdf@fomichev.me, asml.silence@gmail.com,
	brett.creeley@amd.com, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, kory.maincent@bootlin.com,
	maxime.chevallier@bootlin.com, danieller@nvidia.com,
	hengqi@linux.alibaba.com, ecree.xilinx@gmail.com,
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com,
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com,
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org,
	jdamato@fastly.com, aleksander.lobakin@intel.com,
	kaiyuanz@google.com, willemb@google.com, daniel.zahka@gmail.com
Subject: Re: [PATCH net-next v7 06/10] bnxt_en: add support for rx-copybreak
 ethtool command
Message-ID: <Z4FxI2eKvzBvxNIh@JRM7P7Q02P.dhcp.broadcom.net>
References: <20250103150325.926031-1-ap420073@gmail.com>
 <20250103150325.926031-7-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103150325.926031-7-ap420073@gmail.com>

On Fri, Jan 03, 2025 at 03:03:21PM +0000, Taehee Yoo wrote:
> The bnxt_en driver supports rx-copybreak, but it couldn't be set by
> userspace. Only the default value(256) has worked.
> This patch makes the bnxt_en driver support following command.
> `ethtool --set-tunable <devname> rx-copybreak <value> ` and
> `ethtool --get-tunable <devname> rx-copybreak`.
> 
> By this patch, hds_threshol is set to the rx-copybreak value.
> But it will be set by `ethtool -G eth0 hds-thresh N`
> in the next patch.
> 
> Reviewed-by: Brett Creeley <brett.creeley@amd.com>
> Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> Tested-by: Andy Gospodarek <gospo@broadcom.com>

Testing of this also looks good.

> Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> ---
> 
> v7:
>  - return -EBUSY when interface is not running.
> 
> v6:
>  - No changes.
> 
> v5:
>  - Do not set HDS if XDP is attached.
>  - rx_size and pkt_size are always bigger than 256.
> 
> v4:
>  - Remove min rx-copybreak value.
>  - Add Review tag from Brett.
>  - Add Test tag from Stanislav.
> 
> v3:
>  - Update copybreak value after closing nic and before opening nic when
>    the device is running.
> 
> v2:
>  - Define max/vim rx_copybreak value.
> 
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 28 +++++++-----
>  drivers/net/ethernet/broadcom/bnxt/bnxt.h     |  5 ++-
>  .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 44 ++++++++++++++++++-
>  3 files changed, 63 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 46edea75e062..9b5ca1e3d99a 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -81,7 +81,6 @@ MODULE_DESCRIPTION("Broadcom NetXtreme network driver");
>  
>  #define BNXT_RX_OFFSET (NET_SKB_PAD + NET_IP_ALIGN)
>  #define BNXT_RX_DMA_OFFSET NET_SKB_PAD
> -#define BNXT_RX_COPY_THRESH 256
>  
>  #define BNXT_TX_PUSH_THRESH 164
>  
> @@ -1343,13 +1342,13 @@ static struct sk_buff *bnxt_copy_data(struct bnxt_napi *bnapi, u8 *data,
>  	if (!skb)
>  		return NULL;
>  
> -	dma_sync_single_for_cpu(&pdev->dev, mapping, bp->rx_copy_thresh,
> +	dma_sync_single_for_cpu(&pdev->dev, mapping, bp->rx_copybreak,
>  				bp->rx_dir);
>  
>  	memcpy(skb->data - NET_IP_ALIGN, data - NET_IP_ALIGN,
>  	       len + NET_IP_ALIGN);
>  
> -	dma_sync_single_for_device(&pdev->dev, mapping, bp->rx_copy_thresh,
> +	dma_sync_single_for_device(&pdev->dev, mapping, bp->rx_copybreak,
>  				   bp->rx_dir);
>  
>  	skb_put(skb, len);
> @@ -1842,7 +1841,7 @@ static inline struct sk_buff *bnxt_tpa_end(struct bnxt *bp,
>  		return NULL;
>  	}
>  
> -	if (len <= bp->rx_copy_thresh) {
> +	if (len <= bp->rx_copybreak) {
>  		skb = bnxt_copy_skb(bnapi, data_ptr, len, mapping);
>  		if (!skb) {
>  			bnxt_abort_tpa(cpr, idx, agg_bufs);
> @@ -2176,7 +2175,7 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
>  		}
>  	}
>  
> -	if (len <= bp->rx_copy_thresh) {
> +	if (len <= bp->rx_copybreak) {
>  		if (!xdp_active)
>  			skb = bnxt_copy_skb(bnapi, data_ptr, len, dma_addr);
>  		else
> @@ -4601,6 +4600,11 @@ void bnxt_set_tpa_flags(struct bnxt *bp)
>  		bp->flags |= BNXT_FLAG_GRO;
>  }
>  
> +static void bnxt_init_ring_params(struct bnxt *bp)
> +{
> +	bp->rx_copybreak = BNXT_DEFAULT_RX_COPYBREAK;
> +}
> +
>  /* bp->rx_ring_size, bp->tx_ring_size, dev->mtu, BNXT_FLAG_{G|L}RO flags must
>   * be set on entry.
>   */
> @@ -4615,7 +4619,6 @@ void bnxt_set_ring_params(struct bnxt *bp)
>  	rx_space = rx_size + ALIGN(max(NET_SKB_PAD, XDP_PACKET_HEADROOM), 8) +
>  		SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
>  
> -	bp->rx_copy_thresh = BNXT_RX_COPY_THRESH;
>  	ring_size = bp->rx_ring_size;
>  	bp->rx_agg_ring_size = 0;
>  	bp->rx_agg_nr_pages = 0;
> @@ -4660,7 +4663,9 @@ void bnxt_set_ring_params(struct bnxt *bp)
>  				  ALIGN(max(NET_SKB_PAD, XDP_PACKET_HEADROOM), 8) -
>  				  SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
>  		} else {
> -			rx_size = SKB_DATA_ALIGN(BNXT_RX_COPY_THRESH + NET_IP_ALIGN);
> +			rx_size = SKB_DATA_ALIGN(max(BNXT_DEFAULT_RX_COPYBREAK,
> +						     bp->rx_copybreak) +
> +						 NET_IP_ALIGN);
>  			rx_space = rx_size + NET_SKB_PAD +
>  				SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
>  		}
> @@ -6566,16 +6571,14 @@ static int bnxt_hwrm_vnic_set_hds(struct bnxt *bp, struct bnxt_vnic_info *vnic)
>  
>  	req->flags = cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_JUMBO_PLACEMENT);
>  	req->enables = cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_JUMBO_THRESH_VALID);
> +	req->jumbo_thresh = cpu_to_le16(bp->rx_buf_use_size);
>  
> -	if (BNXT_RX_PAGE_MODE(bp)) {
> -		req->jumbo_thresh = cpu_to_le16(bp->rx_buf_use_size);
> -	} else {
> +	if (!BNXT_RX_PAGE_MODE(bp) && (bp->flags & BNXT_FLAG_AGG_RINGS)) {
>  		req->flags |= cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_HDS_IPV4 |
>  					  VNIC_PLCMODES_CFG_REQ_FLAGS_HDS_IPV6);
>  		req->enables |=
>  			cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_HDS_THRESHOLD_VALID);
> -		req->jumbo_thresh = cpu_to_le16(bp->rx_copy_thresh);
> -		req->hds_threshold = cpu_to_le16(bp->rx_copy_thresh);
> +		req->hds_threshold = cpu_to_le16(bp->rx_copybreak);
>  	}
>  	req->vnic_id = cpu_to_le32(vnic->fw_vnic_id);
>  	return hwrm_req_send(bp, req);
> @@ -16233,6 +16236,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	bnxt_init_l2_fltr_tbl(bp);
>  	bnxt_set_rx_skb_mode(bp, false);
>  	bnxt_set_tpa_flags(bp);
> +	bnxt_init_ring_params(bp);
>  	bnxt_set_ring_params(bp);
>  	bnxt_rdma_aux_device_init(bp);
>  	rc = bnxt_set_dflt_rings(bp, true);
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> index 094c9e95b463..7edb92ce5976 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> @@ -34,6 +34,9 @@
>  #include <linux/firmware/broadcom/tee_bnxt_fw.h>
>  #endif
>  
> +#define BNXT_DEFAULT_RX_COPYBREAK 256
> +#define BNXT_MAX_RX_COPYBREAK 1024
> +
>  extern struct list_head bnxt_block_cb_list;
>  
>  struct page_pool;
> @@ -2347,7 +2350,7 @@ struct bnxt {
>  	enum dma_data_direction	rx_dir;
>  	u32			rx_ring_size;
>  	u32			rx_agg_ring_size;
> -	u32			rx_copy_thresh;
> +	u32			rx_copybreak;
>  	u32			rx_ring_mask;
>  	u32			rx_agg_ring_mask;
>  	int			rx_nr_pages;
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> index 75a59dd72bce..e9e63d95df17 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> @@ -4328,6 +4328,45 @@ static int bnxt_get_eee(struct net_device *dev, struct ethtool_keee *edata)
>  	return 0;
>  }
>  
> +static int bnxt_set_tunable(struct net_device *dev,
> +			    const struct ethtool_tunable *tuna,
> +			    const void *data)
> +{
> +	struct bnxt *bp = netdev_priv(dev);
> +	u32 rx_copybreak;
> +
> +	switch (tuna->id) {
> +	case ETHTOOL_RX_COPYBREAK:
> +		rx_copybreak = *(u32 *)data;
> +		if (rx_copybreak > BNXT_MAX_RX_COPYBREAK)
> +			return -ERANGE;
> +		if (rx_copybreak != bp->rx_copybreak) {
> +			if (netif_running(dev))
> +				return -EBUSY;
> +			bp->rx_copybreak = rx_copybreak;
> +		}
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int bnxt_get_tunable(struct net_device *dev,
> +			    const struct ethtool_tunable *tuna, void *data)
> +{
> +	struct bnxt *bp = netdev_priv(dev);
> +
> +	switch (tuna->id) {
> +	case ETHTOOL_RX_COPYBREAK:
> +		*(u32 *)data = bp->rx_copybreak;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
>  static int bnxt_read_sfp_module_eeprom_info(struct bnxt *bp, u16 i2c_addr,
>  					    u16 page_number, u8 bank,
>  					    u16 start_addr, u16 data_length,
> @@ -4790,7 +4829,8 @@ static int bnxt_run_loopback(struct bnxt *bp)
>  	cpr = &rxr->bnapi->cp_ring;
>  	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS)
>  		cpr = rxr->rx_cpr;
> -	pkt_size = min(bp->dev->mtu + ETH_HLEN, bp->rx_copy_thresh);
> +	pkt_size = min(bp->dev->mtu + ETH_HLEN, max(BNXT_DEFAULT_RX_COPYBREAK,
> +						    bp->rx_copybreak));
>  	skb = netdev_alloc_skb(bp->dev, pkt_size);
>  	if (!skb)
>  		return -ENOMEM;
> @@ -5372,6 +5412,8 @@ const struct ethtool_ops bnxt_ethtool_ops = {
>  	.get_link_ext_stats	= bnxt_get_link_ext_stats,
>  	.get_eee		= bnxt_get_eee,
>  	.set_eee		= bnxt_set_eee,
> +	.get_tunable		= bnxt_get_tunable,
> +	.set_tunable		= bnxt_set_tunable,
>  	.get_module_info	= bnxt_get_module_info,
>  	.get_module_eeprom	= bnxt_get_module_eeprom,
>  	.get_module_eeprom_by_page = bnxt_get_module_eeprom_by_page,
> -- 
> 2.34.1
> 
