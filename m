Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44445568551
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964538; cv=none; b=nt0xjIcxj1qPlCbkrq76vIekvvZEuhom+Janj3Dw3yKPRF2vOgwT428twRuXUp7MombeWnko+GuhC+sSw6HaIOmwRH6hQb6whzJLaKcROYg+UWUskX+0acWkxx2AiEMb/QfJ4EkKai9mvcVzkseMyjK0bmm5GmsGGAr5egP2cWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964538; c=relaxed/simple;
	bh=C8wlVunptoThlz2K9sFX5JRkjNXNpZt+isVUJZEm52E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJcpqNCMUkuuYdpyyW0f8vf2i82m4v4OlW4sRnxCBFGS5bVEiikUAiraNZFn1I9ronDSevmU6LVS0jVf2Xv6qbx+ZcIZmGS3TClkhCIPvhlcV/Ulpb77XMv+QT0iQdVcMS1SUYs5xky/qwQfqQgxjTBTFP12leVv6esv7CSDJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L1xe6jUQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L1xe6jUQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a7f5655823so6084096a12.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 07:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788964534; x=1789569334; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=L1xe6jUQB67l0OFKf28/2YOXA7hezFgrl/LqTkkigFFMPOkCUE1G+ZLMDET1GTt2Bq
         TencobZcK8eZX1nxPDKkbMZZbvQpuDhavB0OVkeyVTdugjDLSU5wfWUi1i+axhRz4Hdq
         LJUCGYBKv0JbbzQ5MdOvu2jbzxZ0rx1US8jO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964534; x=1789569334;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=L9Spb/Num45QhLJ88njhSga+YEBqTldZT8qh8rzqoEBi75k0+8WgJUqvOy3iQyFwqw
         P/a7mXNCS7KYDDs1v6UGs4YH9hLil5mXrDUrko8DFSRQ33jrmxSNBMFLuKTzhjiNqMry
         Y7fK7E63UyITW61ZcgDuvLpb6+WZLEWwP8dpnU4bBOv7gG0BXQof9A+X7XaHSltcREtX
         +XEU5UZbkVeEjv5IzorLVXd12sO7YR17FSZI2cI0gpv1j8fhGvoxkuP1hvVRQGoyISLQ
         BbwNNtvJTg9KkTm1ijyXd/OXyOMS6p90gviCAJ4vsg9N86+t0Mz98Na1iNcudGp1sGvq
         P2UQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo/cqAwSw5MoogN104QCDFXEv/9adN4DFXgk8UrUeatgGlRdqPXFo5GwH1g2AsiTrR/+eGIBM+vKc=@vger.kernel.org
X-Gm-Message-State: AFuF++m60kKLIKnpkBtiuLF/KuZhtdxBKbQXYBdLFUYkscPYckMnFiGT
	Pj/j9X8S+HWosGUSXgqurbjLUv0OUYNliaYlMgeg7pAieTGGZQ/EaVHTMkk725LNdBHwwG8Xm3+
	+C8FQ3Yo=
X-Gm-Gg: AYBFou0Rk+6vmmGXbfnEpJLjRSIW0+VM/4NoSFIYegPEZW1UICpHxH+7yVDiX2hNXIo
	/hwycb3Xxbn7VqtpdgM3GpdxEV+IsTuG2uLgdiXDdBKeiSYBn17ne+XLSR/3t07HEif8vh33fhb
	pSFi5jjsXQK9mG3faVL7ypx75EyIy5L3LQyfxDy5UMmM1iP//SSPRnDbNft4Zj4D3Tmz86GCPqh
	k1dVMo1n3s2IHDQibvjnLUBFx9nldX2yce+rIXCHQvK3mzWyp4EsTDs43gSxrBHrmBoUqEfqFJk
	dy/bcHhc7mwu1JI0pMfDJ569tCu6ylq/8Np/4KUL3KUDOwo5dF23Ixr0/y5AOaxKsWTPHHSw63P
	V0gFXCakf8jG8GQJ9NbZIXDcbQqBnOFInhuWPDPRmPRZ/AUjibbBZ3oJK9Izrc9v5d05pBjN9EQ
	TCHsQLZf3oKJpqZvgd6Vy1ANN0Ve5v95wGKR8jGnTbnfbTgJ3QxkWnToF9k/R5B1mDPw7MOWE4r
	vVflU38USOYlKJZHQ9Q6xlLsmvf76xXXM31PPvWiLAGVkMQ
X-Received: by 2002:a05:6402:1f07:b0:6a9:92cb:8b09 with SMTP id 4fb4d7f45d1cf-6a992cb8bbbmr1555306a12.18.1788964534409;
        Wed, 09 Sep 2026 07:35:34 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bf3032sm6946297a12.24.2026.09.09.07.35.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:35:33 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a68279dd86so7447675a12.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 07:35:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhKqAETSPf5o4Exk35Bh+84A0T32cnrlHwlEC0vY92gG51CAggxbVv5jOdteyxFVswnX11dPRamC8=@vger.kernel.org
X-Received: by 2002:a05:6402:208a:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6a7ee5662fbmr12667373a12.31.1788964533277; Wed, 09 Sep 2026
 07:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:35:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
X-Gm-Features: AcwNN1VOdEagBQA5D63IF5vfBaLV4II6ehpTsThafIib6q5kHaeURBrIxknkBpc
Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
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

I'm finally going through this series, because I do care about build
speed, so I love the concept.

However, I haven't actually applied it and tried it, I'm just reading
the patches.

And this one triggered something:

On Tue, 8 Sept 2026 at 13:56, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> kallsyms generates an assembly file that consists mostly of .byte entries
> containing compressed names, token strings and name-sorted sequence
> numbers.
>
> For an x86-64 build with 158k symbols that is a 37 MiB .S file which takes
> 0.57s to assemble each of the two to three times it is built over a kernel
> build.

It strikes me that this is clearly a bit faster, but it still seems to
be not really fixing the underlying silliness of that code.

Wouldn't it be much better to actually create an object file directly?
Afaik, the *only* think we ever do with that kallsyms-generated file
is to immediately assemble it into an object file, because the actual
asm file is useless to anybody.

And we already require libelf as part of the build, and we already
kind of do things like that with gendwarfksyms.

Don't get my wrong: I think going through an asm file was very much
the right thing originally: not every architecture used ELF in the
first place, and when scripting things like this the current situation
makes 100% sense.

And no sane human wants to deal with this kind of grotty detail and
spend the effort on writing an ELF file writer.

But when there's a LLM that was used to find these things and help fix
them up, and it's something this mechanical and the result really
isn't ever human-readable and never has been, I feel like the obvious
step would be to just ask the little helper bot to switch the whole
kallsyms to using libelf-devel and writing an object file directly.

I don't think anybody has any deep emotional ties to the current
kallsyms code and that horrific step of the kernel build, do they?

               Linus
