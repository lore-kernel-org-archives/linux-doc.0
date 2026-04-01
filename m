Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC1B36AB61
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775030014; cv=none; b=XeqS/qG4aP3t+p5VeO46B2D9eGeptxOrltzkcDq6Zc0s4L5bUseJfuP3Y+xD6JqB0aK9VEk69NEoA+k08+9m0xBM/o4K9x0wwlFvs/65UUDMs9QST0tYY/56QICZolsL0XJpEhkWZ2YGezjqGRJ+3Ybjqxf1XEGAQz6hbkAypB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775030014; c=relaxed/simple;
	bh=Iw8UWtcVlc0hciFLFi9H4GtBrzJdZOWJyX4eXzCH07o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eO1Cqy1VEnzIvNE62sLPMfXiuYkcrftRdqVfwsoa7OkCFYis/WWsC1YUBF0uIJQb1Hl1/Jf88uPnAprWIGgagUtZ7D/tKEuA4H+cXJXu0NsBe699YcICCcEif3USbtUfSrP9JI7/gVHJvFRmaA15bwnc1NFOUiNQ+Ayo3qD9ovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svVPWyuY; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svVPWyuY"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b6b0500e06so8878302eec.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 00:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775030012; x=1775634812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYAA012nkWBP0515TOKa+rT4aCB7eVy71smoodsA2VY=;
        b=svVPWyuYSpuum/KP5FjKlYhoHLL8h4QQ7QUUltlQV/iB6zHUvxlosKFOTt+GfOgzUL
         wiwKAmTPq5zKmq3BP60mXRMR6ok7gnzzD5HkgiOHoCiHtnzdeAsCXZNC8I84h++GVjqg
         uU8cdz7Qusbd9Pi+1Tfh+DAbwmy1OTxL7yezLcGfM1iJ7fU+ollVEdhZgDKTuak2hSiE
         mXFys+zhYIOuTjxItFNJ6vCpDrF/qQga2/MmC5BW33nVdel0T1rocSppfvcja7GCML0y
         7PCtmRYYCbWVxAYKvwbXavNOmLscPtepOGc/dL395cQIXzIZEitHrkx3SxfjYknOYENV
         isUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775030012; x=1775634812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYAA012nkWBP0515TOKa+rT4aCB7eVy71smoodsA2VY=;
        b=JuSWsJpV7iW2hOcUVgbxNpeYm0hm3+kYwNzcaW/srT7M7xV27QO9c9nAxTbtWQwg9v
         YU99jXTl/8wXeAuKQ03N4gzdNp58VHR1cZOj7cBMVdBa6YkPBufyXHb0k7F/WLFSEcm6
         k+ydpUZYaO5I7XekVmE+ePGME5cIyOVhz6OGrRl9t2Q8cdNZmp9RiZ9xCcAwYsIurfSQ
         TKxfagIEau2dX1q4kAFuZkLvjHVPYAbJTPQ46Iwvz216OgWQ0uvpwEH6XfaEh2xVpbDS
         3wNalak2v5HarvkP8c3e6ysQAkeeoIIu5zDopmFn9KTPKwBoK/WkqMgTUoydAEaStxLE
         CO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT8sp/1wf+itQl/7fRBPl3EhkyuxPTiCVd4WC6+PtkyN4M50ETRCWLhau1VbCOIGCSuUA4UEMDWPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy50lB1bp2zt9QqpctlAI32y+BBGYNh/8rKn+5GVsFjKq1yXUGZ
	5WP7KrJyTyrru2VVoGB779rfdJiab9hE6K5aV2EPSU1X/y0Ma+aI4NNC
X-Gm-Gg: ATEYQzxxkF8cVWAfDvIaxegboTIcDzxG0P08b89rogQVf0+JcJZZz0KW9D3qSopELYS
	3coCRmTlFiOA6r8i4c3PoU22geZPAZE+Yg8kHeaihLLn92bTv3NXnLo+lxJKIJeC3/o99Ua8CUQ
	dZpkkHnLMMrzB9FKtY8l6Tp6QCqnUxdnTdvU78cQBjhmNA4NZJFPKJniwns2Uho7RX4pCcjXF0f
	doWTxN8LEt7ulIkdVKQQR0PGrfVM5iU2BPAb6JiFvrpPzL+H/4O99zZEgcuFD7Cb4SbgzXgy/Fx
	eTyvWAks3Ym3UBViSdVgPoUMwcFy0PqzSugPvh0fFlD+kTCWBNqHi9WFhxWkGSjbVpFle4TLoL/
	CcQnWT37MvdQobivXxvGv6U6+uMAbkHBkzFTxmlO94EjBILJdMFvdhRbvFSjjnqe4naIGAmt6mX
	/pQMtXQtGXYrsO4TnpUMrLHzJVEgtnZtXRRjB07po3FR3W4etAtOtzC1TvFbxc
X-Received: by 2002:a05:7300:6d1f:b0:2be:833c:149d with SMTP id 5a478bee46e88-2c9325b4835mr1497608eec.28.1775030011765;
        Wed, 01 Apr 2026 00:53:31 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21e1::139a? ([2620:10d:c090:400::5:51bb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c4cbbc1fsm11662388eec.13.2026.04.01.00.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 00:53:31 -0700 (PDT)
Message-ID: <3b252b2b-6be7-4a8d-9782-39695e948635@gmail.com>
Date: Wed, 1 Apr 2026 00:53:30 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v03 4/6] hinic3: Add ethtool rss ops
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
 <a8347921a7ac11ca7e0db52381be70689b830005.1774940117.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <a8347921a7ac11ca7e0db52381be70689b830005.1774940117.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>   /* hilink mac group command */
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> index 25db74d8c7dd..1c8aea9d8887 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
> @@ -155,7 +155,7 @@ static int hinic3_set_rss_type(struct hinic3_hwdev *hwdev,
>   				       L2NIC_CMD_SET_RSS_CTX_TBL, &msg_params);
>   
>   	if (ctx_tbl.msg_head.status == MGMT_STATUS_CMD_UNSUPPORTED) {
> -		return MGMT_STATUS_CMD_UNSUPPORTED;
> +		return -EOPNOTSUPP;

Looks like an unrelated change?

>   	} else if (err || ctx_tbl.msg_head.status) {
>   		dev_err(hwdev->dev, "mgmt Failed to set rss context offload, err: %d, status: 0x%x\n",
>   			err, ctx_tbl.msg_head.status);
> @@ -165,6 +165,39 @@ static int hinic3_set_rss_type(struct hinic3_hwdev *hwdev,
>   	return 0;
>   }
>   



> +static int hinic3_set_rss_hash_opts(struct net_device *netdev,
> +				    struct ethtool_rxnfc *cmd)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct hinic3_rss_type *rss_type;
> +	int err;
> +
> +	rss_type = &nic_dev->rss_type;
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
> +	err = hinic3_get_rss_type(nic_dev->hwdev, rss_type);
> +	if (err) {
> +		netdev_err(netdev, "Failed to get rss type\n");
> +		return err;
> +	}
> +
> +	err = hinic3_update_rss_hash_opts(netdev, cmd, rss_type);
> +	if (err)
> +		return err;
> +
> +	err = hinic3_set_rss_type(nic_dev->hwdev, *rss_type);

So if we fail here, we have already modified the rss_type in-place. From 
this on-wards, the HW state would diverge from in-memory state. How 
about use a local copy and only update if no error?

> +	if (err) {
> +		netdev_err(netdev, "Failed to set rss type\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
