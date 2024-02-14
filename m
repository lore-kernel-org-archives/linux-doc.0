Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C584FB64A
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 03:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707880469; cv=none; b=KIZDKKvnnEykNGa/O5oJXsLoo46Wc9mEtCf7l2fUWd01ESMqS09uRnM8Pl0P9Q/pTeub+id+kS2qLgUuzXsBhYxs+2L02HVbTUHIQSJTXZaDN0dV2gOHewESrUiikvD4f1e9cHNZqTc1iUMghJOmCgPzrUXaSlaJIgkECmCxJfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707880469; c=relaxed/simple;
	bh=DjlvOe+u+cyrL4JYuO9gr+urwu384Wuuey1WJE8DSes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEnV2Waw0jPG0T7FNI7optzbSo/QNJofGoItUIMaVwGb2R30WVKSoZS4TICSjTm5h6ofxC/HqgUU4jGVgteX9CloZ+RXc7JkdD4PBOlWFxO+vyX82VO2k2PCQXl5fO8kfjRbOwDDwFeC8kghXNJzuhtt0aeDkGJqD9GaSBKZRnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=oTkGF7IN; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="oTkGF7IN"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1344696276.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 19:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707880465; x=1708485265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjlvOe+u+cyrL4JYuO9gr+urwu384Wuuey1WJE8DSes=;
        b=oTkGF7INEwmhImM3Fdzh8IEZN02Nyq8pWl0G/5VdH06v0kRby8N3zJvVIhVaB830lq
         hnL5gSf4HHBuW6b11+vPITS0inE0tjwoZyM/ueSKG4+OiXJu//a0rG10UOH3iV5I9UY7
         chfSdfIRQdm1Sg+dZmEPMDV30y9cKhggyqIQFgtiP5tZx2wjiX7PfC9zhd65Xru0sSLo
         NfINhU/r+MAtnwH2r41Jokc/n9/EcDRaAV7eKpaUcez3RoyhSx9m2GgROzEsCaB69oQl
         +/vGsfeBDo0e4jYLS1EKI/OEP76/U4aqV4rmDfjZiaMXgKxFDN8E4FrnTol+WIgSkTY+
         /eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707880465; x=1708485265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjlvOe+u+cyrL4JYuO9gr+urwu384Wuuey1WJE8DSes=;
        b=pWm+pzsv4IJbleAexT3+3FB2xwyvUGZcCXxz1/OYYyOnR0UEJ9h74SZYGCbtGLEfdd
         2U0iIZpRcj9E4hEzvHT/EIFtNytHZ+lQ+9WY0ldou8ywVGCx3PUvpXbcV02YXwCOXT0W
         cn2Jnzw7mdzEueFjNh2KE/lp08hA6Qxu5wgiunGD3Skj1iA+XQR5xp68vKvCWe42n4Y0
         fwcKmoE8Quu/k5wte9Zu/+GBN2yQ345LetnVAJDRBuYiX7S1jleWoFSbidmkn+Dxktfw
         cvz2WtvUxoO03JH3P4UGaEEnm8utJcuhAlnTVIUU0VT11nGqAbTJvzBLxpqZXvOAH1yG
         Dktw==
X-Forwarded-Encrypted: i=1; AJvYcCVK+FEMYpYMBU8Fxs86vOvy02xAmqXo+sJ1kPZzg7qwOM39YEWLMBC+HXIJ+E/r2kBDg2NRDt7UKBZBQXrZcW8l3qYqOn9D/qIE
X-Gm-Message-State: AOJu0Yy3byOQBYqsDuwDPHovA7w1RnF31zxa43gDivOd6vTBwwxX+Szg
	aUriw8ZD4SncsccfIeg7cBIwWVzx0fckIl/jbf9Y6V8afETobGPWTJtgsMHkmv4jqeQ0y4Yh1NS
	RnzUTeQCklr5bFyW+0OrM6e5wpHm471hYH3MWrw==
X-Google-Smtp-Source: AGHT+IFmvahvMgHVHQaI6LwlEgKPCBhhHem9kf5KUi6p+9U914j80HCS2QMvVYyZLMVtuaXgRDEFCZnR80UsYKJdDNU=
X-Received: by 2002:a25:aacb:0:b0:dcc:35ca:aac4 with SMTP id
 t69-20020a25aacb000000b00dcc35caaac4mr1239282ybi.51.1707880465625; Tue, 13
 Feb 2024 19:14:25 -0800 (PST)
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
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
 <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com> <CAOcBZOQMF9_QqPvTPoRa=uHw11o74-hm=YdjtDCTj-yeq4nwjg@mail.gmail.com>
In-Reply-To: <CAOcBZOQMF9_QqPvTPoRa=uHw11o74-hm=YdjtDCTj-yeq4nwjg@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 13 Feb 2024 22:14:14 -0500
Message-ID: <CALNs47tr4nGhGTahZ9jyv-t4yKAGs-EX_fSZ_jwyT7WoYaB2WA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Ramon de C Valle <rcvalle@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:09=E2=80=AFPM Ramon de C Valle <rcvalle@google.co=
m> wrote:
>
> On Mon, Feb 12, 2024 at 12:36=E2=80=AFPM Sami Tolvanen <samitolvanen@goog=
le.com> wrote:
> >
> > On Mon, Feb 12, 2024 at 11:04=E2=80=AFAM Ramon de C Valle <rcvalle@goog=
le.com> wrote:
> > >
> > > Sorry for the late reply. Sami might be the best person to answer
> > > this, but KCFI (not CFI) tests are lowered by passes that are
> > > architecture specific (see https://reviews.llvm.org/D119296), so we'd
> > > need to add support for RISC-V. There is no additional work required
> > > in the Rust compiler besides enabling it for the new target.
> >
> > LLVM 17 added KCFI support for RISC-V. Sounds like it's just a
> > question of whether rustc uses a new enough version of LLVM then?
>
> rustc is using LLVM 17 since
> https://github.com/rust-lang/rust/pull/114048, so I guess I can enable
> it for RISC-V targets in
> https://github.com/rust-lang/rust/tree/master/compiler/rustc_target/src/s=
pec/targets,
> and the Linux kernel will get it on the next compiler update?

18 as of a few hours ago :) https://github.com/rust-lang/rust/pull/120055

Just for an idea of timing, anything merged this month will be in 1.78
on 2024-05-02.
