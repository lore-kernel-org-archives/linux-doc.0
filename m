Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C39B1D63D0
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 22:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734386405; cv=none; b=i68jxPYqfirrbODidsK2EaHFM1F5wtG7HlTZQpY28PNOMz7tt4l/aueYX4aYYAFIDjGBWVRsZh0MbYyu9vvUUzeb4bqSL8CHKNRzLurQQW2DBoHUr9MGAa4ocJ/x1VInXLIT++pPFiCP2A0ZH294z9ks9tqODR34io7/dIBInYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734386405; c=relaxed/simple;
	bh=WY1yk75xj3D29k5mczcyeteQJJJq8P3Ye1L3yD6YJMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGcV5zxvWG6Y2d/igr3NnIQpq6I+U+rEnqUDsW/CnSta9hKzulS4IJsAA2B1up7rgUOXM46tmqnWPdNobp0bjdklv8rBG1A90nOALMrWmw7+bW1g1ZWSu7XYJDtwT00ofumN570+VIy2r1XGawrqibYjzn2KR4bFfPamLbS0X74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=id3WywLl; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="id3WywLl"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a9caa3726fso15275885ab.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 14:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734386403; x=1734991203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9GAPUOnO/AZAUr8mlWdqcXEUNfkQg4dQQPEXS1LGaw=;
        b=id3WywLlm5GdGdXLtHYpT9Q36oZ8Fld3Hrj9xJh6ZB7CZQDnkK5tiY8Fo3aQO/boJ8
         FQclL1JAkbmLsAmwRfQ8srBrzYVG6QHRsvklyxg8SIIKtOiXtL1GD5qOUNlfjVB9F+Z4
         RHwCdDhFhC/LNQpVFKesYTPc8ydxbwOL+JkisZJKN23nGKgOPlmCAFWsuUjhdPA13QJ5
         pgBgP/mK60m4790PgnZ9E2/TSK0ovWTANSFuYjHaynj1G2C/Io8/Nu4S68ov5lRYgULV
         BtsIcEuNzNooWMTYAcPatTsv7F3xlDrlHK7XkojUqwYJh3Kcqvbn9O/tTtFguVYlEw7J
         9Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734386403; x=1734991203;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9GAPUOnO/AZAUr8mlWdqcXEUNfkQg4dQQPEXS1LGaw=;
        b=XyxP7BftTvIJlDeXU9SIAJKnWIFxk4WKnGlO4fnUq8/is7mAVMu2uyu5K9WzhmAPeu
         mUGcdIkpx9s/3L8LRh16uZZu9WU2h66vTYy3yKKkvl2dRqAa3ZNfthA+L2SUC38we0UW
         s9dp+Qkf6PBklol72XN1CrZXff566XyE1lQP9DN1xrp0KcFfm0Bx4pZv7lfO6OW1CS1q
         jJBO+bp5JWjRllVWT+3xYSP1sGsy0lTkW0sgq0OUIb+01YL9xj+HoaCQzvUZgFpQi8eV
         yJr31byYWsIvz57X/i7/ehPFKP0G1y0123hybYdJEhtM68nD19qwBw7g6kqsDlvoJum4
         jRSw==
X-Gm-Message-State: AOJu0YxsLgEASHHO3U2nKvp//H7L7npTWo13HDmu9/aqhDcoA0AKcnP1
	E1+vWEXE6tXipw3fusGCtcdiX8iCAYyf5pB1IFtQFAeKtmhvhvG8omzfII+gjqQ=
X-Gm-Gg: ASbGncupE4yu6bLlax9f2xhUPbNfcwm9N1myYKBqy6gCxlgjYopS7JO/M0sfPIZ9Wb/
	A6Z2fgQZyhp7MKJpneGKuzRm1ULdO8JnHDBUnLQid6dn6hd+8LwKe+zEPn/Agz1BU9qCWTMWmMP
	s/2XUkOjvsY6MakrwBIKfqlU8E0AsaMSMfoLK7lmyM9xSZjtLYYC841j1usGfib4xu80IXrMiNh
	4QP8dmTYvq7CEUXmAWO6MU2Ln10m8vTgE6Ycn0ci9qFbjHAAudOvPVqJNiYysGVWJsAp05FE893
	uFoHBA==
X-Google-Smtp-Source: AGHT+IHIM+DoAUO4uH+jY49Cft/09OtchiEcCTITNYy9jOukvV//rMl/YNzathv8XDZ/7POhKMPjZQ==
X-Received: by 2002:a05:6e02:18ca:b0:3a9:d0e6:abf2 with SMTP id e9e14a558f8ab-3bb0ac12780mr11516415ab.10.1734386403225;
        Mon, 16 Dec 2024 14:00:03 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.15])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e3c69e2asm1403241173.138.2024.12.16.14.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:00:02 -0800 (PST)
Message-ID: <5e878b5b-b49d-4757-8f7e-4b323a4998b3@sifive.com>
Date: Mon, 16 Dec 2024 16:00:00 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: add bfloat16 ISA extension
 description
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Chen Wang <unicorn_wang@outlook.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-2-inochiama@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241206055829.1059293-2-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-12-05 11:58 PM, Inochi Amaoto wrote:
> Add description for the BFloat16 precision Floating-Point ISA extension,
> (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
> ("Added Chapter title to BF16") of the riscv-isa-manual.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 9c7dd7e75e0c..0a1f1a76d129 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -329,6 +329,12 @@ properties:
>              instructions, as ratified in commit 056b6ff ("Zfa is ratified") of
>              riscv-isa-manual.
>  
> +        - const: zfbfmin
> +          description:
> +            The standard Zfbfmin extension which provides minimal support for
> +            16-bit half-precision brain floating-point instructions, as ratified

I think you mean "binary" here and in the entries below, not "brain".

> +            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
> +
>          - const: zfh
>            description:
>              The standard Zfh extension for 16-bit half-precision binary
> @@ -525,6 +531,18 @@ properties:
>              in commit 6f702a2 ("Vector extensions are now ratified") of
>              riscv-v-spec.
>  
> +        - const: zvfbfmin
> +          description:
> +            The standard Zvfbfmin extension for minimal support for vectored
> +            16-bit half-precision brain floating-point instructions, as ratified
> +            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
> +
> +        - const: zvfbfwma
> +          description:
> +            The standard Zvfbfwma extension for vectored half-precision brain
> +            floating-point widening multiply-accumulate instructions, as ratified
> +            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
> +
>          - const: zvfh
>            description:
>              The standard Zvfh extension for vectored half-precision
> @@ -663,6 +681,33 @@ properties:
>          then:
>            contains:
>              const: zca
> +      # Zfbfmin depends on F
> +      - if:
> +          contains:
> +            const: zfbfmin
> +        then:
> +          contains:
> +            const: f
> +      # Zvfbfmin depends on V or Zve32f
> +      - if:
> +          contains:
> +            const: zvfbfmin
> +        then:
> +          oneOf:
> +            - contains:
> +                const: v
> +            - contains:
> +                const: zve32f
> +      # Zvfbfwma depends on Zfbfmin and Zvfbfmin
> +      - if:
> +          contains:
> +            const: zvfbfwma
> +        then:
> +          allOf:
> +            - contains:
> +                const: zfbfmin
> +            - contains:
> +                const: zvfbfmin
>  
>  allOf:
>    # Zcf extension does not exist on rv64

