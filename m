Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8531478E5D
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122867; cv=none; b=m71tZ7K8ZO1USXPZMFM9JhWybx2h99gcPmZuI6DDneXaGqJg2OPptWlUqU7ugI4/vsXGJI7Or0kTaZvls1nUjqjYMzMnjrKA/VVjnZOfkxfmFg4m31eWB6hiQAy/36gqdJagPx+VwQ5Ao8Gq5K2IPYZG1zXPf/bsxh2MaDe0FkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122867; c=relaxed/simple;
	bh=54Q9BiumGXtgqWjburOJYtkQO02M+DtdSWq6OcHCfZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLekIiJbnBR3yJaJxBjSh1MDA70V8krukpZ/woKosXqqpMmiV7GIzAEs+XFU6drm59VEbtEiidIeWuslYZUISY4Xhk7ow4Iz5XBo3Fdb0a9Uuzi1ptLjyAjB9Usz5q4d/xroEKD0KDV3569ZKe7JVIZUxUKrdr+ZJPGOXF0mJ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DG98uEZF; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DG98uEZF"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1363fe80fe8so10472931c88.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 13:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781122863; x=1781727663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CsfbERQCzxUEhRNgzJDaQwWVwOuXtF/8wRmRsz0ISs=;
        b=DG98uEZFTu2qVu8WUjWM1AqQiFOKtbelMjoTS8OIM91SW2oWwctIFRLwmlT7vKMqe9
         7/fHhyX5teJv3Uc6yAgGcIuOvDyL/JpjYGBI6xDzhwm9ZYCo+lZ3Yr2+JBhfIseOXEn5
         YGp7iq+MpMTXyqSs8CN+tUo63XpkHCj5j9rnevGruYCO+NoVNbeF+gNd3Uh2J1E7XP5J
         /eXbgvmh4T/bNfg50rJWA+y4N3bCheAHp1U3EMFzuA1Yzw0YYHskb7vL541xgSzDqL+x
         eyNkOfMa8CUtTHz9J5D0LRyYBcDxMQd3vjPapS6n72pl/I1/7vzjJSK9f1/fM0Y7KTbC
         lSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781122863; x=1781727663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CsfbERQCzxUEhRNgzJDaQwWVwOuXtF/8wRmRsz0ISs=;
        b=FrQlIaRKXNx4kNRuM6e7ucFWdA8vMI+5fzHUR/OUR6JhDf1jN2D8hasALxW++3onWA
         /stlR1/9RkKuxWDC2989zg6c9OFpVpuugxRVxz18MrnKB8trenuEeGBcFpE2cTJaONIh
         U1uIh8gZvliChuUcGIkcCjaF1zQ3O1fdEKTp1Vft9s1RzkZZufLG0CFOQMZFqT2Qth6t
         NXKC3PBy1TLZytaMP9rDNaZDW2uZEaSg7t2OgafYcJLEed/u/QtSMEX2cUUHlfAl1fla
         n94aA5gZ7V36xs2F6xE1yajU/WBsAsrX7v4J/vcLh0o3fWMsb1AffQGO19/Jy0c+B49c
         DKxw==
X-Forwarded-Encrypted: i=1; AFNElJ8BMYrya3yDfxVT1uUOFNHnF4eM9VeCRiD38JQOKtTBynks8/joLsaveaep2PdPUxrfEQ7GaoWlZ4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6OPw+4LU9USha/tFbDjhGgAyar5qmLQxSuTjAB9igiPqFrN9o
	PqCuGbsXTo7fbueu4EXEJ6MlcemSXd3zDV1MfCOxqI8iBTJLC1aLiZn1
