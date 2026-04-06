Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BCC257843
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 19:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502110; cv=pass; b=S4mmFGXBvVHlMdA/CfRIGFnD8XFOYcED4puJ6QFI3eMaackOkwWrKgYWEJkzq+0L5VfOnHnd9nzeGd4rs+Zu3FTMRVXpbB820xC1grlsQIg0tCoZnaq8QuVADCy7qsje2Ndb6IN0PNV/+2eDE5n1CEjfqBoBUXII+/HZ5awFJeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502110; c=relaxed/simple;
	bh=WRVPBP1r3UEupcj81ppPFlfizIU+h6eu8Pvb+T1BfIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsRG9egQvZ1SbIoIj8RUL1WB0yvy51LKnVf8YtIm/2wbdiUkynNlqiB2DA76b9hTe3NRhXm5eHrOyaJLDM+ysx9pdSXtHycAq4ob2ZffHO7Irj9qospbnDo4E28Or8S/NaI6ggKS5wvYakHZO7guQT21laDvenucHnpqPJI2mMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn7sFvfz; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn7sFvfz"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c6f5574d07so188644eec.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 12:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502108; cv=none;
        d=google.com; s=arc-20240605;
        b=KxdS9iVDE8q/8Wj/nXAdVgdvhOriCEvR7D0KoQQ8I1KCe/kSdYuE9n1RYOWfJ47oue
         CBP89NADTlmgosGjmGUv0dMHJVeqel78e4uG5u3jw9pVlj6g5+fj7KYgNgMe8zshbySf
         6IuA9zbCLWfQ2pUqAjnAKkI6Ad9VPyjd7I+Zds/aab+f265vlgRLVE9PSRwTgLfiDM1k
         IUvr/rBPCdNUlaXPmObk+A2aDxDyFXBdqn9K1rEQsarFredqwtYAauDzeRBoDFCE4oTr
         Encv4jl7S1RRGbmzCjnSbfBQ/ilnXAe/Bb9847u5XAVzPXckBMkQu54YBabOF3RxZ5SG
         JeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        fh=AeGOtoleJqqnBDJHF5HBGB1rTom/F02v7G0agng43kk=;
        b=CHpvftc/VjEmvgE+Ru4wkeMu+XAkvU8mZWTatp7E7SljYKSGbo7mhmHH+qaAOHze0b
         lcosNe305NjOI0lUQ2fgPzj7iHgJ/P5aMDWzMVqvjFQ2I1V0NTaFA3cN/Q/a1Qyuie2X
         odx14cX9G5sFBjLKdyCG5mW5fqgnQAgZGrt+6OgmjvzolmXmMzajAkunhV6mUrs1basr
         mLH/Kz7qOtP3aR3/jfVy2wc2RfRhpyqFe91J6relxh77xln++1P3tVzbCfIqS2VYspkA
         ZwsgxvMC/Y/XQ5P6MtdIUn4SQQg5CksthgGYKseGLeES307ZKM5HgFU454TGalRyEjPU
         9VEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502108; x=1776106908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=Xn7sFvfzRt9G0FrCZPuRREVKeZOHqh/la5bppkaKs8mMh4RHCWrQNCcSCneN+bMK5W
         1Y/dTLBK8jVnry4fmyC6KTYSpgc/2nf0BaC/v1XafHg3IqhVICMt5dA6Bgy6J9hNN5el
         xKLZxlGoENIhb9GcLr1vkwEszZrHpge/OVzkiMhoB/2H24BFDaQ8OA/MooOP/S6tc0uA
         HwvkyesOG4D1To9WLTTQnWG+ixbv8ZGY9bYJU4sS3VHu24coyiphoELx1MtMKsppQzV5
         IDD9W7su2vaUf4wW4+NTW0vk42O5er7xMJR7a+4MWeoefRbQDYGiIN023PdpUsVkgia3
         LTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502108; x=1776106908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=hYvppTXhVIP+KeTsPPO/fRKoploZa02/SvQEe7R+7+fKuA8JnJkPAwFtaLZrz2Tbyn
         IRWY3YWBhRZpuKpbuYXjreLdY+IlRigweZBj0Rm9Qq0f8/3VsWr12A/K3iNZMElPkyo0
         VG3FWZrP+GGG3ECWL2SBaMY7A5PRZcSBdjVdSo81+714RhAgh9XhmpZSMgAWp0/Ccxpf
         LAa+puRd5symfYrdaXJAOSj1M0nGv2hN4jYu5QRbpZlG1NPqpeEwHjIwjwnObsHKKBKG
         SGNQQpAxyJk8f72LVcSVtgp+qZoadYEuE7OGmvYThRQLAIXBNsW/aRdKnDyx+FO7Lln3
         sW2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU67IiiGUqUx4OeJXkckfJoZhLGRIIidybfqTWISDhO28iuiKOXvG0TzZDnaI8BjT7uRY+x3ZnqL+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YySg/NtZXWuYTowIsRJLmEMGmkp3CtQR1I2J5mq2aQo9Sz6Jzqx
	GJ+KQmcfgXchxQPhJGdJvpZ0Td6vc9zRGbrVFzQx0YEGD+2uVyinHniau53IzlqDL8MpJ4OubS7
	+z72eHkIPn3EM65rYxjPz3YK+bimXAvA=
X-Gm-Gg: AeBDievXCbCnJCl2ZQ1iIULODUiCXWT1/NP3/b53mo59Rq0n2dsmw4E/ewe0Oeg92tH
	jb3FjiWWjG234vR6e6yWp6uXqvVwT7cBDKuEoYW6o2gKks6KezjeE9Tjb1c9cjZ1bFFNvIJHSy4
	ZtZEXwt03eMMEBGStRrgWHPqVYpscJ7gm/OByuMyb9ikxksz27gcqPOGc8iK0SGmH0//Yl86X/V
	rGyXRPH0Aox8m1Uv62ScTHAUMj04Igdh2PNIj77zq/l3xqtBBcCFZVM56UuCQ4IuR/MdqbgrOdf
	OdeZ1GNigWL2fF75vhU4T1lWHqhCMiIVT74SvjwH0z2U9EOCBAmMejytHYcyUwrR8EpbA+5FBJQ
	WjP5wSOEt1fHWZmoMZ8caMbk=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2949463eec.4.1775502107727; Mon, 06 Apr 2026
 12:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
In-Reply-To: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 21:01:35 +0200
X-Gm-Features: AQROBzAfx15_qleB1FpEnqVT3LDjlhAucDNDkuNXvaEMC2J19jPyg217OqF9cWw
Message-ID: <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 8:51=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Looks good from the perspective of this patchset. I am seeing
> one remaining problem that we previously came up with a fix for,
> so I expect that that fix is staged in another branch. But in
> case it's not, here is the report:
>
> On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
> ("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):
>
>   CLIPPY [M] drivers/gpu/drm/nova/nova.o
> warning: consider removing unnecessary double parentheses
>     --> rust/doctests_kernel_generated.rs:4240:14
>      |
> 4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), poli=
cy.cur()));
>      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      |
>      =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#double_parens
>      =3D note: `-W clippy::double-parens` implied by `-W clippy::all`
>      =3D help: to override `-W clippy::all` add `#[allow(clippy::double_p=
arens)]`
>
> warning: 1 warning emitted

That is already fixed and in mainline: 487f9b3dc6e5 ("rust: cpufreq:
suppress clippy::double_parens in Policy doctest").

Cheers,
Miguel
