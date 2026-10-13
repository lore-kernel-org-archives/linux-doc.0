Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FCA2BD09
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884209; cv=pass; b=uAuF/ggp1BtImVWulSF2tHvDWv2HP2AF84ADslVtFEQul60cmYnfU+7MjfC95N0JFa9cs5p+Zet/hK+2XGQCTDWDCCSFq31j1upw6L6uYH3ILa72gRsmOIl6bP/9+b3mw3LDNcJuaI3MDGxp2SJ5oXpaGlO5BFTJhPPotiNxUAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884209; c=relaxed/simple;
	bh=I2RdC5E/xdt6kf39B4bXuZ6oTCgSZu3FzLdqV73aXEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHlqQjdtHsJfckNX3FWAF4/Y9GqWCE/RZ5FS8kLHgN+QmZAtVNzETQ9pWD8g8UcwIy3fgX2pXSJVtaFd4KORmU8E5WUpve2ZY5L5NtQYdPiOGvQDTaq5IRAE0q/zJt/2vN4IcjL9/HMXydfwYTyVmE8tsJ3LwWz7ofzgZsNw8bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jkmEkFH+; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jkmEkFH+"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-141395927feso4948241c88.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 02:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791884206; cv=none;
        d=google.com; s=arc-20260327;
        b=cewtNOhVKgmjixAGL5UMLYxG7SVIi68JlqOwMQJCP05Y/wNsrt5z6+oqIBuoUTtKod
         EKjW6cHelLdIY5ZKlgy+SyMGiMaIseGsC3Qtkm7txQ4p6THbG+SBGflAWNbOHnwcCIbs
         BgfnNBh64aO1C0lezoSGllGPaUlkarVgyYfw71T8gacomrqyjq+9+94J5XxFGmF0BADC
         K3NzT4Kh/Gh/4lENMxJJ6Ua6YewN6enWX+iJfY96JlZmOTKvgi82QlelCSvGd3e2kRZS
         wvbZGWLdn740z/YEjmj4JjcCOK8P4JqB3c2Z7bQ88nkjz3yWMvimQV0cc8yS1T1yBl4h
         N1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        fh=/BiCW6iDw8GTxi0D/NHJbq4sVyVz6grDxb1khDLEVp0=;
        b=r7ENNGYekZSDkRjMMfxxuheA4ELJbkTOGjbGQL6VMy0jqnYQ2EA8CP4TOYD7KQ8Q9r
         7epPE/B3SVOc95PKFoIQhITOurSjEEVAydZrWH3SLJg42Rp9Qt4wOHcyJqpJmLygQ5+0
         PwMnnbztMadO9gXoNdmnPUtMvUiUQs7QXGDjMiJvVcRMhO2sjB0jzEYRe/S6+V+5wOQ2
         Bp0KD9A1mE1FaGMfnTi6ClXmKlpJiiH8N+8vzR7Z41fWXvwmP+pm6wFXZNKiAfz/GF4J
         vpZk9BdC4lqUZdpPbS4FKGBSZH2cknakoH5crrH7ixNqDUV845OfposzNg/4yoY1SfzN
         dl1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791884206; x=1792489006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        b=jkmEkFH+T3MyeQjhmros28hqe0uiimDW20NShlJw9F/0Tlf/TWlx8270B9ZUpH+S4Y
         fdviQ4G9wAntYM0lOgf3UxP/AXBy31A8ktqu/2Nva+3mMtKUONhwzthwXfZptuaoP7oc
         Reo3vqOs6hGfaL3/qnHWDXL3/lj2hlEQ6s8oHgExR7tE2moOSR5rgy2ZdTvCrjJZ5OEL
         qcYvIm5svJ6VmU7G1LQ8hC6vzkoGYwi5hjF6H2H579WDijm9QqQuTpV9wKXkJBY1lbPv
         pKrq6zvIfgGajbsCLnbmKB/zINRFK84+fqjGUGVdVu36KV64qYGysfKSS0+fDbbQKCEh
         TxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884206; x=1792489006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        b=eYedvRN/Rw+9q7b8glIp1C2SyG1TfrAqvF5Z85oq7oYUaFnXnrXiQcZ4mz+GDat+2Z
         Qtv1hvayumQzKkmaZxvuOYGwx5Gq3RDwraWzFz1VXGcGfEinVXXuBfkHyJcp6VOW/m+S
         zHWaaJIpgdhUMtX/RmE173+lzUJ0ANz3yovV5wd7dXPPZBQSsKeFRNUL7YmfHvXjL/52
         1Peb3GHPeHwwXHNT1/X+fV5wZJV13ECw7K+Tf7ecfUnkPclArMixn7uioW1YMTXo2b63
         mv1AxvuRfWp43ZMFDI/oYFZE6WsS7tfgWUq5oaw5pu3m8mpLsB6xDc24OCWf8xoC3POa
         5pgg==
