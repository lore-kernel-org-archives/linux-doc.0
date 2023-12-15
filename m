Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F25F134C2
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UpknBGdO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c362efc2dso1131675e9.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 00:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702628809; x=1703233609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVk+8aqoSd3lz+vVyrX3uxR+N2mjEYA2Pp2SvzfvFgc=;
        b=UpknBGdOvTS6hsLxlS+j/rkXqCmrNjA3TTosMUL8nRl/7RIhdAizO4Fj6Ig1VtfRRs
         Pc/0ajsfCNOq2NCMVI2yZ2PDa9F5A129bCerTMEtr2l7Y7QcpklCwJI3xQ2C7hSf7Kk6
         VZIJssDxEzB2Y81o49lyGIazsq8SZhULZjjIOmSFxx8705mSiEodi5iM1j8m7SKJwf5N
         CoEP4c5vHRFCLKGPyARJvS8x0ZnDfAajB/v2iJYWl5+kZS0prigUqfteVkrE3VCxZ3NN
         Ov91HDNVDy1TY3eS6Vp4F9pf/Eav7ya0qKnx89VMqIDjclPdm6ONRt6JW7uJqzeuqLb9
         Dmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628809; x=1703233609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVk+8aqoSd3lz+vVyrX3uxR+N2mjEYA2Pp2SvzfvFgc=;
        b=oN8/N0xTTyRZm3mQnhwuNwERk3Movq4uXTx/MWdZIfviowaSRhWdu5ueP5kXhqYTGk
         uvyMarNtEV/VMFeFCfMdYM8fXkxSfEtkOi7Z9P/VOahVfkXjRQhz6s/HN3VR4AZTV/U4
         e+RyloZV7BaVY/xTltTKP8CeoZwphEJB6p0W7mMP8GseQmI4NUgzRyF148THGscTjWIu
         UFXGrvpLm2DUTdFUC6Tweg0Qwj+iMk32xKUazqu2GiMq8qGFIaWdc1aK09JUlzI7mpEv
         n5ld3U+srFCdrK4SFwnM1B/55/GlKu7XXXw7h4f+eI4QkjrWw0bzvA4O2LlJ3WczYCVY
         ZyuA==
X-Gm-Message-State: AOJu0Ywtym+fJcMg5cj/D4UgZJS8MR35cBKjal/I8oBMnNc9Il2lmjfc
	JfWY/FF5MnpK3zVnjONUC3NO8A==
X-Google-Smtp-Source: AGHT+IEocrxdnOGtGy1ng5ykof0pE95Pwp2U/gLHbFTnYy319/r9xmobjdGCTwnBo/H5vvI4WvpUfg==
X-Received: by 2002:a05:600c:1c9d:b0:408:3836:525f with SMTP id k29-20020a05600c1c9d00b004083836525fmr13489076wms.1.1702628809197;
        Fri, 15 Dec 2023 00:26:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:96c0:67fa:945c:6200? ([2a01:e0a:999:a3a0:96c0:67fa:945c:6200])
        by smtp.gmail.com with ESMTPSA id q7-20020a7bce87000000b0040b2ab2b352sm390486wmj.1.2023.12.15.00.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 00:26:48 -0800 (PST)
Message-ID: <2412b8e4-ad26-46de-af45-ad9f37a1ea7f@rivosinc.com>
Date: Fri, 15 Dec 2023 09:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: riscv: add Zam ISA extension description
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robbin Ehn <rehn@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
 <20231213113308.133176-4-cleger@rivosinc.com>
 <20231214-headed-credible-f94ffb712e91@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231214-headed-credible-f94ffb712e91@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/12/2023 15:11, Conor Dooley wrote:
> On Wed, Dec 13, 2023 at 12:32:59PM +0100, Clément Léger wrote:
>> Add description for the Zam ISA extension.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index 3574a0b70be4..912cc6a42eb4 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -171,6 +171,11 @@ properties:
>>              memory types as ratified in the 20191213 version of the privileged
>>              ISA specification.
>>  
>> +        - const: zam
>> +          description: |
>> +            The standard Zam extension for misaligned atomics is supported as
>> +            ratified in version 20191213 of the riscv-isa-manual.
> 
> Is "20191213" an actual tag in that repo? Looking at that version of the
> spec (because it is a spec version, but I don't think it is a valid
> reference to that repo) Zam is listed as Draft. In fact, in the most
> recent thing I could find, Zam was still listed as draft.

Whoops, my bad, I assumed that the chapter being present in the spec
meant it was ratified and I did not checked the listing stating it is
still in draft.

Will remove that from the next version.

Thanks,

Clément

> 
> Are you sure this is ratified?
