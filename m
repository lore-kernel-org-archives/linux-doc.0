Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6432340290
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 07:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029985; cv=none; b=iFCsdOTD7LaCBY/echMPbTnQB4+ZbiJwO3bbiw0g3NP/SdnCMhteDIoSPksKizf5OAhdY/XTafGrkCtBtmeNjAwnCdhIpiv+iZ5OAg9E0ZvnteUBQvXtSU264qryOW8xbTnJ8uunKvNPPqf/N2gVw/J2h5qDw5l1BsVa5t0i9Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029985; c=relaxed/simple;
	bh=zOZC2aKClSnAidR0vLOY85xgZZqHZ5x5vrQqdnyVDhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jydhz39iOAF/eegY4CoyI7J3VBLHwUUUgdkGK+1IZZZfbm/0U5dHH1ZWeicLWhkBgWzMBiDciSyh1P0xwXTss56CPl6l/lPqziTlUj/LbLundnhHVXjM9zVyM0YMsXJKfl8mWOkKvdJww0Hssu8uIc6cuveDyDTQ5N+RWuRK0SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbA51mQJ; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbA51mQJ"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12a747e7b2fso3291334c88.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 00:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775029983; x=1775634783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gn7BFBkoPg/Mi40J2CvkBtL8T6I0G+ldprB7tkZkwBc=;
        b=lbA51mQJreoSSy6Zfm6ppyHazRemK9OOQ3Fx3MsQcU/h+bsd0C0/tnQKjG8ccLAfII
         mzDtVpCM9T1mhg5tEdeCuFqBK1hb55wJnPntJdBjSErneivH3bNTXjC7IeNTLEa8/a6T
         qDy1SwDfbLPkqUp3Sh/2ksJVlmfErlvnhvUijKMQ8V8iFmpcee09mU9DkeCjMjNhitVz
         rEN2ZcoXyt8GjYLQ3b/EE/ApjAG4xuhbbZPOWYXUo5c1qd4oEI9lyNbi/pZQILrGDeGX
         yqvuv3u28ITfjUrejXUhmHcWjtPDV9had3zaosZ3kJR23Jix7T1WR6bshnY4wy3oHswP
         2WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775029983; x=1775634783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gn7BFBkoPg/Mi40J2CvkBtL8T6I0G+ldprB7tkZkwBc=;
        b=Fd1ZZt9Xf7wdtfKts2y2C76qrWM2MBIgIKXoS4GtlwMZIQUFzekD+p0N7HLh9jMEjB
         Rvrw3Y+Rwd6oHDhY1ovd2a/vnnLGk52Tn5INryKXWFN1f8VrbgQ4vsALPNCVJrtrS303
         AIfbBrjUjJBZxPXkeZnxRJMccJdQi9vukcBihZN8D0nYqoJuwFBN0sjy1NgpUXLP3nKo
         9oVognmD66/wwDODA/iKYN7P0SlLORYATK9mJjwPkdgbZPbneAyb7u2gl8Vz9pojNf1S
         5ERtIoBI8aA8FuRFrwrwBwu+wh59Q7p9PI4I7+Jy2F0ZO4PmJloSO8PDkQGJIkKNsfcW
         INXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWICAR87KaqQtHkLSerbK30vvfBt+AcHb7Lyps7Vdkwk9CdZ2ooNSbyT22B6t9UKnK30l/ckPjOhsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCPXW2fftCxtXOJgaQPA6qN9eFPygJk/jc9IkurUFOUH7SSFX4
	hGrewrxLm08S3grXvteL8wwRgz9fSeHjKyx6AF8ya/J5k9EFFduFZY2P
