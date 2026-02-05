Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DC043CEF6
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312555; cv=none; b=Qtvy30P/qDA9m2LPd7oVShkPMrYCtMIjP57FVlghWGFafl0kzMh/IBnmXtSKrGNG6wk5rVJu1FbsUq+oI+IhgZ8evAZ4uyzaME1lj14CwWcGzC7fS9+yxYgnsX+T9Nu4Lz1q1irD7hQt1V6uQnE6WbaTb1dT96A3s323I5rgJWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312555; c=relaxed/simple;
	bh=NYMWDUPXh5i9TMfT9ZkR6S3SB3/pBsXfMit+MAuMNRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHC1Htd43Ziu5zkGEkyJTNKXjmsxOu9sfOm4xhPY/B2MfSxF5x+KZTDgEhJhdlbduV/1Uuw44UqICswZvPHf9Bd3nK6/Ubtk/4/QRG1xE1ISpw5mTESTUXfC3nfG2rbCF68V0u1yPY8XtNBWIAeVaSl3HBbw++pBV2UrMwmdlxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRDgzyO6; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRDgzyO6"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d45d37c7a0so361243a34.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 09:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770312553; x=1770917353; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDZJl3VWBMgWhsMDZCRhkLiKo6ualtcqNRxB4YFGLLc=;
        b=jRDgzyO6zrSD2h5gbaGKAI2thoxAE2uOKIcX9uBImGe2ZNP6LOo/Sr2xEf7oFOtl/g
         YANNQVRMvsY+4xcOlPMpg2h0YkgQ0OzQT3FPUsLcMpN84DjCfFkyd4Boor5qnmydGY9o
         wKpHfPrUzcO0108q5hDjNRMG27K3C42QIxGVSXXgQVqvFBOPbTN219vt9Zh1qD3xlCAJ
         lhKFfDdErirGn2z6J2/FYqoaZFoBno1nidWn8CllRKhW626QAsojEMOsZMiMVbSS07j6
         GVI2Kw/a3jpFFDqBC8axuWhNMrPPwPNyyP+vTi8m+LOgtEa4URYaeYWrsbGhWyqnqj4N
         oqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770312553; x=1770917353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDZJl3VWBMgWhsMDZCRhkLiKo6ualtcqNRxB4YFGLLc=;
        b=Mz56tT5APkWk+reipzQz8nuWwvmpvrOl95Te5HujGb7QtxMsqN3jnkFfboMUl4hka4
         gEoa3XU5OIhjRJ8O+uNrA2EchR0zhahhxLXYVzexRjAk3h3LOKugevQgfg9t3jtpRRop
         2m+ea7PVJDqVfB1DKF6C5+zxi7I/IeBSzuGAtRHlLQaDpg9dks78YTgqnHEJ/TpWCKGi
         eCNGtT7mdSFk6VooJvhlgFbwoHRWEk7RsRXE3Vlf2cVL5csqdoC12+6bCMIQ8G0NVq0c
         sktrotOeE6FkcVd1olzgB77rA8QWdaOvShDct1Ea6h/4aHCt6vXzAF6ZASfqYS2d9e3x
         kSww==
X-Forwarded-Encrypted: i=1; AJvYcCVkPMYQJKEH6ntzX6czQHlaby1fI5PzK8hhUlPVT2BxssFtop/EtNyum+cilXCqTW//tyB6fRYVXbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGvMV1MFj7OBRNxolyys2mWI8U46qnp7xy6D4oFad9i0q3guH7
	6+seBYCdxnXJGSLchhSUNhJ6N1QWm7jnKSgSBg4rvBS0iIlL3eZqkArBB3f9og==
X-Gm-Gg: AZuq6aIfGKT9P6uJ0ZEARtGZeWv4gC+k9PARWAlgmbBq53TPdAUMtZJvdnzBTj0azX4
	RTcKZYzSs3n18KWY3kMMpRIHCudaFDbVXAGKDSVeDGcQWQdLggFhj6lyqSbYtgGGsJZ2+BOShoj
	jUBRh7iVTxZC6bKJHB8IJ7HFhW5uFj45poI1hSDFLSF6yTO8PmjXwX2tX4POG9OTb9GUlHnfcVY
	ejw2tPPt7V/lw9GVTzHEThGk4CQb/Bw4SYg6kyTicNm07ZcPtH8iL8MsqvADUZhiKGp43NK6Evc
	+bwSheP+kqO3eNM+1Rbh7Qy2wEKelIllXTqWygjEWCVmJt2kqnDXfBqvaUzWcgqY6/xD7IYBUQ6
	qTMgf03HO3IdNB3fnP7W701gXFI2djlvEUOA5R5WoCF8JRDebdHYJMtDnqLxPijwXS5+6lg+GAl
	Zxv7P1BrVmtjbAudIm99++UAiZ/cUvxF1PUo2oNj7R7yk9a3QZfjEB7or+
