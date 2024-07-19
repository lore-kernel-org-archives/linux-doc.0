Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021425CB8
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721380307; cv=none; b=M5JjsPUGL3l4EwF3xZfIRWJS0lhmdx8amg449zElmn3CpWQwK8IjpdBMSa0g9KJjXPUn2jVpvkRLvrPg/+9vCS/h5GT88/BfxHFnqcdSNP0m+16ZKex4+74Y2EYuFZSprXgb4zUCf7ZqrnMSUbVc8mxomym5dfXNhvkMusDr6OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721380307; c=relaxed/simple;
	bh=zSLuKaN+gBA5/2qa6gHM65PDw7SxQxl6CWR+d4GMVCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vnnph4+sRBxMlevbsQ91GpnuQYRNw7m23+OPKNam4vjPq5l3FYsdhl3ayWBmoPufMH+uLj0ProFG2UPhOLubX7+S5MhHub3eq1k9/TEQTfk46SJ7zoElgunpfzbASxCou0Uml3sBBTtcH5Ry4s5lXNfrBG/Ba4QZbUOvnYBOW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fNjwIbjN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fNjwIbjN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a77cb7c106dso183040666b.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721380303; x=1721985103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLucreB4C7Cq/x6iCkzClVthNh5Hb9jZ55GIvzS0dF8=;
        b=fNjwIbjN9aI1n/fU/uuIOYhXZbN3YDZy11mPKTwmXrdS+pk8/GvOUgQ/1LUOXQeNH6
         jGrXie9odqUYzeX37Wqw8Rp1yN8hyBRNXgzZHry85L0SOqMToUUkSPJkyiFFDKXu+oP5
         u7tk0Wv+MOwCbg5/ud78w+JyaKe2Nw/u2yq2Lv3/aqMISmgtxiODR1kn4Y2x66WIBluX
         c+wiqptc9TDvqGjh9Na0IFquZrMgLAL2n+GnBtXwv17mh1zBwKRzUHegCpIF9Zc3V1ju
         47A6WH6KmT62T2WF1N1UneLWpUphv8ZTLbF8UGEvjrjX9qwosXrIiifMKnXZ/HJq6tJg
         /8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721380303; x=1721985103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLucreB4C7Cq/x6iCkzClVthNh5Hb9jZ55GIvzS0dF8=;
        b=pthsN3p9QJfN28rqne50cFJHePaAwQmToXNZJs1DMTDR4v4Rp/QRw9A2/iljFSI23k
         zhOpZ96cIcFvIYvNOUmV8Y3cBQVVa5HHr1LeyqoVX1+udZ6OzdYThQpEkR9z3Vh8lZZu
         pQjpFwSyPFKUFmkNSPDwMxPAohf0uQRBRFlCffteZ/hWd5Z8Lp4LzJVph1+iR660CGQy
         +NbnFKxM4WNIkAbXhtQEfKtkzSisIxw9CdhR6cU3di6iOvRDVQDYSPAl7KNTkGZwoWW4
         kkJNHCSyW7SPyhPwzjoX0OYQXMfXyJTDrkGl2pNa/5xlSU6HsJ8cznAaUCXRbYAQCULe
         V8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVCEsE5KAKAKXWh/zjzhVNuvJ3YSg4cal0b9iN2ay2GU2xyIAix+7++cHNaentSItNtjWCyaWZD/LpZtAHaCv/IyUd8+qKkqoSc
X-Gm-Message-State: AOJu0YxcJMU83mWvJwZTuIkNwRv7jADVdak5tq7hwowr7/e6hacGOy+P
	oH1Q9usmW3iq+8uX70X4eMKaVDa9GMZxrJ5IBF9tkn1fYtRedr9BKLfPLdZDjyApxWfLOnvL8BO
	cUMl1Dm1IM7SkJJtua52quDZa076tlAakg1b60Q==
X-Google-Smtp-Source: AGHT+IFO6hf+5HOcO5Mu3nZVEBJhdhYQsXgwhq2XadyFC/SlzZiV7DtJ0QY08kz7HxyLbxCqNNPbNHwc+UPc/5DYNsY=
X-Received: by 2002:a17:906:bb0b:b0:a77:c8a8:fd71 with SMTP id
 a640c23a62f3a-a7a01192e56mr514488966b.32.1721380303298; Fri, 19 Jul 2024
 02:11:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-10-alexghiti@rivosinc.com> <da5ba38a-8848-439e-b80a-3d6584111a78@sifive.com>
In-Reply-To: <da5ba38a-8848-439e-b80a-3d6584111a78@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 19 Jul 2024 11:11:32 +0200
Message-ID: <CAHVXubiUfyPJtTzhm2N7yuv6CPqdDvL+Lm3Fq=8XT=gn77qPMA@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] riscv: Add ISA extension parsing for Ziccrse
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 2:53=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Alex,
>
> On 2024-07-17 1:19 AM, Alexandre Ghiti wrote:
> > Add support to parse the Ziccrse string in the riscv,isa string.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 1 +
> >  arch/riscv/kernel/cpufeature.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index f71ddd2ca163..863b9b7d4a4f 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -82,6 +82,7 @@
> >  #define RISCV_ISA_EXT_ZACAS          73
> >  #define RISCV_ISA_EXT_XANDESPMU              74
> >  #define RISCV_ISA_EXT_ZABHA          75
> > +#define RISCV_ISA_EXT_ZICCRSE                76
> >
> >  #define RISCV_ISA_EXT_XLINUXENVCFG   127
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index c125d82c894b..93d8cc7e232c 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -306,6 +306,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >       __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >       __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >       __RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
> > +     __RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>
> Please sort this entry per the comment at the beginning of the array.

Done, thanks

Alex

>
> Regards,
> Samuel
>
> >  };
> >
> >  const size_t riscv_isa_ext_count =3D ARRAY_SIZE(riscv_isa_ext);
>