X-Gm-Gg: Acq92OG8zanxVHM3Pc0ss50RkMN96j6vm3y1NE6lxsmGKpuD8Clq4vEFaeGtVA+kFvA
	+b9X12NGQ9MKLpgRB6IL/su+3SIZ21U7rXtIQI7ayohec+jLNi3/PSIZ2Jo2o5hwQVJa0jKkDyo
	WcowrrO1jdo57O7Gfuphhihn+aZ8dSDUhLVTz4zDU5Gjt37iBfg/aDhu5pOuMZLgTooLSLm3gzy
	JR7xiV4VJ7DaF8etVdoy7XFR5Mc3MW0SOCW/UGzzGQJVM56xSyiV12JAo/TLvR0FYUiiBU1luK8
	YGGLirLgCujc2WVXtLShYs5AXn0d+dcozCPG5pUb6PiASOjO9Lxce4dLiqvZsNtAdtMvXN205zw
	xwh0+/A3ye5hnlDS0tHjmXinGGiQyhPH5HyW6F3sgSEgTfnYCAtI30WHoPN+ta6J48OWr9M9JKQ
	YsNqJs11lo2sK8Kdedb3zPvzOoscTCc1tG+54jnVFVNRke1dsg9O9aiwMnhkb9DmylJiCIDfZpn
	ZqNK20Brqeb3NSBrbhM5KEAJjSK9Qoc
X-Received: by 2002:a05:7022:fb04:b0:138:51c:c5bf with SMTP id a92af1059eb24-138066c6ab3mr15555239c88.15.1781122862748;
        Wed, 10 Jun 2026 13:21:02 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::f774])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54caef7sm20195643c88.7.2026.06.10.13.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 13:21:02 -0700 (PDT)
Message-ID: <62972626-ec5d-4b9f-b745-6a8060d116e8@gmail.com>
Date: Wed, 10 Jun 2026 13:21:00 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v09 1/5] hinic3: Add ethtool queue ops
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>,
 Teng Peisen <tengpeisen@huawei.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Zheng Jiezhen
 <zhengjiezhen@h-partners.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <cover.1781062575.git.wudi234@huawei.com>
 <02e87952a65aa268526ade2f03de6c76fbc1fe9d.1781062575.git.wudi234@huawei.com>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <02e87952a65aa268526ade2f03de6c76fbc1fe9d.1781062575.git.wudi234@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/26 11:59 PM, Fan Gong wrote:
