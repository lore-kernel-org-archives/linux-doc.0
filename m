Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0B2F6173
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770313227; cv=none; b=gGpXDYDE+utdVdE51H92AMBNJ5UhQ4vfdNcN81nofoqAqZzXjlILD75j3kVoGNL2VOWvCm4CBCeYmDGHKQkPjKG7Gi4lw/BYzeeai/l40JgsGQy4G/CQFuRDVW8OTZqpD6uDbjRHm8B3rDixnh8Q3Dz/8TNMPrd6YCJMGropxEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770313227; c=relaxed/simple;
	bh=izqBODmFAviQ2NKnu7VQeTedhjow1AWYd4vTKWMTCsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKmojk5TVT0pfHrGReMeG3qCLib/QnCx7NpIt3MhJwTE29imeQvuUWi2dX2qZVh0FnWxaLb/vTpFcd8Luwx9UlKCOKYzWTH3rBMihji/B55GSicDCOvMBsw7fDVuv945OBqZV8aw08IiFG8SFTM+sXW2dAbLHZd/sSH1FFenaYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVdPXSiD; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVdPXSiD"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124566b6693so995498c88.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770313226; x=1770918026; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tx7GpESeBXhVOZe1lCiVB4TdYsATVnhqG/m2mu3LDKs=;
        b=YVdPXSiD5eM48ORq1pehYyj0lg3RItKlM0vdy/tFdYNeMh6vFA2nZe5tLI1xb9KVP3
         MyDdCYDjx9MM2cVsOukblr6zZsnktqiMiuU3jROYPzBnZpdD0jvpmHbXezs09fa3Qwen
         vfcEOGKq9lospX/c+pQUj1MIspgUzXokCaHgfMlPuRraJy89gsjLZ2MZrvi/3Lrkwt3b
         ZZi5LW9r2b4M9F3GTphXeaIpYfQgHhsETNL3O5PKh9kLH6k7xfvhn9AdrjkSFreEWq34
         78nW3xfomb7y/0g7BSPE/gDiMIRp/n5Rj+b3h8ldtsKAal84cbYzn1bHEDSgoXhXQLjV
         qLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770313226; x=1770918026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx7GpESeBXhVOZe1lCiVB4TdYsATVnhqG/m2mu3LDKs=;
        b=UegoJrYXEfONJ/QX4njN6NNMREDHdwNxucyR/D+FSdfhi/Ya/cRL9R2/7qbYM4GfIP
         VDOmc/iA+bgZjEw59jUJbuHtkUUGhwIee2zFFTYOCMw5QuFF6oNkukkZAAXNXyUPurEa
         /N0K5yPzNI78QigZg3Nm53RGVQ8S66LrKiBk/mGRIyMztXp3hvCaUtUDwdRz6MuOmG3Y
         Zr3DO2QiMAAzqGz1yMynRbsLAJWc6vPwZxNynj+gUE0ggld0GafASWUZQkGPbJQbUm4P
         CzL3CLdf8xAk3Ko+f9McoIxoWnJLoE8vqs7CMKzoR938SxhVxoHZU8VKqT3Ahr6gtZ22
         J3hA==
X-Forwarded-Encrypted: i=1; AJvYcCUCFfCZdMzbaNtF6+x9lwMb5LZ70iGmKGD3sEOuXaaO4uZIJp7uoC/06MQl/NICvcZFNWXLeoJSlUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxid17cQnNTqdc8By14uJdKrkEkz7j4SxvxYvezThOGEGkCmbWA
	65fMSXEbKWsqtsMpQvCxE+NSnMyrpZSjueus+sJuEuuTc8yi6BzIsYpNNhv2Xw==
