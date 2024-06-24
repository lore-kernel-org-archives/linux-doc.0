Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665544D8AD
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719217498; cv=none; b=O1zgPq0hdnRzk39VK1ms/KFHxdnI99paA3gNJeERIPmuT/P6Wrujbk6y5GZWGpZ2c2L981GgCxpECwP1vCD8A6xydaPBRSgf2YEx6rv06/5w+8fYPx72P0tscUyXsd0BpX3wjKCwe4DQmQBCIH6sgdC7J9QaXZo77xIg/4sDmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719217498; c=relaxed/simple;
	bh=gDacbADE2SAmVHz0VzwJCGPbVzzt3W6DAEZWHfwk23E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoNvVQnaHnVzYgF0iDm4q1jMHnZT7upNfO/fy7rbGODDiPMakcCdiAG0ZrZSiUkVPMWQH4Kanw3UFM57kRPFljViZu0o+HZNmVZa7Vi0bKgkGxyBL3/EqdcawNKacs3s6VRmfyY2j4s4cKuwStmLaL94MQeLWO8h2ivcjsHXd1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PSjCgbe5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PSjCgbe5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4210f0bb857so5101575e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719217495; x=1719822295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHo51wuTRWiZIUYTemkhy4Fril3hMcATqvGkIagVwG8=;
        b=PSjCgbe5yjz480PPzbxGmp8Jtyjoac9Pa/KyMQLmgii24PWKgwCMEn7QIc1HPhrhwJ
         EDHXU21TR1mm75uJZ0TXsk/s+gPPZLyIQPrn7WowdOc5A72lnThflt/6ZYvgarP9eyCz
         KDgGLKMD8aEHfIvtFKPCldsPaDQOjHrdsSfjgTyOL4Zhv3obbWRNfwQvpSrDZfqYgL/X
         HN8GlDZmGFo9TsHvXMoonZTkGnOo361RzIWvTElJ98KIVOBEt5QnhgUFfrt/K0VnbHfk
         3T5LiaQNc2WiSigK8oz3wgNRpzaCJQP0n6uKbDsoo5XTRX9iMxrltwDNqQILePIY0IQ3
         vCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217495; x=1719822295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHo51wuTRWiZIUYTemkhy4Fril3hMcATqvGkIagVwG8=;
        b=WuUyvz4JN4u7BY7Cu6iVYGHa0tWX/Q92zdyrMtEgFnQmmZFiMxzp9fXsuZhr3Ove/P
         i/11hYJWJqnU8h4ChvB6XMnqgGM1Qg4oH4FnOxKFV9kKfUUN4iEmzimKnJBh1xPx2Cge
         UNFXOz9z94R06uPKmFCxHnjmcTkKs8l0xvIfiVzX9IMdr7jRv2aFAj02Z1VBIdSinlpJ
         2Fm2hGA+rha4/EhFh7b5YthAQdAMzuGWhS0isUSTJk8RR0T7OzjHAvtaqctVqywuo7vs
         FUxOvnDXMC/EQhbmPYTyDtr4kSfr++BUVBXL8FAWlKRC0/4BSFK3u1PKBp483fB2huTR
         kVWw==
X-Forwarded-Encrypted: i=1; AJvYcCV6QopzQBillme14rY03V6Yu17AwTwfTb4T4a9lCFYksOnZx0EGf1XqroHv1Xwt8EJlTZrgBIk+cFc/g+VZ4o+P4GmEgo0fMGNF
X-Gm-Message-State: AOJu0YxC8Siysht4K9oWRCWBoYuIpiyffviUGwWpyusBQ2b2l85DHYzG
	QFBa3r/lYAYkwnwteJ5bHDr0zvI91eEgUl659w/sWbSR/89fczE7QEXI28/zJN4=
X-Google-Smtp-Source: AGHT+IHaJqmXxJcpAch8t7UdkOLrlv66b+VvjpHMvaM58a6QzEHIYabq9XOGzMv9in4jtgUGn43mVw==
X-Received: by 2002:a05:600c:3b11:b0:424:8810:78b5 with SMTP id 5b1f17b1804b1-42488107bb0mr40633265e9.0.1719217494632;
        Mon, 24 Jun 2024 01:24:54 -0700 (PDT)
Received: from [192.168.61.172] ([37.166.182.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247101a955sm175619005e9.0.2024.06.24.01.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 01:24:54 -0700 (PDT)
Message-ID: <c59a8897-34a1-4dc3-b68b-35dddf55c937@rivosinc.com>
Date: Mon, 24 Jun 2024 10:24:51 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
 <20240619113529.676940-9-cleger@rivosinc.com>
 <20240623-cornbread-preteen-4ec287aa165c@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240623-cornbread-preteen-4ec287aa165c@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/06/2024 17:42, Conor Dooley wrote:
> On Wed, Jun 19, 2024 at 01:35:18PM +0200, Clément Léger wrote:
>> The Zc* standard extension for code reduction introduces new extensions.
>> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
>> are left out of this patch since they are targeting microcontrollers/
>> embedded CPUs instead of application processors.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  arch/riscv/include/asm/hwcap.h |  4 +++
>>  arch/riscv/kernel/cpufeature.c | 55 +++++++++++++++++++++++++++++++++-
>>  2 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 18859277843a..b12ae3f2141c 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -87,6 +87,10 @@
>>  #define RISCV_ISA_EXT_ZVE64F		78
>>  #define RISCV_ISA_EXT_ZVE64D		79
>>  #define RISCV_ISA_EXT_ZIMOP		80
>> +#define RISCV_ISA_EXT_ZCA		81
>> +#define RISCV_ISA_EXT_ZCB		82
>> +#define RISCV_ISA_EXT_ZCD		83
>> +#define RISCV_ISA_EXT_ZCF		84
>>  
>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>  
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index a3af976f36c9..aa631fe49b7c 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -111,6 +111,9 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
>>  
>>  #define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, NULL)
>>  
>> +#define __RISCV_ISA_EXT_DATA_VALIDATE(_name, _id, _validate) \
>> +			_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, _validate)
>> +
>>  /* Used to declare pure "lasso" extension (Zk for instance) */
>>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
>>  	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
>> @@ -122,6 +125,37 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
>>  #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
>>  	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
>>  
>> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
> 
> It's super minor, but my OCD doesn't like this being called "depends"
> when the others are all called "validate".

Ok, let's make a deal. You review patch 14/16 and I'll make the machine
part of you happy and call this function validate ;)

Thanks,

Clément

> 
>> +				 const unsigned long *isa_bitmap)
>> +{
>> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA))
>> +		return 0;
>> +
>> +	return -EPROBE_DEFER;
>> +}
>> +static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
>> +				  const unsigned long *isa_bitmap)
>> +{
>> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
>> +	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
>> +		return 0;
>> +
>> +	return -EPROBE_DEFER;
>> +}
>> +
>> +static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
>> +				  const unsigned long *isa_bitmap)
>> +{
>> +	if (IS_ENABLED(CONFIG_64BIT))
>> +		return -EINVAL;
>> +
>> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
>> +	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
>> +		return 0;
>> +
>> +	return -EPROBE_DEFER;
>> +}
