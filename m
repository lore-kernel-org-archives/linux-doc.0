Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792520558;
	b=sTou2ctrwZ6vNc2x93gbkjDnyuraAkTmms8/wlNoY2mW3ERHaGRV/D6ajEtSWbzu4nqT
	 /+JYvjJ2uPAsYhuNZqssPhmBzo/A3zlBeAfs4+uvY3gDJTgQe22UZroMhEbjk9JNGAAWE
	 AEyTwKESvKGjZVKYwJgyT3BUQKEJAw9UnCDfUVAT/a8/bJSWh2ue5Z1g19obka+rpc1/O
	 CB/sNPC6Fm3ArNalFDdLpR0EMtK/yq6TQjcirt55NFbZ54WazGzbHe3yIqm+yBfAynrUw
	 kerNo20Yiu6XvOXP9fWVWGIniBLGR+t8C5WG49WrTN41YtdrkJTtpgkWGL66dxo1ASA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
	b=ZnrbC+2FJb+JrXn/C3CQlVYVJzQlkFnBdWHIBgon+j6kF3DWQ3anPxigKREf0auFX8YY
	 oyn4FLNaNXTSUMw/6DEySPOK2sZ78sEfLtHlqA1h0UZgXo4oEMqIRPCojSXoEi9+cSIjd
	 ZPbuX6wjhnGnzM27vZu68wSVnMs5p/176tTk31xmO2k9Cz4Im2XgXAtHSanMzie2XlUwU
	 CVMtP7xw8mZbGCrZX65uKj1W3lH4eyxs+poo7yCrFXwsjZ/z3ngv7FLagx3wZADt7zYOi
	 9NRbl0v0ca0Pjb1i3yG3EeYEifJ0nruz/hVtl7TUa1DbpcKs+/IM6pSGJgjj/nrA6qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GfopcClG;
	arc=fail smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B0606A31B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 18:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A60B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GfopcClG
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67583c777abso1159199d50.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 11:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520556; cv=none;
        d=google.com; s=arc-20260327;
        b=W1PyellBMZA8Wv37qlrdTgVYqsqSt590XH2rkQt5Dh5iaCQOh1UyzFEjYhCU3HYgzB
         JiavfjyxHswTgjHwQAFUGIDqflSy1B37sFd5cUXVQ4eEqqSYDMmYDCNOiGzMyw7s5Kyg
         0c4JeRA+o+Jup/qR99R8iwEnBCJfRicp8q5gW+ku6AKTe601U/QGlVaePLSkqFkNXy/k
         suUF0EfgWe25V7B8/Sbb3SPOQcJ5v/OFyWvKc/tmbEdSXPF9izfNCQFW1GVs7fVrTj5q
         san4/frS0kV9wAQ/tqR4+2mLAB8XgdqrLmX+OgMTNYVr040q5fMdhkEhdjmmjzSpO9aV
         GSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        fh=g8M6o40c/41FA6P/cxmOON4Wv9TXgWMMrTEAfLs8HYU=;
        b=A33TVKaI4pqzXHwILxwWTBDlHUYieIGMvQ2LSrCPggjy9BKc/+kgiQf1w0sT6dafjr
         z0Es67YmTbDDrgPFoPV68b+HRHaQiSOltKzpEZWc9MpP/xs79QCHhF1Nc9qb+82zMep7
         gMR8x5KkjxYrNFGbrxb+fYQdYKsRjQYPiDGIUWdMsCn4T7KWBZR8gbmCuEZImTy6R6uj
         6tr2M1Z8krGOwr1gm0Mubh45c9fzO/l+DtGp7ZzswKPyKo4hXEp3N1vENjKTDLl6VBTn
         28Rv0CCf7FEpIp2m3DXiUflpPJsPErbx1PkZVZNk5x5OWN4R4eN+dyt4K0YDP/eqhV7f
         IOJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520556; x=1793125356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=GfopcClGnQ21zl8wkkio/f9euqZdYpNLowViBP+dliJsbgBjHZ/4GkssgkimHqDqDH
         by+GeKn3qf5cgKFl0l25WELKMqmttdHKMDd1OsG8L1+ksxLz4AvMlxx9r56vS5I1O97J
         7+EjZxB0xcW3In1NxS8Q1CKqTW2+lF+2/sEBPxc0jRDS8CazX2/28600kPsuEqLqHuly
         Y4mUj9ShT5LbVxy3fu4NAJZC4ndT86SH1oVUB4Eq820ggMZ+N4DrFA9CXm6BCrEr0Nb/
         E6bQ9YlCQRkhKLK4+svOZv5mDpGIDdKqsD2DuwrxCAO97KRrQQcI60A5DEbDF0R9Asm0
         6MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520556; x=1793125356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=YL0EF+MK0z7p3OladgX5pXc22TTpP+4rlsJ+SDmlctUqDldoTs1ilTAtb+zPPMZP3f
         AofhPCYZfRZ60kK0f4FGGXxakLfY6BnoPZcco47xY1kWyPW+hAuiP2nNFWAVV4Eo6zQz
         ouo6QTDzxM4GOa72xhXEAYRZvGvZGHZeyDdWYf1NSNo8eb/StoIEkxrXKuRXVFo3sam8
         N60i4Xv4SeVVoBXDpU/BVZZnXf8aX1dGXJkP4erygJg91wU3gkl5L9uSJPJZ1i52EMRA
         n0f6FCHUez/9ppWNlNP5HhwsSR1HZctBRXXQpcbuAC/irxQQoBZO9Di31rB11IrJOUkt
         3Pow==
