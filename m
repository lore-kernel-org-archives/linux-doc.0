Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B233C1B0F0E
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 22:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731624900; cv=none; b=u17qgzwXQXE2ow3Cj661uK4kmqtMsNN0v3wTLqZh77DqPDa93CCmseyDsz/Dfd/SSHwRVBUMI6sLq+NwsAfyqU+NH9b+6x5WBGgg4YVTlJV37Zfgk4X2qGZAIL+CbQK9e36+g7Ox1Tm7AsdQeYP/SucTmRt9yBH93OCetlAdqKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731624900; c=relaxed/simple;
	bh=pUIYfIPMV+rqYYHYYrQ9QqFRB4FPvK6acfY0tYp/RLY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMkHvRqYqS3I5X0R0SmUrMcF8NFTdXuEhs7PMNmJe2HpppBQpHglam59sb04cRjMREFTU4tr98iwkZsWlFyCvSIg+QJpUK/nvylJGZHhUS2n/nt9IePUCGweZvWrXTmDxxQIegzuHktqpjm++HpFXUYyJXwWGkAxzOK/iTUI5k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ou86nAxk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ou86nAxk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-211c1bd70f6so10539575ad.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 14:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1731624897; x=1732229697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bj0r1DowSE7Dy2cC6wyg43DGxO4wrZbLso3g2VmRfyg=;
        b=Ou86nAxkhZrSY4SzBEQt3VJtAJQq8TPZ6P/yOguLKaqA4duyU7HLrJxbzRs0vAiPLd
         pwU/WmQDRutxGqMihQngB8bcgTeCPRoKXO0CV8heaq5FYBsWoH9Mbpci4mY7dFdqYlkl
         ZYB2jQjdCJSMfncvxytUVbXAHxVCE158dEvTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731624897; x=1732229697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj0r1DowSE7Dy2cC6wyg43DGxO4wrZbLso3g2VmRfyg=;
        b=PmhCm5gC5GqEMTB0xnNFsi2UUfDnsHUD64hEJG20VoE1X8VbWDOtW/PrvaG5TPcnvg
         xgtaQvEwTKSK5YfJiIciRmn+7kGF2Y8TV8OYof4YT+DeoN6LheedPzp05+jV66BhkbQF
         5bQKuVBeGzKft47UN4CJd/LTpW95/OBU28LphrdO9HO8Cu8sUXZFCl4q6XZ2crn/Nmtz
         NlkokETqwJDLXyI1GftD9Fe3PTuxLhQAtfJXxsH5X7FSPIblbNr6IO9jIjTIbl+1CM2B
         6CVhp1qe7AJvxfD3Zo1yUHY66Pw+yFzNgfVslQBVBXXDZ0DoDe/3N8iTctZfmKC30Qbh
         o1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVQLazVBZIeTNDLupOhHPTBxMXtHmU9pg4wNAjkeuS3JAH3c2RNDEi2MzI9CjElrGWhdniaoTgM6tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFQHz1fH14/BTwyHgM6mjaRRxfbqbZxR/o3j1SCNmawyZUIyr
	3hi8+F4odAmgAsSYnjtRHkB6mQ6GGxPAvVLupNo4q2dgQNhEeUoE0X2+ppillw==
X-Google-Smtp-Source: AGHT+IHnilQgWQPJVeY+qrmOKlLYBqj0hv71H3lzzkLlEXl3i1kWtnei3zIHhlt9toyWjhUR4Kl9Rg==
X-Received: by 2002:a17:902:ce86:b0:20c:cd01:79ae with SMTP id d9443c01a7336-211c0fc12a4mr76195575ad.24.1731624896917;
        Thu, 14 Nov 2024 14:54:56 -0800 (PST)
