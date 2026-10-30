Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380273;
	b=cPMJ/ieEcoW/caQNJTlBg1ArmFs+U0xsLN4HPT+jP3JSTvIQF9fRGNY+4vEWbBXNlDnu
	 t0ph/8qeSgZfg/Sakbm/OCcKPT5C4f3lML8EdyC7EItYWxYD2Kk4B8Tmt7PCc8LK5cZCD
	 LGwl5Sujf0ziq0g/w4vygPizwZdwH8TAyD9bwpvYYKsM0UWhXQuTk7bHWUJMO9EElzBik
	 F8+UR66vsNp0rNucOw+TGqAIs5ezbW3rgOCORVBTu/nauBFqcdV3D09OJ+XE6ftwNhamu
	 2dFV65K6/A32ZmA6q6a+NLa+S2RBf7+RASUQa7LAVIUdf313mHhgs8wWKUyJPl4G78w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380273;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=;
	b=HS8At8bHvx22RPCboNXoyu9uSvspZ6HftetWySvVKDg66gVwKbbIRuh4uva/pbfTeXvC
	 algAUMKW96gEFzQ3VhrgwKSKG499WXgZ2cV/DG3fnOwTSPeb42JDKRG3VbxvGODd5p5A7
	 QYmKX0LUs1YgGi1T/OQyWPNVXZcjTBYapuW4CmPKldT6L5CgmswoolP3auYesKrkNl0ox
	 DKLJ2L+Xy2jrBfMVowUUIlmllxJUwylo9m9fJFDMRuXlCUrVyDOxTCEDCKWZP3npiLX3t
	 xFYBIuAdsBsXwqlLZeqHVWpEKbzba7udTXo6e7clCmxgRylTH2tDCOAPQxdvwhrdh2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bgUrQZBb;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74080606A320
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 17:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74080606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bgUrQZBb
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e946155442so8872255ad.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 10:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380273; x=1793985073;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=;
        b=uqZSeyEJPDBHv/p4tkaBJpQiYNOLaim+T3mV/OG7iLOg+dCCsRWHx5W3lzQpXKl18F
         hQsVV/QRbafyDU3BhZ2As20JLN/bbS09qvv0yEwPUgzawfCdXcfZ5l+Nr4SApRKEEJ0j
         hbf9Tm1Ul2I1J7xmM46Vs4G/bTLUprd10z2M47ys1/xTIClsa/fe3lFRh9X8T0AEaB3i
         5tYco9APMtAy4iyznD8HORqksq9+LF3Aid/d0JhfR9vnOi/Udl1+DCgTgdCxUblNMtCn
         h0UlMfY/FmwJz0zDacv0FXCm1wfTbAMBA8Dz8O85z2Ze21Pp0cerc5sz81wuB1pWD39K
         HbPA==
X-Forwarded-Encrypted: i=1; AKwUvByQm7TN4uuhC93cm3tSLpXLjd7ShYy5Mbj5mtUsCbv64aTbWpLfNq/ZNaC5SDHriG8dzmZ77bHlfdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+99axN2A/0li1rcKic70oNzDuHATjIQjaCGAux+QaNhCqPyyb
	74h9IVilq1kOxw5szIe+W7O3AHQcxY2/+tcZJPG0SwkYLtpv9WPgdaUQizdvY7Xsj5jHNT5nAbc
	mkBIHBJdO8tNR1Aw/9hKXvoEMKpQOxuUsRtW1bV4xqVI9Djw1e7oZD4RyafFQiqhuk4svvdJW4J
	F6SGBEMJN+bSB+HqjCKt6ndixbmLh8X94XGzJiKeSYwXwIssn6lt4MuJ0jIWljTMmEt9pzhb+k9
	ChmrNC7QFKEFc9VNGslEq4=
X-Gm-Gg: AYBFou0LFZ1SNO7n5coI911nKaAMAjKa3iWe5yZWhz4Hw6XJ3/KpS0Re2vUMnFjdZUj
	BwYkTLx+KoIZznt8oodc7RUQ+GLtmTMxmGa0ujhCOICGPpAKcHsRnjaDRSE0oZEKNTYHD32SkTU
	h6g3FUQ979na0n0XPuNxaZndUhavCEQq1EvUGrGhlII1v7FEgeulbiQkO1aIEHYTsMiX8rnxt3J
	8bI2PpxGzF5ytto47jSGAa40a1+50/1k3ZHSdQD4adsCZPS/USnNJ/zgnMlIEQmZUxDYRRhh3aY
	u4NNZFo0ujM3WP1L2Wkq9A0LysJJsOkLPKnIJv6fxxQySxvn508IWlhDZ5enxjbDpVwo4O+dv7N
	qEZbxwxjgyipdZJ34bfCwzyy6jHe514P/HTJFd+Y80YkbpCSeRdXu5qa1VDdHCOnvq8t8aCBi+H
	JXWDeFRwkK+h+iB7jdVdG2736HIKeBo8dWZbwzpCe3
X-Received: by 2002:a17:903:41d2:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2eb364cc505mr29210875ad.30.1793380272735;
        Fri, 30 Oct 2026 10:11:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eb3927ed16sm373275ad.45.2026.10.30.10.11.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:11:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adad90c894so1023313a91.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793380270; x=1793985070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=;
        b=bgUrQZBb2tNfUPun5eU8IVGbdPrnAVgHt4ZkP/K5DuDIYPsV8Zdlejkg6JrcDSOUhm
         /J/9RUEYgID2sN0fFZd/v/GYpM3Rothfl/8P/Ps3YuJDYaeLLiJXbWLBqRL0IuGQhIXt
         6myZ17i5yxHS79H2HR9k5F8qSWwIKdHOmaIeo=
X-Forwarded-Encrypted: i=1; AKwUvBzkmKInrWCoNiRXbeN646ACSKV0JqGpVIpROAd6o9Na6pAN2VbHwOAPN3paBVYW/G1o582zwCRl6qw=@vger.kernel.org
X-Received: by 2002:a17:90b:1c88:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ae898510b3mr2474484a91.53.1793380270415;
        Fri, 30 Oct 2026 10:11:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1c88:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ae898510b3mr2474434a91.53.1793380269908;
        Fri, 30 Oct 2026 10:11:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845e71a7sm4640721a91.15.2026.10.30.10.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:11:09 -0700 (PDT)
Message-ID: <d1436c92-b7a9-4220-a69a-1ec72eb9f5bf@broadcom.com>
Date: Fri, 30 Oct 2026 10:11:06 -0700
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
Subject: Re: [PATCH v2 0/3] Support for BCM5301X AXI trace PMUs
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Besar Wicaksono <bwicaksono@nvidia.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:ARM PMU PROFILING AND DEBUGGING"
 <linux-perf-users@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
 <auSHoj46Os6gSEUH@willie-the-truck>
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
In-Reply-To: <auSHoj46Os6gSEUH@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi Will,

On 10/30/26 05:03, Will Deacon wrote:
> Hi Florian,
> 
> On Tue, Oct 27, 2026 at 10:51:21AM -0700, Florian Fainelli wrote:
>> This patch series adds support for the BCM5301x PMUs which are AXI trace
>> engines present in the chip.
> 
> Do these replace/interact/support the series from Ian at:
> 
> https://lore.kernel.org/r/20261002175738.3242646-1-irogers@google.com
> 
> ?

This is a different piece of hardware, I was initially hoping we could 
cover it using Ian's PMU driver for 2835/2711/2712 but it's really much 
simpler and different on the BCM5301X SoCs. Thanks for checking though.
-- 
Florian
