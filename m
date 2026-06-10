Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C436403B
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124109; cv=none; b=aoX7YJoVaRWJok+qzxZRK+wB96jyN1wZNTuxK8RF1HiIEIBIR1Xoiz3QkgRswhTQxtPoSk8fbon7qbzZHTvH0IwR9G+gEFvtscfuZh8+BtpUv10x3P1qJ4SGmWVOGbPOqTB74GjRYK/LgezOoyvcQIZWhGmCPdT4vc4xncGjh3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124109; c=relaxed/simple;
	bh=FfcK2VDr+cbkHmdERM3D0umRRUrcMG4Ez0z0VRc6AYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bz9W69m56PfKvuo8dOi3nKZBYL7O9Gtu2ne9Mtt6guiGIC7OqGMXJHIkVpkaaWARsDRXmDhudOFy9vEvmkx39ODTxluLQDci0Soo4Yai7uTQZlxDZsBROtn7hPsI75d8/Lk8IMsAVZlWq1BiAs1D3QwUv/v76SLbD1SZ+trG9sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVQLxsTy; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVQLxsTy"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1383e116edfso802563c88.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781124107; x=1781728907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cafLBqBhQO6iXCnjNbbgZ31p/JjuxuAHoGm/KDHC2Q=;
        b=mVQLxsTyq/vz5LMvEPHPzU8wmkV9QD9lKs89GK3NVa6KkUQgSh98StPSmXYXkg72tW
         Th0KNcSu7A8/R3kPx+4M1JQHX9DjVDMlclXJiBee6FsS2wtFcX66qJLKrsRHKdd5pyIB
         m7DoBTOWZsf7t4JGeWnvvSH8zLEG/bSeYsDbYjHh+gF9ReWiKGgUKgggck+WeR3p5ZAe
         akGpOuqNm5AnG9+37KJdq6W+Oo9zOVz089EfQO9I1MYrza3FKjbt7jN5o+N9Dks1m0mb
         La1nSXDOCoJBIXC+bXza0horvw1j9KsO6bjcJjRjf0Nqw/CbnWGShV/9kxRWTpc0PRk+
         +Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781124107; x=1781728907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cafLBqBhQO6iXCnjNbbgZ31p/JjuxuAHoGm/KDHC2Q=;
        b=KL9QOt9fQk9io5TQqLa5OCHePRQLEP3M9FaCwukDKSuLcTJ8VBAzoOcVTU4OvXEPO4
         OT1UGCQdIYKNlFAVe6Oi4H7B8BxOfZPDDMTcQ2RycPGT/ZwcTvPXi9UAnTO3l9BoR0TG
         1z33jaHzbkZaL819P5IpbwOfnwH477+VRRyy5HpmrNvtnml1JiXf9/orupj/k8rZOVXb
         iHEUKYEOuqOe1dBvYnYXXimY+UdiahgluQSawjyRdHbYKN2xTMXfqHo0bO+b05p1jEJA
         lsnXjOPGNFpx0vQqrCZ5MOlWgKrFOzgGJXt9BAmWO7XIamqFZPxriX+yXKo4DQ4CPwBQ
         PtYw==
X-Forwarded-Encrypted: i=1; AFNElJ9g6KxYx++ncvOol4Ag53z4ssGeNZStEbxhSRdBui/3esbHfYjnivOjoZbU0Tr2PRxl+09ix6dP7C4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgmaL1OhLfVqKKtY+lVfpiJVqron3KbIsUBvsMdw3HRyiDtzGd
	H3ZAoQRvrFjpLBcPf3XnIIcRGH97G2dBKpAKCPwJiLNTcjcBbBj0FC6z
