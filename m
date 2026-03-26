Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBF933B6EA
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 22:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774563434; cv=none; b=utMHoflSxrrign2gdxp3GKlqFieanOWuJIGhZtJxgswDllkjGKkMLFLtiRVu0y8F9jVEQzc9u2YJ/O3hX+1L474peWps74x+MDxseGtHg3DgBYmBmVtESzlXvSodJxgotiUbWSdKY3rq82tTzpku1RQu3dtLS7ApAZefgGGHiK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774563434; c=relaxed/simple;
	bh=o0NNJZQmA7YSvMaDXUylaHWHIONgEf1XH+8v6twnySs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pESYTumoApctA5QMUl3W0k0W2xiN2br2x4odW2sKPJqDaSbxwcYY7UCkh5I8/oARGcOWbiq3Z3SeRic7LN+fVngsrx7lH6I/h8dZ/sC3vMNLWF6yIcEhX467z9tkiBlenuv76W5ENKHm7pBhHpk7VvFeFHoO69sRDpEOnXsNA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwEwYcRH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwEwYcRH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35c0e7b751aso1450759a91.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 15:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774563431; x=1775168231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glFjKxjAo1VGzHup/HsXziAyDLKn89fs6Fyq68wQjAU=;
        b=TwEwYcRHfEno7hv7ClbSdVz8CL7Vh1PcVPdnz47ICDchMBeNo43Uqf7+TxuNrGS8+O
         1Kq8sEuUNmdUvcT2cOsToYUyuDJughaexk+BZB1nedpbaICAODDjxDozvLH24IILCa1l
         vw4zXIZDMTWFFQods2NE5NP6ikIbmsC/Utuin3YXm+D+Z3YpSmp+MUzeIpmESKXT2cSO
         FcCwfYodU5BYwJFA19fmQT08rmHO94/bgQOeawEUj/CMIonqMG5PgoLBoUSm3zr4YbKv
         RdO8zphQ87KMUJC7BPKarEYKUjvKzLAzhm4RqyJMBQGFKpZmyrXZDrg7pIwkA6G7IukJ
         zZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774563431; x=1775168231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=glFjKxjAo1VGzHup/HsXziAyDLKn89fs6Fyq68wQjAU=;
        b=XcFpO1uGIJ8dRlqa1XkApHGyMb9Lz29UNGuuD7duPK40/ty4RifgFnbi6KLrGhhYUg
         q2DI6gn/SYkinhaUfRBOMqLXXy6vGobKp8v7QbKAImAMYhAV05f2ZnfFmv9en8o/a9ag
         94cV2reM0mjWnTI4m7BMFKk6cv8XhQkljt1y7Y9+M/lN25V5b33z79kfqtuDYzZ7cyK2
         GdWNvUCoinejfhHN4PqIj9HQ5DKM8c5RfwC24QSKbpmxm/jJXI8QREfKb2Jq9xZhnSBp
         5Nrb9nSPBxdH7a6tY31Po8YoadNGEG6jWHKDkkNP3w/h1CABfp9zoc1BSiTewQDE7/hz
         wJIA==
X-Forwarded-Encrypted: i=1; AJvYcCVQeuzF7BxBenfZ1KWX2Y2W1r+06agIrd+CGxh30547l0i0YZruZ0VJe4nL2QRKYrNGxJXLLMP/x+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+BS1eWpgP57/WFU5QMMfsOLOvEK2gv8y0t+7pWoGPTA42JsbU
	6xklVJlmGX2UbR2Vg+D9i6o+LaTzbCtedjIvIqrpN0vMF+DU2XWWukik
X-Gm-Gg: ATEYQzzPyArF2kwBokv8i7eCYcT6ry/3luD7KkSRrLVUQCbUU6wb+/xFo6ZlVRTavk5
	DoaFiGAIZWCi1OUgfZLAHu6NRRwNnrpSwHBD66Gr9PXQfcvQTCyUHH1y6lO8L1BI1cnxbpHuoiU
	8jKYFxEOt+sp4TYIecQ+NY1vwPgfKxLD23fp2sGPD7VS2iSsR7m/2254UDpL4VutdouTV2xEUDx
	k1oraI7nXi4OEuYZcvXIoF359IKgFHQWNIMgSRk8TIeCVf9DwhM2rmRCIo/In1xgHq1gSmV2zSv
	477MuZ5mfP+aTsl2PquUsyOCkeLcVxnTfZ5SITX2M0I7TWM18LkjR9PTvDvqa21TXHE3y6MeFxc
	lYEukS7nKFSXwltK4wC5OBPRiDrvFHxwHJZAysJNYm0DXNKBtZ39wAGKrzZIazwwreSIrZ7OF9d
	X+CTQSTZ2B8NLETfe463qQNr8HB4H2CRllr6bQC84KCkYh/dzF9suU3INGJO6NM7WBuM++sA==
