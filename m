Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FF333A71A
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569196; cv=none; b=Ib8uV5HI0nddhEBfVjw9nRpCL42N7WMEODxDER7dAqQzXS6K/rytN73OyGgaf8jb01oS+iQrrNF2f4t+7rOax7PYOQ5B9lwstjHL8Rc/stkJtRQzQQ1tFfqlLlxe6Ih6C5LAlZdId1EneeEFc8SA7bfugVLDvEHiVJnIi75LqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569196; c=relaxed/simple;
	bh=PytOZzTAioEaMxmqRTBvSzOZkl5VeEfXc7Gpm4o827k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bu4Lx+MHSHdUuQIwpVpKDg/aV9Vo/k9BFr7/Oaz2bSWOOUxfi524y3XXxwk7CKOki810WZ9Mhax3Dix6I+QFPxDgynjIc16LXzi9JwNm5icfhB0T3JEH93FCct1A7Sou3xdz8U9YGVGmeUUVIDVt+yDj8GFi8Z99C8WfItagHHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i7J7c6lb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i7J7c6lb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso35409785e9.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569192; x=1764173992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+urd6hZuWEo3shlMiSBaDb8+AZAhwgeZeQG9S0pL0o=;
        b=i7J7c6lbrMqM4bhWz2El1n5qY2ckcy1Hb+MurA/Y8nNsbyzVeBbQI6VXaXz2TNOV4n
         pvx1D3BMmxAWRBpjDoswA6pj/X9E3gQJ40wJIh5cLC3lywSy5pj6xbbt1C/t4Q5GxvOb
         fOeaFYGSm54aF1MOAY/Khap1OsuVpugDVBe3h0432kXcNSZQbeccwEm/O/KFwINVVMiX
         SETGkX/u4Gac9Tx26Vdi+9JWmpg73mkTdOAao8m2XjyD3vUjWW9s7BEdRGG95m/gk0OC
         jd0cY1O2JBX4hYl3kHzS6aCX0qF1nbUVw8DqujzgGHSHD3p7j8jAHxlKSpYGTfg/kbQT
         DHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569192; x=1764173992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+urd6hZuWEo3shlMiSBaDb8+AZAhwgeZeQG9S0pL0o=;
        b=F2u6wzeLVIFDmXG98qrUfVmevbiNCbnsfXUc64c1q4LnrWNs503fLVFgEy5osYGRT6
         4S1upHxwyAz5V3uyS99zNBCiT7CRODo3eaTZ2B8JVoMeG+9PhWXwr/326yF0BbXwQGyZ
         RVao3kabdyeikZ1FpLgpSpQ1/TzqouXeAZtrorr2ZWxcOoMbsVlUkTZjiSosm1VR/cSG
         r2+1xWN+A3xvLOgSWAn+SQP8iwhAORVxPamA0sCEIJwTaFoFTr/SJtL36lhtV6/jmifG
         OTolsdPZybDosuWQPFCgC6cA3LELa64xlUnCgkayVRI6RKkC2zVLEh3BXRilxxxQkhYL
         1hSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcS7rDpCezytKwnegTJjU3CV3nHBotjXzfY6CLWgFvE+wExuB3V2IQZKQ1jaI5ZVHCR0GStDlLuyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLg2om72h8q3UXZWaMS8L8UKjR36Cf73jS6yvgSXlFetg5TUj
	gi2pvPu6l6uBHYmbdEI/BhqjlMViT4tyt4WOQI2S0a7f9/fB1delQoXKhpY09GT8F5+7U9voor7
	nfP+hB6XNPg==
X-Gm-Gg: ASbGnctX0BevD9sCozF7GrOY9AqNMPPaD+477xKcKE8dLG6+0xDMWbRtUmJOd5HsKWM
	KjC5ZH2yg+PMII0IdV1aWELoBHphBzigpGcFrpXfQXXgcOMYuJ1Xo1hD/+pEouW2CaFp8ZGGLDf
	X7znitDjj3tptuutld1GZh0xl5nvBZ7H+k2QbS8RFyFUkPU/cjIjSb7Y0mP4qjr7IsR4LPwl/vg
	zN85/XIJshJz/vVjHMSu0KFKn0fWi5QQgSNlAuJaQARCJh+I81XTaNeoYuh996FBYyasx1Tr2zr
	Tsdl3Odsf25UXooyUqZ2eT3LsF79nwVJ4VW1skoG1rQyAVIv5XY9frrETQIxQnK5841Yl4S3jTt
	KEFI7HgJt1Vq090FkxDDKCknJufJY6gWIahFOzvvpV1DMiM/uzrPMsU49x/frHpXL4iAIArhD72
	oFsDsYKV1Prs0hyyXiyZx8VFSvM6v5
