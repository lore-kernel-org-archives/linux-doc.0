Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38D265CC1
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868689; cv=none; b=IEKlf/ieLXxnA340BM8LKSjidnUksLegUVKlWildbg20PK9j0Sa0InFaag87Yfgj6u+m3ol2TDdVALH3/Mg4Bz8y0jINqEtm1VGGGqXwgdfq8AAC/5ZghwfB5oaBawgUEZOhHOM8Tr2f1ORxVM1cg5d3Q6Rx2LsF4x+85Pqa9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868689; c=relaxed/simple;
	bh=qUINEFrGdyqtUCxJgPIIWVSKNSceW/vG2w99VTb0EFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED9dBLNIJ8PbLGpCPluACzWp2pG4c/MDJvVzREIrNxAm0UPrO3DldDp9jccXjIOyw9uXBCh2VJtdwdrDaTwDLrsg/0IX1z1pTwmF1Rg0BGmM2N7ueoSFXIETTH42LMo2wvjTzag93BpHJAp8/IFpbBn/vf6h1E6c0Bwo7selWqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EbCTWpuC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EbCTWpuC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913b539aabso549721f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741868684; x=1742473484; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jdwK1Zh8ZZo6rwDf542VaxRAlTlQ9sZFdzOTXwzDIRU=;
        b=EbCTWpuCIEVmrusg4jm7PmZ3G9kQr3/k9FBQmvZQ8D7L9OQ+iISsTbF2CI9I7Bi7gG
         bkXR4Csa9wQus0Wn3s8RDbygCrSwQoxc0zR4YNMOspJKsGE+qogTlrrQv4/JIgdiLaQC
         srHIzpaxhUnaPIR/rbJblHFnLgfoenOWhKitdtVdX6uHq24OQ/Jk8asZPuloMdH88Gcb
         PwABAp+AOU8lCJ61EKwfQlNMR9F8nIEIwMFNi4vwTZIMkosSsHDu5x3I0O/zvJuFQpZQ
         CTaTAXGf8EJm2gSbBuYUb4oq4aKf0bSHvrfQou7r10dsjUH3wz5o/1X0jX53FbeEL0Ws
         caHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868684; x=1742473484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdwK1Zh8ZZo6rwDf542VaxRAlTlQ9sZFdzOTXwzDIRU=;
        b=Zd4SQIS29x71phQBIsff06Y2WvY1rQP1LagDc9bXPNJUJ795ZACsf3CumWzogAm//E
         KDgSeBI5g/pm7raZBjfjo2AaXjy09lkKeMKJY1z11Qor/dT+Ariqkrapq5j/BnyCto2r
         Z8ypZertg54WD+9sgS9iE5BRx3aIPVpUkZkLZ4zxvi0LlXUF4/L72/eNzwbeQCpP8b6y
         e90ERIFS/vWL4/T17iu8+i859Yid5UO/JYh2ktD/BZwByK7LqNyDb16ZEthmLcq4NmQy
         WeFXtZT5Btt6kE6MsbaGtTrhA6J7kQz2rbhKmfTqNf/xm7rIxXZrTVSX2D1xQx9SAgsd
         QboA==
X-Forwarded-Encrypted: i=1; AJvYcCUpKuKjo1EJfmgz0NzdPw5mEbIN2jG5UwDps9ZsMQZbR4aeoABu/hgYAR5QNPuSVFlU/uL5gqCkqlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLwgFu+LFe4XVUvoQfC8q8z1XmGQFYoiO8BysNpWoG2l5XvzC
	A1Mbq2nN4NaRJ3UCnGF9Q9pQ55+kY8YOkV7ruqJI1XcZVtUzjmMIRuTBxc80rag=
X-Gm-Gg: ASbGncszf/Sh3XnvCQtMhiHrMkz9ioNafRKj1h807KxlkAnDnVHStVlbwppDK+6Rc5q
	tG94RMrXNWD10ABOT9F5ZkwpbK0wvQjwQvnLB6QF1vgh2DU4pIlPHIeyqb6USkSG7zeFN0W9YWo
	Ieuxu+ouAX0sg0wgSd3604g6Yuq6pdGK2mJpHfZXAOo1Ejac/uIZbmf0yGRyumdo7VoItTP9RnR
	aV9M3kwM5FqZdlits5KoLwzNCHKY/XSYHYr70JKh6l6zNK01zdMXzBuUQWZGcLsLhsTSNrAcfk1
	6sRj61OyNg5bLJd7zFS0GSlrt4HIqiLj
X-Google-Smtp-Source: AGHT+IHTTFdUMyPE8J6/FJ/Tz2TmgEnvUPiqAP3Vg4LJA9U623EyzHKoPA3QMg0KCVbZ9Z4v0fkfMA==
X-Received: by 2002:a05:6000:402a:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-39132d22aa7mr18761264f8f.3.1741868684583;
        Thu, 13 Mar 2025 05:24:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b90sm2006325f8f.53.2025.03.13.05.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:24:44 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:24:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v3 01/17] riscv: add Firmware Feature (FWFT) SBI
 extensions definitions
Message-ID: <20250313-924c6711597160f50c4cf90e@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-2-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-2-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:08PM +0100, Clément Léger wrote:
> The Firmware Features extension (FWFT) was added as part of the SBI 3.0
> specification. Add SBI definitions to use this extension.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
