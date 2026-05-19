Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D726540801A
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204552; cv=none; b=uzUTq+g82UHmOBksBWHbgTFhrXFy7jvVkSRPfY8X8dmYBQKqU7W1YSmpj0XZ6G3S+xHc8rFcZ5MF9NZzQwyXWPKUkieyakLAdoaPghCW10VDfa3bgMm9wu4CYgSgr88IrtZJqNe00K2MR175in7GHcxggil5Lv8YeIeRDMb5It0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204552; c=relaxed/simple;
	bh=GYEQ9w3VV57pezS1h6pAlX0hH6C/t5Vqgbmi39hHnpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHSDLnXfAg4V69O07SEMoMt7xdU1pIkRjOGGNzkfZREuVSWyBIXvRz1POmli4F5THRJ3DoSsuVeuM/BTv/fk53GOdX5gNrSPZhfvridTiVdgvl7+p73+v8T55pOJIHdBEvWC/kH9/STAt1BZNWzO7n+LeL3/T3LODzmWaABJJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Vwu0Ubwg; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Vwu0Ubwg"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-7bf14e33f5bso31951317b3.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 08:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204550; x=1779809350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhiHL8lJqMLwH/tA/yyEZXng5kcabiZPDcP4lU8JGSY=;
        b=ryStlAKunCKKSn5iLc9014DRymXO2c04opnF74GalUXmyC6yLyRa26XguV4SG+6+4R
         DnOBQhTXCEKZ6J+NYsZLTsigTWtvodmOH68LJ/nAfggpWP+edvOce6xJ0JG7OQmu8IcW
         iQCyuyWC1r7Ri93GPpEUfc1pXsvVPj4p7JsQfyoALTh02WvaeutW8YhzrmygSGZ3IME/
         0jefnpjwu1YcalwLpENhzQUdDNrvaPLlXlOriPiHlt5uqXReeV9Oy2F3YMMNnscJBr0t
         HIdegqUQA2HwPpFpX3QtrRcc4guG4Own+WEE/61SfGhr0ReFJ6Xx2OyzYhQ+v4BuVYdv
         C7Lw==
X-Forwarded-Encrypted: i=1; AFNElJ9RPoC68pCxoQNbdXg2FXcfnliNqOeyGnbHjJKLRh9QXq9MPymUUf8rymJvLEb8n2SX4YYklkoiDJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wCPmK4UyN/IyFNkVb05BYMb7z7hKjlxvnUin805vyJMjAwUe
	DDl0Obi7jiCyZ1ydAMhYoy59tXW+vbjcyJop3VKs1Pl2rn/bR5KGuTVK6F8E7U6NVyXnOhe/C4M
	4+/mtbTPR045WnvQt49/2x7d8r6+FfVwmZ2futYouAliOMt93ZMcU32Z+pQFxSc6+R0+4DJHbC6
	Y7kqEKkTNqGyyXeVxq/QgCs4UFnT21g3jIJvCDb1BaEDJNNkI95T2cRu0hQkYybKKZpJmMje60c
	d0x6Fg+SmmSF+epD+Vi
X-Gm-Gg: Acq92OGWYm/rssJEiKDFu0Z4n0JHR5T6DZdHI7J6E20OmdBWHkhrnZKdxzA79ptFrA6
	GidPXYTXGo5IvCcYwi/JapGopdcSOJcprA/SeLa7/8LV2idfVcR/BHU4XBGsnLVoqmjCk/50/ZW
	sqmvoE4x25SV1kRVBsYYjcGZVJhPNmIqmTiUjvITcSeJdeEDn7HewznspJ/CnWZ8bk7JtrgOm2u
	rjZxo1un3DuF1caBcZ2YFBapGY6Y1oDm47LOVxTTDbGhud5d5eVqevtS69FWpvmPyctOxmrz9yS
	GQOhJ/bvljx0FmEYjfbAsrgqhCMkfkfrIhUcP5dFE40zJdm2ZH7EWD+aKtj6a+L5dQzS1RHJY9t
	GcRI5RkLrnok2CwtzUm36tcJesSA/2zr/9MMOAQw4u9Qf0e6SxKIcC1ZrdfSy0BFuvgv+CctVbt
	0Va35OmtGlPv5CujIOEu+x32Hdh11gqD85pghWLlt/83AK2YqvGB8jtR+u+Y4g6g==
X-Received: by 2002:a05:690c:d84:b0:7cf:d9bc:8079 with SMTP id 00721157ae682-7cfd9bcee40mr18333197b3.32.1779204549622;
        Tue, 19 May 2026 08:29:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-21.dlp.protect.broadcom.com. [144.49.247.21])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7cc9b72aedfsm5674427b3.24.2026.05.19.08.29.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2026 08:29:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f4bdebe77so753926085a.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779204549; x=1779809349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FhiHL8lJqMLwH/tA/yyEZXng5kcabiZPDcP4lU8JGSY=;
        b=Vwu0UbwgM6utIFfCpJfssdwQ4ISNb9+4bc1o12i6cO7lE31+h1KcbLfuZ/+kBHyC9m
         lp+wMGU5dIREnKiWV8JnftGPf5d2CS44nG5z7DP+BSDzEDTg130PwcV0sZpplKwDuTeE
         gD91c1JoTfKeUuN/jS2zkHnpy3xALNOq2YlWk=
X-Forwarded-Encrypted: i=1; AFNElJ8BsKWIHoJUv3iZ/zb7Ujz4XTk9XFJD8oQKxPR5tsijnLQvCJreglCellRIsvWwLI1WEhZKFkXrSDs=@vger.kernel.org
X-Received: by 2002:a05:620a:4492:b0:8ef:3953:7ab with SMTP id af79cd13be357-911cea09723mr2975878185a.40.1779204548820;
        Tue, 19 May 2026 08:29:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:8ef:3953:7ab with SMTP id af79cd13be357-911cea09723mr2975869385a.40.1779204548070;
        Tue, 19 May 2026 08:29:08 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83b85asm1860419685a.25.2026.05.19.08.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:29:07 -0700 (PDT)
Message-ID: <edff09ba-f21e-4009-9b9f-4e7a9f630618@broadcom.com>
Date: Tue, 19 May 2026 08:29:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
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
 <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
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
In-Reply-To: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 5/17/26 01:04, Shubham Chakraborty wrote:
> Add Raspberry Pi firmware voltage domain identifiers for the mailbox
> property interface.
> 
> Also add the voltage request structure used with
> RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
> definition from the firmware header.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
