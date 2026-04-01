Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204F38B7D6
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029951; cv=none; b=RuIvcw59iQUToIJ7Wr3sOSCYqXLGei7mVIbZot48EvfuKGg2pzXbPRqjAChranR1X33EQGfTpwkWxr4k/4itnS+Ge08f2B99zYfym++X0ou/2xw2TsXeBIKDWQlZY+kAz6HQ/VUYJue1jmICQ8W1OhuYeD+qCtoi0Hpz7Y5hfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029951; c=relaxed/simple;
	bh=/xKPjENbw+y9tVTlpGDDqxkzbi3Dsy4WscFa4T8jtsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYIiwhrg0wXiokkEVWhcd6BhjfbHKiO+fmeUiZdHTH4EkgxMyTwHfqQBkDHibZttO0xEaZ5C8ahvnZkSXJe5CSdMSxP/gbxBWTBjc9GuawrY18jsbDTr/O9x+oDkXH58XK6IPSdj3aS8mZd2cujkE9kGjtoT/oBNM/Y2FZNr2eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaet599p; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaet599p"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-128b9b7e3edso4015808c88.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 00:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775029949; x=1775634749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbYMgx5b2U+ll1ogdXc2obIoQ1UDlBi3tYpZOOvXiXo=;
        b=jaet599pinn8AX1lLH+YXciEiYf01PDtI2s79yuc/QsezkS7In7TlJzrQY4gdb5y3z
         xKhDPHjQsQeyBnv3mu1/ugwVdhbAAtKkGd6uoWutjiuyOgVOhhjhxV/gcD0Bmpg5W4ti
         AbJk8b8D9Qrl2tz4fqBFnbvyQmaGrgRPiqLQEjbujP3DHPJr6JAIXBs0DgB5gZhXgDO9
         kQSHZbAl4egfYlL7sz0RmbRO0IbYGJ+qPsdTmdp54Emr5ePl1D7f2Ogir/6yBEeXLl/L
         833FgCKUrepsXAoUyTADLt0LsN4i+pJurSfGOG1QnEcE9eooaHq6nzNF25NY0MuAN91N
         C6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775029949; x=1775634749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbYMgx5b2U+ll1ogdXc2obIoQ1UDlBi3tYpZOOvXiXo=;
        b=UKEd9YoCmBfbpFQO/XubrulohxP1NdSet1TLZxxZtp49hLvzSty/dKpca8xF8we0Pq
         FbsRh8SPhng6ay0kIi6h7AHD911xT6TW1uMAyXesWyYKXBYFapF+PiebS1tvYhC7Jp/X
         tXe531Gqrl+3HhNEijdy+zRXkgD67+xIgqyFa58662ErSz8mpHQX/i0LzQXrdnEPSnHG
         mWipQjnSkDG0Gt+T3bD7we3rJn+4fp+CNLEk/YWJY44bHoxD1mLcLQfpOhMyOe0rdr5A
         vv0OjqGPqoQaUKoPazYHMah8+i3v+N2fTiHu4gc/h2xxnHAgX7s4+dBTRB6d5LDeZPjV
         KFtg==
X-Forwarded-Encrypted: i=1; AJvYcCXTwwGaBBlZXbrYxfbKLUaTU6bX90oD+y/+sU+TDp+8R10iGq/MgxCE1MsEzXU2S9+rSEP31+/7wRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9maY6sLvNwyjWrV0iqaRqkiqcpSCTKpYJBQLbqHtu86/DRDmt
	HZ4qDqv4SNgKVJePg3F/1Y3xDGk8nHH8FkwNLzaKTXpn7VBmGGtJsRFd
X-Gm-Gg: ATEYQzz/XJbgR3u5p1K28o4YJjXseBBrK0NAiYMJXODF4uquU3AlEKqL2UbOfBFDEZZ
	m+Ln0uRfOQnEd25435Ox9f8yLefWYWK0qJwDJNje0ZWYLhBdBx4+dLnusS4S2Z4dIb5sXXEMpZ9
	65PycFNQY98+HI7bVt+TdCokIFx7kY/RGeY8aXv1MjxhBZmiYevBOinapZbRfqPTdzPUsNZhgQc
	uRlUUCXiz60CP7yrtz4JVcrI1vdMQybmQybZpQH4aJRS/+idoYPDlo+jOICSNeOQkj+lvroBXQp
	oZnqjW3SkoOFEGf4i3xFdSrtKV4fUW/E/Te+RBLW9ILavPPbP9bHsauvPkMCY2eBWeFC52G9eye
	wBrkn6qHNyXYFTjcoW4GNw9CTQMUm86OKMtjBN9y/IidVawcnk8rUSbs9mjwgQoyfJ2MZx0um+u
	du5/AQ+z6J/CyVq3ixMjerbgVb3pMV1NWvrtXyIItQ1cJ7+zQclYR0uWM8PkKL
