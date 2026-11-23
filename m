Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450224;
	b=M1zD51skiO1f9x9k0CNz+Hp0HlJ8Tztf5NlqyDgFaVEPZozX96SA7KCckPGchvRJgdrx
	 wJr8IAgXqX1Zl1Zcaky+v+npm8JlbiJYm8N/PKAvsbU1pOyaztBtFglyOWIHUyIUzG1m9
	 mgo5bLyxOSmnqtKCj6rbz10dIGfOvZut/mR1FiWUYnWNab+3CVLJ/vMAvRChL4rEEiURp
	 IK2ITA3goMs5Rcr5mrybBiVRttYYlc/QlyxPltJS8ggHEXPiJPBQYJVMvBqLhmjLRxeXg
	 vYH+OITyKxiLpW+7t+JkFzlgv+xIh/jrjgrW2gxlUQ7CHsLrzxRiRBSH+Ur2uaTrXTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450224;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
	b=oISNWd0JRwfzeW68TjoaGxJJNk30netZTN2p1AiUHqA0doB7EWYpHHp7dW0m8SyuwFtt
	 +rscWfXMNFS/IV4DDG0ZuC+w7HsU6WpSpx0/6y3a+wYNgw0I+hEo6FuewOVHrdRiFfNxr
	 0HVN3wF3DREcbozrBhUUk/TNgRNlhcP8CJRXNc/eyKnRO0W4QQf4296JEEKvFXvOwkwdH
	 vZpOZvVCCL02fWMCpo2fbl0XELXAJUPKr+g3d3EuSPQYgwewUTQ5nUBn1n/iILK3J9dEX
	 oOgSGoCXeJTwDwdMGGZX4FOIqrO4rfU6k8XLtGNTzUli+2Khlv3GzQwWBwYxy7hVPtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gM81qaTc;
	arc=none smtp.remote-ip=209.85.221.228
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37578606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 16:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37578606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gM81qaTc
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5ee36376a0dso2007105e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 08:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450223; x=1796055023;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
        b=Jx1248s/ecgFNYqcgx/wIRm+9jkR6fWYLV8yIKIdS9w9zqGRziQDorNBH3pq73zo75
         Z3HbtGCAk6Cmxl/U9Czk2Jh5IMcxhz5EjahsfKHekQAlwo0blSpI1MlX1Ko1EgUUf3fR
         epbNsAE9ku+RTcYIdVpKITOBkUgS3X1JeFrkOaxwiPrd8G0j1LTJeBrHp64V0R9cNZQI
         vK+RjVz/alP40nHU9C/gvebCTwTFIdBrPMW6l+HGKd4XalIQkh38G9CPJcI04V+Hr6rY
         S3V7D9T029trfQefx/scZi75FMr4EVlZbMaZkp2Tr7XeMImkwSbeIOlbUcKSFWwpCx9U
         nYRw==
X-Forwarded-Encrypted: i=1; AL+hErFq6N6UCSWd/AC3zbjg4k7uXHoV2tZytkhEtLeWu5VLHjb1kuj0ihUyNULuHT4H3XT9RBXbRS9qLLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/44ESPeiDjVuWgmWcxe0DqTkd4ONqWK2RsPesylSNSDt+q6HxC
	OdyiWFyId9FWNcO2b4v5TFMH+yHGokvMmcThusAu6Pzqrd+EPVkBAltkydr2yKF96LCsasOtooE
	ygfLdOGtp3URL5nG3d5Gyb3ogTszYaZF9R3+7cvjklk08QLBxDxhdpmdx5gCg4UiNnLRUYaWVW1
	QqbqzXueW8EaKo+x19TXkn7UENahxj+ZvKutQ/M6udP7x9ikAWGq09P812G8ygSXF51PCx9pLQR
	2u/QuK7lSZXlvLCvhG+
X-Gm-Gg: AZFdTZdTvykYdsC9UcnWQR31eTRrSX0UTQ5e5YyUyqFBDA4CQweMWvXzEoz1VgnUbes
	zzJUOImuopGDpPNSXW6YudNb2UUESoEEUTYmyEOoZXveUipxLRyxVlWlcmlXlFhgwq1XL6/78aa
	HNfV3rzWdSiTaKYalyDhXUoY9jl7brOaSWWZNNVQXNNzHzMu4Abq6hEdRb/ioo7Phl5qGuwIF29
	WyyUW/duFDzjUsBNzXHFKTsyFKdvEjEoMFGheZw1yg7SqZlc6AP1zhEDlMGBl4k2WaZRvm6GtaJ
	AWSUfnht9cKNzIJEx26DGQmJGVuU1G/TNq98giMah8dJ98fMKSltU3z17qvyGSDlOAwycTAlKAE
	+Ai5NB71BCRS/9CERC+kDIKNAFyNkktHV1qmOBlwj9yVeO+WJaFXcDIKUtjsM9oNqUKQV0iNT6D
	ifhPKyspKAzFvywdKVtToq0IRhd2qWwaetKKuLrwWMrws=
