Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F85D26A
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 07:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oFt4Fz7A"
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD9C12E
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 00:21:20 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6c7a4735a30so1273806a34.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 00:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697700079; x=1698304879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/caEF9HzcleOEHwneLp6tiCcjo0T3AFNH3jEPiF4Apg=;
        b=oFt4Fz7AxAw5X4nvPL0AaK2Axx+CD5s6OUpo+sG8NR4YJgtLItfKYVd+Hz3UEK0/6p
         rU1f9V44aYtwk4888xqtdqrEkwmmbOT42ZYxOtD6qA3Dpu081BTnN+RZvPXNIXbHYlft
         DsDqqY8DMSiOCwSY7KTmnU3XG4+Daa9WtiGLr/KfwbfwWy2hosF6kLkOpgQYDje2bYwh
         hjZWLOoK84DeOvUENZZTFqF7hgdrkPO5B9W8Hn3JvszJ/Yb/zgP3WULkt8/AQVW5t6fy
         oFUCV8dxVGpmFmSyanyBoaRDh1wqFFT1A6z7xnPg2qXH5utsZ2VvxmB3G0ZI59S9dF8P
         cLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700079; x=1698304879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/caEF9HzcleOEHwneLp6tiCcjo0T3AFNH3jEPiF4Apg=;
        b=N+YSBfwIBOdIVLRSsj6Q0EQCUo1HlsAo/8GkDfF2+BDB/ddxidVrwK5repykbUnu22
         /m5ciFzHzZHCGepQ7/qL/EZpLb4zNjYBWkhPT93wjalTVNvCTdvtEcDTtzwY8zpLmAqE
         iiImaPe+vs7MaAcDtf36MrLSWDaBWncEjzOVxrlyMue9TpE+0/AUqDYdr4cdjn45k+iQ
         WW3ATKWmwnplINvxzNvjX3chhc5GItHXajUknGVbeSzLhyRK526Z5DZCXqIlkx7VpI7i
         r3/8E3vzkxBrmikitRorLPZthqE+1g7O+qMQQLSoNtP6vak8Uk8cFLk0DWPMqYoclJxm
         o/Dw==
X-Gm-Message-State: AOJu0Yy8VL1IYvRKPxCDPXlY+PnP1i5yjeeISYU8pCqx4yEfUStuC5Vj
	JxjUHwO7ynGu9CuygeNzK6dbJFtgGuuwucdY+EOWyA==
X-Google-Smtp-Source: AGHT+IEFXAbxxObWsDg43i5JytX4bz0tF34qGuIzEM5TAcp0MRy/O+CrNP01uiR3b1KPRaXNmbiEQQ==
X-Received: by 2002:a05:6870:b14:b0:1e9:adec:bf5e with SMTP id lh20-20020a0568700b1400b001e9adecbf5emr1951115oab.2.1697700079549;
        Thu, 19 Oct 2023 00:21:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6933:1fe3:b858:3dde? ([2a01:e0a:999:a3a0:6933:1fe3:b858:3dde])
        by smtp.gmail.com with ESMTPSA id k4-20020a63ba04000000b0057412d84d25sm2436010pgf.4.2023.10.19.00.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 00:21:18 -0700 (PDT)
Message-ID: <be86086b-7b1e-48b5-98e1-e1cd077cf3bb@rivosinc.com>
Date: Thu, 19 Oct 2023 09:21:05 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/19] riscv: hwprobe: add support for scalar crypto
 ISA extensions
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-4-cleger@rivosinc.com>
 <CALs-HssE=denuwBqH4KtCr1QqTzPb9rELW1ZXR5Cr-nqQQWQoA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HssE=denuwBqH4KtCr1QqTzPb9rELW1ZXR5Cr-nqQQWQoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18/10/2023 19:24, Evan Green wrote:
> On Tue, Oct 17, 2023 at 6:15 AM Clément Léger <cleger@rivosinc.com> wrote:
>>
>> Export the following scalar crypto extensions through hwprobe:
>>
>> - Zbkb
>> - Zbkc
>> - Zbkx
>> - Zknd
>> - Zkne
>> - Zknh
>> - Zksed
>> - Zksh
>> - Zkt
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  Documentation/riscv/hwprobe.rst       | 30 +++++++++++++++++++++++++++
>>  arch/riscv/include/uapi/asm/hwprobe.h | 10 +++++++++
>>  arch/riscv/kernel/sys_riscv.c         | 10 +++++++++
>>  3 files changed, 50 insertions(+)
>>
>> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
>> index a52996b22f75..968895562d42 100644
>> --- a/Documentation/riscv/hwprobe.rst
>> +++ b/Documentation/riscv/hwprobe.rst
>> @@ -77,6 +77,36 @@ The following keys are defined:
>>    * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
>>         in version 1.0 of the Bit-Manipulation ISA extensions.
>>
>> +  * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
>> +       in version 1.0 of the Scalar Crypto ISA extensions.
> 
> At least in my v1.0.1 version of the crypto scalar spec, I don't see
> Zbc. That seems to be defined in the bit manipulation extensions.

Thanks for catching this, this should be same than the previous line. I
will actually move the ZBC on another patch since it is not scalar crypto.

Clément
