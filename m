Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240F73D999
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vYhMbNyu"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8081CD73
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:29:09 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c5210a1515so56718411fa.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650148; x=1698254948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5z7yiUweEg23BwK7zcSyTWxXFB2LkcpzcFHHPWHt2IQ=;
        b=vYhMbNyulohFq9QOPd2x9cJOdUVEhe8ID+eudIovN4H2IYpqjm9Vt3pUzshFlb0JOz
         lWJaBjSDh08k5AYafNbasXLjTDAmXNaqpQ20RtVjyud3EzH9RymZADIotwEIIEZodBcN
         NocCFZY+emoOcgGOhmxa23Uz5Ws8dVJ3Q8tfBW71rnjPztQZ3fnYdzCa1RR4qYheE95l
         TeeJHZWcjNThIS669/b8Xsqw/+H6ZqcP4saubh8o6SKiBKvgtB8O8m405BUNak5ecNFf
         /G4L1kmT941P6Ci6AWvr/mBjG4JIC+FIdboXMdk9hOaU2rh8VHIL27xigEiDY8TRefrT
         aUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650148; x=1698254948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5z7yiUweEg23BwK7zcSyTWxXFB2LkcpzcFHHPWHt2IQ=;
        b=BnPBq43ZvfPRRvIXWdm3dd1SNuJoN4C9T5becgKMPGZHLzUIQXT7teNN6YkYua7fSn
         Ebe+TdCILfbwilwRs/0Wk4SknUrup+FY21rSTU7v0RZ8dLwJ5NrvBZRCAIV5IdnmWM1Y
         KYYAxq6eFU3iwb9W0MT1par/fa/d90YHbH9sszTX33Olmzq6/ZmJqDiqIL+on53iaRie
         rlSJ8cEBxBVmZ+TyShM32uI/8Bo1eHCNz/haWVApOsZVdi+fl4kMy4ydRjOlo+edUsvL
         BiQOJ9wmBTPlYUREOMgjyMJ8cd1by73d1/e/astNVe6mqy0hYwAy8aTYF2mRS07+NIkN
         wWyw==
X-Gm-Message-State: AOJu0Yy4rYT5nxxEQZmb0x9cuTe7RhAr64P5JgxDvDK3+Gxozb21ALZI
	0D9q5cpSgSskM8kZjpslgN4QsUgjqBggS1tYs4QD7g==
X-Google-Smtp-Source: AGHT+IGo8MWu21Tet2EOfE5+wEjwJOt2gHO9Cv9qIsNHDtqKivVuDg+TfiVa/BHwF8TahWAz+g7w3WQIL7DGU1ZQdrY=
X-Received: by 2002:a2e:a7ca:0:b0:2b9:ee3e:2412 with SMTP id
 x10-20020a2ea7ca000000b002b9ee3e2412mr6279909ljp.22.1697650147521; Wed, 18
 Oct 2023 10:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-13-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-13-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:31 -0700
Message-ID: <CALs-HstrnSM981utJD8tUdjwTc+rLTP9Eiep8A8Pbx29Gz4Xdg@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] riscv: hwprobe: export Zhintntl ISA extension
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
> Export Zihintntl extension[1] through hwprobe.
>
> Link: https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/v=
iew [1]
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
