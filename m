Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CCB2BB1D
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947485; cv=none; b=HL1rtuvt4Q66kJCeA+dBZXyY368KVfPS2VDPX/avHy9sFwQkSC7Vld2Y+FsBl5WrxIuI5uh1hLZ2a9F/NSFxaUqQTPqUvItdS3mV6Lyw/Bi2GUZf2Ehd3hfOWEgmCQByN3W9S8a/KxLLjb+FEAeDT+9F63HgeDgrPrQp3ByZ4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947485; c=relaxed/simple;
	bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVUXl8E+YsoJNNS/7urMEbdxuWl5qmzR8Z7YK7cdbK4mRpMJBZnUOGxXMOUufocdfNo5AmAbKfdEehAdf4Rtdviqja/r1gHcfxvlz8Xo0SibrRfanQPuqg8+zlcuEIsa4pezeoByoK2Qzjd4+U0afphYR2x29orWN1RenDq2buE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nm7BDSRZ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm7BDSRZ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8ba3c8ca1so459938b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 17:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947484; x=1764552284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=Nm7BDSRZdRmYLOHm2fsf27q0XdaiVxNvLCYyMaUHcr5vm/oHvUj8SaAmt+Te1OHsMX
         UDlm0MskGrTf94kJD59rJomz0IotbvAKECv8L84Du6fjioXyKfXC3qbHTBXiLrFKsp9u
         vECIwhg2EhjxVMb17cYGUuKnpY7BnYaluLd/ebCyX12eBhGLYjmR6XfAoyiHi0smiy3f
         /MbhesJV2o5NkUzVX8uBK0vbIcuPZbUndIM+sytRBHpKxSPLE9FCjs68LGCZyRZSED82
         AzQuZI/lhXcUj1IjBBZHKg8Z/dJ47ND1qHwVEqgFrKRuNKLBwRN5p7vfZ9GzSnoO+9gg
         PFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947484; x=1764552284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=WcflGgUZF0TUQc63/IWkgMMqcNXb2Pigz1iV0JDSJY2y28NnUkQvOTcJpu/bKKEDNu
         SlgaGNIhcxziOyC2pZOEceLjZCK9GAti0jGamYvVrzW1zA3v4AAfE5e1QNE4uvfPlSAM
         Jiod46r0yXrhgOGgVidu9TjzhrvydsjACR53aRRDObUxP26dbqfCy4m6R6tiE6jRA6so
         G4X8uaj2HPrPJxRte5C/uMkEjMXizjvFL0+Grbn8DBNN405sPh1W3ZL+0GZPdRNcGu7j
         f8h5DSgBP7kS1gvZXg6s6KXpktEvfXtQ9BJK/qNL8yDb3e9NvYdmOU16me7at0BBvQZ4
         uB4w==
X-Forwarded-Encrypted: i=1; AJvYcCVSo51tomzQTJ9MM9E3+1tEJ7n6EuI6oSfPvvzom0IY4As9tvgpw+WHzEiOn+hl/tJdZ6IGpjOBcbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgDnrb29y0WWo0gpaBRlivSjbepWrEeEyWxL5ocxXWsbv+O09i
	HhIMaPTEGqKINJL3wi+tJe+F9MmZCpuUX1accDBCa+556jk3V/xoXTxrV6X8ewzQUwQTg2TV72A
	6GyvfrXnZ72HNvcvsv7NRRf0l1wocnyE=
X-Gm-Gg: ASbGncsvkMyYlurTvdLxTE2kFPwNwZMuW3zZdVAB6N1T/ntxd8LPtkCt/r2qGifpMxS
	KSJRh4RhnDvRBp3T9AIKzxbwSoXGadRTlTBHIjCSAU/QbAp0N4VKfVu8NcgmkbMG9XT1EBBWDyo
	D9v7CCvjXf6EShzLeIM6KvaVoj9H5zEvxfuywNs9ev/G16oKKLE24e5fU2e74YSrMlTXrNbivCs
	Ip5PQQ7vkzZLQr31RmioMRKG6xI2NMCklxiFJLzPj0gE6W4pjzdP5SNWm3OqqGsoH5Lc8lH9bbr
	uVpYEXJORwkBxZuQbXB7u851ZT/Gyu5gBOOh98cY4SUo2bOceBJvImBoUHrjeRCdKwQH6llKK4J
	NgneImmASqUmImA==
X-Google-Smtp-Source: AGHT+IE/FDIBNqUZA/G/+nKiTfBaSa9copxgf7FlXf8Svbk+fth/f6d611m28X3uKTN8JNKPOU1LrwubVCZnNZk0CiM=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr5377066eec.2.1763947483691; Sun, 23 Nov 2025
 17:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:24:31 +0100
X-Gm-Features: AWmQ_blKJN1cEm5aJqBoq0agAeCfqxj6IncPPqpzjooJxt-eYO2MrWfk7cdiYl0
Message-ID: <CANiq72mJqN09FvfjDeo+WBN=Pht74iidRxoU_JcMfXV6oMmKEg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] rust: generate a fatal error if BINDGEN_TARGET is undefined
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Generate a friendly fatal error if the target triplet is undefined for
> bindgen, rather than having the compiler generate obscure error messages
> during the build stage.

I normally suggest putting in the log the errors in case someone
searches for them and for future reference etc.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
