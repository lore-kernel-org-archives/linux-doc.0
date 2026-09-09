Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24C8372EF3
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968048; cv=none; b=Of+QU/T9pupdXWGduZ2TrWggwJ0hxq13QXKeb3c5LehAELWJvMJSm+bE+n8eJjzghG0qdsK2cBY0Qtv9MNxHJzxnbUHPUDkle8LJ6j6QV+0pELX8vpvQgINLe6GYKNuhLzte7izjqqC0srz1SP1PERHI7wrU1GWcuGatYClK4Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968048; c=relaxed/simple;
	bh=t3yqbvSqtFoLUHow+WwPXXOfeaEh7bClm80fMM9rQTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDIJaIzbFiHeH8k8+ufTNknl255rSzPe/MkQd+3e6cYdbZk+Uzbmi2POxmov2F182X4uwvc4vhhnfpv2vng+AOOsNs1onbVU1FgNoLbdNcH3szJYSquFVN3NqzsWlBcdovnAFpY1RaFBh8z7lfTA/MZ+OcECHHXA0hM6Dl6xq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NEok5sSU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NEok5sSU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2637dd37c1so552426666b.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968045; x=1789572845; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=NEok5sSUYgv6ECps3m60yaYR0yDidKtF+BA2vhrVj3cShj1aESvRGR+4/pvSyjpC8N
         XxRaTX0oil6e1tszK0DPYXOUl49f8NiG8hugX2bZufQJJk0Z4Vhgnk8jp1XXYISDoh07
         WlVAugi25azOmyIDU3yDf+CWE0Huem64OwdWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968045; x=1789572845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=gWc3ukoXF5lRaJIeWRHTB1H14iPVFF0LenATKjgB451h2mFhDkXGdfdQ8F2Sw4CUYr
         5Bik/Ojdawl1VYKKyP4Uv2SxDU8fTwX0KK3S0Zba/DBjsswZ0dYJL+n8P+hF9HN4gGnz
         uWHM/OABrLMG4MwZoZkX/MwO+jqfCtfDSIf2b9La9RhAKHYTsxY0WbhZN+wCsWPJjxCh
         3lXPeDeewnC9h/EainuCKGlfAKVaddTTJRQuPtFCkKljdCfUdJNvLzWuOIY0+UoNxV67
         P9+Lg0yESgUreLHlpcNkfeLugw6p9Yfj+Hq+R1k7pZn+zlQjRX0XCqWLhebNFY6mCAGz
         l76w==
X-Forwarded-Encrypted: i=1; AKwUvBxfocf4WAUDoCp19l6YBpGusc/y1MGcdnbYqUqJxnNqWbOL/wOplOT7FrYwZRGjd9dJxusKlsKoenk=@vger.kernel.org
X-Gm-Message-State: AFuF++l9bM0cdhvi+ZwTsTRVThlZSs8FiTqp0zN8j4QzeZ5+EckuTupi
	Xi/3UNwdOmhgs4v2mRTdyRjtKiWzEMRPvaqJaZ1qpU1QEXm0qo53Ep3V8Adaj8r6CRzGZ8nCVlh
	MUYEPlmzjNg==
X-Gm-Gg: AYBFou2LxJRQeMALLY8lE77dt7mh2wA73tonPre2I+noRyFvZrOHBNIETjfUl1wPnij
	5/NWSLox8FGb/+YXgCUsIjKwfxXA5shiXZFqHG0XGqdu1vcRE7gHa9pvzMEz2qMcDt+9FIaZuVW
	qSVyIZUUtJsShjPWgmKyOOcyAdP2skHReGwxRhWW1PYZEEUNwrB9tWFOHDE6cusP9RxfeJyIy3N
	H6GF7raz0gAjiGYk3gxtHaKjfQk71H41HFJJILMICA67yfqep4fn6Obd6omldzvAx6cscruTVoe
	RoKcDke6jYFW66wWaI/ax/MwHrScF5bPh6ImgMT6waT9hSvpPToxYDSVfUQLluHPgWPWKBZ+smD
	bXmFQlVSKiANBul3daTcs3DaUUI/jvf7BwOfIJEBRsUWBHh6LsrY63N/rxUKzlPX49D8yD/iUqX
	JEbl3QyjQWSiwqLOWstkuAm9CHl1dD6JAYlTiDT+NmvbqwYulsJKCeXH/+r3SqA1Gy1C0zUXe2K
	YzzQJn+4ltU7VkBaUtgRB8YpLReP676eACzxlLqj5GaorxCnkE/G4ZEfx8=
X-Received: by 2002:a17:907:94c7:b0:c25:8fb2:5e24 with SMTP id a640c23a62f3a-c260c99681emr1391101766b.15.1788968044430;
        Wed, 09 Sep 2026 08:34:04 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm819559266b.58.2026.09.09.08.34.04
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:34:04 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so39789745e9.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:34:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByF+uuPo+fh+NOoCLticx4AW/xZY0dsGZ08ERG7vxI8skNd8rHSMTY2dKfgZxvdVQYUHPBPbR1zbzU=@vger.kernel.org
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr1368813666b.37.1788967618809; Wed, 09 Sep 2026
 08:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:26:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
X-Gm-Features: AcwNN1UWYYtk4z7iDc5cI-l9BNT1_XTZBZ1EzZVT-QGEk4RrzSdK76DVFXE4iKE
Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
Subject: Re: [PATCH 11/23] kbuild: implement and use depcheck to check
 dependency timestamps
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 13:57, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Each object's .cmd file lists its header dependencies, which often
> consists of over a thousand dependencies.
>
> When little has changed in the tree, this is what make spends most of its
> time doing, spending over a second, single-threaded when parsing larger
> directory trees.

Side note: from some kernel build profiles I did long ago, I have this
memory of it being made much worse by the fact that we use

    "$(wildcard xyzzy)"

for all our config header files in those .cmd.o files. That then
causes extra work for 'make' for all of this.

And we do that 'wildcard' thing not because we want to actually match
a pattern, but because that was the only way to have 'make' not
complain about missing config headers.

I'm not even sure the original reason for it is relevant any more -
this is all a very dim memory from years and years ago when I actually
tried to look at profiles of 'make' itself (normally when I do kernel
build profiles I only look at the what the kernel part of the build
is, not user mode).

I just tried removing the 'wildcard' generation from
scripts/basic/fixdep.c and the kernel build didn't care about it at
all. The whole 'wildcard' trick goes all the way back to the original
commit that added that whole 'fixdep.c' phase.

Maybe the whole thing is entirely stale now and should be removed. I
probably just didn't trigger the situation where those extra
'wildcard' things matter. That whole thing is from a quarter century
ago, and nobody has dared look at that code since..

Or maybe 'make' is better at those wildcards these days - or other
things have shifted.

From those dim memories, make spent a lot of time doing filesystem
lookups (directory reading  and 'stat()' calls - the wildcard thing
triggered more getdents calls), but even more time just in string
handling.

               Linus