X-Gm-Gg: Acq92OFpLt985qwsqtY5x5wYb3NosjW0rY3O8P6GDjRq2z/22Df5s65oKYR5Lc7lh2S
	aJnw3/3zSUn1PK6bsy71ynk9yhl+2lhbZwM12/gRzm9YvHytoqM8zqab24GB1lSdRwGixmRFI/l
	TqI+Igzv91YIsCfK2ot6DAQoCjvH3DS6FkAIAQAkpqL5n/Dg5gxgYQCtHwVccZukjrKcvovb+e8
	UCiAZFY5dObDT2KvK9sT+PxUNo4OHr+rUf+K0vn+NJsG1sBeQyxXSrHWHptTvp6VCcAfOlAmIxD
	DagmlyGrAnSDfCKT2wpfyggagE96eGLxau+YVacJRK4o+p5/N2cYx+mlJqfTSlrPmpO2QV12con
	kJeouu3uQ5jRMtZSgGBnKX6UcVtmGyLbWc8CgXfGxKUcA/qPs/EGeqZWEVwNVMqon4ahIZqNEgo
	vCvMa57ecxiUfNkCcGcveheyF5/PqHGTBy1knNP9CbYv7Za8J8Tgs0INmAdfFmfkxO1Z/Coi1SC
	M1Qoi/EuwqlGGQ5KR5+tw==
X-Received: by 2002:a05:7022:6ba1:b0:137:ec47:8fe1 with SMTP id a92af1059eb24-138067240b3mr15792916c88.29.1781124106438;
        Wed, 10 Jun 2026 13:41:46 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::f774])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm23363367c88.9.2026.06.10.13.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 13:41:45 -0700 (PDT)
Message-ID: <6b019322-bb5c-4c35-ad51-efc2827041ef@gmail.com>
Date: Wed, 10 Jun 2026 13:41:44 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v09 4/5] hinic3: Add ethtool rss ops
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
 <7d1a4375fdf7c3e7a5a6162382cee4f48991d5da.1781062575.git.wudi234@huawei.com>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <7d1a4375fdf7c3e7a5a6162382cee4f48991d5da.1781062575.git.wudi234@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/26 11:59 PM, Fan Gong wrote:
