Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959043;
	b=BDzvTJJA0m0nJ0P2nk8z4tzFUv551Xl9UGpKIPo0C6wOYeQ6wX13N4zWKUOa/xldSU5E
	 4q1EZuyn4fZqNPCFqRKCCG1J0vnp4uWtg3BYQmTwMLqBdJlZtq5lfJHJJOyLWlAXJ6mLw
	 4q5dD97yZFRBNvPDYYLxzwf2nl9zmtgIU/GSL+aZyNblSiGc9mpeGW0/okHWii+eV615r
	 u6lp0GdvZYtYbslfHnHRBI8u8RTkl5h7ePodvoubNGNqfRrVgN0gFzkNNnZ7qHq0To9fq
	 ZKMTfVnXziEAd8koK+rr4SIy/376gEekydJoQdgo7Lu88DAtcs1vlMWz5bPv3KqNnXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959043;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=chWuGj4JSfuHqV8d6iYVixzJTNnCSogSzx0lpANcwLI=;
	b=zzCv6tYmTF3j/3WyP052h8xvM0vk1pEtpMM01xh4oCHTMsqRPVA+urJlRNsskUYolXAn
	 lZ76eNgqOwx7ZmV/Ne+uAKGXUwW1ub8GjlI3DU/JBhg/ksUucj0GswmVyfF/ZejTU4r8s
	 7uhptvx6YvD6peYLCPWk8VWBKOrT7SM3LRVyURxPoT1naF9at0Y3r4xe6Om+t1/f/ZUyr
	 +QkUF+xvffQ7L4Ag3NpLIZoCDA3d21zqZBqVeS88F2nuM4O6INpqvd82ihqDbONhFhoST
	 QMtCKvMkkUw9MXY3peEKo9eaLkZLu14y02nHimST+il8e7YnE45AuxyaTt9rriRy6dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fx5C73B5;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870A606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 23:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7870A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fx5C73B5
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93f20b304c0so35313485a.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 15:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959042; x=1795563842;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=chWuGj4JSfuHqV8d6iYVixzJTNnCSogSzx0lpANcwLI=;
        b=0BZa3iTrA4qsVS+woDkekaj0jS8BhZ2hyuKwUDzMDpfFtnFgpiXPxVBgpjpjcEkhRq
         YDojiFka5QHuWr7E3hzoKGI2pwG5+rwYM3LmFM3qWkkFpAZnr3HDLm7TFDTeD0hPxipQ
         jyOqkOMTtuuYANINiVYkBap7VkJRwAXFsSeqrSapCJ+VsHGfq/Y4xMqm0KV8sA6OX9Af
         sza6rnPi6eU/Ba62hx7JZ4cLuW4oZuyqzjW/tOXp4Rm7xGEaQeLC+PbvkRi1bcuxqQN1
         BSzFZqX/lAplqdkUf3v61yT+aM9MpJWWQ451JGXgV6aFqWDGAFB0oEWtY6jZHJvnjB6b
         /8cw==
X-Forwarded-Encrypted: i=1; AL+hErEKHs9D3bTLxCmNKRojnHSJ6HKNaUuQLHU4IxHXAUL2eKI7qaVayn5o4j7PDwLvID60w6MeU8Xgd88=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mGba+YuhEZeIPdO/znLpXk/8GySMPXUCdNsdHDC9HImiifKZw
	iFIhR63YSkZH8KXm2bDzrW+Gps64o99Xo9QRwFTg0X6Cb+syKVSg4a0G/Ed7GJiO8b9xyipVeZq
	p1mDVgOfPbPdBKHFJduRQPxy4ga84hS6voKsLKn2ufu0NR3RhzHMLaCO4OerB/weDkHLDnEiYv+
	offLHfHEz8waqvbAXeNPVjcABWzt89YL6OKWXGu71EjCwdMsdErlu8DNiEWQ9TBzOChR8duD2QB
	5HPlvL1OTGV4lz4cjyu
