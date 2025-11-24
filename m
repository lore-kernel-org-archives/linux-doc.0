Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7E2652B7
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 03:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763953730; cv=none; b=W1yXwWB0cFjxR/UFclHa+uwX+fE7jL5M31cArRQtmdSKfvwoT42Fx6Fen8Ta0mFJTB1w32JVuA7w7Q8IlSEPaiIsmyPZ1WG4o4JgnzgmFTsmjOGOJxbNMYkDjD0nN4M3VahfiEig3FtRAlWERETVM8efWwHKa6XGSc07d3AB3Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763953730; c=relaxed/simple;
	bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jyet+aqwRft/j1ffdYP9lXAWAM/7gyVydu15a5fH9IjVc5VDsJHzxi0Mboqkls8rFBWGOVlOrVlRTx6Fx7WEEwgKRTCteA+T23Ezq/4lOZS5G2d22Rt1OhXksQ/dsVt+4dCBafz8r8p1cz/bkPaGEEm7uf4DJT8c2MRqv+DNr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/dUzJ7w; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/dUzJ7w"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-295395ceda3so4705685ad.2
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763953728; x=1764558528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
        b=l/dUzJ7whk16BrsKC63vFgN7UijHG/ASwANGpyCQLYjcqRfPerP/OA654U0EyVYiam
         pGCMVUqPUGCkNdCFdpPd6SHSsoBqJZp9PWjRGBYBLHofY4mVs7nZRD4d1BQ0ezC6ZWmg
         ZrXBQVN9VWYQO+XdIoFt03VlovUOPkDOaOVlJhC7AoeflGI4K0SOWL80v3+nIKNDMVKt
         RDOlUqUGIdekrls3EwVHs/bcaRxmMBVHpA7/yAgYaHmdfWRgejL7Y/AxRpvSxbovpGNI
         vtw2uKZwxIONWUY+1ld0TbUEC7R/NxEwTXUcWkxGe4SvOTxBDwm+QoJN99DdVASxcuKD
         iT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763953728; x=1764558528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
        b=MzVC2DH6K0LwHP6rByAbdc46kvISjAOuF6ikDFysuj6Y7AesDG7O702ky1YGSJ82Xr
         LQK7zFsq0hDT+m4bUViX6CfoAqCtpPqJhNhocHNr9exu3Xw1Biy757dx2fu+NeNyVXYb
         SRsNRBZGpPjwWc9wWsnI/XtIk+nf/J0c7b97jL4ZJlVAYLbHNsd6kw0Myssl79uL68r2
         iDT4Jpt7E/dOOnsAIv0lYlnFf+/+JVb8GXNXP54fqEWtDY4mAzCuIONVaSH3U8CJCL4E
         NhcCkvn5LxGj1XaK+hndZW07Z/GWZSIWA894jjJbh+iadARKtiDucoUSrENy10uXX4OE
         rdIw==
X-Forwarded-Encrypted: i=1; AJvYcCWy3FO5s/4JY3TcIRt7Tsb3rK6vDJVhwZ8szvGLApU78772n6ZalzeHhyKaLZoMgvX6ok9BvejdBNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzzdlaqEWRGObq8pog4rTqMa3vvRYPl1/4iQMUL2xlHzxJzkcW
	TCmuZ03g9ohyWnsTmXM7ufLXUESfrgGkEFazO4Pw/Ly8AvOUtYQ4W8lipYt42RqbItRcI12Mm4l
	5dl+FUBnesFHuFrGhQCi6lgo+frc+5n8=
X-Gm-Gg: ASbGncv2XNg3hiVHVaxeu1pwa7FPUX5tHM3mspjTnLhZEvLvC5/DTLbZPtyBghCBwyG
	FAHuBeFPDzHMpyaqDnTM5q7MYHhJI0vHhfZW1GS4GkzJGPWa/hW3u3r3qKKHUIiz+V68+9wFl5r
	nwQc6Cqw1Nhmz0fDiFwhh994urkUh+jxJY6s5sddazj+iZ3sVNwYJFHUNgZIACE5INQSBKuxCCU
	4zydNjh65/pfcKpB+8PmPdzzfcY0j1bhqBNfrbEuHAbn3Cnpgmt4Dw7bfA725kKOXcUQotjHo27
	X0jugI9oKxd8Q2vyI+xC6VseU5d7SczuCyXAwFFaRQBag2z37UCFZUQ04XYw8BlRnjtxS/ttjBD
	80YLTcXOXTJtpAA==
X-Google-Smtp-Source: AGHT+IHODcnccPs9iRgVIOwlcuA2DDRG3ls89WHmZSy8djjz85e63ugOsI0kgj+n0Sr7cHyi8QYJvH0K9Tj0s1pUI8E=
X-Received: by 2002:a05:7300:dc93:b0:2a6:9dbf:bbe1 with SMTP id
 5a478bee46e88-2a719324a83mr5922485eec.3.1763953728292; Sun, 23 Nov 2025
 19:08:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com> <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
 <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
In-Reply-To: <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 04:08:36 +0100
X-Gm-Features: AWmQ_blIu7x6QT0VZIH89GBJq9q0tlaW_UfH33KPy6C0uRHf1k8ZydlwBKRhGvI
Message-ID: <CANiq72nDpBodFh5Zqy2p9jwWyfAiY6KcEEyugHeMDEmOR6Rogw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
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

On Mon, Nov 24, 2025 at 3:42=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> I will separate them into two functions in the next revision,
> `bindgen-option` and `bindgen-backend-option` (or `bindgen-cc-option`?
> Which one do you prefer?).

If we don't need `bindgen-option` (the normal one I mean) so far,
perhaps we should skip it. On the other hand, `rustc-option-yn` is
there and is not used either (it was added for consistency). Up to the
Kbuild team, I guess.

As for the name, no strong preference. `bindgen-backend-option` sounds
good, but `bindgen-cc-option` is more consistent with `cc-option` and
probably easier to understand for people new to `bindgen`, and anyway
the flags we pass there wouldn't make sense if the backend is not a C
compiler.

Thanks!

Cheers,
Miguel
