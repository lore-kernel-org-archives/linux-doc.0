Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E541199CE
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="o1uvyhw4"
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47309449D
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:25:27 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso101344951fa.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697649925; x=1698254725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbixeUBAnXxzznhgP0IZfHR6Ap9ypS+fHg7KPLOGdDs=;
        b=o1uvyhw4mRfZ0Oix87hN8GJA2ClSos4OYPMiO6an7rw5MbWQlhzuqj2eoL5yOrVwtP
         p5QUS6/h0TYpeOjkUBnHYQl0ra7W99G/ozAUFAGw1+eNYSqRl1zDd5BEyr4u0wCTxBI2
         ExUBMA6CSR6G11LRLu4MkCxjeabymUgc7wyEXYwjP17INwvLCKjskjsxuyR1rZXqgwFh
         yijNiifZUhpSDkQo1zOl1h6HufVzyM1NoY0fVzXQKAsl9YTPe1oyAsKmKH0RCmTc4ic4
         sECIegpq2PWyhtoMuKd9k8ZuzLSAmnBau2ehOzrHVgaJwRANXdUb+HL7u29/tPU5Z/wK
         3x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697649925; x=1698254725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbixeUBAnXxzznhgP0IZfHR6Ap9ypS+fHg7KPLOGdDs=;
        b=MXK0Df0NTxprRSIqepICgGzdcxPMprJmxOfMVZ/38WEz+Ntpx5eDf1K6aWnP1jfXQs
         bNFJIuHA6I6NyVrAor7zpJyR4HvV3I/cVBGJM8H0CZePpRp7TtlztibLfMBqCe+NoLlI
         U5l8LdfHi2hpBisSMeM5e01dM4uErFPKUMOKv3ND14tMngBqnp6vaO7b5St0/OhYXO8E
         6VaKjouuWGFqm/tmbW7asZimPg6s2cFDsEirmQFjz4WyTLROuZoV64K3yfKR8WcIEKKg
         xt55JQNeA2r8UWeFaltH5GRkKjasq+VIq9NXiRRL6vJq6IWNKSJhx0WK6UdfnvhUhaZH
         Q8TQ==
X-Gm-Message-State: AOJu0YzVzAvmi0rDnpKDn0eetRIBjpk6ccYo9yXiKbxUyAlPzx+RLJOf
	edhYc/PTSgmNGMyzBNDltjh2sA9FeTzroGo6sQ5g4A==
X-Google-Smtp-Source: AGHT+IHzFya1PKaT/fp+v+fPaWtz2nZSKePWthzhWNxfg7RP5nxfUjweywZ3NPnQfQWgt7OXrR8rjvSgSZf0oZQ26Nk=
X-Received: by 2002:a05:651c:10b2:b0:2c1:522a:8e25 with SMTP id
 k18-20020a05651c10b200b002c1522a8e25mr3786476ljn.32.1697649925479; Wed, 18
 Oct 2023 10:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-4-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-4-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:24:49 -0700
Message-ID: <CALs-HssE=denuwBqH4KtCr1QqTzPb9rELW1ZXR5Cr-nqQQWQoA@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] riscv: hwprobe: add support for scalar crypto
 ISA extensions
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
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Export the following scalar crypto extensions through hwprobe:
>
> - Zbkb
> - Zbkc
> - Zbkx
> - Zknd
> - Zkne
> - Zknh
> - Zksed
> - Zksh
> - Zkt
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> ---
>  Documentation/riscv/hwprobe.rst       | 30 +++++++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 10 +++++++++
>  arch/riscv/kernel/sys_riscv.c         | 10 +++++++++
>  3 files changed, 50 insertions(+)
>
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprob=
e.rst
> index a52996b22f75..968895562d42 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -77,6 +77,36 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as=
 defined
>         in version 1.0 of the Bit-Manipulation ISA extensions.
>
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as =
defined
> +       in version 1.0 of the Scalar Crypto ISA extensions.

At least in my v1.0.1 version of the crypto scalar spec, I don't see
Zbc. That seems to be defined in the bit manipulation extensions.
