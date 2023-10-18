Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC13D3BD
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="23BVLdIz"
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4764482
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:27:11 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so87135771fa.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650030; x=1698254830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+Kj7LOopyrO9EbtedWl87IOzpgEdsrSg3mf/n9/RII=;
        b=23BVLdIzqR6bI4D1ozZsMCKXQpAIK45Sbf9jMpNSCiYy8nWHZEg0GgAQzttgeoJSP0
         91i4sZ6jeqyswQcpTyVHiU6//M3B1zE9WqupBHmA5oDLYizxIGV0ViAS5+GfTXZhg5h6
         QAUlKxTXrxlqjC1tvlf9zPsYLbCDF3dLGUx6NnCZoOTzV016qVkWP0qZ4UzgVhBdu9cD
         7BjoKZEpFhhJUtyu2e+jDTjRmP20VyP+TkXMk+QP3gpHYLRSTJPhXGljrVmRgtg8hjpL
         I1AEZBxLyqZ7xZiFtPU1giFieM1+pXPBuCt0slkEs7397q4KT+preYsnLf5Vha7epSKK
         HOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650030; x=1698254830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+Kj7LOopyrO9EbtedWl87IOzpgEdsrSg3mf/n9/RII=;
        b=jKEmK9rUMcBhigfwT+z36M+FOUbHIqu+X/SL+59h48hI3MOONHuAkRlgjEf8qndh3w
         UerqOgtrzVuUuy0uyBOeUztLpaILF4jkhR55y0JfJzBRBLOKUoRJRIjiELB0cR7tMA89
         XOTL/124JvY4YfKPwfs8dTojjjF3Tg0zT1QOSxhN1JU7aOI63Gx2cmvgnGFO8emg6k0q
         +KgW3UX/u1z3yUdglf2BqgoCPGo4S8xwsLHjNn/VQgWssgqVTrqlVpxBNNW2BdwXrEZQ
         QAm59gzZiuQlWyZxU2phkKznQjAEJNFseteBYA2ZjgxFB329xPWK3K4JMDu3QngTsFkN
         X1Tw==
X-Gm-Message-State: AOJu0Yx7Glrj/4epT7YfQoeEtDzP4b905bt+dAZllVPfe6Kc2MgibRYA
	BdRmD+aB0hO5O4autSr+UnGtVhm8SBNzx2hPfv/mtA==
X-Google-Smtp-Source: AGHT+IFZJhAw5mzgscPKCkGfLuEObjAjse1oj45qbH86RhgIjYIEdeLlJt2zA/fa9rmaEbB5fXJsbYZYUW7bovjuTmQ=
X-Received: by 2002:ac2:4a82:0:b0:506:9c0a:17d9 with SMTP id
 l2-20020ac24a82000000b005069c0a17d9mr4831537lfp.40.1697650030177; Wed, 18 Oct
 2023 10:27:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com> <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
In-Reply-To: <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:26:34 -0700
Message-ID: <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jerry Shih <jerry.shih@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
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

On Wed, Oct 18, 2023 at 5:53=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
>
>
> On 18/10/2023 03:45, Jerry Shih wrote:
> > On Oct 17, 2023, at 21:14, Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com=
> wrote:
> >> @@ -221,6 +261,22 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >>      __RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
> >>      __RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
> >>      __RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> >> +    __RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
> >> +    __RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> >> +    __RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> >
> > The `Zvkb` is the subset of `Zvbb`[1]. So, the `Zvkb` should be bundled=
 with `Zvbb`.
>
> Hi Jerry,
>
> Thanks for catching this, I think some other extensions will fall in
> this category as well then (Zvknha/Zvknhb). I will verify that.

The bundling mechanism works well when an extension is a pure lasso
around other extensions. We'd have to tweak that code if we wanted to
support cases like this, where the extension is a superset of others,
but also contains loose change not present anywhere else (and
therefore also needs to stand as a separate bit).

IMO, decomposing "pure" bundles makes sense since otherwise usermode
would have to query multiple distinct bitmaps that meant the same
thing (eg check the Zk bit, or maybe check the Zkn/Zkr/Zkt bits, or
maybe check the Zbkb/Zbkc... bits, and they're all equivalent). But
when an extension is a superset that also contains loose change, there
really aren't two equivalent bitmasks, each bit adds something new.

There's an argument to be made for still turning on the containing
extensions to cover for silly ISA strings (eg ISA strings that
advertise the superset but fail to advertise the containing
extensions). We can decide if we want to work that hard to cover
hypothetical broken ISA strings now, or wait until they show up.
Personally I would wait until something broken shows up. But others
may feel differently.

-Evan
