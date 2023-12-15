Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BA72F854
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lmcpd2DB"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4665da302c6so179967137.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 04:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702644712; x=1703249512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/amUsMdukpvUs/gATYcpXgU/bNaTGRBLojO0rCY2bTM=;
        b=lmcpd2DByEM8q8tflYaFSLtHYzWvmWU9eYz46Oi1mIBLv1rBRpjCVX7vcqUuDym7J1
         aHnlSFyiscrDBPu2YEBEdM375tP8jVN5SGXXEv291rQm7KLMEK2L2MfEOAtrZzRjEzLf
         kPjsVN4XYPD0TKfE9efTkDa85EvuM5jX3nzlAnwl4EcdjpIcLCjMjorK/4i0JYVj7jSF
         kkhPeEGc3nRzOPxvkzW6Z9Etq1GKr0oTqr3dpHHfu4PeDe8ex/3tlW0XNjWHnrX1QFXa
         Jl+qQ8vU4Q55T3TVOc1bWH4f5F3Mz08o5qsyNMn03X/gF4mdpVqoTRjnWmYFxj0OYlco
         j2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702644712; x=1703249512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/amUsMdukpvUs/gATYcpXgU/bNaTGRBLojO0rCY2bTM=;
        b=Mj3ty1CoSx+1sQPDtwDZWb9qQrAUYOIzOewsW7XmBOxhq86jllr9UkT/lS9FRjb8mb
         pnj6JTqMPE90cVe0wAAQCNrinHRvosEyG588iexdEaqkfQ00WEpumqsaeXaepq47a5+Z
         ls88XvHl1DFVr//lQQ7cHx0Ug7zrMlSKacRdmuZpWi4+C/j+XJCajWhXrx+xAqVqozZI
         zYd6pLLF/qxcJzeKRJoMd4U9fADnuvCtV2JFyraWKHfb1jbpKfXwLNZhWDVmZD8oYKpv
         o0+Iln4QeDcC+H7LgdLDkmzokNqMPNHYN2zPSEdxJu7Hx5ZN7yT3/6X+PGfrnuoOeQjn
         PQFA==
X-Gm-Message-State: AOJu0YxDnUttLjckaHq6UgrtUv5SqHRMfrOJ4Tc3asxm81kr0qS0BbBA
	jfB6OQeVlbh+4i2GteYCT34fNnZyrFpE5NBwrkRxBA==
X-Google-Smtp-Source: AGHT+IHO1d4i21i8Ce+aVgKTZYqcdXxdqABuqr+WSle2HNf7ucrVLYhaY40y3LgoCGQ2roFwOXppI9igvBnBX8o2sk4=
X-Received: by 2002:a05:6102:ccf:b0:464:426c:a5c with SMTP id
 g15-20020a0561020ccf00b00464426c0a5cmr11869653vst.18.1702644712467; Fri, 15
 Dec 2023 04:51:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215124751.175191-1-ojeda@kernel.org>
In-Reply-To: <20231215124751.175191-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 15 Dec 2023 13:51:41 +0100
Message-ID: <CAH5fLgjYMpd-NG5D2dh=zH3+RWGtuHZE+6Td7tDE+s7n7qsm4A@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: remove `CC=clang` mentions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 1:48=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Nowadays all architectures except s390 recommend using `LLVM=3D1` instead=
 of
> `CC=3Dclang`, and since commit a3c6bfba4429 ("Documentation/llvm: refresh
> docs") the Kbuild LLVM documentation makes `LLVM=3D1` the way to go:
>
>     We want to encourage the use of ``LLVM=3D1`` rather than just
>     ``CC=3Dclang``. Make that suggestion "above the fold" and "front and
>     center" in our docs.
>
> In particular, that commit removes the examples with `CC=3Dclang`.
>
> Thus do the same in the Rust Quick Start guide, i.e. remove the `CC=3Dcla=
ng`
> mentions, especially since the architectures that have had their Rust
> support upstreamed (or soon to be upstreamed) are all `LLVM=3D1` ones
> anyway. And perhaps by the time Rust is supported for s390 (or new
> architectures), it may have moved to `LLVM=3D1` anyway. Otherwise,
> this can be added back if needed (or perhaps an extra link to
> Documentation/kbuild/llvm.rst).
>
> This should also help avoiding potential confusion around `CC=3Dclang` [1=
].
>
> Link: https://lore.kernel.org/rust-for-linux/6df6e8e5-8d5b-4d3d-91b5-bc0e=
90c424ea@nvidia.com/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
