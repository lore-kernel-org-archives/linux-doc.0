Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195D53806CC
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934875; cv=none; b=hKUnwoUXWv+lFgCB7J6nRRXzx8bMwk2qiBIiajN8Grw0SenxPbFykPbbAIxOJo3xY5FFH9Gh+SCfZJj+p8VI0M3DDhB+QGHcByWLogxzJa7NDO+TYhGH6JkGEWLWssEF7ydx1KdX52FwX0W+xjxKqTSdQDNOx8q3IvusU8JzX9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934875; c=relaxed/simple;
	bh=qVcOp5MnvlONbLG06msjRU6TJXzRsaX/t8tfbP70eys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NC0RbgOtq+s2Pd1Xccnfe41R35ZmpEh//56v1zaqndVhfDkqcu8etHR1t2kw6I0PVXTGl7wnp1lwBGiDTFZLN1zbLZ4ocqAwc+ljycpRO0z+PngM31Ib9JidX8M58T+vHlRY057t6S+EVU9gje2LXbPCDUWLpND5m792SgMi1N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGyJgCop; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGyJgCop"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b90bb0e8376so244493266b.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 04:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771934872; x=1772539672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZ4fv5w72iR4alZnfS3RK7xFl8sWnyZEZWYM2yXruBI=;
        b=KGyJgCopVSkGz5uG7FPz9svzvU/lkisutmbspXBq93w2iRcvUaAJ20cOjCUVkxGwTq
         +JkwHR6G5sEDC9hGh4FLtzSA/DYZLxG0wTE40azPBr80Y02HnD1Nv89wpa80cbpRMKsi
         erLBRpZ39SkSKAf1HVsFOFdYKl1afBRFgo6BHK0Dde/edi+3yBjt4S0WY/LCgaz82VLt
         5FC2OaGr4NlC4lsBeNM+RfkR5GKuzuNvMRb7h3pMVWJzCP9HIyFvX+ziJz4I/nMLq1jZ
         LnG+wddK3VsU40pYRAnLCe5pvUDgCxvvE+mj4dn9TR+nUyJ4ecRGMVYmRB/7qtOCQB+8
         MLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771934872; x=1772539672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZ4fv5w72iR4alZnfS3RK7xFl8sWnyZEZWYM2yXruBI=;
        b=tIXo0ndyurjnPR88m28XTyg3yjUE8y+m2c9WlMxBL2RIC/QTGPRJJDCpvIn0of2v3R
         YWR1JhNemjlSdZK8oQ4fO1qGz1UmTaeGGSn4QIS7HehEk6MCtLdcnWNZbqpdQ6qEXSvV
         8ybWRgK9ibDCCoTy2nq/SfV7ElpdfMQwFYaGPcQHfnfnrkOCt3b2rgOjJm/aweNjnch6
         mfibgV9DYq9sjsQuaJw2WT51egG4PpzlYUCtR7q5/EwOw0oCNElaFUVwWp/Q6XwqjVQ9
         QodD0Kz7E9rH4jFQpnkWThk018vNVq/Pb3Dl/SFwkD7qIIGwFcD8y/UfGP31Xe2hcE6K
         /5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU4lScxsv9gS3u3T5ajLU6jAgbCVIr0jzd4NPoCD+1yKQcYmQp6iPf8F6N1A1thpdrb2nwBuwAFzsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSygI/v2dLcJsl4YeJ+Cbk0aGU9Mo6iDOz21Cf0/WbYP6SPsOL
	YLsCqVeo7A1U/RIir+/Kqtq8nN8RTmBWnrGSmqM+knyNC7JkJ6MGiRwU
X-Gm-Gg: ATEYQzyx2QZqW2/vEZAxKUnW4vpIBlLpcB1SxsRb+JB/wVpyl3WHM+lfFdXFbgFUvJq
	tjthf9Zoe8xXRVe6VZ14zSYZxd2eC8j8xPbSMipPfTDFw1/wDluAeC6u4R6E6tkl2gt6FjfiDzO
	fDro7sm5j+bJpTj40mrCGvxBrfxSxGY+E2MXDGiWiR7sStJEsULgrDE5cvVghbeAjLK3XOYGC5V
	83ZqJctvAGcgjE/6VTg8joI7ox3Pe9sGYyoVDe1hmcdveXC5DPHk/otAAcLa4dQ/F1hTcLLeXxp
	j/InQzKd1iSehLGGKCNKSwiekuwT9rWmyDQwsnRAL1OJSY1Ekwz40iKXkMp4Wb9vtlvyQ3Gar03
	ATWEG3Ol24eeipXkIqjib7/Krgl0Q5pyvF/uytXvSByNTDIfxHoXRNUW/Dtj4yO4KyBXXWac1YG
	net+uTlrDpSuRsPHdUVvdODXZ3SYLiPEoVtUQeSFvElUJi8HA=
