Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578C62F6587
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210663; cv=none; b=Uq8vM7mvs1lP7fl4IWqJD9WgtmVaSatpz7pfBA7Hqi2RaFwhDR1h56WDgJXpVrTwTYTyqjDSAPNThK9WzNqgQcwAkvl+0MA3lGI98Rxu0PTS4e8OhCJxdIMZS7rPGvAgjYLtXPMuQBE9XBuvWmifL8n/Ewm4IKH7hvoPyeTZVDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210663; c=relaxed/simple;
	bh=h7L02NCKhj3xBvdbazThxW/UbNhBWG7mgjHOiZP/uQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ak+Pi3EKJpAOqtTG1XlOg843Rh/i82F4majbuSqvCtgkgL9Q66oYxt6tk9RPi65SxtjWA8I2heX8JefZ3dAyep5jkz9QZ6H0fHZjSOxk1z6/UqSFY1ONFKG07S3vgd6/0EdLNE3whpMbVDCgHNFPhCdH7paCjfvc5T1IszP27pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9ofd49v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9ofd49v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761210660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ROE/ccH79RMmy4MQqviUfOMK5DGP+wY6fsRipisWpWA=;
	b=V9ofd49vIDuODYvnUquoa+8c2wJHN3ENXVz+GYus08wkXkrFh7MU36BIF9PGA9in0yjXDc
	TRZEMJnH9CHfX9Zd5Uka/2hQYSOXIgNT/Waa9D0lNWXv88YWArSlgFC/4ICLNj0fQZa8V2
	aq8lVE+XXBXussqy12OTLEAOSr5tSQI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-NN6X1NIRNveIliIhWvwmpw-1; Thu, 23 Oct 2025 05:10:58 -0400
X-MC-Unique: NN6X1NIRNveIliIhWvwmpw-1
X-Mimecast-MFC-AGG-ID: NN6X1NIRNveIliIhWvwmpw_1761210657
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4270a61ec48so326975f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 02:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210657; x=1761815457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROE/ccH79RMmy4MQqviUfOMK5DGP+wY6fsRipisWpWA=;
        b=CURmJJ8vM20F5JpnKaFcNVpecvga3NUEV3p7k4KJNsy5ATrzDXtG3kWXit+5+E8tCj
         6tk6bnIcKE4RPP9ljdxMKrG00GpJi0eim8dSIZScq/jwv7q0AaTwWywAbSttASpYvYbb
         m5yLNVB7+LKOYsJehGXpSlvUo9ym4R5XaCha/6d6tfAJs8jRavPWKsHTvxJOue0VQAtN
         RT7QQ6R6cfl6/3bvD8GhjluPw4F1Ao54RnLaj1ypLAycgFf7QYv/mwpZXxawqbdzxg8E
         TJSqstrkbwJyGRp/pfwfhKS0B2cbdL4yR7v/RIk+uF4BO92Tb3vRntH/DvjCGjmjp7G+
         KHAw==
X-Forwarded-Encrypted: i=1; AJvYcCUY7cuApwaAl4n/tcqFDz+xJM4qxwAItOVLqonGNRkk2bCSmy97Imdut32U1RtzRyY/pqRvVZN3mdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyOI/GOEc9+39znTssysLNO1Bzd+OJsleraQgEJnGLQ2JsYSn8
	4JxKdwylslyxWL8bwk0y7ziI1sfuFU7HB10a7T9xOa8o6gScWSlIPC1w8ZTUep94UOgSk3JZijG
	f8eTX5Xt8z7VHVXyFF6FQEMLZiVEvmtmtOtKvkzcm9gyJa6XEGVP17P5p303zgg==
X-Gm-Gg: ASbGncudkRl08vyU02UD7cgXNk8oRImDMtJuH3Jon2m0jsC0D4ShMyZzJBBDnsSDpnX
	Wzth+tA3KWQCqBCdKKYkEEtVpaBX+5z5hlabEK2y0wI2LS/NsEheQw1fDaUvDN53fyc2j4rBbs8
	ZmYmCjaCxbKY/gw/KxA187Nt1nEIA9Tx8vWVzfz5c6qFmLh/sfGPFdlqRtTHWQxP2Go1/JaIwMa
	0Y/D+0LkOTYCJ/s69b9TTgRznB60aIjIW/e4fyB3UPOvSRBdUaKdMLnlUakS3zBIUtf+Y8NLfn2
	Omj8tfks85GIvsZvHMjxGHTriXpa1XncLB78fSIQdnYodxX1tXyc+snjk9VgPDeIFOpKNR9KHr5
	9w+I6BuIX/tti56bmmI+ynlTKVzPhEOFkivtOPO3wwoT6ZPE=
