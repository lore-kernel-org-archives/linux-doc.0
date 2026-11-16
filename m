Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869139;
	b=Uod7Y/n9Wl0vBgEq5f8mBnsaQT9Q1Z68WqWABbdYC+ckOvjRLMWzaoeTQiYejubNNMHP
	 1xW1X8P9/Fy8yM4eZYe4uEBUk/xU1y+eGfbFj9k4P11h0xYVLn4eRIlvPMbo4pea7cboJ
	 n5JeeEgSeMIyMtyYLS9sSAHRxnjQJgupmYm590XK8WR11gkRfJ+T0t2xjswyeLiFbAa3f
	 BWe7X3ba9u9aU/rCvkw8z0l2jfufUEfGDbefEbcxe1QyeBMc5edMFUHB4Y2kWooT25F9/
	 d6hYNUvlrLfS8Fh3k269sFOKRVROUWlfkelCoBBpWDKorocl1uYBLyJvbL90y1AmpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869139;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=QkhYB0iJVWl+8Xh7NXbusdKqsVeXAsPGYMcozCVflSw=;
	b=dRbUYa8ZG6syRPEf7vAVBK/1tO6aXTcXzgxw0bHMdSqLUNYFBR/v/PuQ3zi04Gfqh6U1
	 lhHBD+tDd/VkL1d0iM59evX4jybovDh/vkpUKb/0X1R/6ZpbekbW9ICCgj9wEZuqpWZqS
	 D211WIZUOUFDPGj9b4cEAyqoOy4tlDA3UNkiX4SA4J66KvdWVVAUGjJRLMaJGUQXXzPmU
	 736ur2l9fr4d9eWK3zL/J1uCenc1BmI/1+/zMx+zAbOHTsdr9omiVTsz9h0alCBgyh6TW
	 7cFBjeXnLPKIwY/XdFzBdT7wamktha0ohMiY9/jczusm8riGIe6GzWrAjQ25XmEUWjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f7Ou4wZv;
	arc=none smtp.remote-ip=209.85.219.100
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675EA606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 22:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f7Ou4wZv
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-91eb46044c4so68607306d6.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869138; x=1795473938;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QkhYB0iJVWl+8Xh7NXbusdKqsVeXAsPGYMcozCVflSw=;
        b=dcKv0GA+jrvv3zR0NzjxIsQnZt71t74p02ATItnkdrCDPL/R4ymUqdxZf1kJJUVx4j
         gbcsyKGfoFX+9xbL96WJUFiMT7CukjHwUEWlMqhsgwUv69dRS+qtI6Eafa/s/iUdWTe6
         01FNHegIlLuCPv0AYmnwpJir/VeuwTE/RfL5tMTbh1pGYNDrhGm9gR3c3lAPlOYgaI/D
         kFFbcu9CQC4B9VvGFZQ739O25ux6aI0dwcXkZ8wDnhg8Z3KvgQPHR+JQb4sxBMTVy9hz
         vLB3ahczsZBffkhR7LNwx9hHoWKe+fLYUtbgAohq6OKOz8PeVTj1A3X+KFagnlAgGfry
         phVA==
X-Forwarded-Encrypted: i=1; AL+hErFJk77OSis/ohGb/d9prV0Nsgtj+utz5uFqpHWa4OXJJLHNbkpb/itE1ZCpx0778BdoaGQZKenX2d0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6VixsQIpfjcZITEqAiHXi8cc3fgAKUHHbLRTKlzQSKyLtPndH
	7MrNS9TKbQhHVdz79N7hOlbLj41nqXYJViEM1nJW2ZRuTnoZyE7NtCseoxAkjUErYHsbOdMLa59
	112utuRRgCEyo5wslnZV25SP/cdiCX9CgvXgkDz8KK7n8p8W7Zvs8a33Tr++4L9wH5cyTN2ssSm
	Eie2rPDl43Q0jBqyawx9TmRLonnO7qu4WDkxvGKeGfrPaSIm+RsUFWlHPmzI103iZSHSNGzNstt
	apmGvXGNkQjLxUUrM8s
