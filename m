Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FDD29402
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DQtpLNGB"
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185F2BE
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 06:17:18 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32d89600755so108262f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697116636; x=1697721436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86Iw7ER1iL0qJPH6MKujEBhxqQiEFeQL7nq+sGVZkTo=;
        b=DQtpLNGBoYnva93ZB+B230FPmOpXJKC7Zl29ogOuQ3zbK5N8jaUMFLvuF7LxwetdIJ
         OxBGai0e01EWxgfi4yopSMrHP8Brg1JIyeoyo0MmEgDAmqUdIqeD+fFCeXWHy2k2uU4q
         pC54uOZX8ibLQFVWttrSpyi2aOvRniqvSjiFNZHT629Ln5w3zo9qinTbxl6jjmla8Uvm
         0VQpDLERLaBAywSf4Ph5t0lrXL0Uj5fHS2iQ/CsIy5uiFS6AZeqERxchj8jASU7CneNB
         rWedoS+C2LxaObAG++3r4JqRuM3ppNhzKG2iBH4ZGTOiEBb5g7UL1oh59C2FFNmNpi4Q
         8ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697116636; x=1697721436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86Iw7ER1iL0qJPH6MKujEBhxqQiEFeQL7nq+sGVZkTo=;
        b=glMy7LVx8YOEc4TmLwNFDYRI9Jegi0BFIvhUuz5uXmd/dYPZ3ujJguXicnNd18T6tq
         bMho5+uKmooiHgNwtAHg/LX4hO1ooydqknKslFAltQ5gOcGYSYw0hWI3XllKLWR+viUk
         dXQl0+3n5vT5nRX/jsbLk7TpwHdDsddqqiPxPIc3JTOIEAamtvQK8FBzjitZWF1Wi/+N
         Z8R+nQUvcxo0k8S+c5OpC56Q20RWHeTbjmjb32Gex45qL9VIhECE6/9tdRnBqbaQDv4h
         u/V6YyMNOcl0XHdp/23/O+7mZgY5+sIgVfQHmnrJ7E6xjPZLKHRKziCH/PJ2Byu21wvO
         r56w==
X-Gm-Message-State: AOJu0YxkmTH3hCTjo8O/u+5BT+jgykaG/eT+3b4/nOZIMV7l78rGQfBK
	+5mvDFAypFHgT0kT10A3GvIJ1A==
X-Google-Smtp-Source: AGHT+IEx9wPWOVom03CbrBv668hbIBnPdmng+CCts+Z4IvDPQOvyvDCWnMIlSYmRVAmf0hB8TXqbXw==
X-Received: by 2002:adf:fdd0:0:b0:317:7238:336a with SMTP id i16-20020adffdd0000000b003177238336amr19428901wrs.5.1697116635863;
        Thu, 12 Oct 2023 06:17:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3fed:c1e5:145f:8179? ([2a01:e0a:999:a3a0:3fed:c1e5:145f:8179])
        by smtp.gmail.com with ESMTPSA id d12-20020a5d538c000000b0032769103ae9sm18393106wrv.69.2023.10.12.06.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:17:15 -0700 (PDT)
Message-ID: <b157edc4-a21f-40ac-8c9f-e989b34bb872@rivosinc.com>
Date: Thu, 12 Oct 2023 15:17:14 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/13] riscv: add ISA extension probing for Zv*
 extensions