X-Forwarded-Encrypted: i=1; AKwUvBzN5smboZ08Rt2cWCvAQPAKjKWO/MF7JCpz2vc6o/q0wkeDjRKnzm9VSSwm7LAvQ2DcOYO6a5v2PNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJobsjcg0kGsXH6u9ibiS21tllQmorCAvoIz0AK2dEhe6Cb8aeR
	wY+F45N6D8fcOhrMoBcJwh0irIhNpZBZI7V6X16rnW96vQsywQ9yyiGP9D6c0nvR8aNimve13m6
	Cv9NEEUzM1d62jJwWdaq9RuFMAlNmxjkXN7BY+Y8V
X-Gm-Gg: AYBFou3IcVPLYBJvT7qg1IlW2jRm2+E02WSUpTRE6RaKbpIrVW3V4re2t1AoZQR2Hvq
	xp6PUCgDQUmqmV91HyEB5BYuvNedmSlmRSeBj8xkWE6yI6sDgLQGFzKnYt1a1SVBQvoGnEpce+Z
	G/Zoalo25o8wmBm72CcGIQJzR9yOFEdPc308SUIc7rp55YMwMfdBNQ+OQ5MXq4jK1Mf+CvxNf9E
	D09MiGGPtU7aQDWaHePdWMWqnUHi/5gvPy4+U3b4XI9s9C/lCqlcYdkzXihMjKv95Cdljcm7MY+
	x+0yVczSHZzeHjyklHENH823Gjzymao9nsPC98P/vxbK9whtgUcD5nzqEqsbgIwgKwIMboU5oDX
	DIK/qlm8pPQ==
X-Received: by 2002:a05:701b:260c:b0:14e:8d1:1012 with SMTP id
 a92af1059eb24-16a5eb5248bmr15061808c88.19.1791884204773; Tue, 13 Oct 2026
 02:36:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 13 Oct 2026 11:36:07 +0200
X-Gm-Features: AclHuK_Q4zmkgXJ_aRet6tsAebmNwBt0xYiVjRfJ2laZogHRXSQmQgE1FE155EE
Message-ID: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> +ifdef CONFIG_HAVE_KCSAN_RUSTC
> +# The minimum supported rustc's LLVM supports all of these options.
> +rustc-param =3D -Cllvm-args=3D-$(1)
> +kcsan-rustflags :=3D -Zsanitizer=3Dthread \
> +       $(call rustc-param,tsan-compound-read-before-write=3D1) \
> +       $(call rustc-param,tsan-distinguish-volatile=3D1)

Do we also need -fno-optimize-sibling-calls here?


> +ifndef CONFIG_KCSAN_WEAK_MEMORY
> +kcsan-rustflags +=3D $(call rustc-param,tsan-instrument-func-entry-exit=
=3D0)
> +endif
> +endif
> +
> +export RUSTFLAGS_KCSAN :=3D $(kcsan-rustflags)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0a4fdd8bd975..78f1c23e54be 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -98,6 +98,9 @@ ifeq ($(CONFIG_KCSAN),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>         $(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-ob=
ject)), \
>         $(CFLAGS_KCSAN))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +       $(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-ob=
ject)), \
> +       $(RUSTFLAGS_KCSAN))
>  # Some uninstrumented files provide implied barriers required to avoid f=
alse
>  # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation o=
nly.
>  _c_flags +=3D $(if $(patsubst n%,, \
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index 7687b0dd5474..4b02bffa6b46 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -231,7 +231,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> -        ts.push("supported-sanitizers", ["kcfi", "kernel-address"]);
> +        ts.push("supported-sanitizers", ["kcfi", "kernel-address", "thre=
ad"]);
>          if cfg.rustc_version_atleast(1, 91, 0) {
>              ts.push("target-pointer-width", 64);
>          } else {
> --
> 2.56.0.385.gd3acb90ef8-goog
>


--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
