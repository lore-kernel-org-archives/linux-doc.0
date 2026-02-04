Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6392367B5
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770231833; cv=none; b=q0at7mFCIqsdxbI5YeQwZkvVv5IjuMbkrVHXOyylW87JO9dqd8NNNflmusrqK4rj7JYPeLcJnmA/M3Jtw0LHSbEP/BY0JIRMSkiIbCLyBTotDygLyk3o8GxUHC2nVnpdLSktOfwJ7sa2tpBTY3/OrQAB+anNj/GAAegtCwebIeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770231833; c=relaxed/simple;
	bh=9vSWloqcRXaxL3gvmit7soCRVhcCNrs5LQ17VXzVgV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YV14DJN5FjSvG/wqf7FT4Fem7EO/BXvShfm+1erX8N9E2elnAHTJL5K4ksUS/rcn1ve5TM0L3cgnoKPCmMtZEUL75FCjBAcL4UzR3Dauot2kiEJj3FOTqBMfT3Pe4sB6brWqw6uqJsRrh6p2LvMMATNA5DibPMUxdc1Ww1urWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJeDJLfM; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJeDJLfM"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8887ac841e2so231866d6.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 11:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770231831; x=1770836631; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
        b=AJeDJLfMEoii7agAD0KN/CEu+5882HEgS5/wT7Vp8WDW3+MDkayATokiIpi8hfVhsV
         ykSv19VQ5qjTQl5V7I+Udjhm2k8ODspAz8Aco0NrSbBrvtuQJI8xuXvbeVCEpeUaezKN
         G2Jxzw1GwQ5/7HOLfHYI40+xjXSqBI5OtsEydyjYPwNHZmnK1MCK3vFOEn11+WWfJSFk
         BcnrqmceR1fuIyJXVhsul6WxfHluYeNdQJw+uH64CRdewceAPUMjUWQizbuzKIDGyKfC
         od0dJJYxyUKeUU0oU3kZqjbmcP6jdeYiL67H98DLGp82uDBIUCo76GxsRAxO/Vycu2lY
         FBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770231832; x=1770836632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
        b=J4rW9v/OkPnPWlVy8wyxq8woYCQNcCquEEFA8rCQ2qD5mysmPYr6AAfMMtC9VGVQUT
         zlMw5oFqgVEYsxY507//7/W2CbrERtX+XWm09/yBWz79wEHsIN1PLIOoF10bAhubmfYo
         DJEwKqDgJQ1w+j7dhsXi4XhROHiiYq8GdTKphWZ4Z3NNK+PunoWFHNeNlYThvrM7FU2O
         cmOCK7UQhY8xMaW+cEQYD1KVtQ0eJPbpPx/CCc33neqNUr1bPMoyB8z2pj6QAXdmM7SD
         zR2SgMio4KzsH86/ypMp+i/gjoQeiqe8NCWmvzna4724HosOu9GTNXPVpfy5W3dRnYk3
         deXw==
X-Forwarded-Encrypted: i=1; AJvYcCWqHAKDtk8fMlP0CjPox7IyZ7xORG4qs1kCsFjH64WkHuvIXa+mXoulch1iARLXrXTPvBKy24FRPz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hoaITxg44uZVpLji1Ep0TXb4x+TzX+uPvXGcf8JJ0bjGpbZj
	S1jUunFkySPU3rVa4pWG4LJNKMj701ubxAz96kXVDFrPWFp6Y4jN2HklFXo2eA==