Received: from JRM7P7Q02P ([136.56.190.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771c0dfcsm173521b3a.106.2024.11.14.14.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 14:54:56 -0800 (PST)
From: Andy Gospodarek <andrew.gospodarek@broadcom.com>
X-Google-Original-From: Andy Gospodarek <gospo@broadcom.com>
Date: Thu, 14 Nov 2024 17:54:49 -0500
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
Subject: Re: [PATCH net-next v5 5/7] bnxt_en: add support for
 header-data-split-thresh ethtool command
Message-ID: <ZzZ_ub26phtVNmnK@JRM7P7Q02P>
References: <20241113173222.372128-1-ap420073@gmail.com>
 <20241113173222.372128-6-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113173222.372128-6-ap420073@gmail.com>

On Wed, Nov 13, 2024 at 05:32:19PM +0000, Taehee Yoo wrote:
> The bnxt_en driver has configured the hds_threshold value automatically
> when TPA is enabled based on the rx-copybreak default value.
> Now the header-data-split-thresh ethtool command is added, so it adds an
> implementation of header-data-split-thresh option.
> 
> Configuration of the header-data-split-thresh is allowed only when
> the header-data-split is enabled. The default value of
> header-data-split-thresh is 256, which is the default value of
> rx-copybreak, which used to be the hds_thresh value.
> 
>    # Example:
>    # ethtool -G enp14s0f0np0 tcp-data-split on header-data-split-thresh 256
>    # ethtool -g enp14s0f0np0
>    Ring parameters for enp14s0f0np0:
>    Pre-set maximums:
>    ...
>    Header data split thresh:  256
>    Current hardware settings:
>    ...
>    TCP data split:         on
>    Header data split thresh:  256
> 
> Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Taehee Yoo <ap420073@gmail.com>

Tested-by: Andy Gospodarek <gospo@broadcom.com>

> ---
> 
> v5:
>  - No changes.
> 
> v4:
>  - Reduce hole in struct bnxt.
>  - Add ETHTOOL_RING_USE_HDS_THRS to indicate bnxt_en driver support
>    header-data-split-thresh option.
>  - Add Test tag from Stanislav.
> 
> v3:
>  - Drop validation logic tcp-data-split and tcp-data-split-thresh.
> 
> v2:
>  - Patch added.
> 
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c         | 3 ++-
>  drivers/net/ethernet/broadcom/bnxt/bnxt.h         | 2 ++
>  drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 7 ++++++-
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 608bcca71676..27d6bac3a69a 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -4454,6 +4454,7 @@ void bnxt_set_tpa_flags(struct bnxt *bp)
>  static void bnxt_init_ring_params(struct bnxt *bp)
>  {
>  	bp->rx_copybreak = BNXT_DEFAULT_RX_COPYBREAK;
> +	bp->hds_threshold = BNXT_DEFAULT_RX_COPYBREAK;
>  }
>  
>  /* bp->rx_ring_size, bp->tx_ring_size, dev->mtu, BNXT_FLAG_{G|L}RO flags must
> @@ -6429,7 +6430,7 @@ static int bnxt_hwrm_vnic_set_hds(struct bnxt *bp, struct bnxt_vnic_info *vnic)
>  					  VNIC_PLCMODES_CFG_REQ_FLAGS_HDS_IPV6);
>  		req->enables |=
>  			cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_HDS_THRESHOLD_VALID);
> -		req->hds_threshold = cpu_to_le16(bp->rx_copybreak);
> +		req->hds_threshold = cpu_to_le16(bp->hds_threshold);
>  	}
>  	req->vnic_id = cpu_to_le32(vnic->fw_vnic_id);
>  	return hwrm_req_send(bp, req);
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> index 3a7d2f3ebb2a..058db26fb255 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> @@ -2362,6 +2362,8 @@ struct bnxt {
>  	u8			q_ids[BNXT_MAX_QUEUE];
>  	u8			max_q;
>  	u8			num_tc;
> +#define BNXT_HDS_THRESHOLD_MAX	256
> +	u16			hds_threshold;
>  
>  	unsigned int		current_interval;
>  #define BNXT_TIMER_INTERVAL	HZ
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> index b0054eef389b..a51a4cedecb9 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> @@ -833,6 +833,9 @@ static void bnxt_get_ringparam(struct net_device *dev,
>  	ering->rx_pending = bp->rx_ring_size;
>  	ering->rx_jumbo_pending = bp->rx_agg_ring_size;
>  	ering->tx_pending = bp->tx_ring_size;
> +
> +	kernel_ering->hds_thresh = bp->hds_threshold;
> +	kernel_ering->hds_thresh_max = BNXT_HDS_THRESHOLD_MAX;
>  }
>  
>  static int bnxt_set_ringparam(struct net_device *dev,
> @@ -868,6 +871,7 @@ static int bnxt_set_ringparam(struct net_device *dev,
>  	else if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_UNKNOWN)
>  		bp->flags &= ~BNXT_FLAG_HDS;
>  
> +	bp->hds_threshold = (u16)kernel_ering->hds_thresh;
>  	bp->rx_ring_size = ering->rx_pending;
>  	bp->tx_ring_size = ering->tx_pending;
>  	bnxt_set_ring_params(bp);
> @@ -5363,7 +5367,8 @@ const struct ethtool_ops bnxt_ethtool_ops = {
>  				     ETHTOOL_COALESCE_STATS_BLOCK_USECS |
>  				     ETHTOOL_COALESCE_USE_ADAPTIVE_RX |
>  				     ETHTOOL_COALESCE_USE_CQE,
> -	.supported_ring_params	= ETHTOOL_RING_USE_TCP_DATA_SPLIT,
> +	.supported_ring_params	= ETHTOOL_RING_USE_TCP_DATA_SPLIT |
> +				  ETHTOOL_RING_USE_HDS_THRS,
>  	.get_link_ksettings	= bnxt_get_link_ksettings,
>  	.set_link_ksettings	= bnxt_set_link_ksettings,
>  	.get_fec_stats		= bnxt_get_fec_stats,
> -- 
> 2.34.1
> 