>   Implement following ethtool callback function:
> .get_rxnfc
> .set_rxnfc
> .get_channels
> .set_channels
> .get_rxfh_indir_size
> .get_rxfh_key_size
> .get_rxfh
> .set_rxfh
> 
>   These callbacks allow users to utilize ethtool for detailed
> RSS parameters configuration and monitoring.
> 
> Co-developed-by: Wu Di <wudi234@huawei.com>
> Signed-off-by: Wu Di <wudi234@huawei.com>
> Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>  .../ethernet/huawei/hinic3/hinic3_ethtool.c   |   9 +
>  .../huawei/hinic3/hinic3_mgmt_interface.h     |   2 +
>  .../net/ethernet/huawei/hinic3/hinic3_rss.c   | 539 +++++++++++++++++-
>  .../net/ethernet/huawei/hinic3/hinic3_rss.h   |  19 +
>  4 files changed, 567 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> index 11c8eb0f5d2a..78818de9a946 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> @@ -16,6 +16,7 @@
>  #include "hinic3_hw_comm.h"
>  #include "hinic3_nic_dev.h"
>  #include "hinic3_nic_cfg.h"
> +#include "hinic3_rss.h"
>  
>  #define HINIC3_MGMT_VERSION_MAX_LEN     32
>  /* Coalesce time properties in microseconds */
> @@ -1238,6 +1239,14 @@ static const struct ethtool_ops hinic3_ethtool_ops = {
>  	.get_pause_stats                = hinic3_get_pause_stats,
>  	.get_coalesce                   = hinic3_get_coalesce,
>  	.set_coalesce                   = hinic3_set_coalesce,
> +	.get_rxnfc                      = hinic3_get_rxnfc,
> +	.set_rxnfc                      = hinic3_set_rxnfc,
> +	.get_channels                   = hinic3_get_channels,
> +	.set_channels                   = hinic3_set_channels,
> +	.get_rxfh_indir_size            = hinic3_get_rxfh_indir_size,
> +	.get_rxfh_key_size              = hinic3_get_rxfh_key_size,
> +	.get_rxfh                       = hinic3_get_rxfh,
> +	.set_rxfh                       = hinic3_set_rxfh,
>  };
>  
>  void hinic3_set_ethtool_ops(struct net_device *netdev)
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_mgmt_interface.h b/drivers/net/ethernet/huawei/hinic3/hinic3_mgmt_interface.h
> index 76c691f82703..3c1263ff99ff 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_mgmt_interface.h
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_mgmt_interface.h
> @@ -282,6 +282,7 @@ enum l2nic_cmd {
>  	L2NIC_CMD_SET_VLAN_FILTER_EN  = 26,
>  	L2NIC_CMD_SET_RX_VLAN_OFFLOAD = 27,
>  	L2NIC_CMD_CFG_RSS             = 60,
> +	L2NIC_CMD_GET_RSS_CTX_TBL     = 62,
>  	L2NIC_CMD_CFG_RSS_HASH_KEY    = 63,
>  	L2NIC_CMD_CFG_RSS_HASH_ENGINE = 64,
>  	L2NIC_CMD_SET_RSS_CTX_TBL     = 65,
> @@ -301,6 +302,7 @@ enum l2nic_ucode_cmd {
>  	L2NIC_UCODE_CMD_MODIFY_QUEUE_CTX  = 0,
>  	L2NIC_UCODE_CMD_CLEAN_QUEUE_CTX   = 1,
>  	L2NIC_UCODE_CMD_SET_RSS_INDIR_TBL = 4,
> +	L2NIC_UCODE_CMD_GET_RSS_INDIR_TBL = 6,
>  };
>  
>  /* hilink mac group command */
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> index 25db74d8c7dd..811a6b491e74 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> @@ -155,7 +155,7 @@ static int hinic3_set_rss_type(struct hinic3_hwdev *hwdev,
>  				       L2NIC_CMD_SET_RSS_CTX_TBL, &msg_params);
>  
>  	if (ctx_tbl.msg_head.status == MGMT_STATUS_CMD_UNSUPPORTED) {
> -		return MGMT_STATUS_CMD_UNSUPPORTED;
> +		return -EOPNOTSUPP;
>  	} else if (err || ctx_tbl.msg_head.status) {
>  		dev_err(hwdev->dev, "mgmt Failed to set rss context offload, err: %d, status: 0x%x\n",
>  			err, ctx_tbl.msg_head.status);
> @@ -165,6 +165,41 @@ static int hinic3_set_rss_type(struct hinic3_hwdev *hwdev,
>  	return 0;
>  }
>  
> +static int hinic3_get_rss_type(struct hinic3_hwdev *hwdev,
> +			       struct hinic3_rss_type *rss_type)
> +{
> +	struct l2nic_cmd_rss_ctx_tbl ctx_tbl = {};
> +	struct mgmt_msg_params msg_params = {};
> +	int err;
> +
> +	ctx_tbl.func_id = hinic3_global_func_id(hwdev);
> +
> +	mgmt_msg_params_init_default(&msg_params, &ctx_tbl, sizeof(ctx_tbl));
> +
> +	err = hinic3_send_mbox_to_mgmt(hwdev, MGMT_MOD_L2NIC,
> +				       L2NIC_CMD_GET_RSS_CTX_TBL,
> +				       &msg_params);
> +	if (ctx_tbl.msg_head.status == MGMT_STATUS_CMD_UNSUPPORTED) {
> +		return -EOPNOTSUPP;
> +	} else if (err || ctx_tbl.msg_head.status) {
> +		dev_err(hwdev->dev, "Failed to get hash type, err: %d, status: 0x%x\n",
> +			err, ctx_tbl.msg_head.status);
> +		return -EINVAL;
> +	}
> +
> +	rss_type->ipv4         = L2NIC_RSS_TYPE_GET(ctx_tbl.context, IPV4);
> +	rss_type->ipv6         = L2NIC_RSS_TYPE_GET(ctx_tbl.context, IPV6);
> +	rss_type->ipv6_ext     = L2NIC_RSS_TYPE_GET(ctx_tbl.context, IPV6_EXT);
> +	rss_type->tcp_ipv4     = L2NIC_RSS_TYPE_GET(ctx_tbl.context, TCP_IPV4);
> +	rss_type->tcp_ipv6     = L2NIC_RSS_TYPE_GET(ctx_tbl.context, TCP_IPV6);
> +	rss_type->tcp_ipv6_ext = L2NIC_RSS_TYPE_GET(ctx_tbl.context,
> +						    TCP_IPV6_EXT);
> +	rss_type->udp_ipv4     = L2NIC_RSS_TYPE_GET(ctx_tbl.context, UDP_IPV4);
> +	rss_type->udp_ipv6     = L2NIC_RSS_TYPE_GET(ctx_tbl.context, UDP_IPV6);
> +
> +	return 0;
> +}
> +
>  static int hinic3_rss_cfg_hash_type(struct hinic3_hwdev *hwdev, u8 opcode,
>  				    enum hinic3_rss_hash_type *type)
>  {
> @@ -264,7 +299,8 @@ static int hinic3_set_hw_rss_parameters(struct net_device *netdev, u8 rss_en)
>  	if (err)
>  		return err;
>  
> -	hinic3_fillout_indir_tbl(netdev, nic_dev->rss_indir);
> +	if (!netif_is_rxfh_configured(netdev))
> +		hinic3_fillout_indir_tbl(netdev, nic_dev->rss_indir);
>  
>  	err = hinic3_config_rss_hw_resource(netdev, nic_dev->rss_indir);
>  	if (err)
> @@ -334,3 +370,502 @@ void hinic3_try_to_enable_rss(struct net_device *netdev)
>  	clear_bit(HINIC3_RSS_ENABLE, &nic_dev->flags);
>  	nic_dev->q_params.num_qps = nic_dev->max_qps;
>  }
> +
> +static int hinic3_set_l4_rss_hash_ops(const struct ethtool_rxnfc *cmd,
> +				      struct hinic3_rss_type *rss_type)
> +{
> +	u8 rss_l4_en;
> +
> +	switch (cmd->data & (RXH_L4_B_0_1 | RXH_L4_B_2_3)) {
> +	case 0:
> +		rss_l4_en = 0;
> +		break;
> +	case (RXH_L4_B_0_1 | RXH_L4_B_2_3):
> +		rss_l4_en = 1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (cmd->flow_type) {
> +	case TCP_V4_FLOW:
> +		rss_type->tcp_ipv4 = rss_l4_en;
> +		break;
> +	case TCP_V6_FLOW:
> +		rss_type->tcp_ipv6 = rss_l4_en;
> +		break;
> +	case UDP_V4_FLOW:
> +		rss_type->udp_ipv4 = rss_l4_en;
> +		break;
> +	case UDP_V6_FLOW:
> +		rss_type->udp_ipv6 = rss_l4_en;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hinic3_update_rss_hash_opts(struct net_device *netdev,
> +				       struct ethtool_rxnfc *cmd,
> +				       struct hinic3_rss_type *rss_type)
> +{
> +	int err;
> +
> +	switch (cmd->flow_type) {
> +	case TCP_V4_FLOW:
> +	case TCP_V6_FLOW:
> +	case UDP_V4_FLOW:
> +	case UDP_V6_FLOW:
> +		err = hinic3_set_l4_rss_hash_ops(cmd, rss_type);
> +		if (err)
> +			return err;
> +
> +		break;
> +	case IPV4_FLOW:
> +		rss_type->ipv4 = 1;
> +		break;
> +	case IPV6_FLOW:
> +		rss_type->ipv6 = 1;
> +		break;
> +	default:
> +		netdev_err(netdev, "Unsupported flow type\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hinic3_set_rss_hash_opts(struct net_device *netdev,
> +				    struct ethtool_rxnfc *cmd)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct hinic3_rss_type rss_type;
> +	int err;
> +
> +	if (!test_bit(HINIC3_RSS_ENABLE, &nic_dev->flags)) {
> +		cmd->data = 0;
> +		netdev_err(netdev, "RSS is disable, not support to set flow-hash\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* RSS only supports hashing of IP addresses and L4 ports */
> +	if (cmd->data & ~(RXH_IP_SRC | RXH_IP_DST |
> +			  RXH_L4_B_0_1 | RXH_L4_B_2_3))
> +		return -EINVAL;
> +
> +	/* Both IP addresses must be part of the hash tuple */
> +	if (!(cmd->data & RXH_IP_SRC) || !(cmd->data & RXH_IP_DST))
> +		return -EINVAL;
> +
> +	/* L4 hash bits are not valid for pure L3 flow types */
> +	if ((cmd->flow_type == IPV4_FLOW || cmd->flow_type == IPV6_FLOW) &&
> +	    (cmd->data & (RXH_L4_B_0_1 | RXH_L4_B_2_3)))
> +		return -EINVAL;
> +
> +	err = hinic3_get_rss_type(nic_dev->hwdev, &rss_type);
> +	if (err) {
> +		netdev_err(netdev, "Failed to get rss type\n");
> +		return err;
> +	}
> +
> +	err = hinic3_update_rss_hash_opts(netdev, cmd, &rss_type);
> +	if (err)
> +		return err;
> +
> +	err = hinic3_set_rss_type(nic_dev->hwdev, rss_type);
> +	if (err) {
> +		netdev_err(netdev, "Failed to set rss type\n");
> +		return err;
> +	}
> +
> +	nic_dev->rss_type = rss_type;
> +
> +	return 0;
> +}
> +
> +static void convert_rss_l3_type(u8 rss_opt, struct ethtool_rxnfc *cmd)
> +{
> +	if (!rss_opt)
> +		cmd->data &= ~(RXH_IP_SRC | RXH_IP_DST);
> +}
> +
> +static void convert_rss_l4_type(u8 rss_opt, struct ethtool_rxnfc *cmd)
> +{
> +	if (rss_opt)
> +		cmd->data |= RXH_L4_B_0_1 | RXH_L4_B_2_3;
> +}
> +
> +static int hinic3_convert_rss_type(struct net_device *netdev,
> +				   struct hinic3_rss_type *rss_type,
> +				   struct ethtool_rxnfc *cmd)
> +{
> +	cmd->data = RXH_IP_SRC | RXH_IP_DST;
> +	switch (cmd->flow_type) {
> +	case TCP_V4_FLOW:
> +		convert_rss_l4_type(rss_type->tcp_ipv4, cmd);
> +		break;
> +	case TCP_V6_FLOW:
> +		convert_rss_l4_type(rss_type->tcp_ipv6, cmd);
> +		break;
> +	case UDP_V4_FLOW:
> +		convert_rss_l4_type(rss_type->udp_ipv4, cmd);
> +		break;
> +	case UDP_V6_FLOW:
> +		convert_rss_l4_type(rss_type->udp_ipv6, cmd);
> +		break;
> +	case IPV4_FLOW:
> +		convert_rss_l3_type(rss_type->ipv4, cmd);
> +		break;
> +	case IPV6_FLOW:
> +		convert_rss_l3_type(rss_type->ipv6, cmd);
> +		break;
> +	default:
> +		netdev_err(netdev, "Unsupported flow type\n");
> +		cmd->data = 0;
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hinic3_get_rss_hash_opts(struct net_device *netdev,
> +				    struct ethtool_rxnfc *cmd)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct hinic3_rss_type rss_type;
> +	int err;
> +
> +	cmd->data = 0;
> +
> +	if (!test_bit(HINIC3_RSS_ENABLE, &nic_dev->flags))
> +		return 0;
> +
> +	err = hinic3_get_rss_type(nic_dev->hwdev, &rss_type);
> +	if (err) {
> +		netdev_err(netdev, "Failed to get rss type\n");
> +		return err;
> +	}
> +
> +	return hinic3_convert_rss_type(netdev, &rss_type, cmd);
> +}
> +
> +int hinic3_get_rxnfc(struct net_device *netdev,
> +		     struct ethtool_rxnfc *cmd, u32 *rule_locs)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	int err = 0;
> +
> +	switch (cmd->cmd) {
> +	case ETHTOOL_GRXRINGS:
> +		cmd->data = nic_dev->q_params.num_qps;
> +		break;

You should probably implement the get_rx_ring_count ethtool op instead.
See
https://lore.kernel.org/netdev/20260122-grxring_big_v4-v2-0-94dbe4dcaa10@debian.org/

