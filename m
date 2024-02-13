Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807CC5F540
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707854936; cv=none; b=YvKCJt3dbNdKV0n9kgqeKrMfrAzmfuJwrNdCjyM5knAaeIpYXgputZIMZpxVagm1uJ8UVJIOWOnwn3spzq77r2wjJVtGWhun++X6QHU+RtmTy6X68g88tSP2IKOL1pbDgSkFGvw2zA4jx/REbX0lA2m2ZnOpIMbpQAViqExflRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707854936; c=relaxed/simple;
	bh=cpamOG71/GOjbb277hAjAxNKP85thTjz3Ni8mu6y5O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzcKfZtGZ88bQ2E7+7HfRaVFar8ygiOeS3h4mRXQ2PQH5Cnhse4isRiZPs0cr0BrESZVg+vq+hYTHzeCsnz7y40H67aWiB97yXDuLG7Om8v/G22S0tpTr96YXNT8m8eIDOuBZG1cTsMhY/coMpNDvPBFQ7N5Pbrbg8YUW7xpRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JGzDt1Pv; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JGzDt1Pv"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5116063585aso6091210e87.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 12:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707854931; x=1708459731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpamOG71/GOjbb277hAjAxNKP85thTjz3Ni8mu6y5O0=;
        b=JGzDt1Pvpt72gy+BF4PgUEfDg80yRUrWPLydt9ezvo/f54O6v/s4PyaNdCGTP2T5hb
         OC2eyRkpAIgbYdQ7292bZDYCOgbHk2e5+CO71zUefDHSDyrUnYdTUo7pLXomGh5UtDng
         LGjNP/9ofCPiM/7W2VuNIqHUrkG02s00dA8dGcSRXkIWwawcA0oT/tn9knlqePinCz41
         zu5eLBsUe4jTLIn3XgG/cfVv+czwHcLQm5Znq8t3oDXsbCczdE/DQiB52mjeZGHuHMnT
         D6+brohiYBhNx4qhU71EJuSZIBqsoIE3ScBhq4qx0c7lQKrnDgOqp9cb+7Bdf1NVN7Nu
         uHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707854931; x=1708459731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpamOG71/GOjbb277hAjAxNKP85thTjz3Ni8mu6y5O0=;
        b=LpxhvtC8JHYkUV7q6JSXkxaSuKx7z8fjp55SQe0pif8FHtHQCXgfMhnrJsnhwWk/GE
         KUJKPeLk+ZGSqrgDiSBsm1Mq2nuiYBoEFUeGv+3VSFDUKwML1MGEz7FYAxzw3NXVzk6V
         5T3eTlbeT1sVMhEPzyuZC23AkdADzmeo4LkxIWLmfvJEZNm7dt+BLf8xkAGF1S5I2+8N
         3s8leIYHDjzFWBI6mVmQ1nxBMW49T6zwAYgtMOhE2gkmakdTjRcOMR4qnnf4/v0cbb8g
         d5UOgMqn+tiKh3zS+LIGvbvYvzDvjiOV6q/jpGmoXl9dJ85XYgYSfWlpyqEyE2WtDNSK
         jVUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGoZkeUsCR3+sz2pThReTc6NKEoMZK1KpgYcCxtSCSL1ilUxFVJr1GcMZp3CHPTEmFcAoGzTK/BTz3vrpsK3GGreC1NQ/9m4ae
X-Gm-Message-State: AOJu0YxyEO7jnEBMHzQ9O5rmAu4/2J542SY8GzUMX4jzVO0WBSYRxTaY
	ibPnfANUdDhXOGdtAZjd0BvHJXwHQlo9p6sZwQlfZHt+f8DKFFwOJlCPQzmVjggLdr0XQHf3FGt
	NK+/yXGdOAwKgLFxYSIKQ6hovG5kX4oYWrAOV
X-Google-Smtp-Source: AGHT+IEksRyiaHyX94m2jOEP9ui0B6orCI/t9VG5pKeC7bcLR1MRBQFg7mMD33nHbUDo0Wqb4aI/q/lCjH6E4TshwlQ=
X-Received: by 2002:a19:381e:0:b0:511:9f0d:633f with SMTP id
 f30-20020a19381e000000b005119f0d633fmr342293lfa.14.1707854931315; Tue, 13 Feb
 2024 12:08:51 -0800 (PST)
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
 <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com> <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
In-Reply-To: <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
From: Ramon de C Valle <rcvalle@google.com>
Date: Tue, 13 Feb 2024 12:08:39 -0800
Message-ID: <CAOcBZOQMF9_QqPvTPoRa=uHw11o74-hm=YdjtDCTj-yeq4nwjg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Trevor Gross <tmgross@umich.edu>, Conor Dooley <conor@kernel.org>, 
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

On Mon, Feb 12, 2024 at 12:36=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Mon, Feb 12, 2024 at 11:04=E2=80=AFAM Ramon de C Valle <rcvalle@google=
.com> wrote:
> >
> > Sorry for the late reply. Sami might be the best person to answer
> > this, but KCFI (not CFI) tests are lowered by passes that are
> > architecture specific (see https://reviews.llvm.org/D119296), so we'd
> > need to add support for RISC-V. There is no additional work required
> > in the Rust compiler besides enabling it for the new target.
>
> LLVM 17 added KCFI support for RISC-V. Sounds like it's just a
> question of whether rustc uses a new enough version of LLVM then?

rustc is using LLVM 17 since
https://github.com/rust-lang/rust/pull/114048, so I guess I can enable
it for RISC-V targets in
https://github.com/rust-lang/rust/tree/master/compiler/rustc_target/src/spe=
c/targets,
and the Linux kernel will get it on the next compiler update?
