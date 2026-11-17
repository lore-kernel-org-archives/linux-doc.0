Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959481;
	b=zTqw35OqBI/ys2zex6SWwSHQOG3fqEbIXqArRb+RFQI/W2y6N8UdMArmLuXWY1dEVewA
	 JwrqO6UhIV4LkVv2w1J0GEu4MaXCig8kWI9sciRdO0HYfugi5n7kTUH39WefDrZ+0GJE7
	 TtiMaDheiIDHa/GYHR4LBX9HlicqZJG1tiMSlD0gQdb2Kw8jBDa/xKbd0f5ocbG/0ODk5
	 WmdvZqOJeGkEtIkdg5QF09zocnKzQHI1eAWWUMJADA/H6/BZaIHqbuwVVwPBCqiMr3obO
	 UOfevavs8/qJFLzBe9lRnkI7SA+xMAc+w5t1x10LUD2fp2M4b/k9jNflv5L3OZOWUzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959481;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=WdjoIKvowHyosl1CXA8daiIeSKMARXblpVs58QxNO6E=;
	b=SbRx98xcb14yzzVvfyBpEd8YOElpAjeznZ5PNYAs2vRTo2B7sjiNF+D/8OWyE0IpujdE
	 gn6By4A3nPMZbt5jT2zIy5yQrP/+YEKVh97Is0s9Rq4ETqWM03W/9ZcNDXSvQINbTdFc2
	 51ZcLKBkHSOQNgvJ0mw9KeGCK7zysp/bagGvUm0wsyzJAk2q3I01u+Pt2J6TPEpVrDB3A
	 0p+CipotspXxgqxvyCa2obMulBl/P2M2vjBPDCda+QG4no9EUnI736/IIXyqfV1t/sVti
	 qlqFRyFILS8RbxdLyjl8lHdEdlnJNjnQVWsqMaQEpW681PzU1a6pIWsc7VsCkvYE5LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QwVoIyPA;
	arc=none smtp.remote-ip=209.85.128.225
Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF893606A32A
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 23:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF893606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QwVoIyPA
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8b315dd057bso2397287b3.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 15:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959480; x=1795564280;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WdjoIKvowHyosl1CXA8daiIeSKMARXblpVs58QxNO6E=;
        b=QanoDMfGB3RmMnA0pM1eT81JT4XrjeK4XdyUjXXpEvuW5Y6PSPEdrgvOPdDj5NISvU
         gcdcuQHAOSCAk9Xw1kBk+ojqig5K9v62vFj0/FAXR2DmBDsGM/ZZrmL/RYuwZuVEk7cP
         bWEk5oymspSyDjEl8g693dDPfbzThVlJ556x94cVE9Sef2TJawRSstqXtns0s/B3mbdO
         RnwvY+9MCSZ99n96dgcfIKv+vE11fDNiLXdZ9QX8qF0gF3Q/Glt4U3lCHPUJXpQx+zm4
         V04NsQliAhVYoiQa3cW5QBDEzgjX9n6m4ziJtXnvSbeW+BSHua0QieJWpXSt7ZAjjkR7
         YCkA==
X-Forwarded-Encrypted: i=1; AL+hErEEZOPT7FGnOEkEi8TcDKvaX8yHthFp46iaNQ/RAbguvT8p3+QJz9gGxfCtNWR/gP+gEi424aZ51QE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gfsrzf9mFEhtbYdFJMJ99+PA7WwwD6Q6G6sxUmPdCswN1zDco
	9A2FQHp0J8C/RqmwHk9V/HQKPgSo0GUUzJ4LIViPq4TvJnQC+xtD8KiEL8avlcf7fMYuRwvCAPC
	RJmhxEYkThE2HZTSOyhYUa8Rl1HYQztPfKaXl4MaDrXsrvsSEjGGU/DPMqkbX1lQfSe6y9uvh2m
	MFrFugYMypyY1LylMd1dAnAdU18+LyUUCHl2F11yF+HNFaZDQThLgT98Z+7rqlAFGyMehc1+chM
	vSdGImuri5xJw8yIN5k
X-Gm-Gg: AZFdTZcyWZ2SuD6frkojs0B/+OSqFpSzb0Mi1+rW/QHfAlKxGA2q39GSGThvcK9qFSa
	5d6lR+I9K32OFapzjy4nQra1xPrzD10Y5w5YPwlZOY1KhUzT5tchtiAahkoeEc7Sjmzy/G4aPmc
	YiIDvNbQH7bI7/AsgtYe10MftE8Qy52gdvV/i6QaHv311cAemTSYBJN//dHsAsohuyV/fg0+T4k
	afFx8coAzrNH4hFNwgw5l1qFK/BdZyKGPf87YU7spMzlgLlVBJPYENL9JIiBNax+5SjklRydD1s
	G8HRkS+9LfiXU5HsSIuTeNY28/MISLdrneibOZ0Qb0eNz/6ZIeONyJ2rj2ScpyCskHqcBTjnhlm
	asZC4rPcKgpY/ApJqfyNq3Tib/dtowJf4O0Kon0uxO1ob7k2oL0P474FDGkHJx7sXzn7i+UuVcD
	b/ZH+TJoYHeogQ/2k7i23wNA1RTDKpsRVXQXQHrMB5
