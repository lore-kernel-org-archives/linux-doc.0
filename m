Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FA1207E15
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736536637; cv=none; b=Mk3gr4+Zg2+EQ/TJLowu6ft95v7EjPOnLBIXz3ExLD0tunZCgtygzMpxL4AH1XbGPcJlPkLIssO1PQXHyo87+K15m/ZbtoQ0G1n3fE5cYgFeBI12S14/KwhYgjuKZj3VgyNJK+m2pXaqryTTFECNoSymJcRjDFLjNwQy29eB1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736536637; c=relaxed/simple;
	bh=aE+zc44WgMUEb3BZG0PPBth6gH8kPpQZ5VJTKtnQm9s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCAanhFmmAMyrpEWBnBztJb8u+AsCmahGSq8TwHNGYq2O83D9bGQOcL4mPVJ1xM5QMitRhdrSljx5tC9/KryYnu9CtC2dil4VAL5nf+0qtCFT+XCs7xYf2p8FxR3+0iBQdoaBe2r7SjEnlJBnYLfTN6EPTRTOC655nUSRYCagOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ic7dkLUO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ic7dkLUO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21669fd5c7cso41685555ad.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 11:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736536635; x=1737141435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZXoiQF0TiqGfrdQJmeL40/Rs1IpE7wT7WVr7Pci6Rw=;
        b=Ic7dkLUOKMKnieQEQ6mW3yrpQL6zqV7xZwlMEdzxEz1q95RKsngjnUmkIwEK/SaTlj
         V0m2oO8VsPUdVVhqzS/uGyqlL94r9g7KQpny9PP+9xPJ3JJM8j7KC28HJPh3YqItoTpv
         DgQJHBpbqNG0szNfYKAjonmMGIKwNaHucMJzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736536635; x=1737141435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZXoiQF0TiqGfrdQJmeL40/Rs1IpE7wT7WVr7Pci6Rw=;
        b=bcjyfnHHh2meLtciXHzc9oeD4ZGZIhrkyXDIX3tCgr2lTiFms8tMJ0SotqBt2/SnJi
         6elzR39wCaL3tenkRky9AIeaKo2x0LH6cU/bOnLiJi22MsvuTry7Y3w7G/cVKhZPC692
         qqyACTbw23FBS3zxbS8hLSWTglLZeQYhoVzRB+jcuCzIFrbyI1vSFIZbcGMptQs6e6yU
         TwQpgh6RaTG2KJjXJlPx+/ObaFI0b6Ebljlt17h3OsYs7XrajAPy4w2/nIx7v9JtzBMU
         AwYjKlqEnrPRkSklQqO2WX6Pjk6W6SYQYW+D5EBBdcF8dij43vefjBc/CrOxA5hbktn/
         z6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUjMJ/heoUXx9LD52bN76i83jO57rvuSGv43z8p2jITdyep7304fACirzFmEG/tQAHzIob+W1GsgBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPm9t9X25yS8oagagMgGRg08vQzC9cZwv16Yc5fR1K4WxBPBsH
	wPzwuVmry6Y1oRlcyGj247XxxmK7UR0jcILp28UV5q6SqNPIMmnjscWMP4SfLg==
X-Gm-Gg: ASbGnctfEzE5/8Suq7fsHrpW4+WIz4mWHCHkB+mxTzQAhAozB5r6KaVeCiTFuogy+n4
	Zw0mVRfPgytetL8MUCGo04igpzbKrig+TkfenzZFCclMFx4LbxlIy9PVvGv7maKTLCubc+l3Xli
	UP8bASSUAsqGgRohhyS5MsxzKTA1txA1vqopJBFMscT2/ycJ/SovRYmShb9D6vFiMQ5Egv28E28
	HhSJ2ODrG8r6nRMN8BOD5Jqu5UDfdZf/PoFgoZvESw8YYK5O4yreRQXHZ3PJQtnvZ03R5O/MHnJ
	a/BloQzDewEhDArQ6WLFbKzBGdN+E4J49Xow