X-Gm-Gg: AYBFou3+GXNDk10qTHBNxXt8q8OakE5g3EIA0I5cG7f+y/Cz4OgMnUTx1eJDENMoNdv
	GD87lKPYgSy1gyWro1lEHtJ20mKo/P42VGTKCiJyaa8LYB1kvIws/lbn9ux6TVJuaiX4frqOq8W
	NM1UFLC7gGzD0UDSxEEI4B7iHnyQ8/KsMCDiKTnOP16ep05B5uYWNnLF4vW++F+YRYVqs1FwX7r
	EeeEbrmG+c+zMP+E0EHi1lin8oEUJO8+N90ZJvpmSYdHhCT4zHLxbCo3pbIrt4hDvE3o+IETxu7
	0gpgs1nTFA+r8OjscTi2+AQQHby0BidY8BiZQBKglLeZ2bTy0TPWby+SOELHLZ2RRoXfGPP7LHQ
	htHYPzGg1wwX554CnlubRzo5UweukZ57r2/sY6uvhYtHvTzDsSXDDmBvrca6yclKGKsCmeZC8yV
	jO7ABWyCG3mT4ZzUUzzPgEuQu7lp5SFcxdp9vrVpFM
X-Received: by 2002:a05:620a:6cc3:b0:93e:e376:9b1d with SMTP id af79cd13be357-949994a7258mr230855885a.9.1794959042389;
        Tue, 17 Nov 2026 15:44:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9499b508bc5sm4759485a.14.2026.11.17.15.44.01
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:44:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso58995085a.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 15:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794959041; x=1795563841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chWuGj4JSfuHqV8d6iYVixzJTNnCSogSzx0lpANcwLI=;
        b=fx5C73B50D5pL98mnf/EuUK1aU3XaQQEwC/yr/QKs3NcOr5bllWST48sJUQJd5690z
         3FiAl4iBOYGHkbFpY9pJly+GpsphIndhMkWphfVzVM459bAK+LlV4+KxmIV7q7cZaAuA
         iUZF3BvUrWZfPuwk0tUzGcwrxNm99GPtei+wc=
X-Forwarded-Encrypted: i=1; AL+hErF+Tqxc9thezNJ0qW66p3FxXqty5XK1CAkkv2dom0goFopk+vvQP2aMlgX9qP6XciO1eZiFDAUd8zg=@vger.kernel.org
X-Received: by 2002:a05:620a:3710:b0:93f:633b:ee13 with SMTP id af79cd13be357-94999572c59mr220413285a.28.1794959040878;
        Tue, 17 Nov 2026 15:44:00 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:93f:633b:ee13 with SMTP id af79cd13be357-94999572c59mr220408585a.28.1794959040114;
        Tue, 17 Nov 2026 15:44:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7ccf2fsm43121785a.36.2026.11.17.15.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:43:59 -0800 (PST)
Message-ID: <5cc0d365-3821-4dab-8015-22cbc94be1e0@broadcom.com>
Date: Tue, 17 Nov 2026 15:43:55 -0800
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
Subject: Re: [PATCH net-next 1/9] net: ethernet: bgmac: validate RX length
 against the DMA packet capacity
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 horms@kernel.org, corbet@lwn.net, jonas.gorski@gmail.com, olteanv@gmail.com,
 pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
References: <20261116222519.1416501-2-florian.fainelli@broadcom.com>
 <179495815587.3136.10288920701294421777@kernel.org>
