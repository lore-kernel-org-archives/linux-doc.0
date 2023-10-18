Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96E185D
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 01:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ff/gZ9bw"
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC87C6
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 18:45:37 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c9e06f058bso43845395ad.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 18:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697593536; x=1698198336; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIoyMcQHZ0Qpe7BKvINLbeGCoM4NhndfXHONk8A0DuA=;
        b=ff/gZ9bw0UNlmX9LRwzlObgx1Nn0oDNWNqhn6focVKW/InbdoeBzX9etFkTiG8idD4
         06/QHNFGW/PpAx15kGyXh4jLErgMUJvANiHbz/vp+4JmwqQ74evtHZKrOEKJ5o9YkgPQ
         fAYZS+uvNgtk4MjuVEvTl2xKdN+1+YIvCKoc/JZW9goYG5iFzopPb7g2ucqvtCr53/Lb
         OUMLtA7Yd7rYGgpE7CGFIIZGrJfQ2JbvetAMb2uMpDzqugoUVs5UBV7UbmlbGJHvrM+/
         S0nFwJ+taEODed2M0Aaa36NRBZgvfWsNdD1P3jzdEJs9E787CR+2bqxW6cwTEtY3GviW
         AsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697593536; x=1698198336;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIoyMcQHZ0Qpe7BKvINLbeGCoM4NhndfXHONk8A0DuA=;
        b=RGDLbrPec1VdbZxgmRb2TTr58WLBxF8s4wA3TOjk4qBNyssqZXTisi2MissDZ4wlfH
         aihTkfzPzs/0DWv4xw9MEBftysn5AHkEg0Qw+LAMVDu3Uu8nNo4rvJhPL1AizJmZv++t
         w4o062MtKNbCG7B6+rO7O0fIPeJV9rraB9Y4zK3qxOzX9MIw4IpZbno+MB4ukmSLB43T
         T2Ni9gz8hA9CjLOJ3vM7ZJ1QgqVZhSdypAVaTa28N9NH5VvOoeOVp3gxVPaMhtz1LJjZ
         3ey5/usVH/HM5AF5lFdbv9jpbEOKQioXxE7lrJiQfbqvSF/MtS4EL2iDoVKt31qGy4XB
         LMxQ==
X-Gm-Message-State: AOJu0YysX6OPDfqCor6+21eYx8NsttG5GpN0N+bRW1uCSR6OnA9+OOlc
	XFbdcNJtEEi4LQvtzWObVs/s3g==
X-Google-Smtp-Source: AGHT+IEhf4Aw5KzsP/CJeC+Xlre2SWvSR0H6szLH78PgMiwD0/+840q7dozZd2G8H0QR1O26UaYkUA==
X-Received: by 2002:a17:902:e5c3:b0:1b0:3ab6:5140 with SMTP id u3-20020a170902e5c300b001b03ab65140mr5806185plf.4.1697593536621;
        Tue, 17 Oct 2023 18:45:36 -0700 (PDT)
Received: from ?IPv6:2402:7500:5ce:a18a:d02c:5aee:75ae:ccc2? ([2402:7500:5ce:a18a:d02c:5aee:75ae:ccc2])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902dacb00b001c746b986e5sm2247981plx.45.2023.10.17.18.45.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Oct 2023 18:45:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231017131456.2053396-6-cleger@rivosinc.com>
Date: Wed, 18 Oct 2023 09:45:30 +0800
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
Reply-To: 20231017131456.2053396-6-cleger@rivosinc.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Oct 17, 2023, at 21:14, Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> =
wrote:
> @@ -221,6 +261,22 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> 	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
> 	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
> 	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> +	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
> +	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> +	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),

The `Zvkb` is the subset of `Zvbb`[1]. So, the `Zvkb` should be bundled =
with `Zvbb`.

+	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
+	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVKB),
+	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),

or

+	__RISCV_ISA_EXT_BUNDLE(zvbb, riscv_zvbb_bundled_exts),
+	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),

[1]
=
https://github.com/riscv/riscv-crypto/blob/main/doc/vector/riscv-crypto-ve=
ctor-zvkb.adoc

-Jerry=