X-Gm-Gg: ATEYQzyT3qFXps1mwey51iB7VoAVNhvfo3TLodsUdFIKSEqYHPCS8Wqp6uvORY8P88n
	u2Cqrxxlxk3OvI6udiveXLL21+C0w9+ENiUsDvXJ8xQkpPaLM3hdJma08kFJK7+hXq1Q8mHksGU
	eHkd63J8FF/v8lzmoQttjDE/Su9o5iNOH4tbCA/WRRE2J5JO16w6T0Qg+Dmo/mLpeDG+5avehqX
	n3lL7u/UgOsl1GNMPH+qI94IXpnQ9bBNGSq99avCjflZiF5chPM8xPrZ/Y+1mKir77cq9nt9aph
	W3pan4OK1/D7sflZjx4s8B9V6CyRV2G8bXG7t1C/yTatNcBXMCzmN54rI5abrkhuHAhED2S7y0f
	WpX2Dg/AnUIZOz4nJP8EK7O/NQi3sY+inExQtRH//CrQJkbuwF1DXUo5dcMyYroy5fFJ03uOv6D
	z3l6Li1rDtkhCZwTshjYqmHRWKT5/fX+QeyL6PnKcOk+j6v2aETa9B5eUHa/zNgiBLGfL8d+g=
