Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1A93B895D
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673396; cv=pass; b=Mg+f7XUaR+8uhuQpDwXZf2WP+IU44TT0NtQqxwYU23IFecuctfHI3+Vqd/PZfRJmCmAklPlihFCReKKG+sAVlk6bMNCubI5oRIZRkRWJSxJFa+TPSc6BsSeFNLAtd96NulXjfWP1NR0xCzXbaY8RmQFWww3qrbdVRhOydpQmZjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673396; c=relaxed/simple;
	bh=HON0Vmc+Uv2m+9L/ARZIecJdRDIMB40cGZIqinKUDVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBPqJ/jtGUElz/u2mhd0CyViFRtjAp4JmZB2OOcQfxe5xc8YoknSCO8UdmmdxbiAlm3r1kaEbcTEuYON6gLWIshtvDzhtkTFq6t6TQcuHSbPiXusuor3swaT/06aoie0XztH5n7ch3PryExqtDtu8cn77i6c8onnea6b4wyg0uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vfjKaH31; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vfjKaH31"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dd7818ac2aso26391917b3.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 08:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780673393; cv=none;
        d=google.com; s=arc-20240605;
        b=gthjkqpSAYV0MXFnGF6TgJpU0nSLAp4T1lwZ0n/CQWqJu553mzwliRzP+kob49xdv/
         Ia4nNxVsAWeqLM1Yx4kvNy0cx2w4wyi8PDUzdeTEAVwZARUNUV1XtcWv65/GcZ9gJRxd
         gDHW+VBlInZH5faeeFvdYsXrJVpraZ2J5zb4gmnQHh+TahGFQ2yWm6BYgrTR/THC6nP/
         KEOwZIYIL5iManT6vkSmmzfPbbIghqKIOhLHu5pOPDX+9IH8UsykvB2x/OYS1HFQgEXa
         epVQTqNcFbQ9MagOxnhRa4f+p5rhgipkXGO6uCX0/wRQes23gYL/48nIiEVdW9GNKNO+
         EUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        fh=3UlvCbEDAOsa4TUxO/EilvbBilpMkKw9OzkToAFNGKQ=;
        b=c7ENaoGezd0iePbl7df5tc5dO/AKSKibbSzROB7VKdKQUqOEqNp5YcG1bt3NE4n+Fe
         lyYJTRzD2CtFB3RDxmiTYhfZjFuZ5JTLjn4ARi9syAO1SrLLmCQFv1j/yNo/wqAE+Z92
         +mdvDpsEEL4kilIEA4nmqI1sjpZ+tp7p6xYVZnsv/3NGTUs8MhVRd8fFUzKU8JqEAtyO
         RN/EQWHM3Ph9MEODTFbwCG/u34VaeHZZaoGa3eBXf6pvXXxqz/ybcve7zjxqD0yOFZDK
         EJq3DokvXBItLIMppkGHvCDaOdD1K9Qd+5Szogfjqt4okPSX/kuFoWN740++PtkCq2Qf
         cHkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780673393; x=1781278193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=vfjKaH31f+6lQ3upr3PyLRn7MmHU83cfe6ChRbWCt6goUMmPn2jl0rIxPRuESMehyx
         JlwTecA2zsdBdZC4wNajqJ5tDdRhJQGdek1KUAkuSSHnGu5wWNW2zv1FfOB0xlenlvV/
         VHn7ZyBcjHa6J95xUq4/ZAtc8sWgBoZ77jSXpA7Pz0m0mi/AmFceYT5SX8KeR4OKbF8i
         ca4ZQHinJp2Df2RyuEkyXaob7WN7ZZYduCGItkdoLSb9PG3FCvNHZhWe0xqF+DjyL434
         KWUAuftviQm5BlqZ+VUauwjVyT3tZBBP5xYBIFkV3yzuE+6AZODAPGchOCzvtd8BH/4r
         jiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673393; x=1781278193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=o3H5vd1QOqKvXNDR+J9dgNGB4VaHwSaCeZDMslijLfF43gwqsUz3OqROm7Ywpgsz0p
         twSxci0/GRAXBm+CSnASlOXFsio92fcuCXGc0bxiy3bqWAsnkA/sus4cFcHiqtzOFKGe
         oBDqbILzdM5sNlEG/10qdvwroz5qLTwjkzJtCxIGJTfKLIjjrci9GGvvzMVkqgLQNKTb
         nLI9/Y5kCEbmp72gR+5lEvQgqkflg/vv16zphp6LazSNFHydncjvKEASLMbdG3/9PXh2
         GQX5tR30SU8Vzb/4s91sn0BM8Lvhwyq965FigxuE8WnjsNlSFXuEvn8WHH4n4oYyanQH
         Kyiw==