X-Received: by 2002:a05:6a00:39aa:b0:81a:d633:db03 with SMTP id d2e1a72fcca58-8241c6734a1mr7102468b3a.59.1770306362810;
        Thu, 05 Feb 2026 07:46:02 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8243c22f991sm733144b3a.48.2026.02.05.07.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:46:02 -0800 (PST)
Date: Thu, 5 Feb 2026 21:15:52 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYS6fdNFVSEqoRY-@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aYSgjPD5KRcNN0j4@luna>

On Thu, Feb 05, 2026 at 02:52:12PM +0100, Link Mauve wrote:
> On Thu, Feb 05, 2026 at 02:31:25AM +0530, Mukesh Kumar Chaurasiya (IBM) w=
rote:
> [=E2=80=A6]
> > diff --git a/rust/Makefile b/rust/Makefile
> > index ae22f2c5f0b3..c3961fd0d9a4 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
> >  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
> >  BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
> >  BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> > -BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> >  BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
> >  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> > =20
> > +ifdef CONFIG_PPC64
> > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +BINDGEN_TARGET_powerpc	:=3D powerpc64le-linux-gnu
> > +endif
> > +else
> > +BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > +endif
>=20
> You define BINDGEN_TARGET_powerpc after BINDGEN_TARGET has been set to
> the value of $(BINDGEN_TARGET_$(SRCARCH)), so it is empty and bindgen
> then gets passed --target=3D which makes it fail here, with this error
> message:
I am able to compile it and boot it on ppc64le qemu pseries and
powernv9 hardware.

I agree this might cause an issue. Will fix this and send out a new
revision.
> ```
> bindgen ../rust/bindings/bindings_helper.h --blocklist-type __kernel_s?si=
ze_t --blocklist-type __kernel_ptrdiff_t --opaque-type xregs_state --opaque=
-type desc_struct --opaque-type arch_lbr_state --opaque-type local_apic --o=
paque-type alt_instr --opaque-type x86_msi_data --opaque-type x86_msi_addr_=
lo --opaque-type kunit_try_catch --opaque-type spinlock --no-doc-comments -=
-blocklist-function __list_.*_report --blocklist-item ARCH_SLAB_MINALIGN --=
blocklist-item ARCH_KMALLOC_MINALIGN --with-derive-custom-struct .*=3DMaybe=
Zeroable --with-derive-custom-union .*=3DMaybeZeroable --rust-target 1.68 -=
-use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests --no-=
debug '.*' --enable-function-attribute-detection -o rust/bindings/bindings_=
generated.rs -- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc -=
I../arch/powerpc/include -I./arch/powerpc/include/generated -I../include -I=
=2E/include -I../arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
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
> error: unsupported option '-mbig-endian' for target ''
> error: unsupported option '-mcpu=3D' for target ''
> error: unsupported option '-mno-prefixed' for target ''
> error: unsupported option '-mno-pcrel' for target ''
> error: unsupported option '-mno-altivec' for target ''
> error: unsupported option '-mno-vsx' for target ''
> error: unsupported option '-mno-mma' for target ''
> error: unsupported option '-mbig-endian' for target ''
> error: unknown target triple 'unknown'
> panicked at bindgen/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch
> If you encounter an error missing from this list, please file an issue or=
 a PR!
> ```
>=20
> Did this work on PPC64?
>=20
ppc64be still has some missing things from the toolchain side. For
ppc64le it does works, atleast on powernv9 hardware and pseries POWER10
qemu.
> > +
> >  # All warnings are inhibited since GCC builds are very experimental,
> >  # many GCC warnings are not supported by Clang, they may only appear in
> >  # some configurations, with new GCC versions, etc.
> > --=20
> > 2.52.0
> >=20
>=20
> With this fixed:
> Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
> Tested-by: Link Mauve <linkmauve@linkmauve.fr>
>=20
Thanks.
Regards,
Mukesh
> --=20
> Link Mauve
