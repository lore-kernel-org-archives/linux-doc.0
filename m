Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022534;
	b=Hjch8Yf6A4RSCFOaJ2i4oQ84FQLvLxQ9xREEWGZyZprWueOOELOTjjJjG/RlF3GIgzZt
	 QY/EB93v6NlLIqFMQuOz3H+XJURuadQezs0w92MLpZjOiWpHXyfBpi8WP/WnOB1Zmy+By
	 i/rf4Y7POsqYXHdSyWF362jBhN7EX6khCOH4v6NN7Q3fQR0xhphTKpclmzaPMAKSiNrnf
	 D6Kf8eK+XWsou7LKx6rTFVKus+tdBj5PFc7Nt9rKTNsDZV87XLU/uQFQ4I7tM8ruRB0N3
	 uhfeTxxB1agTmTna/l3ep2me3EFReMbJrui67y1geUA9jNIHzKPCkZj7UX2BpkS49mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022534;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=mY/FNLYTzlT6/9iFOU+8LtK9dRUupasMtXWg1lgUwjY=;
	b=p3lSe2T0iHQVorNK3ezdbmu3ygziI+9XjYu7If1u4aZugPSe4/jAHgaZvOzGsL7Zwg5e
	 PGxGTs+XhapUObaD5BRwX874ujl2JIvdVyWSAb4xEQWXQKc5rEoVr+iKp5Ot7nQDu+tJb
	 XwRLbAMVg+YBCb+bZqJ25BdmRfSbAeoOddYFz33uI80KOqHxwJ7MiwcGmG2yQ7TGxsD6o
	 cfuPGreVEygMhYWLLK4d57Olu2hba6bOkBpUIJediVDYRwa6w8/gg5Zv/zcDF9yOV77Ir
	 4PWExW3/Y4G4/hbnhlbm8gbM48HerF4+sXtDsLVtCZiDYOPeDw5+jSdOGK5uvu0JC7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QCmbXsw9;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1DD606A320
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C1DD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QCmbXsw9
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdb9f760337so29040a12.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 09:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022534; x=1795627334;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mY/FNLYTzlT6/9iFOU+8LtK9dRUupasMtXWg1lgUwjY=;
        b=Lt5W/2rk1ihTJraDih/gk0gAK8y+GMJcN9veXc2MbrcPHkZQVli1JK69Ko+PDqVyWY
         hCHU6qumgQsEmrx02MgcqqiumT54i5fgf1wi4MMXdd9NWxVBbGoKWHA6xD4NVz1EOSiH
         HzjlC/U2/SZlR+o8HmfRY4antA7zQe2g3tqEvFZX2T69SbSf9wUdmvOv+QSupuPn+xiC
         UIpSuin0KkwsXrg/X3GN5B5uGn+1uVJjRTa6+gQ9HddalNzWzr410+nSQZ/2KsbWGj0c
         PNbr+7PaSnUBIBMj1dZ4lPo8ZYUj1jWLSzLE3MDtoGIJ853Rkbao+QL8sXPCIoLH3KdW
         ucXQ==
X-Forwarded-Encrypted: i=1; AL+hErEB4l7XST5trz14z9vQxP+NHzuTrituPULmAMxvYg+4tChtlWpkxVQBqRc2WZtaLPM4zqgd/atwO1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kICZQArIlTpcKwKHpN5Kzc/wyPIXeEfORJhMkaerYX8hLSfzn
	mHWyJYb+1cfQS/dBaYCeYVthrinWFTPjiHNBSduF1jnI/ZB4Bf763Abf6VUm4pZ3B1yz3j9mPXQ
	RDcXKwQHCV1kVxRXn0LpTj7AsHpHm213RKY7f4qkNhIqWLj9U6rDJSonJSQ5EoABu0LqEBaJoeY
	k42i4sazEcxNer9mvlECu9PRVcbOzIFuBZlFY+bi1+JuiqwT0eLvlvZumDXR9mS59YD6501TPvT
	091GX/BXJjX+ine/9nc
X-Gm-Gg: AZFdTZe/unu5BGG+zGSXriMll7Em+EnNyhEGoePKgH3G3nQUaZxq75gpm08PptODG+f
	7YRe0jwq6Iy0bKeQGmANn3IQVhf6jNHQEhrSgeMjaXDO9HUOoZvSW5LPmMrnLZYa/mHk6/Boav0
	l1T2V+R11rLzkYqpJ6a9ktH9d7a1egBs9vmFhggGuI/ngwBIydU2rkq+R4c4L4btFP7FFbqYQN+
	HBatfrof/nrgvCn53XBbx1wpbaeu6POYX3WBqS+veNQP1iuuAod1hw+CEa5UP8CO5nah0eg45j6
	uonQUO+vLajHpcj8LjKIURJJLr6ZZnJ6SWFkFfZB07Hw11zgdUqOJ2XK0etuGXezZlCIHjYkhcW
	7mPpFV9XzWrpL3k+p5O6gtIPEvPz5EzyPzWPzR84h/5mRXrx+yYoF3yGEWRn6IhgvsPdCVmQGlO
	piJa42yjTA7woCS3j/MmakJGQ93WFMeh/vqP5dze6J
