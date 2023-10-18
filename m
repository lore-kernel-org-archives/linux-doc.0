Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC63E484
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rFxt4hl1"
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E202126B1
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:29:17 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c5056059e0so84311301fa.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650156; x=1698254956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9mW/8DEleFixbtMa99KMZOBUTSC7Ptb45fTVDigBn4=;
        b=rFxt4hl1rtPMb9vUgrsZ4CqZsqGmc7ybmV62HsiM8J0psEP2aB0ZEaMW9LwwkM0CX5
         k+ai4wvKaE2n3fl7ZBp42+djp+Uk2nfzEAGbwL66ewp5mRw/zkRByvnP8M7XWTiFu8Ak
         pn/kYIpzzvWCbw+cUJT5+hzQ5kN8od3dKOnHZ7n6TWHYK3QhsYkiHWvo0FihDIkciKzr
         QElZjBpX5XrgdZ/kCcLfhcqlA2bWPNvW/i6QHe9LCvjfZDEGz8OFpYDoYSIlL2yHJOEz
         badNr/n2xp/AvE9OrAjL8MEBYKy3zUKbSLXZjK3Om63gweV1lrWhyHbnFjS2WXfSCoqc
         FsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650156; x=1698254956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9mW/8DEleFixbtMa99KMZOBUTSC7Ptb45fTVDigBn4=;
        b=SrG/5oLXaEkztcp6dXUTfXOhnxn8YFg78B5STpA9Cf4P9WilT162jjIXTTzR5Wbwo3
         UFJKK2h7Ec3ZynOyBttYktszhq5codSiMIwKOT4G50/atz4ab0uM6JP/wPD25qm+bTxu
         0Nw9hSOYjBKxNC4FjAuOvbeLnGD8ZYws3Lo+NRe25/AgnTXxW8v9VcHcTTEnCvsnVAbT
         pyQV89REL3yQb600kR8xsNR3dCmFr2kiyLlialdIfvp76KtDvK+zRRV+p7zH+MkGxVYA
         47/7t3YR7S/k66uygKinQYi4tHJOcXQqGQtEpIiRedzpK4T1TnVVZEvGdxCIbRFphZVC
         mtPw==
X-Gm-Message-State: AOJu0YxLPupc53RKmRcswMAxnBKWSBFAelAWr2QMECeJKjyNEI76LohX
	ppsgVbb6wq84fEQ/IOZFMlgSZlITwjFbNwwNtFeAHA==
X-Google-Smtp-Source: AGHT+IEKxwcNhG7R9mpe5DzutveDAX4kbTZ+kqkFoiHb0qfB741C7dwpjxdZ3dHNWy9wDmKFREgYKiMobD1lxW4k5X8=
X-Received: by 2002:a2e:880d:0:b0:2c0:2ef8:9716 with SMTP id
 x13-20020a2e880d000000b002c02ef89716mr3912537ljh.1.1697650155617; Wed, 18 Oct
 2023 10:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-15-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-15-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:39 -0700
Message-ID: <CALs-Hss8g8+CFd9T1QAPj0eksJmjBi6jL8O1hT2R37PN31WG3w@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] riscv: add ISA extension parsing for Zvfh[min]
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
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Add parsing for Zvfh[min] ISA extension[1] which were ratified in
> june 2023 around commit e2ccd0548d6c ("Remove draft warnings from
> Zvfh[min]") in riscv-v-spec[2].
>
> Link: https://drive.google.com/file/d/1_Yt60HGAf1r1hx7JnsIptw0sqkBd9BQ8/v=
iew [1]
> Link: https://github.com/riscv/riscv-v-spec/commits/e2ccd0548d6c [2]
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