Content-Language: en-US, fr-FR
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
In-Reply-To: <179495815587.3136.10288920701294421777@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/17/26 15:29, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In bgmac_dma_rx_read()
>    (drivers/net/ethernet/broadcom/bgmac.c:463), the patch now treats…
> - [Low] The commit message is accurate but leaves out the user-visible
>    impact of the bugs this patch fixes in bgmac_dma_rx_read().
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but it is High
>    severity, and the new check does not close it.
> 
> --
> 
> net: ethernet: bgmac: validate RX length against the DMA packet capacity
> 
> This patch changes the upper bound of the RX length check in
> bgmac_dma_rx_read() from BGMAC_RX_ALLOC_SIZE to BGMAC_RX_MAX_FRAME_SIZE.
> It also rejects lengths shorter than ETH_FCS_LEN. Invalid lengths are
> reported through a rate-limited netdev_err() and counted in rx_length_errors
> and rx_errors.
> 
>> BGMAC_RX_ALLOC_SIZE includes skb_shared_info and alignment space beyond
>> the DMA receive buffer. An invalid completion length can pass that check
>> and reach skb_put() with more data than the skb tailroom permits.
>>
>> Limit received frames to BGMAC_RX_MAX_FRAME_SIZE and reject lengths too
>> short for the FCS subtraction.
> 
> [Severity: Low]
> This isn't a bug, but could the commit message state the user-visible
> impact of what is being fixed?
> 
> For len < ETH_FCS_LEN, the u16 subtraction "len -= ETH_FCS_LEN" wraps to
> 65532..65535. The skb_put() that follows then ends in skb_over_panic() and
> BUG().
> 
> Lengths between the skb tailroom limit (about 1602 bytes with
> NET_SKB_PAD=64) and BGMAC_RX_ALLOC_SIZE also reach skb_over_panic().
> 
> Lengths from 1537 up to that tailroom limit got through skb_put(). They
> delivered bytes past the 1536-byte DMA-mapped frame area. Those bytes come
> from the non-zeroed netdev_alloc_frag() buffer, and the device never wrote
> them.
> 
> The message names the tailroom and FCS cases. It does not say that they
> end in a kernel BUG(), and it does not mention the stale data delivery.
> 
>> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
>> index 9ef239bc487d7..1c502bd64d7df 100644
>> --- a/drivers/net/ethernet/broadcom/bgmac.c
>> +++ b/drivers/net/ethernet/broadcom/bgmac.c
>> @@ -457,10 +457,14 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
>>   				break;
>>   			}
>>   
>> -			if (len > BGMAC_RX_ALLOC_SIZE) {
>> +			/* The allocation also contains headroom and skb_shared_info;
>> +			 * only the mapped packet area may be supplied by the DMA.
>> +			 */
>> +			if (unlikely(len > BGMAC_RX_MAX_FRAME_SIZE || len < ETH_FCS_LEN)) {
>>   				if (net_ratelimit())
>> -					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
>> -						   ring->start);
>> +					netdev_err(bgmac->net_dev,
>> +						   "Invalid RX length %u at slot %d (flags %#x)\n",
>> +						   len, ring->start, flags);
> 
> [Severity: Medium]
> Does this new bound drop frames that the driver itself tells the MAC to
> accept, and whose MTU it advertises?
> 
> bgmac_chip_init() sets the MAC max frame length to 1550:
> 
> 	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + ETHER_MAX_LEN);
> 
> bgmac_change_mtu() sets it to 32 + mtu, which can be as large as 1564:
> 
> 	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + mtu);
> 
> bgmac_enet_probe() sets max_mtu without subtracting ETH_HLEN or VLAN_HLEN:
> 
> 	net_dev->max_mtu = BGMAC_RX_MAX_FRAME_SIZE - ETH_FCS_LEN;
> 
> The driver accepts any MTU from 1519 to 1532. At those MTUs a full-sized
> frame can be up to 14 + 1532 + 4 = 1550 bytes. Such a frame is now always
> dropped, logged as an invalid RX length, and counted in rx_length_errors.
> 
> Before this patch these frames were delivered with stale tail bytes, so
> dropping them is safer. However, the new comment and the commit message
> assume that len > BGMAC_RX_MAX_FRAME_SIZE can only come from a DMA error.
> 
> Should max_mtu and/or UMAC_MAX_FRAME_LEN also be clamped to the
> per-descriptor capacity? One option for max_mtu is
> BGMAC_RX_MAX_FRAME_SIZE - ETH_HLEN - ETH_FCS_LEN, possibly minus VLAN_HLEN.
> Could the commit message also mention that these frames are now dropped?
> 
> [Severity: High]
> This is a pre-existing issue, and the new check does not appear to close
> it. Can a remote sender get stale buffer contents delivered as a received
> frame through an overflow-continue slot?
> 
> bgmac_dma_rx_ring_enable() turns on overflow-continue:
> 
> 	ctl |= BGMAC_DMA_RX_OVERFLOW_CONT;
> 
> Each descriptor holds only BGMAC_RX_BUF_SIZE, which is 30 + 1536 bytes.
> The MAC accepts frames up to 1550 bytes by default, and up to 1564 bytes
> after an MTU change.
> 
> With overflow-continue, the DMA64 engine writes the rest of an oversized
> frame as raw data at offset 0 of the next descriptor's buffer. That buffer
> has no RX status header. brcmsmac's dma_rx() drives the same engine with
> the same 0x400 bit, and it handles these continuation buffers explicitly:
> 
> 	resid = len - (di->rxbufsize - di->rxoffset);
> 	...
> 	while ((resid > 0) && (p = _dma_getnextrxp(di, false))) {
> 		pkt_len = min_t(uint, resid, di->rxbufsize);
> 
> bgmac_dma_rx_read() treats every slot as an independent frame. The new
> check drops the first slot when len > 1536. The next slot is then parsed
> as a fresh frame:
> 
> 	len = le16_to_cpu(rx->len);
> 	flags = le16_to_cpu(rx->flags);
> 
> In that slot, rx->len and rx->flags are frame bytes 1536..1539, which the
> sender controls. A value in [4, 1536] passes both the poison check and the
> new bound. build_skb() and skb_put() then deliver up to about 1532 bytes
> starting at buffer offset 30.
> 
> DMA wrote only the first (frame_len - 1536) bytes of that buffer in this
> round, which is at most 28 bytes. The rest is stale netdev_alloc_frag()
> memory, because bgmac_dma_rx_skb_for_slot() only writes the poison header.
> The resulting skb goes to eth_type_trans() and napi_gro_receive(). From
> there it can be processed locally, bridged, or forwarded.
> 
> The old BGMAC_RX_ALLOC_SIZE check let through an even wider range of
> lengths. This patch narrows that range but does not remove it.
> 
> Could multi-descriptor frames be tracked so the continuation slots are
> dropped too? Alternatively, could UMAC_MAX_FRAME_LEN and max_mtu be capped
> at the single-buffer capacity?
> 
>>   				put_page(virt_to_head_page(buf));
>>   				bgmac->net_dev->stats.rx_length_errors++;
>>   				bgmac->net_dev->stats.rx_errors++;
> 

[Medium] RX bound vs. MAC max frame length / max_mtu

Valid. The driver programmed UMAC_MAX_FRAME_LEN to 32 + ETHER_MAX_LEN 
(or 32 + mtu), and max_mtu ignored ETH_HLEN, so the MAC could accept 
frames larger than one RX descriptor can hold, which the new check then
drops. In v2, UMAC_MAX_FRAME_LEN is clamped to BGMAC_RX_MAX_FRAME_SIZE 
and max_mtu becomes BGMAC_RX_MAX_FRAME_SIZE - ETH_HLEN - VLAN_HLEN -
ETH_FCS_LEN (1514). MTUs 1515..1532 are no longer accepted; frames of
that size were already delivered with stale tail bytes. The commit
message now says so.

[High, pre-existing] overflow-continue continuation slots

The analysis is right: with BGMAC_DMA_RX_OVERFLOW_CONT, the tail of an
oversized frame lands at offset 0 of the next descriptor, which has no 
RX header, and was previously parsed as a new frame. Rather than 
tracking multi-descriptor frames, v2 caps the MAC maximum frame length 
at the single-buffer capacity (the clamp above), so oversized frames are 
dropped by the MAC and never spill into a following descriptor.

[Low] commit message

Fixed in v2: it now describes the skb_over_panic()/BUG() cases (len <
ETH_FCS_LEN and len above the tailroom) and the delivery of
uninitialized netdev_alloc_frag() bytes.

pw-bot: cr
-- 
Florian