X-Received: by 2002:a17:90b:528b:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3b3f5b5292fmr96855a91.15.1795022533575;
        Wed, 18 Nov 2026 09:22:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6bb5f6fsm71671a91.5.2026.11.18.09.22.12
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:22:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd97f89731so17129a12.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 09:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795022530; x=1795627330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY/FNLYTzlT6/9iFOU+8LtK9dRUupasMtXWg1lgUwjY=;
        b=QCmbXsw9Q7pbMssiRJAA+fDmlvxstuKAuNkfpYE570k5fb06Uh/ls5PbiHErevwLaK
         AsntTPCiEwGG8Lq2VJ7UDGXF+bLPcTfvIdd8ccKdMmaz+sFvHJy8hCMPYEFieADslYZu
         JJ3GvdAJWpPG68HtpInXd+6sv4Y2hXAv808Jo=
X-Forwarded-Encrypted: i=1; AL+hErEylpHyz592czmEM/x4j0Xlx+F9QtcR925ly9c5CHXETLu3KX+M95TcvPbVc6GW3Yp4qT7AYiPg6rQ=@vger.kernel.org
X-Received: by 2002:a05:6a20:1611:b0:3e2:28f0:b360 with SMTP id adf61e73a8af0-3fff0101ffemr132532637.0.1795022530130;
        Wed, 18 Nov 2026 09:22:10 -0800 (PST)
X-Received: by 2002:a05:6a20:1611:b0:3e2:28f0:b360 with SMTP id adf61e73a8af0-3fff0101ffemr132501637.0.1795022529163;
        Wed, 18 Nov 2026 09:22:09 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde53506b98sm312451a12.30.2026.11.18.09.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:22:08 -0800 (PST)
Message-ID: <e8714dba-f51a-40a2-9bda-be49fb3b16ff@broadcom.com>
Date: Wed, 18 Nov 2026 09:22:05 -0800
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
Subject: Re: [PATCH net-next 4/9] dt-bindings: net: describe the Northstar
 flow accelerator
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 horms@kernel.org, corbet@lwn.net, jonas.gorski@gmail.com, olteanv@gmail.com,
 pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
