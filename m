Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E083F4DF
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 22:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fc6Wu7Ax"
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BC5B8
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 15:27:04 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9b6559cbd74so258380366b.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697149623; x=1697754423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHyo9fSi27Id6LrPtS/9KH9PdJ59imXr1RZnXM53Toc=;
        b=Fc6Wu7AxnwLnFyy6wpgTW0M8x+YAUjXBLShtkcjTRNYBjS/G2TBOfw+BUwjEG4jwf2
         uuDrECctgZN+L+YfhZ7xxs0+8+bdMTSXSAlsNi1YF5Zy2dVJrhZ+msZJfou8iQiBWDDJ
         tZCacoKvCglAIwtzQ1bZF2Ovjh+vMbZyeE1nUwsZcfXy8Aq92fltbNtlRRl3gduOhXXX
         KcMVzqHMb2FJsf9X7PIk0kj94OnVDPoYgPShWGooftLUHgFxZtm7dgqs/ARCXECeNnAy
         c+vwDU6eS4fP/RMfLV9ed1Oe7lB/KQAsn3Ut80k/gQbeCXtgWSlJuBe+QLJDKqI0av0y
         FyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697149623; x=1697754423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHyo9fSi27Id6LrPtS/9KH9PdJ59imXr1RZnXM53Toc=;
        b=t9JYKH4dqr59sFteZJO8S5Ww3N9pDMRIQgUxuTKDhkjJrsfi2RmRjm+Z3JYvEbGdnz
         dcXQGLdMbpH1ir1T5GpsPqjarkW8J1n4QReBDOam7iQF+2MrXsPLqEHwseqaj5zkEpGe
         gPQChjMP9a5D3Z54aY6PuNgineojPjja3QFu1Xg7tBJvJF2Q0a5zJePexH++HNwD6oum
         khbcHE/+AC2Pc9ixIfY/5apaKuwenole3S28l9pQ3K5x7GGVMvo8/VF8swN89PIB9TXo
         dMaOK0kjBNTL0WUJvtd5Pa1Jzlk/wdMXlidENGu8wAwAkRYvW4rafrAzSHuAh9qVcxv5
         d3tg==
X-Gm-Message-State: AOJu0YwkRGffNtxtsvwHRpJY6/cCkx3YHVbB7y3J2fgW2P2m+dgC03HB
	rb8s4MRldhiTkToD3e6NcZ6CaFi1Ih/s97mYAVkMFg==
X-Google-Smtp-Source: AGHT+IGD1I7+hyhaygsRIBsksA6Z/9zQPJAvNgjGjr1zN+qJjt0GOQkR8nkHht+PI3KDyCs/v0xOZqolHjxki1yoH0A=
X-Received: by 2002:a17:907:760a:b0:9bd:8bf6:887c with SMTP id
 jx10-20020a170907760a00b009bd8bf6887cmr2835890ejc.53.1697149623041; Thu, 12
 Oct 2023 15:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220927131518.30000-1-ojeda@kernel.org> <20220927131518.30000-26-ojeda@kernel.org>
 <Y0BfN1BdVCWssvEu@hirez.programming.kicks-ass.net> <CABCJKuenkHXtbWOLZ0_isGewxd19qkM7OcLeE2NzM6dSkXS4mQ@mail.gmail.com>
 <CANiq72k6s4=0E_AHv7FPsCQhkyxf7c-b+wUtzfjf+Spehe9Fmg@mail.gmail.com>
 <CABCJKuca0fOAs=E6LeHJiT2LOXEoPvLVKztA=u+ARcw=tbT=tw@mail.gmail.com>
 <20231012104741.GN6307@noisy.programming.kicks-ass.net> <CABCJKufEagwJ=TQnmVSK07RDjsPUt=3JGtwnK9ASmFqb7Vx8JQ@mail.gmail.com>
 <202310121130.256F581823@keescook>
In-Reply-To: <202310121130.256F581823@keescook>
From: Ramon de C Valle <rcvalle@google.com>
Date: Thu, 12 Oct 2023 15:26:51 -0700
Message-ID: <CAOcBZOQ=M7zpXTA7Ue1=2436N4=MFgKVRPmTQ1H=b1mUwJEqEQ@mail.gmail.com>
Subject: Re: [PATCH v10 25/27] x86: enable initial Rust support
To: Kees Cook <keescook@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	patches@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	David Gow <davidgow@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 11:31=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Thu, Oct 12, 2023 at 10:50:36AM -0700, Sami Tolvanen wrote:
> > On Thu, Oct 12, 2023 at 3:47=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Fri, Oct 14, 2022 at 11:34:30AM -0700, Sami Tolvanen wrote:
> > > > On Fri, Oct 14, 2022 at 11:05 AM Miguel Ojeda
> > > > <miguel.ojeda.sandonis@gmail.com> wrote:
> > > > >
> > > > > On Tue, Oct 11, 2022 at 1:16 AM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> > > > > >
> > > > > > Rust supports IBT with -Z cf-protection=3Dbranch, but I don't s=
ee this
> > > > > > option being enabled in the kernel yet. Cross-language CFI is g=
oing to
> > > > > > require a lot more work though because the type systems are not=
 quite
> > > > > > compatible:
> > > > > >
> > > > > > https://github.com/rust-lang/rfcs/pull/3296
> > > > >
> > > > > I have pinged Ramon de C Valle as he is the author of the RFC abo=
ve
> > > > > and implementation work too; since a month or so ago he also lead=
s the
> > > > > Exploit Mitigations Project Group in Rust.
> > > >
> > > > Thanks, Miguel. I also talked to Ramon about KCFI earlier this week
> > > > and he expressed interest in helping with rustc support for it. In =
the
> > > > meanwhile, I think we can just add a depends on !CFI_CLANG to avoid
> > > > issues here.
> > >
> > > Having just read up on the thing it looks like the KCFI thing is
> > > resolved.
> > >
> > > I'm not sure I understand most of the objections in that thread throu=
gh
> > > -- enabling CFI *will* break stuff, so what.
> > >
> > > Squashing the integer types seems a workable compromise I suppose. On=
e
> > > thing that's been floated in the past is adding a 'seed' attribute to
> > > some functions in order to distinguish functions of otherwise identic=
al
> > > signature.
> > >
> > > The Rust thing would then also need to support this attribute.
> > >
> > > Are there any concrete plans for this? It would allow, for example,
> > > to differentiate address_space_operations::swap_deactivate() from any
> > > other random function that takes only a file argument, say:
> > > locks_remove_file().
> >
> > I haven't really had time to look into it, so no concrete plans yet.
> > Adding an attribute shouldn't be terribly difficult, but Kees
> > expressed interest in automatic salting as well, which might be a more
> > involved project:
> >
> > https://github.com/ClangBuiltLinux/linux/issues/1736
>
> Automatic would be nice, but having an attribute would let us at least
> start the process manually (or apply salting from static analysis
> output, etc).

An idea would be to add something like the Rust cfi_encoding
attribute[1] and use it with something similar to the Newtype
Pattern[2], but in C[3], for aggregating function pointers that
otherwise would be aggregated in the same group in different groups.

[1]: https://doc.rust-lang.org/nightly/unstable-book/language-features/cfi-=
encoding.html
[2]: https://doc.rust-lang.org/book/ch19-04-advanced-types.html#using-the-n=
ewtype-pattern-for-type-safety-and-abstraction
[3]: Wrapping a type in a struct should achieve something similar even
without using the cfi_encoding attribute since the encoding for
structs is <length><name>, where <name> is <unscoped-name>.
