Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D464347AB
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RDwVreNM"
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34E4109
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 05:53:09 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1ca85ff26afso5598525ad.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697633589; x=1698238389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4bV1pYZhN5D0dbLwFy/u3ve1RaIEgwcUfBCkqo2+yE=;
        b=RDwVreNMpjT2BzmCZS/supJ+Z14aNLOcz3x7dq+Dm9ZrX6p4lJOFnLU2Xbcu334/ZB
         sTpF4Ypq6yva4/WLspPPoyhseEYolAHNHHh026LyhssQovjzW8aeWmV+zhNQ2aAQJHwK
         zOq5IQuFiGSZxm7G6+5qW5Zggh0VPVQHBKm0o2+Tvtux3SObYibYWmtLFFVmrcegMT3r
         ZhkfQ1tDdULOZxTwc/9nDZ2u18FZcnFAQJYHpqVCdAIHGy7HLXDfNcgS20Nws6P4VU4Q
         kbpigX19nWYphmVducjum0e6OOLNo+KLlrH5FtTWoWw1/tXXuKeiFN9dM60v8g0hX3OY
         izjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697633589; x=1698238389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4bV1pYZhN5D0dbLwFy/u3ve1RaIEgwcUfBCkqo2+yE=;
        b=cyNBsqduSZPnsAbfclXhdvQvPE2Nq1Rtb9PiFAbrZzOD4XanAKnwocbxJdWvEoaRT8
         89F9wvbsxFqpau+MACU4wOQovWw1mbTBaMQnbV0JxQobfl1KUKdzyCdSlsl648Z/tIpH
         9L3DJy1nyKGb5Q1YgArfXDrBZcGASiLXAGeai1T+tpu/cH3kLKeDblBq44qZuiEK0q08
         15cj5oadkro/ktaBI6m2+DBKSEjwIg6Rfse8gbsMVl0jBIWZPCGc6vIOGVXiogWzl+VI
         3SdkDbld5FJRvhfoY0WObXA4aP7+NTiEKBYnaczTcMfhutX9PM5HYIywFx2jjkPw/KTY
         q+VA==
X-Gm-Message-State: AOJu0Yxp3uYNAhtykDKbvfWwJbuIRQFGdPI9M5yAotxuaxtXv9ZE5Moq
	X6l4pqIWGdcQpfIBKKKt76iCrA==
X-Google-Smtp-Source: AGHT+IFPDreTmEhnjLsKBJ/2zlFkymtjnnL8MnaU8RHtshB63uY79+49cBh7Lw0owZ4sNW4yui5n8A==
X-Received: by 2002:a17:902:f154:b0:1bf:349f:b85c with SMTP id d20-20020a170902f15400b001bf349fb85cmr5148024plb.1.1697633589226;
        Wed, 18 Oct 2023 05:53:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:fde2:480:5b62:f2d2? ([2a01:e0a:999:a3a0:fde2:480:5b62:f2d2])
        by smtp.gmail.com with ESMTPSA id p9-20020a170902bd0900b001b8b2b95068sm3437763pls.204.2023.10.18.05.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 05:53:08 -0700 (PDT)
Message-ID: <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
Date: Wed, 18 Oct 2023 14:52:55 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
To: Jerry Shih <jerry.shih@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 18/10/2023 03:45, Jerry Shih wrote:
> On Oct 17, 2023, at 21:14, Clément Léger <cleger@rivosinc.com> wrote:
>> @@ -221,6 +261,22 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>> 	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
>> 	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
>> 	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
>> +	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
>> +	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
>> +	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> 
> The `Zvkb` is the subset of `Zvbb`[1]. So, the `Zvkb` should be bundled with `Zvbb`.

Hi Jerry,

Thanks for catching this, I think some other extensions will fall in
this category as well then (Zvknha/Zvknhb). I will verify that.

Clément

> 
> +	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
> +	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVKB),
> +	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> 
> or
> 
> +	__RISCV_ISA_EXT_BUNDLE(zvbb, riscv_zvbb_bundled_exts),
> +	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> 
> [1]
> https://github.com/riscv/riscv-crypto/blob/main/doc/vector/riscv-crypto-vector-zvkb.adoc
> 
> -Jerry
