Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C77B26F291
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 02:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763950373; cv=none; b=FYTI0/KbtWN+0YiWMoD9UHZyM4xoQ1tZtfefMCSyvde0AUIrZClwBrwTlRSYMN4NfRecHc1j5P64gEdVq/Vu2ngF5SSgYmyDkVY5tKwuDAcO9I4v5q7n0dxnlqis4ZpigKwOLhOnxLoIuSvFrTX5sqeYbuRdPijKJUPyCtdLNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763950373; c=relaxed/simple;
	bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sy3jjDi+PZH7ZEAdcFugCIS4NMQomVB5n7EJ8KwiqsIcMa+5VeMedWpo1vKIXrPzNF91RSPdo2idsBShrw6fsFRSUoPSTgsdSyPuRrivX/SPixhCVwrmJGT/Jg4nZ0UhiWymAU3Q/dFqnlayMKhCDRiAkCasv8FDgXNhBe+lCWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpqlGW4Q; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpqlGW4Q"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bd2decde440so379756a12.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 18:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763950371; x=1764555171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
        b=dpqlGW4QkXV5LFYgY3aD7dk1ofkM7/Q1sNjb5+K1sDKF0Pw3kXD+ZPgiprs+/j9bHD
         JuasOU+m6LcaIiEYS1/zFoKqWCvVA/NoFtbgJI2GZHyLCpnyrqS/+8/oJV4H6uVIedoX
         tk8/REzmmRKPi0pT/5uZeIACumLuvKbUO1rQqvcIMO26ZkYuvHGUa+j3b91iGSCoZQDe
         tAbyx0UNk3j4OVynDs3z0xo85T198S4mLGrT7TyDEn4ULLoQCNQ5v93lpWI6AFdGggpZ
         9wRpi/7ja6XfTWdtTJA8Enz4LiDU6x8QvkFko0ypEsnQBPcjTuBToS9Z8VdcurBE1sks
         gyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763950371; x=1764555171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
        b=c4U8akULK8aEvug4RL6Zmd03bvZC+HQCRy7SUKzV3n1eXVS7ZphLUsHlEjGW3tzKWI
         RR23/edp+JTSDzxHEXcWB2/cZRF76YzFo6mq/ukGszFOJIPYMcpBNlZDdSRhCGH2IP7R
         o5QL+zvm0xIi7VtGyUTHIGcUaDclB0YYS2PUIoCXejKnIW2VaafZrGqz6n2wpLp2tzt0
         +cZTksqHK9hkLh3I4Z94us/OReKJotfN3cc7YNKi3+F/PGdMwkT/TGRyj/b4BCzKa/p0
         uKxOl2XqztPYPeAnZcZKlpZNb48G4T0PxrrasBNayE05wj5GzhAf/NB+7PFAAl5XYiaD
         xk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXR73XaLNiFXCuBVLmKo9ykF9Q+rvkriigjr+rvACpn1YtKQOGbjAol736bj4cCoG3+LC+/lfXEfL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaOIWQG+o/hORQEtFYBRIwv0NqCH1gA6EiQ5vDMNoZrKhclRG
	E1F40ghZa7H08nyjbofVYv5EzgNThOSCOkAOrtQeTirOS06XsMBfdnD4+zsUgKvB2N7gF0hInRo
	oy132VPRz+OTbIyLoiVNSHIgsCOnSef8=
X-Gm-Gg: ASbGncuj13TLeS0oI6ynujnclb/WOShSbDQEKA6EMr5S8HYIBH4FIi+GMt2MB02BmvQ
	x2FaatAvWP2i8Q4DGcpsINsfjIs8V/3M7sgSchetMxAEKdzi/HUOb//SVNhwGfKEd4wiDgMEAEb
	4LRgHPzwpyIgcKJ600R0orDkgk4Rly8J2Hs5V/cZzXRbk3lXlbx4uy/IC8fdPmtcZoLfJeVZwy6
	i9rsXtoLwo9kEqgsmXAW0awV80b0UvMAoWY8n5ZEM+WzI6UYxgK0ccQdWiSU5Darrx22S1faQst
	E/OXcqbPHe5F5UbigGrh/66r7jk9J6kFcVa8IsZqWuN0qaMdB1A3omZNZruY5/3VKSG0LpYvkAY
	Ks2KigeAcU0v0XA==
X-Google-Smtp-Source: AGHT+IHMCycU2281yPoFBzJFehZlNjB/ZN9Hjei9e72GKfP8tgd3hQzDk2CQxnkWDDEZel2Cwvh5/pcBmY7xnByerRc=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr5187728eec.2.1763950370685; Sun, 23 Nov 2025
 18:12:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com> <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
 <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
In-Reply-To: <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 03:12:38 +0100
X-Gm-Features: AWmQ_bk9WXKruglIV497fNSKDmodqmzo_KTty7zsHwpLGLPWQoinN8LfqHHSZnM
Message-ID: <CANiq72mZ4uLqSe=WvoCtUR8cEiVpXBg2yB-7oFPf9jyu=QxS6g@mail.gmail.com>
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

On Mon, Nov 24, 2025 at 3:05=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Sorry, I may not have made it clear. I mean all these changes.

Ah, sorry, I missed the "conditions" word by reading too quickly and
misinterpreted it, my bad.

> I had some contributions in rust-lang/rust repo for riscv64 (PR #131955,
> FWIW), and I'd like to be added as a Rust + RISC-V Linux maintainer if
> that's okay for you guys.

I think having people explicitly listed like that would be great (e.g.
in an `... [RUST]` sub-entry to the ARCH one or similar, like we do in
other places), and it is a good way to contribute to Linux. I was
thinking about it for other architectures too. But let's see what
RISC-V maintainers think about it.

Thanks!

Cheers,
Miguel