X-Received: by 2002:a05:690e:13ca:b0:67c:1d44:7893 with SMTP id 956f58d0204a3-67dd3d4f880mr506307d50.9.1794959479736;
        Tue, 17 Nov 2026 15:51:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67dd582159csm8029d50.28.2026.11.17.15.51.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:51:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92101559a2bso4652346d6.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 15:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794959479; x=1795564279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdjoIKvowHyosl1CXA8daiIeSKMARXblpVs58QxNO6E=;
        b=QwVoIyPA7dt1oxl1ZdWzWz6FASErNhWk22eYH4Y7egzEAkdsFdpfy4yQc1swl7nYwH
         5psJMhjHs6g33TbgC9ByZ+mnbMlO76CCi6oJYA//GLp2NuLUqm3mSjPDGkvrUO8iO3tm
         u2at2sQDOdGgd7gwMTf/6ckhonwgPfCKqcn34=
X-Forwarded-Encrypted: i=1; AL+hErHmp1JBAuqJoX4k1kTuqG/m0iu2Vmi9q50K8vAEHBGRNN/dLn6qYdL1aTEor6D9hcBG/jjXDEoineQ=@vger.kernel.org
X-Received: by 2002:a05:6214:4112:b0:91f:ee9:c557 with SMTP id 6a1803df08f44-92114ea4b99mr13598486d6.44.1794959478618;
        Tue, 17 Nov 2026 15:51:18 -0800 (PST)
X-Received: by 2002:a05:6214:4112:b0:91f:ee9:c557 with SMTP id 6a1803df08f44-92114ea4b99mr13598016d6.44.1794959477951;
        Tue, 17 Nov 2026 15:51:17 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d98adbsm6389176d6.40.2026.11.17.15.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:51:17 -0800 (PST)
Message-ID: <04a0bf1d-7807-47f1-81e7-d57a27e8599e@broadcom.com>
Date: Tue, 17 Nov 2026 15:51:13 -0800
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
Subject: Re: [PATCH net-next 2/9] netfilter: flowtable: reject non-host IPv4
 packets before lookup
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 horms@kernel.org, corbet@lwn.net, jonas.gorski@gmail.com, olteanv@gmail.com,
 pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
