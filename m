Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856091D63D7
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734389528; cv=none; b=nqfN89oPJnjeggLUf1tEsKI+hVvMgdmxrQr2mddlJhjQ7QoeyuWjRPQ/uwUoE8PGMicXumn6dgzcrhw+faI1yamFm+GZAHILxFJQeZWgTvTFOk3i5LvrhORq02TJh3sQRyCNWdfOR4NjQFROvjTDH6JS0yvT2QV+pySUFxck88k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734389528; c=relaxed/simple;
	bh=FcUBWyXDZecIEy6Q87xqXVbm9gcWUwTcI34wQnP3moc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=vE04AfY8Nldv5y8fVPinf0gyOW5LJVDk4I6D96OPn7p5wt2SJKN4r3jcCO+vLvUPOqqnBi7XpLtiOwAotsXCYmNtXmRFDkPj9V7vRdT+L4yFjfjA897+WebK/sYn0JgvlHHstL14fi7GzPHVGOrHiCN1xM31z1SmQXomehvKVRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=pWFiYI/Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="pWFiYI/Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-432d86a3085so30740085e9.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 14:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1734389525; x=1734994325; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tUwsx0D7P57hByBMwwxCDPgoIVojOI2sOGJ5I23n0Q=;
        b=pWFiYI/YWRhu+Zd4Z9Ymw+1Bkso0K99RJhg1zWVeqWlVBvzzpZGXOsHVy7HxdpwSct
         FcheyJCtUMYw5CI6zyMQrehGuVHFxF/yKCC0LYmAztPTcvTSFiqfPZ+dwH5RV8ijYv3F
         Yppqb4IaoHYEg86T9YHwl3KtcWspxf2mSnhMXnJ7pWz/g7AUAC9uKgJdMgr/1KK5Vfqn
         34h2DAY3Zl+XZ0ddE/RNdtJiN+4MRMBLeEEkwVCM1jHnAb+XKfQDEh0tG6n4VAzv/6EO
         s5jFe/R65tBirsumARtZ0U7oHdDTnrGccFR+0manPzipX7g6RDEYIkKr+wro16Ax1qML
         Zbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734389525; x=1734994325;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tUwsx0D7P57hByBMwwxCDPgoIVojOI2sOGJ5I23n0Q=;
        b=eylMxjVi/OrhZNcSQr2bW2kKWTmMUswjAnUT0/PRQSy3HfADIA6g5hdwesTjc1Er25
         aZECUQJABVTFXmA5oS9QHxNlTgF4SBnRunRp+Z7kZ+2XKga6D5QSpqFAS+Jhdp/TiVLo
         FthnFBfnPWXBj8T0XmTmAMvrwhEdoAP4RBPShc8tw9F75YTaWvvPNWbwF99brVru/YVI
         SQzOOvyl2eEXVBa0ljKKSXxnoxc0J3iYKuutONCMSw5Argi1x25s35ylJdQOATbExg+I
         h71Mw/csuYDhXT7uUEnnP+EILvXk+ODTOKHYZqWLK1ITfFJJwo/4oG5zrGlW+FEkfrid
         T8Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXcWaRqq1Mk1xDYTEq5FN64yo+JW8LNHbcw0nrSglREHI2ZU8AtxmUABtJ8obbRo3ckG7A7RKOBY1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dBCRjtonWty0jeOhyHSH7RsDfP6UQ5oRjN9gAYiAGGPDO/d8
	6nVewj8NM8ymfm7bu2GssvL/jW+usZ8e+rYQS3XtnnVv/FnF2eZ+AkCua12ZXgo=
X-Gm-Gg: ASbGncvAAT5OQRPtMEvnucljdZIvWPneVZ8lOhvxTouviuSV0U1rnU2sVY++S0nPU0N
	9K7TVOsaZFbfNeybXcrWBpeL4//Rs7MTz7AJxqZweWcxDNAF6U68G6/zCmW571batqLkDBskhTd
	7H8q0OzUqCiCxVTBB2CrEv2erAZN4oIPj+GrpWA3YYieH2Ouzw/CsIydzqb09g8O+hQ8Cxypg9Z
	WzVRlmk98llL1WTorvBNv1hYezDbmSj/vtrxI/GuhwFq+utn+tHqnVeNXgJHBFBm54hlA==
X-Google-Smtp-Source: AGHT+IGkXkCZ1V8JrmSX24LbWgYC0WbYIpEMJ6w9YigeL1K3Q2t7aofiKXEhAFod/RI2RSkoUoNckQ==
X-Received: by 2002:a05:600c:511a:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-4362aa9dd9emr108990445e9.20.1734389524669;
        Mon, 16 Dec 2024 14:52:04 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c462sm153527565e9.14.2024.12.16.14.52.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:52:04 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: add bfloat16 ISA extension
 description
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <5e878b5b-b49d-4757-8f7e-4b323a4998b3@sifive.com>
Date: Mon, 16 Dec 2024 22:51:53 +0000
Cc: Inochi Amaoto <inochiama@gmail.com>,
 linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Chen Wang <unicorn_wang@outlook.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F52E8856-7602-4E4B-8932-2B13AAA30822@jrtc27.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-2-inochiama@gmail.com>
 <5e878b5b-b49d-4757-8f7e-4b323a4998b3@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
X-Mailer: Apple Mail (2.3826.200.121)

On 16 Dec 2024, at 22:00, Samuel Holland <samuel.holland@sifive.com> =
wrote:
>=20
> On 2024-12-05 11:58 PM, Inochi Amaoto wrote:
>> Add description for the BFloat16 precision Floating-Point ISA =
extension,
>> (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
>> ("Added Chapter title to BF16") of the riscv-isa-manual.
>>=20
>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> .../devicetree/bindings/riscv/extensions.yaml | 45 =
+++++++++++++++++++
>> 1 file changed, 45 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index 9c7dd7e75e0c..0a1f1a76d129 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -329,6 +329,12 @@ properties:
>>             instructions, as ratified in commit 056b6ff ("Zfa is =
ratified") of
>>             riscv-isa-manual.
>>=20
>> +        - const: zfbfmin
>> +          description:
>> +            The standard Zfbfmin extension which provides minimal =
support for
>> +            16-bit half-precision brain floating-point instructions, =
as ratified
>=20
> I think you mean "binary" here and in the entries below, not =
"brain=E2=80=9D.

No, that=E2=80=99s Zfhmin / FP16 / binary16, not Zfbfmin / BF16 / =
BFloat16? The
B is for Brain as it came out of Google Brain.

https://en.wikipedia.org/wiki/Bfloat16_floating-point_format

Jess

