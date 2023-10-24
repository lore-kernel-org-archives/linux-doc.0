Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BAB241E4
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AMiqT/jw"
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D991985
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 02:30:11 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32da4180ca2so892432f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698139810; x=1698744610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epBSW7d/Y73fuCPm0yJqVjtBNeGFhQxq0MaplKN63vg=;
        b=AMiqT/jwK00ssjVuB21Y1vsh4Z8x0hMaB49VaHC9aXjss7zFtjX5jUszFo4EsDX9+U
         3QE9XlAxOfHHCd3/FBjIwKR20W434JL4MXLvmwW2i3ts6NbAvUQrv33CRhNZdzRnGAsu
         gslbGhzqrfouddAU2bPrRuxL3UMf0JtEUkGmFKEOjTbeOayV/QutH4Xsp5yJGS9jXat+
         5y/pGgy4py1/A1Me1qTzSg5/sWAL7caH/e6179AyoJMu8/MXYnm8LY3aP27WqLvs5lCk
         pxrFFNPhw12uT4xmur0Vvzi+WU5sTClp5f8KgdiUZCstD6ikiWE7CkXkyCjL3LdY9O7N
         2jKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698139810; x=1698744610;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epBSW7d/Y73fuCPm0yJqVjtBNeGFhQxq0MaplKN63vg=;
        b=jAjsliC0SxSlk31AIv6xGpPKZbd01dY31BcElxbmv6tc/17J7LBuGSFi4jT0SDtSpo
         GiGaIfPARob7qimIbIOS4qdR1YCbdodxdZF1HIgH3VL/SIZXrqouXY5bJvi2nbjZKUY/
         et5tk4PT+l2n2R5FYPS33UaRGlpqn9nQdwa0w4X2FUjxZVnhER1PaoaBRsi7CLJ6NL5/
         f7pq+561oaQX3ABftf3/29dt4hoFK3cH7xjMVZNZCIcDP9vA3KBAuSWyx49sF8SB2EbV
         oS42wPId9BUqw9Pstk8XZP03Vy7jEBVwNzEo74x4Z+Jt97hg+LyhMACJAJRDel6sTgFf
         8DxA==
X-Gm-Message-State: AOJu0YxOrgtyEgbnD3SjYOrPTFMvlT2NScleu8Qv0Py44rqkSM0lieuW
	Yy8X6fmNiPjvezJ9nSOhzcjzrTrD4xV+agta4lpILg==
X-Google-Smtp-Source: AGHT+IFm/o5S53urNBlHODYQKB9HRkQDLb5L5tdDg3p22JIkoo7vc0CsuA6eRfMc1YyYbUFwwXSiVg==
X-Received: by 2002:adf:a48f:0:b0:32d:d9a8:53df with SMTP id g15-20020adfa48f000000b0032dd9a853dfmr8334091wrb.3.1698139809733;
        Tue, 24 Oct 2023 02:30:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:597d:e2c5:6741:bac9? ([2a01:e0a:999:a3a0:597d:e2c5:6741:bac9])
        by smtp.gmail.com with ESMTPSA id dj18-20020a0560000b1200b0032d96dd703bsm9574187wrb.70.2023.10.24.02.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 02:30:09 -0700 (PDT)
Message-ID: <56f6af04-bdf4-4b85-99dc-9eb4f391d7ad@rivosinc.com>
Date: Tue, 24 Oct 2023 11:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/19] riscv: add ISA extension parsing for scalar
 crypto
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-3-cleger@rivosinc.com>
 <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
 <d0ea4996-5c48-47b4-99b0-f4211276e0b2@rivosinc.com>
In-Reply-To: <d0ea4996-5c48-47b4-99b0-f4211276e0b2@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/10/2023 09:18, Clément Léger wrote:
> 
> 
> On 23/10/2023 18:21, Evan Green wrote:
>> On Tue, Oct 17, 2023 at 6:15 AM Clément Léger <cleger@rivosinc.com> wrote:
>>>
>>> From: Evan Green <evan@rivosinc.com>
>>>
>>> The Scalar Crypto specification defines Zk as a shorthand for the
>>> Zkn, Zkr and Zkt extensions. The same follows for both Zkn, Zks and Zbk,
>>> which are all shorthands for various other extensions. The detailed
>>> breakdown can be found in their dt-binding entries.
>>>
>>> Since Zkn also implies the Zbkb, Zbkc and Zbkx extensions, simply passing
>>> "zk" through a DT should enable all of Zbkb, Zbkc, Zbkx, Zkn, Zkr and Zkt.
>>> For example, setting the "riscv,isa" DT property to "rv64imafdc_zk"
>>> should generate the following cpuinfo output:
>>> "rv64imafdc_zicntr_zicsr_zifencei_zihpm_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr_zkt"
>>>
>>> riscv_isa_ext_data grows a pair of new members, to permit setting the
>>> relevant bits for "bundled" extensions, both while parsing the ISA string
>>> and the new dedicated extension properties
>>>
>>> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Evan Green <evan@rivosinc.com>
>>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>
>> My tree might be out of sync, but in my search for riscv_isa_ext, I
>> also found a use in print_isa() (cpu.c) where we're reaching into
>> riscv_isa_ext[].id and assuming it's always valid. If that's still in
>> there we'll want to fix up that spot too, since now with bundles .id
>> may or may not be valid.
> 
> Oh indeed, the array is visible outside of this compilation unit :/.
> I'll check that before sending V3.

After looking a bit more at that, it actually seems that id is used in
cpuinfo to determine which extensions are present which means you are
right, bundle_size needs to be accounted for.

Looking at it also raises the question (again) of exposing the "bundles"
extensions themselves or not in cpuinfo output. With the current setup,
the bundles extensions won't be visible in cpuinfo output. For instance
if Zk was in the isa string, then it will not be visible in the cpuinfo
output, only the child extensions. One solution would be to always have
a valid id for each extension. So we would have one for Zk for instance.

We would then have a similar setup for all "bundles" or "subset"
extensions, they would have a id for all of them. For instance, Zk would
become:

__RISCV_ISA_EXT_DATA_BUNDLE(zk, RISCV_ISA_EXT_ZK, riscv_zk_bundled_exts)

Same would go for zvbb (riscv_zvbb_subset_exts would only contain Zvkb):

__RISCV_ISA_EXT_DATA_BUNDLE(zk, RISCV_ISA_EXT_ZVBB, riscv_zvbb_subset_exts)

For the sake of completeness, I feel like it would be good to have all
the extensions (bundles or not) visible in the riscv_isa_ext.

Any objection ?

Clément

> 
> Clément
> 
>>
>> -Evan
