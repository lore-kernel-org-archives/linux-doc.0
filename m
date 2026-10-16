Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999DE457E47
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 23:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194779; cv=none; b=YsQKMB2vees5vSHIuyU73oXgoInWyal+W2bWWy39EOeSB9TM07UxNTt0bah62QO/nsygckB52IlCM70Y/76MrCBekZEpy/J8wFFYvaD+cGBKYnCvLAepHBuZKTR5DbzhY943O1AlZQ50d4g2M91T8JyLjaJyJhkBVYZasteY4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194779; c=relaxed/simple;
	bh=meA6MsQGL4r+3NWB8mPcZgx3ZsEQbioVKTri4hnL4O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9pxEbNIr4+GWtSmsaycaogkB5FUVbIlk5WMohgtTAyY7bfQYLvATWQFYJFBuq+fgEI+onn5bAhw/27NkBXIQiqosT1Gxtgb9BP3FCnEt+6qd+DyacLnJTdzEi9sg1Cr/0aeZ+upAGXTzVO94T4ikCKALvWOsCM5Ubf/EwqcjZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPe5AK6Q; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPe5AK6Q"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f1f76ea84so675908eec.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 16:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792194776; x=1792799576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJzMPP3FpZ1Vumfeo71j9PoiRQb0nGjd9sFzsJIM0NY=;
        b=GPe5AK6QjV3Cnc+Y5GEwsyK7FawTgaK0F/bNA0PT0XOfvjfWBB3qq8WBi029HFkRVD
         cD5J68YMSeU2rWI13hOSoSo7ezB/tAchX9TQNez1ktgdBZFagCeuLfNLA0V7Hf2Oi8i0
         +27WLU1EXX6slI4CSysQ8qZS5aOKi/z4Q8+KfTh4HEWf6W5kOlGjU7VGPgWg4qSOQuPe
         UNTvvJfVWNLFgLk/qwrIPt+HnTUgRAILOrQDa8I2RU+utp+zPw4bnTgDLQGtBVQ1Yxuz
         mJGRRC7bNxFQ/s9evc++PyEE3CJzV0OxvEwonmNH5hLeo+lhq25kNe/zH6ioArxiTmgR
         c2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194776; x=1792799576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJzMPP3FpZ1Vumfeo71j9PoiRQb0nGjd9sFzsJIM0NY=;
        b=NlYwy8co5hsAuFR9aWJsmI7Nfn1+BfhZe1zGh063vrsM8ds2thpEm4b9YU41a0iOLE
         mX51IneTu8WFbVG7KOYH3WB6xZO43CMCMuG3xZ6Tdc/mqTwwbJMWac2hHQGbrCxxxcV1
         V2+ybxUe5CebdvUXySinctcFvBevsdMupzI3uEV0m9F1qk4m5qsmPrCNGjs/1Xnvp8Ka
         GpqSrGTp98oJ2SGr1TQ7/64oPH4UNL/EmWRhrIG9PLMwKYqunWY2ST4PMBO7CA0kxMjR
         J8aLiRbz+fyq4seny+VtB9kfq4R9H9vjvujWPUMzgsc/XrRG44KxAQEbapyHN0rqByC+
         RVSg==
X-Forwarded-Encrypted: i=1; AKwUvByQn+e2M9E05LvDAZQWRxICKb9I4vtCtGslTwz4+m7toxO2BWLzHxpy1wP6iJ2S4j1MlElcwxDxE+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4V2C3mkksIUQ2ZiSxpom3L9pdgBs8Ef6hOKgX6Ztlu/0TtexQ
	aeVxG0BZqYqxt1nb5hez8ZoekDtFjK9NSv6npx5n6E3//9mN9a224rxU
X-Gm-Gg: AYBFou0kPsT+Zn39ELR7sk3xI6yoAhvseReEzzwihZx1Z746XFme8tfP2NLFgselpGm
	nkR60FsTa4AaC017uOPcrCnTU///AoAIOkE+9vLe9/WWOj0p96Z/gdGTgmY/5jSZzvMR43YOyek
	bCOzcklePaVvG/BtDkG78HQGLp0+FyWftdlT1v6x5EEIzUmMFrdDHp2IrbQgFTXi3QUu7JynyaW
	n882ca7BKsgDAnOf4b5eg0YsBob2GcsZn6M8EotgX96oh+yXKtWSo2SliVVPXvDFNd3xIXbzLq6
	AF4IJdtAwjUhyk9DM3WCcrSwunaUoQrKiXqHxpwwZV3gYRHEPRO9GKGRGJHAjxzDQot5rniaWR3
	VADALVkSdHLkWkKkjwbel24qSN7QJTx/hGwoes7LzeG4mUeYA8Ss7AiU1IyKxLKKUe7buv4LCI5
	CNj+ZO36Ng/rWqTIVLvzZ+Ndrplp0BJIM9ZAJXf6klPTvXYqDMc1diXJi5XXbDMpn78ESdDgZZB
	JFdgB9gBEDhk9jgd3HRzQdmbKdUt7MwA7fcPEGez9ZuQbq8eyPb9oU38+GDQEQHOpM=
