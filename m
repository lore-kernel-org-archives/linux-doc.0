Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62261CB9F0
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736798671; cv=none; b=kmoBEZccTPf6L9VSlETVPKZ+VQz0/1Iuxh/nWompm2yZDewCoH7rFLM4y3+RvizjXcywhr0Mwy9e9Ggunj9na/7bCsDIwuoCvcR4e6eRX5UBpqyxvSYIn+D/1Blq0Bnh7KTyaU26QNlZkcruoBqpYjBteS3ZNqqRgK4D91lakRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736798671; c=relaxed/simple;
	bh=headnAKnIPgzcpaskLaA1PfeshfYjP8pQyA8Rn/VBbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXKFsnzbtxFjfSeo/xMjVj8bwBAkuFZ43+dpTSvMnfC23OFXOJ9l0iQbWS0EUML7M4e6ItRqfdSbpvpGOIsbfsd12r5u/slR52J73a71M2+MqFPGMM1OCNvvCv+tRaVdCr0YoPSBmmk2Wb45Lpdge15GcQyk4aMJ9UMUF4Eettk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZLJuh9AU; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZLJuh9AU"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so1569a12.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 12:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736798668; x=1737403468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHTlphgauUE0MdQoq+J6Kpo0ZGTAu35Dgo6BpbFsY+0=;
        b=ZLJuh9AUooiSThryAsFYfRUi66QySjzA/MB8PQKhyPaLkfFWpYnFk/+xittwDKgSDZ
         sLb4+cRJ8iWGqXBIUHF5r/96qP7+LUOE0N2TXjyftnRy7Yl5IY6/mGnf7ZeeJQkbFxVy
         lV+J58p5ajIuOwDK2qoUXb5CXq8ndoXL8FwGthWUHEepOL8Zcka3OWWTiutbw9nM3Ju4
         OXFqnmuEVeS83pNCY+7E+57/w6QwJTN4sK5w5dM3Ac39oMgeXiWgjAox7grtvXAhbrKw
         Dzk6DD0U43i9B00E3wQDSQjsILObBJnpIGZ5vd1TXCJ/EG3e6Lm0mwaFdE+Ue8Sj3yFO
         DoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736798668; x=1737403468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHTlphgauUE0MdQoq+J6Kpo0ZGTAu35Dgo6BpbFsY+0=;
        b=sPS/UYCHqejHtYDYI9H9sgxDzJNMPi55mdZf4YZiU/FNp1g0Yjt26TO4cNuKS+n79e
         VQPy2t3Io4HOrIR4tqPDwxu7pMSUX4jzZCyov+89y1NXY/BJD4l84m9EK2bnXhwpxBrv
         /vG/EStsJZrrjX/pjCgqX/NRlTM+506xRvRKw7AGLxGai3/SCB7MVYfaTyv3A4cWWRXD
         m05fp29hXh3qOEYsF6cjCrLMj7h34AMyP4WSOUjssneTnSWhfkgZl/TBEAJkXG18quVi
         nFDP2ICf0ZbaDFQKsouT6W0H7FACmFHA+QdKoqu2j4wMWGq8Q+rGPG2HknWv7xTPSoL1
         XU1w==
X-Forwarded-Encrypted: i=1; AJvYcCVw9MK+h8qlik38iX6d8jkOz92WYA7sbh49T5LezV6gyenrRn33mO7zrPf0vfyPUsT+tUjQ7ZXWgEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXbzhM7Yi/9Yx+uDfhPp+UNQDbvc1p2d+CdoVjrW+er51VZI5j
	/BrWud343IzzwtlYUkJn8aLqTPV+YazW9b9PJ24HtCkKoJeXsMOHgyPEbVFgLdynRou/BEqFqAc
	3Pgl/8aGP9ot8nGB734BAgpb0KMxnR3VMhJQb
X-Gm-Gg: ASbGnct/GEjTjXktteRGr0HzJHd324xt3jC3X7DEDxkXgAcTUky7ccTQuuhYYbLCuLw
	6KO0gs4n3o9O67pzQ/bdJf3kJ6j/uuuqLZ8o=
X-Google-Smtp-Source: AGHT+IF0ImtytlLOuNBIguPAjeH7U4hIPd2noWdWrMGEBo3lMmqYucAvmrJESKCyXWngvaXS5pNjrcV4IkidF9a/DB4=
X-Received: by 2002:a50:ccdb:0:b0:5d9:5a5c:f2f9 with SMTP id
 4fb4d7f45d1cf-5d9f6c2c39bmr4420a12.7.1736798667639; Mon, 13 Jan 2025 12:04:27
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
 <20250103-extended-modversions-v13-5-35d87c65ee04@google.com> <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
In-Reply-To: <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 13 Jan 2025 12:03:51 -0800
X-Gm-Features: AbW1kvYivGs5dyWgDAa0jLS9Y99MI1ugBfYsduBbEB5OZ0TEDoer8gpSmAU-ynQ
Message-ID: <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, Jan 10, 2025 at 6:26=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.com=
> wrote:
> >
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Previously, two things stopped Rust from using MODVERSIONS:
> > 1. Rust symbols are occasionally too long to be represented in the
> >    original versions table
> > 2. Rust types cannot be properly hashed by the existing genksyms
> >    approach because:
> >         * Looking up type definitions in Rust is more complex than C
> >         * Type layout is potentially dependent on the compiler in Rust,
> >           not just the source type declaration.
> >
> > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allo=
w
> > it to do so by selecting both features.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  init/Kconfig  |  3 ++-
> >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> >  2 files changed, 34 insertions(+), 3 deletions(-)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401ec=
b6523b5104ad31150 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1959,7 +1959,8 @@ config RUST
> >         bool "Rust support"
> >         depends on HAVE_RUST
> >         depends on RUST_IS_AVAILABLE
> > -       depends on !MODVERSIONS
> > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > +       depends on !MODVERSIONS || GENDWARFKSYMS
> >         depends on !GCC_PLUGIN_RANDSTRUCT
> >         depends on !RANDSTRUCT
> >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > diff --git a/rust/Makefile b/rust/Makefile
> > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff2b=
5f633f50feb7f6006 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: pr=
ivate bindgen_target_extra =3D ;
> >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.=
c FORCE
> >         $(call if_changed_dep,bindgen)
> >
> > +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ &=
& $$3!~/__cfi/ { printf $(2),$(3) }'
> > +
> >  quiet_cmd_exports =3D EXPORTS $@
> >        cmd_exports =3D \
> > -       $(NM) -p --defined-only $< \
> > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_=
SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $=
@
>
> I noticed a nit:
>
> Both of the two callsites of rust_exports pass
> '$$3' to the last parameter instead of hardcoding it.
>
> Is it a flexibility for future extensions?
>
> I cannot think of any other use except for printing
> the third column, i.e. symbol name.

Good catch, the last parameter isn't necessary anymore. It was used in
early versions of the series to also pass symbol addresses to
gendwarfksyms, but that's not needed since we read the symbol table
directly now.

Sami