References: <20261116222519.1416501-5-florian.fainelli@broadcom.com>
 <179495816151.3136.14110323389854628043@kernel.org>
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
In-Reply-To: <179495816151.3136.14110323389854628043@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/17/26 15:29, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The flow-accelerator register resource in brcm,bcm4708-fa.yaml
>    is modelled as a standalone MMIO block with only `compatible` and…
> - [Low] The new brcm,bcm5301x-gmac.yaml schema is selected only when the
>    `brcm,flow-accelerator` property is present (`select: required:…
> - [Low] The FA binding description calls switch port 5 'IMP5' ('Switch
>    port 5 (IMP5), connected to GMAC0, ...').
> 
> --
> 
> dt-bindings: net: describe the Northstar flow accelerator
> 
> This commit adds a binding for the register block of the
> BCM4708/BCM53011/BCM53012 flow accelerator. It also adds a schema for the
> brcm,flow-accelerator phandle on the GMAC2 BCMA Ethernet node. The
> description covers the second CPU path, port 5 to GMAC0, for exceptions
> that bypass the accelerator.
> 
>> diff --git a/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
>> new file mode 100644
>> index 0000000000000..f744b23433c46
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
>> @@ -0,0 +1,45 @@
> 
> [ ... ]
> 
>> +description: |
>> +  The flow accelerator is inline between GMAC2 and switch port 8 (IMP0).
>> +  GMAC0 and GMAC1 bypass it. The GMAC2 BCMA Ethernet node references this
>> +  register block through a brcm,flow-accelerator phandle. Miss packets carry
>> +  a prepended accelerator descriptor in place of the embedded switch tag.
>> +
>> +  Switch port 5 (IMP5), connected to GMAC0, provides a second CPU path for
> 
> [Severity: Low]
> Should this say IMP1 instead of IMP5? The b53 SRAB code calls the two IMP
> ports IMP0 (port 8) and IMP1 (port 5):
> 
> drivers/net/dsa/b53/b53_srab.c:
> #define  B53_SRAB_IMP1_SLEEP_TIMER	BIT(10)
> #define  B53_SRAB_P7_SLEEP_TIMER	BIT(11)
> #define  B53_SRAB_IMP0_SLEEP_TIMER	BIT(12)
> 
> This description already uses IMP0 for port 8.
> 
>> +  exceptions that must bypass the accelerator, including TCP control,
>> +  low-TTL and oversized packets. Describe that CPU port with an ethernet
>> +  phandle to GMAC0 and an internal, 1 Gbps full-duplex fixed link in the
>> +  switch's ports node. Port 8 remains the data connection to GMAC2.
> 
> [ ... ]
> 
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    flow-accelerator@18027c00 {
>> +        compatible = "brcm,bcm53011-fa";
>> +        reg = <0x18027c00 0xc0>;
>> +    };
> 
> [Severity: Medium]
> Can the flow accelerator be treated as a standalone MMIO block? The example
> address 0x18027c00 falls inside the 4 KiB BCMA window of GMAC core unit 3.
> bcm-ns.dtsi already describes that core under the 0x18000000 axi bus:
> 
> arch/arm/boot/dts/broadcom/bcm-ns.dtsi:
> 		gmac3: ethernet@27000 {
> 			reg = <0x27000 0x800>;
> 		};
> 
> The binding allows only compatible and reg. It has no clocks or resets
> and no link to the GMAC3 core. It also does not say that the hosting core
> must be out of reset and clocked.
> 
> Later in the series, bcm_ns_fa_init() in
> drivers/net/ethernet/broadcom/bcm-ns-fa.c maps this node and writes to it
> straight away:
> 
> 	np = of_parse_phandle(parent->of_node, "brcm,flow-accelerator", 0);
> 	...
> 	fa->regs = devm_ioremap_resource(parent, &res);
> 	...
> 	writel(0, fa->regs + FA_STATUS_MASK);
> 
> Nothing in bgmac or bcm-ns-fa calls bcma_core_enable() on core unit 3.
> bgmac_probe() also rejects core_unit 3 when that core has no MAC address,
> so it never gets enabled there.
> 
> Suppose the bootloader leaves the GMAC3 wrapper in reset or clock-gated.
> Could bgmac_probe() for GMAC2 -> bcm_ns_fa_init() -> writel() then take
> an imprecise external abort or hang the bus? And if something later resets
> the GMAC3 wrapper, would that wipe the programmed FA state?
> 
> This is inferred from how AI wrappers usually behave. I have not checked
> it against the Northstar register map, so I can't confirm that GMAC3
> hosts the FA. On BCM53012 boards where CFE leaves core 3 enabled, it may
> work as is.
> 
> Should the binding describe how the FA relates to its hosting core, or
> the clocks and resets it depends on?
> 
>> diff --git a/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
>> new file mode 100644
>> index 0000000000000..76fbe2abf5152
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
>> @@ -0,0 +1,27 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/brcm,bcm5301x-gmac.yaml#
> 
> [ ... ]
> 
>> +select:
>> +  required:
>> +    - brcm,flow-accelerator
>> +
>> +properties:
>> +  brcm,flow-accelerator:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      Phandle to the BCM4708, BCM53011 or BCM53012 inline flow accelerator.
>> +      Only GMAC2 (BCMA Ethernet core unit 2) has this connection.
>> +
>> +additionalProperties: true
> 
> [Severity: Low]
> The "Only GMAC2" restriction exists only in the description text. The
> schema is selected purely by the presence of the property, and it sets
> additionalProperties: true. Wouldn't a DT that puts brcm,flow-accelerator
> on gmac0 (ethernet@24000), gmac1 or gmac3 still pass dt_binding_check and
> dtbs_check?
> 
> Nothing checks that the phandle points to a brcm,*-fa node either.
> 
> Later in the series, bgmac_probe() in bgmac-bcma.c enforces the rule at
> runtime:
> 
> 	if (of_property_present(core->dev.of_node, "brcm,flow-accelerator") &&
> 	    core->core_unit != 2)
> 		return -EINVAL;
> 
> So a misplaced phandle makes that GMAC fail to probe, and dtbs_check gives
> no warning beforehand.
> 
> Separately, the file name and $id suggest a brcm,bcm5301x-gmac compatible,
> but the BCMA GMAC nodes have no compatible. Is that naming intended?
> 

[Medium] FA modeled as a standalone MMIO block

The register block does not overlap the GMAC3 node: 0x18027c00 is in the
GMAC3 BCMA window but outside the 0x800 bytes described by 
ethernet@27000. Per the data sheets, the FA is part of the AXI MAC + FA 
block together with the four GMAC cores (GMAC3 being the block's 
loopback port), not a separate peripheral. It has no clock or reset 
input of its own in the DT, and BCMA wrappers are not modeled as DT 
clocks/resets.

I cannot tell from the documentation how the GMAC3 BCMA wrapper state
affects access to these registers, so I am checking this on hardware and 
will add the core enable to bcm_ns_fa_init() if it turns out to be 
needed. v2 documents where the registers live in the binding description.

[Low] IMP5 vs IMP1

Agreed, port 5 is IMP1. Fixed in v2.

[Low] GMAC2-only restriction / naming

v2 restricts the consumer schema to ethernet@26000 with a $nodename
pattern. BCMA GMAC nodes have no compatible, which is why the schema is
selected by the property; the description now says so. dt-schema cannot
check what the phandle points to, the driver validates the compatible.

pw-bot: cr
-- 
Florian
