Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06827171E59
	for <linux-doc@vger.kernel.org>; Fri,  5 Apr 2024 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712338438; cv=none; b=Cr2ogqW8BC8ZfXNzDziPDmny4RlJcxsNZ/B+pXQLa7NZYo5oRjJsj2rFsFfJWrc6h0NkEuYCw3MBJxoDl+6G1tvXrhoGcI1hZKbausRpPt7Emd7sqBnEPIe4rkDBVb7RmIpUesKXRb/Hx7+0PL9TEiqyi05QSkZZa7sc8UHnbq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712338438; c=relaxed/simple;
	bh=K3vmfqpd94g8+suqMPyLrxBzyLzdFpbPlGZ8DqHjkxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnp+5zXIfzRlnpFwU2LviDcFvieFa3vs+BhYYcmiON9/SLS9nd7EZN5tQ72xnHDIhD/BLHnuHu0Gor9bMA7B0gcHAKnvv5oC8+bW8fWW0hoI7+p3PU565zaO2J2CRdn4ATROU/sH9gLWcC01vMDwVBVECTVAPrFXIzxk+315l1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vAEYWKwU; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vAEYWKwU"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc73148611so2708040276.3
        for <linux-doc@vger.kernel.org>; Fri, 05 Apr 2024 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712338436; x=1712943236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3vmfqpd94g8+suqMPyLrxBzyLzdFpbPlGZ8DqHjkxQ=;
        b=vAEYWKwUqG7okVe/Y2WxNAE6BtAubziz2DaI+6cg0ypRpQFh0sUq+A8pLxpcE3q6Iv
         zp/+vYVCDCGk7RPvcV9WbNxZOE2sf/I4XEIQEmlqoUwdZJv6E4xigynEcg65YSIlC6Uc
         YsoOap7uogahgAnFiaqMGJzZ6ClIXWbEV2Wvs2yXo+5z+WDtCSN6953gW8m+ZWEoQrGG
         QvfXaav98xkcE55RpG9ZN0wj9snPMFeu7ZwlETp1upIeBsuB9yJjUuiW0A6Ei8Yu14aQ
         QjFZH9OLFvk4tkxh4bdJcpfmkYeW8LNxnMFHO3EtTzqs9jzr7KCxZYm5qmHgmbODEY0O
         RYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712338436; x=1712943236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3vmfqpd94g8+suqMPyLrxBzyLzdFpbPlGZ8DqHjkxQ=;
        b=Ec+5XD9J04oCxHM5kD2YaLxxyxmqQYSFp/nI9TA7mx98PHWzZMddq/9n5ReItc70kI
         8uazQXTSCiFnheC5lxMteB/wh8K+cb+3uwBHdlGYbSLAUOXMqDt8iQfFb8r+boTUdyDf
         T+4oI4jSgPupK3H3h+yLOcnu9L0OXjRDLQwbDI7vYCuLhOW06JqlQDK2tWCfm6laL1S3
         xj2la7cJNNqe6bbNJLPZR9021uIZyLrVfDrBHCLWSGwictG6I2DtR+IrERTEt/rK3Bs2
         8c6eKxtITQiDZILGP4MWRwsfAaMQmT1O2tB8azQXiip0i5P3SURNR3drzSFLEuBD+tRp
         4C0A==
X-Forwarded-Encrypted: i=1; AJvYcCVGWDRAmjt4Y8JEOCzNYTPJeWk7YUY5PMMTsprp/cu4sYY7HlPJxKal5Z3eDOqP7ZqE2m1Oa4wKI6F4ohLIbOcIwigssbtoFgyb
X-Gm-Message-State: AOJu0Yysvmj93G4ZStVuscRwk1BqUiRYi+LEHz8WT9+bN+UQluFmiJbs
	UWJ4D7GMGMRjS9Nvn9luu+ZFhWAcDKfJydygdHKvXt0w71QJKZfOM5pXMXy47FDmDKDeBceA6BI
	7oWYs/WXVkFTFQiaHj2wzKXJjeK2xtMCnGaDuAw==
X-Google-Smtp-Source: AGHT+IHnKrc4PwDyhWJPdfeFqqNSHEu/4FbT6H+bcXEG7hzOD320BvkD3M+wSU/pjaJrd/w5bdcvFXKhZ2+tWNjNqrs=
X-Received: by 2002:a25:f50b:0:b0:dda:a608:54bf with SMTP id
 a11-20020a25f50b000000b00ddaa60854bfmr1849823ybe.56.1712338435998; Fri, 05
 Apr 2024 10:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404103254.1752834-1-cleger@rivosinc.com> <20240405-091c6c174f023d74b434059d@orel>
In-Reply-To: <20240405-091c6c174f023d74b434059d@orel>
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 5 Apr 2024 10:33:48 -0700
Message-ID: <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 8:26=E2=80=AFAM Andrew Jones <ajones@ventanamicro.co=
m> wrote:
>
> On Thu, Apr 04, 2024 at 12:32:46PM +0200, Cl=C3=A9ment L=C3=A9ger wrote:
> > The Zimop ISA extension was ratified recently. This series adds support
> > for parsing it from riscv,isa, hwprobe export and kvm support for
> > Guest/VM.
>
> I'm not sure we need this. Zimop by itself isn't useful, so I don't know
> if we need to advertise it at all. When an extension comes along that
> redefines some MOPs, then we'll advertise that extension, but the fact
> Zimop is used for that extension is really just an implementation detail.

Only situation I see this can be useful is this:--

An implementer, implemented Zimops in CPU solely for the purpose that they =
can
run mainline distro & packages on their hardware and don't want to leverage=
 any
feature which are built on top of Zimop.

As an example zicfilp and zicfiss are dependent on zimops. glibc can
do following

1) check elf header if binary was compiled with zicfiss and zicfilp,
if yes goto step 2, else goto step 6.
2) check if zicfiss/zicfilp is available in hw via hwprobe, if yes
goto step 5. else goto step 3
3) check if zimop is available via hwprobe, if yes goto step 6, else goto s=
tep 4
4) This binary won't be able to run successfully on this platform,
issue exit syscall. <-- termination
5) issue prctl to enable shadow stack and landing pad for current task
<-- enable feature
6) let the binary run <-- let the binary run because no harm can be done