X-Gm-Gg: AZFdTZem/XOxKVUeCxnqh6r5JYGQLZ9v4TNpdr5BGrJTVoLal2o6RpdmROyR5ptL4Jz
	Ve6lMma2M04V9HDJzzFzZ//GGvcXLHLQ2OeLpepLbKo40QYYJa6LkMw8427G7cn4RnrOKT7cS+f
	vvOYmjxDXpIS65h/UD9jcyqwFRSJ6lffbqlvo4wkLUNkfcvJjRkOLAdXGt7UWEkoEdNz3ObZCgT
	L/qPCXR/IRlkGnCxVQp+ub9NN0S4+FAQbAnanOP2ZALl12yPcGX8cLA1q22zvv5wmRrbNXS+D2p
	NnCr1pcAaqG6Yeb2O0HZZnp1d7DHXYEzhLjsDL4SMFIX0h9/HRni4XgH4h1Bl1QZyM/e/hV4A3s
	cnu4y7i3PFn1LzFD9qcFlKZebpVFhNXGB3DSPB4R7Cg177/XjuFc5bG7vzfnGGWaIFDoB/4+Ils
	Yh2y0BdfwJ2jAvXXc/X6gSDAYENEqVMvRawSZrCJ+1
X-Received: by 2002:a05:6214:4e81:b0:91f:319b:b6bb with SMTP id 6a1803df08f44-91f319bb908mr138769096d6.55.1794869138163;
        Mon, 16 Nov 2026 14:45:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-920e41909c6sm336706d6.5.2026.11.16.14.45.37
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:45:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so379502885a.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794869137; x=1795473937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkhYB0iJVWl+8Xh7NXbusdKqsVeXAsPGYMcozCVflSw=;
        b=f7Ou4wZvsEOcFP4BJj/uMg5NIU7jIvbiu4OfVKImVjIez4yfcnj8vJOQcO0GYduEV3
         46n3df3NeXjFWh5BE02/6mFQq0dpYGghCYDXG3DxrAlm2uSODmbmkJ1QlTBhTXu1pF2m
         A1lPL5MQXdMOnnwWQunjlnIDWMMJjmt2WJXYg=
X-Forwarded-Encrypted: i=1; AL+hErEjEc4KgFq9X6Yvb7lqP/J7ZNRuw4A44sgJ9ofsuejsusa0nklqjaTC5z7Q9ZU/aAAqz+1crjlUuaI=@vger.kernel.org
X-Received: by 2002:a05:620a:4054:b0:93c:664e:e212 with SMTP id af79cd13be357-9494bb561damr1910643485a.32.1794869137382;
        Mon, 16 Nov 2026 14:45:37 -0800 (PST)
X-Received: by 2002:a05:620a:4054:b0:93c:664e:e212 with SMTP id af79cd13be357-9494bb561damr1910639285a.32.1794869136833;
        Mon, 16 Nov 2026 14:45:36 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836f62sm951612385a.23.2026.11.16.14.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:45:36 -0800 (PST)
Message-ID: <31b2a5e7-d419-4e44-a634-7ef139950023@broadcom.com>
Date: Mon, 16 Nov 2026 14:45:32 -0800
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
Subject: Re: [PATCH net-next 0/9] net: bgmac: add Northstar IPv4 TCP/UDP NAT
 flowtable offload
To: netdev-bot+sinfo@kernel.org
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
 Vladimir Oltean <olteanv@gmail.com>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <179486871961.3291.17535527526102286596@kernel.org>
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
In-Reply-To: <179486871961.3291.17535527526102286596@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 14:38, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.

The commits with a Fixes: tag were developed in response to a test 
failure developing the flow accelerator hardware on BCM5301X SoCs.
-- 
Florian
