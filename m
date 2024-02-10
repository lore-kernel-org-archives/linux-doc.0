Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE691A29F
	for <linux-doc@vger.kernel.org>; Sat, 10 Feb 2024 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707552799; cv=none; b=jkVoBGu/vXaiWCYKNozyj6usgnIiLUMPuGZxpprGyOsA36ncGUraNqH9ywfJN+2mSLdhRrQTGirY0xboAwEWaDkl8I5s1ov1jDLjKIKnvOJ0ZFP725VAdTEM0nRHIOWtElufTOdZ2t3pZshjE2S10fikvVDOtz+48dOuKj/F25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707552799; c=relaxed/simple;
	bh=Glo99Q4rZ224bZIULXqWRKYAJ1UBUwAAGaeNDMYK3aY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvwBcdhspgMhSuTMzDeKwwd4Ylbdoite+39IOkU3VUb8PexSBQfR6DPVzj+R+kSIrUQzbg8IN1l5NxVH2SVcH4GxynpGpouY3oifOLOjetSvjn5pk6o3swfkZ5bMpVVGfyHgeKqef0L7y9fmtNltSD1lQ07x9DpS1lTggnPevoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=fcmXXufi; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="fcmXXufi"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d8f31930so1336920276.0
        for <linux-doc@vger.kernel.org>; Sat, 10 Feb 2024 00:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707552797; x=1708157597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Glo99Q4rZ224bZIULXqWRKYAJ1UBUwAAGaeNDMYK3aY=;
        b=fcmXXufiGwJTBnjMxw87JvxkGnPhQdK+m7Ywu2uCCCwlUKInTHch4pKP1abDg54s+q
         sowiXrsCogHCiRjiNwp5MktcZXaWhCl342/Smihu5ZguRpCOWNsq8zz7dyCPse+qVgqY
         rgy82FTEdnK79lpCCCAlJ2C4HisoADhp8oJ9Qe2x6SkQW0SlK2yrAAS7hNAbwz8sEKyH
         qpz4bYXMlkFdXha5+r1LiXMZsXWNrSCkEft8VoDsC9fWYZ0OBs80hCsMKc6pTLxek4mO
         yHEubhJJU2mZAQrhg98b88j8GH+ajhCOOiIX+7qZ97DUTi9wGt7tZo0gA8UfYD4O90ej
         LCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707552797; x=1708157597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Glo99Q4rZ224bZIULXqWRKYAJ1UBUwAAGaeNDMYK3aY=;
        b=kRLToswpMwKRem/GKjyTg6nfOzDMExWS6omOy2cnwL9WgqsWodVFKbgdrehhfZ0E6O
         Hb4hr2Qlqz7eMrji8JKHysCjfVYIYWznkzoQmNHnEGmVhx5TcRKyQ1A0qmpqE82z561u
         z1cjfG9tGrUudn00TAKvNOI7Xqxu9RKeJx09iUsqTXa/+qTfU1ebYveVI1ykdsrQKi4n
         FGbKHWVHan2bQuLGhQ7OAFyMmSOg5E57ru7smaCu/CZ+ykweeQsB5/cjkBLbTicE0tM5
         SdvWvi+X2Gehv9iWKpA305r4NqqkRMT2UpVK5DKNsqKWUmwMyv9kd0TEv36TZ0IokiRz
         05hw==
X-Gm-Message-State: AOJu0YxFmUFTmhvSEuhMuEy6xU1Z23viAPrDCmGH62iKNFD2BKe/YkPc
	LPWJUwz676Q4xGhpSTxBdJxLxIcy4N4op/4zB5qLXWl3Cau7VmOQYj+K5+YnRVR/AaTVUxrKcjk
	NYeHjIcOjvzw6hx+w3tNj1OopGWktQ6J23GuX1A==
X-Google-Smtp-Source: AGHT+IF4tUvf6ttwQdM3xfeC1VlLijJBFO5NkKyzXeExzVFNvP7Fl5D8PP7Tfno5g/OaAlhCpe9aPfGgUUtsjZouSLw=
X-Received: by 2002:a25:7c02:0:b0:dc2:201a:7f1a with SMTP id
 x2-20020a257c02000000b00dc2201a7f1amr2506701ybc.30.1707552796867; Sat, 10 Feb
 2024 00:13:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud>
In-Reply-To: <20240209-rage-keg-1b2982cd17d9@spud>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 10 Feb 2024 02:13:06 -0600
Message-ID: <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 9:18=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Sat, Jan 27, 2024 at 02:46:38PM +0100, Miguel Ojeda wrote:
> > On Fri, Jan 26, 2024 at 11:01=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > Is that even needed? We already have ARCH_SUPPORTS_CFI_CLANG and AFAI=
U
> > > rust supports it if clang does, so a second option is superfluous?
> >
> > From a quick look, I don't see it enabled in any RISC-V built-in
> > target in `rustc` yet.
> >
> > It may also still be the case that KCFI needs some tweaks for, say,
> > RISC-V, before the flag actually works, i.e. we couldn't just test the
> > flag in that case -- Ramon: how likely is it that RISC-V would work if
> > KCFI works for aarch64 and x86_64?
>
> Well, there's been no reply here. I'll do sa you suggested and add a
> depends on !CFI_CLANG to RUST.
>
> Cheers,
> Conor.
>

I asked on Zulip and it sounds like Ramon may be out [1]. It
_probably_ works, but going with a dependency to not be blocked on
KCFI is probably reasonable for now.

- Trevor

[1]: https://rust-lang.zulipchat.com/#narrow/stream/343119-project-exploit-=
mitigations/topic/KCFI.20on.20RISC-V.20questions
