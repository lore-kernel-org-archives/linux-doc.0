Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326EE3F326A
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815900; cv=pass; b=dCusMb6RAD8PqO8PIcMH8hb/cB4ArN4HW4rmTvdBysjmFZrMLJidzh5Sfs8vumR1MT9at8Tq8RGUok5CHdFGcC4pq6WH249CGReBlbKzE3uKi4ZhmIiYzViP8I+rgikclOiRMeFRdOTnT0a45YfvZ5fZtyauQVTsycsReP5YZ4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815900; c=relaxed/simple;
	bh=Jxmt9KjzM1tHZnS+/rDQVag7Gv7qwGz5Mz0R33A9/8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSJ/X9hoN+2/5KnvKjL014amcX097tIgCFhpfIb/j/ot+OAx/UTDRCdBYdmJnXjlGQouzX4s9k9SbyENJlQrRBE3Eq/Q2R3+KGEm2ysj7veSa5VSVwwhIQqm32kI50mYoY6YGscHO0JL6ozOfvudv7YOHVxCBabDzfLx4s9PAz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kxrpma0y; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kxrpma0y"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67921b515a7so1500669d50.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 07:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791815897; cv=none;
        d=google.com; s=arc-20260327;
        b=fnewG19g6HRXagfAh5LruCWaLXeDmD71mXsWpDXKX5vv462b8JTIRxjS5yUQpyw2ZW
         6QRmyU8BdFHynJIb1omQWVdfc5t5t1MtBePWzLnon7as4DIlkuWkS3vS1vNBAy7DVnrb
         UwK+qa5iHLWT+mYWCPZ9KA/tIuo2cbPRx5IJmzt9ey08/g+yrP/QwOueJF6sfD7usWFG
         jjEMBz2TyY7rPPboEOFbJn0E1uUvU0K+SQYMZcOshOZk7WU0AuUl5yOvghzkoYYpME6K
         lFfNBe+ZMaqQj06elO27aogUz6UQM+Ek/J1S0ecRGayQYB6qV999OCdkYv9dNCF/N8OU
         PCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        fh=+/xFGkWd7ye06kT4Lt1UBuvMKXp9f9CS9+5N2Y/G9Zg=;
        b=FlpDwr+rGUv1hTIHcsngkcf+zbX0xD4+iTOEtV9u6vxlMV+3K1hTCsB4NQfwuNfrQh
         FhUszqOrnbjHc8sWyu4+523P06qiYQ5XtN8Sn0PQ06BD7anHiqO4RJycNL7yyXYhUNK5
         rLsa1qx42q2/rQllPQ59LuT0yj1p51NTk24AoWRjg5WnygqS2KSMPvryZqjk8IMULlcz
         mn2xgpx5BUbKoAXYZc5swkV8fXiEdgZ62Z1fy/Nk5pgNJtm3fslTMXSNSMM+KI5HY0qG
         TD7QUY6ElHFrQQiipqGrDyRCHE3VaJAfPN9ycWQjktdgrCtqrbtAY88nPQ4SNUEq7TGy
         gCoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791815897; x=1792420697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        b=Kxrpma0ytHecy0j5OkVrxYU5EsioaK09WTFxrdXEB8XsG0QPh+WCko42bmjYIOAXY4
         E1ftWSpb/s9R3nYuo+xGXQ4juk2uUzhUp+XSIpVyzH6vRZ0ZJAbrSVtUxpPT3FF8ZRHv
         stbcOZ2BhbahADsQN4w0uqUkBStfhtKAfYNVA9L+4KB2+0SRNdVvsdB5rIB+ahRp+RX1
         jeH+ssxIWCVyIaAbfBq4fCY3AdvqYktfc//n5i4Zidpe6IDyI1qmqdkYDodVONalrkAh
         qeFlhbXX3y6VO34YHcKFh+5RpZZ8VbKsjA93SafOQnfnC9/QaTdGv6QMbtCqqgBa8ExL
         YHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815897; x=1792420697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        b=II0475cIU8NlacmJiMe9Krzp+uGeEfowkRGISHevraEzbNCfDDoDSJ7J+id1y+MOHd
         Sjt/c1b2E8/oYyDOsF6ije29BqJi0EJuMjvD7bn1dMCuG1QCBe9W+BnTtdHKUwmVRqNO
         ZnQJW8EKh8TRJKcVQGOaYSdkguLf4tjf36hEWn8+r/an7QIGwZd2GbwNmbYAbXdP6vb4
         pALEBJQ7c13P/2LFojW8SMWcgXPDfAc325N+WEnPgncuuKJBVxp9xZbW21ouzjOXMC7A
         mrwPeeGvEnTLyWewVlU43gc+r79NEWoLWUUnrGl7GhtOvGoi0A1RNSPr5tUv/rEQ+z4M
         4jdw==
