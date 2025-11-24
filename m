Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102323EA99
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947284; cv=none; b=UxOo36kRajyT8v3n/JrZzi39MAl135gNsDyuBT8GEBRrOyzRzavyvrHGKeOWIVlwlUS+GaoJRTCg3qhzYUX0seyCMA43iHzAztW+iY9nlBU8WH+nPJ8oI46sfo+L9l2fhu2puY+gY3VdpT3SWS+muE0GWrSTezKtMDxj9DkmkJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947284; c=relaxed/simple;
	bh=KCvg+ikTpFCXv53G51DcHrbuLvPBIVU9eusIF5PQAc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmgcItOW8Zu7DUTvvGRYe4DD9gakXxHYmBMdPwbdUtB1Nm2HvViIX0+n4BLvI5Pl8zF/E3OBMGj+4dPmqD1azbjQOOVLF1rLhW5ViY1LbEADHyY+zWUA6Jghj/exjGiHV3/Pod8iUvjT2/gJ0HfUNAx9jpZEz3bEFgxXR2pt/zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQsADKf9; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQsADKf9"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bc144564e07so101359a12.3
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 17:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947281; x=1764552081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=SQsADKf9IDPus5tv+CY7N9psMWWkUmsEqNFkS0qsvLWBCvGozAOXbuTI67jRVDjCj7
         cEV3prORe+WEzUeeGYGZkRDuKgJqRBDAGrZEAAay9PGrTX/rEzulshsJzOYIN8yMxiG4
         HpmzIFH1Nw2LQBZfF26EUw3uxo10ogQyu9RHIAMPi5rZWY7ktXdm2PnNxy/2g+d8rIlo
         FGShM64CtJsFnw0kp1G+kQFibAQKp+158YR4uVnWpJHHmKsRVC1TEYCBmRm2rYNpoCG3
         i2bufYQZOMUpb0IT+MgrI5gfRdSrvEGqqx01YJSjAcgoFqlTuA+OPutjkxwQp/08Glhx
         k8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947281; x=1764552081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=cvcMe+uULnsKyzrLY/HcaBYlE4ZUSyqI+Fy6ToefaZ6O5s04TZzLjbRBJ1JrmR6kGF
         lhfNlaMtswMxhSAP55iNd7lIXV5zybk5iMmC33V77ni7gIejjEy7E8n8uaYvJwvfx+cz
         UMLw21Fv9+nFiI3uTJ5dGnJn4tLLeJ1Hhk5Z18VTwkuhMvj5I/hDDX1Y3eWvWViIBtOO
         JuG0ZVwsLJK1M5l7/O63/PYfHdK99rBEim9pOjYnI1xYt1kesHnNhbYUVjak0Z2kDbMl
         xatu45G/CvQoxnTYRuuwJ2MnOU6txuiHM3Ow5v0Z/I63WxWuyNJ+Fl9v/3pEZb6XnpKv
         YJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/XR80NPDj9oQazaaOG5Pi9ddMsJFHUQFSoDby2qdWvGP50zqdFEMiZc8ApIJiVgkpNdCkDy3eeC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+IUP3wGURzqRHg/ErDUjCi5mYESfyj5nvFCJwrMvx4rp9CtbL
	X0T/Gj/wnqOJNhl3UsmmZwkKOw+Yz2ziyv4fsIq1/LuZ0KtJmpWwQMqmMGeU8XjVKkV19YOKO0a
	LpVFj/NK95t/5sFFwgjhhKy3sby81p+8=
X-Gm-Gg: ASbGnct9kVg9ZELLUoaAGeKlNHFOPRZ3g7V/sojjIYFU7U3/uYvAqyxvSCrzjWTvsCv
	xoFC2fu5K0drQLzaZMYQDBcCOGCx3QSngKtDG5qoLDHumcB2905Tw8toqXV8GP95643HzArmGLB
	8/RN5w7czTMxwjQO8Am0PrhCn8jdvqzpOCF8VMSmbRd2pscRyelfqwXcu/LX7mcEr6kI9wXoQUY
	OrNgmX8SfC/UKV26+YHKC2WY6sEtxO8OFUR3NO7hWk3oaHnStKBnUvC4gMsMy5R0V8+7q3M7itV
	rpCBpcq6FDEQmoROxYwj5PDLwPWdT3FfzNTa+5hScgJxlI7MA/qhrBpZSMXvXdjFV4u+nRmTd4n
	92ip0sWiAzE7llw==
X-Google-Smtp-Source: AGHT+IF7uCgR8D7JuSAXIkPZpUGPSLX7RZ4rQ8XZiWkfQ1rTA8eM7wEtMX1LZxU2dGsl6gS27smUFSiUHNUF0PYkbLY=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr5716030eec.3.1763947281135; Sun, 23 Nov 2025
 17:21:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:21:08 +0100
X-Gm-Features: AWmQ_bnEyQjjwkSgNtuZsnn9EWb0bwxCuBV5MLpaTWl4ay19-nMkjpn6O6IgwyE
Message-ID: <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
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
> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM.

This should mention what we are doing, i.e. re-enabling the GCC + Rust
support again.

Also, I would recommend avoiding to say "fix" in the title, unless it
is actually a fix, but perhaps the RISC-V maintainers consider it a
fix.

> Add `rust-bindgen-option` conditions for the availability of libclang to
> the RISC-V extension Kconfig symbols that depend on the `cc-option`
> function.

This is now in a different commit, right?

> Update the documentation, GCC + Rust builds for RISC-V are now
> supported.

"are now maintained" may be better to avoid confusing it with the
"Level of Support" in the table.

> Documentation/rust/arch-support.rst |  2 +-
> rust/Makefile                       |  3 ++-
> scripts/Makefile.rust               |  1 +

In any case, for the Rust bits, this seems OK (I didn't test it, though), s=
o:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(By the way, I wouldn't mind if we started adding `MAINTAINERS`
entries on who is maintaining particular architectures for Rust,
especially if there is someone in particular involved with it etc.).

Thanks!

Cheers,
Miguel