X-Received: by 2002:a05:6000:200f:b0:428:3e7f:88c3 with SMTP id ffacd0b85a97d-4283e7f8a82mr11983236f8f.50.1761210657445;
        Thu, 23 Oct 2025 02:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCfEx1b9tKlEZ2dKO/EQyajgSPLCPbsTOSl19bbcoR7pcI8e+0g2WjWPf6x42kquZpa9VKBw==
X-Received: by 2002:a05:6000:200f:b0:428:3e7f:88c3 with SMTP id ffacd0b85a97d-4283e7f8a82mr11983193f8f.50.1761210656910;
        Thu, 23 Oct 2025 02:10:56 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898eb609sm2920718f8f.40.2025.10.23.02.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 02:10:56 -0700 (PDT)
Message-ID: <ee3d9a4d-641b-413d-997b-3ce37aeb9279@redhat.com>
Date: Thu, 23 Oct 2025 11:10:54 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 2/5] ethtool: netlink: add ETHTOOL_MSG_MSE_GET
 and wire up PHY MSE access
To: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Kory Maincent <kory.maincent@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, Nishanth Menon <nm@ti.com>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 linux-doc@vger.kernel.org, Michal Kubecek <mkubecek@suse.cz>,
 Roan van Dijk <roan@protonic.nl>
References: <20251020103147.2626645-1-o.rempel@pengutronix.de>
 <20251020103147.2626645-3-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251020103147.2626645-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/25 12:31 PM, Oleksij Rempel wrote:
> diff --git a/net/ethtool/mse.c b/net/ethtool/mse.c
> new file mode 100644
> index 000000000000..89365bdb1109
> --- /dev/null
> +++ b/net/ethtool/mse.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/ethtool.h>
> +#include <linux/phy.h>
> +#include <linux/slab.h>
> +
> +#include "netlink.h"
> +#include "common.h"
> +#include "bitset.h"
> +
> +#define PHY_MSE_CHANNEL_COUNT 4
> +
> +struct mse_req_info {
> +	struct ethnl_req_info base;
> +};
> +
> +struct mse_snapshot_entry {
> +	struct phy_mse_snapshot snapshot;
> +	int channel;
> +};
> +
> +struct mse_reply_data {
> +	struct ethnl_reply_data base;
> +	struct phy_mse_capability capability;
> +	struct mse_snapshot_entry *snapshots;
> +	unsigned int num_snapshots;
> +};
> +
> +static inline struct mse_reply_data *
> +mse_repdata(const struct ethnl_reply_data *reply_base)

Please don't use inline in 'c' files, either move to an header or drop
the 'inline' keyword. A few more occurences below.