X-Gm-Gg: AZuq6aJ/8j6+jO1Q6bDI1lb9A/MlbSipV5dZMMBwafUrvItKWfYFKBkh5vjlo4nK2jx
	KR593jWQqK32Twt6l0IHPBYfVhsBrcEFQJu4UgWBRvVSbKyoHSS6AjU2Hp4WakQpFuKy38zWF5h
	s9ToC9iyNWZbNEFtd1eBoWh5A/oxk/ZgYNhA3psc95adTVHS2qiJI0peIFVqxCgQZBsHte/XL3W
	VyPkAZV8AKae3gS++0793JJwU7scvQjxSVOGWuSfaphW/XpszItzpWTvaVEG4MqE7HadMBuyHy0
	+OOD+9kESz+4oXPShGKLu66bRJ4YS/RXcGtBgWfXNWXpjcckg4gwfao/QMkpsw5npaz8fGbq4Ca
	xIU1bOd0hEGyblXSZi+Ttu4ffkrWFesZl5BUYeyROBi7L9gnQHTbcNqU6oRozX8S0GYpqJjRsdS
	OJASTRIct1qieF1HSrNgNGJSSlIoaJeFMOjZ1a7czYtbrla3JkxP2bO0QT9FyWokXsYIw=
X-Received: by 2002:a17:90b:2f90:b0:352:f2a6:334 with SMTP id 98e67ed59e1d1-35487102a6bmr6730739a91.16.1770306131994;
        Thu, 05 Feb 2026 07:42:11 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933898388sm74985365ad.34.2026.02.05.07.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:42:11 -0800 (PST)
Date: Thu, 5 Feb 2026 21:12:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
 <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>

On Thu, Feb 05, 2026 at 08:21:31PM +0530, Venkat Rao Bagalkote wrote:
>=20
> On 05/02/26 7:22 pm, Link Mauve wrote:
> > On Thu, Feb 05, 2026 at 02:31:25AM +0530, Mukesh Kumar Chaurasiya (IBM)=
 wrote:
> > [=E2=80=A6]
> > > diff --git a/rust/Makefile b/rust/Makefile
> > > index ae22f2c5f0b3..c3961fd0d9a4 100644
> > > --- a/rust/Makefile
> > > +++ b/rust/Makefile
> > > @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
> > >   BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
> > >   BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
> > >   BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> > > -BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > >   BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
> > >   BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> > > +ifdef CONFIG_PPC64
> > > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > > +BINDGEN_TARGET_powerpc	:=3D powerpc64le-linux-gnu
> > > +endif
> > > +else
> > > +BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > > +endif
> > You define BINDGEN_TARGET_powerpc after BINDGEN_TARGET has been set to
> > the value of $(BINDGEN_TARGET_$(SRCARCH)), so it is empty and bindgen
> > then gets passed --target=3D which makes it fail here, with this error
> > message:
> > ```
> > bindgen ../rust/bindings/bindings_helper.h --blocklist-type __kernel_s?=
size_t --blocklist-type __kernel_ptrdiff_t --opaque-type xregs_state --opaq=
ue-type desc_struct --opaque-type arch_lbr_state --opaque-type local_apic -=
-opaque-type alt_instr --opaque-type x86_msi_data --opaque-type x86_msi_add=
r_lo --opaque-type kunit_try_catch --opaque-type spinlock --no-doc-comments=
 --blocklist-function __list_.*_report --blocklist-item ARCH_SLAB_MINALIGN =
--blocklist-item ARCH_KMALLOC_MINALIGN --with-derive-custom-struct .*=3DMay=
beZeroable --with-derive-custom-union .*=3DMaybeZeroable --rust-target 1.68=
 --use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests --n=
o-debug '.*' --enable-function-attribute-detection -o rust/bindings/binding=
s_generated.rs -- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc=
 -I../arch/powerpc/include -I./arch/powerpc/include/generated -I../include =
-I./include -I../arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
ed/uapi -I../include/uapi -I./include/generated/uapi -include ../include/li=
nux/compiler-version.h -include ../include/linux/kconfig.h -include ../incl=
ude/linux/compiler_types.h -D__KERNEL__ -mbig-endian -m32 -I ../arch/powerp=
c -fmacro-prefix-map=3D../=3D -std=3Dgnu11 -fshort-wchar -funsigned-char -f=
no-common -fno-PIE -fno-strict-aliasing -msoft-float -mcpu=3Dpowerpc -mno-p=
refixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -fno-asynchronous-unwind-=
tables -mbig-endian -fno-delete-null-pointer-checks -Os -fno-stack-protecto=
r -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fno-strict-overflow =
-fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplic=
it-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werro=
r=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addres=
s -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes=
 -Wframe-larger-than=3D1280 -Wno-main -Wno-dangling-pointer -Wvla-larger-th=
an=3D1 -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-string=
op-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init=
 -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-=
variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncatio=
n -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initialize=
rs -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno=
-sign-compare -Wno-unused-parameter -DGCC_PLUGINS -I../rust -Irust -DKBUILD=
_MODFILE=3D'"rust/bindings_generated"' -DKBUILD_BASENAME=3D'"bindings_gener=
ated"' -DKBUILD_MODNAME=3D'"bindings_generated"' -D__KBUILD_MODNAME=3Dkmod_=
bindings_generated -w --target=3D -fno-builtin -D__BINDGEN__ -DMODULE  ; se=
d -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const /g' rust/bin=
dings/bindings_generated.rs
> > error: unsupported option '-mbig-endian' for target ''
> > error: unsupported option '-mcpu=3D' for target ''
> > error: unsupported option '-mno-prefixed' for target ''
> > error: unsupported option '-mno-pcrel' for target ''
> > error: unsupported option '-mno-altivec' for target ''
> > error: unsupported option '-mno-vsx' for target ''
> > error: unsupported option '-mno-mma' for target ''
> > error: unsupported option '-mbig-endian' for target ''
> > error: unknown target triple 'unknown'
> > panicked at bindgen/ir/context.rs:562:15:
> > libclang error; possible causes include:
> > - Invalid flag syntax
> > - Unrecognized flags
> > - Invalid flag arguments
> > - File I/O errors
> > - Host vs. target architecture mismatch
> > If you encounter an error missing from this list, please file an issue =
or a PR!
> > ```
> >=20
> > Did this work on PPC64?
>=20
> On ppc64le, I am not able to get a successful Rust=E2=80=91enabled build =
yet.
> I am consistently hitting bindgen/libclang failures during the prepare
> phase.
>=20
>=20
> Build Failures:
>=20
> error: unsupported option '-mlong-double-128' for target 'unknown'
> error: unsupported argument 'medium' to option '-mcmodel=3D' for target
> 'unknown'
> error: unknown target triple 'unknown'
> panicked at bindgen-0.72.1/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch
>=20
> make[2]: *** [rust/Makefile:468: rust/bindings/bindings_generated.rs] Err=
or
> 101
> make[2]: *** Deleting file 'rust/bindings/bindings_generated.rs'
>=20
> make[2]: *** [rust/Makefile:488:
> rust/bindings/bindings_helpers_generated.rs] Error 101
> make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
>=20
> make[2]: *** [rust/Makefile:474: rust/uapi/uapi_generated.rs] Error 101
> make[2]: *** Deleting file 'rust/uapi/uapi_generated.rs'
>=20
> make[2]: *** [rust/Makefile:643: rust/core.o] Error 1
> make[1]: *** [/root/linux/Makefile:1320: prepare] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>=20
>=20
> Regards,
>=20
> Venkat.
>=20
hey,

use rust version nightly-2026-01-28

the latest one has some issue. I just raised a bug for the rustc
here[1].

[1] https://github.com/rust-lang/rust/issues/152177

Regards,
Mukesh

> > > +
> > >   # All warnings are inhibited since GCC builds are very experimental,
> > >   # many GCC warnings are not supported by Clang, they may only appea=
r in
> > >   # some configurations, with new GCC versions, etc.
> > > --=20
> > > 2.52.0
> > >=20
> > With this fixed:
> > Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
> > Tested-by: Link Mauve <linkmauve@linkmauve.fr>
> >=20
