Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DFB1CB536
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700670; cv=none; b=Ln5DKS77VZouvJgSCWeSqi1qaDp1l/yoMjekPs6hdoLSfmC9/l3aZARtWhn02IfcWPJHqmUeC+ZRuhcAJBDoq6uOFL9L1tmasi3OUisUrmZYg3wy8hG+Xn/1s/oojQJ11kwkiCUePsE75LJnw9rO6MsbVqEYiT6z7ul4hKLz6Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700670; c=relaxed/simple;
	bh=pVwawjEv+bQna+TOyVmWLFrZU2pYiQZj6lUOy1p+DLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZNpRHaFSRRoE+WS/Zvkl2kv2qvJqSU2xemTuXEF8XDgOWl/nwAQdxrT/1NIoq3sMqaVEn/v0sVfI5eKuKjihyAir4qxzM2NqLsFrcImyu169Z+92V1UOjD0fHGCRCqj00s7XUjwmGfKjGii5d7ZTLfSIPANB9jq1pnZwgUJJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kQPEtFQl; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQPEtFQl"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460969c49f2so379331cf.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729700668; x=1730305468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K3v255rwxrb6Xkn/WhIR8L6tyWLq3uTtuFWFOaL4e4=;
        b=kQPEtFQl8SVSZOUnfG5nuxQ4FRWblcF9Li/GR4dlNwmIggc4Spvn2H5hUJ8Qlp2tPE
         a/vYjA6ItZZknrkxTivK6qnM5ehJSw5OmKLkWiNM6KYW151lVRDDjFZ/2woJLJv+x7p2
         idAcUHirNNCEMW8wC5YutkquXsN02K5BPx5SKiI1ukolxSp8yPkOUstmeT4bqckG+5dx
         TKYPFhAeLalIvPJVqEetPLXovB6+hYR/1oxDVd+4A7COaogF2l3uwQ/udLV0y564pSmi
         g2Q/wY8TUuXs5hvJ2ZPFLjIa38T646MDsnmMWPQ0lZWgMQ4uJO767Ms2mtw1mEQh5rPD
         QzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700668; x=1730305468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K3v255rwxrb6Xkn/WhIR8L6tyWLq3uTtuFWFOaL4e4=;
        b=RLQjC0IswuScArceqbYipjJfVVe8HidHKi679mAXVjz6gR8avVh9boDKC/gu8c4owZ
         yGtYG0K/l74h6nwjSs/47XPpMZ4Utjf38MWDgu3RE95io7bArkAKJiBkXhqjKKMOpdrG
         6yz4wZi9cYKyBJtV6Q8ul+qjxfSGAoqjjOIEh7CBIUgp87L5Gi+kJEY+/r73/BINCrgO
         Wfm1rCQPK6v6htsNOOrfHAbxfifQuUPsdMYLUHiMQya0+vSfVA02nF7MmpKUfHlIwNYA
         H/QjuboNpP0vmOkI8ja8+HvYZHugk2Q6RbVpTtXY77v1hwm2EXG4UkWOTOhD3rl+1LXe
         8e6g==
X-Forwarded-Encrypted: i=1; AJvYcCUba8uUk3oMp/vrq5O9B7EU1O7JiK0gd8wFXNkLFtIhdEulMLsMEu2w3o3XhWeQ4i++Gs+9IcMHnjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMthCQ5d2R7yDRm9a2KuMsuocBlhaWHhM4Zy3QxokC0SYjGeZ+
	lMbz6Cch6Crzw8Jg0E4+HByvsNYVJoEPgM0djcGptPcdaXCeFQkwHKw3mth/5YyyFAdap4DPi3H
	317cFhkCovv1peUrAvNRo1XZs5FpDLSsDDuaD