X-Received: by 2002:a05:7022:b81:b0:127:3f2a:af21 with SMTP id a92af1059eb24-12be647ca0amr1320002c88.15.1775029982608;
        Wed, 01 Apr 2026 00:53:02 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21e1::139a? ([2620:10d:c090:400::5:51bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f904sm17793034c88.9.2026.04.01.00.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 00:53:01 -0700 (PDT)
Message-ID: <18d5a9b7-9c8d-4fc4-9332-fab27449dc58@gmail.com>
Date: Wed, 1 Apr 2026 00:53:00 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v03 3/6] hinic3: Add ethtool coalesce ops
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Zheng Jiezhen
 <zhengjiezhen@h-partners.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <cover.1774940117.git.zhuyikai1@h-partners.com>
 <ffc357656b2412abf6e8de4200d289e761f3e6ea.1774940117.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <ffc357656b2412abf6e8de4200d289e761f3e6ea.1774940117.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> +static int is_coalesce_exceed_limit(struct net_device *netdev,
> +				    const struct ethtool_coalesce *coal)
> +{
> +	const struct {
> +		const char *name;
> +		u32 value;
> +		u32 limit;
> +	} coalesce_limits[] = {
> +		{"rx_coalesce_usecs",
> +		 coal->rx_coalesce_usecs,
> +		 COALESCE_MAX_TIMER_CFG},
> +		{"rx_max_coalesced_frames",
> +		 coal->rx_max_coalesced_frames,
> +		 COALESCE_MAX_PENDING_LIMIT},
> +		{"rx_max_coalesced_frames_low",
> +		 coal->rx_max_coalesced_frames_low,
> +		 COALESCE_MAX_PENDING_LIMIT},
> +		{"rx_max_coalesced_frames_high",
> +		 coal->rx_max_coalesced_frames_high,
> +		 COALESCE_MAX_PENDING_LIMIT},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(coalesce_limits); i++) {
> +		if (coalesce_limits[i].value > coalesce_limits[i].limit) {
> +			netdev_err(netdev, "%s out of range %d-%d\n",
> +				   coalesce_limits[i].name, 0,
> +				   coalesce_limits[i].limit);
> +			return -EOPNOTSUPP;

Since we are failing a range check, maybe -ERANGE or -EINVAL would be 
more appropriate here.

> +		}
> +	}
> +	return 0;
> +}
> +
> +static int is_coalesce_legal(struct net_device *netdev,
> +			     const struct ethtool_coalesce *coal)
> +{
> +	int err;
> +
> +	err = is_coalesce_exceed_limit(netdev, coal);
> +	if (err)
> +		return err;
> +
> +	if (coal->rx_max_coalesced_frames_low >=
> +	    coal->rx_max_coalesced_frames_high &&
> +	    coal->rx_max_coalesced_frames_high > 0) {

So this would allow non-zero low and zero high. For example, low = 10, 
high = 0. Is this expected?

> +		netdev_err(netdev, "invalid coalesce frame high %u, low %u, unit %d\n",
> +			   coal->rx_max_coalesced_frames_high,
> +			   coal->rx_max_coalesced_frames_low,
> +			   COALESCE_PENDING_LIMIT_UNIT);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static void check_coalesce_align(struct net_device *netdev,
> +				 u32 item, u32 unit, const char *str)
> +{
> +	if (item % unit)
> +		netdev_warn(netdev, "%s in %d units, change to %u\n",
> +			    str, unit, item - item % unit);
> +}
> +
> +#define CHECK_COALESCE_ALIGN(member, unit) \
> +	check_coalesce_align(netdev, member, unit, #member)
> +
> +static void check_coalesce_changed(struct net_device *netdev,
> +				   u32 item, u32 unit, u32 ori_val,
> +				   const char *obj_str, const char *str)
> +{
> +	if ((item / unit) != ori_val)
> +		netdev_dbg(netdev, "Change %s from %d to %u %s\n",
> +			   str, ori_val * unit, item - item % unit, obj_str);
> +}
> +
> +#define CHECK_COALESCE_CHANGED(member, unit, ori_val, obj_str) \
> +	check_coalesce_changed(netdev, member, unit, ori_val, obj_str, #member)
> +
> +static int hinic3_set_hw_coal_param(struct net_device *netdev,
> +				    struct hinic3_intr_coal_info *intr_coal)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	int err;
> +	u16 i;
> +
> +	for (i = 0; i < nic_dev->max_qps; i++) {
> +		err = hinic3_set_queue_coalesce(netdev, i, intr_coal);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hinic3_get_coalesce(struct net_device *netdev,
> +			       struct ethtool_coalesce *coal,
> +			       struct kernel_ethtool_coalesce *kernel_coal,
> +			       struct netlink_ext_ack *extack)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct hinic3_intr_coal_info *interrupt_info;
> +
> +	interrupt_info = &nic_dev->intr_coalesce[0];
> +
> +	/* TX/RX uses the same interrupt.
> +	 * So we only declare RX ethtool_coalesce parameters.
> +	 */
> +	coal->rx_coalesce_usecs = interrupt_info->coalesce_timer_cfg *
> +				  COALESCE_TIMER_CFG_UNIT;
> +	coal->rx_max_coalesced_frames = interrupt_info->pending_limit *
> +					COALESCE_PENDING_LIMIT_UNIT;
> +
> +	coal->use_adaptive_rx_coalesce = nic_dev->adaptive_rx_coal;
> +
> +	coal->rx_max_coalesced_frames_high =
> +		interrupt_info->rx_pending_limit_high *
> +		COALESCE_PENDING_LIMIT_UNIT;
> +
> +	coal->rx_max_coalesced_frames_low =
> +		interrupt_info->rx_pending_limit_low *
> +		COALESCE_PENDING_LIMIT_UNIT;
> +
> +	return 0;
> +}
> +
> +static int hinic3_set_coalesce(struct net_device *netdev,
> +			       struct ethtool_coalesce *coal,
> +			       struct kernel_ethtool_coalesce *kernel_coal,
> +			       struct netlink_ext_ack *extack)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct hinic3_intr_coal_info *ori_intr_coal;
> +	struct hinic3_intr_coal_info intr_coal = {};
> +	char obj_str[32];
> +	int err;
> +
> +	err = is_coalesce_legal(netdev, coal);
> +	if (err)
> +		return err;
> +
> +	CHECK_COALESCE_ALIGN(coal->rx_coalesce_usecs, COALESCE_TIMER_CFG_UNIT);
> +	CHECK_COALESCE_ALIGN(coal->rx_max_coalesced_frames,
> +			     COALESCE_PENDING_LIMIT_UNIT);
> +	CHECK_COALESCE_ALIGN(coal->rx_max_coalesced_frames_high,
> +			     COALESCE_PENDING_LIMIT_UNIT);
> +	CHECK_COALESCE_ALIGN(coal->rx_max_coalesced_frames_low,
> +			     COALESCE_PENDING_LIMIT_UNIT);
> +
> +	ori_intr_coal = &nic_dev->intr_coalesce[0];
> +	snprintf(obj_str, sizeof(obj_str), "for netdev");
> +
> +	CHECK_COALESCE_CHANGED(coal->rx_coalesce_usecs, COALESCE_TIMER_CFG_UNIT,
> +			       ori_intr_coal->coalesce_timer_cfg, obj_str);
> +	CHECK_COALESCE_CHANGED(coal->rx_max_coalesced_frames,
> +			       COALESCE_PENDING_LIMIT_UNIT,
> +			       ori_intr_coal->pending_limit, obj_str);
> +	CHECK_COALESCE_CHANGED(coal->rx_max_coalesced_frames_high,
> +			       COALESCE_PENDING_LIMIT_UNIT,
> +			       ori_intr_coal->rx_pending_limit_high, obj_str);
> +	CHECK_COALESCE_CHANGED(coal->rx_max_coalesced_frames_low,
> +			       COALESCE_PENDING_LIMIT_UNIT,
> +			       ori_intr_coal->rx_pending_limit_low, obj_str);
> +
> +	intr_coal.coalesce_timer_cfg =
> +		(u8)(coal->rx_coalesce_usecs / COALESCE_TIMER_CFG_UNIT);
> +	intr_coal.pending_limit = (u8)(coal->rx_max_coalesced_frames /
> +				      COALESCE_PENDING_LIMIT_UNIT);
> +
> +	nic_dev->adaptive_rx_coal = coal->use_adaptive_rx_coalesce;
> +
> +	intr_coal.rx_pending_limit_high =
> +		(u8)(coal->rx_max_coalesced_frames_high /
> +		     COALESCE_PENDING_LIMIT_UNIT);
> +
> +	intr_coal.rx_pending_limit_low =
> +		(u8)(coal->rx_max_coalesced_frames_low /
> +		     COALESCE_PENDING_LIMIT_UNIT);
> +
> +	/* coalesce timer or pending set to zero will disable coalesce */
> +	if (!nic_dev->adaptive_rx_coal &&
> +	    (!intr_coal.coalesce_timer_cfg || !intr_coal.pending_limit))
> +		netdev_warn(netdev, "Coalesce will be disabled\n");
> +
> +	return hinic3_set_hw_coal_param(netdev, &intr_coal);
> +}
> +
>   static const struct ethtool_ops hinic3_ethtool_ops = {
> -	.supported_coalesce_params      = ETHTOOL_COALESCE_USECS |
> -					  ETHTOOL_COALESCE_PKT_RATE_RX_USECS,
> +	.supported_coalesce_params      = ETHTOOL_COALESCE_RX_USECS |
> +					  ETHTOOL_COALESCE_RX_MAX_FRAMES |
> +					  ETHTOOL_COALESCE_USE_ADAPTIVE_RX |
> +					  ETHTOOL_COALESCE_RX_MAX_FRAMES_LOW |
> +					  ETHTOOL_COALESCE_RX_MAX_FRAMES_HIGH,

Looks like ETHTOOL_COALESCE_TX_USECS support got dropped. is it intentional?

>   	.get_link_ksettings             = hinic3_get_link_ksettings,
>   	.get_drvinfo                    = hinic3_get_drvinfo,
>   	.get_msglevel                   = hinic3_get_msglevel,
> @@ -1004,6 +1231,8 @@ static const struct ethtool_ops hinic3_ethtool_ops = {
>   	.get_eth_ctrl_stats             = hinic3_get_eth_ctrl_stats,
>   	.get_rmon_stats                 = hinic3_get_rmon_stats,
>   	.get_pause_stats                = hinic3_get_pause_stats,
> +	.get_coalesce                   = hinic3_get_coalesce,
> +	.set_coalesce                   = hinic3_set_coalesce,
>   };
>   
>   void hinic3_set_ethtool_ops(struct net_device *netdev)