X-Google-Smtp-Source: AGHT+IFgXTrsnlIjfWGo5TfJl0ZFfXzP9/CGZzVVOwMfeFI9TgSEvE45iEAydw7xMWht/Njg967NRQ==
X-Received: by 2002:a17:902:d48b:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-21a83f5510emr153820315ad.18.1736536635360;
        Fri, 10 Jan 2025 11:17:15 -0800 (PST)
Received: from JRM7P7Q02P.dhcp.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2618d3sm16890235ad.255.2025.01.10.11.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:17:14 -0800 (PST)
From: Andy Gospodarek <andrew.gospodarek@broadcom.com>
X-Google-Original-From: Andy Gospodarek <gospo@broadcom.com>
Date: Fri, 10 Jan 2025 14:17:08 -0500
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
Subject: Re: [PATCH net-next v7 07/10] bnxt_en: add support for
 tcp-data-split ethtool command
Message-ID: <Z4FyNCgMEs2HMVqz@JRM7P7Q02P.dhcp.broadcom.net>
References: <20250103150325.926031-1-ap420073@gmail.com>
 <20250103150325.926031-8-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103150325.926031-8-ap420073@gmail.com>

On Fri, Jan 03, 2025 at 03:03:22PM +0000, Taehee Yoo wrote:
> NICs that uses bnxt_en driver supports tcp-data-split feature by the
> name of HDS(header-data-split).
> But there is no implementation for the HDS to enable by ethtool.
> Only getting the current HDS status is implemented and The HDS is just
> automatically enabled only when either LRO, HW-GRO, or JUMBO is enabled.
> The hds_threshold follows rx-copybreak value. and it was unchangeable.
> 
> This implements `ethtool -G <interface name> tcp-data-split <value>`
> command option.
> The value can be <on> and <auto>.
> The value is <auto> and one of LRO/GRO/JUMBO is enabled, HDS is
> automatically enabled and all LRO/GRO/JUMBO are disabled, HDS is
> automatically disabled.
> 
> HDS feature relies on the aggregation ring.
> So, if HDS is enabled, the bnxt_en driver initializes the aggregation ring.
> This is the reason why BNXT_FLAG_AGG_RINGS contains HDS condition.
> 
> Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> Tested-by: Andy Gospodarek <gospo@broadcom.com>

This one is also still looks good. 

> Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> ---
> 
> v7:
>  - Remove hds unrelated changes.
>  - Return -EINVAL instead of -EOPNOTSUPP;
> 
> v6:
>  - Disallow to attach XDP when HDS is in use.
>  - Add Test tag from Andy.
> 
> v5:
>  - Do not set HDS if XDP is attached.
>  - Enable tcp-data-split only when tcp_data_split_mod is true.
> 
> v4:
>  - Do not support disable tcp-data-split.
>  - Add Test tag from Stanislav.
> 
> v3:
>  - No changes.
> 
> v2:
>  - Do not set hds_threshold to 0.
> 
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  2 +-
>  drivers/net/ethernet/broadcom/bnxt/bnxt.h     |  5 +++--
>  .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 20 +++++++++++++++++++
>  drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c |  4 ++++
>  4 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 9b5ca1e3d99a..7198d05cd27b 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -4623,7 +4623,7 @@ void bnxt_set_ring_params(struct bnxt *bp)
>  	bp->rx_agg_ring_size = 0;
>  	bp->rx_agg_nr_pages = 0;
>  
> -	if (bp->flags & BNXT_FLAG_TPA)
> +	if (bp->flags & BNXT_FLAG_TPA || bp->flags & BNXT_FLAG_HDS)
>  		agg_factor = min_t(u32, 4, 65536 / BNXT_RX_PAGE_SIZE);
>  
>  	bp->flags &= ~BNXT_FLAG_JUMBO;
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> index 7edb92ce5976..7dc06e07bae2 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> @@ -2244,8 +2244,6 @@ struct bnxt {
>  	#define BNXT_FLAG_TPA		(BNXT_FLAG_LRO | BNXT_FLAG_GRO)
>  	#define BNXT_FLAG_JUMBO		0x10
>  	#define BNXT_FLAG_STRIP_VLAN	0x20
> -	#define BNXT_FLAG_AGG_RINGS	(BNXT_FLAG_JUMBO | BNXT_FLAG_GRO | \
> -					 BNXT_FLAG_LRO)
>  	#define BNXT_FLAG_RFS		0x100
>  	#define BNXT_FLAG_SHARED_RINGS	0x200
>  	#define BNXT_FLAG_PORT_STATS	0x400
> @@ -2266,6 +2264,9 @@ struct bnxt {
>  	#define BNXT_FLAG_ROCE_MIRROR_CAP	0x4000000
>  	#define BNXT_FLAG_TX_COAL_CMPL	0x8000000
>  	#define BNXT_FLAG_PORT_STATS_EXT	0x10000000
> +	#define BNXT_FLAG_HDS		0x20000000
> +	#define BNXT_FLAG_AGG_RINGS	(BNXT_FLAG_JUMBO | BNXT_FLAG_GRO | \
> +					 BNXT_FLAG_LRO | BNXT_FLAG_HDS)
>  
>  	#define BNXT_FLAG_ALL_CONFIG_FEATS (BNXT_FLAG_TPA |		\
>  					    BNXT_FLAG_RFS |		\
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> index e9e63d95df17..413007190f50 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> @@ -840,16 +840,35 @@ static int bnxt_set_ringparam(struct net_device *dev,
>  			      struct kernel_ethtool_ringparam *kernel_ering,
>  			      struct netlink_ext_ack *extack)
>  {
> +	u8 tcp_data_split = kernel_ering->tcp_data_split;
>  	struct bnxt *bp = netdev_priv(dev);
> +	u8 hds_config_mod;
>  
>  	if ((ering->rx_pending > BNXT_MAX_RX_DESC_CNT) ||
>  	    (ering->tx_pending > BNXT_MAX_TX_DESC_CNT) ||
>  	    (ering->tx_pending < BNXT_MIN_TX_DESC_CNT))
>  		return -EINVAL;
>  
> +	hds_config_mod = tcp_data_split != dev->ethtool->hds_config;
> +	if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_DISABLED && hds_config_mod)
> +		return -EINVAL;
> +
> +	if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_ENABLED &&
> +	    hds_config_mod && BNXT_RX_PAGE_MODE(bp)) {
> +		NL_SET_ERR_MSG_MOD(extack, "tcp-data-split is disallowed when XDP is attached");
> +		return -EINVAL;
> +	}
> +
>  	if (netif_running(dev))
>  		bnxt_close_nic(bp, false, false);
>  
> +	if (hds_config_mod) {
> +		if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_ENABLED)
> +			bp->flags |= BNXT_FLAG_HDS;
> +		else if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_UNKNOWN)
> +			bp->flags &= ~BNXT_FLAG_HDS;
> +	}
> +
>  	bp->rx_ring_size = ering->rx_pending;
>  	bp->tx_ring_size = ering->tx_pending;
>  	bnxt_set_ring_params(bp);
> @@ -5371,6 +5390,7 @@ const struct ethtool_ops bnxt_ethtool_ops = {
>  				     ETHTOOL_COALESCE_STATS_BLOCK_USECS |
>  				     ETHTOOL_COALESCE_USE_ADAPTIVE_RX |
>  				     ETHTOOL_COALESCE_USE_CQE,
> +	.supported_ring_params	= ETHTOOL_RING_USE_TCP_DATA_SPLIT,
>  	.get_link_ksettings	= bnxt_get_link_ksettings,
>  	.set_link_ksettings	= bnxt_set_link_ksettings,
>  	.get_fec_stats		= bnxt_get_fec_stats,
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
> index f88b641533fc..1bfff7f29310 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
> @@ -395,6 +395,10 @@ static int bnxt_xdp_set(struct bnxt *bp, struct bpf_prog *prog)
>  			    bp->dev->mtu, BNXT_MAX_PAGE_MODE_MTU);
>  		return -EOPNOTSUPP;
>  	}
> +	if (prog && bp->flags & BNXT_FLAG_HDS) {
> +		netdev_warn(dev, "XDP is disallowed when HDS is enabled.\n");
> +		return -EOPNOTSUPP;
> +	}
>  	if (!(bp->flags & BNXT_FLAG_SHARED_RINGS)) {
>  		netdev_warn(dev, "ethtool rx/tx channels must be combined to support XDP.\n");
>  		return -EOPNOTSUPP;
> -- 
> 2.34.1
> 