X-Google-Smtp-Source: AGHT+IFwK5aAXHXIDIc3E2JseMPHhoLC/8O7sdHZVlYBJKdiPiGNYDVrkfdVj41qV4fzGcHy4cnIEg==
X-Received: by 2002:a05:600c:4513:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-4778fe5c820mr231183085e9.10.1763569190918;
        Wed, 19 Nov 2025 08:19:50 -0800 (PST)
Received: from [192.168.0.39] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffc90fsm61424875e9.2.2025.11.19.08.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:19:50 -0800 (PST)
Message-ID: <060e7412-8f1f-4d31-af39-79213c560e85@linaro.org>
Date: Wed, 19 Nov 2025 18:19:48 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/26] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, david@redhat.com, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-26-eugen.hristev@linaro.org>
 <e73bdb23-c27b-4a18-b7e3-942f2d40b726@kernel.org>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <e73bdb23-c27b-4a18-b7e3-942f2d40b726@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/25 18:02, Krzysztof Kozlowski wrote:
> On 19/11/2025 16:44, Eugen Hristev wrote:
>> Add documentation for Google Kinfo Pixel reserved memory area.
> 
> Above and commit msg describe something completely else than binding. In
> the binding you described kinfo Linux driver, above you suggest this is
> some sort of reserved memory.
> 
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>  .../reserved-memory/google,kinfo.yaml         | 49 +++++++++++++++++++
>>  MAINTAINERS                                   |  5 ++
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
>> new file mode 100644
>> index 000000000000..12d0b2815c02
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
> 
> Filename based on the compatible.
> 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google Pixel Kinfo reserved memory
>> +
>> +maintainers:
>> +  - Eugen Hristev <eugen.hristev@linaro.org>
>> +
>> +description:
>> +  This binding describes the Google Pixel Kinfo reserved memory, a region
> 
> Don't use "This binding", but please describe here hardware.
> 
>> +  of reserved-memory used to store data for firmware/bootloader on the Pixel
>> +  platform. The data stored is debugging information on the running kernel.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: google,kinfo
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +    description: Reference to the reserved-memory for the data
> 
> This does not match description. Unfortunately it looks like you added a
> node just to instantiate Linux driver and this is not allowed.
> 
> If this was some special reserved memory region, then it would be part
> of reserved memory bindings - see reserved-memory directory.

I sent this patch for reserved-memory directory, where all the
reserved-memory bindings reside. Or maybe I do not understand your
comment ?>
> Compatible suggests that it is purely Linux driver, so another hint.

This reserved memory area is used by both Linux and firmware. Linux
stores some information into this reserved memory to be used by the
firmware/bootloader in some specific scenarios (e.g. crash or recovery
situations)
As the firmware reserves this memory for this specific purpose, it is
natural to inform Linux that the memory should not be used by another
purpose, but by the purpose it was reserved for.
Which would be the best way to have Linux understand where is this
memory area so it could be handled?


> 
> Looks like this is a SoC specific thing, so maybe this should be folded
> in some of the soc drivers.
> 
Not really soc specific. Any soc who implements this at firmware level
can use it. The firmware can reserve some memory for this specific
purpose and then pass it to Linux, so Linux can fill it up.
It just happens that the Pixel phone has this implemented right now, but
it is not constrained to Pixel only.

Instantiating this driver with a call like platform_device_register_data
would make the driver unaware of where exactly the firmware looks for
the data. This is right now passed through the DT node. Do you have a
better suggestion on how to pass it ?

> 
> 
>> +
>> +required:
>> +  - compatible
>> +  - memory-region
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    reserved-memory {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      ranges;
>> +
>> +      kinfo_region: smem@fa00000 {
>> +          reg = <0xfa00000 0x1000>;
>> +          no-map;
>> +      };
>> +    };
> 
> Anyway, drop, not relevant.
> 
> 
>> +
>> +    debug-kinfo {
>> +        compatible = "google,debug-kinfo";
> 
> Device node with only one phandle to reserved memory region is a proof
> it is not a real device.
> 
> Also,
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
Thanks for your review and suggestions

> 
> Best regards,
> Krzysztof
> 