X-Received: by 2002:adf:e3c3:0:b0:439:8bb9:db03 with SMTP id ffacd0b85a97d-4398bb9dedemr632589f8f.3.1771928510821;
        Tue, 24 Feb 2026 02:21:50 -0800 (PST)
Received: from [10.221.199.249] ([165.85.126.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm26186806f8f.17.2026.02.24.02.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 02:21:49 -0800 (PST)
Message-ID: <9ed3ade5-717d-4f03-ac13-40614a0f093c@gmail.com>
Date: Tue, 24 Feb 2026 12:21:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ethtool: add COALESCE_RX_CQE_FRAMES/NSECS
 parameters
To: Haiyang Zhang <haiyangz@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "Kory Maincent (Dent Project)" <kory.maincent@bootlin.com>,
 Gal Pressman <gal@nvidia.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: haiyangz@microsoft.com, paulros@microsoft.com
References: <20260222212328.736628-1-haiyangz@linux.microsoft.com>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20260222212328.736628-1-haiyangz@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/02/2026 23:23, Haiyang Zhang wrote:
> From: Haiyang Zhang <haiyangz@microsoft.com>
> 
> Add two parameters for drivers supporting Rx CQE Coalescing.
> 
> ETHTOOL_A_COALESCE_RX_CQE_FRAMES:
> Maximum number of frames that can be coalesced into a CQE.
> 
> ETHTOOL_A_COALESCE_RX_CQE_NSECS:
> Time out value in nanoseconds after the first packet arrival in a
> coalesced CQE to be sent.
> 
> Signed-off-by: Haiyang Zhang <haiyangz@microsoft.com>
> ---
>   Documentation/netlink/specs/ethtool.yaml       |  8 ++++++++
>   Documentation/networking/ethtool-netlink.rst   | 10 ++++++++++
>   include/linux/ethtool.h                        |  6 +++++-
>   include/uapi/linux/ethtool_netlink_generated.h |  2 ++
>   net/ethtool/coalesce.c                         | 14 +++++++++++++-
>   5 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/netlink/specs/ethtool.yaml b/Documentation/netlink/specs/ethtool.yaml
> index 0a2d2343f79a..951d98f6bb12 100644
> --- a/Documentation/netlink/specs/ethtool.yaml
> +++ b/Documentation/netlink/specs/ethtool.yaml
> @@ -861,6 +861,12 @@ attribute-sets:
>           name: tx-profile
>           type: nest
>           nested-attributes: profile
> +      -
> +        name: rx-cqe-frames
> +        type: u32
> +      -
> +        name: rx-cqe-nsecs
> +        type: u32
>   
>     -
>       name: pause-stat
> @@ -2244,6 +2250,8 @@ operations:
>               - tx-aggr-time-usecs
>               - rx-profile
>               - tx-profile
> +            - rx-cqe-frames
> +            - rx-cqe-nsecs
>         dump: *coalesce-get-op
>       -
>         name: coalesce-set
> diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
> index af56c304cef4..a3e78b69fd07 100644
> --- a/Documentation/networking/ethtool-netlink.rst
> +++ b/Documentation/networking/ethtool-netlink.rst
> @@ -1072,6 +1072,8 @@ Kernel response contents:
>     ``ETHTOOL_A_COALESCE_TX_AGGR_TIME_USECS``    u32     time (us), aggr, Tx
>     ``ETHTOOL_A_COALESCE_RX_PROFILE``            nested  profile of DIM, Rx
>     ``ETHTOOL_A_COALESCE_TX_PROFILE``            nested  profile of DIM, Tx
> +  ``ETHTOOL_A_COALESCE_RX_CQE_FRAMES``         u32     max packets, Rx CQE
> +  ``ETHTOOL_A_COALESCE_RX_CQE_NSECS``          u32     delay (ns), Rx CQE
>     ===========================================  ======  =======================
>   
>   Attributes are only included in reply if their value is not zero or the
> @@ -1105,6 +1107,12 @@ well with frequent small-sized URBs transmissions.
>   to DIM parameters, see `Generic Network Dynamic Interrupt Moderation (Net DIM)
>   <https://www.kernel.org/doc/Documentation/networking/net_dim.rst>`_.
>   
> +Rx CQE coalescing allows multiple received packets to be coalesced into a single
> +Completion Queue Entry (CQE). ``ETHTOOL_A_COALESCE_RX_CQE_FRAMES`` describes the
> +maximum number of frames that can be coalesced into a CQE.
> +``ETHTOOL_A_COALESCE_RX_CQE_NSECS`` describes max time in nanoseconds after the
> +first packet arrival in a coalesced CQE to be sent.
> +

I am trying to understand how generic this feature/API is.
Can you please elaborate on the feature you want to configure here?

A single CQE to describe several packets?
What is the price? What per-packet information/hw offloads do you lose 
in the process?

For comparison, in mlx5 we have RX CQE compression, which can be applied 
on multiple near-identical completions that share/match several fields. 
Still, there is a per-packet mini-cqe with distinctive per-packet fields 
like csum.

>   COALESCE_SET
>   ============
>   
> @@ -1143,6 +1151,8 @@ Request contents:
>     ``ETHTOOL_A_COALESCE_TX_AGGR_TIME_USECS``    u32     time (us), aggr, Tx
>     ``ETHTOOL_A_COALESCE_RX_PROFILE``            nested  profile of DIM, Rx
>     ``ETHTOOL_A_COALESCE_TX_PROFILE``            nested  profile of DIM, Tx
> +  ``ETHTOOL_A_COALESCE_RX_CQE_FRAMES``         u32     max packets, Rx CQE
> +  ``ETHTOOL_A_COALESCE_RX_CQE_NSECS``          u32     delay (ns), Rx CQE
>     ===========================================  ======  =======================
>   
>   Request is rejected if it attributes declared as unsupported by driver (i.e.
> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index 798abec67a1b..25ccd2d5d4dc 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -332,6 +332,8 @@ struct kernel_ethtool_coalesce {
>   	u32 tx_aggr_max_bytes;
>   	u32 tx_aggr_max_frames;
>   	u32 tx_aggr_time_usecs;
> +	u32 rx_cqe_frames;
> +	u32 rx_cqe_nsecs;
>   };
>   
>   /**
> @@ -380,7 +382,9 @@ bool ethtool_convert_link_mode_to_legacy_u32(u32 *legacy_u32,
>   #define ETHTOOL_COALESCE_TX_AGGR_TIME_USECS	BIT(26)
>   #define ETHTOOL_COALESCE_RX_PROFILE		BIT(27)
>   #define ETHTOOL_COALESCE_TX_PROFILE		BIT(28)
> -#define ETHTOOL_COALESCE_ALL_PARAMS		GENMASK(28, 0)
> +#define ETHTOOL_COALESCE_RX_CQE_FRAMES		BIT(29)
> +#define ETHTOOL_COALESCE_RX_CQE_NSECS		BIT(30)
> +#define ETHTOOL_COALESCE_ALL_PARAMS		GENMASK(30, 0)
>   
>   #define ETHTOOL_COALESCE_USECS						\
>   	(ETHTOOL_COALESCE_RX_USECS | ETHTOOL_COALESCE_TX_USECS)
> diff --git a/include/uapi/linux/ethtool_netlink_generated.h b/include/uapi/linux/ethtool_netlink_generated.h
> index 556a0c834df5..efc6e4ade77b 100644
> --- a/include/uapi/linux/ethtool_netlink_generated.h
> +++ b/include/uapi/linux/ethtool_netlink_generated.h
> @@ -371,6 +371,8 @@ enum {
>   	ETHTOOL_A_COALESCE_TX_AGGR_TIME_USECS,
>   	ETHTOOL_A_COALESCE_RX_PROFILE,
>   	ETHTOOL_A_COALESCE_TX_PROFILE,
> +	ETHTOOL_A_COALESCE_RX_CQE_FRAMES,
> +	ETHTOOL_A_COALESCE_RX_CQE_NSECS,
>   
>   	__ETHTOOL_A_COALESCE_CNT,
>   	ETHTOOL_A_COALESCE_MAX = (__ETHTOOL_A_COALESCE_CNT - 1)
> diff --git a/net/ethtool/coalesce.c b/net/ethtool/coalesce.c
> index 3e18ca1ccc5e..349bb02c517a 100644
> --- a/net/ethtool/coalesce.c
> +++ b/net/ethtool/coalesce.c
> @@ -118,6 +118,8 @@ static int coalesce_reply_size(const struct ethnl_req_info *req_base,
>   	       nla_total_size(sizeof(u32)) +	/* _TX_AGGR_MAX_BYTES */
>   	       nla_total_size(sizeof(u32)) +	/* _TX_AGGR_MAX_FRAMES */
>   	       nla_total_size(sizeof(u32)) +	/* _TX_AGGR_TIME_USECS */
> +	       nla_total_size(sizeof(u32)) +	/* _RX_CQE_FRAMES */
> +	       nla_total_size(sizeof(u32)) +	/* _RX_CQE_NSECS */
>   	       total_modersz * 2;		/* _{R,T}X_PROFILE */
>   }
>   
> @@ -269,7 +271,11 @@ static int coalesce_fill_reply(struct sk_buff *skb,
>   	    coalesce_put_u32(skb, ETHTOOL_A_COALESCE_TX_AGGR_MAX_FRAMES,
>   			     kcoal->tx_aggr_max_frames, supported) ||
>   	    coalesce_put_u32(skb, ETHTOOL_A_COALESCE_TX_AGGR_TIME_USECS,
> -			     kcoal->tx_aggr_time_usecs, supported))
> +			     kcoal->tx_aggr_time_usecs, supported) ||
> +	    coalesce_put_u32(skb, ETHTOOL_A_COALESCE_RX_CQE_FRAMES,
> +			     kcoal->rx_cqe_frames, supported) ||
> +	    coalesce_put_u32(skb, ETHTOOL_A_COALESCE_RX_CQE_NSECS,
> +			     kcoal->rx_cqe_nsecs, supported))
>   		return -EMSGSIZE;
>   
>   	if (!req_base->dev || !req_base->dev->irq_moder)
> @@ -338,6 +344,8 @@ const struct nla_policy ethnl_coalesce_set_policy[] = {
>   	[ETHTOOL_A_COALESCE_TX_AGGR_MAX_BYTES] = { .type = NLA_U32 },
>   	[ETHTOOL_A_COALESCE_TX_AGGR_MAX_FRAMES] = { .type = NLA_U32 },
>   	[ETHTOOL_A_COALESCE_TX_AGGR_TIME_USECS] = { .type = NLA_U32 },
> +	[ETHTOOL_A_COALESCE_RX_CQE_FRAMES] = { .type = NLA_U32 },
> +	[ETHTOOL_A_COALESCE_RX_CQE_NSECS] = { .type = NLA_U32 },
>   	[ETHTOOL_A_COALESCE_RX_PROFILE] =
>   		NLA_POLICY_NESTED(coalesce_profile_policy),
>   	[ETHTOOL_A_COALESCE_TX_PROFILE] =
> @@ -570,6 +578,10 @@ __ethnl_set_coalesce(struct ethnl_req_info *req_info, struct genl_info *info,
>   			 tb[ETHTOOL_A_COALESCE_TX_AGGR_MAX_FRAMES], &mod);
>   	ethnl_update_u32(&kernel_coalesce.tx_aggr_time_usecs,
>   			 tb[ETHTOOL_A_COALESCE_TX_AGGR_TIME_USECS], &mod);
> +	ethnl_update_u32(&kernel_coalesce.rx_cqe_frames,
> +			 tb[ETHTOOL_A_COALESCE_RX_CQE_FRAMES], &mod);
> +	ethnl_update_u32(&kernel_coalesce.rx_cqe_nsecs,
> +			 tb[ETHTOOL_A_COALESCE_RX_CQE_NSECS], &mod);
>   
>   	if (dev->irq_moder && dev->irq_moder->profile_flags & DIM_PROFILE_RX) {
>   		ret = ethnl_update_profile(dev, &dev->irq_moder->rx_profile,