X-Forwarded-Encrypted: i=1; AKwUvBxgC94AgMYdHvoyTo6z9CBAtM0v2XFoZXg+7bSQO233Wyg0L4k52DF8/i9OOvZ9CC7YrL+ySCqHep0=@vger.kernel.org
X-Gm-Message-State: AFq9FYID8u7P2n85SjIb/ygh0Dq2zCMHZI/JKeneLUCMMf8b+j5dz94y
	2xmWc7EJApKFGhfklsLIQhEKe+8fgNj8m4dLvntsO/b4HFJ8TJ9hJtAfxPKk9GD0YdRrr/EJPQx
	EqDvbAMCZeSu93DkknfXQjQJQMS0E2buWuKMYrwX/
X-Gm-Gg: AYBFou11tphw6mRaxdMULFy90soCc294etedX8NJiOBz7jdpkQjmhXh7s61XdemlhV4
	dWuu4hj/LsqkPVGxdSY108HoO8/H/TwXAnHuGx0hztbh7FjLDFnjuxIfrVuZdnaILNSjYu3rFon
	oYZqHTHfisOjIuDK3ryWoFhSP5FLdtA0YThbeJl17Gt1NrdkVQnK/WCuG3H4zJQhs2jd8THF4oI
	cr4OeBshSGob3bRxDjWkmpJMog/Suw+RJmTTi/GeJGXqdKW7P4de4SPTpsBOIfLk4M2FaDDNhGU
	A4r9i8x/6mS54tglYHBJEwsInnV1FeZRPpmJWSBRglNR7pp/IBEYJMR8vaVBIAi++AJluyLmSHe
	QzUHfFY0OdUY=
X-Received: by 2002:a05:690e:1508:b0:675:61ed:ae79 with SMTP id
 956f58d0204a3-67a0e53f3camr15368d50.40.1792520555651; Tue, 20 Oct 2026
 11:22:35 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com> <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
In-Reply-To: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 20:21:56 +0200
X-Gm-Features: AclHuK_xIgQ2EfRpHmzLAMkZfp67LMe6ufygxtV1abJhpWdiWd3lua4TQ51kRJc
Message-ID: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 at 19:09, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Happy to take it - but in the interest of avoiding conflicts, thought
> > it might be better suited for the Rust (or Kbuild trees).
>
> Same -- happy to take it too next cycle, whatever you prefer.

If you think there's a low risk of conflict, I'll take it.

> > Needs some -next time, too.
> >
> > If I don't hear otherwise, I'll pick it up later this week / next week.
>
> Do you mean for this cycle? Linus may not like that, but up to you of cou=
rse.

No, next cycle. I'd pick it up next week, push it to a branch the test
robots see, and then update my -next branch after the current cycle.

Thanks,
-- Marco
