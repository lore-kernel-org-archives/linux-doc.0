Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD02263A
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721934024; cv=none; b=Tu5cPYHuwqCnEBp3ZaguNjqaK0q51KTOqJZdYE8d9exQkr97ncHMt/PeAgHnIELjqMKsya3YxRqCKDO+jfcX+sL9vOfRqnsG67Lrkg0TV7i+Wj7EZfqQOS32vhcIbTVUj7tyg4pj0rQkGm8WCtlRtsRw1tEsStXT6G8v+upy/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721934024; c=relaxed/simple;
	bh=Odp82Bt/6lQT9q7XLZznJSSdvglIivq+nF5Svn4ptT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIbGRCvEgSUWdP+D2FMjS12NY3mhFXInpIPGxsDQBUaTeKrEtA/8h0Z+QMs2Mc+2my2Sr2Ptvq+M8HaM/c1Qrjy4zb7YzqGMhCYZnezR5NoXaYxTLFXBYL0Ex67UZNY9Ea/HdvMS/0yu1T2YW2Dam5jpeJEGxA2JVxRj4mCV8jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=C4CMyTxp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="C4CMyTxp"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ab2baf13d9so1553065a12.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721934021; x=1722538821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Odp82Bt/6lQT9q7XLZznJSSdvglIivq+nF5Svn4ptT0=;
        b=C4CMyTxpBcgEyntsBbmoBMG/Kplyrb9tzhVute+3QiJr8eVy72764SJOFX+0LX/3j/
         VYPKxPriJG+9tiHw/q+u1Kw02d43gsNipkU+XzUUB67NA4fBuB2tEVZ9mLeygjR4ieoK
         NbpONUio0nPZyDvD8iDliSA7hOk+7+Cd6SrEVzGOSkmys1Vd7MK88FysGryotYcL/v8t
         GG1MnfNgJPevm7zhHqeK3sulsPlBw49ZWJgY+8xSqCBhf83z598aQt9yWDOv8jETNfZp
         /UdRBVWeKPW7DciWePfe4w415wGGWLM9mfrasIMhd2iQRACPCG/bcpGoWJymTFXhOAUy
         gK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721934021; x=1722538821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Odp82Bt/6lQT9q7XLZznJSSdvglIivq+nF5Svn4ptT0=;
        b=q5eOPv1yQDlecvUaTMLAAtGbB/ssA8g/W2Yr75LOSGXeG5F+1VTcmyQfk6g2f4fuGt
         O/Wn1i+1t6/ErHMpA6TyFWpeQAVgtAjIKmafG2JSTPbYPnC8Spqc9Xvg4xFfTDhxp7NK
         SRWn9Gjb5qkA5wBeBk8Wia8/OnkMndhxrg1aS8MQUW265PHjn5zMmbeiNxtdnDTl13lG
         qP5Huiw3XlyFm7vk2UFBXjczdnoXCrPmuUWvUKBVLO7caXuiHc5e5cBjnziFWQORyO/y
         QNc2W0CB67c0indb5SJ1w/XVsNxRcIh5gYeRnYuCODJAcOp4vyJDKk/QDkbE5wz6bIHE
         wtgg==
X-Forwarded-Encrypted: i=1; AJvYcCWAzPXIDfZva1EVvp0K4gNv0nZsd9Oflz+/GY89gKPGbJZqbAiQGm+q649c9GzaleADGjwr+rGztu6fo8yLqsAZbEZXVa6OxCeY
X-Gm-Message-State: AOJu0YzctazJTLbwFWThMX14n0KkTPjsS8jn5HgyeBEQkAcy1jd9w+v0
	tuoEWhm24fYr+Z0U1iCY4rdID2XxzsTJYFtJJBZgJqbSpzaC2Dk8RswYqZyZDjTpuHPv7iOPPar
	uVzNFpzkPjx5C7XQvb2+4RWJif/dVQvUtMq4MVQ==
X-Google-Smtp-Source: AGHT+IHDvkKcJD4Ik/iost4JLdfIAMZE785wfXdt7jij5gd0w5caXSBtwl0brqZnk6WI+gW1KzKa1dQRWmFciMLLxGA=
X-Received: by 2002:a17:907:93d6:b0:a72:40b4:c845 with SMTP id
 a640c23a62f3a-a7ac50641dcmr215221666b.51.1721934021027; Thu, 25 Jul 2024
 12:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724183605.4038597-1-jesse@rivosinc.com> <20240724183605.4038597-6-jesse@rivosinc.com>
In-Reply-To: <20240724183605.4038597-6-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 25 Jul 2024 11:59:44 -0700
Message-ID: <CALs-HsuW+p4KsR0GiOT5OpFVNB6CL23hJd2r6qgu2Ff7dhfRLQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 11:36=E2=80=AFAM Jesse Taube <jesse@rivosinc.com> w=
rote:
>
> Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED to allow
> for the addition of RISCV_VECTOR_MISALIGNED in a later patch.
>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