References: <20261116222519.1416501-3-florian.fainelli@broadcom.com>
 <179495815781.3136.11457762484354834526@kernel.org>
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
In-Reply-To: <179495815781.3136.11457762484354834526@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/17/26 15:29, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 2 · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new early return in nf_flow_offload_ip_hook()
>    (net/netfilter/nf_flow_table_ip.c:915) checks skb->pkt_type at netdev…
> - [High] The fix only covers IPv4.
> - [Low] The commit trailer reads 'Signed-off-by: FLorian Fainelli
>    <florian.fainelli@broadcom.com>', but the author is 'Florian Fainelli'…
> 
> --
> 
> netfilter: flowtable: reject non-host IPv4 packets before lookup
> 
> This commit makes nf_flow_offload_ip_hook() return early when pkt_type is
> not PACKET_HOST. Those packets then go to the normal IPv4 stack before the
> flowtable lookup. The goal is to apply the same PACKET_HOST check that the
> classic IPv4 forwarding path uses.
> 
>> Fixes: 97add9f0d66d ("netfilter: flow table support for IPv4")
>>
>> Signed-off-by: FLorian Fainelli <florian.fainelli@broadcom.com>
> 
> [Severity: Low]
> This isn't a bug, but the Signed-off-by name has a typo ("FLorian") and
> does not match the author name ("Florian Fainelli"). There is also an
> extra blank line between the Fixes: tag and the Signed-off-by: tag.
> 
>> diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
>> index 19cafae748abe..98bade1b82994 100644
>> --- a/net/netfilter/nf_flow_table_ip.c
>> +++ b/net/netfilter/nf_flow_table_ip.c
>> @@ -911,6 +911,10 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
>>   	};
>>   	int ret;
>>   
>> +	/* The ingress hook runs before IPv4 rejects non-host Ethernet frames. */
>> +	if (unlikely(skb->pkt_type != PACKET_HOST))
>> +		return NF_ACCEPT;
> 
> [Severity: High]
> Could this turn off the software fast path for flows that pass through a
> bridge or VLAN upper device?
> 
> This hook runs at netdev ingress on the lower device. At that point
> pkt_type still holds what eth_type_trans() set by comparing h_dest with
> the lower device's own MAC. In __netif_receive_skb_core(), nf_ingress()
> runs before both places that reclassify the frame:
> 
> __netif_receive_skb_core()
>      nf_ingress()          <- nf_flow_offload_ip_hook() runs here
>      vlan_do_receive()
>      rx_handler()          <- br_handle_frame()
> 
> net/8021q/vlan_core.c:vlan_do_receive() {
>      ...
> 	if (unlikely(skb->pkt_type == PACKET_OTHERHOST)) {
> 		/* ... */
> 		if (ether_addr_equal_64bits(eth_hdr(skb)->h_dest, vlan_dev->dev_addr))
> 			skb->pkt_type = PACKET_HOST;
> 	}
>      ...
> }
> 
> net/bridge/br_input.c:br_handle_frame() {
>      ...
> 	if (ether_addr_equal(p->br->dev->dev_addr, dest))
> 		skb->pkt_type = PACKET_HOST;
>      ...
> }
> 
> The flowtable supports DEV_PATH_BRIDGE and DEV_PATH_VLAN paths.
> nft_dev_path_info() puts the upper device's dev_addr in h_source, but the
> ingress ifindex is the lower port. Hosts therefore send routed traffic to
> the bridge or VLAN MAC.
> 
> Two setups hit this:
> 
>    - A bridge port whose MAC differs from the bridge MAC. This is common in
>      a multi-port bridge, because the bridge takes one port's MAC.
>    - A VLAN device with its own MAC.
> 
> In both cases, every packet of an offloaded flow would be PACKET_OTHERHOST
> at this hook. It would return NF_ACCEPT before nf_flow_offload_lookup().
> The IPv4 stack later sees PACKET_HOST and forwards these packets.
> 
> Given that, does the patch keep "the IPv4 input path's forwarding
> decision", as the commit message says? Would it work better to compare
> h_dest with the address the flow expects (for example after the tuple
> lookup) rather than test the lower device's raw pkt_type?
> 
>> +
>>   	if (!nf_flow_skb_encap_protocol(&ctx, skb))
>>   		return NF_ACCEPT;
>>   
> 
> [Severity: High]
> Is the same bypass still open for IPv6? In the same file,
> nf_flow_offload_ipv6_hook() has no pkt_type check. It goes straight to the
> lookup, forward and nf_flow_queue_xmit6() steps:
> 
> net/netfilter/nf_flow_table_ip.c:nf_flow_offload_ipv6_hook() {
>      ...
> 	if (!nf_flow_skb_encap_protocol(&ctx, skb))
> 		return NF_ACCEPT;
> 
> 	if (unlikely(ctx.ether_type != htons(ETH_P_IPV6)))
> 		return NF_ACCEPT;
> 
> 	tuplehash = nf_flow_offload_ipv6_lookup(&ctx, flow_table, skb);
>      ...
> }
> 
> Classic IPv6 forwarding drops these frames:
> 
> net/ipv6/ip6_output.c:ip6_forward() {
>      ...
> 	if (skb->pkt_type != PACKET_HOST)
> 		goto drop;
>      ...
> }
> 
> nf_flow_offload_inet_hook() sends ETH_P_IPV6 to the unpatched hook. With
> this patch, an inet flowtable would reject non-host frames for IPv4. For
> IPv6 it would still forward frames sent to an unrelated unicast,
> broadcast or multicast MAC, as long as the 5-tuple matches an installed
> flow.
> 

[High] pkt_type breaks bridge/VLAN offload

Agreed. The hook runs on the lower device before vlan_do_receive() and
br_handle_frame() reclassify skb->pkt_type, so frames sent to a bridge
or VLAN MAC are PACKET_OTHERHOST at this point and every such flow would
fall back to the slow path.

v2 drops the early pkt_type test. After the flow lookup it compares the
Ethernet destination with the address the peers of the flow send to,
i.e. the source MAC recorded for the reverse direction, which is the MAC
of the upper device for bridge and VLAN paths. If the reverse direction
carries no MAC, or the device is not Ethernet, it falls back to
skb->pkt_type, since the hook then runs on the routing device itself.

[High] IPv6 not covered

Agreed. v2 applies the same check in nf_flow_offload_ipv6_hook() and 
adds a Fixes: tag for the IPv6 flowtable support.

[Low] Signed-off-by typo

Will be fixed in v2.

pw-bot: cr
-- 
Florian
