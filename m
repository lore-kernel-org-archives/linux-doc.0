Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50D31326C
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029970; cv=none; b=UZAohUmp8PFY0gxF9Cp12wVZ8+aG+NQGdz0u+x1EuHYi4VaKTFSKMDlQMXU2KnMRofBWVloc2KOiZbN8Z0fJ6awx5e+RGp5YD5zFJ2vIUzi1Ea7ZTP95tcKBzZKkuJ21nl4/Atqdb2Y2g7W6gfLvV/M8qxQImncUjSSgGafArNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029970; c=relaxed/simple;
	bh=MCy1eat1Yj7/z8JAKeNn8agQhBiPTnEO0lLEsh8d608=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j247r6BDEH2+9tMw0TKZTHLK8x8QuKjycVkq7nYE2mvH7AKwPPHAlCDEn0icTzJ8AvKSGGQRggjNEc/Pjv3wyTGrE+OW/BL9vXTfxNcG7roJVuTua0hXB1tMRTbAGclaYDWwIdwlogT265+svgeZglRmy2eTDx2EHnQ/D8SDcBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8ZIa01F; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8ZIa01F"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1271257ae53so6751020c88.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 00:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775029968; x=1775634768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cR1hXVaS01Di+TUyEuYwM6QysYHoAzLWu2PSOV8Pv68=;
        b=A8ZIa01FMl8OoUOXYZojhmsjNHj9KVxUVUU4cxYaCcK6jSEDR7H4Hf+/MHBy9xDSkG
         sY9GCSh0kA7NWz1tZ7VqFI3UV0F79v0YiydVO3yCxd/nIhE6Z3FZN2MUXc0o2zidqB7i
         4jlt+lRnNMiwmG+AYKkjNl7Jh067cIZgNyD2tANE5T9yrIIoByLI85maoSpL6wxakbuR
         M8G1yve3DET6GfPTxBqT639zRGiQSzFrRKa97KPjbrftzJ/P9f+Ina/fymW1PLMuePgZ
         fFtE9KKWKLYESKEV6Cy/qLAr8xEybcyM4IZrsp3JwCCJ9zj+2WZqSXdpT0BfqefmRIOS
         hBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775029968; x=1775634768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR1hXVaS01Di+TUyEuYwM6QysYHoAzLWu2PSOV8Pv68=;
        b=Fn7KyccIQCOV7Hzn61GhpXuG1CBVHWCpSs8AyV2KYonOzdCmqr3u1SPQiqgWtduC0E
         1YkufUaBHdZR4MlouVzBJDcNx2uXNaazmiuHWCiocrwrRNqLqGmXWrm+bu68Zftvoe4k
         7uNwcRHKOYZF6mXxoQN/vGyF/NEzRu2Nuq0lanoI5+LE7FTHyP+S9Uwh2dxkbFHpo6yR
         dngLi1MAwi78anAKjFGKgw0kaFeUyie33AjK9LClWGDGbrBeAAQQ9tmcZJHDhiEJPwnb
         2wkLMLi5cA02UnFrkMS8D0nxnkADbSgrj+dkpI51FxmXt8poxsMdV1P0CA2NTHut6rmD
         Ntcg==
X-Forwarded-Encrypted: i=1; AJvYcCVB4BIkzc7o/YOPD2DJpSaud+QmgTkkp83Nq2QJ3PcbpG8mqkQmpbAnREyslGzuoe0q1YPh+GISpNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqcKC+RYKV7UVSbHhR5b2/ZXXlESGhufbZX1nrVJiBEqDT4zww
	uPXZnphDOjITe29HnsgkzR8qA1qNXWOlir9nhHPMc9hKxjAFKBoqtA8Z
X-Gm-Gg: ATEYQzwGMM3rKkrlx7wWlTZwyRgul1rXZa/qbU6u29xazlVg6vuqYe7+14UlhGGrGf/
	rOtdRDOBEk842QtPE4whyuzBkRb6pvvco+sEwuPFTwk0XQP5DWsoDyBm7VVM5FUguY4IWwPhGuw
	UOGMy/t0wBJGBIwvJH761TXkdDy0Ge+swNgpj/IPYI8uRjrrh0sDFnXUI1t8IHv9GQpE1UF10Pz
	N/MPy/7BRsI4hXbRuqalVQEW8Flrn4No0Ppbf7rDvgf9OLa19HsaipJOUTbMHg580d5dmzITTZx
	qKDlPdd+A8wrmpxJZAzRZdpyims/5ZVmYUbQwYW/iuyAbXOMAEbr8HW+9GhXS6RR4NuvvR5qRct
	owIRlaJYWQlYOhP8RspgxeG8RbMLGWEBeSrMmWVVavjP8qeehjBVWB/JcVoScWBxTbdci+a6sCQ
	B+qc4xLudy8ohDkvSpDiz0qJwW3ZIZpNPVUDpORpO179S/J5C/PaBOmFvnYKjuMXhrvFv0DTo=
X-Received: by 2002:a05:7300:dc8c:b0:2c8:bf0d:74f4 with SMTP id 5a478bee46e88-2c930e6bd08mr1424462eec.5.1775029968395;
        Wed, 01 Apr 2026 00:52:48 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21e1::139a? ([2620:10d:c090:400::5:51bb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b399bsm11813869eec.17.2026.04.01.00.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 00:52:48 -0700 (PDT)
Message-ID: <65447c62-fa65-456e-9f6c-11588b46d8ac@gmail.com>
Date: Wed, 1 Apr 2026 00:52:46 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v03 2/6] hinic3: Add ethtool statistic ops
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
 <d3256c3049445bfa9c6b98832d25eaa712422ae6.1774940117.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <d3256c3049445bfa9c6b98832d25eaa712422ae6.1774940117.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> +
> +static void hinic3_get_qp_stats_strings(const struct net_device *netdev,

Any strong reason to add const here? netdev_priv() would just strip it 
anyway. No?

> +					char *p)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	u8 *data = p;
> +	u16 i, j;
> +
> +	for (i = 0; i < nic_dev->q_params.num_qps; i++) {
> +		for (j = 0; j < ARRAY_SIZE(hinic3_tx_queue_stats); j++)
> +			ethtool_sprintf(&data,
> +					hinic3_tx_queue_stats[j].name, i);
> +	}
> +
> +	for (i = 0; i < nic_dev->q_params.num_qps; i++) {
> +		for (j = 0; j < ARRAY_SIZE(hinic3_rx_queue_stats); j++)
> +			ethtool_sprintf(&data,
> +					hinic3_rx_queue_stats[j].name, i);
> +	}
> +}
> +

