Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F281D3F4D3
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QgMh309b"
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFDD1BEF
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:29:31 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c5056059e0so84314241fa.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650169; x=1698254969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GJ2P2CnTobBA/8z5Cm8CPIZTuVTwbVlOW0vmiISWx0=;
        b=QgMh309bM5dL46kFYzNOXZcVB/NcbdixgEujiUSsWvsYURS9Suu+wkBglY/aBzRf/3
         gZCpofmyzb3D6XQdcKQFVZYzpGFbClLm8yD+Se18KbDQQt8Q6ra0C57GF0nzs6cDMFMK
         bVhLk9Z8dTW1g5zyx22Q9s7/r+mYGFXpERe97ntLCcjPfWwH2ZgMGqqw5qz5I4ec5n6B
         eh7x8zjs3dVKiIi0lAuCh5dbc0SeAjvJSUMjgSe+IvR2Asnjfqz5sdYvjwLO1seSg9pW
         irg02gOuiM1+Xgje2i3XNmPBMKYCfA6gNpx3D0neOXYZcciJPj0v/fE5TjPe7/Z9NzNq
         /9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650169; x=1698254969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GJ2P2CnTobBA/8z5Cm8CPIZTuVTwbVlOW0vmiISWx0=;
        b=s2NuPUMzRf+s9NIYoBin1dFtClvwTXkbVvh2f9nXSRdHvO5RFwPub4wCbQ6hlmWFta
         SRyBzTaMnhf1vCxMrDqORaiuEnwQ5Dq5BfxDYyxmwmI09eGmqmsPtvjRzZnjuFF/12WI
         TD0o7wdM9YNPnQ8XpVHD4OcjETMCGvcgcu3OvzqeonHgRE4uA/zaKokhRLoAHMnaW2P2
         w3gnRuTTGWCql1c0JEr81Fu8Xs7Zfi/gbeLE9cQ8P8Yb4jx/8vD2gClpPX6jS79qTVdk
         nMqT7HZt0kOlsiJLNNse6YE4nIMcf7VQBW6m/wPsorL+MJkuvUYHqZkdPwJWgL6UKLdj
         bjHw==
X-Gm-Message-State: AOJu0Ywt0v6N/GkJfsXYmKR02Jugm/djHUJWjC82mwk/impIY2vnr9RV
	yDP/t1jp1x4bGb1wcmqeOP0hJENr0h9XpNrePcGXuQ==
X-Google-Smtp-Source: AGHT+IHCEnrOGaYL2aZ2Uu1BYAivaKmsbw0/Dl8ITo9PK6BbJM+TMe6i41oEoFMoHhyP2EZwsctqXbqrc2W0+6s62wo=
X-Received: by 2002:a2e:164e:0:b0:2bd:d34:d98a with SMTP id
 14-20020a2e164e000000b002bd0d34d98amr4364757ljw.44.1697650168802; Wed, 18 Oct
 2023 10:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-18-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-18-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:52 -0700
Message-ID: <CALs-HstTzsbtfcRdm0W+qeoN+GO1mFxOLXK_fPevO2oCUqhxnQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/19] riscv: add ISA extension parsing for Zfa
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
> Add parsing for Zfa ISA extension [1] which were ratified in commit
> 056b6ff467c7 ("Zfa is ratified") of riscv-isa-manual[2].
>
> Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/v=
iew [1]
> Link: https://github.com/riscv/riscv-isa-manual/commits/056b6ff467c7 [2]
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
