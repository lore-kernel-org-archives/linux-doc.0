Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628F55C327
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958770; cv=pass; b=P8G26Qs69GvqxoCAeDVSMA+v5tpWEjPxsELzXllw97uwfMtnCLDXbmEIF75lL+1B8zvjyjA73qsqRPqi/HboPFwmbkM9VNJ5hVrkRHMcOl7QC+fRaxmYbN4WMQ3Abxl0rNPxFpqoHI7COy4fPLB9MqI6xCHK7VoMTyvFBLM2eeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958770; c=relaxed/simple;
	bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAQcxf2tHvwc+2OE1sCJNZiXsKm68AgNjefM3FnEEGt8g43LdOwhFKrkxclOr0M9zC5BK7DAwzKZJPqZNh7WlCxwELdIeJWOBx5edMJB8NSzJL75UN3CsLRDBsQhaXaECo2ZM4nC0Jt1EmGS0Vb8PTaMdf2a646q6AGpYthQzQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8jdgobp; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8jdgobp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed443so1479785a91.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 05:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788958767; cv=none;
        d=google.com; s=arc-20260327;
        b=sq6Ip2l73m0JCkzapjKpLEVZFCVzMGPvNjZoYYszG8Z0S2VyWDOEkABfdHQqLEzqJB
         gWXpSHUWX41qAIoGoD+rsQWgeZ+r+2Vt+iDSklxFq+Byc5ZPe5wPqHvUVoHAyTzOiaEd
         DKejQJrVw8bk2KApSHnqW4KCB4CKVZm7NFNi0KC5jWqHo0UezKM0YSXdfq8CgSu49pPE
         PGjqzIQrpuUVMpm5muipk6hSRgLhMWv/rLBw/qyQpbINyObQA8nyW08p4PfyP35+sXOU
         liiweN0EW3dU9JpVwy3W4T322mYPMxJajv4DsD7eEb7B+gaRce49Grc9+rrvKElf9Kln
         RoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        fh=lgHFvso0KwRinudcQDU1Jydz1O0O1+HFsyec2snle3Q=;
        b=Mz8Nk6mNqwJZw9W35g4d4CznD1am9A6pwio7gwBTCGlbL7cgL1MExihvXyCV2/E4i+
         E8nM3Vulc2GtPRB5Yk4hC49lko5vAqlFNCYraU8Efad4v14uY9O3BjnauQAGvRX27mKQ
         ehBoDSwK7JqKL8HSufKswNzZgFi8eqjkoAF3zYMkA8lXs5PGd9c5I5ScukNwFRjlUcBq
         mvbbVcTOJR4mT6k2ZkebaiZLE/6uApnr8YtgAfkjXRkuXDM9AT6DHVIb1JhvqP8dJyQe
         EFZsSxV2mLbNI+LAeHkdDz93LF7OfJnV8axlrswsLW+LdbZfbniJO2SGUy2WIXJvhatB
         unUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958767; x=1789563567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        b=b8jdgobpf6iJotPCt++6HS1J65D8oOCUtiAvw7bxOnm30uNVMENIz+xN63rhab1PO0
         6SWPMFrF0x9OzBV7nwBlofsQ5UfThkTqMOmSPh92d3YqDnSXPLgxyDRWyGwrZEIKgLQa
         egJuvXBIulCz1E5U4g1z5I8qK6yWEnim27+7z20Bb8G1gx9a2ePzK8MgZKNGIwPT4GlF
         zNT1HFz/e4tw/lmQQGBBUVDnsB/ao0ANBTLj74hLGxuScKDR3huGLbWQl9+eBdN/gA2S
         Y6P6TaJV9MdyCXmG6zWs09pjhSMycM/SMVSA463TU8mBqC4DxhQtCT9Erw9liO2TDGpJ
         rhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958767; x=1789563567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        b=lnkHSy39tASqWwVyefUsLNR2oKBpGjl6Nflj+NE1xH6YVqLuBBZznwSk1eNqxOHnkg
         SgXedJdc3Aw7IVjP2tQNSzaTP0wV4mqKGi3Ars/xFvIDlsR/aton4hF7Ol+UmvzdS7bf
         Jft0eV8KX0iChevdQq7tydq2TxKqLKSJ2mfW5z16S/QSI3oK3/kdpSu3q6e3/VPXHql3
         Hfc0B/R4KNYnfcUF/zvAvTpNVf4gEFvioVsBqcKnice2hjW5kM3Ow4UbX7g5+3XYrW7L
         N6+5Gi0m2NtvDTqlI1vD/z1eBWE53Qp3A9PQmt3z6731TZfg0hHiM8YGEYTPUxDe7MbM
         6biQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxDR6nO5BBdJom6OqPnoKdU2LbFJHCXGeoVegUGVHkD1072PUme3PMwv0z1AhEOqnS1cWv8FSRWtk=@vger.kernel.org