>   Implement following ethtool callback function:
> .get_ringparam
> .set_ringparam
> 
>   These callbacks allow users to utilize ethtool for detailed
> queue depth configuration and monitoring.
> 
> Co-developed-by: Wu Di <wudi234@huawei.com>
> Signed-off-by: Wu Di <wudi234@huawei.com>
> Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>  .../ethernet/huawei/hinic3/hinic3_ethtool.c   |  93 ++++++++++++++++
>  .../net/ethernet/huawei/hinic3/hinic3_irq.c   |   5 +-
>  .../net/ethernet/huawei/hinic3/hinic3_main.c  |   6 +
>  .../huawei/hinic3/hinic3_netdev_ops.c         | 104 ++++++++++++++++--
>  .../ethernet/huawei/hinic3/hinic3_nic_dev.h   |   9 ++
>  .../ethernet/huawei/hinic3/hinic3_nic_io.c    |   4 +-
>  .../ethernet/huawei/hinic3/hinic3_nic_io.h    |   8 +-
>  .../net/ethernet/huawei/hinic3/hinic3_rx.c    |   2 +-
>  8 files changed, 217 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> index 90fc16288de9..be9992a235f7 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> @@ -9,6 +9,7 @@
>  #include <linux/errno.h>
>  #include <linux/etherdevice.h>
>  #include <linux/netdevice.h>
> +#include <linux/netlink.h>
>  #include <linux/ethtool.h>
>  
>  #include "hinic3_lld.h"
> @@ -409,6 +410,96 @@ hinic3_get_link_ksettings(struct net_device *netdev,
>  	return 0;
>  }
>  
> +static void hinic3_get_ringparam(struct net_device *netdev,
> +				 struct ethtool_ringparam *ring,
> +				 struct kernel_ethtool_ringparam *kernel_ring,
> +				 struct netlink_ext_ack *extack)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +
> +	ring->rx_max_pending = HINIC3_MAX_RX_QUEUE_DEPTH;
> +	ring->tx_max_pending = HINIC3_MAX_TX_QUEUE_DEPTH;
> +	ring->rx_pending = nic_dev->q_params.rq_depth;
> +	ring->rx_pending = nic_dev->q_params.sq_depth;
> +}
> +
> +static void hinic3_update_qp_depth(struct net_device *netdev,
> +				   u32 sq_depth, u32 rq_depth)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	u16 i;
> +
> +	nic_dev->q_params.sq_depth = sq_depth;
> +	nic_dev->q_params.rq_depth = rq_depth;
> +	for (i = 0; i < nic_dev->max_qps; i++) {
> +		nic_dev->txqs[i].q_depth = sq_depth;
> +		nic_dev->txqs[i].q_mask = sq_depth - 1;
> +		nic_dev->rxqs[i].q_depth = rq_depth;
> +		nic_dev->rxqs[i].q_mask = rq_depth - 1;
> +	}
> +}
> +
> +static int hinic3_check_ringparam_valid(struct net_device *netdev,
> +					const struct ethtool_ringparam *ring,
> +					struct netlink_ext_ack *extack)
> +{
> +	if (ring->tx_pending < HINIC3_MIN_QUEUE_DEPTH ||
> +	    ring->rx_pending < HINIC3_MIN_QUEUE_DEPTH) {
> +		NL_SET_ERR_MSG_FMT_MOD(extack,
> +				       "Queue depth out of range tx[%d-%d] rx[%d-%d]",
> +				       HINIC3_MIN_QUEUE_DEPTH,
> +				       HINIC3_MAX_TX_QUEUE_DEPTH,
> +				       HINIC3_MIN_QUEUE_DEPTH,
> +				       HINIC3_MAX_RX_QUEUE_DEPTH);
> +
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hinic3_set_ringparam(struct net_device *netdev,
> +				struct ethtool_ringparam *ring,
> +				struct kernel_ethtool_ringparam *kernel_ring,
> +				struct netlink_ext_ack *extack)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct hinic3_dyna_txrxq_params q_params = {};
> +	u32 new_sq_depth, new_rq_depth;
> +	int err;
> +
> +	err = hinic3_check_ringparam_valid(netdev, ring, extack);
> +	if (err)
> +		return err;
> +
> +	new_sq_depth = 1U << ilog2(ring->tx_pending);
> +	new_rq_depth = 1U << ilog2(ring->rx_pending);
> +	if (new_sq_depth == nic_dev->q_params.sq_depth &&
> +	    new_rq_depth == nic_dev->q_params.rq_depth)
> +		return 0;
> +
> +	if (new_sq_depth != ring->tx_pending ||
> +	    new_rq_depth != ring->rx_pending)
> +		NL_SET_ERR_MSG_FMT_MOD(extack,
> +				       "Requested Tx/Rx ring depth %u/%u trimmed to %u/%u",
> +				       ring->tx_pending, ring->rx_pending,
> +				       new_sq_depth, new_rq_depth);
> +
> +	if (!netif_running(netdev)) {
> +		hinic3_update_qp_depth(netdev, new_sq_depth, new_rq_depth);
> +	} else {
> +		q_params = nic_dev->q_params;
> +		q_params.sq_depth = new_sq_depth;
> +		q_params.rq_depth = new_rq_depth;
> +
> +		err = hinic3_change_channel_settings(netdev, &q_params);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct ethtool_ops hinic3_ethtool_ops = {
>  	.supported_coalesce_params      = ETHTOOL_COALESCE_USECS |
>  					  ETHTOOL_COALESCE_PKT_RATE_RX_USECS,
> @@ -417,6 +508,8 @@ static const struct ethtool_ops hinic3_ethtool_ops = {
>  	.get_msglevel                   = hinic3_get_msglevel,
>  	.set_msglevel                   = hinic3_set_msglevel,
>  	.get_link                       = ethtool_op_get_link,
> +	.get_ringparam                  = hinic3_get_ringparam,
> +	.set_ringparam                  = hinic3_set_ringparam,
>  };
>  
>  void hinic3_set_ethtool_ops(struct net_device *netdev)
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c b/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
> index e7d6c2033b45..bc4d879f9be4 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
> @@ -137,7 +137,8 @@ static int hinic3_set_interrupt_moder(struct net_device *netdev, u16 q_id,
>  	struct hinic3_interrupt_info info = {};
>  	int err;
>  
> -	if (q_id >= nic_dev->q_params.num_qps)
> +	if (q_id >= nic_dev->q_params.num_qps ||
> +	    !mutex_trylock(&nic_dev->change_res_mutex))
>  		return 0;
>  
>  	info.interrupt_coalesc_set = 1;
> @@ -156,6 +157,8 @@ static int hinic3_set_interrupt_moder(struct net_device *netdev, u16 q_id,
>  		nic_dev->rxqs[q_id].last_pending_limit = pending_limit;
>  	}
>  
> +	mutex_unlock(&nic_dev->change_res_mutex);
> +
>  	return err;
>  }
>  
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
> index 0a888fe4c975..c87624a5e5dc 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
> @@ -179,6 +179,7 @@ static int hinic3_sw_init(struct net_device *netdev)
>  	int err;
>  
>  	mutex_init(&nic_dev->port_state_mutex);
> +	mutex_init(&nic_dev->change_res_mutex);
>  
>  	nic_dev->q_params.sq_depth = HINIC3_SQ_DEPTH;
>  	nic_dev->q_params.rq_depth = HINIC3_RQ_DEPTH;
> @@ -315,6 +316,9 @@ static void hinic3_link_status_change(struct net_device *netdev,
>  {
>  	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
>  
> +	if (!mutex_trylock(&nic_dev->change_res_mutex))
> +		return;
> +
>  	if (link_status_up) {
>  		if (netif_carrier_ok(netdev))
>  			return;

There's a couple returns in this function that will cause the lock to
never be released. Probably need a goto unlock.

> @@ -330,6 +334,8 @@ static void hinic3_link_status_change(struct net_device *netdev,
>  		netif_carrier_off(netdev);
>  		netdev_dbg(netdev, "Link is down\n");
>  	}
> +
> +	mutex_unlock(&nic_dev->change_res_mutex);
>  }
>  
>  static void hinic3_port_module_event_handler(struct net_device *netdev,
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> index da73811641a9..047214cfc753 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
> @@ -288,7 +288,8 @@ static void hinic3_free_channel_resources(struct net_device *netdev,
>  	hinic3_free_qps(nic_dev, qp_params);
>  }
>  
> -static int hinic3_open_channel(struct net_device *netdev)
> +static int hinic3_prepare_channel(struct net_device *netdev,
> +				  struct hinic3_dyna_txrxq_params *qp_params)
>  {
>  	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
>  	int err;
> @@ -299,16 +300,28 @@ static int hinic3_open_channel(struct net_device *netdev)
>  		return err;
>  	}
>  
> -	err = hinic3_configure_txrxqs(netdev, &nic_dev->q_params);
> +	err = hinic3_configure_txrxqs(netdev, qp_params);
>  	if (err) {
>  		netdev_err(netdev, "Failed to configure txrxqs\n");
>  		goto err_free_qp_ctxts;
>  	}
>  
> +	return 0;
> +
> +err_free_qp_ctxts:
> +	hinic3_free_qp_ctxts(nic_dev);
> +
> +	return err;
> +}
> +
> +static int hinic3_open_channel(struct net_device *netdev)
> +{
> +	int err;
> +
>  	err = hinic3_qps_irq_init(netdev);
>  	if (err) {
>  		netdev_err(netdev, "Failed to init txrxq irq\n");
> -		goto err_free_qp_ctxts;
> +		return err;
>  	}
>  
>  	err = hinic3_configure(netdev);
> @@ -321,8 +334,6 @@ static int hinic3_open_channel(struct net_device *netdev)
>  
>  err_uninit_qps_irq:
>  	hinic3_qps_irq_uninit(netdev);
> -err_free_qp_ctxts:
> -	hinic3_free_qp_ctxts(nic_dev);
>  
>  	return err;
>  }
> @@ -428,6 +439,74 @@ static void hinic3_vport_down(struct net_device *netdev)
>  	}
>  }
>  
> +int
> +hinic3_change_channel_settings(struct net_device *netdev,
> +			       struct hinic3_dyna_txrxq_params *trxq_params)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct hinic3_dyna_txrxq_params cur_trxq_params = {};
> +	struct hinic3_dyna_qp_params new_qp_params = {};
> +	struct hinic3_dyna_qp_params cur_qp_params = {};
> +	int err;
> +
> +	cur_trxq_params = nic_dev->q_params;
> +
> +	hinic3_config_num_qps(netdev, trxq_params);
> +
> +	err = hinic3_alloc_channel_resources(netdev, &new_qp_params,
> +					     trxq_params);
> +	if (err) {
> +		netdev_err(netdev, "Failed to alloc channel resources\n");
> +		return err;
> +	}
> +
> +	mutex_lock(&nic_dev->change_res_mutex);
> +	hinic3_vport_down(netdev);
> +	hinic3_close_channel(netdev);
> +	hinic3_get_cur_qps(nic_dev, &cur_qp_params);
> +
> +	hinic3_init_qps(nic_dev, &new_qp_params);
> +
> +	err = hinic3_prepare_channel(netdev, trxq_params);
> +	if (err)
> +		goto err_uninit_qps;
> +
> +	if (nic_dev->num_qp_irq > trxq_params->num_qps)
> +		hinic3_qp_irq_change(netdev, trxq_params->num_qps);
> +
> +	nic_dev->q_params = *trxq_params;
> +
> +	err = hinic3_open_channel(netdev);
> +	if (err)
> +		goto err_qp_irq_reset;
> +
> +	err = hinic3_vport_up(netdev);
> +	if (err)
> +		goto err_close_channel;
> +
> +	hinic3_free_channel_resources(netdev, &cur_qp_params, &cur_trxq_params);
> +
> +	mutex_unlock(&nic_dev->change_res_mutex);
> +
> +	return 0;
> +
> +err_close_channel:
> +	hinic3_close_channel(netdev);
> +err_qp_irq_reset:
> +	nic_dev->q_params = cur_trxq_params;
> +
> +	if (trxq_params->num_qps > cur_trxq_params.num_qps)
> +		hinic3_qp_irq_change(netdev, cur_trxq_params.num_qps);
> +	hinic3_free_qp_ctxts(nic_dev);
> +err_uninit_qps:
> +	hinic3_get_cur_qps(nic_dev, &new_qp_params);
> +	hinic3_free_channel_resources(netdev, &new_qp_params, trxq_params);
> +	hinic3_free_channel_resources(netdev, &cur_qp_params, &cur_trxq_params);
> +	mutex_unlock(&nic_dev->change_res_mutex);
> +
> +	return err;
> +}
> +
>  static int hinic3_open(struct net_device *netdev)
>  {
>  	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> @@ -458,6 +537,10 @@ static int hinic3_open(struct net_device *netdev)
>  
>  	hinic3_init_qps(nic_dev, &qp_params);
>  
> +	err = hinic3_prepare_channel(netdev, &nic_dev->q_params);
> +	if (err)
> +		goto err_uninit_qps;
> +
>  	err = hinic3_open_channel(netdev);
>  	if (err)
>  		goto err_uninit_qps;
> @@ -473,7 +556,7 @@ static int hinic3_open(struct net_device *netdev)
>  err_close_channel:
>  	hinic3_close_channel(netdev);
>  err_uninit_qps:
> -	hinic3_uninit_qps(nic_dev, &qp_params);
> +	hinic3_get_cur_qps(nic_dev, &qp_params);
>  	hinic3_free_channel_resources(netdev, &qp_params, &nic_dev->q_params);
>  err_destroy_num_qps:
>  	hinic3_destroy_num_qps(netdev);
> @@ -493,10 +576,15 @@ static int hinic3_close(struct net_device *netdev)
>  		return 0;
>  	}
>  
> +	mutex_lock(&nic_dev->change_res_mutex);
>  	hinic3_vport_down(netdev);
>  	hinic3_close_channel(netdev);
> -	hinic3_uninit_qps(nic_dev, &qp_params);
> -	hinic3_free_channel_resources(netdev, &qp_params, &nic_dev->q_params);
> +	hinic3_get_cur_qps(nic_dev, &qp_params);
> +	hinic3_free_channel_resources(netdev, &qp_params,
> +				      &nic_dev->q_params);
> +	hinic3_free_nicio_res(nic_dev);
> +	hinic3_destroy_num_qps(netdev);
> +	mutex_unlock(&nic_dev->change_res_mutex);
>  
>  	return 0;
>  }
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
> index 9502293ff710..005b2c01a988 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
> @@ -10,6 +10,9 @@
>  #include "hinic3_hw_cfg.h"
>  #include "hinic3_hwdev.h"
>  #include "hinic3_mgmt_interface.h"
> +#include "hinic3_nic_io.h"
> +#include "hinic3_tx.h"
> +#include "hinic3_rx.h"
>  
>  #define HINIC3_VLAN_BITMAP_BYTE_SIZE(nic_dev)  (sizeof(*(nic_dev)->vlan_bitmap))
>  #define HINIC3_VLAN_BITMAP_SIZE(nic_dev)  \
> @@ -129,6 +132,8 @@ struct hinic3_nic_dev {
>  	struct work_struct              rx_mode_work;
>  	/* lock for enable/disable port */
>  	struct mutex                    port_state_mutex;
> +	/* mutex to serialize channel/resource changes */
> +	struct mutex                    change_res_mutex;
>  
>  	struct list_head                uc_filter_list;
>  	struct list_head                mc_filter_list;
> @@ -143,6 +148,10 @@ struct hinic3_nic_dev {
>  
>  void hinic3_set_netdev_ops(struct net_device *netdev);
>  int hinic3_set_hw_features(struct net_device *netdev);
> +int
> +hinic3_change_channel_settings(struct net_device *netdev,
> +			       struct hinic3_dyna_txrxq_params *trxq_params);
> +
>  int hinic3_qps_irq_init(struct net_device *netdev);
>  void hinic3_qps_irq_uninit(struct net_device *netdev);
>  
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c
> index 87e736adba02..0e7a0ccfba98 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c
> @@ -484,8 +484,8 @@ void hinic3_init_qps(struct hinic3_nic_dev *nic_dev,
>  	}
>  }
>  
> -void hinic3_uninit_qps(struct hinic3_nic_dev *nic_dev,
> -		       struct hinic3_dyna_qp_params *qp_params)
> +void hinic3_get_cur_qps(struct hinic3_nic_dev *nic_dev,
> +			struct hinic3_dyna_qp_params *qp_params)
>  {
>  	struct hinic3_nic_io *nic_io = nic_dev->nic_io;
>  
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h
> index 12eefabcf1db..571b34d63950 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.h
> @@ -14,6 +14,10 @@ struct hinic3_nic_dev;
>  #define HINIC3_RQ_WQEBB_SHIFT      3
>  #define HINIC3_SQ_WQEBB_SIZE       BIT(HINIC3_SQ_WQEBB_SHIFT)
>  
> +#define HINIC3_MAX_TX_QUEUE_DEPTH  65536
> +#define HINIC3_MAX_RX_QUEUE_DEPTH  16384
> +#define HINIC3_MIN_QUEUE_DEPTH     128
> +
>  /* ******************** RQ_CTRL ******************** */
>  enum hinic3_rq_wqe_type {
>  	HINIC3_NORMAL_RQ_WQE = 1,
> @@ -136,8 +140,8 @@ void hinic3_free_qps(struct hinic3_nic_dev *nic_dev,
>  		     struct hinic3_dyna_qp_params *qp_params);
>  void hinic3_init_qps(struct hinic3_nic_dev *nic_dev,
>  		     struct hinic3_dyna_qp_params *qp_params);
> -void hinic3_uninit_qps(struct hinic3_nic_dev *nic_dev,
> -		       struct hinic3_dyna_qp_params *qp_params);
> +void hinic3_get_cur_qps(struct hinic3_nic_dev *nic_dev,
> +			struct hinic3_dyna_qp_params *qp_params);
>  
>  int hinic3_init_qp_ctxts(struct hinic3_nic_dev *nic_dev);
>  void hinic3_free_qp_ctxts(struct hinic3_nic_dev *nic_dev);
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> index 309ab5901379..b5b601469517 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> @@ -541,7 +541,7 @@ int hinic3_configure_rxqs(struct net_device *netdev, u16 num_rq,
>  		rq_associate_cqes(rxq);
>  
>  		pkts = hinic3_rx_fill_buffers(rxq);
> -		if (!pkts) {
> +		if (pkts < rxq->q_depth - 1) {

nit: just use rxq->q_mask?

>  			netdev_err(netdev, "Failed to fill Rx buffer\n");
>  			return -ENOMEM;
>  		}