X-Forwarded-Encrypted: i=1; AKwUvBwsJgjVzUmand0fDIu5EmQbIqlHxdBMNTsjPZTwUFFsKgwdf3PUrUlw4NBXlsrjbbv1SaArO3nlpZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPbIkORMYt2bs4XRHFGCmO7UC8S23oIAnYrn4HTKVsdD5vVzBJ
	6IQ9ITp7Aq24+ZkcOkT5YxssSY16gNlGw9zOsOidglcmabDHQOoW3hTtosNKUSgADkxW/QerCET
	EJ0It018RaIyE49VRQ/AH3lbnxPRBovAq8mxkujc7
X-Gm-Gg: AYBFou2TqEAYKI6GTfPBDEap+zCYjeULWogpy3TheMf2/nK8aSwv6OnLXWsqGsiuqRR
	a5Ck900b6UFxZoSMLklD9LOPFon1HtYPcRqBU0O7TOXLODznyg+QPE1QF/peqGvRD529t6hCodC
	W+EAog+3uHGQLL3Bk2/ymzYE5nfBy2uI5HCQEPQGypdRlFgVas9nw2RvAO1l6Cc+Uc+TLd3Hc6E
	iIaJYDLqQrTqTdGOTav/gM4r40LZUeecROdV2ZsmCKSoM68hpUMn2oDhQDM2GGWgRuf3PfHm5tW
	2JYZHAZzdpHWtOV/GW+iEALRbdxDqkftLeh/cClHbe1VWTbyZ6poA8QzayRSPSrpsSdtrdrpNQV
	lf148xMecOw==
X-Received: by 2002:a05:690e:4852:20b0:677:ae5f:927f with SMTP id
 956f58d0204a3-6793630f86cmr2427106d50.106.1791815896536; Mon, 12 Oct 2026
 07:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
In-Reply-To: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 16:37:39 +0200
X-Gm-Features: AclHuK92MyXxJeDrxPQQFA26o80Qq00iYKL0aWA4ivRbmQNLUfwOPJLz7iq1CKA
Message-ID: <CANpmjNPRtT6PLf6qAiuEaX4hG1GBYD-=w1A4y_-i8vSv0e7Q-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Mon, 12 Oct 2026 at 16:18, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wr=
ote:
> >
> > +Rust code is instrumented as well on architectures whose Rust target s=
upports
> > +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).
>
> Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
> places, although it is convenient to know in the docs (but risks
> getting out of date, of course).

I think any future patch that enables more architectures, can also
update the docs. We have historically maintained the set of supported
compilers + architectures (if that set was still small) in the
sanitizer docs. Once that set grows large enough, we can omit.

> > +  Note that ``rustc`` rejects linking crates built with and without KC=
SAN
> > +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>=
.o``
> > +  cannot currently be used for Rust code.
>
> Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
> the patch (and in fact I don't know if we would like to actually
> support it even if it works), but perhaps in the future we can relax
> it using that.

If rustc's sanitizer instrumentation is similar to clang's, and rustc
doesn't introduce other ABI divergence due to sanitizers, then it
should work. Same with KASAN + Rust, so this would need to be a
general Rust + sanitizers decision.

The only exception is KMSAN (which I think is not yet enabled for
Rust), which does affect ABI.

> (If it doesn't work for some reason, and we want it, then we can ask
> upstream for an "escape hatch" as we usually do, since things like
> this should normally have one...)
>
> > +# The minimum supported rustc's LLVM supports all of these options.
>
> Just to double-check: does this refer to the LLVM version of the
> upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
> support in that minimum `rustc` version (LLVM 18 major)?
>
> I think all the options exist for a long time, so it doesn't matter,
> but just to confirm...

Whichever minimum we could ever see the kernel compiled with, which
looks like LLVM 18 in some custom setups? But yeah, all we need is at
least LLVM 12...

> In any case, this sounds all reasonable:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!
