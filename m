Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36734C8D
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 02:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QWt2lO6z"
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565881FF6
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 18:58:47 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cc5b705769so3395115ad.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Nov 2023 18:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699498727; x=1700103527; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DppDE93uNSB4OmZjw8tLCue7p/imeYMCzu6NlobepZ8=;
        b=QWt2lO6zuHTDi57JkXBHKz8ANyMR6CcJlEUsLGyDQ2zkXdpj5EgAvuJHKfbT0Q+NRe
         x02fwDnXGSIo/ay8S1TBbHgUrWOQVh9Z9P6VikzpSEIelUzZ2RuIOIVwLLam6T9Rhhkx
         Mbv11mtYL9K0Y6Lp9rbfg41XL5ng9l6zISuYunDvIUPsPEvfQZ/beygwF4Av/3lGAfst
         KIMIFdPJMr/Dz4Upv0IPUotDN08YKAC5YYNrGUqfnuPAEtlAlulMHltNpX+WgAmCDqkC
         /OhWStF59Zj/bwY7iB5ZLli0W9KHrOauH9siUc5/dUr7dEjx+5a454KWbBWvqf9JnUdr
         oBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699498727; x=1700103527;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DppDE93uNSB4OmZjw8tLCue7p/imeYMCzu6NlobepZ8=;
        b=eb8Qk3yHoI1h+gOqN1FWsc7d2Z61ssDBqlx969wnFKmd3aTIN7Z8BoKbu6i43rnJpe
         wFtLEVFbjZvU83Tv9Y55qZG7O5HlfQLSelPsUaEYpyN3ZmX7m6A9Vngdpy4yqy7GU5mu
         ki+HSJaEJP9tx9RLEBvFzE/op5HTBgak2XKa0lZRnlrR0O1eaabadWr8RtvIIHkqQia8
         PNh8wLpbs4gUmhY1LYts36IE//VLGwN12XEMAgvYpeBIIsGAzGV+dquAuk4H7h72t5K9
         WH00DYVYv/SwRV3Xe+zB41Ycy0ke4bGYNq/d0bTc/XQwO6ghxcCwdjWQm/7BzTMBgB1B
         Uo1A==
X-Gm-Message-State: AOJu0YwAK5/1KkZfENSkwoHSLe0op9IK1EQNHGcpYaMaC5LrXPWJLmjb
	qYOGI7wIWsABiMlhl6vYMAbhPg==
X-Google-Smtp-Source: AGHT+IHn09W1cRZDEkkvIH3Oo47/42K6T4xkwgAHBTl4aY/xkO5ybUHzFNH6lbK8MUVDkJ0h6qQGkQ==
X-Received: by 2002:a17:903:2341:b0:1c9:e508:ad54 with SMTP id c1-20020a170903234100b001c9e508ad54mr4317917plh.13.1699498726815;
        Wed, 08 Nov 2023 18:58:46 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:aeef:31cf:49a7:c:20d4? ([2402:7500:4ce:aeef:31cf:49a7:c:20d4])
        by smtp.gmail.com with ESMTPSA id g4-20020a170902740400b001c465bedaccsm2383368pll.83.2023.11.08.18.58.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2023 18:58:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231107105556.517187-7-cleger@rivosinc.com>
Date: Thu, 9 Nov 2023 10:58:41 +0800
Cc: linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
Reply-To: 20231107105556.517187-7-cleger@rivosinc.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-Mailer: Apple Mail (2.3445.9.7)

On Nov 7, 2023, at 18:55, Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> =
wrote:
> +static const unsigned int riscv_zvknhb_exts[] =3D {
> +	RISCV_ISA_EXT_ZVKNHA
> +};
> +

> +	__RISCV_ISA_EXT_SUPERSET(zvknhb, RISCV_ISA_EXT_ZVKNHB, =
riscv_zvknhb_exts),
> +	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),

The Zvknha and Zvknhb are exclusive. It's not the superset relationship.

Please check:
https://github.com/riscv/riscv-crypto/issues/364#issuecomment-1726782096

-Jerry=