X-Google-Smtp-Source: AGHT+IH2imFVE/wFvhmVSrl3gRKWK7JMCBWJZCpQm7LLKLkfCbOmNxarfGKGqSg3+1hZSos8edhUHSKaLAIboEsXkAs=
X-Received: by 2002:a05:622a:56:b0:460:49fd:6db0 with SMTP id
 d75a77b69052e-4612220c175mr534981cf.29.1729700667272; Wed, 23 Oct 2024
 09:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-6-xur@google.com>
 <CAK7LNAQ0RwJYkCXHj8QMH3sqXgY2LBTiYV8HnKD8oANB8Bb+Yg@mail.gmail.com>
 <CAF1bQ=RuLmO9S1W6ofmgVQZR7pBqR3iN7gCuUO2TkwGQwM76Kw@mail.gmail.com> <CAK7LNASB8WZACuQyQQWvjfODTHTrPrbWBNrP0nsMQkQhDr+Pug@mail.gmail.com>
In-Reply-To: <CAK7LNASB8WZACuQyQQWvjfODTHTrPrbWBNrP0nsMQkQhDr+Pug@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 23 Oct 2024 09:24:15 -0700
Message-ID: <CAF1bQ=Q78Xr-ByjOYVVinCHtqSaMyVfHjHWgvPqN7+j3XTyGuA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] AutoFDO: Enable machine function split
 optimization for AutoFDO
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:50=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Tue, Oct 22, 2024 at 8:28=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > On Sun, Oct 20, 2024 at 8:18=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrot=
e:
> > > >
> > > > Enable the machine function split optimization for AutoFDO in Clang=
.
> > > >
> > > > Machine function split (MFS) is a pass in the Clang compiler that
> > > > splits a function into hot and cold parts. The linker groups all
> > > > cold blocks across functions together. This decreases hot code
> > > > fragmentation and improves iCache and iTLB utilization.
> > > >
> > > > MFS requires a profile so this is enabled only for the AutoFDO buil=
ds.
> > > >
> > > > Co-developed-by: Han Shen <shenhan@google.com>
> > > > Signed-off-by: Han Shen <shenhan@google.com>
> > > > Signed-off-by: Rong Xu <xur@google.com>
> > > > Suggested-by: Sriraman Tallam <tmsriram@google.com>
> > > > Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> > > > ---
> > > >  include/asm-generic/vmlinux.lds.h | 6 ++++++
> > > >  scripts/Makefile.autofdo          | 2 ++
> > > >  2 files changed, 8 insertions(+)
> > > >
> > > > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generi=
c/vmlinux.lds.h
> > > > index ace617d1af9b..20e46c0917db 100644
> > > > --- a/include/asm-generic/vmlinux.lds.h
> > > > +++ b/include/asm-generic/vmlinux.lds.h
> > > > @@ -565,9 +565,14 @@ defined(CONFIG_AUTOFDO_CLANG)
> > > >                 __unlikely_text_start =3D .;                       =
       \
> > > >                 *(.text.unlikely .text.unlikely.*)                 =
     \
> > > >                 __unlikely_text_end =3D .;
> > > > +#define TEXT_SPLIT                                                =
     \
> > > > +               __split_text_start =3D .;                          =
       \
> > > > +               *(.text.split .text.split.[0-9a-zA-Z_]*)           =
     \
> > > > +               __split_text_end =3D .;
> > > >  #else
> > > >  #define TEXT_HOT *(.text.hot .text.hot.*)
> > > >  #define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
> > > > +#define TEXT_SPLIT
> > > >  #endif
> > >
> > >
> > > Why conditional?
> >
> > The condition is to ensure that we don't change the default kernel
> > build by any means.
> > The new code will introduce a few new symbols.
>
>
> Same.
>
> Adding two __split_text_start and __split_text_end markers
> do not affect anything. It just increases the kallsyms table slightly.
>
> You can do it unconditionally.

Got it.

>
>
>
> >
> > >
> > >
> > > Where are __unlikely_text_start and __unlikely_text_end used?
> >
> > These new symbols are currently unreferenced within the kernel source t=
ree.
> > However, they provide a valuable means of identifying hot and cold
> > sections of text,
> > and how large they are. I think they are useful information.
>
>
> Should be explained in the commit description.

Will explain the commit message.

>
>
>
> --
> Best Regards
> Masahiro Yamada