Content-Language: en-US
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-3-cleger@rivosinc.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231011111438.909552-3-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 11/10/2023 13:14, Clément Léger wrote:
> Add probing of some Zv* ISA extensions that are mentioned in "RISC-V
> Cryptography Extensions Volume II" [1]. These ISA extensions are the
> following:
> 
> - Zvbb: Vector Basic Bit-manipulation
> - Zvbc: Vector Carryless Multiplication
> - Zvkb: Vector Cryptography Bit-manipulation
> - Zvkg: Vector GCM/GMAC.
> - Zvkned: NIST Suite: Vector AES Block Cipher
> - Zvknh[ab]: NIST Suite: Vector SHA-2 Secure Hash
> - Zvksed: ShangMi Suite: SM4 Block Cipher
> - Zvksh: ShangMi Suite: SM3 Secure Hash
> - Zvkn: NIST Algorithm Suite
> - Zvknc: NIST Algorithm Suite with carryless multiply
> - Zvkng: NIST Algorithm Suite with GCM.
> - Zvks: ShangMi Algorithm Suite
> - Zvksc: ShangMi Algorithm Suite with carryless multiplication
> - Zvksg: ShangMi Algorithm Suite with GCM.
> - Zvkt: Vector Data-Independent Execution Latency.
> 
> [1] https://drive.google.com/file/d/1gb9OLH-DhbCgWp7VwpPOVrrY6f3oSJLL/view
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 16 ++++++++++++++++
>  arch/riscv/kernel/cpufeature.c | 16 ++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b7b58258f6c7..4e46981ac6c8 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -58,6 +58,22 @@
>  #define RISCV_ISA_EXT_ZICSR		40
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
> +#define RISCV_ISA_EXT_ZVBB		43
> +#define RISCV_ISA_EXT_ZVBC		44
> +#define RISCV_ISA_EXT_ZVKB		45
> +#define RISCV_ISA_EXT_ZVKG		46
> +#define RISCV_ISA_EXT_ZVKN		47
> +#define RISCV_ISA_EXT_ZVKNC		48
> +#define RISCV_ISA_EXT_ZVKNED		49
> +#define RISCV_ISA_EXT_ZVKNG		50
> +#define RISCV_ISA_EXT_ZVKNHA		51
> +#define RISCV_ISA_EXT_ZVKNHB		52
> +#define RISCV_ISA_EXT_ZVKS		53
> +#define RISCV_ISA_EXT_ZVKSC		54
> +#define RISCV_ISA_EXT_ZVKSED		55
> +#define RISCV_ISA_EXT_ZVKSH		56
> +#define RISCV_ISA_EXT_ZVKSG		57

About Zvks/Zvkn, these extensions are actually shorthand for a few other
sub-extensions, it is still not clear if it should be parsed as is.
There are multiple solutions:

- Handle them as-is, simply enable the extension, if reported through
hwprobe, userspace will be responsible to detect the sub-extensions
(current approach)

- "Unfold" the extension in order to enable all the sub-extensions and
keep the main one (for instance for Zvkn, enable Zvkned, Zvknhb, Zvkb,
Zvkt, Zvkn)

- "Unfold" but don't keep the extension "shorthand" in the ISA extension
list (for instance for Zvkn, enable Zvkned, Zvknhb, Zvkb, Zvkt)

Thanks,

Clément

> +#define RISCV_ISA_EXT_ZVKT		58
>  
>  #define RISCV_ISA_EXT_MAX		64
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1cfbba65d11a..859d647f3ced 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -174,6 +174,22 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> +	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
> +	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> +	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> +	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
> +	__RISCV_ISA_EXT_DATA(zvkn, RISCV_ISA_EXT_ZVKN),
> +	__RISCV_ISA_EXT_DATA(zvknc, RISCV_ISA_EXT_ZVKNC),
> +	__RISCV_ISA_EXT_DATA(zvkned, RISCV_ISA_EXT_ZVKNED),
> +	__RISCV_ISA_EXT_DATA(zvkng, RISCV_ISA_EXT_ZVKNG),
> +	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
> +	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
> +	__RISCV_ISA_EXT_DATA(zvks, RISCV_ISA_EXT_ZVKS),
> +	__RISCV_ISA_EXT_DATA(zvksc, RISCV_ISA_EXT_ZVKSC),
> +	__RISCV_ISA_EXT_DATA(zvksed, RISCV_ISA_EXT_ZVKSED),
> +	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
> +	__RISCV_ISA_EXT_DATA(zvksg, RISCV_ISA_EXT_ZVKSG),
> +	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