> +static int mse_get_one_channel(struct phy_device *phydev,
> +			       struct mse_reply_data *data, int channel)
> +{
> +	u32 cap_bit = 0;
> +	int ret;
> +
> +	switch (channel) {
> +	case PHY_MSE_CHANNEL_A:
> +		cap_bit = PHY_MSE_CAP_CHANNEL_A;
> +		break;
> +	case PHY_MSE_CHANNEL_B:
> +		cap_bit = PHY_MSE_CAP_CHANNEL_B;
> +		break;
> +	case PHY_MSE_CHANNEL_C:
> +		cap_bit = PHY_MSE_CAP_CHANNEL_C;
> +		break;
> +	case PHY_MSE_CHANNEL_D:
> +		cap_bit = PHY_MSE_CAP_CHANNEL_D;
> +		break;
> +	case PHY_MSE_CHANNEL_WORST:
> +		cap_bit = PHY_MSE_CAP_WORST_CHANNEL;
> +		break;
> +	case PHY_MSE_CHANNEL_LINK:
> +		cap_bit = PHY_MSE_CAP_LINK;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!(data->capability.supported_caps & cap_bit))
> +		return -EOPNOTSUPP;
> +
> +	data->snapshots = kzalloc(sizeof(*data->snapshots), GFP_KERNEL);
> +	if (!data->snapshots)
> +		return -ENOMEM;
> +
> +	ret = phydev->drv->get_mse_snapshot(phydev, channel,
> +					    &data->snapshots[0].snapshot);
> +	if (ret)
> +		return ret;
> +
> +	data->snapshots[0].channel = channel;

Minor nit: it looks like you could de-dup some code above reusing the
get_snapshot_if_supported() helper. I see the code could end-up
allocating the structure just to free it in case of unsupported channel,
but I think it still would be better.

[...]> +static int mse_fill_reply(struct sk_buff *skb,
> +			  const struct ethnl_req_info *req_base,
> +			  const struct ethnl_reply_data *reply_base)
> +{
> +	const struct mse_reply_data *data = mse_repdata(reply_base);
> +	struct nlattr *cap_nest, *snap_nest;
> +	unsigned int i;
> +	int ret;
> +
> +	cap_nest = nla_nest_start(skb, ETHTOOL_A_MSE_CAPABILITIES);
> +	if (!cap_nest)
> +		return -EMSGSIZE;
> +
> +	if (data->capability.supported_caps & PHY_MSE_CAP_AVG) {
> +		ret = nla_put_uint(skb,
> +				   ETHTOOL_A_MSE_CAPABILITIES_MAX_AVERAGE_MSE,
> +				   data->capability.max_average_mse);
> +		if (ret < 0)
> +			goto nla_put_cap_failure;
> +	}
> +
> +	if (data->capability.supported_caps & (PHY_MSE_CAP_PEAK |
> +					       PHY_MSE_CAP_WORST_PEAK)) {
> +		ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_MAX_PEAK_MSE,
> +				   data->capability.max_peak_mse);
> +		if (ret < 0)
> +			goto nla_put_cap_failure;
> +	}
> +
> +	ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_REFRESH_RATE_PS,
> +			   data->capability.refresh_rate_ps);
> +	if (ret < 0)
> +		goto nla_put_cap_failure;
> +
> +	ret = nla_put_uint(skb, ETHTOOL_A_MSE_CAPABILITIES_NUM_SYMBOLS,
> +			   data->capability.num_symbols);
> +	if (ret < 0)
> +		goto nla_put_cap_failure;
> +
> +	ret = mse_caps_put(skb, ETHTOOL_A_MSE_CAPABILITIES_SUPPORTED_CAPS,
> +			   data->capability.supported_caps,
> +			   req_base->flags & ETHTOOL_FLAG_COMPACT_BITSETS);
> +	if (ret < 0)
> +		goto nla_put_cap_failure;
> +
> +	nla_nest_end(skb, cap_nest);
> +
> +	for (i = 0; i < data->num_snapshots; i++) {
> +		const struct mse_snapshot_entry *s = &data->snapshots[i];
> +		int chan_attr;
> +
> +		switch (s->channel) {
> +		case PHY_MSE_CHANNEL_A:
> +			chan_attr = ETHTOOL_A_MSE_CHANNEL_A;
> +			break;
> +		case PHY_MSE_CHANNEL_B:
> +			chan_attr = ETHTOOL_A_MSE_CHANNEL_B;
> +			break;
> +		case PHY_MSE_CHANNEL_C:
> +			chan_attr = ETHTOOL_A_MSE_CHANNEL_C;
> +			break;
> +		case PHY_MSE_CHANNEL_D:
> +			chan_attr = ETHTOOL_A_MSE_CHANNEL_D;
> +			break;
> +		case PHY_MSE_CHANNEL_WORST:
> +			chan_attr = ETHTOOL_A_MSE_WORST_CHANNEL;
> +			break;
> +		case PHY_MSE_CHANNEL_LINK:
> +			chan_attr = ETHTOOL_A_MSE_LINK;
> +			break;
> +		default:
> +			return -EINVAL;

It looks like the same largish switch is present in
mse_get_one_channel(), I think it would be better to factor it out in a
common helper.

> +		}
> +
> +		snap_nest = nla_nest_start(skb, chan_attr);
> +		if (!snap_nest)
> +			return -EMSGSIZE;
> +
> +		if (data->capability.supported_caps & PHY_MSE_CAP_AVG) {
> +			ret = nla_put_uint(skb,
> +					   ETHTOOL_A_MSE_SNAPSHOT_AVERAGE_MSE,
> +					   s->snapshot.average_mse);
> +			if (ret)
> +				goto nla_put_snap_failure;
> +		}
> +		if (data->capability.supported_caps & PHY_MSE_CAP_PEAK) {
> +			ret = nla_put_uint(skb, ETHTOOL_A_MSE_SNAPSHOT_PEAK_MSE,
> +					   s->snapshot.peak_mse);
> +			if (ret)
> +				goto nla_put_snap_failure;
> +		}
> +		if (data->capability.supported_caps & PHY_MSE_CAP_WORST_PEAK) {
> +			ret = nla_put_uint(skb,
> +					   ETHTOOL_A_MSE_SNAPSHOT_WORST_PEAK_MSE,
> +					   s->snapshot.worst_peak_mse);
> +			if (ret)
> +				goto nla_put_snap_failure;
> +		}
> +
> +		nla_nest_end(skb, snap_nest);
> +	}
> +
> +	return 0;
> +
> +nla_put_cap_failure:
> +	nla_nest_cancel(skb, cap_nest);
> +	return ret;
> +
> +nla_put_snap_failure:
> +	nla_nest_cancel(skb, snap_nest);
> +	return -EMSGSIZE;

Minor: possibly return 'ret' instead? Also you could possibly
consolidate the 2 error path using a single nest variable.

/P

