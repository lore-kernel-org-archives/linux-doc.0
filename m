Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1936C39EF2E
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 05:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780032621; cv=none; b=tYu6dCpEiR4d+RErZv1TzrvCmyw1VVJGobmanAOTOq0JwrUUVzvRFMes43ovw/dfc0KoViC1jMveGhDM/GJDRLtwezs9vs9dIQFnXZyvi+9UlYGyAz6xvs99oga9A0MAGa9eukt/+trguR3L5CBsV+79ar+eVoz64sgxOgFEZto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780032621; c=relaxed/simple;
	bh=jQRuadW4ipCNWKXC6bZwaj6vtlzEjMOxMjmPAtj9zUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXi2yT8Df4Wk6DFL3aabQ7UQl/ruWmm0O+u/AMfv7Ap2pqKHRLs0xF8+RgA8/IAU7UPvRD7Ox0HE6D22pL8AnwmeYWa9pmqE+llmpRDEHosMqK6toceXi3BHVNZbhPtiUmAkEiHhI2ZecD+2L8ukdGqDpmvurenaoZsrD/LlTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lflhx9Vn; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lflhx9Vn"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1353c2f35cfso6300577c88.1
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 22:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780032619; x=1780637419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOhAPE7Hmb6u6mGyw2ElJiYEhXMYwY57RoxbsdcyxYg=;
        b=lflhx9VnYMR3FDgCDrvLS7zDxs2N8/swwMoIz76FjlXPPWneBLvcXtbOQvvL8LVooc
         J8yWYEWqO4G6pyWsed61FzBl30WdHmP0yHB0LX+eXXVxZ/nU7Y5SYWCZu7BmhlOt+/tZ
         NdcEDXiPK8YN3DaoeqP3Yh0dD49XpY3el5EKLWz+RiX8TtK7MIxjk+6gVMOLWamSCabk
         JWO/x+q5cAQ7qhM/GYaUqZUTnqC0J59X0e8rkbn3g1sidId122LK8Iz/O6xOympxi+LT
         Sv85ttDchkpnxw9RpPKDa1mpRRxlQbImsB9sk3F53tQeTR3bNz4B1ClwvZ3hnHhMm1p5
         NmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780032619; x=1780637419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOhAPE7Hmb6u6mGyw2ElJiYEhXMYwY57RoxbsdcyxYg=;
        b=m3nsqsBawniAHjf5jTGtTLGa7xZRmS73S7hxdMS9gehVcnpwKV4yeVvjFOwqPm0MAq
         kjqcLbK1YQXv6WrCB3mXGv8VUaWp63T1CSy3NYwVw635/cWBP/qRz7H3JGnLQSCoKVmz
         9XQ1vXaDMOrJdRf1AoZgwzvFPxRm1YOnxDzp8nTNyVWWQURuAM/6qZ3aCN4TREPFZukT
         vrte9kofI+TYWY100IyQ3H5A+0L/5753MIBtPrAz6JJ12xLJIGPEpv3VY5clcS+1e42N
         f/e+W0EE6qkRzjmTK1ra3hin1I3xd0Imw/B4J1MJwBy9jsH7i4hJ0SMCf3M/INHQfYx0
         BegA==
X-Forwarded-Encrypted: i=1; AFNElJ/44ylLOnLeZg6RYyhUoaoH0ra4pLQ/wHyuFzfmS/yIBiA9uZF211/Z7rnCgZbKhi8AbMaEW9r5lZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt/3VhkiX0Tq1HqvZ5hJJgLwsByjaNJqtbITdxOEu07UERq+Hr
	HHqe9gtk1hqQwz9yiBWZrWWtBQxhyYFZrn2n7MEBPV3LKQDAMVY6fzr5
X-Gm-Gg: Acq92OH5a1R8jC9C4tdOvjnkUBm2v20PUrJ/5vPbIXrWBm4JPYx4Gd2Wm+eTi+yN7ZS
	6blVosaZJd19Ro4OTai8zPn5rlzkUJwvCUbHZ0yj2Aws/5fbIfuxOdmzixuK+rhPb387fpzd1zb
	8cWd0qK4E8+8mYUJSvLOgoB6dnxWYsyDDhfdXCKSTVaIHYXntg6uAcTVZagd59OL8/wanklJe+U
	sZ/AEIH3vkM1mSf7DEFDZJgUb7lPAdsHXPZOLwg41yX0PEncqHGyLCugHG+D155DqRTzVfJQ6JE
	BnWWo8J8JYa5jGeQRWjPNyY63ZZPE7Elz4xJY3EGYgkLOwPM9RfcHzb1EQTs1s5PZM1YF2tNxfq
	UvEaWSH1wHA+WzbvAqMMrQoIoHTC1H7Adhr3rYUaLoEbJy6+7EARfazJ5GhNNo1fo4s9vCvXhyH
	92Pf5qp0d71RYet3vDM3n1m4oNnW71Bg4MA8rYm6yEudc2F3X60uNfF9VdRkgbXVvwRw==
X-Received: by 2002:a05:7022:f84:b0:137:699d:7b95 with SMTP id a92af1059eb24-137af647ee5mr582575c88.19.1780032618982;
        Thu, 28 May 2026 22:30:18 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21c8::1024? ([2620:10d:c090:400::5:c891])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c7e4ebsm598300c88.12.2026.05.28.22.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 22:30:18 -0700 (PDT)
Message-ID: <e282d783-3d91-493d-99f6-09464df26c60@gmail.com>
Date: Fri, 29 May 2026 10:30:03 +0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v07 1/6] hinic3: Add ethtool queue ops
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
References: <cover.1779940072.git.zhuyikai1@h-partners.com>
 <1323cad7ba784efa29a3fd1475b744974e0a0cf5.1779940072.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <1323cad7ba784efa29a3fd1475b744974e0a0cf5.1779940072.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


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
> +	if (!test_and_set_bit(HINIC3_CHANGE_RES_INVALID, &nic_dev->flags)) {
> +		hinic3_vport_down(netdev);
> +		hinic3_close_channel(netdev);
> +		hinic3_get_cur_qps(nic_dev, &cur_qp_params);
> +	}
> +
> +	hinic3_init_qps(nic_dev, &new_qp_params);
> +
> +	err = hinic3_prepare_channel(netdev, trxq_params);
> +	if (err)
> +		goto err_uninit_qps;

It may just be me, but looks like a failure here is not restoring the 
old state. You are correctly getting the new resources and freeing them, 
but don't you think a call to hinic3_init_qps() is needed here with 
older config?

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
> +	clear_bit(HINIC3_CHANGE_RES_INVALID, &nic_dev->flags);
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
> +err_uninit_qps:
> +	hinic3_get_cur_qps(nic_dev, &new_qp_params);
> +	hinic3_free_channel_resources(netdev, &new_qp_params, trxq_params);
> +
> +	return err;
> +}
> +

