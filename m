Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2359926F291
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948441; cv=none; b=qHybEWW6xREIbek3g2qQ4kxIb8DKfOTh0dN00zNF2m2pkThqJoyDnLkbiTdY4PBsG7AaI6oiiCdidLZHph47ultrCeczIGTL3vu/dlbaYu7IBe9kBmVVJjRj+ejcJYs9//xTiJ9iYqK1QFeLi77lBOZzt+YU/yHrmPyH2O0ipC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948441; c=relaxed/simple;
	bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a//Mh3RNu5K3HzGmRVyYR+7SqSObWDpRraPzlzawjOfpAI0wCj/4O4pN0fmBFlbElzntcrSOdp6k1bU0bjQ1k8tPg8KLBTFfN1vczXU69PAls6SFcXtlnqqsQKxHmaAFN88gOtJW1r34RPwycggz7bj/cWosFG4S0rFOIcsJoVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4FB6Eei; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4FB6Eei"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b657f6e24so2771111fa.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 17:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948437; x=1764553237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
        b=c4FB6EeiRcJocy50zADrvefTKU2yjAAKGusSw+vkWV7tns0+nDv0ml+MQV5vynJWqE
         5rMrjpdDDmRbQ71uu49cUh+7kPMYOPUNEOuvWVKjFJdD8xKGjjmGKvpo+aa7aFUpP9RT
         jdbRwIkdSl0cYlgBha6HwSQYxwvmPeihnjz0pJtR3XkwtGQxscwvPTgmAHacj8e2pXRp
         64DFglXObh0+14WpeSrpWV1faKjBs+LEaRo5pBUWdL3mZ6efIvQ/5rVe+6RenL1LbgDj
         K801tGvDasDp/sPSiKzJxVN7otQTEiVD6Eo6aeW0jZUQeM7DDCeLUZ7YQy1a1TxWisln
         tIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948437; x=1764553237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
        b=WcYR7R8dDv+edzfIAWlJet0tPdhQqILt7o/gzdfr/ZE6r0leb3VVhg8kc8gR3uQfOJ
         lbSs5dj83XPkHycn4mW9QcQhRFlEPTr2njjUFDxrMF/tOFWfTuf5Exlr+JebF+Ptpdp1
         as64XetvRhHn+tpndpqAmJsMOWFX2shA3M8zCUU7IHhOPBSOsc7MlgmaY3LDA4Ql5jVo
         oIZqtws57/x8n2d/1XA8GKKlDLbFvwoEJxK+fnndPJZt6Pzcf3niM/pKm6hCrJp+BBXO
         fTmqkrel1J/mWP/B2nQcD+Rbr4+mMKSyiTC+F+MJzsowNnKxDk/fpj9kmj0Gu/BekvIH
         Hl6g==
X-Forwarded-Encrypted: i=1; AJvYcCVSBnaZ1SX7QlEyeiyzPoA8q1/ca6b13g5Z+aU6+7N1wYXqc56kFC4EcFlv3i8EWxJuh9iVrPxB8q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1XBnmfPBO6FsjDZPrWfBX9ULRh9PKZfyM542OspaDy85e7ih
	dxhgsMahecooTtlPI3VWRUGkpFRT97daSvo0DIRElr/hmMKoJJBKJKgbPhewnXp/l9MhkPi/tHZ
	KwLOGXyPMN7/CBk+7cULZTk8+TLhLuzw=
X-Gm-Gg: ASbGncv1JTlPKA5/tWGwpsAq+D1zYZSoHAre472nCAHNwulwC5BUdZw2hbzyyxCscfm
	GLM8u9BBK8A3WhSgheLereualELUSBZ8PHMxIj5xH5pox/Dz2rJGbbsbTZXyn86801qcAorWSY0
	jUUa1/iNLqkI5F4jFS3QoKW8w8SfuKlyL2o7cKnR+vyF/vdgaihRFPPIp6yVJov4A5FckC6qRBr
	/KIdu4udztGRd2oCf2gzLoaPkJdRVgWnZ3/MQrDQLjMRxr1E2hVdC5ZZkY3kk3dBL3nxK4mwlbt
	buy2IwxdklAojpXW6wf00QAHWbbhRHGgnLrntlG8UFzyNb6MkVAA68aTEzsYQLXWHmojLrshFPz
	OnFy5uEv6IN/3+w==
X-Google-Smtp-Source: AGHT+IGJ0/QqoFdh3XscVl74AmQLSg+MmbSCdBIAO+xihAcbKpwhdVEc+6URPzsvr/D4O5MVqOIaGXgotk7kl+mskSI=
X-Received: by 2002:a05:6512:4028:b0:594:33db:2836 with SMTP id
 2adb3069b0e04-596a52f41famr1664493e87.6.1763948436852; Sun, 23 Nov 2025
 17:40:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:40:22 +0100
X-Gm-Features: AWmQ_bkux8gOmOA5I7Y1blTc1OP02EBuH81WNeWf8pohbW3LHlgv9oWzHxyvbW4
Message-ID: <CANiq72=QFL9-b7P0UBFT9VCCOQ9BKS4WUR0Q7wWioG7nAijr9w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: export BINDGEN_TARGET from a separate Makefile
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
> A subsequent commit will add a new function `rust-bindgen-option` to
> `scripts/Kconfig.include`. The bindgen backend requires the `--target`
> option for cross compiling, but variable `BINDGEN_TARGET` in
> `rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Please end with another paragraph saying what the commit does, e.g.
"Thus move the variable to a new `Makefile` that can then be imported
from the main `Makefile`" or similar.

Also, I am not sure if this should be called `Makefile.bindgen`, but I
guess it is fine as it is -- with the current name, the new file
should be covered by the `F: scripts/*rust*` rule in `MAINTAINERS`
already, so this looks OK, but please double-check it is the case.

Finally, is it possible to put this under `need-compiler` like
`Makefile.compiler`? I don't think we need to evaluate those options
for things like `make help`, but perhaps I am missing something.
Please see commit 805b2e1d427a ("kbuild: include Makefile.compiler
only when compiler is needed").

Thanks!

Cheers,
Miguel