X-Received: by 2002:a17:90b:5383:b0:35b:e4d5:dc6f with SMTP id 98e67ed59e1d1-35c2fff1691mr193223a91.10.1774563430637;
        Thu, 26 Mar 2026 15:17:10 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d8d47c6sm199900a91.1.2026.03.26.15.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 15:17:09 -0700 (PDT)
Date: Fri, 27 Mar 2026 03:46:58 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, ojeda@kernel.org, 
	aliceryhl@google.com
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, 
	ardb@kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V6 0/3] Rust support for powerpc
Message-ID: <acWugN2jUVK0e314@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <51269463-8538-4149-a3f3-156a5c4d49b4@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51269463-8538-4149-a3f3-156a5c4d49b4@linux.ibm.com>

On Wed, Mar 25, 2026 at 01:59:55PM +0530, Madhavan Srinivasan wrote:
> 
> On 2/10/26 2:30 PM, Mukesh Kumar Chaurasiya (IBM) wrote:
> > Enable experimental rust support for ppc64le and ppc32be. The patch for
> > ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> > merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> > `rust: Add PowerPC support` and the discussion for that is done here[1].
> > 
> > This has been tested on powernv9 hardware and power10 pseries qemu. I
> > I request Link to test the ppc32 part as i don't have a hardware to test
> > it out.
> > 
> > [1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
> > [2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com
> 
> Could see these build issues with the Rust patchset in the compilation of
> powerpc-next-test
> This happens when compilation happens only with few threads
> 
> # rustc --version
> rustc 1.94.0 (4a4ef493e 2026-03-02)
> 
> ....
>   EXPORTS rust/exports_core_generated.h
>   BINDGEN rust/bindings/bindings_generated.rs
>   BINDGEN rust/bindings/bindings_helpers_generated.rs
>   CC      rust/helpers/helpers.o
>   EXPORTS rust/exports_helpers_generated.h
>   RUSTC L rust/compiler_builtins.o
>   RUSTC L rust/ffi.o
>   RUSTC PL rust/libproc_macro2.rlib
> error[E0464]: multiple candidates for `rmeta` dependency `core` found
>  --> rust/proc-macro2/marker.rs:4:5
>   |
> 4 | use core::marker::PhantomData;
>   |     ^^^^
>   |
>   = note: candidate #1: /root/.rustup/toolchains/nightly-powerpc64le-unknown-linux-gnu/lib/rustlib/powerpc64le-unknown-linux-gnu/lib/libcore-951759db375eea0c.rmeta
>   = note: candidate #2: ./rust/libcore.rmeta
> 
> error[E0119]: conflicting implementations of trait `PartialEq` for type
> `fallback::Ident`
>    --> rust/proc-macro2/fallback.rs:875:1
>     |
> 869 |   impl PartialEq for Ident {
>     |   ------------------------ first implementation here
> ...
> 875 | / impl<T> PartialEq<T> for Ident
> 876 | | where
> 877 | |     T: ?Sized + AsRef<str>,
>     | |___________________________^ conflicting implementation for
> `fallback::Ident`
> 
> error[E0277]: `LexError` doesn't implement `std::fmt::Display`
>    --> rust/proc-macro2/lib.rs:347:16
>     |
> 347 | impl Error for LexError {}
>     |                ^^^^^^^^ unsatisfied trait bound
>     |
> help: the trait `std::fmt::Display` is not implemented for `LexError`
>    --> rust/proc-macro2/lib.rs:204:1
>     |
> 204 | pub struct LexError {
>     | ^^^^^^^^^^^^^^^^^^^
> note: required by a bound in `std::error::Error`
>    --> /root/.rustup/toolchains/nightly-powerpc64le-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/error.rs:59:26
>     |
>  59 | pub trait Error: Debug + Display {
>     |                          ^^^^^^^ required by this bound in `Error`
> 
> error[E0277]: `LexError` doesn't implement `Debug`
>    --> rust/proc-macro2/lib.rs:347:16
>     |
> 347 | impl Error for LexError {}
>     |                ^^^^^^^^ unsatisfied trait bound
>     |
> help: the trait `Debug` is not implemented for `LexError`
>    --> rust/proc-macro2/lib.rs:204:1
>     |
> 204 | pub struct LexError {
>     | ^^^^^^^^^^^^^^^^^^^
>     = note: add `#[derive(Debug)]` to `LexError` or manually `impl Debug for
> LexError`
> note: required by a bound in `std::error::Error`
>    --> /root/.rustup/toolchains/nightly-powerpc64le-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/error.rs:59:18
>     |
>  59 | pub trait Error: Debug + Display {
>     |                  ^^^^^ required by this bound in `Error`
> 
> error: aborting due to 4 previous errors
> 
> ......
> But when parallelized with more threads (-j 128) compilation passes with out
> any error
> There is some ordering of libcore is messing up I guess (I could be wrong)
> (I have removed the warning of unstable features messages here for cleaner
> output)
> 
> ....
>   VDSO64SYM include/generated/vdso64-offsets.h
>   RUSTC L rust/core.o
>   BINDGEN rust/bindings/bindings_generated.rs
>   BINDGEN rust/bindings/bindings_helpers_generated.rs
>   CC      rust/helpers/helpers.o
>   RUSTC PL rust/libproc_macro2.rlib
>   BINDGEN rust/uapi/uapi_generated.rs
>   RSCPP     rust/kernel/generated_arch_static_branch_asm.rs
>   RSCPP     rust/kernel/generated_arch_warn_asm.rs
>   RSCPP     rust/kernel/generated_arch_reachable_asm.rs
> clang diag: ./arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning:
> '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
> clang diag: ./arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning:
> '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
> clang diag: ./arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning:
> '_IOC_NONE' macro redefined [-Wmacro-redefined]
> clang diag: ./arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning:
> '_IOC_WRITE' macro redefined [-Wmacro-redefined]
>   EXPORTS rust/exports_helpers_generated.h
>   RUSTC PL rust/libquote.rlib
>   RUSTC PL rust/libsyn.rlib
>   RUSTC P rust/libpin_init_internal.so
>   RUSTC P rust/libmacros.so
>   EXPORTS rust/exports_core_generated.h
>   RUSTC L rust/compiler_builtins.o
>   RUSTC L rust/ffi.o
>   RUSTC L rust/pin_init.o
>   RUSTC L rust/build_error.o
>   RUSTC L rust/bindings.o
>   RUSTC L rust/uapi.o
>   EXPORTS rust/exports_bindings_generated.h
>   RUSTC L rust/kernel.o
>   EXPORTS rust/exports_kernel_generated.h
>   LDS     scripts/module.lds
>   HOSTCC  usr/gen_init_cpio
>   CC      init/main.o
> ....
> 
> Also I see some errors when compiling modules. I am looking at these and any
> help is welcome.
> I will pull out Rust patches for now from powerpc-linux next-test branch and
> once this is
> restored I will add these patches back to branch for the merge.
> 
> Maddy
> 
Aah this happens because core.o is compiled before libproc_macro2.rlib
starts compiling. Once the core.o is compiled it generates the
libcore.rmeta, leading to conflict in two libcore.rmeta available.

I can think of 2 solutions here for this,

1. We can make the libproc_macro2.rlib libquote.rlib libsyn.rlib compile
befor the core.o is compiled OR
2. We can force these to use the toolchain core's metadata and not look
into the kernel's rust directory.

I am still not able to figure out why this is not happening for x86.

What should we do in this case?

Regards,
Mukesh

> > Changelog:
> > V5 -> V6:
> > - Added a missing Tested by from Venkat which got missed since V3
> > - Support is marked as Maintained instead of experimental
> > V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com
> > 
> > V4 -> V5:
> > - Removed a nested ifdef from PPC64 for Little endian toolchain
> > V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com
> > 
> > V3 -> V4:
> > - Co-developed-by header added in patch 1
> > V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com
> > 
> > V2 -> V3:
> > - Splited HAVE_RUST in 2 lines
> > - BINDGEN_TARGET_powerpc initialized before assigning the same to
> >    BINDGEN_TARGET
> > V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com
> > 
> > V1 -> V2:
> > - jump label fix for rust has been moved to a separate patch
> > - PPC32 support has been taken
> > - rust support has been marked experimental
> > - target.json dependency has been removed
> > - HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64
> > 
> > 
> > Link Mauve (1):
> >    rust: Add PowerPC support
> > 
> > Mukesh Kumar Chaurasiya (IBM) (2):
> >    powerpc/jump_label: adjust inline asm to be consistent
> >    powerpc: Enable Rust for ppc64le
> > 
> >   Documentation/rust/arch-support.rst   |  1 +
> >   arch/powerpc/Kconfig                  |  2 ++
> >   arch/powerpc/Makefile                 |  7 +++++++
> >   arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
> >   rust/Makefile                         | 10 +++++++++-
> >   5 files changed, 32 insertions(+), 11 deletions(-)
> > 