X-Received: by 2002:a05:7301:2710:b0:360:b8b4:840a with SMTP id 5a478bee46e88-361a2747820mr1915199eec.39.1792194775702;
        Fri, 16 Oct 2026 16:52:55 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::7:ec14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm9181665eec.26.2026.10.16.16.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 16:52:54 -0700 (PDT)
Message-ID: <a0eb0511-fe0f-419c-adec-159dc16913ae@gmail.com>
Date: Fri, 16 Oct 2026 16:52:50 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 1/2] hinic3: Add ethtool statistic ops part1
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>,
 Teng Peisen <tengpeisen@huawei.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Mohsin Bashir <mohsin.bashr@gmail.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>
References: <cover.1792149958.git.gongfan1@huawei.com>
 <3cda990995ccb002019f147b7a0c004c542229aa.1792149958.git.gongfan1@huawei.com>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <3cda990995ccb002019f147b7a0c004c542229aa.1792149958.git.gongfan1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/16/26 4:13 AM, Fan Gong wrote:
> This commit adds per-queue TX/RX software counters and firmware-backed
> vport and physical port statistics to the hinic3 driver. It implements
> the .get_strings, .get_sset_count and .get_ethtool_stats callbacks so
> these can be read with ethtool -S, and adds packet/byte accounting to
> the RX and TX hot paths.
> 
> Co-developed-by: Wu Di <wudi234@huawei.com>
> Signed-off-by: Wu Di <wudi234@huawei.com>
> Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>  .../ethernet/huawei/hinic3/hinic3_ethtool.c   | 294 ++++++++++++++++++
>  .../ethernet/huawei/hinic3/hinic3_hw_intf.h   |  11 +
>  .../huawei/hinic3/hinic3_mgmt_interface.h     |  37 +++
>  .../ethernet/huawei/hinic3/hinic3_nic_cfg.c   |  64 ++++
>  .../ethernet/huawei/hinic3/hinic3_nic_cfg.h   | 108 +++++++
>  .../net/ethernet/huawei/hinic3/hinic3_rx.c    |  64 +++-
>  .../net/ethernet/huawei/hinic3/hinic3_rx.h    |   8 +-
>  .../net/ethernet/huawei/hinic3/hinic3_tx.c    |  70 ++++-
>  .../net/ethernet/huawei/hinic3/hinic3_tx.h    |   5 +-
>  9 files changed, 649 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> index 90fc16288de9..bb6094d61196 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c
> @@ -13,8 +13,11 @@

[...]
> +static u16 hinic3_get_hw_stats_strings(struct hinic3_nic_dev *nic_dev, char *p)
> +{
> +	u16 i, cnt = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(hinic3_function_stats); i++) {
> +		memcpy(p, hinic3_function_stats[i].name, ETH_GSTRING_LEN);
> +		p += ETH_GSTRING_LEN;
> +		cnt++;
> +	}

Do you need to manually add/track the offset? Couldn't you let
ethtool_puts()/ethtool_sprintf() do the hard work?

> +
> +	if (!HINIC3_IS_VF(nic_dev->hwdev)) {
> +		for (i = 0; i < ARRAY_SIZE(hinic3_port_stats); i++) {
> +			memcpy(p, hinic3_port_stats[i].name, ETH_GSTRING_LEN);
> +			p += ETH_GSTRING_LEN;
> +			cnt++;
> +		}
> +	}
> +
> +	return cnt;
> +}
> +
> +static void hinic3_get_qp_stats_strings(struct hinic3_nic_dev *nic_dev, char *p)
> +{
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
> +static void hinic3_get_strings(struct net_device *netdev,
> +			       u32 stringset, u8 *data)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	char *p = (char *)data;

What's the purpose of casting here and throughout the patch?

> +	u16 offset;
> +
> +	switch (stringset) {
> +	case ETH_SS_STATS:
> +		offset = hinic3_get_hw_stats_strings(nic_dev, p);
> +		hinic3_get_qp_stats_strings(nic_dev,
> +					    p + offset * ETH_GSTRING_LEN);
> +
> +		break;
[...]
