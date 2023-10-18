Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C26A3D965
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="prlSQ1zM"
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5014490
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:28:15 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507a98517f3so5158460e87.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650094; x=1698254894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrEh3D+kI7ficihoTElbPnijf/y0H7CK010e9QE4avk=;
        b=prlSQ1zM5d2qNbRBOIJZ2EcigyeJonZjBFEeHaiJ+wAaIC6dN1zwoz7Tn0QvSrLJup
         BR6xp3HLh2Urg7Y782m3EMtmr/7AZZ1nqp0zmjuUUrVJvNMfeihRTngx8eA7ZblHZDmR
         I+mT7F5tykRePFoD/t0pEonYDOfb94leKDocrU3o7yL5nayiLfDCRLVwAsndsQ+M5sex
         wMmct2LZdSduwJveERuLzBOXe1ybLqYrgtK/llpI4txKoNKt4UtYjyqJzNBbBbO/KlYT
         okUcLQXFyS3Zn1DB74G4Rd5ahvGVYXfAlm76gKvDDKrb7T4ckQuxP9Fdat0VYg0FIyPH
         GMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650094; x=1698254894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrEh3D+kI7ficihoTElbPnijf/y0H7CK010e9QE4avk=;
        b=MR3d2K7EULFMp+akANjVZhw7J8BZXwB8QzNqAsQkXnC541PkS356H7freb/3pJR79x
         Qm/ulgKeYLJ5gxiItByvwHwBAPhLKmvDzBrZBeF5aBUorTW7YFR8nqPmDLjJZcabBc1r
         gRo4Pa0Y8WaanB0RpG7Uflz5DNfWzkVHgQnqzqLHxrai33esENmnQF3Tsng2nfCAnqrK
         eNVTdadkXlZcL0HIwrAMi070Vn7cX2D1Nd9Ace3MYQHiqBAr1VqKwoRGC6Gkv+cjGmX7
         1k5tJeB2OMEqApc72S8oshWr8hXMTaAO/3YStA16geL+mo1ioAe6a3pGleXHwotwO5Lk
         uCSg==
X-Gm-Message-State: AOJu0YxFHQWWs19vvmvJ+EYn7mn/RAsaDEeunrwAxrDjMDZXTQzOoXXh
	+nobdz/YFJ/VCuwQKLa8xFzd5AiQ3pPdBwcXfJUTJg==
X-Google-Smtp-Source: AGHT+IGxURJL+uaaxpc+DcFmneehkFpVo2DZ+kcpkWCrSxLf8LioRAC7Aw8ZZqtta+v5ZKsd1Py4IEcwvCF/w36lIAw=
X-Received: by 2002:a19:2d4c:0:b0:504:7f58:6dfd with SMTP id
 t12-20020a192d4c000000b005047f586dfdmr4318597lft.2.1697650094002; Wed, 18 Oct
 2023 10:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-7-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-7-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:27:38 -0700
Message-ID: <CALs-HsvCGmo9N+cNUJwZmiHdd2N95nFFCxMfWRaOkWVg7v74Mw@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] riscv: hwprobe: export vector crypto ISA extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Export Zv* vector crypto ISA extensions that were added in "RISC-V
> Cryptography Extensions Volume II" specification[1] through hwprobe.
> This adds support for the following instructions:
>
> - Zvbb: Vector Basic Bit-manipulation
> - Zvbc: Vector Carryless Multiplication
> - Zvkb: Vector Cryptography Bit-manipulation
> - Zvkg: Vector GCM/GMAC.
> - Zvkned: NIST Suite: Vector AES Block Cipher
> - Zvknh[ab]: NIST Suite: Vector SHA-2 Secure Hash
> - Zvksed: ShangMi Suite: SM4 Block Cipher
> - Zvksh: ShangMi Suite: SM3 Secure Hash
> - Zvknc: NIST Algorithm Suite with carryless multiply
> - Zvkng: NIST Algorithm Suite with GCM.
> - Zvksc: ShangMi Algorithm Suite with carryless multiplication
> - Zvksg: ShangMi Algorithm Suite with GCM.
> - Zvkt: Vector Data-Independent Execution Latency.
>
> Zvkn and Zvks are ommited since they are a superset of other extensions.

s/ommited/omitted/, other than that:

Reviewed-by: Evan Green <evan@rivosinc.com>
