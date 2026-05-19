Received: from mail-dl1-f98.google.com (mail-dl1-f98.google.com [74.125.82.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E9B34E760
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204502; cv=none; b=Esx5PkzMQId88+NXYEu+VrJi9IBOgi7YX5+dNPkXv1DIbTioC5Fvt5+vIkQVyh2UbLjbK5a31DOq+AgxG25brU/F/buWRp0nBI5SI0wabuIwaKDfLNmPpuYZnNM4rzuqI97ZYynW013CxARiPpomtePDpLmIyGm9vLkvyQcUzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204502; c=relaxed/simple;
	bh=7U3DpHGKHbLVxNQHooKXxFaPlFJ2BrqPpyXAw7jk440=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvtXrBvzhqO3QK+Q3LiDvVNCV5YYUs1BqiAyMQ+dRe2XxJaylMplj76HezirfB/oEfcqwoUZTcqDQthat78JC4K7Kf8Q+lCXOloEvlOYO112hZmSJWLmMNn/Is4ZWUaJZY1SRfYlFDJNTtgq6HaxOQwPIX8wY/7TlGcEep7jHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hEUI5fZ2; arc=none smtp.client-ip=74.125.82.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hEUI5fZ2"
Received: by mail-dl1-f98.google.com with SMTP id a92af1059eb24-1309f4ee97fso4120220c88.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 08:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204500; x=1779809300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ybKseu4uG1MNY6IQoD8TBrLpm9iKlKVO0I43NmR8gBU=;
        b=WeMaPwwL13G+K04YXD/rc/Cz+LXGKeypo5h58lxVgx8KZWbVeaS7/W2n4bX8W/aiuC
         U+KEPlrxuI8Q5mQPWK2r9L9MCh3RTqGHinMv31HpyKp6su+0uZkt3r3sT89nJELmCVfM
         hDEmkA4+mvp6x+dKIJSQIBh2NDRexLsqXbZsMHfbTenJYmFc6EDYxLsNqcD2bpx78+zQ
         LuRbP0e3Y4/m2eLmNam1UTeTo+boEAs1e7ZcLszQDvSY4f4qJcuzYQCfeBh1F77Glh2e
         k6mZIBUZ5M/9Tvmfuo69uuBpjVtVZHRHA4OuVKmfsWMbmVYU+yKkvxBLvJd9Bscuy8VB
         GO9w==
X-Forwarded-Encrypted: i=1; AFNElJ//DCptQ339+2e3wk+arfhbyJclRVFq00xtRNS2IwG+c+kQrB3jGgZGAGcDErfyHG6CPOVOeBfpsbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/FJu2FUA/Cr3LDF+I6y8nKhJUUkJ+8Zklij3aH7G0RhMd/Ias
	jqdSKNQG+fBZrSpk7ms08xCbqoxfbO7pv2Yq8aOG+xJV2pbACt1GNtx5IT015DPgpvq/EM40HI+
	XSLzyKv/rJtQ03leHpC47nge0fGKijAaGyRxgXQ3OQSaIsH098YGWK8WVOIJy95hl9+og1kBXAX
	t8FA9oF2zjNtkD7Zaix4eJkWsU4gpzF7C+2OfIlSczGAV24iUNkmN7wQv3tZXJ110+fKF0OnEkB
	Kb2iamP1Lm6tHUXMk6f
X-Gm-Gg: Acq92OHWNZOewWUh7lBqeYtlyRIBfsD7EzAi+n4dV7rR9pzjmH3RZSNVIf9wD7pyOWG
	QDgphzGK5RIu6AB4sFzQASxdAu6jjCzXNLNq3U59uFVha20UNvih4CejOpqLy3S9M4gLPh54TYB
	XFxiFDYS0CaVCmHNmLfX0Sl9brrUKiN2jR/KjqhQ/m/DyD2bpe/KpRrsKQrEhKxQOl85cNFCiLW
	PgODFW9TVgI0t2UHFJvT8PlZ/78BAC8jZkUWBvDmdmrIgGiuQwAXSrcLhAeb8Mx/dZs/TXrXZ7B
	bfgkAEhskOt4QstMdatAAuDd2mxXGeXwwsEaLabQa9wGHp5I/eiy1aVdmLRPEkC6Cu5Yg9xeoDN
	FaQhH4p5kBl0sVAwexaK65+VzzdhIsNYorF8jdMTpUyWI9m+yyVhkS9eeoCGTwS52FtMdJKFJSB
	CCclRdvJ4QlLBfumkjwIUqrvIuMLEPXhpRdhPdZ5EsFZz/1HvKu+1DzENoejT4Qw==
X-Received: by 2002:a05:7022:618e:b0:119:e56b:98a4 with SMTP id a92af1059eb24-1350441bb1amr8222466c88.11.1779204499534;
        Tue, 19 May 2026 08:28:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-134cc127865sm1998841c88.6.2026.05.19.08.28.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2026 08:28:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b1f4478ca7so124851046d6.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779204498; x=1779809298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ybKseu4uG1MNY6IQoD8TBrLpm9iKlKVO0I43NmR8gBU=;
        b=hEUI5fZ2SM43Ja43CBzkQu8sZwS5MoIiEgboTBYjFWmpmlYu04bISODmyIFR68LAzT
         ACzTRa1IlvsOBHqvMFG43cgJQW1koWBKt8dhwMcTprpTL92BzoQrjk7klIbPCn0ED8S6
         pEmRS9ETiOeaqHzQ/VYF0+g8gnQ06qCXgPme8=
X-Forwarded-Encrypted: i=1; AFNElJ/3k4EtWFx7MmofnRVhwrW4o/Gl+kYUHiGQfcFrTtraw9ngVyKSSIurWrmxyEmGvIBbg1zi7lZmf8E=@vger.kernel.org
X-Received: by 2002:a05:6214:484a:b0:8bd:1f2e:7063 with SMTP id 6a1803df08f44-8ca0f643076mr294961606d6.5.1779204498053;
        Tue, 19 May 2026 08:28:18 -0700 (PDT)
X-Received: by 2002:a05:6214:484a:b0:8bd:1f2e:7063 with SMTP id 6a1803df08f44-8ca0f643076mr294960916d6.5.1779204497466;
        Tue, 19 May 2026 08:28:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3619c29asm93644856d6.34.2026.05.19.08.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:28:16 -0700 (PDT)
Message-ID: <31af08eb-8299-4ba9-aaa7-3150ce31b523@broadcom.com>
Date: Tue, 19 May 2026 08:28:14 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: raspberrypi: Add voltage input support
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
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
In-Reply-To: <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 5/17/26 01:04, Shubham Chakraborty wrote:
> Extend the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements through the hwmon subsystem.
> 
> The driver now exports the following voltage inputs:
> 
>    - in0_input (core)
>    - in1_input (sdram_c)
>    - in2_input (sdram_i)
>    - in3_input (sdram_p)
> 
> Voltage values returned by firmware are converted from microvolts
> to millivolts as expected by the hwmon subsystem.
> 
> Update the documentation related to it.
> 
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>    Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