X-Received: by 2002:a05:7022:f10f:b0:119:e569:fbb4 with SMTP id a92af1059eb24-12be65579eemr1471488c88.35.1775029944651;
        Wed, 01 Apr 2026 00:52:24 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21e1::139a? ([2620:10d:c090:400::5:51bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm13149653c88.12.2026.04.01.00.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 00:52:23 -0700 (PDT)
Message-ID: <fb04ebf6-a20b-4570-83ee-f97049033c39@gmail.com>
Date: Wed, 1 Apr 2026 00:52:22 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v03 1/6] hinic3: Add ethtool queue ops
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
 <17b3bbb0c917ee09ddd7a164cdefca6eb63793ec.1774940117.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <17b3bbb0c917ee09ddd7a164cdefca6eb63793ec.1774940117.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


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
> +	err = hinic3_check_ringparam_valid(netdev, ring);
> +	if (err)
> +		return err;
> +
> +	new_sq_depth = 1U << ilog2(ring->tx_pending);
> +	new_rq_depth = 1U << ilog2(ring->rx_pending);
> +	if (new_sq_depth == nic_dev->q_params.sq_depth &&
> +	    new_rq_depth == nic_dev->q_params.rq_depth)
> +		return 0;
> +

So non power of 2 values would trimmed to the nearest power of 2 even 
when the driver support these values. If such values are not supported, 
should these be rejected here? or if we want to force the nearest power 
of 2, should we use NL_SET_ERR_MSG to inform the user about rounding?

> +int
> +hinic3_change_channel_settings(struct net_device *netdev,
> +			       struct hinic3_dyna_txrxq_params *trxq_params)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct hinic3_dyna_qp_params new_qp_params = {};
> +	struct hinic3_dyna_qp_params cur_qp_params = {};
> +	bool need_teardown = false;
> +	unsigned long flags;
> +	int err;
> +
> +	mutex_lock(&nic_dev->channel_cfg_lock);
> +
> +	hinic3_config_num_qps(netdev, trxq_params);
> +
> +	err = hinic3_alloc_channel_resources(netdev, &new_qp_params,
> +					     trxq_params);
> +	if (err) {
> +		netdev_err(netdev, "Failed to alloc channel resources\n");
> +		mutex_unlock(&nic_dev->channel_cfg_lock);
> +		return err;
> +	}
> +
> +	spin_lock_irqsave(&nic_dev->channel_res_lock, flags);
> +	if (!test_and_set_bit(HINIC3_CHANGE_RES_INVALID, &nic_dev->flags))
> +		need_teardown = true;
> +	spin_unlock_irqrestore(&nic_dev->channel_res_lock, flags);
> +
> +	if (need_teardown) {
> +		hinic3_vport_down(netdev);
> +		hinic3_close_channel(netdev);
> +		hinic3_uninit_qps(nic_dev, &cur_qp_params);
> +		hinic3_free_channel_resources(netdev, &cur_qp_params,
> +					      &nic_dev->q_params);
> +	}
> +
> +	if (nic_dev->num_qp_irq > trxq_params->num_qps)
> +		hinic3_qp_irq_change(netdev, trxq_params->num_qps);
> +
> +	spin_lock_irqsave(&nic_dev->channel_res_lock, flags);
> +	nic_dev->q_params = *trxq_params;

[1] Here we are overwriting the old parameters
> +	spin_unlock_irqrestore(&nic_dev->channel_res_lock, flags);
> +
> +	hinic3_init_qps(nic_dev, &new_qp_params);
> +
> +	err = hinic3_open_channel(netdev);
> +	if (err)
> +		goto err_uninit_qps;
> +
> +	err = hinic3_vport_up(netdev);
> +	if (err)
> +		goto err_close_channel;
> +
> +	spin_lock_irqsave(&nic_dev->channel_res_lock, flags);
> +	clear_bit(HINIC3_CHANGE_RES_INVALID, &nic_dev->flags);
> +	spin_unlock_irqrestore(&nic_dev->channel_res_lock, flags);
> +
> +	mutex_unlock(&nic_dev->channel_cfg_lock);
> +
> +	return 0;
> +
> +err_close_channel:
> +	hinic3_close_channel(netdev);
> +err_uninit_qps:
> +	spin_lock_irqsave(&nic_dev->channel_res_lock, flags);
> +	memset(&nic_dev->q_params, 0, sizeof(nic_dev->q_params));

Looks like we are asking for trouble here. The old parameters were 
already overwritten at [1] and now we are destroying the new ones?

> +	spin_unlock_irqrestore(&nic_dev->channel_res_lock, flags);
> +
> +	hinic3_uninit_qps(nic_dev, &new_qp_params);
> +	hinic3_free_channel_resources(netdev, &new_qp_params, trxq_params);
> +
> +	mutex_unlock(&nic_dev->channel_cfg_lock);
> +
> +	return err;
> +}
> +
