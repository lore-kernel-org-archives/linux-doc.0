Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF21CA96
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WsdJ0m/9"
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C0C9F
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 09:22:06 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so49946701fa.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698078125; x=1698682925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvcxBfUwTMvPmDC6TsZGUmIpxz3bHu9zv5qH2J4V6xE=;
        b=WsdJ0m/9057wlCFWmBJ6lPP86MRukuAKGIeWJGUp4DUjgUpbxGIMUb/sfUpFhglHSO
         f6VUGRgeBAVGrs04iqxf87cz/NSx+f2XfsuEVQIbxt2oWGgu/5/AaoteU1ZQ6gOr1dUo
         JEDanuO48q9oEH9gQRUDA7nzSOZq0lAB6g/MxMYMZFuo7ImymieUmO0lcJVeTnT1gWu6
         QhbL7TrYKklauvNC7CmTxii9TzxbOk3MYMKvpcaAzqGD3YZ6u+qWROJb1i8wAYoZtEae
         aIDFPRnV5ocbCRFG1XneochKjDFzO045DGP5Bpcp6PlwnOCJczBJ1bfl/fGPOGe5un4P
         255w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698078125; x=1698682925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvcxBfUwTMvPmDC6TsZGUmIpxz3bHu9zv5qH2J4V6xE=;
        b=Sq1IRUW27FMaIocNF7gT2X1Jwd7+VhNJjR30AIsspJuh8YsIhNib0pYRzpBMO+YN//
         UTv2ZHGWCGTnAhssRPYFM5LmHY3qEmRwB+FeRctFmwZz6pRXUlAp6IZOcukKjdn/mj+v
         GkaKQMf1tiHQZq27uRN5loK4/TvNrHTdbdsKejuTOpyV7kLRCpYElNYnTYDhvO9nReze
         hHjmWkLeYhnWPH15GKXHlojL+WJoN/bV4uoTBjNCarNF7F9HQvYFl/pixtnjbN3hSqpg
         jIo8hTCeX6AS1SlvVF5QlYnhgQgMd4wPjh/ZK9WPIXTcdC53uHt4kbUDm73leSuIhxuV
         jCfQ==
X-Gm-Message-State: AOJu0Yx5TaG4hQkletkmhhWIbi7QjipsgK53GYVprEcMy+wGD0ucqahe
	nAZhEZ6GMIdu9jBNlTpSXql73WizWhi4Jj50OU50YA==
X-Google-Smtp-Source: AGHT+IEP51JeurMrSnMxRP4SCcBBFFsO16Z3a/gjoXi+83Wq0Fjd6byKKpI/lH8LyKcnrolzQSYWFeD5i8xlSchTYy0=
X-Received: by 2002:a05:651c:1038:b0:2c5:1bd9:f95c with SMTP id
 w24-20020a05651c103800b002c51bd9f95cmr6122574ljm.53.1698078124702; Mon, 23
 Oct 2023 09:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-3-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-3-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 23 Oct 2023 09:21:28 -0700
Message-ID: <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] riscv: add ISA extension parsing for scalar crypto
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> From: Evan Green <evan@rivosinc.com>
>
> The Scalar Crypto specification defines Zk as a shorthand for the
> Zkn, Zkr and Zkt extensions. The same follows for both Zkn, Zks and Zbk,
> which are all shorthands for various other extensions. The detailed
> breakdown can be found in their dt-binding entries.
>
> Since Zkn also implies the Zbkb, Zbkc and Zbkx extensions, simply passing
> "zk" through a DT should enable all of Zbkb, Zbkc, Zbkx, Zkn, Zkr and Zkt=
.
> For example, setting the "riscv,isa" DT property to "rv64imafdc_zk"
> should generate the following cpuinfo output:
> "rv64imafdc_zicntr_zicsr_zifencei_zihpm_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr=
_zkt"
>
> riscv_isa_ext_data grows a pair of new members, to permit setting the
> relevant bits for "bundled" extensions, both while parsing the ISA string
> and the new dedicated extension properties
>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

My tree might be out of sync, but in my search for riscv_isa_ext, I
also found a use in print_isa() (cpu.c) where we're reaching into
riscv_isa_ext[].id and assuming it's always valid. If that's still in
there we'll want to fix up that spot too, since now with bundles .id
may or may not be valid.

-Evan
