Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F7156E06E
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966437; cv=none; b=MJ36FdzNJShXeamrAriJK/oJwg49dw0SWZoU0cmIiM36J01awQpEbeKZCXlB5GKyXvzTgSpl5RhZAMTVshiUnn33fXn4GRjhlslwxVnG3q5leBlxuE8yCfKxYOZX/C6QO7t4svwW+LnX8X5qhjMWIbtHVpEJzscVLJYvBh7djuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966437; c=relaxed/simple;
	bh=qF8PC9Ug90yk/PrOmZBC0YqOzOPUdR+ADtjc56MP5mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2ecZAbA0ExsFcncqm8IJnFYI3T6Pr6lhu8puSnP4JdbidQlAQpb1OkKEQaCKneMHPiqp8muBD6z3VgS8gTp/fsr9uFxRuAw39ObZwGkjBsyvamUOFHu0r+odQXtvtGfFwWcrxX4INmS4YtbwNeS4qWrAFOBHNtv7GQUho0yp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KpmO7mT7; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KpmO7mT7"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso56637066b.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788966432; x=1789571232; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=KpmO7mT7VJDLWpvD2BU+LmM/S8fCrVnhhqdMLcmupjBmPcj8OZb1bSEMLTocQ1piNq
         gcqdHR3VNVtchZOhW1v94ffDJ8QsW3LMpVSoawf50j857CoxfNgzSmsjdHDv7gS/WnWe
         UurBJLc4FZY/zcKYdHW5NqWxu1lRUjqHTfKZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966432; x=1789571232;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=PZBpf0ethkiYPtMOdXMz1BsNmxsDMobVWgNHfmhCBXqMLy5cnzol/jUpBmAQrFqu2M
         4SlaPuUWzNrMTZfccpATYb6l+PIeDSS46I12W3Efq15MGTcNT/NTNshcZMGOjhXVOAJo
         4rhXpEdzgwPUfBOghU129PewmcJiIbMFZctINxAgIiMVe10tKM6gA8/PKQf6cRJtm/99
         Lei9xrxqwVWEpmsqkIr/FjITL3XI95Q6NOEM0Tj2OV0uzbhr25zl+oTHVE1KbrpWc9jv
         BpSj2lmlCb7X308duAhT1hjekFDYSSQ+LI4bIotOV993kTtin4hAMglLWzg1z8Xx8Enb
         +4DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBj65wGFXbYPsmgsJ1MuykZTL41Oa+Z0mQoVhtE2jeBygdefQ07DHVPk4YMQE8gEDwTp/4Pqa8+Xc=@vger.kernel.org
X-Gm-Message-State: AFuF++mSXDvGumBoW9lz+Wq+ho0HvzW5QY8DuP50rB0D5B/kzqtGb+8v
	v8zQxFkMc9k5SicbLstgxReNtjTwp+CsAzwkKB0Rhdol2uGLjwosgDzcxVoH/MFu5VrWn1IpzeS
	oV1fh8RnXVsdS
X-Gm-Gg: AYBFou3jN982FS/ANC6EUwh9FH4bm7AWSdNGIwPYvVZQ8tpYiOZghRBTaO46130nxOP
	vr8gG23o3WunmQhBY1EKotDEtH/eDVy5MJZY+2u6ZKWKTsNeOGqAS000ppC9A+eJvD25V5MyoIo
	b3gVHNZ9rGizg7KsvxgFc64aMctQlskYvjkIvaMwwI61c2Fvb4DqjIO7F5e1eeawsCOPQSQ5U/m
	eKMMkp0BDV3xHW5LlHcv14IY8LcORVXBnIucjsMNq7+x6n/QtE2mQPC09Y0+cmgVsCdC35a3MFR
	zTAQ8wwy0NzzrfaOu38r8FNQlIR/OrCHNJzFKNEOBB+hcG3komKRADCbMAUJl1+ActyE/qyoRzW
	fFmxobkUH6dVzPlTCPPkjWa0vNYSbWtmwPuOjDqpOnK4gpyv8XMOydk0pikrBtumdVpgqxSEixV
	06KY9Atl72g8WINRBh2RG6a7uuut5fv+wSV593AOyykxyAPmK+ZwF2ndJ4cb0E3WRDtcUOyD6tv
	bshY/oYJH7++0C8R8OF4hR3ZoN4VI87skhVm6waxLjKW0EdD6DbbV3YZvY=
X-Received: by 2002:a17:907:e8e:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c2941b75db5mr66849166b.38.1788966430291;
        Wed, 09 Sep 2026 08:07:10 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm632919666b.18.2026.09.09.08.07.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:07:09 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so473869a12.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxARaMJhVmLaVNHHLISxrUxdWxmEiRYBIOPZo6k6FKaFwx+Yl1IZp0vKU4m3Kh8cbH3rS36BBbRCSc=@vger.kernel.org
X-Received: by 2002:a17:907:728f:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2941868b12mr66185066b.2.1788966011712; Wed, 09 Sep 2026
 08:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:59:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
X-Gm-Features: AcwNN1XmVo334b1UP-lcj3CPx7zvteJ2HddEJqKkfbem-zQh2qUu9HycJHabLtk
Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
Subject: Re: [PATCH 15/23] modpost: emit module descriptors as assembly
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

On Tue, 8 Sept 2026 at 13:58, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
>
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.

This kind of triggers the same reaction as the kallsyms code: I think
not including <linux/module.h> is probably the biggest win in this
all, and precomputing the offsets of the (few) structures that modpost
uses then makes the whole end result fairly trivial in raw asm.

Fine.

BUT.

You end up with things like this instead:

> diff --git a/scripts/mod/module-offsets.c b/scripts/mod/module-offsets.c

where it generates a header file for those asm scripts so that the asm
generation can do things like

        buf_printf(buf, "\t.size __this_module, %d\n",
MOD_SIZEOF_struct_module);

etc.

But I - again - get the feeling that this is all going through AS as a
silly way to generate an object file, and that there really isn't any
obvious advantage to that side quest.

Becuase no human ever wants to see that asm file, and it's no more
legible than generating the object file directly would have been.

So I get the feeling that it would again be more natural to just
generate the object file directly when all those files really end up
being are a few symbol definitions and a couple of fixed structures
(is there anything but the magic "__this_module" thing and the modinfo
unique ID thing?)

And again - I feel like nobody sane would want to write that code. I
certainly don't. But if this was at least partly automated anyway,
going that extra step might not be all that horrific.

I'll also be honest: part of why I do these suggestions is that I do
think it would be faster to skip the intermediate assembler step, but
a big part of it is that I don't love the random turds our build
creates. Getting rid of the *.mod.c files would be a cleanup of our
strange build.

             Linus
