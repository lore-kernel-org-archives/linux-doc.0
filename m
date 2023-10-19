Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D08517728
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fGHHpUGC"
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E5810F
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 02:36:02 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c51774da07so13433301fa.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697708160; x=1698312960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXtOjy9+9/ljOELmDfLKz1lWgHdhVIaF8pXBW5zYs/s=;
        b=fGHHpUGCavFnoE3Sm4ehaIlkegTwdbsvhCalmbslRLok8hdjljMM9BE4ccgVZYhuXi
         Rt25cofgf0XYhFLpsJIEeKfHKvg6kEs/oj24TIAPA8mfwA489gaiXo36Zvw/ReUwgCzQ
         Fou0la4IOQJ+K5ikPIhuwTxFRsdLaAHODZKcxdhU47Hii4YWHgAgMgQq0AYCgjRJvHKP
         bDO2cq9Zv/tdVlk1L0sml6fKa0q0kIAI226MsxGeLiP0V0pTpTsYRGAjF+/jHOh4reUs
         nJ4zSEDc1mYCGDqSSIaNC9cN2FtvAP2U3X6AV7orjHOuowKcLTS5FWPiov2qGM/yyvom
         c+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708160; x=1698312960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXtOjy9+9/ljOELmDfLKz1lWgHdhVIaF8pXBW5zYs/s=;
        b=U/ZchAu/rfZpP+7JWK88UbPNgMv8F4e0sdlHB9SlpeRsg/FMtk8+qF+uRXyy9PBqPx
         lGy6MvuII7vdiMhSt+nVw+J6fjun/BoUr/QOIXrpxNMH1mCxhwrMIySCc2n+NnIYbQmN
         uDMkl4/iijFyhulvOG5PqkmooZaGOeDUavvu+7gTZ+WwOGcVOD/QdUx8xARiRgbjrAZ9
         H8vDrCI62dhFVGZfK5jqXz/5G4gdWlUwQBQFYJFCb9Rc0on12TD7xcvcAs+Sdyjwn2z8
         wX9FDF+GQxkHT7GkTWgp3/6PxsbKDGvkeTNCbVaV7xcKzlwmqr80fZ//9Jvf0MIK3FUs
         PmMA==
X-Gm-Message-State: AOJu0Yy/EhOczIm5Hajpxzr9xLSjFbD4D/O6MspF1z9OJcWpNwjcQWeh
	E5OFAlbomeUR8ED8+ry9YMTaaA==
X-Google-Smtp-Source: AGHT+IHnVJ8IiqADjeQ3LxKx1Ukua4jK0Ptqq3ZvF/WqcvhbLHTG8YG8di0DRwfklBmQFqYLZG0FEA==
X-Received: by 2002:a2e:8909:0:b0:2c5:d49:ee9f with SMTP id d9-20020a2e8909000000b002c50d49ee9fmr1049022lji.1.1697708160439;
        Thu, 19 Oct 2023 02:36:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6933:1fe3:b858:3dde? ([2a01:e0a:999:a3a0:6933:1fe3:b858:3dde])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b003fe1fe56202sm4024816wmo.33.2023.10.19.02.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 02:35:59 -0700 (PDT)
Message-ID: <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
Date: Thu, 19 Oct 2023 11:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>
Cc: Jerry Shih <jerry.shih@sifive.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
 <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18/10/2023 19:26, Evan Green wrote:
> On Wed, Oct 18, 2023 at 5:53 AM Clément Léger <cleger@rivosinc.com> wrote:
>>
>>
>>
>> On 18/10/2023 03:45, Jerry Shih wrote:
>>> On Oct 17, 2023, at 21:14, Clément Léger <cleger@rivosinc.com> wrote:
>>>> @@ -221,6 +261,22 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>>>      __RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
>>>>      __RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
>>>>      __RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
>>>> +    __RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
>>>> +    __RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
>>>> +    __RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
>>>
>>> The `Zvkb` is the subset of `Zvbb`[1]. So, the `Zvkb` should be bundled with `Zvbb`.
>>
>> Hi Jerry,
>>
>> Thanks for catching this, I think some other extensions will fall in
>> this category as well then (Zvknha/Zvknhb). I will verify that.
> 
> The bundling mechanism works well when an extension is a pure lasso
> around other extensions. We'd have to tweak that code if we wanted to
> support cases like this, where the extension is a superset of others,
> but also contains loose change not present anywhere else (and
> therefore also needs to stand as a separate bit).

For Zvbb and Zvknhb, I used the following code:

static const unsigned int riscv_zvbb_bundled_exts[] = {
	RISCV_ISA_EXT_ZVKB,
	RISCV_ISA_EXT_ZVBB
};

static const unsigned int riscv_zvknhb_bundled_exts[] = {
	RISCV_ISA_EXT_ZVKNHA,
	RISCV_ISA_EXT_ZVKNHB
};

Which correctly results in both extension (superset + base set) being
enabled when only one is set. Is there something that I'm missing ?

> 
> IMO, decomposing "pure" bundles makes sense since otherwise usermode
> would have to query multiple distinct bitmaps that meant the same
> thing (eg check the Zk bit, or maybe check the Zkn/Zkr/Zkt bits, or
> maybe check the Zbkb/Zbkc... bits, and they're all equivalent). But
> when an extension is a superset that also contains loose change, there
> really aren't two equivalent bitmasks, each bit adds something new.

Agreed but if a system only report ZVBB for instance and the user wants
ZVKB, then it is clear that ZVKB should be reported as well I guess. So
in the end, it works much like "bundle" extension, just that the bundle
is actually a "real" ISA extension by itself.

Clément

> 
> There's an argument to be made for still turning on the containing
> extensions to cover for silly ISA strings (eg ISA strings that
> advertise the superset but fail to advertise the containing
> extensions). We can decide if we want to work that hard to cover
> hypothetical broken ISA strings now, or wait until they show up.
> Personally I would wait until something broken shows up. But others
> may feel differently.
> 
> -Evan