X-Gm-Gg: AZuq6aKjgVviIcrwhfQmyAHDbPYLLZcXABhAQg8aSfbtUrs5138xQdwzL3is86RS2IX
	ABN51xBx+5eBOaTDJ0/7AgCnY5yE4KhE5bi57CdAw0yCYS8X54cosM1ttieVYmkzmRx9nZ1lFgw
	sXv834IUUu2sO3ZYRYuZR9ncVTNzYRvVmK+j3cfXqXQP59GrQNRPwJRq6+tClnSe7CgWZOozJ3l
	6ldtkD4PLlOnRDY60/NP9Yc0q4G5BVd0EcJ+c9Qx7WUYYmexelsnwlDcwQsLy327Hrp6B5yJdVN
	uC8jIsdWDkcugc9ST2THL2zvUcaoFiLt4UnZc8tgFYS3WnOGQa9re1dHMkODFrWqSE/YOFTeceC
	RoAz15UqSuqljTQj4HpTa4knewgBTICOn6jVTpZXdm6WCEN3Wd/WWjxZe6VbC+nJF36ahuntZNt
	n06GceZvAG1GbBnTgZSEkxdFWQAIzIc+jresBmJRSs3xEMidHFKJIGKcvJL1s=
X-Received: by 2002:a17:903:3d46:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a933cdd064mr26781485ad.1.1770226421229;
        Wed, 04 Feb 2026 09:33:41 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933884954sm26879545ad.28.2026.02.04.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:33:40 -0800 (PST)
Date: Wed, 4 Feb 2026 23:03:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, 
	officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>, 
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] rust: Add PowerPC support
Message-ID: <aYOCWHF4CwzDVPuA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204030507.8203-1-linkmauve@linkmauve.fr>

On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.
> 
> These changes aren’t the only ones required to get the kernel to compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.
> 
Hey Link,
I sent a patch with ppc64le support. 
https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com/

Can i take this patch and put ppc64le support over it and send it out?

Regards,
Mukesh
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> ---
>  Documentation/rust/arch-support.rst   |  1 +
>  arch/powerpc/Kconfig                  |  1 +
>  arch/powerpc/Makefile                 |  2 ++
>  arch/powerpc/include/asm/jump_label.h | 16 ++++++++++------
>  rust/Makefile                         |  4 +++-
>  scripts/generate_rust_target.rs       | 10 ++++++++++
>  6 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6e6a515d0899..70b9e192a7a0 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
>  ``arm``        Maintained        ARMv7 Little Endian only.
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> +``powerpc``    Maintained        32-bit Big Endian only.
>  ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9537a61ebae0..17db23b82e91 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -283,6 +283,7 @@ config PPC
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> +	select HAVE_RUST			if PPC32
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..9fd82c75dcbd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>  
> +KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
> +
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  KBUILD_CPPFLAGS	+= -mlittle-endian
>  KBUILD_LDFLAGS	+= -EL
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..238f0f625a36 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,18 @@
>  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>  #define JUMP_LABEL_NOP_SIZE	4
>  
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:\n\t"					\
> +	"nop # arch_static_branch\n\t"			\
> +	".pushsection __jump_table,  \"aw\"\n\t"	\
> +	".long 1b - ., " label " - .\n\t"		\
> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
> +	 ".popsection \n\t"
> +
>  static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>  {
> -	asm goto("1:\n\t"
> -		 "nop # arch_static_branch\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
>  
>  	return false;
> diff --git a/rust/Makefile b/rust/Makefile
> index 5c0155b83454..377e6fd68524 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
> -	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
> +	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
> +	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
>  
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 38b3416bb979..0054880ba0ea 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -188,6 +188,16 @@ fn main() {
>          panic!("arm uses the builtin rustc target");
>      } else if cfg.has("ARM64") {
>          panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
> +    } else if cfg.has("PPC32") {
> +        ts.push("arch", "powerpc");
> +        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
> +        ts.push("features", "+soft-float");
> +        ts.push("llvm-target", "powerpc-unknown-eabi");
> +        if cfg.rustc_version_atleast(1, 91, 0) {
> +            ts.push("target-pointer-width", 32);
> +        } else {
> +            ts.push("target-pointer-width", "32");
> +        }
>      } else if cfg.has("RISCV") {
>          if cfg.has("64BIT") {
>              panic!("64-bit RISC-V uses the builtin rustc riscv64-unknown-none-elf target");
> -- 
> 2.52.0
> 
