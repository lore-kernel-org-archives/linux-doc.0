Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59633139F
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gO5+tRU6"
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958DE199E
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 02:42:25 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507cb194e30so180465e87.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Nov 2023 02:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699526544; x=1700131344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/T3nAMPk3GrqIEl5q2gbW7BDPvpAe0liQvy3DzEQmwc=;
        b=gO5+tRU6acrLCeoOk7D9VSAGkDWyj3JJCd78lAiExFb8o9sE75sbX8gsxiSn535yfz
         9OAEx2JJ53HQzZMaF0mpKqMrKZA/+YRZEZdyG1AxC6xOKHJPlFQSZQm6hg9/4C2t8HJr
         ieb5+80p3dxDvIiarWbFa9+FXhgo9i7Bi6YXzYiKi9mcoYr8K7i3gTkfFmwUdS9eTYvw
         FB7QeV3jTstK+HXmYeLr1hhedxaIeoNdEBEUTayXPGkoebAA0spDafTYIDK+cI97S4dB
         TMAG87H1v58sZsiQkkqxqe8ZH6whv9mH7YCtOReFWDvjgxp8BySTm5fZp36mW2tqcqrZ
         uVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526544; x=1700131344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/T3nAMPk3GrqIEl5q2gbW7BDPvpAe0liQvy3DzEQmwc=;
        b=bQBNLPyMfV8VQ2J3jKzPkEnFkiFXAFO4ZySs5aNSbny7tva2diHORvv/lwSe63DjSw
         of1Ox6641xhu/R9/i09Rt6hmXLlwjhnO2iHDP/V3FO8V/GC2w1VMiBNFWdlfc/gsB0cP
         EjrSB1sUB9FCok05TXoq2/Mk57iiIWShBuPk7hp2HPj5hKd4RGL4WDumT1KgAiywofZu
         djxGc1htAT84ETSgOUyW8kpRWBf4f0dJg2tqbYbgeACvvoTKgaTCxGsZzdEr1GBbSaR0
         vqWLTy+ccOvsb/Xgd9w1zviqhNrbPqbGZnSRQZj9jc2/FjjXurtUXfL58ZzxYe7zpqhe
         DGpg==
X-Gm-Message-State: AOJu0YyC3GKBK+P2hDzNI9ZXJ43y7SrxxhwMcvBGb1ZgKlTaht4ATXGJ
	8Lxy7I6RVjor9re/Ft65eTF2Cw==
X-Google-Smtp-Source: AGHT+IHcJMnl4Agc3MEocHCsrLtdMFFEcJLC2XSn3K1KlAQHuyrsJ6xuAtI3wP4NAa7wEFjA1O7D4w==
X-Received: by 2002:a05:6512:3f0d:b0:509:8d70:49e8 with SMTP id y13-20020a0565123f0d00b005098d7049e8mr1595802lfa.6.1699526543435;
        Thu, 09 Nov 2023 02:42:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:87b4:87b9:6476:5df7? ([2a01:e0a:999:a3a0:87b4:87b9:6476:5df7])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b004090ca6d785sm1698384wmq.2.2023.11.09.02.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 02:42:23 -0800 (PST)
Message-ID: <5cb0a3ae-405c-4b07-adaa-0e3109e76c69@rivosinc.com>
Date: Thu, 9 Nov 2023 11:42:21 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/20] dt-bindings: riscv: add Zfa ISA extension
 description
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-21-cleger@rivosinc.com>
 <20231108-basics-delete-710d0682bf0e@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231108-basics-delete-710d0682bf0e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/11/2023 15:59, Conor Dooley wrote:
> On Tue, Nov 07, 2023 at 11:55:56AM +0100, Clément Léger wrote:
>> Add description for the Zfa ISA extension[1] which can now be
>> reported through hwprobe for userspace usage.
> 
> FWIW, hwprobe is not relevant for the dt-bindings.
> 

Ok, since I'll resend a V4, I will remove this mention top hwprobe.

>> Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/view [1]
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,

Clément

> 
> Cheers,
> Conor.
> 
>> ---
>>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index 87c7e3608217..dcba5380f923 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -214,6 +214,12 @@ properties:
>>              instructions as ratified at commit 6d33919 ("Merge pull request #158
>>              from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
>>  
>> +        - const: zfa
>> +          description:
>> +            The standard Zfa extension for additional floating point
>> +            instructions, as ratified in commit 056b6ff ("Zfa is ratified") of
>> +            riscv-isa-manual.
>> +
>>          - const: zfh
>>            description:
>>              The standard Zfh extension for 16-bit half-precision binary
>> -- 
>> 2.42.0
>>