X-Forwarded-Encrypted: i=1; AFNElJ+TvTyCmOcJvTEovpCzcNhdwdwaIWS/lzlzhYjzxyJhGxwrRJT3tujuq8IZmlMH/FiTmrq3qrThXPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaDZNkdrgYodw1WNzvbR+b7rfEitk3QcVrsxehTyKTQZe5IOGb
	j2+IOcQiJUyAaVzFsBg2Xbj5u1v2SfRoTCuE6ldfHWK/axTtoPxlN0AIxVm7quZfCcCxrBDf2Xj
	IIhbgDlABv/ScQzf9xsG4A+CCIFZB8Gztu9pZM+xD
X-Gm-Gg: Acq92OGZDaOWMsd+JWXuXtl4YYrPtXZNNciGIKDC3Me4KV8yJL0XHH1v2NglT6VOpSq
	a/JaFkODMIqSzobj/fAh9JAGGSIpGbXJwfpIYxbZIq4TA6fvf8sPUg7sI8roRgZbgpxq0hqH+wR
	0uEiHdHYzI0A2zfzNnnmv5I0oWKi68Rg0x+nPkyTc2mBIFi7SfmsaDX82Fog8A3IP6WynIzjUOd
	qEOcJtiOOAauAmcGRYjk30N3IRjti3h7nJmrCeffjBw26BCDX+61swYTObapGwfaHYWVL+EchoE
	elL35hBoG+/+skROsGCBnjVbWIxLuU4n4v+njd1A2tDvXz7aP8o=
X-Received: by 2002:a05:690e:4848:b0:660:8e61:1a3a with SMTP id
 956f58d0204a3-66106e3f6aamr2683179d50.19.1780673392488; Fri, 05 Jun 2026
 08:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 17:29:12 +0200
X-Gm-Features: AVVi8CexkL34vp_i1CuA85Czs2clQeB-m5POHKFPZIkxmr9X1YgpCn5QeGEQ9Pc
Message-ID: <CAG_fn=WavwJakpE35nc+SC2pdhu7zAtS-NTGuzsnDo=84pX8zQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] kcov: add build system support for dataflow instrumentation
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> scripts/Makefile.kcov, containing:
>   -fsanitize-coverage=3Ddataflow-args,dataflow-ret -g
>   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
>
> scripts/Makefile.lib applies these flags when a module's Makefile sets:
>   KCOV_DATAFLOW_file.o :=3D y   (per-file)
>   KCOV_DATAFLOW :=3D y          (per-directory)
>
> Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> The flags are only applied to kernel objects (same guard as basic KCOV).
>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 7 +++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 78305a84ba9d..101173fe194b 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -2,10 +2,16 @@
>  kcov-flags-y                                   +=3D -fsanitize-coverage=
=3Dtrace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverage=
=3Dtrace-cmp
>
> +# KCOV dataflow: trace function args and return values
> +kcov-dataflow-flags-y :=3D -fsanitize-coverage=3Ddataflow-args,dataflow-=
ret -g

Instead of adding debug info here, consider adding a dependency on
CONFIG_DEBUG_INFO.


>  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> +export CFLAGS_KCOV_DATAFLOW :=3D $(kcov-dataflow-flags-y)
> +export RUSTFLAGS_KCOV_DATAFLOW :=3D -Cpasses=3Dsancov-module -Cllvm-args=
=3D-sanitizer-coverage-level=3D3 -Cllvm-args=3D-sanitizer-coverage-dataflow=
-args -Cllvm-args=3D-sanitizer-coverage-dataflow-ret -Cdebuginfo=3D2

Ditto.
