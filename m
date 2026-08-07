Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5063D1CD7
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088595; cv=none; b=WoryopJbv7mu4nmsHsoCtOEfTTQiGkbNBTHzx0u3XaTgCe0F+cYtbY8ycA4ZF3/Kv9wEypevoCx8yn8IdpeWs9E2KK6cCe6BdGolMKSRA2YcU/cFnGyEAFpkZOL3b4CBvPDvLuKPemr6vnRXzheTtSEsyvhMSJmo9vqlnxkYf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088595; c=relaxed/simple;
	bh=Fmz7AZKsG717uv6lMqTfuAi2/NLNUBtufTTMjxplSxo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LWZI53+aZgtFx0keYXc9sv5nETA6wM9w9ZCqaxwcIv7fckTYjCt3A2YiXnHL7PnKxgQLLluS9VuE2io1H9rqnHYxDmxalktsuWGPRwQ2hqTklqacmaIl3DxYY57S96bV++kvX6MVl6lbw/HtKilc3TI2K4odlu7qeF52UMUc9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=Zpxz7bwX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="Zpxz7bwX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48000c5d6d3so169488f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 00:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088591; x=1786693391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=;
        b=Zpxz7bwXGqAQFGv5PhjdSyJPFIWEp3OMNBntnE2+0fOpWXlu9qJpNcMHfD2QONoeHA
         QZKoa02mslXIfh4xhzcGoAVsqYZsTgYUM8zxss1WgEa9Kd4Bwj4pk46mcjUj6GAL0hp2
         1W9pAeMtZGyt2o5HL7swWGMsw9ExEX+OORzU9/iqx6pHEv/+ZNYUlbOqAXKf1c8mQwq5
         WvtAhBAT+j1Ihf3VBm68UaYO0vummBeNuTchK3nVevoAePAu68OZL1iX4aYSbm+i7VLe
         g29L67VQHcCp7WKxTXLQk95OxqUDsGNZBwRf5EvgJAq03fJunVRWaQsODzcHM86xVdOm
         zopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088591; x=1786693391;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=;
        b=fyEES7U8FFFFuUt9ZXbA4JGOjkoQh+PQ7QkbuUT0g6RsEPuA8yHvnYOE45c73QUlH0
         aZG3OJFokxk0xsIDdtrjPEdGeKvP2NYkEgO1OfGlO/gNc6hdCcdhxQ654CundpLT4lQq
         WboXaBajiUQOe1QKxUK1P7x3L9SNmn7003fEz5a7j1jyyZA8K/PnsreRQi1pRd5+auY9
         BVXcmVRwCWfaPgrOCfC5cCcbKN3yPWNScTO7517B85ibs3k+4M9y5uPdUwuHUyYN6J6G
         9I0vzMhhN+9XeKIYbkyYOmCj8s6gh/FGase5BYF7FnBptlYz8IEtoj0rC9oeZu49c9o6
         eHHg==
X-Forwarded-Encrypted: i=1; AHgh+RqtzwaOou2nmWNymE5uZLoXKtJ1iaxYY7JYQlQP+eEB379KWOj4jlwRbBMotA4DJflonvgvTU8O0FU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTuObm1edEqb11W8RkKeOzA/J6iYfKc3xHJ/rI1URmfN9Ay1PA
	zxKPl635l0kGouAYVk0N1C9pWsBqaZHVogqbwrUbUJzpfdFLq3WY79mpUh0S14+NrGfe
X-Gm-Gg: AR+sD11cuz6Gu9qbBy4Ar3fKI0VCjsSe9OwQSP8IrLMClwvJ3a96qOy8WKHptc9L/+D
	MZRU5QXbUfzo9AHRorRGQfuC2SBSAVFbGT3CFskgej5drn9Tjn39+Dq1XSAUDf6IVjVWewmMUJS
	6ZFahuyWzexgwjR4X57/xfTmlib1s7PLRZ4KYWYM9ujBOXyjAHSy/30AinTWOZkxo1edCeULx27
	8NB9Vk1Uh4qXikWA0wILWZOK8Brok3j8MDmNmNMI5WHXRA6bWp4+b48PpUonXsnb5oUWWndwghL
	GWw+UvYiQzi5fDxt8hGJZhbVQ3+aJYAxU39SvLNeqxMuVDNEfTBWVFuv2EAWxx7M677Ar5oqarM
	/IBQiSHA8r4KV9bLpfGoXZDqvGqSBi/swL3B9gUg5zvY6OmVsEGujAdIkKO1hoyUdZ/TnY88ELq
	6h/SJaNLqQQelAeiB7uEyRPcXmRh7IebuEKCgkVPzYD1JwzmGH/kipp/T8YmtPmMK+eRbRxtJ6m
	36sCxG1NzOcjs7SdHJ9ISAEgvaJN7OlpQ==
X-Received: by 2002:a05:600c:35d1:b0:499:5e9e:1f50 with SMTP id 5b1f17b1804b1-4995e9e207dmr18816635e9.4.1786088590793;
        Fri, 07 Aug 2026 00:43:10 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8cd0sm3174147f8f.17.2026.08.07.00.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:10 -0700 (PDT)
Message-ID: <20f4dad8-0ac5-4fc0-866a-38721371ba63@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 3/6] dt-bindings: Add Bao I/O dispatcher driver binding
To: Krzysztof Kozlowski <krzk@kernel.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-4-joaopeixoto@osyx.tech>
 <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
Content-Language: en-US
In-Reply-To: <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 16:47, Krzysztof Kozlowski wrote:
> On 07/01/2026 17:28,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> This patch introduces a device tree binding for the Bao I/O Dispatcher,
>> a device used in backend VMs running virtualized devices (e.g., VirtIO).
>>
>> Signed-off-by: João Peixoto<joaopeixoto@osyx.tech>
>> ---
>>   .../bindings/bao/bao,io-dispatcher.yaml       | 75 +++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>> new file mode 100644
>> index 000000000000..8ca450e4b9d5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/bao/bao,io-dispatcher.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bao I/O Dispatcher Device
> No, you don't get multiple devices per every driver.
>
> Look at gunyah or Mediatek Genio. Come back when you solve ENTIRE
> FEEDBACK given to them first. And then say how you solved that feedback
> because so far I see you only ignoring review of your LLM slop or other
> Microslop product.
>
> Best regards,
> Krzysztof
Thanks for the pointers, and sorry for the earlier churn. I looked at how
gunyah and the Mediatek Genio bindings model this and reworked the 
dispatcher
the same way: there is no longer a single node describing N devices. Each
backend device is its own node with one reg region and one interrupt:

   shmem@50000000 {
       compatible = "bao,io-dispatcher";
       reg = <0x50000000 0x01000000>;
       interrupts = <0x0 0x08 0x1>;
       bao,id = <0>;
   };

A backend guest that services several frontends instantiates several such
nodes. reg and interrupts therefore have maxItems: 1. The driver was
rewritten to match (one platform device -> one device model -> one
/dev/bao-dmX) dropping the internal N-device array, the global DM list and
the indirection ioctl.

I have also gone through the rest of the feedback on the series (the 
ipcshmem
binding, the misc-device conversion, commit messages, changelog, threading)
and addressed each item; the cover letter enumerates them. The binding 
passes
`make dt_binding_check`.