X-Received: by 2002:a05:6122:d8f:b0:5ee:3276:58d5 with SMTP id 71dfb90a1353d-5ee8ae8eb46mr6697141e0c.5.1795450222998;
        Mon, 23 Nov 2026 08:10:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e14451esm1194603241.11.2026.11.23.08.10.22
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:10:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b63b9665so2710132c88.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795450222; x=1796055022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
        b=gM81qaTcVbNLppi4ERhQA+iFdyvhxyA786MlSXuu3iNrSvd4cnB56s3iPQjEE7BQM8
         0y/lgC9jhTwcgipShOESHGZbMmHHhnRRNiKna5v7KEfhutwTlaq0K8by6QaPfnxuoHgq
         gA1Q2PRZOkAygqHKS+wSuND+r/V3zOC37D5/U=
X-Forwarded-Encrypted: i=1; AL+hErFg53bQJfVwYaZB8J/tC8ALg3Q39XAt/1Ljht4qRzCd3V606GYUIwBDaq7RVKmsjsu2LvVEiYbaZ74=@vger.kernel.org
X-Received: by 2002:a05:701a:ccda:10b0:144:fb42:52 with SMTP id a92af1059eb24-1b5568fd903mr12257213c88.28.1795450221727;
        Mon, 23 Nov 2026 08:10:21 -0800 (PST)
X-Received: by 2002:a05:701a:ccda:10b0:144:fb42:52 with SMTP id a92af1059eb24-1b5568fd903mr12257183c88.28.1795450221034;
        Mon, 23 Nov 2026 08:10:21 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm22003793c88.11.2026.11.23.08.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:10:20 -0800 (PST)
Message-ID: <b5a899c1-c1b8-409e-8b50-ca722c229f5b@broadcom.com>
Date: Mon, 23 Nov 2026 08:10:16 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/9] net: flow_offload: allow drivers to validate
 and invalidate cached paths
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netdev@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jonas Gorski <jonas.gorski@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:NETFILTER" <netfilter-devel@vger.kernel.org>,
 "open list:NETFILTER" <coreteam@netfilter.org>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <20261116222519.1416501-7-florian.fainelli@broadcom.com>
 <awI-mtwn3ohPw-fF@chamomile>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <awI-mtwn3ohPw-fF@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/21/2026 5:00 PM, Pablo Neira Ayuso wrote:
> On Mon, Nov 16, 2026 at 02:25:16PM -0800, Florian Fainelli wrote:
> [...]
>> +static int nf_flow_offload_validate(unsigned long cookie)
>> +{
>> +	struct flow_offload *flow = nf_flow_offload_cookie_flow(cookie);
>> +	unsigned int dir;
>> +
>> +	for (dir = 0; dir < FLOW_OFFLOAD_DIR_MAX; dir++) {
>> +		struct flow_offload_tuple *tuple = &flow->tuplehash[dir].tuple;
>> +		struct flow_offload_tuple *other = &flow->tuplehash[!dir].tuple;
>> +		struct dst_entry *dst = tuple->dst_cache;
>> +		struct neighbour *neigh;
>> +		u8 mac[ETH_ALEN];
>> +		bool valid;
>> +
>> +		if (!dst)
>> +			return -EOPNOTSUPP;
>> +		/* This is the actual route selected with the packet's policy
>> +		 * context, including mark, DSCP and the reverse lookup's oif.
>> +		 */
>> +		if (!dst_check(dst, tuple->dst_cookie))
>> +			return -ESTALE;
>> +		if (tuple->xmit_type != FLOW_OFFLOAD_XMIT_DIRECT)
>> +			continue;
>> +		/* A stacked path may have a different final Ethernet neighbour.
>> +		 * Do not mistake that unsupported context for a stale owner.
>> +		 */
>> +		if (dst->dev->ifindex != tuple->out.ifidx)
>> +			return -EOPNOTSUPP;
>> +		neigh = dst_neigh_lookup(dst, &other->src_v4);
>> +		if (!neigh)
>> +			return -ESTALE;
>> +		neigh_ha_snapshot(mac, neigh, dst->dev);
>> +		valid = (READ_ONCE(neigh->nud_state) & NUD_VALID) &&
>> +			ether_addr_equal(mac, tuple->out.h_dest);
>> +		neigh_release(neigh);
>> +		if (!valid)
>> +			return -ESTALE;
>> +	}
>> +	return 0;
> 
> This validation to catch for stale entries looks very similar to what
> I'm working on. I guess there is a chance to consolidate all this in
> common infrastructure for both software and hardware modes.

Excellent, happy to point you to an off the shelf device where you could 
be testing this on, if you would like to?
-- 
Florian