X-Gm-Message-State: AFuF++mGBwILh1PBfbFO2EAq+Szd0sUoWDgXZrcy+be765JH2SLeUUZ1
	+3TlsMOB6dG1O9HL1yX7WtI8N5w0YzMqo2AHzxQooDEKPcpg7oDUpYI9+0wT7BVQaqV6SBVGvpE
	GbLolc5jDPY6ywq4zLSQ90EQwSXOq8T8=
X-Gm-Gg: AYBFou258PjTe4crpKpSlui/IeUwnETCmFnR3C1TFoXPvqUzcYYYIa24xU6NtOv/AUe
	QnqSdk2fcMF/SFONIx8qGL7JaRSsfTIR2B2J6hPNaGhJDCv5LxgLbTUad9CcOENFF2q16DGmz/D
	ze2KJUKgz29oleAohMoiXg4X3PYlUZCCwDak7fvVZiJWCjVBh5gdODpo3/KKigAUozo2jsddluN
	8b8LTqVCy1cCUut2ACivw8amMpWZXC2GODEp4fcxMif/SAHNOL1KicwmR/h49DV+jmQVAiONQ0I
	NZfhiqTolY5fOgwZsNvda3fZVs9lqoIo8HY0eYdVDbiqsLwywdIcW3OV5y8HIJbvQQlevecDBg7
	jjEbaFGhkjNo7UR2i48RQi1/Si9ivnDiNNIrH1rNELW9CT3MSr+9D/ZuIb4L/lezMlesvtKz2dO
	hBFcJNsSGRVNPvZ35Zo/qctbWBVvKh/52RNp1egkxilqAV1tzlwJY=
X-Received: by 2002:a17:90b:2888:b0:398:cee0:67dc with SMTP id
 98e67ed59e1d1-39b2699849cmr33697284a91.5.1788958766896; Wed, 09 Sep 2026
 05:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org> <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
In-Reply-To: <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 14:59:13 +0200
X-Gm-Features: AcwNN1Vwugoxsn23N3HKo79fRO4c4hCKpdWpUEii2k3VTwCoJF2DILgisLp6T0w
Message-ID: <CANiq72=rUrjFD8dHggtO5g0D5Yu-LjO4s7t=+yoKtteD56KfXw@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: =?UTF-8?B?QmrDtnJuIEJhcm9u?= <bjorn3_gh@protonmail.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:22=E2=80=AFPM Bj=C3=B6rn Baron <bjorn3_gh@protonm=
ail.com> wrote:
>
> There are still several known reproducibility issues for the parallel
> frontend[1] and at least until fairly recently there were also deadlock
> issues and incorrect errors[2], so I would not recommend enabling it with=
out
> an explicit request from the user. Perhaps even only allow it on nightly
> rustc for now, then you don't need to check which of the two spellings of
> the flag is supported.

Thanks a lot for taking a look Bj=C3=B6rn.

If there are still major issues even in nightly, then I would say
let's not add it yet -- some users/CIs are testing with nightly
routinely, so it is probably best to avoid surprises for them. (If
someone wants to test the flag, they can still pass it manually.)

On the other hand, if there are no major issues left and it is just
reproducibility issues, then I guess we could add it to help figure
those issues out and avoid surprises later on.

> By the way, currently backend parallelism is entirely disabled due to the
> usage of --emit obj (which forces -Ccodegen-units=3D1). For -O2/3 builds

Yeah, we even set `-Ccodegen-units=3D1` explicitly at the moment, so we
would need to change that too (and likely make it an option, because
normally end users will want the best results, while developers may
want speed of iteration).

Cheers,
Miguel
